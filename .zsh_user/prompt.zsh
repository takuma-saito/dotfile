#!/bin/zsh

# プロンプト用に分かりやすい色を設定
autoload -U colors
colors

# FG, FX にて色を設定できる
autoload -U spectrum
spectrum

hostip() {
    echo $(wget -q -O - ipcheck.ieserver.net)
}

if [[ $PROXY = 'on' ]]; then
else
    export PROXY='off'
fi

update-prompt() {
    # export IP=$(ipcheck)
    # prompt
    case "$UID" in
        0)
            PROMPT=" %n@%m: $FX[bold]$FX[underline]%~$FX[reset] %{${fg[green]}%}%*$FX[reset]"$'\n'
            ;;
        *)
            PROMPT="%(?.%{$fg[yellow]%}ヾ(*・ω・)ﾉ $FX[reset].%{${fg[red]}%}ヾ(･ω･･ ；%)ﾉぁゎゎ $FX[reset])proxy:$fg[green]$FX[bold]$PROXY$FX[reset] $FG[033]$FX[bold]%n@%m$FX[reset] $FX[bold]$FX[underline]%~$FX[reset] "$'\n'" -> " 
            RPROMPT="%{${fg[green]}%}$OS_TYPE%{${reset_color}%}"
            ;;
    esac
}

update-prompt
