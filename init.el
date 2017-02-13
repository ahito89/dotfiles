
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
    (shader-mode company-c-headers company counsel-projectile omnisharp projectile avy flycheck flycheck-clojure iedit evil auto-complete auto-complete-c-headers yasnippet cider goto-last-change undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; start auto-complete with emacs
;;(require 'auto-complete)

;; do default config for auto-complete
;;(require 'auto-complete-config)
;;(ac-config-default)

;; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
(require 'evil)
(evil-mode 1)

;; function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;;(defun my:ac-c-header-init()
;;  (require 'auto-complete-c-headers)
;;  (add-to-list 'ac-sources 'ac-source-c-headers)
;;  (add-to-list 'achead:include-directories '"C:/Program Files (x86)/Windows Kits/10/Include/10.0.10240.0/ucrt")
;;  (add-to-list 'achead:include-directories '"C:/Users/ionut.duma/Documents/Projects/c/glfw/include"))
;;(add-hook 'c-mode-hook 'my:ac-c-header-init)
;; Turn off toolbar
(tool-bar-mode 0)

;; Enable flycheck
(require 'flycheck)
(global-flycheck-mode)
(setq flycheck-gcc-include-path "C:/Users/ionut.duma/Documents/Projects/c/glfw/include")

(require 'cc-mode)
(require 'compile)
(require 'ido)
(ido-mode t)

;; Ivy setup

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "M-f") 'counsel-find-file)
(define-key evil-normal-state-map (kbd "SPC") 'avy-goto-char)

;; Projectile
(counsel-projectile-on)
(global-set-key (kbd "M-p") 'counsel-projectile-find-file)

;; Company-mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-backends 'company-omnisharp)

;; Csharp-mode
(require 'csharp-mode)
(defun my-csharp-mode-hook ()
  (electric-pair-local-mode 1))
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; Omnisharp-modei
(require 'omnisharp)
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path (expand-file-name "C:/Users/ionut.duma/Documents/Projects/omnisharp-roslyn/artifacts/publish/OmniSharp/default/net46/OmniSharp.exe"))
;;(define-key omnisharp-mode-map (kbd "<C-tab>") 'omnisharp-auto-complete)
;;(define-key omnisharp-mode-map "." 'omnisharp-add-dot-and-auto-complete)

;; Setup find-files
;;(define-key global-map "\ef" 'find-file)
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
