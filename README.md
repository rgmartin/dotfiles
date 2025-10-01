# Dotfiles

My personal configuration files managed with [Mackup](https://github.com/lra/mackup).

## What's Included

- Shell configuration (`.zshrc`, `.bash_profile`)
- Editor configs (Neovim, Vim, IdeaVim)
- Development tools (Git, Docker, Poetry)
- Terminal configs (Warp, Hammerspoon, P10k)
- Application preferences (VS Code, DBeaver, VLC)

## Setup on a New Computer

### Prerequisites

1. Install Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install Mackup:
```bash
brew install mackup
```

3. Install Git (if not already installed):
```bash
brew install git
```

### Installation Steps

1. Clone this repository:
```bash
git clone https://github.com/rgmartin/dotfiles.git ~/dotfiles
```

2. Create Mackup configuration file:
```bash
cat > ~/.mackup.cfg << 'EOF'
[storage]
engine = file_system
path = dotfiles

[applications_to_ignore]
aws
iterm2
iterm
EOF
```

3. Restore dotfiles using Mackup:
```bash
mackup restore
```

This will create symlinks from your home directory to the files in `~/dotfiles/Mackup/`.

4. Create private environment file (for sensitive tokens):
```bash
touch ~/.env_private
chmod 600 ~/.env_private
```

Add your private environment variables to `~/.env_private`:
```bash
# Example:
export SAI_REPO_PAT_TOKEN=your_token_here
```

5. Restart your shell or source the configuration:
```bash
source ~/.zshrc
```

## Managing Dotfiles

### Backup Changes

When you make changes to your dotfiles, run:
```bash
mackup backup
```

This will update the files in `~/dotfiles/Mackup/` and ensure they're symlinked properly.

### Commit and Push Changes

```bash
cd ~/dotfiles
git add -A
git commit -m "Update dotfiles"
git push
```

### Add New Dotfiles

Mackup automatically manages many common applications. To see the full list:
```bash
mackup list
```

For custom files, you can add them to `~/.mackup.cfg` or manually copy them to the Mackup folder and create symlinks.

## Security Notes

The following files are **not** tracked in git (see `.gitignore`):
- Azure tokens (`~/.azure/msal_token_cache.json`)
- SSH keys and config (`~/.ssh/`)
- Kubernetes config (`~/.kube/config`)
- Database credentials (DBeaver)
- Private environment variables (`~/.env_private`)

Always store sensitive information in `~/.env_private` or similar files that are gitignored.

## Troubleshooting

### Mackup asks to replace files
If Mackup asks whether to replace existing files, use `--force` to automatically answer yes:
```bash
mackup backup --force
```

### Files aren't symlinked
Run `mackup backup` to convert regular files to symlinks.

### Restore fails
If restore fails due to existing files, you may need to manually remove or backup the conflicting files first.
