alias l="ls -la --color=auto"
alias grep="grep --color=auto"

# PATH Variables

export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Environment Variables

export COMPOSE_BAKE=true

# Terminal prompt configuration with colors and Git repository info

RED=$'\e[0;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[0;33m'
BLUE=$'\e[0;34m'
PURPLE=$'\e[1;35m'
CYAN=$'\e[0;36m'
WHITE=$'\e[0;37m'
NC=$'\e[0m'

git_info() {
  if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    repo=$(basename "$(git rev-parse --show-toplevel)" 2>/dev/null)
    branch=$(git symbolic-ref --short HEAD 2>/dev/null)
    if git rev-parse --abbrev-ref @{u} > /dev/null 2>&1; then
      ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
    else
      ahead=0
    fi
    echo "${PURPLE}[${repo} | ${branch} | ${ahead}]${NC} "
  fi
}

export PS1="\[${GREEN}\]\u@\h\[${NC}\]:\[${CYAN}\]\w\[${NC}\] \$(git_info)\n> "

clear
