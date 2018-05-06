
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/")
	     '("elpa" . "https://elpa.org/packages/"))
(add-to-list 'package-archives
	     '("melpa-stable" . "https://stable.melpa.org/packages/"))


(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-google-cpplint-command
   (if
       (string= window-system "w32")
       (quote "d:/Users/Accacio/AppData/Local/Programs/Python/Python36-32/Scripts/cpplint.exe")
     (quote "/usr/local/bin/cpplint")))
 '(org-hide-leading-stars nil)
 '(package-selected-packages
   (quote
    (counsel-projectile projectile pdf-tools helm-company atomic-chrome beacon flx-ido smex helm-gtags rainbow-mode irony-eldoc expand-region multiple-cursors neotree cmake-mode fill-column-indicator idle-highlight-mode idle-highligh-mode ox-reveal smartparens company-irony-c-headers company-irony irony irony-mode nyan-mode company flymake-cursor google-c-style flymake-google-cpplint flycheck undo-tree yasnippet yasnippet-snippet yasnippets iedit magit which-key use-package try tabbar org-bullets counsel ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0)))))
