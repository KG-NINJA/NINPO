# nin/und workflow setup

# step back
undo() { git reset --hard HEAD; }
und()  { undo; }

# nin = auto snapshot + Codex CLI edit
ninja() {
  file=$1
  shift
  if [ -z "$file" ]; then
    echo "Usage: ninja <file> \"<prompt>\""
    return 1
  fi
  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1
  # ファイル内容を標準入力に渡して出力で上書き
  codex "$@" < "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}
nin() { ninja "$@"; }
