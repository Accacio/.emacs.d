 ;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Add and enable MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(package-initialize)

(setq frame-title-format "%b")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GROUP: Development -> Extensions -> Ido ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 50
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)

;; (require 'rtags)
;; (require 'subr-x)
;; (cmake-ide-setup)

(ido-mode +1)
(flx-ido-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: flx-ido                                          ;;
;;                                                           ;;
;; GROUP: Development -> Extensions -> Ido                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; smarter fuzzy matching for ido
(flx-ido-mode +1)
;; disable ido faces to see flx highlights
(setq ido-use-faces 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: smex                                             ;;
;;                                                           ;;
;; GROUP: Convenience -> Extensions -> Smex                  ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; package: magit                       ;;
;;                                      ;;
;; GROUP: Programming -> Tools -> Magit ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)
(set-default 'magit-stage-all-confirm nil)
(add-hook 'magit-mode-hook 'magit-load-config-extensions)

;; full screen magit-status
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(global-unset-key (kbd "C-x g"))
(global-set-key (kbd "C-x g h") 'magit-log)
(global-set-key (kbd "C-x g f") 'magit-file-log)
(global-set-key (kbd "C-x g b") 'magit-blame-mode)
(global-set-key (kbd "C-x g m") 'magit-branch-manager)
(global-set-key (kbd "C-x g c") 'magit-branch)
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g r") 'magit-reflog)
(global-set-key (kbd "C-x g t") 'magit-tag)

(setq user-full-name "Rafael Accácio Nogueira")
(setq user-mail-address "raccacio@poli.ufrj.br")


(define-key global-map (kbd "C-c ;") 'iedit-mode)


(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/usr/local/bin/cpplint"))
  (flymake-google-cpplint-load)
  (flymake-cursor-mode 1)
  )

(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: flycheck                       ;;
;;                                         ;;
;; GROUP: Programming -> Tools -> Flycheck ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: yasnippet                 ;;
;;                                    ;;
;; GROUP: Editing -> Yasnippet        ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: undo-tree                  ;;
;;                                     ;;
;; GROUP: Editing -> Undo -> Undo Tree ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'undo-tree)
(global-undo-tree-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package: volatile-highlights          ;;
;;                                       ;;
;; GROUP: Editing -> Volatile Highlights ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'volatile-highlights)
(volatile-highlights-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: nyan-mode                    ;;
;;                                       ;;
;; GROUOP: Environment -> Frames -> Nyan ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; only turn on if a window system is available
;; this prevents error under terminal that does not support X
(nyan-mode t)
(nyan-start-animation)
(nyan-toggle-wavy-trail)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: rainbow-mode              ;;
;;                                    ;;
;; GROUP: Help -> Rainbow             ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; PACKAGE: irony-mode                ;;
;;                                    ;;
;;                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'c-mode-hook 'company-mode)
(add-hook 'objc-mode-hook 'company-mode)

(add-hook 'after-init-hook 'global-company-mode)


(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Windows performance tweaks
;;
(when (boundp 'w32-pipe-read-delay)
  (setq w32-pipe-read-delay 0))
;; Set the buffer size to 64K on Windows (from the original 4K)
(when (boundp 'w32-pipe-buffer-size)
  (setq irony-server-w32-pipe-buffer-size (* 64 1024)))
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

(eval-after-load 'company
  '(add-to-list 'company-backends '(company-irony)))


(company-quickhelp-mode)


(require 'company-irony-c-headers)
;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-irony-c-headers company-irony)))

;;;; Smartparens


(smartparens-global-mode 1)
(show-smartparens-global-mode 1)

;;;; Delete selection mode
(delete-selection-mode 1)

;;; Dired
(eval-after-load "dired" '(progn (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))
(setq dired-dwim-target t) ;copy paste from one buffer to other

;;; Expand region

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;; Avy and ace-window

(require 'avy)
(require 'ace-window)
(global-set-key (kbd "C-:") 'avy-goto-word-0)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "<C-tab>") 'ace-window)
(global-set-key (kbd "<C-iso-lefttab>") 'ace-window)
(global-set-key (kbd "M-g g") 'avy-goto-line)

;;; Multiple-cursors

(require 'multiple-cursors)
(global-set-key (kbd "C-x <down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x <up>") 'mc/mark-previous-like-this)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(blink-cursor-delay 0.0)
 '(blink-cursor-interval 0.5)
 '(company-minimum-prefix-length 1)
 '(cursor-type t)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(doc-view-continuous t)
 '(doc-view-ghostscript-program "mgs" t)
 '(fancy-splash-image nil)
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint")
 '(global-linum-mode t)
 '(global-subword-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "~/")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(initial-scratch-message
   ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with \\[find-file] and enter text in its buffer.
;; \\[eval-print-last-sexp] to evaluate

")
 '(menu-bar-mode t)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (cmake-ide fuzzy multiple-cursors ace-window avy expand-region flymake-cursor flymake-google-cpplint flymake-go iedit company-quickhelp markdown-toc markdown-preview-mode markdown-preview-eww markdown-mode ahk-mode guru-mode neotree impatient-mode company-irony company-irony-c-headers flycheck-irony irony irony-eldoc rainbow-mode nyan-mode flycheck magit ido-ubiquitous flx-ido smartparens smex undo-tree volatile-highlights yasnippet)))
 '(show-smartparens-global-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "sea green")))))

(setq doc-view-ghostscript-program "mgs")
(add-hook 'doc-view-mode-hook 'auto-revert-mode)

;; Shortcuts

(global-set-key [f8] 'neotree-toggle)

(global-set-key (kbd "C-<apps>") 'find-file-at-point)

(global-set-key
 (kbd "C-x t")
 (lambda()(interactive)
   (if ( or (get-buffer "*terminal*") (get-buffer "*eshell*") )
       (rename-uniquely))
   (if (string=  window-system "w32")
       (eshell)
     (term "/bin/bash"))))
(server-start)
(put 'dired-find-alternate-file 'disabled nil)
