# Dotfiles

Personal configuration files managed with GNU Stow and automated with Babashka scripts.

## Overview

This repository contains my dotfiles and system configurations, designed for easy deployment and maintenance across different machines. The setup uses GNU Stow for elegant symlink management and Babashka for powerful, fast-starting Clojure scripts to automate installation and maintenance tasks.

## What's Included

- **Shell Configuration**: Zsh configurations with custom aliases and functions
- **Editor Settings**: Neovim
- **Version Control**: Git configuration and useful aliases
- **Terminal Setup**: Terminal emulator configurations and themes
- **Development Tools**: Language-specific tools and IDE configurations
- **Automation Scripts**: Babashka scripts for installation and maintenance

## Prerequisites

### Required
- **GNU Stow**: For symlink management
- **Babashka**: For running installation and utility scripts
- **Git**: For cloning and version control

### Installation of Prerequisites

**Manually install babashka**
```bash
curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
chmod +x install
./install
```

**Arch Linux**:
```bash
sudo pacman -S stow
yay -S babashka-bin  # or use your preferred AUR helper
```
