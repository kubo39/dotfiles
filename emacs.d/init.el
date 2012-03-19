;; =====================================
;;
;;  基本設定
;;
;; =====================================

;; Language.
(set-language-environment 'Japanese)

;;; 極力 utf-8 とする
(prefer-coding-system 'utf-8)

;;; 常時デバッグ状態
(setq debug-on-error t)

;;; load-path を通す
(setq load-path (cons "~/.emacs.d/elisp" load-path))


;-------------------------------------------
(setq user-full-name "Hiroki Noda")
(setq user-main-address "kubo39@gmail.com")

;-------------------------------------------


;;; auto-install.el
;(when (require 'auto-install nil t)
; (setq auto-install-directory "~/.emacs.d/elisp/")
; (auto-install-update-emacswiki-package-name t)
; (auto-install-compatibility-setup))

;;; 起動時にバッファ２分割、左側に eshell 表示
;(defun split-window-and-run-eshell()
;  (setq w (selected-window))
;  (setq w2 (split-window w nil t))
;  (select-window w)
;  (eshell)
;  (select-window w2))
;(add-hook 'after-init-hook (lambda()(split-window-and-run-eshell)))


;;; ターミナルエミュレータのシェルを bash に設定
(when (require 'multi-term nil t)
  (setq multi-term-program "/bin/bash"))

;;; 起動時にバッファ２分割、左側に bash 表示
(defun split-window-and-run-term()
  (setq w (selected-window))
  (setq w2 (split-window w nil t))
  (select-window w)
  (multi-term)
  (select-window w2))
(add-hook 'after-init-hook (lambda()(split-window-and-run-term)))


;;; region の色
(set-face-background 'region "SkyBlue")
(set-face-foreground 'region "black")

;;; 初期フレームの設定
(setq initial-frame-alist
      (append
       '((width    . 160)  ; フレーム幅(文字数)
	 (height   . 40)   ; フレーム高(文字数)
	 (top      . 60)   ; 表示位置
	 (left     . 80)   ; 表示位置
	 (foreground-color . "azure3") ; 文字が白
	 (background-color . "black")  ; 背景は黒
	 (border-color     . "black")
	 (mouse-color      . "white")
	 (cursor-color     . "white"))
       initial-frame-alist))


;;; undo-tree: Undo の履歴を視覚化
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;;; 対応する括弧を強調
(show-paren-mode t)

;;; 現在行を目立たせる
;(global-hl-line-mode)

;;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;;; カーソルの位置が何行目かを表示する
(line-number-mode t)

;; モードラインに時刻を表示させる
;(display-time)

;;; スクロールバーを消す
(toggle-scroll-bar nil)

;;; メニューバーを消す
(menu-bar-mode nil)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;;; C-k で行全体を削除
(setq kill-whole-line t)

;; Translate C-h to DEL.
(keyboard-translate ?\C-h ?\C-?)

;;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)

;;; yes と入力するのは面倒なので y でokにする
(fset 'yes-or-no-p 'y-or-n-p)

;;; sudo とか ssh とか ubuntu用
(require 'tramp)

;;; anything
(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)
(define-key global-map "\C-x\;" 'anything)

;;; kill-summry
; yankをべんりに
; C-n とC-pが大事。「.」でyankポインタを変更。
(require 'kill-summary) ;"kill-summary" nil t)
(define-key global-map "\ey" 'kill-summary)

; wdired
;(require 'wdired)
;(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;; =====================================================
;;
;; Language mode(各言語モード)
;;
;; =====================================================

;;; Scala
(add-to-list 'load-path "~/.emacs.d/scala-mode")
(require 'scala-mode-auto)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;; turn on syntax highlighting
(global-font-lock-mode 1)


;;; Groovy
(add-to-list 'load-path "~/.emacs.d/groovy-mode")
;;; use groovy-mode when file ends in .groovy or has #!/bin/groovy at start
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))

;;; make Groovy mode electric by default.
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))


;;; D-Language
;; .d を java-mode と関連付け
(setq auto-mode-alist (cons
 '("\\.d$" . java-mode) auto-mode-alist))
(setq interpreter-mode-alist (append
 '(("java" . java-mode)) interpreter-mode-alist))
(setq java-deep-indent-paren-style nil)
(add-hook 'java-mode-hook '(lambda () (inf-java-keys)))


;;; *.ru
(setq auto-mode-alist (cons
 '("\\.ru$" . ruby-mode) auto-mode-alist))
(setq interpreter-mode-alist (append
 '(("ruby" . ruby-mode)) interpreter-mode-alist)x)


;;; *.tac
(setq auto-mode-alist (cons
 '("\\.tac$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (append
 '(("python" . python-mode)) interpreter-mode-alist))


;;haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))