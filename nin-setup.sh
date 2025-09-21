# nin/und workflow setup

undo() { git reset --hard HEAD; }
und()  { undo; }

ninja() {
  file=$1
  shift
  if [ -z "$file" ]; then
    echo "Usage: nin <file> \"<prompt>\""
    return 1
  fi
  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1

  # ファイル内容を codex に渡し、出力で上書き
  prompt="$*"
  tmpfile=$(mktemp)
  cat "$file" | codex "$prompt" > "$tmpfile" && mv "$tmpfile" "$file"
}
nin() { ninja "$@"; }
