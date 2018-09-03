source "${0:A:h}"/fzf_helpers.sh
source "${0:A:h}"/fzf_git.sh
source "${0:A:h}"/fzf_hg.sh

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-helper f b t r i
unset -f bind-helper
