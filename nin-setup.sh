# nin/und workflow setup

undo() { git reset --hard HEAD; }
und()  { undo; }

# nin <file|dir>... <prompt...>
ninja() {
  if [ $# -lt 2 ]; then
    echo "Usage: nin <file|dir>... <prompt...>"
    return 1
  fi

  # 引数の中から既存のファイル/ディレクトリとプロンプトを分ける
  targets=()
  while [ $# -gt 0 ]; do
    if [ -e "$1" ]; then
      targets+=("$1")
      shift
    else
      break
    fi
  done

  prompt="$*"

  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1

  for target in "${targets[@]}"; do
    if [ -d "$target" ]; then
      files=$(find "$target" -type f -name "*.py")
      for f in $files; do
        tmpfile=$(mktemp)
        cat "$f" | codex "$prompt" > "$tmpfile" && mv "$tmpfile" "$f"
      done
    else
      tmpfile=$(mktemp)
      cat "$target" | codex "$prompt" > "$tmpfile" && mv "$tmpfile" "$target"
    fi
  done
}
nin() { ninja "$@"; }
