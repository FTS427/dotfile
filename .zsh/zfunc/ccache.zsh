#!/bin/sh

export USE_CCACHE=1
export CCACHE_SLOPPINESS=file_macro,include_file_mtime,time_macros
export CCACHE_UMASK=002
export CCACHE_DIR=/var/tmp/ccache
#ccache -M 50G
#ccache -o compression=true
