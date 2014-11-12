echo "Removing ~/.oh-my-zsh"
if [[ -d ~/.oh-my-zsh ]] # -d file exists and is a directory
then
  rm -rf ~/.oh-my-zsh
fi

echo "Looking for original zsh config..."
if [ -f ~/.zshrc.pre-oh-my-zsh ] || [ -h ~/.zshrc.pre-oh-my-zsh ]
# -f file exists and is a regular file.regular file 就是一般文本文件
# -h 文件存在 and 是一个符号链接
# if [ -f ~/.zshrc.pre-oh-my-zsh -o -h ~/.zshrc.pre-oh-my-zsh ]
then
  echo "Found ~/.zshrc.pre-oh-my-zsh -- Restoring to ~/.zshrc";

  if [ -f ~/.zshrc ] || [ -h ~/.zshrc ]
  then
    ZSHRC_SAVE=".zshrc.omz-uninstalled-`date +%Y%m%d%H%M%S`";
    echo "Found ~/.zshrc -- Renaming to ~/${ZSHRC_SAVE}"; # {} 避免歧义
    mv ~/.zshrc ~/${ZSHRC_SAVE}; # mv 有rename的作用
  fi

  mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc;

  source ~/.zshrc;
else
  echo "Switching back to bash"
  chsh -s /bin/bash
  source /etc/profile
fi

echo "Thanks for trying out Oh My Zsh. It's been uninstalled."
