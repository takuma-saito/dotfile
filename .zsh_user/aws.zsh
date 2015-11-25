#!/bin/zsh
# source /usr/local/share/zsh/site-functions/_aws

alias describe-instances="aws ec2 describe-instances | jq '[.Reservations[].Instances[] | {BlockDevice: [.BlockDeviceMappings[] | {DeviceName, Status: .Ebs.Status, VolumeId: .Ebs.VolumeId}], Tags: [.Tags[] | {(.Key): (.Value)}], PublicIpAddress, State, InstanceId}]' 2>/dev/null"
