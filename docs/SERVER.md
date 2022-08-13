# server

Server is the nixos config I use on my homeserver. It is deployed with nixops or as a flake.

## Services

| Service          | Description                               |
| ---------------- | ----------------------------------------- |
| Jellyfin         | Netflix like Service for movies and shows |
| Minecraft Server | As the name says a minecraft server       |
| Tailscale        | Connects to tailscale automatically       |
| ssh              | Opens a openssh server                    |

## Install

This install guide assumes that you have a nixos server with ssh and tailscale up and running. The name of the server in tailscale should be equal to `server`. You also should create a user named the same as your current user on the machine you're deploying the server form.

Make sure the config is set to server. You can get the current config with the following command

```shell
task env | awk 'NR==1'
```

In this case the command should print `server` to the standard output. you can set  the config to `server` by running:

```shell
./misc/install setconf server
```

You have to add the tailscale `tskey` into the `server-key` file which is located in the root of the repository or skip this step and type it in the dialog input box in the next step. After entering the tailscale `tskey` into the dialog input box the key will automatically be written into the `server-key` file. Once the key is written into the file the dialog input box will not appear again when running `task prepare`. To make the input box appear when running `task prepare` simply delete the server-key file.

Now you have to prepare the config for the server.

```shell
task prepare
```
