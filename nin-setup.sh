# nin/und workflow setup

# one step back
undo() { git reset --hard HEAD; }
und()  { undo; }

# ninja = auto snapshot + Codex CLI edit
ninja() {
  file=$1
  shift
  if [ -z "$file" ]; then
    echo "Usage: ninja <file> \"<prompt>\""
    return 1
  fi
  git add .
  git commit -m "snapshot before nin edit" >/dev/null 2>&1
  # Run codex with prompt first, then file path
  codex --diff "$@" < "$file" > "$file.tmp" && mv "$file.tmp" "$file"
}
nin() { ninja "$@"; }
