#!/bin/sh

log_level=1

git_files="
./system/key.nix
./system/nextcloud.nix
./system/configuration.nix
./system/config-nixops.nix
./system/networking.nix
./system/hardware-configuration.nix"

root() {
   if ! command -v sudo > /dev/null
   then
      doas "$@"
   else
      sudo "$@"
   fi
}

# checks
check_secrets_folder() {
   if [ -d secrets ]; then
      :
   else
      mkdir secrets
   fi
}

# Tasks:

wifi_password() { # task
   check_secrets_folder # create secrets folder if it's not existing 
   load_env "./.env" "install"

      if [ -s secrets/wifi_name ]; then
         wifi_name="$(cat secrets/wifi_name)" # run the command to get host-id locally
      else
         wifi_name=$(dialog --title "Wifi name" --backtitle "Enter the name of your wifi" --inputbox "Enter the name of your wifi" 8 60  2>&1 >/dev/tty)
      fi

      if [ -s secrets/wifi_password ]; then
         wifi_password="$(cat secrets/wifi_password)" # run the command to get host-id locally
      else
         wifi_password=$(dialog --title "Wifi Password" --backtitle "Enter the password for your wifi" --inputbox "Enter the password for your wifi" 8 60  2>&1 >/dev/tty)
      fi
      printf '%s' "$wifi_password" > secrets/wifi_password

      printf '%s' "$wifi_password" > secrets/wifi_password
      m4 -Dwifi_password="$wifi_password" -Dwifi_name="$wifi_name" ./system/networking.nix.template > ./system/networking.nix
}

install() { # task
   # misc/install our last dependency
   choice="$(dialog --clear --backtitle 'Config selection' --title 'Config selection' --menu 'select the config you want to install' 15 40 4 'nixconf' 'The standard config' 'snow' 'Minimal nixconf' 'flash-os' 'patheon DE' 'server' 'server config' 'plan9' 'Full screen drawterm' 2>&1 >/dev/tty )"
   printf 'CONF=%s\nUSER=glenda\n' "$choice" > .env
}

env() { # task
   load_env "./.env" "install"
   printf 'CONF=%s\nUSER=%s' "$CONF" "$USER"
}

build_vm() { # task
   load_env "./.env" "install"
   run_task prepare
   root nixos-rebuild --flake .#$CONF -p $CONF build-vm
}

delete() { # task
   root nix-collect-garbage --delete-older-than 14d
}

auto_snapshot() { # task
   root zfs set com.sun:auto-snapshot=true NIXROOT/home
}

update() { # task
   nix flake update
}

cupdate() { # task
   run_task update
   run_task remove_from_git
   git add flake.lock
   git commit -m "update flake.lock"
}

pupdate() { # task
   git pull
   run_task apply 
}

run_test() { # task
   run_task apply # this run teh add_to_git task so we dont need to run it again
   nix flake check 
}

remove_from_git() { # task
   for git_file in $git_files; do
      git rm --cached "$git_file" > /dev/null
      log "removed $git_file from git" 2
   done
}

add_to_git() { # task
   for git_file in $git_files; do
      #:> "$git_file" # like rm $git_file && touch $git_file
      touch "$git_file"
      git add -f "$git_file"
      log "added $git_file to git" 2
   done
   trap "run_task remove_from_git" EXIT # execute remove from git before exiting the script
}

nextcloud() { # task
   check_secrets_folder # create secrets folder if it's not existing 
   load_env "./.env" "install"
   if [ "$CONF" = "server" ]; then
      if [ -s secrets/nextcloud_password ]; then
         nextcloud_password="$(cat secrets/nextcloud_password)" # run the command to get host-id locally
      else
         nextcloud_password=$(dialog --title "Nextcloud Password" --backtitle "Enter the password for your own nextcloud service" --inputbox "Enter the new password for your own self hosted nextcloud service" 8 60  2>&1 >/dev/tty)
      fi
      printf '%s' "$nextcloud_password" > secrets/nextcloud_password
      m4 -Dnextcloud_password="$(cat secrets/nextcloud_password)" ./system/nextcloud.nix.template > ./system/nextcloud.nix
   else
      printf "{ ... }: {}" > system/nextcloud.nix # touch file if non existent and make empty if existent
   fi
}

get_host_id() { # task
   load_env "./.env" "install"
   cmd="head -c 8 /etc/machine-id" # command to get host-id
   if [ "$CONF" = "server" ]; then
      ip="$(tailscale ip -4 server)" # get servers ip (only working with setup tailscale)
      ssh "$ip" "$cmd" # get host id over ssh (into server)
   else
      $cmd # run the command to get host-id locally
   fi
}

host_id() { # task
   m4 -Dhost_id="$(get_host_id)" ./system/configuration.nix.template > system/configuration.nix
}

cp_hardware() { # task
   load_env "./.env" "install"
   if [ "$CONF" = "server" ]; then
      ip="$(tailscale ip -4 server)" # get servers ip (only working iwth setup tailscale)
      scp "$ip:/etc/nixos/hardware-configuration.nix" system/server/hardware-configuration.nix # using scp(1) to copy the file
   else
      cp /etc/nixos/hardware-configuration.nix system/hardware-configuration.nix
   fi
}

refind() { # task
   root refind-install
}

tailscale() { # task
   load_env "./.env" "install"
   check_secrets_folder
   if [ "$CONF" = "server" ]; then
      if [ -s secrets/server-tailscale-key ]; then
         key=$(cat secrets/server-tailscale-key)
      else
         key=$(dialog --title "Tailscale key" --backtitle "Enter your tailscale key" --inputbox " Enter your tailscale key" 8 60 tskey- 2>&1 >/dev/tty)
      fi
   else
      if [ -s secrets/tailscale-key ]; then
         key="$(cat secrets/tailscale-key)" # run the command to get host-id locally
      else
         key=$(dialog --title "Tailscale key" --backtitle "Enter your tailscale key" --inputbox " Enter your tailscale key" 8 60 tskey- 2>&1 >/dev/tty)
      fi
   fi
   printf '%s\n' "$key" >  secrets/tailscale-key
   m4 -Dtskey_here="$key" ./system/key.nix.template > ./system/key.nix
}

prepare() { # task
   run_task nextcloud
   run_task cp_hardware 
   run_task host_id 
   run_task tailscale 
   run_task add_to_git # add files needed by flake to git
}

apply_user() { # task
   nix build .#homeManagerConfigurations.$USER.activationPackage
   ./result/activate
}

apply() { # task
   load_env "./.env" "install"
   run_task prepare
   log "rebuilding nixos" 2
   root nixos-rebuild --flake ".#$CONF" -p "$CONF" --impure --install-bootloader switch
}
