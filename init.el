;; add load-path
(add-to-list 'load-path' "~/.emacs.d/color-thrme")

;; --------------
;;  rinari - for rails
;; --------------
;; Interactively Do Things (highly recommended, but not strictly required)
;(require 'ido)
;(ido-mode t)
;; Rinari
;(add-to-list 'load-path "~/.emacs.d/elisp/rinari")
;(require 'rinari)

;;
;; key sertting
;;
(global-set-key "\C-h" 'backward-delete-char)           ;;BackSpace
(global-set-key "\C-x\C-x" 'comment-region)             ;;comment-out
(global-set-key "\C-xr" 'replace-string)                ;;無条件置換
(global-set-key "\C-xq" 'query-replace)                 ;;確認付き置換
(global-set-key "\C-xp" 'goto-line)                     ;;goto-line
(global-set-key "\C-xf" 'set-buffer-file-coding-system) ;;文字コード変換
(global-set-key "\C-x\C-i" 'indent-region)              ;;indentを整え
(global-set-key "\C-x\C-b" 'bs-show)                    ;;バッファ
(global-set-key "\C-z" 'undo)                           ;;Undo

;;
;; global setup
;;
(display-time)                     ;;display time in modeline
(setq inhibit-startup-message t)   ;;inhibits the startup screen
(setq initial-scratch-message nil) ;;do not show starting message
(setq line-number-mode t)          ;;show line number
(setq column-number-mode t)        ;;show coloumn number
(size-indication-mode t)           ;;show file size
(define-key ctl-x-map "\C-b" 'electric-buffer-list) ;;use electric-buffer-list

;;
;; others
;;
;;; インデントの設定
(setq js-indent-level 2)
(setq cperl-indent-level 2)
;;; バックアップファイルを作らない
(setq backup-inhibited t)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; 実行権限をつけて保存;  対象は、先頭に'#!'がついているファイル
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)
;; 関数名の表示 ??
(which-function-mode 1)
;; スペルチェック
(setq-default flyspell-mode t)
(setq ispell-dictionary "american")

;;; カーソルの点滅を止める
(blink-cursor-mode 0)
;; メニューバーにファイルのフルパスを表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
;; paren: 対応する括弧を光らせる
(setq show-paren-delay 0)
(show-paren-mode t)
; カッコ内の色も変更
(setq show-paren-style 'expression)
; カッコ内のフェイス
(set-face-background 'show-paren-match-face nil)
; カッコ内のフェイス
(set-face-underline-p 'show-paren-match-face "Blue")
; ;;; 対応する括弧を光らせる。
; (show-paren-mode 1)
; ;;; ウィンドウ内に収まらないときだけ括弧内も光らせる。
; (setq show-paren-style 'mixed)
;; リージョンの背景色を変更
(set-face-background 'region "LightBlue");; lightgreen
;; ;; 色づけ
;; (global-font-lock-mode t)
;; ;;; 行のハイライト
;; ;; hl-line-mode
;; (defface my-hl-line-face
;;   ;;  背景が dark ならば 背景を黒に.
;;   '((((class color) (background dark))
;;      (:background "NavyBlue" t))
;;     ;; 背景が light ならば背景色を緑に
;;     (((class color) (background light))
;;      (:background "LightGoldenrodYellow" t))
;;     (t (:bold t)))
;;   "hl-line's my face")
;; (setq hl-line-face 'my-hl-line-face)
;; (global-hl-line-mode t)
;;
;;; P100 現在行のハイライト
;; (defface my-hl-line-face
;;   ;; 背景がdarkならば背景色を紺に
;;   '((((class color) (background dark))
;;      (:background "NavyBlue" t))
;;     ;; 背景がlightならば背景色を緑に
;;     (((class color) (background light))
;;      (:background "LightGoldenrodYellow" t))
;;     (t (:bold t)))
;;   "hl-line's my face")
;; (setq hl-line-face 'my-hl-line-face)
;; (global-hl-line-mode t)

;;
;; ターミナル以外はツールバー、スクロールバーを非表示
(when window-system
  ;; tool-barを非表示
  (tool-bar-mode 0)
  ;; scroll-barを非表示
  (scroll-bar-mode 0))

;; CocoaEmacs以外はメニューバーを非表示
(unless (eq window-system 'ns)
  ;; menu-barを非表示
  (menu-bar-mode 0))

;; Scroll bar を消す
;;; Undocumented なので注意
;; M-x toggle-scroll-bar でスクロールバートグル
(toggle-scroll-bar nil)

;;
;; C-mにnewline-and-indentを割り当てる。
;; 先ほどとは異なりglobal-set-keyを利用
(global-set-key (kbd "C-m") 'newline-and-indent)
;; ;; 折り返しトグルコマンド
;; (define-key global-map (kbd "C-x l") 'toggle-truncate-lines)
;; "C-t" でウィンドウを切り替える。初期値はtranspose-chars
(define-key global-map (kbd "C-t") 'other-window)

;;
;; [[ 2013/11/03]]  font settings1
;;

;; 日本語入力
;; (setq default-input-method "W32-IME")
;; (setq-default w32-ime-mode-line-state-indicator "[--]")
;; (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
;; (w32-ime-initialize)
(global-set-key [M-kanji] 'ignore)

;; 文字コード
(set-language-environment  'utf-8)
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-file-name-coding-system 'shift_jis) ;dired文字化け対策

;; フォント
;; abcdefghijklmnopqrstuvwxyz
;; ABCDEFGHIJKLMNOPQRSTUVWXYZ
;; `1234567890-=\[];',./
;; ~!@#$%^&*()_+|{}:"<>?
;;
;; 壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五壱弐参四五
;; 123456789012345678901234567890123456789012345678901234567890
;; ABCdeＡＢＣｄｅ
;;
;; ┌─────────────────────────────┐
;; │　　　　　　　　　　　　　罫線                            │
;; └─────────────────────────────┘
;;

(set-face-attribute 'default nil :family "Consolas" :height 104)
(set-fontset-font nil 'japanese-jisx0208 (font-spec :family "MeiryoKe_Console"))
(setq face-font-rescale-alist '(("MeiryoKe_Console" . 1.08)))

;;
;; リストを評価する(Ctrl-j)
;;   フォントファミリ (pp (font-family-list))
;;   文字セット       (pp (charset-list))
;;   フェース         (pp (face-list))

;; フレーム
(setq default-frame-alist
       (append (list
                '(left . 500)
                '(top  . 10)
                '(width  .  70)
                '(height .  35)
 	       )
 	      default-frame-alist))


;;
;; [[ 2013/11/03]]  font settings
;;
(when (and (>= emacs-major-version 24)
           (eq window-system 'ns))
  ;; フォントセットを作る
  (let* ((fontset-name "myfonts") ; フォントセットの名前
         (size 18) ; ASCIIフォントのサイズ [9/10/12/14/15/17/19/20/...]
         (asciifont "Menlo") ; ASCIIフォント
         (jpfont "Hiragino Maru Gothic ProN") ; 日本語フォント
         (font (format "%s-%d:weight=normal:slant=normal" asciifont size))
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont))
         (fsn (create-fontset-from-ascii-font font nil fontset-name)))
    (set-fontset-font fsn 'japanese-jisx0213.2004-1 jp-fontspec)
    (set-fontset-font fsn 'japanese-jisx0213-2 jp-fontspec)
    (set-fontset-font fsn 'katakana-jisx0201 jp-fontspec) ; 半角カナ
    (set-fontset-font fsn '(#x0080 . #x024F) fontspec)    ; 分音符付きラテン
    (set-fontset-font fsn '(#x0370 . #x03FF) fontspec)    ; ギリシャ文字
    )

  ;; デフォルトのフレームパラメータでフォントセットを指定
  (add-to-list 'default-frame-alist '(font . "fontset-myfonts"))

  ;; フォントサイズの比を設定
  (dolist (elt '(("^-apple-hiragino.*"               . 1.2)
		 (".*osaka-bold.*"                   . 1.2)
		 (".*osaka-medium.*"                 . 1.2)
		 (".*courier-bold-.*-mac-roman"      . 1.0)
		 (".*monaco cy-bold-.*-mac-cyrillic" . 0.9)
		 (".*monaco-bold-.*-mac-roman"       . 0.9)))
    (add-to-list 'face-font-rescale-alist elt))

  ;; デフォルトフェイスにフォントセットを設定
  ;; # これは起動時に default-frame-alist に従ったフレームが
  ;; # 作成されない現象への対処
  (set-face-font 'default "fontset-myfonts"))


;; ;;
;; ;; color-theme
;; ;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (color-theme-wombat) ;; 使うカラーテーマ名
;; ;; (color-theme-molokai) ;; 使うカラーテーマ名


;; ;;
;; ;; 表示設定
;; ;;
;; ;;Osaka
;; (if window-system (progn
;; (create-fontset-from-fontset-spec
;; (concat
;; "-*-fixed-medium-r-normal-*-14-*-*-*-*-*-fontset-osaka24,"
;; "japanese-jisx0208:-apple-osaka-medium-r-normal--24-240-72-72-m-240-jisx0208.1983-sjis,"
;; "ascii:-apple-monaco-medium-r-normal-*-24-*-*-*-*-*-mac-roman"))
;; (set-default-font "fontset-osaka24")
;; (setq default-frame-alist (append '((font . "fontset-osaka24"))))
;; ))
;; ;;
;; ;; Window setting  :背景色,起動時のサイズ,表示位置,フォントを指定
;; ;;
;; (setq initial-frame-alist
;;       (append (list
;; ;;                    '(foreground-color . "Black")
;; ;;              '(background-color . "Gray75")
;; ;;              '(border-color . "Black")
;; ;;              '(mouse-color . "Black")
;; ;;              '(cursor-color . "Gray30")
;; ;;            '(width . 55)
;; ;;            '(height . 20)
;; ;;            '(top . 0)
;; ;;            '(left . 700)
;; ;; ;;
;; ;;            '(font . "VL Gothic-11")
;;             )
;;            initial-frame-alist))

;; ;; モードライン（アクティブでないバッファ）の文字色を設定します。
;; (set-face-foreground 'mode-line-inactive "gray20")
;; ;; モードライン（アクティブでないバッファ）の背景色を設定します。
;; (set-face-background 'mode-line-inactive "gray80")
;; (setq default-frame-alist initial-frame-alist)



;; ;;
;; ;; ruby
;; ;;
;;     (autoload 'ruby-mode "ruby-mode"
;;       "Mode for editing ruby source files" t)
;;     (setq auto-mode-alist
;;           (append '((".rb$" . ruby-mode)) auto-mode-alist))

;; (put 'upcase-region 'disabled nil)

;; ;;rubyのスタートテンプレート挿入
;; (add-hook 'ruby-mode-hook'(lambda ()(local-set-key "\M-ss" 'ruby-start)))
;; (autoload 'ruby-start "background" nil t)

;; ;;rubyの OptParse 挿入
;; (add-hook 'ruby-mode-hook'(lambda ()(local-set-key "\M-so" 'opt-insert)))
;; (autoload 'opt-insert "background" nil t)

;; ;;rubyの loadメソッド 挿入
;; (add-hook 'ruby-mode-hook'(lambda ()(local-set-key "\M-sl" 'load-insert)))
;; (autoload 'opt-insert "background" nil t)

;; ;;TeX word-count
;; (autoload 'word-count-mode "word-count"
;;           "Minor mode to count words." t nil)
;; (global-set-key "\M-+" 'word-count-mode)
