(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("603a831e0f2e466480cdc633ba37a0b1ae3c3e9a4e90183833bc4def3421a961" default))
 '(package-selected-packages
   '(rust-mode treemacs-nerd-icons all-the-icons treemacs-magit magit dracula-theme dracular-theme multiple-cursors treemacs which-key yasnippet flycheck)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;-----------------------------------------------------
;;sources for pkgs
;;-----------------------------------------------------
 

;; adding melpa
;; weirdly enought not working but not needed 
(add-to-list 'package-archives
	'("melpa-stable" . "https://stable.melpa.org/packages/") t)

;;-----------------------------------------------------
;;custom settings
;;-----------------------------------------------------

;; better performance for longer files
(global-so-long-mode 1)
;; adding line numbers 
(global-display-line-numbers-mode)

;; to not break hardlinks 
(setq backup-by-copying-when-linked t)
;; if you want to choose a different behaviour this should fix it if the previous one does not work
;; (setq backup-by-copying t) 

;;-----------------------------------------------------
;;custom keyboard shortcuts
;;-----------------------------------------------------

;; keybinds for shrinking and resizing windows 
(global-set-key (kbd "S-<next>") 'shrink-window)
(global-set-key (kbd "S-<prior>") 'enlarge-window)
;; keybinds for moving between windows 
(windmove-default-keybindings)


;;-----------------------------------------------------
;; Theming 
;;-----------------------------------------------------

;; A website for themes 
;; https://emacsthemes.com/
;; if we want to switch between themes we either remove the line down there or we just replace the :config load theme directiv


;; dracular-theme
(use-package dracula-theme
  :ensure t)

;; time-macos
(use-package timu-macos-theme
  :ensure t
  :config
  (load-theme 'timu-macos t))


;;-----------------------------------------------------
;; custom pkgs  and configuration
;;-----------------------------------------------------



;;all the icons
(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

;; to install the font call
;; M-x all-the-icons-install-fonts

;;Rust package and configuration
(use-package rust-mode
  :ensure t)

;; magit
(use-package magit
  :ensure t)


;; yasnippet
(use-package yasnippet
  :ensure t)

(yas-global-mode)
;; flycheck
(use-package flycheck
  :ensure t)


;;which-key
(use-package which-key
  :ensure t)

(which-key-mode)

;; company
(use-package company
  :ensure t)

;; lsp mode
(use-package lsp-mode
  :ensure t)

;; c hooks 
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
;; idk 
(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
;;company hook 
(add-hook 'after-init-hook 'global-company-mode)

;;rust hooks
(add-hook 'rust-mode-hook #'lsp)


;; lsp-treemacs
(use-package lsp-treemacs
  :ensure t
  :after treemacs)


;; helm-lsp
(use-package helm-lsp
  :ensure t)

;; helm xref
(use-package helm-xref
  :ensure t)
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)


;; pdf-tools https://github.com/vedang/pdf-tools
;(use-package pdf-tools
;;  :ensure t)
;; does not install automatically ? might need to be run manually

;; -------------------------------------------------------

;; treemacs standart configuration
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   t
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
;; treemacs addition things

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;;(use-package treemacs-all-the-icons
;;  :ensure t)
;;
;; load default theme
;;(treemacs-load-theme "Default")
;; 

;;(use-package treemacs-icons-dired
;;  :hook (dired-mode . treemacs-icons-dired-enable-once)
;;  :ensure t)

;; git stuff for side 
(setq-default dotspacemacs-configuration-layers '(
  (treemacs :variables treemacs-use-git-mode 'deferred)))

;; file watch for the treemacs
(setq-default dotspacemacs-configuration-layers '(
  (treemacs :variables treemacs-use-filewatch-mode t)))


;; follow mode
(setq-default dotspacemacs-configuration-layers '(
  (treemacs :variables treemacs-use-follow-mode 'tag)))



;; -------------------------------------------------------
;; multible coursers 
(use-package multiple-cursors
  :ensure t)
(require 'multiple-cursors)
;; all of the keymaps
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;for latex things 
;; https://www.gnu.org/software/auctex/manual/auctex/Quick-Start.html#Quick-Start
(use-package auctex
  :ensure t)

;; some configuration for this
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil) ;; to ask for a masterfile for each Tex file


;; things for R 
(use-package ess
	:ensure t)
(setq ess-use-company 'script-only)
