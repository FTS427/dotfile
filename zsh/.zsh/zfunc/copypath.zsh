#!/bin/sh
copypath() {
    pwd | wl-copy -n
}

copyfile() {
    cat $@ | wl-copy
}
