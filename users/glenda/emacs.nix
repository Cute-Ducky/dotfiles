{ config, pkgs, ... }:
{
home.file = {
  ".config/emacs" = {
  source = pkgs.fetchFromGitHub {
     owner = "plexus";
     repo = "chemacs2";
     rev = "8683883";
     sha256 = "sha256-XsJ2hHoQGoDbM7J+VvO1u0+f+jJCQqcUqQjzvTlnnG0=";
  };
  recursive = true;
};
  ".emacs-profiles.el".text = ''
(("default" . ((user-emacs-directory . "~/.config/crafted-emacs"))))
  '';

  ".config/crafted-emacs/crafted-emacs/config.el" = {
  text = ''
(require 'crafted-defaults)    ; Sensible default settings for Emacs
(require 'crafted-use-package) ; Configuration for `use-package`
;(require 'crafted-updates)     ; Tools to upgrade Crafted Emacs
(require 'crafted-completion)  ; selection framework based on `vertico`
(require 'crafted-ui)          ; Better UI experience (modeline etc.)
;(require 'crafted-windows)     ; Window management configuration
(require 'crafted-editing)     ; Whitspace trimming, auto parens etc.
(require 'crafted-evil)        ; An `evil-mode` configuration
(require 'crafted-org)         ; org-appear, clickable hyperlinks etc.
;(require 'crafted-project)     ; built-in alternative to projectile
(require 'crafted-speedbar)    ; built-in file-tree
;(require 'crafted-screencast)  ; show current command and binding in modeline

;; Further settings and customizations follow here...
(crafted-package-install-package 'nix-mode)

(crafted-package-install-package 'yaml-mode)


(crafted-package-install-package 'doom-themes)
(load-theme 'doom-one t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(custom-set-variables
   '(crafted-ui-default-font
     '(:font "JetBrains Mono" :weight light :height 200)))
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))
(require 'ed)
'';
  recursive = true;
  };
  ".config/crafted-emacs/crafted-emacs/ed.el".source = ./ed-mode.el;
  ".config/crafted-emacs" = {
   source = pkgs.fetchFromGitHub {
     owner = "SystemCrafters";
     repo = "crafted-emacs";
     rev = "bfaa8ba";
     sha256 = "sha256-VZtelEPvxKzb4X/W7a0+WhGoBpLSsbgnTAJ9tWrd8Y8=";
  };
  recursive = true;
  };
};
}
