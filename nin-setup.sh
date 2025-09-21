# nin/und workflow setup

undo() { git reset --hard HEAD; }
und()  { undo; }

# Always edit app.py
ninja() {
  prompt="$*"
  file="app.py"

  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1

  tmpfile=$(mktemp)
  cat "$file" | codex "$prompt" > "$tmpfile" && mv "$tmpfile" "$file"
}
nin() { ninja "$@"; }
