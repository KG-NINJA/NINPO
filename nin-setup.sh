# nin/und workflow setup

# one step back
undo() { git reset --hard HEAD; }
und()  { undo; }

# nin = auto snapshot + Codex CLI edit
ninja() {
  target=${1:-src/}
  shift
  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1
  codex edit "$target" --recursive --diff "$@"
}
nin() { ninja "$@"; }
