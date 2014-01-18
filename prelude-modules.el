;;; Uncomment the modules you'd like to use and restart Prelude afterwards

(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
;; (require 'prelude-helm) ;; Interface for narrowing and search

(require 'prelude-c)
;; (require 'prelude-clojure)
;; (require 'prelude-coffee)
;; (require 'prelude-common-lisp)
;; (require 'prelude-css)
(require 'prelude-emacs-lisp)
(require 'prelude-erc) ;; Emacs IRC client
;; (require 'prelude-erlang)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-mediawiki)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
;; (require 'prelude-python)
;; (require 'prelude-ruby)
;; (require 'prelude-scala)
(require 'prelude-scheme)
;; (require 'prelude-scss)
;; (require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)


;;; below add by hzh
;;; create a directory named ".emacs-hzh.d" in home dir, and put all your personal
;;; files(or directories) in it, we will add it to load-path. If you hava a theme,
;;; you should make a dir named "themes", and put theme files in it.

(defun hzh-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
        (hzh-add-subfolders-to-load-path name)))))

(defun hzh-add-subfolders-to-custom-theme-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `custom-theme-load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'custom-theme-load-path name)
        (hzh-add-subfolders-to-custom-theme-load-path name)))))

(defvar hzh-emacs.d ".emacs-hzh.d")
(defvar hzh-loadpath (expand-file-name hzh-emacs.d (getenv "HOME")))
(defvar hzh-theme-loadpath (expand-file-name "themes" hzh-loadpath))
(hzh-add-subfolders-to-load-path hzh-loadpath)
(add-to-list 'custom-theme-load-path hzh-theme-loadpath)
(hzh-add-subfolders-to-custom-theme-load-path hzh-theme-loadpath)

;;; hzh add for theme
(disable-theme 'zenburn)
; (load-theme 'solarized-dark t t)
; (enable-theme 'solarized-dark)
; (load-theme 'monokai t t)
; (setq molokai-theme-kit t)
(load-theme 'molokai t t)
(enable-theme 'molokai)

;;; hzh add for ibus
;;; ibus-el 似乎使用的是python2
(require 'ibus)
(setq ibus-python-shell-command-name "python2.7")
;;; Turn on ibus-mode automatically after loading .emacs
(add-hook 'after-init-hook 'ibus-mode-on)

;;; hzh add for ibus settings
;;; Use C-SPC for Set Mark command
; (ibus-define-common-key ?\C-\s nil)
;;; Use C-/ for Undo command, hzh: ibus will not change Undo
(ibus-define-common-key ?\C-/ nil)
(ibus-define-common-key [?\S- ] nil)
;;; Change cursor color depending on IBus status
(setq ibus-cursor-color '("red" "blue" "limegreen"))
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "C-SPC") 'ibus-toggle)

;;; hzh add for set mark
(global-set-key [?\S- ] 'set-mark-command)
(global-set-key [f7] 'set-mark-command)
; (global-set-key (kbd "M-n") 'set-mark-command)
; (custom-set-variables '(default-input-method "chinese-py"))

;;; hzh add for scroll bar
(toggle-scroll-bar -1)

;;; hzh add for line number
(global-linum-mode t)
(display-time-mode t)

;;; hzh add for goto-line
(global-set-key [f8] 'goto-line)
