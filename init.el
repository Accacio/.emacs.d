(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(setq frame-title-format "%b")


(require 'ido)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-max-prospects 30
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1)

(ido-mode 1)
(flx-ido-mode 1)

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c M-x") 'smex)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

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

(semantic-mode 1)

(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
  )
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-ede-mode 1)

(ede-cpp-root-project "my project" :file "/mnt/Files/accacio/Git/matcg/matcg.cpp"
		      :include-path '("/../include"))

(global-semantic-idle-scheduler-mode 1)

(require 'undo-tree)
(global-undo-tree-mode)

(require 'volatile-highlights)
(volatile-highlights-mode 1)

(smartparens-global-mode 1)
(show-smartparens-global-mode 1)

(nyan-mode 1)
(nyan-start-animation)
(nyan-toggle-wavy-trail)

(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

(delete-selection-mode 1)

(eval-after-load "dired" '(progn (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))


;;; Shortcuts
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-<apps>") 'find-file-at-point)
(global-set-key (kbd "C-x t") (
			       lambda() (interactive)
				     (if (or (get-buffer "*terminal*")(get-buffer "*eshell*")) (rename-uniquely)) (if (string= window-system "w32") (eshell) (term "/bin/bash"))))

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'avy)
(require 'ace-window)
(global-set-key (kbd "C-:") 'avy-goto-word-0)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "M-g g") 'avy-goto-line)

(require 'multiple-cursors)
(global-set-key (kbd "C-x <down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-x <up>") 'mc/mark-previous-like-this)
(setq dired-dwim-target t)
;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-delay 0.0)
 '(custom-enabled-themes (quote (deeper-blue)))
 '(fancy-splash-image nil)
 '(flymake-google-cpplint-command "/usr/local/bin/cpplint")
 '(global-linum-mode t)
 '(global-subword-mode t)
 '(inhibit-startup-screen t)
 '(initial-buffer-choice "/mnt/Files/accacio")
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (multiple-cursors ace-window avy expand-region neotree smartparens nyan-mode rainbow-mode undo-tree volatile-highlights google-c-style flymake-cursor flymake-google-cpplint iedit auto-complete-c-headers yasnippet-snippets yasnippet auto-complete)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "sea green")))))
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(require 'yasnippet)
(yas-global-mode 1)
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/include/c++/5")
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/5/include")
)

(server-start)
(put 'dired-find-alternate-file 'disabled nil)
