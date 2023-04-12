(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-interval 5)
 '(custom-enabled-themes '(tango-dark))
 '(ispell-dictionary nil)
 '(package-selected-packages '(rust-mode format-all)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(require 'format-all)
(require 'elcord)

(elcord-mode)

;; Hide menu bars and such
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (python . t)
   (shell . t)
   )
 )

(setq launch-dir default-directory)

(defun project-compile ()
  " Try to find a build script in working directory and run it."
  (interactive)
  (message (concat "Finding build script in " launch-dir "..."))
  (cond ((file-readable-p (concat launch-dir "run.sh"))       (shell-command (concat "cd " launch-dir ";" launch-dir "/run.sh")))
	((file-readable-p (concat launch-dir "run"))          (shell-command (concat "cd " launch-dir ";" launch-dir "/run")))
	((file-readable-p (concat launch-dir "build.sh"))     (shell-command (concat "cd " launch-dir ";" launch-dir "/build.sh")))
	((file-readable-p (concat launch-dir "build"))        (shell-command (concat "cd " launch-dir ";" launch-dir "/build")))
	((file-readable-p (concat launch-dir "publish"))      (shell-command (concat "cd " launch-dir ";" launch-dir "/publish")))
	(t (message (concat "No build script found at path " launch-dir "  :("))))
  )

(message launch-dir)

;; hide warnings
(defun my-org-confirm-babel-evaluate (lang body)
  (not (string= lang "shell")))  ;don't ask for bash
(setq org-confirm-babel-evaluate #'my-org-confirm-babel-evaluate)
(setq org-confirm-elisp-link-function nil)

(setq org-startup-folded nil)

(defun xah-run-current-file ()
  "Execute the current file.
For example, if the current buffer is the file x.py, then it'll call 「python x.py」 in a shell.
The file can be Emacs Lisp, PHP, Perl, Python, Ruby, JavaScript, Bash, Ocaml, Visual Basic, TeX, Java, Clojure.
File suffix is used to determine what program to run.

If the file is modified or not saved, save it automatically before run.

URL `http://ergoemacs.org/emacs/elisp_run_current_file.html'
version 2016-01-28"
  (interactive)
  (let (
        (-suffix-map
         ;; (‹extension› . ‹shell program name›)
         `(
           ("php" . "php")
           ("pl" . "perl")
           ("py" . "python")
           ("py3" . ,(if (string-equal system-type "windows-nt") "c:/Python32/python.exe" "python3"))
           ("rb" . "ruby")
           ("go" . "go run")
           ("js" . "node") ; node.js
           ("sh" . "bash")
           ("clj" . "java -cp /home/xah/apps/clojure-1.6.0/clojure-1.6.0.jar clojure.main")
           ("rkt" . "racket")
           ("ml" . "ocaml")
           ("vbs" . "cscript")
           ("tex" . "pdflatex")
           ("latex" . "pdflatex")
           ("java" . "javac")
           ;; ("pov" . "/usr/local/bin/povray +R2 +A0.1 +J1.2 +Am2 +Q9 +H480 +W640")
           ))

        -fname
        -fSuffix
        -prog-name
        -cmd-str)

    (when (null (buffer-file-name)) (save-buffer))
    (when (buffer-modified-p) (save-buffer))

    (setq -fname (buffer-file-name))
    (setq -fSuffix (file-name-extension -fname))
    (setq -prog-name (cdr (assoc -fSuffix -suffix-map)))
    (setq -cmd-str (concat -prog-name " \""   -fname "\""))

    (cond
     ((string-equal -fSuffix "el") (load -fname))
     ((string-equal -fSuffix "java")
      (progn
        (shell-command -cmd-str "*xah-run-current-file output*" )
        (shell-command
         (format "java %s" (file-name-sans-extension (file-name-nondirectory -fname))))))
     (t (if -prog-name
            (progn
              (message "Running…")
              (shell-command -cmd-str "*xah-run-current-file output*" ))
          (message "No recognized program file suffix for this file."))))))

;; keybindings
(global-set-key (kbd "<f4>") 'format-all-buffer)
(global-set-key (kbd "<f5>") 'project-compile)
(global-set-key (kbd "<f6>") 'xah-run-current-file)

;; do as i say
(defun my-org-confirm-babel-evaluate (lang body)
  (not (member lang '("C" "clojure" "sh" "python" "emacs-lisp"))))

(setq org-confirm-babel-evaluate 'my-org-confirm-babel-evaluate)

;; open todo list on startup
(defun open-todos()
    (interactive)
    (if (file-readable-p "~/TODO.org")
	(find-file "~/TODO.org")))

(global-set-key (kbd "<f8>") 'open-todos)
