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
(("default" . ((user-emacs-directory . "~/.config/rational-emacs"))))
  '';

  ".config/rational-emacs/rational-emacs/config.el" = {
  text = ''
(require 'rational-defaults)    ; Sensible default settings for Emacs
(require 'rational-use-package) ; Configuration for `use-package`
;(require 'rational-updates)     ; Tools to upgrade Rational Emacs
(require 'rational-completion)  ; selection framework based on `vertico`
(require 'rational-ui)          ; Better UI experience (modeline etc.)
;(require 'rational-windows)     ; Window management configuration
(require 'rational-editing)     ; Whitspace trimming, auto parens etc.
(require 'rational-evil)        ; An `evil-mode` configuration
(require 'rational-org)         ; org-appear, clickable hyperlinks etc.
;(require 'rational-project)     ; built-in alternative to projectile
(require 'rational-speedbar)    ; built-in file-tree
;(require 'rational-screencast)  ; show current command and binding in modeline

;; Further settings and customizations follow here...
(rational-package-install-package 'nix-mode)

(rational-package-install-package 'yaml-mode)


(rational-package-install-package 'doom-themes)
(load-theme 'doom-one t)

(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(custom-set-variables
   '(rational-ui-default-font
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
  ".config/rational-emacs/rational-emacs/ed.el".source = ./ed-mode.el;
  ".config/rational-emacs" = {
   source = pkgs.fetchFromGitHub {
     owner = "SystemCrafters";
     repo = "rational-emacs";
     rev = "3c18e6d";
     sha256 = "sha256-YERbThmpD+IRF591glMtE2n0E/IzFoJ+2quZyKK9yx4=";
  };
  recursive = true;
  };
};
}
