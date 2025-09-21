# nin/und workflow setup

undo() { git reset --hard HEAD; }
und()  { undo; }

ninja() {
  prompt=$1
  file=$2
  if [ -z "$prompt" ] || [ -z "$file" ]; then
    echo "Usage: nin \"<prompt>\" <file>"
    return 1
  fi
  shift 2
  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1

  # ファイル内容を Codex に食わせて出力を上書き
  tmpfile=$(mktemp)
  cat "$file" | codex "$prompt" > "$tmpfile" && mv "$tmpfile" "$file"
}
nin() { ninja "$@"; }
