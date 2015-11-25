#!/bin/zsh

# scala の設定
alias scala="scala -Dfile.encoding=UTF-8"
alias R-ja='/Library/Frameworks/R.framework/Resources/bin/R'

# Global aliases
alias -g ...='../../'
alias -g ....='../../../'
alias -g .....='../../../'
alias -g ......='../../../../'
alias -g DN=/dev/null
alias -g LS="| less -R -M"
alias -g NE="2> /dev/null"
alias -g NS='| sort -n'
alias -g NL="> /dev/null 2>&1" # null
alias -g TL='| tail -20'     # tail
alias -g SP2NL='| tr " " "\n"' # space to new line
alias -g NL2SP='| tr "\n" " "' # new line to space
alias -g GIP="| grep -Po '[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}'" # grep IP Address
alias -g X='| xargs'
alias -g HD='| head -20'
alias -g GP='| grep'

# emacs 等の修正用
alias etodo='emacs ~/memo/todo.txt'
alias sz='source ~/.zshrc'

# gnu ライブラリの移植
alias emacs='/usr/local/bin/emacs'
# alias git='/usr/local/bin/git'
alias ls='gls -Fh --color'
alias sed='gsed'
# alias gsed='gsed -r'
alias awk='gawk'
alias zcat='gzcat'
alias find='gfind'
alias du='gdu'
alias cut='gcut'
#alias wc='/usr/local/bin/gwc'
alias du='gdu'
alias csplit='gcsplit'
alias uniq='guniq'
alias sort='gsort'
alias base64='gbase64'
alias xargs='gxargs'
alias install='ginstall'
alias date='gdate'
alias factor='gfactor'
# alias diff='colordiff -u'

alias less='less -M -R'
alias xdvi='xdvi 2>/dev/null'
alias man='LANG=C /usr/bin/man'
alias tmux='tmux -u'
alias objdump='LANG=C gobjdump -M intel'
alias nasm='/usr/local/bin/nasm'
alias topcoder='javaws ~/bin/ContestApplet.jnlp'
alias maxima="rlwrap maxima"
alias qemacs="emacs -Q"
alias sage="/opt/sage/sage"
alias tac='tail -r'
alias stop-emacs="emacsclient -e '(kill-emacs)'"
alias start-emacs="emacs --daemon"
alias restart-emacs="stop-emacs && start-emacs"
alias e='emacsclient -t'
alias infocmp='infocmp -L'
alias current-date='date +"%Y/%m/%d %I:%M:%S JST"'
alias geoip='geoiplookup -f /opt/GeoIP/share/GeoIP/GeoLiteCity.dat'
alias ipython='ipython3'
alias remove-ctrl="gsed -e 's/[\x01-\x1F\x7F]//g'"
alias hex="hexdump -e '/1 \"%02x \"'"
alias rot13-enc="tr '[a-m][n-z][A-M][N-Z]' '[n-z][a-m][N-Z][A-M]'"
alias rot13-dec="tr '[n-z][a-m][N-Z][A-M]' '[a-m][n-z][A-M][N-Z]'"
# alias string="gstrings -e UTF"

# アプリケーションバインディング
alias prev='open -a Preview'
alias firefox='open -a Firefox'
alias chrome='open -a Chrome'
alias pdfview='open -a Adobe\ Reader'
alias actmonitor='open -a Activity\ Monitor'
alias gui-diskutil='open -a Disk\ Utility'
alias appemacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias ios-sim='open "/Applications/Xcode.app/Contents/Developer/Applications/iOS Simulator.app"'
alias scilab='open -a scilab-5.3.2'
alias jabref='open -a JabRef'
alias readown='open /Applications/MacPorts/Readown.app'
alias PictPrinter='/Applications/PictPrinter.app/Contents/MacOS/PictPrinter'

# もろもろ拡張, 環境非依存
alias rm='gmv -f --backup=numbered --target-directory ~/.Trash'
alias cl='clear'
alias nl='netstat -anl | less'
alias -g psg='ps aux | grep'
alias grep='grep --color --binary-files=without-match'
alias yml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(\$stdin.gets(nil)))'"
alias json2yml="ruby -ryaml -rjson -e 'puts JSON.parse(\$stdin.gets(nil)).to_yaml'"

# mac環境のみ
alias pix='port search'
alias ja2en='translate ja en'
alias en2ja='translate en ja'
alias tmux='tmux -2'
alias fsc='fsc -deprecation'
alias sl='sl -r'
alias ssh-proxy='ssh -C -f -N'
alias pwgen='pwgen -n -c'
alias ash='adb shell'
alias gosh='gosh -I.'
alias pms='~/Library/Application\ Support/Plex/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Scanner'
alias wkhtmltopdf='/Applications/wkhtmltopdf.app/Contents/MacOS/wkhtmltopdf'
alias ssh-bg='\ssh -N -f'
alias passwords='gpg -d $HOME/memo/pass.txt.gpg'
alias rdmd='dmd $HOME/lib/D/tk/*.d -run'
alias startup-gateway="wakeonlan 4c:e6:76:d8:37:4c"
alias start-share='sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.InternetSharing.plist'
alias stop-share='sudo launchctl unload /System/Library/LaunchDaemons/com.apple.InternetSharing.plist'
alias sqlmap='sqlmap --proxy="http://localhost:8080"'
function p { PROXY=on proxychains4 -f /etc/proxychains-tor.conf $1; }
function iphostname-tor {
    IP=$(curl -x socks://127.0.0.1:9050 -s 'ipcheck.com')
    echo $IP $(tor-resolve -x $IP)
}
alias p-on='PROXY=on proxychains4 -f /etc/proxychains-tor.conf zsh'
alias p-off='PROXY=off exit'

# user specific
alias ascii='gosh ~/code/scheme/production/ascii/main.scm'
alias ascii-hex='gosh ~/code/scheme/production/ascii/main-hex.scm'

# ec2
function state-ima {
    aws ec2 describe-instances --instance-ids $1 | grep STATE
}
alias status-ima="aws ec2 describe-instances --instance-ids"
alias status-ima-list="aws ec2 describe-instance-status"
alias start-ima="aws ec2 start-instances --instance-ids"
alias stop-ima="aws ec2 stop-instances --instance-ids"
alias reboot-ima="aws ec2 reboot-instances --instance-ids"
alias show-ima="aws ec2 describe-instance-status --instance-ids"
alias console-log-ima="aws ec2 get-console-output --instance-id"
export TAUTO_SUM="i-ed55eaf4"

# alias wakeup-home='wol 00:16:41:e8:ec:d8'
# ghc library darty hack
# alias ghc='ghc -L/usr/lib'

alias mysqlstart='sudo mysqld_safe &'
alias mysqlstop='sudo mysqladmin -u root -p shutdown'
alias titanium18='/Library/Application\ Support/Titanium/mobilesdk/osx/1.8.1/titanium.py'
alias titanium20='/Library/Application\ Support/Titanium/mobilesdk/osx/2.0.1.GA2/titanium.py'

