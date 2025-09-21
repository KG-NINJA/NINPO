# NINPO
A minimal workflow to use Codex CLI with safe checkpoints.  
#KGNINJA  
https://buymeacoffee.com/kgninja  

## License

This project uses the **MIT License**.  
All source files under `src/` include a license header automatically added by the `nin` workflow.

---

## Progress

- Integrated Codex CLI with `ninpo` minimal workflow  
- Successfully applied MIT license headers across multiple files  
- Safe and reproducible checkpoints with `nin` / `und` commands  

## Installation

```bash
curl -s https://raw.githubusercontent.com/KG-NINJA/NINPO/main/nin-setup.sh -o ~/nin-setup.sh
echo "source ~/nin-setup.sh" >> ~/.bashrc
source ~/.bashrc
Usage
Single file

bash
Copy code
nin app.py add a comment line at the top
Multiple files

bash
Copy code
nin app.py utils.py refactor print to logging
Directory

bash
Copy code
nin src/ add license header to each file
Undo

bash
Copy code
und
Restore to the previous Git snapshot.

Requirements
bash or zsh

git

Codex CLI

Notes
Each nin command makes a Git commit named snapshot before nin edit.

Use und to reset to the last snapshot instantly.

For cleanup, squash snapshot commits with git rebase -i if needed.
