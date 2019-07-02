# Setup
### Install iterm2
- `brew cask install iterm2`
- Install a patched font
  - https://github.com/powerline/fonts
- `chsh -s /bin/zsh`
  - switch back to bash: `chsh -s /bin/bash`
  - show all shells: `cat /etc/shells`

### Install Zsh and Oh my Zsh
- `brew install zsh zsh-completions`
- `sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`

### Add Powerlevel9k Zsh Theme
- `git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k`
- edit `~/.zshrc`: `ZSH_THEME="powerlevel9k/powerlevel9k"`



# Websites
### setting
- https://medium.com/@Clovis_app/configuration-of-a-beautiful-efficient-terminal-and-prompt-on-osx-in-7-minutes-827c29391961
- https://www.freecodecamp.org/news/how-to-configure-your-macos-terminal-with-zsh-like-a-pro-c0ab3f3c1156/
### powerlevel9k
- https://github.com/bhilburn/powerlevel9k
- https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config
- https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions
- https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
### Font
https://github.com/powerline/fonts
https://github.com/gabrielelana/awesome-terminal-fonts
https://github.com/ryanoasis/nerd-fonts



# iTerm2 Shortcuts
- command+d 垂直分割
- command+shift+d 水平分割
- shift+command+h 显示复制过的历史记录
- command+enter 全屏与正常窗口大小的切换
