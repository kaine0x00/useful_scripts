# Useful zsh/bash func to parse txt files dynamically
function contents() {
  if [[ -z "$1" ]]; then
    echo "Usage: contents <filename>"
    return 1
  fi

  local file="$1"
  if [[ ! -f "$file" ]]; then
    echo "Error: File '$file' not found!"
    return 1
  fi

  if command -v rg &>/dev/null; then
    cat "$file" | rg --line-number --color=always "" | fzf --ansi
  else
    cat "$file" | grep --line-number --color=always "" | fzf --ansi
  fi
}
