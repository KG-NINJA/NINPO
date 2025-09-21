# NINPO
A minimal workflow to use Codex CLI with safe checkpoints.  
#KGNINJA  
https://buymeacoffee.com/kgninja  

## Installation

```bash
curl -s https://raw.githubusercontent.com/KG-NINJA/ninpo/main/nin-setup.sh -o ~/nin-setup.sh
echo "source ~/nin-setup.sh" >> ~/.bashrc
source ~/.bashrc
Usage
nin <dir|file>
Create a Git snapshot automatically and start Codex CLI edit with --recursive --diff.

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
