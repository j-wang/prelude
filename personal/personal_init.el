(server-start)
(prelude-require-packages '(jedi ess multiple-cursors))

(defun my-autofill-mode ()
  (setq fill-column 79)
  (turn-on-auto-fill))

(defun my-kill-buffer-and-frame ()
  "kill the current buffer and the current frame"
  (interactive)
  (kill-buffer)
  (delete-frame))


; Actually kill the buffer
(substitute-key-definition 'kill-buffer 'my-kill-buffer-and-frame global-map)

; Jedi mode config
(add-hook 'python-mode-hook '(jedi:setup my-auto-fill-mode) t)
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

;; org-agenda commands
(setq org-agenda-custom-commands
      '(("n" "Todos and 30-Days"
         ((agenda "" ((org-agenda-ndays 30) (org-agenda-show-all-dates nil)))
          (todo "TODO")))
        ("h" agenda "All Dates" ((org-agenda-show-all-dates nil)))
        ("W" agenda "21-Day Agenda" ((org-agenda-ndays 21)
                        (org-agenda-show-all-dates nil)))
        ("A" agenda "Today"
         ((org-agenda-ndays 1)
          (org-agenda-overriding-header "Today")))))

;; don't set ids for my org-files for mobile-org
(setq org-mobile-force-id-on-agenda-items nil)

;; org-mobile sync
(defvar org-mobile-sync-timer nil)
(defvar org-mobile-sync-idle-secs (* 60 10))
(defun org-mobile-sync ()
  (interactive)
  (org-mobile-pull)
  (org-mobile-push))
(defun org-mobile-sync-enable ()
  "enable mobile org idle sync"
  (interactive)
  (setq org-mobile-sync-timer
        (run-with-idle-timer org-mobile-sync-idle-secs t
                             'org-mobile-sync)));
(defun org-mobile-sync-disable ()
  "disable mobile org idle sync"
  (interactive)
  (cancel-timer org-mobile-sync-timer))
(org-mobile-sync-enable)


(require 'elpy)
(elpy-enable)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'personal_init)
