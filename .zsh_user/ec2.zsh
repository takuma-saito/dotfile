#!/bin/zsh

_ec2-env() {
    local name="$1" target="$2" handler="$3"
    if [[ ! -f $target ]]; then
        error "file not found \"$target\"."
    else
        gpg -d $target > /tmp/$name
        eval "$handler"
        rm /tmp/$name
    fi
}

# ec2 で環境を用意する
ec2-env() {
    local name="ec2-$1" target="$EC2_DIR/ec2-$1"
    _ec2-env $name $target "source /tmp/$name; _ec2-env-create"
}

# 環境を編集する
ec2-env-edit() {
    local name="ec2-$1" target="$EC2_DIR/ec2-$1"
    _ec2-env $name $target "$EDITOR /tmp/$name; gpg -c /tmp/$name; mv /tmp/$name.gpg $target"
}

ec2-env-create() {
    local name="ec2-$1" target="$EC2_DIR/ec2-$1"
    echo "
#!/bin/zsh
_ec2-env-create() {
}

ec2-env-exit() {
}" > /tmp/$name

    eval "$EDITOR /tmp/$name"
    gpg -c /tmp/$name
    mv /tmp/$name.gpg $target
    rm /tmp/$name
}

ec2-env-list() {
    local index=0
    ls -1 $EC2_DIR/* | while read line; do
        index=$((index + 1))
        echo "${index}: " $(echo $(basename $line) | sed 's/ec2-//g')
    done
}

ec2-env-delete() {
    local name="ec2-$1" target="$EC2_DIR/ec2-$1"
    if [[ ! -f $target ]]; then
        error "file not found \"$target\"."
    else
        rm -i $target
    fi
}
