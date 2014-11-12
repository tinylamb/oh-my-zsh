printf '\033[0;34m%s\033[0m\n' "Upgrading Oh My Zsh"
cd "$ZSH" 
# 双引号中三种特殊字符转义输出 $ \ `
# echo "$ZSH\n" "`pwd`"
if git pull --rebase --stat origin master
#Commands (including the scripts and shell functions we write) issue a value to the system when they terminate, called an exit status.
#常见的 if [ exp ];then 完整是 if test exp;then  分号或换行都能断句
then
  printf '\033[0;32m%s\033[0m\n' '         __                                     __   '
  printf '\033[0;32m%s\033[0m\n' '  ____  / /_     ____ ___  __  __   ____  _____/ /_  '
  printf '\033[0;32m%s\033[0m\n' ' / __ \/ __ \   / __ `__ \/ / / /  /_  / / ___/ __ \ '
  printf '\033[0;32m%s\033[0m\n' '/ /_/ / / / /  / / / / / / /_/ /    / /_(__  ) / / / '
  printf '\033[0;32m%s\033[0m\n' '\____/_/ /_/  /_/ /_/ /_/\__, /    /___/____/_/ /_/  '
  printf '\033[0;32m%s\033[0m\n' '                        /____/                       '
  printf '\033[0;34m%s\033[0m\n' 'Hooray! Oh My Zsh has been updated and/or is at the current version.'
  printf '\033[0;34m%s\033[1m%s\033[0m\n' 'To keep up on the latest news and updates, follow us on twitter: ' 'http://twitter.com/ohmyzsh'
  printf '\033[0;34m%s\033[1m%s\033[0m\n' 'Get your Oh My Zsh swag at: ' 'http://shop.planetargon.com/'
else
  printf '\033[0;31m%s\033[0m\n' 'There was an error updating. Try again later?'
fi
