#!/usr/bin/env zsh

#根据时间戳差异来决定是否更新
zmodload zsh/datetime

function _current_epoch() {
  echo $(( $EPOCHSECONDS / 60 / 60 / 24 ))
}

function _update_zsh_update() {
  echo "LAST_EPOCH=$(_current_epoch)" >! ~/.zsh-update # 重定向的时候如果不存在目的文件则创建
}

function _upgrade_zsh() {
  env ZSH=$ZSH /bin/sh $ZSH/tools/upgrade.sh
  # update the zsh file
  _update_zsh_update
}

epoch_target=$UPDATE_ZSH_DAYS
if [[ -z "$epoch_target" ]]; then #The length of string is zero
  # Default to old behavior
  epoch_target=13
fi

[ -f ~/.profile ] && source ~/.profile
#With the && operator, command1 is executed and command2 is executed if, and only if, command1 is successful. 

# Cancel upgrade if the current user doesn't have write permissions for the
# oh-my-zsh directory.
[[ -w "$ZSH" ]] || return 0
# With the || operator, command1 is executed and command2 is executed if, and only if, command1 is unsuccessful.

if [ -f ~/.zsh-update ]
then
  . ~/.zsh-update
  #source(.) File 在当前sh环境下读取并执行File中的命令

  if [[ -z "$LAST_EPOCH" ]]; then
    _update_zsh_update && return 0;
  fi

  epoch_diff=$(($(_current_epoch) - $LAST_EPOCH))
  if [ $epoch_diff -gt $epoch_target ]
  then
    if [ "$DISABLE_UPDATE_PROMPT" = "true" ] # string1 and string2 are equal. Single or double
    then
      _upgrade_zsh
    else
      echo "[Oh My Zsh] Would you like to check for updates?"
      echo "Type Y to update oh-my-zsh: \c"
      read line
      if [ "$line" = Y ] || [ "$line" = y ]; then
        _upgrade_zsh
      else
        _update_zsh_update
      fi
    fi
  fi
else
  # create the zsh file
  _update_zsh_update
fi

