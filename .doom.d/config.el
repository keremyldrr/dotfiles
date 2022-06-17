;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/shared/org_files")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(use-package! org-roam
;; :ensure t
:custom
 (org-roam-directory "~/shared/org_files/roam")
 (org-roam-dailies-directory "Journal/")
 (org-roam-dailies-capture-templates
  '(("d" "default" entry "* %?" :target
  (file+head "Tasks/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
   "))

  ("j" "journal" entry "* %?" :target
  (file+head "Journal/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
   "))

  ("m" "meeting" entry "* %?" :target
  (file+head "Meetings/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
   "))

  ("t" "thesis" entry "* %?" :target
  (file+head "Thesis/%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>
   "))
  ))
;; (org-roam-dailies-capture-templates ("d" "default" entry #'org-roam-capture--get-point "* %?" :file-name "Journal/%<%Y-%m-%d>" :target "#+title: %<%Y-%m-%d %a>"))
  ;; (org-roam-dailies-capture-templates
  ;;   '(("d" "default" entry
  ;;      #'org-roam-capture--get-point
  ;;      "* %?"
  ;;      :file-name "Journal/%<%Y-%m-%d>"
  ;;      :target "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n"))
      ;; ("t" "Task" entry
      ;;  #'org-roam-capture--get-point
      ;;  "* TODO %?\n  %U\n  %a\n  %i"
      ;;  :file-name "Journal/%<%Y-%m-%d>"
      ;;  :olp ("Tasks")
      ;;  :empty-lines 1
      ;;  :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
      ;; ("j" "journal" entry
      ;;  #'org-roam-capture--get-point
      ;;  "* %<%I:%M %p> - Journal  :journal:\n\n%?\n\n"
      ;;  :file-name "Journal/%<%Y-%m-%d>"
      ;;  :olp ("Log")
      ;;  :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
      ;; ("l" "log entry" entry
      ;;  #'org-roam-capture--get-point
      ;;  "* %<%I:%M %p> - %?"
      ;;  :file-name "Journal/%<%Y-%m-%d>"
      ;;  :olp ("Log")
      ;;  :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")
      ;; ("m" "meeting" entry
      ;;  #'org-roam-capture--get-point
      ;;  "* %<%I:%M %p> - %^{Meeting Title}  :meetings:\n\n%?\n\n"
      ;;  :file-name "Journal/%<%Y-%m-%d>"
      ;;  :olp ("Log")
      ;;  :head "#+title: %<%Y-%m-%d %a>\n\n[[roam:%<%Y-%B>]]\n\n")))i

 :bind (
        ;; :map org-roam-mode-map
          (
           ;; ("C-c n l"   . org-roam)
           ("C-c n f"   . org-roam-node-find)
           ("C-c n d"   . org-roam-dailies-find-date)
           ("C-c n c"   . org-roam-dailies-capture-today)
           ("C-c n C r" . org-roam-dailies-capture-tomorrow)
           ("C-c n t"   . org-roam-dailies-find-today)
           ("C-c n y"   . org-roam-dailies-find-yesterday)
           ("C-c n r"   . org-roam-dailies-find-tomorrow)
           ("C-c n g"   . org-roam-graph))
         ;; :map org-mode-map
         (("C-c n i" . org-roam-node-insert))
         ;; (("C-c n I" . org-roam-insert-immediate))
         )
:config
  (org-roam-setup)
(org-roam-db-autosync-mode)
)
;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
 ;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(load "/home/kerem/.doom.d/clockify.el")
 (use-package clockify
:init
  (setq clockify-api-key "NDk1NjIyMzYtOTA4ZS00YTU0LWEzMDQtZDMwMmUwOGQzYzc1")
  (setq clockify-workspace "612b592fff6efe46f5554845")
  (setq clockify-user-id "612b592fff6efe46f5554844"))
;; (map! :leader
;;       :desc "Toggle comment"
;;       "/ " #'comment-dwim)
(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(add-hook 'after-init-hook #'global-emojify-mode)

;; (map! "C-c l" #'meow-comment)
;; (map! "C-c r" #'undo-fu-only-redo)


;; (setq meow-use-clipboard t)
