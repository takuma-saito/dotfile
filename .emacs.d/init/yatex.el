
;; YaTeX configuration option
(setq auto-mode-alist (cons '("\\.tex$" . yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; LaTeX コマンド、プレビューワ、プリンタなどの設定
(setq tex-command "platex"
      dvi2-command "/usr/bin/open -a Preview"
      bibtex-command "pbibtex -kanji=utf8"
      YaTeX-use-LaTeX2e t
      YaTeX-kanji-code 4 ; (1 JIS, 2 SJIS, 3 EUC 4, UTF-8)
      YaTeX-use-AMS-LaTeX t ; AMS-LaTeX を使う。
      section-name "documentclass"
      makeindex-command "mendex")

;; 70 行ごとの改行を off
(add-hook 'yatex-mode-hook '(lambda () (auto-fill-mode -1)))
