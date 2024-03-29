
;;;; Foxit Reader
;;;; sudo apt install ttf-wqy-zenhei

;; M-x package-refresh-contents
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(package-initialize)

;; Haskell
;; Linux Terminal :
;; curl -sSL https://get.haskellstack.org/ | sh
;; stack setup
;; stack install Cabal
;; sudo apt install ghc
;; emacs:
;; M-x package-install RET haskell-mode
;; M-x package-install RET intero
;; M-x interactive-haskell-mode RET

;;company
(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (setq company-idle-delay 0)
  (setq company-show-numbers t)
  (setq company-minimum-prefix-length 3)
  (setq company-backends
        '((company-files
           company-keywords
           company-capf
           company-yasnippet)
;	   company-lsp)
          (company-abbrev company-dabbrev))))

;; sudo apt install llvm-tools
;(use-package lsp-mode
;  :init
;  (setq lsp-clients-clangd-executable "/usr/bin/clangd-7")
;  (setq lsp-enable-snippet nil)
;  :hook ((c++-mode c-mode) . lsp-deferred)
;  :commands (lsp lsp-deferred))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode 1))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; sudo apt install coq
;; M-x package-install RET proof-general
(use-package proof-general
  :ensure t)

;; sudo apt install sbcl
;; sudo apt install slime
;; sudo apt install common-lisp-controller
;; M-x package-install RET slime
;; slime
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
		(concat
		 user-emacs-directory "backup")))))
;; make backups of files, even when they're in version control
(setq vc-make-backup-files t)

;; org mode running source block
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (C . t)
   (python . t)
   (shell . t)
   (latex . t)
   (ditaa . t)))

(setq scroll-step 1)
(setq scroll-conservatively 10000)
(setq auto-window-vscroll nil)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(show-paren-mode 1)
(electric-pair-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(company-tabnine-use-native-json nil)
 '(custom-enabled-themes (quote (tsdh-light)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (intero haskell-snippets scion ghc haskell-mode proof-general company company-c-headers company-tabnine company-lsp lsp-clangd ccls use-package cquery flycheck lsp-ui lsp-mode evil-nerd-commenter htmlize yasnippet slime)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(yas-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "WenQuanYi Zen Hei Mono" :foundry "WenQ" :slant normal :weight normal :height 128 :width normal)))))
