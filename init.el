
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     '("elpa" . "http://elpa.org/packages/"))
;; (add-to-list 'package-archives
;; 	     '("melpa-stable" . "http://stable.melpa.org/packages/"))


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
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %(file-line-error) %(extraopts) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %(extraopts) %`%S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil t :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t t :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil t :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil t :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil t :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil t :help "Run makeglossaries to create glossary file")
     ("Index" "makeindex %s" TeX-run-index nil t :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t t :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil t :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")
     ("Index-Coppe" "makeindex -s coppe.ist -o %s.lab %s.abx;  makeindex -s coppe.ist -o %s.los %s.syx" TeX-run-command nil t))))
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("okular" ("okular --unique %o#src:%n%b") ""))))
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
    (yaml-mode fontawesome ensime ag ledger-mode ace-mc sublimity counsel-projectile projectile pdf-tools helm-company atomic-chrome beacon flx-ido smex helm-gtags rainbow-mode irony-eldoc expand-region multiple-cursors neotree cmake-mode fill-column-indicator idle-highlight-mode idle-highligh-mode ox-reveal smartparens company-irony-c-headers company-irony irony irony-mode nyan-mode company flymake-cursor google-c-style flymake-google-cpplint flycheck undo-tree yasnippet yasnippet-snippet yasnippets iedit magit which-key use-package try tabbar org-bullets counsel ace-window))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 89)) (:background "#333333" :foreground "#afafaf"))))
 '(aw-leading-char-face ((t (:inherit ace-jump-face-foreground :height 2.0 :background "sea green" :foreground "#000"))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "aquamarine")))))
