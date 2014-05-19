;;; personal-packages.el --- Personal list of package.el packages.
;;
;; Author: Sean Fisk
;; Maintainer: Sean Fisk
;; Keywords: local
;; Compatibility: GNU Emacs: 24.x, Aquamacs: 3.x
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; List of packages to install using package.el from ELPA, Marmalade,
;; and MELPA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

(require 'package)
;; Add Marmalade <http://marmalade-repo.org/>
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

;; Add org ELPA <http://orgmode.org/elpa.html>
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; The decision here is whether to use packages from MELPA or from
;; Marmalade. I'd like to use MELPA exclusively because I believe it's
;; the future of Emacs packaging. However, MELPA does not currently
;; support stable versions of packages. It's a planned feature, but
;; currently not supported. Therefore, as long as stable packages are
;; not supported in MELPA, I'm going to prefer Marmalade packages over
;; MELPA whenever possible. MELPA packages will be specifically
;; included whenever needed.
;;
;; The following code doesn't work. If this were used, it would need
;; to be executed in the init.el file _before_ prelude-packages is
;; required. That's because prelude adds melpa and installs a bunch of
;; packages before this file gets executed.
;;
;; (require 'melpa)
;; (setq package-archive-enable-alist
;;       '(("melpa"
;;          ;; Prelude packages
;;          helm
;;          helm-projectile
;;          jump-char                      ; Marmalade version is old
;;          melpa
;;          multiple-cursors           ; experimental, so stay up to date
;;          rainbow-mode
;;          yaml-mode                ; the Marmalade version is quite old
;;          yasnippet                ; the Marmalade version is quite old
;;          ;; My MELPA packages
;;          auto-complete-clang
;;          edit-server
;;          ;; elpy ;; MELPA elpy (submitted by me) is now broken by some recent changes
;;          ;; smart-tabs-mode
;;          )))

;; use-package <https://github.com/jwiegley/use-package> is a great
;; way to manage the config. See the Github README or the commentary
;; in the file for more documentation. Undocumented but in the code is
;; the use of the `:ensure' plist key to automatically install through
;; ELPA. Also, take note of the `bind-key' utility.
(require 'use-package)

;;; elpy
;; For elpy to work correctly, the following packages need to be
;; installed. They should be installed in the user site directory for
;; the system Python. If using a virtualenv, install to the virtualenv
;; and have elpy restart in that virtualenv. Don't include --user for
;; a virtualenv.
;;
;;     pip install [--user] elpy rope jedi pyflakes pep8
;;
;; (use-package elpy
;;              :ensure t
;;              :init (elpy-enable)
;;              :config (progn
;;                        (setq python-check-command "flake8")
;;                        (elpy-clean-modeline)))
