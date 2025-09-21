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

  # ファイルを入力に流し、Codexの出力で上書き
  tmpfile=$(mktemp)
  cat "$file" | codex "$@" > "$tmpfile" && mv "$tmpfile" "$file"
}
nin() { ninja "$@"; }
