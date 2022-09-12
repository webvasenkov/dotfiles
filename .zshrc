export ZSH="/home/vd/.oh-my-zsh"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export UPDATE_ZSH_DAYS=3

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH"

ZSH_THEME="dracula"

ENABLE_CORRECTION="true"

plugins=(
  zsh-autosuggestions
  last-working-dir
  history
  web-search
  extract
  sudo
  z
)

source $ZSH/oh-my-zsh.sh
source /home/vd/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# common aliases
alias upd="source ~/.zshrc"
alias ncra="npx create-react-app "
alias myip="curl http://ipecho.net/plain; echo"
alias cl="clear"
alias md="mkdir "
alias t="touch "
alias pacupd="sudo pacman -Suy && yay"
alias ls="exa -al --color=always --group-directories-first"
alias config='/usr/bin/git --git-dir=$HOME/Dev/dotfiles/ --work-tree=$HOME' # manage dotfiles
alias eng="firefox https://www.youtube.com/watch\?v\=OV2RDbODPso\&list\=PLYB0SmefqEsniU1UbGzrfhNCV3noALHj7\&index\=152"

# docker aliases
alias dc="docker-compose"
alias dclear="docker container rm -f $(docker container ls -qa); docker image rm -f $(docker image ls -q)"

# bluetooth
alias bl="bluetoothctl"
alias br="bl power on && bl connect 6C:D3:EE:20:C6:78"
alias bj="bl power on && bl connect 70:99:1C:57:7B:A3"
 
# git aliases
function gc { git commit -m "$@"; }
alias gclone="git clone";
alias gcm="git checkout master";
alias gs="git status";
alias gpull="git pull";
alias gf="git fetch";
alias gfa="git fetch --all";
alias gf="git fetch origin";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch";
alias gbr="git branch remote"
alias gfr="git remote update"
alias gbn="git checkout -B "
alias grf="git reflog";
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git gpush --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"

# npm aliases
alias ni="npm install";
alias nrs="npm run start -s --";
alias nrb="npm run build -s --";
alias nrd="npm run dev -s --";
alias nrt="npm run test -s --";
alias nrtw="npm run test:watch -s --";
alias nrv="npm run validate -s --";
alias flush-npm="rm -rf node_modules package.json.lock && npm i && echo NPM is done";

# yarn aliases
alias yar="yarn run"; # lists all the scripts we have available
alias yab="yarn build"; # build dist directory for each package
alias yal="yarn lint:fix"; # format source and auto-fix eslint issues
alias yac="yarn commit"; # open a Q&A prompt to help construct valid commit messages
alias yas="yarn start";
alias yasb="yarn storybook:start"; # start storybook
alias yat="yarn test"; # run the unit tests*
alias yatw="yarn test:watch"; #run the unit tests for files changed on save

# expo aliases
alias ei="expo install";
alias es="expo start";
alias esa="expo start --android";

# key binding
bindkey '^ ' autosuggest-accept;

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
