
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

(org-babel-load-file (expand-file-name "~/.emacs.d/Readme.org"))

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
 '(ledger-reports
   (quote
    (("reg" "ledger [[ledger-mode-flags]] -f /home/accacio/.emacs.d/ledger.ledger reg")
     (#("bal" 0 1
	(idx 0))
      "%(binary) -f %(ledger-file) bal")
     (#("payee" 0 1
	(idx 2))
      "%(binary) -f %(ledger-file) reg @%(payee)")
     (#("account" 0 1
	(idx 3))
      "%(binary) -f %(ledger-file) reg %(account)"))))
 '(minimap-dedicated-window t)
 '(minimap-hide-scroll-bar nil)
 '(minimap-mode nil)
 '(minimap-recreate-window nil)
 '(minimap-window-location (quote left))
 '(neo-autorefresh t)
 '(neo-click-changes-root t)
 '(neo-confirm-change-root (quote off-p))
 '(neo-force-change-root t)
 '(neo-smart-open t)
 '(org-hide-leading-stars nil)
 '(package-selected-packages
   (quote
    (ag ledger-mode ace-mc sublimity counsel-projectile projectile pdf-tools helm-company atomic-chrome beacon flx-ido smex helm-gtags rainbow-mode irony-eldoc expand-region multiple-cursors neotree cmake-mode fill-column-indicator idle-highlight-mode idle-highligh-mode ox-reveal smartparens company-irony-c-headers company-irony irony irony-mode nyan-mode company flymake-cursor google-c-style flymake-google-cpplint flycheck undo-tree yasnippet yasnippet-snippet yasnippets iedit magit which-key use-package try tabbar org-bullets counsel ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0 :background "sea green" :foreground "#000")))))
