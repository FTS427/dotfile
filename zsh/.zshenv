typeset -U path PATH
path=(
  ~/.local/bin 
  ~/.dotnet/tools 
  /opt/android-sdk/platform-tools 
  $path
  )

export PATH
export ZFILE=~/.zsh
export ZFUNC=~/.zsh/zfunc
export ZPLUG_SYS=/usr/share/zsh/plugins
export LNAG=en_US.UTF-8
export EDITOR=/usr/bin/vim
export SKIM_DEFAULT_OPTIONS="--color=fg:#${nord6},bg:#${nord0},matched:#${nord4},matched_bg:#${nord3},current:#${nord6},current_bg:#${nord2},current_match:#${nord5},current_match_bg:#${nord2},spinner:#${nord10},info:#${nord14},prompt:#${nord7},cursor:#${nord7},selected:#${nord8},header:#${nord3},border:#${nord8} \ 
      --no-clear-start \ 
      --layout reverse \ 
      --height 20% \ 
      --ansi -i -c 'rg --color=always --line-number \"{}\"'"
export REPO_URL='https://mirrors.tuna.tsinghua.edu.cn/git/git-repo'
export BAT_THEME="Nord"
