;; откючаем экран приветсвия
(setq debug-on-error t)
(setq inhibit-splash-screen   t)
(setq ingibit-startup-message t) ;; экран приветствия можно вызвать комбинацией C-h C-a

;;включчаем и настраиваем подсветку
(show-paren-mode t)   
;(setq show-paren-style 'expression) ; подсвечивает блоки, но раздражает



(defun select-nth-window (n)
  "Focus Nth window"
 (interactive)
 (set-frame-selected-window (selected-frame) (frame-first-window))
 (set-frame-selected-window (selected-frame) (nth n (window-list)))
)


;;init neotree
  (add-to-list 'load-path "/home/pi/.emacs.d/plugin/neotree")
  (require 'neotree)
  (global-set-key [f8] 'neotree-toggle)
  (setq neo-theme 'nerd)
  (setq neo-toggle-window-keep-p t)
  (setq neo-smart-open t)
  (neotree-hidden-file-toggle)
  (autoload 'neotree "neotree" "" t) 
  (setq neo-window-width 50) 
  (setq neo-persist-show nil)
  (setq neo-buffer--show-hidden-file-p t)
;  (neo-show-hidden-files nil)

(neotree-show)


;;переключаемся с neotree
(other-window 1)

;;делаем нумерацию
;; Linum plugin
(require 'linum)
(setq linum-format "%4d \u2502") ;; задаем формат нумерации строк



;;делим на две части
(split-window-vertically (floor (* 0.7 (window-height))))



;;переходим нижнее окно 
;(other-window 1)

;; внижнем окне создаем буфер компиляции
;(switch-to-buffer "*compilation*")

;;в ниэнем окне запускаем git
(add-to-list 'load-path "/home/pi/.emacs.d/plugin/git-emacs")
(require 'git-emacs)
(require 'compile)

(add-hook 'find-file-hook 'linum-mode)
(add-hook 'c++-mode-hook 'linum-mode)
;;(add-hook 'c++-mode-hook (lambda() (select-nth-window 1)))

(add-hook 'c++-mode-hook
(lambda (&optional dummy)
  (unless (file-exists-p "Makefile")
      (set (make-local-variable 'compile-command)
      (let ((file (file-name-nondirectory (buffer-file-name))))
         (concat "g++ -g -O2 -Wall -o " 
            (file-name-sans-extension file)
            " " file))))

))

;(add-hook 'c++-mode-hook
;(lambda (&optional dummy)
(when (file-exists-p "./.git/config")
(select-nth-window 2)
(git-status nil))


;;переходим в верхнее окно
;(other-window -1)
;;переходим в neo-tree
;(other-window -1)

(select-nth-window 1)
;;(dedicated-mode)
(select-nth-window 0)


;;устанвока темы emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tsdh-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )




;(defun display-on-side (buffer &optional not-this-window frame)
;    (select-nth-window 1)	
;    (select-nth-window 0)

;    (let* ((window (or (minibuffer-selected-window)
;                     (selected-window)))
;         (display-buffer-function nil)
;         (pop-up-windows nil))
;    (with-selected-window (or window (error "display-on-side"))
;      (when (one-window-p t)
;        (split-window-horizontally))
;      (display-buffer buffer not-this-window frame))))
 
;(setq display-buffer-function 'display-on-side)


;;функция которая поволяет обрабатывать собтия при открии файла с определенным расширением
;(add-hook 'find-file-hook 'my-project-hook)
;(defun my-project-hook ()
;  (when (string= (file-name-extension buffer-file-name) "cc")
;;    (typescript-mode)
;;    (tss-setup-current-buffer)
;    (customize-set-variable
;     'display-buffer-alist
;     '(current-buffer-name (display-buffer-same-window)))
;   )
;)

