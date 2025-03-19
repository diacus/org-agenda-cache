;;; org-agenda-cache-export.el --- Exports Org Agenda to a cache file  -*- lexical-binding:t -*-
;; Copyright (C) 2025
;; Author: Diego Guzman <diacus.magnuz@gmail.com>
;; Version: 0.1
;; Package-Requires: ((org))
;; Keywords: org, agenda
;; URL: https://github.com/diacus/org-agenda-cache

;;; Commentary:
;; This package allows exporting Org Agenda for the current week into
;; a cached file so it can be consumed by 3rd party apps.

(require 'org)

;;; Code:

(setq org-agenda-files '("~/org"))
(defvar org-agenda-cache "~/.cache/org-agenda.txt")
(defvar local-org-agenda-buffer-name "*Org Agenda*")

(defun org-agenda-to-cache (cache-file)
  "Exports Org Agenda to CACHE-FILE file."
  (org-agenda-list)
  (switch-to-buffer local-org-agenda-buffer-name)
  (write-region (point-min) (point-max) cache-file)
  (kill-buffer local-org-agenda-buffer-name))

(org-agenda-to-cache org-agenda-cache)
(kill-emacs)

(provide 'org-agenda-cache-export)
;;; org-agenda-cache-export.el ends here
