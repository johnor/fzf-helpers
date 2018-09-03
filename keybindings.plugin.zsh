source "${0:A:h}"/fzf_helpers.sh
source "${0:A:h}"/fzf_git.sh
source "${0:A:h}"/fzf_hg.sh

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { zle reset-prompt; LBUFFER+=\$(g$c | join-lines) } "
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r i
unset -f bind-git-helper
