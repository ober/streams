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



(defun myput () (interactive) (shell-command (format "ATLASSIAN_PASSWORD=\"%s\" /home/jaimef/.emacs.d/C/cc push \"%s\"" identica-jira-password buffer-file-name)))
(global-set-key [(f7)]  'myput)
(defun myget () (interactive) (shell-command (format "ATLASSIAN_PASSWORD=\"%s\" /home/jaimef/.emacs.d/C/cc pull \"%s\"" identica-jira-password buffer-file-name) (revert-buffer t t nil)) (nxml-mode))
(defun my-fetch-all () (interactive) (shell-command (format "ATLASSIAN_PASSWORD=\"%s\" /home/jaimef/.emacs.d/C/cc fetchall &" identica-jira-password)))


(global-set-key [(f7)]  'myput)
(global-set-key [(f8)]  'myget)
(global-set-key [f9] 'mytidy)
