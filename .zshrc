# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
#source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#-----------------------------------------------------------------

# antigen
source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle fzf
antigen bundle z
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
#antigen theme romkatv/powerlevel10k
antigen apply

# iterm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2_preferences"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# exa
alias ls='exa -l --group-directories-first --color=auto --git --icons --no-permissions --no-user'
alias ll='exa -lahF --group-directories-first --color=auto --git --icons'
alias tree='exa --tree --color=auto --git-ignore -L'

# bat
export BAT_THEME="gruvbox-dark"
alias cat='bat --style=plain --paging=never' # clear

#clear
alias c='clear'

# Vim to recognise the kind of terminal
export TERM="xterm-256color"
alias v="vim"

# fzf
export FZF_BASE=/opt/homebrew/opt/fzf
export FZF_DEFAULT_OPTS="--height 50% \
  --preview='bat --color=always --style=numbers {}' \
  --layout=reverse --info=inline --border \
  --color=bg+:#3c3836,bg:#32302f,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934 \
  --bind shift-up:preview-page-up,shift-down:preview-page-down,up:preview-up,down:preview-down"

# git
alias g='git'
alias ga='git add --verbose'
alias gs='git status --untracked-files --short --branch'
alias gl='git log --oneline'
alias g2l="git log --graph -n 20 --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(green)- %an, %cr%Creset'"
alias g3l="git log --graph -n 20 --pretty=format:'%C(yellow)%h%C(cyan)%d%Creset %s %C(green)- %an, %cr%Creset' --name-status"
alias g4l="git log --stat --oneline"
alias g5l="git log --oneline -p"
alias gsh='git show'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD'
alias gls='git ls-files'

# git config
git config --global user.name "louiskim"
git config --global user.email louiskim.levu@gmail.com
## aliases
git config --global alias.a 'add --verbose'
git config --global alias.s 'status --untracked-files --short --branch'
git config --global alias.l 'log --oneline'
git config --global alias.sh 'show'
git config --global alias.d 'diff'
git config --global alias.co 'checkout'
git config --global alias.c 'commit'

## diff-so-fancy
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"
git config --global color.ui true

git config --global color.diff-highlight.oldNormal    "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal    "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global color.diff.meta       "11"
git config --global color.diff.frag       "magenta bold"
git config --global color.diff.func       "146 bold"
git config --global color.diff.commit     "yellow bold"
git config --global color.diff.old        "red bold"
git config --global color.diff.new        "green bold"
git config --global color.diff.whitespace "red reverse"

# default editor
export EDITOR="vim"
export GIT_EDITOR="vim"
export VISUAL="vim"

# dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

