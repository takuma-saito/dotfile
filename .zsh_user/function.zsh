
#!/bin/zsh

EC2_DIR="$HOME/.security/ec2/scripts"

# ディスク消費量を表示する
usage() {
    gdu -d 1 | sort -n | awk '{
       if ($1 > 1048576) {
          printf("%2.1fG\t", $1 / 1048576)}
       else if ($1 > 1024) {
          printf("%2.1fM\t", $1 / 1024)}
       else {
          printf("%2.1fK\t", $1)
       }
       printf("%s\n", $2)
    }'
}

plot() {
    gnuplot -e "plot('${1}')"
}

plot-with-lines() {
    gnuplot -e "plot '${1}' with lines"
}

plot-png() {
    gnuplot -e "set terminal pngcairo size 2048,2048; set output '${2}'; plot('${1}');"
}

crypt-aes256() {
    gpg -c --cipher-algo AES256 -o "$2" "$1"
}

decrypt-aes256() {
    gpg -d --cipher-algo AES256 -o "$2" "$1"
}

ascii2hex() {
    echo $(echo -en $1 | xxd -p | fold -2 | tr '\n' ' ')
}

ascii2dec() {
    echo -en $1 | xxd -p | fold -2 | tr '\n' ' '
}

tiff2woff() {
    tiff=$1
    woff=${1:r}.woff
     fontforge -c "import fontforge;font = fontforge.open(\"$tiff\"); font.generate(\"$woff\")"
}

# whois 検索の文字化け・JPRS
whoisJP() {
    whois -h whois.jprs.jp $1 | iconv -f ISO-2022-JP -t UTF-8
}

extract-chars() {
    fold -1 $@ | sort | uniq | tr -d '\n'
}

change-ip-tor() {
    (echo authenticate '"findsomething13"'; echo signal newnym; echo quit) | nc localhost 9051
}

ipcheck() {
    curl -s 'http://ipcheck.com'
}

iphostname() {
    local IP=$(ipcheck)
    echo $IP: $(tor-resolve -x $IP)
}

is-exit-node() {
    wget -q -O - 'https://check.torproject.org/exit-addresses' |  grep ExitAddress  | cut -d' ' -f2 | sort | uniq | grep $1
}

# w3mでgoogle検索
google() {
    local str opt
    if [ $ != 0 ]; then
        for i in $*; do
            str="$str+$i"
        done
        str=`echo $str | sed 's/^\+//'`
        opt='search?num=50&hl=ja&lr=lang_ja'
        opt="${opt}&q=${str}"
    fi
    w3m http://www.google.co.jp/$opt
}

extract() {
 local e=0 i c
 for i; do
   if [ -f $i -a -r $i ]; then
       case $i in
         initramfs*)
               c='pax -rzf'
               ;;
         *.tar.bz2)
               c='tar jxvf'
               ;;
         *.tar.gz)
               c='tar zxvf'
               ;;
         *.tar.xz)
               c='tar Jxvf'
               ;;
         *.bz2)
               c='bunzip2'
               ;;
         *.gz)
               c='gunzip'
               ;;
         *.tar)
               c='tar xf'
               ;;
         *.tbz2)
               c='tar xjf'
               ;;
         *.tgz)
               c='tar xzf'
               ;;
         *.7z)
               c='7z x'
               ;;
         *.Z)
               c='uncompress'
               ;;
         *.exe)
               c='cabextract'
               ;;
         *.rar)
               c='unrar x'
               ;;
         *.xz)
               c='unxz'
               ;;
         *.zip)
               c='unzip'
               ;;
         *)
               echo "$0: cannot extract \`$i': Unrecognized file extension" >&2;
               e=1
               break
               ;;
       esac
       com=$(echo $c | sed  "s/^\(.*\)\ \(.*\)$/\1/g")
       opt=$(echo $c | sed  "s/^\(.*\)\ \(.*\)$/\2/g")
       
       # dirty hack 
       [[ $com = $opt ]] && unset opt

       command -v $com >/dev/null || error "command not found ${com}."
       
       $com $opt "$i"
   else
       echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
   fi
 done
 return $e
}


