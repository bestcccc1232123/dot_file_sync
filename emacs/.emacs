(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

; for package.el to work
(require 'package)
(package-initialize)

; change to marmalade package repository, which is supposed to be 
; more inclusive
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

; for auctex to work with emacs
(require 'tex-site)

; for ido autocomplete for buffer
(require 'ido)
(ido-mode t)



; ===========================================================
;          C++ programming in emacs
; ===========================================================

; for cc-mode
(require 'cc-mode)

; for correct indent and programming style
(setq-default c-default-style "linux"
      c-basic-offset 4)
; remap the return key 
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)

; 80 column width
(setq-default fill-column 80)


; for auto pair the parathesis
(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

;;; yasnippet and auto complete configuration from "http://truongtx.me/2013/01/06/config-yasnippet-and-autocomplete-on-emacs/"
;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;;; set the trigger key so that it can work together with yasnippet on tab key,
;;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;;; auto complete clang
;(require 'auto-complete-clang)
;(global-set-key (kbd "C-`") 'ac-complete-clang)

; for larger font size
(set-face-attribute 'default nil :height 180)


; ===========================================================
;          latex mode in emacs
; ===========================================================
(require 'column-marker)
(add-hook 'LaTeX-mode-hook (lambda() (interactive) (column-marker-1 80)))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)



; ===========================================================
;          python mode in emacs
; ===========================================================
(require 'column-marker)
(add-hook 'python-mode-hook (lambda() (interactive) (column-marker-1 80)))
; for python jedi used for auto-complete
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)
; for flycheck used for syntex checking in python
(add-hook 'after-init-hook #'global-flycheck-mode)

