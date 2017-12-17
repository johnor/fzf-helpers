
gf() {
   is_in_git_repo && git-file
   is_in_hg_repo && hg-file
}

gb() {
   is_in_git_repo && git-branch
   is_in_hg_repo && hg-branch
}

gi() {
   is_in_git_repo && git-history
   is_in_hg_repo && hg-history
}

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
