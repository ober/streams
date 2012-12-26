(defun mytidy ()
  "Tidies the HTML content in the buffer using `tidy'"
  (interactive)
  (shell-command-on-region
   ;; beginning and end of buffer
   (point-min)
   (point-max)
   ;; command and parameters
   "tidy --input-xml true -i -w 120 -q"
   ;; output buffer
   (current-buffer)
   ;; replace?
   t
   ;; name of the error buffer
   "*Tidy Error Buffer*"
   ;; show error buffer?
   t)
  (nxml-mode))


(defun myput () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command (format "/home/jaimef/streams/streams push \"%s\"" buffer-file-name)))
(global-set-key [(f7)]  'myput)
(defun myget () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command (format "/home/jaimef/streams/streams pull \"%s\"" buffer-file-name) (revert-buffer t t nil)) (nxml-mode))
(global-set-key [(f8)]  'myget)
(defun my-fetch-all () (interactive) (setenv "ATLASSIAN_PASSWORD" identica-jira-password) (shell-command "~/streams/streams fetch-all &" "confluence-fetch-all"))

(global-set-key [(f7)]  'myput)
(global-set-key [(f8)]  'myget)
(global-set-key [(f9)] 'mytidy)
