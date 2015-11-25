#!/bin/zsh

# debug mode
# set -xv

# sudo darty hack
sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }

# フィアルをインポート
autoloads() {
    for file in "$@"; do
        source $HOME/.zsh_user/$file.zsh
    done
}

# set fpath
fpath=($HOME/.zsh $HOME/.zsh_user $fpath)
# set -x
# 環境変数のインポート
USER_ENV_LISTS=(
    env
    path
    alias
    aws
    ec2
    function
    prompt
    welcome
    other
)
autoloads $USER_ENV_LISTS

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# autojump
_Z_CMD=j
source $HOME/.zsh/z
function precmd() {
    _z --add "$(pwd -P)"
}

# command line スタック
show_buffer_stack() {
        POSTDISPLAY="
stack: $LBUFFER"
        zle push-line-or-edit
}
zle -N show_buffer_stack
setopt noflowcontrol
bindkey '^Q' show_buffer_stac

zmodload zsh/mathfunc

# 補完関係
autoload -U compinit
compinit -u

# 言語
export LANG=ja_JP.UTF-8

# 右プロンプトを自動で消す
setopt transient_rprompt

# ヒストリー関係

# ヒストリー
export HISTSIZE=1000000
export SAVEHIST=1000000

# 時間
export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S'

# historyに記録しないコマンド
export HISTIGNORE=ls:cl:clear:history

# 色の設定（Mac 限定）
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=39'
export HISTFILE="$HOME/.zsh_history"
setopt hist_ignore_dups
setopt hist_ignore_space

# 履歴ファイルに時刻を記録
setopt extended_history

# 履歴の共有設定
setopt share_history
setopt inc_append_history

# emacs キーバインド
bindkey -e

#履歴の検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^N" history-beginning-search-backward-end
bindkey "^P" history-beginning-search-forward-end 

# cdの設定
setopt auto_cd

# ビープ音を鳴らさない
setopt nobeep

## カッコの対応などを自動的に補完
setopt auto_param_keys

## ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# 他のフレーズ展開がどれにもマッチしなかった場合、{}中の文字列・数字をソートして展開
setopt braceccl

# 豊富なグロッピング記号を使用する
setopt EXTENDED_GLOB

# 重複したコマンド履歴は表示させない
setopt HIST_IGNORE_ALL_DUPS

# コマンド予測
# autoload predict-on
# predict-on

# arg_max の制限を突破する
autoload zargs

# コマンドラインを指定したエディタで編集
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^H' edit-command-line

# mv 補完
# -n オプションで補完先を表示できる
autoload -Uz zmv
alias zmz='noglob zmv'
alias zcp='noglob zmv -C'

## 補完候補を詰めて表示
setopt list_packed

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# コマンドラインスタックのキーバーインドを変更
bindkey '^Q' push-line

# プロンプト用に分かりやすい色を設定
autoload colors
colors

## 辞書順ではなく数字順に並べる。
setopt numeric_glob_sort

# 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select interactive

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes

## 詳細な情報を使う。
zstyle ':completion:*' verbose yes

## sudo時にはsudo用のパスも使う。
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"

# kill 時にプロセスIDを補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

## 補完候補に色を付ける。
### "": 空文字列はデフォルト値を使うという意味。
zstyle ':completion:*:default' list-colors 'di=00;36'

# mosh の補完
compdef mosh=ssh

# mathfunc の補完
zmodload -i zsh/mathfunc

if [ $TERM = 'screen' ]; then
    alias ncftp=ncftp_tmux
fi

# 履歴のインクリメント検索でワイルドカードを使えるようにする
if zle -la | grep -q '^history-incremental-pattern-search'; then
  # zsh 4.3.10 以降でのみ有効
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^B' history-incremental-pattern-search-forward
fi

# コマンドライン中の改行補完
bindkey '^J' self-insert-unmeta

if [ -f ~/.zsh/zsh-syntax-highlighting.zsh ]; then
    ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
    source ~/.zsh/zsh-syntax-highlighting.zsh
fi

#  peco 補完
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
bindkey '^i' expand-or-complete

# 遅い
# zmodload zsh/zprof && zprof

export RBENV_ROOT=~/.rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# OPAM configuration
# . /Users/taku/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# aws setting
# source /usr/local/share/zsh/site-functions/_aws
