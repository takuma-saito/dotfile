#!/bin/zsh

[ -z "$dyld_library_path" ] && typeset -xT DYLD_LIBRARY_PATH dyld_library_path
[ -z "$ld_library_path" ] && typeset -xT LD_LIBRARY_PATH ld_library_path
[ -z "$library_path" ] && typeset -xT LIBRARY_PATH library_path
[ -z "$c_include_path" ] && typeset -xT C_INCLUDE_PATH c_include_path
[ -z "$cplus_include_path" ] && typeset -xT CPLUS_INCLUDE_PATH cplus_include_path
typeset -Ug path cdpath fpath manpath \
    ld_library_path library_path c_include_path cplus_include_path dyld_library_path

path=(
    # 標準パス
    /bin
    /sbin
    $HOME/bin
    $HOME/usr/bin
    /usr/local/bin
    /usr/local/sbin
    /usr/local/libexec
    /opt/local/bin
    /usr/bin
    /usr/sbin
    /usr/libexec
    /usr/texbin

    # HOME 関連のパス
    # $HOME/.rbenv/bin
    $HOME/.phpenv/bin
    $HOME/hack
    $HOME/tools/bin
    $HOME/pear/bin
    $HOME/ec2-tools/bin
    $HOME/misc/bin
    $HOME/include/pear/bin
    $HOME/node_modules/hubot/bin
    $HOME/.ssh/environment
    $HOME/bin/metasploit
    $HOME/.cabal/bin
    $HOME/.denv/bin
    
    # 処理系依存のパス
    /usr/local/flex/bin
    $JAVA_HOME/bin
    $HADOOP_HOME/bin
    $PIG_HOME/bin
    $GOPATH/bin
    /opt/android/tools
    /opt/android/platform-tools
    /usr/local/jmeter/bin
    /Developer/usr/bin
    /Applications/Mozart.app/Contents/Resources/bin
    /usr/local/texlive/2012/bin/x86_64-darwin

    # EC2 関連のパス
    $EC2_USER_HOME/command
    $EC2_HOME/bin
    $AWS_CLOUDFORMATION_HOME/bin
    $AWS_ELB_HOME/bin
    $AWS_RDS_HOME/bin
    $AWS_CLOUDWATCH_HOME/bin
    $AWS_SIMPLE_DB_HOME/bin
    $AWS_EMR_HOME
)

manpath=(
    /usr/local/gnu/man
    $HOME/usr/share
)

dyld_library_path=(
    $HOME/usr/lib
)

ld_library_path=(
    /lib
    /usr/lib
    /usr/local/lib
    $HOME/usr/lib
)

library_path=(
    /usr/lib
    $HOME/lib
    $HOME/usr/lib
)

c_include_path=(
    $HOME/include
)

cplus_include_path=(
    $HOME/include
)
