fzf-down() {
   fzf --height 50% "$@" --border
}

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

gt() {
   is_in_git_repo && git-tags
   is_in_hg_repo && hg-tags
}

ftags() {
  local line
  [ -e tags ] &&
  line=$(
    awk 'BEGIN { FS="\t" } !/^!/ {print toupper($4)"\t"$1"\t"$2"\t"$3}' tags |
    cut -c1-80 | fzf --nth=1,2
  ) && ${EDITOR:-vim} $(cut -f3 <<< "$line") -c "set nocst" \
                                      -c "silent tag $(cut -f2 <<< "$line")"
}

vl() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && "${EDITOR}" "${file}" || return 1
}
