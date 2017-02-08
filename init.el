
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(load-theme 'wheatgrass t)
(setq package-archives '(("melpa" . "http://melpa.org/packages/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck flycheck-clojure iedit evil auto-complete auto-complete-c-headers yasnippet cider goto-last-change undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; start auto-complete with emacs
(require 'auto-complete)
;; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(require 'evil)
(evil-mode 1)
;; function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"C:/Program Files (x86)/Windows Kits/10/Include/10.0.10240.0/ucrt")
  (add-to-list 'achead:include-directories '"C:/Users/ionut.duma/Documents/Projects/c/glfw/include"))
(add-hook 'c-mode-hook 'my:ac-c-header-init)
;; Turn off toolbar
(tool-bar-mode 0)

;; Enable flycheck
(require 'flycheck)
(global-flycheck-mode)
(add-hook 'c-mode-hook (lambda () (setq flycheck-gcc-include-path (list "C:/Users/ionut.duma/Documents/Projects/c/glfw/include"))))

(require 'cc-mode)
(require 'compile)
(require 'ido)
(ido-mode t)

;; Setup find-files
(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)

(global-set-key (read-kbd-macro "\eb") 'ido-switch-buffer)
(global-set-key (read-kbd-macro "\eB") 'ido-switch-buffer-other-window)

(define-key global-map "\ew" 'other-window)

;; Buffers
(define-key global-map "\er" 'revert-buffer)
(define-key global-map "\ek" 'kill-buffer)
(define-key global-map "\es" 'save-buffer)

;; Clock
(display-time)

;; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)
