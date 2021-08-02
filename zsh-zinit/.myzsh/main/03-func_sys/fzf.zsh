#!/bin/zsh

#######################################
# FZF deserves its own config         #
# Don't move it to zsh_config.zsh     #
#######################################

export FZF_COMPLETION_TRIGGER='\'

# export FZF_DEFAULT_OPTS="--no-mouse --height 50% -1 --reverse --multi --inline-info --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || cat {}) 2> /dev/null | head -300' --preview-window='right:hidden:wrap' --bind='f3:execute(bat --style=numbers {} || less -f {}),f2:toggle-preview,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-a:select-all+accept,ctrl-y:execute-silent(echo {+} | pbcopy),ctrl-x:execute(rm -i {+})+abort'"

# export FZF_DEFAULT_OPTS="--prompt '⯈ ' --marker=+ --keep-right --color=dark --layout=reverse --color=fg:250,fg+:15,hl:203,hl+:203 --color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15"

# NOTE YuSoLi: Open preview by default. Can not be completely compatible with other softwares.
# export FZF_DEFAULT_OPTS="--multi --keep-right --preview='[[ -d {} ]] && tree -C {} | head -200 || bat --style=numbers --color=always --line-range :500 {}' --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-\:toggle-preview'"

export FZF_DEFAULT_OPTS="--multi --keep-right --bind='ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-n:preview-page-down,ctrl-p:preview-page-up,ctrl-\:toggle-preview'"

# Configure fzf, command line fuzzyf finder
# FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules --exclude .npm"
# Ignoring files will be handled by ~/.fdignore
FD_OPTIONS="--hidden --follow"

# Use git-ls-files inside git repo, otherwise fd
# export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS || git ls-files --cached --others --exclude-standard"
export FZF_DEFAULT_COMMAND="fd $FD_OPTIONS"

export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# Options to fzf command
export FZF_COMPLETION_OPTS="-x"

_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}

_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)         fzf "$@" --preview '[[ -d {} ]] && tree -C {} | head -200 || bat --style=numbers --color=always --line-range :500 {}' ;;
    # cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig {}' ;;
    nvim)         fzf "$@" --preview '[[ -d {} ]] && tree -C {} | head -200 || bat --style=numbers --color=always --line-range :500 {}' ;;
    # nvim)         fzf "$@" --preview 'bat --style=numbers --color=always --line-range :500 {}' ;;
    *)            fzf "$@" ;;
  esac
}

