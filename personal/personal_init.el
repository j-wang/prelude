(server-start)
(prelude-require-package 'jedi)

(defun my-autofill-mode ()
  (setq fill-column 79)
  (turn-on-auto-fill))

; Actually kill the buffer
(substitute-key-definition 'kill-buffer 'kill-buffer-and-window global-map)

; Jedi mode config
(add-hook 'python-mode-hook '(jedi:setup my-auto-fill-mode) t)
(setq jedi:setup-keys t)
(setq jedi:complete-on-dot t)

; Org-mode keys
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/org/flagged.org")
;; Agenda files
(setq org-agenda-files '("~/Dropbox/org/todo.org"
                         "~/Dropbox/org/someday.org"
                         "~/Dropbox/org/checklists.org"))
;; Refile targets
(setq org-refile-targets '(("todo.org" :maxlevel . 1)
                           ("someday.org" :level . 2)))

(require 'elpy)
(elpy-enable)

(provide 'personal_init)
