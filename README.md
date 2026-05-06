# 🧰 OmniSetup: System Bootstrapper

OmniSetup is a lightweight, cross-platform (macOS and Linux) utility designed to bootstrap fresh machines and automatically track your installed tools in version-controlled text files. 

## 🎯 Who is it for?
This tool is built for developers who want a reproducible environment without the overhead of heavy infrastructure tools like Ansible or Nix. It replaces manual installation steps with a streamlined, self-documenting workflow.

## 🚀 First-Time Setup
To set up a fresh machine, clone the repository and run the bootstrap script.
```bash
git clone https://github.com/SinAyByCosAy/OmniSetup.git ~/OmniSetup
cd ~/OmniSetup
chmod +x bootstrap.sh
./bootstrap.sh
source ~/.zshrc
```
### What bootstrap.sh does:  
<ul>
    <li> Installs Homebrew (macOS) or updates apt (Linux). </li>
    <li> Installs Node.js and manages npm globals via NVM. </li>
    <li> Installs all packages previously tracked in your common, OS-specific, and npm lists. </li>
    <li> Creates global symlinks for the add-tool and remove-tool CLI commands. </li>
    <li> Injects shell wrapper functions into your .zshrc or .bashrc.</li>
</ul>    
⚡ Daily Usage: Installing & TrackingOmniSetup operates on a philosophy of explicit intent. You use wrapper commands to install tools, and pass flags to declare how they should be tracked.  1. Install & Track (The Standard Workflow)Use the appropriate wrapper for your package manager, followed by the tool name and tracking flags.  Mac CLI tools: brew-add <tool> [flags]  Mac GUI apps: cask-add <tool> [flags]  Linux tools: apt-add <tool> [flags]  Global NPM packages: npm-add <tool>  Examples:  Bash# Cross-OS CLI tool
brew-add git --common

# Cross-OS GUI application
cask-add vlc --common

# OS-specific tool (tracked only for current OS)
brew-add htop --local

# Tool with a different package name on Linux
brew-add docker --linux-name docker.io
2. Install Only (No Tracking)If you just want to test a tool without permanently adding it to your reproducible environment, omit all flags.  Bash# Installs jq, but does not write it to any text file
brew-add jq
3. Track Only (Already Installed)If you installed a package manually and want to track it retroactively, use the add-tool command directly.  Bashadd-tool git --common
add-tool localtunnel --npm
🗑️ Removing ToolsTo uninstall a package and automatically remove it from your tracked lists, use the tool-rm (or remove-tool) command.  Bash# Removes the tool from the system and ALL tracked lists
tool-rm express

# Scoped removal (removes only from the specified list)
tool-rm vlc --gui
tool-rm typescript --npm
🏷️ Flag ReferenceFlagDescription--commonTracks the tool as available on both macOS and Linux.  --localTracks the tool exclusively for the current OS.  --guiClassifies the tool as a GUI app (uses --cask on macOS).  --npmTracks the tool in npm-global.txt. Cannot be combined with OS flags.  --linux-name <name>Maps a different package name for Linux apt installs.  --no-pushSkips pushing the automated git commit to the remote repository.  Note: You cannot combine --common with --local, nor can you combine --common with --linux-name.  ⚙️ Configuration & Git BehaviorOmniSetup automatically commits file changes when you track or untrack a tool.  By default, automatic pushing to the remote repository is disabled for safety. A config file is automatically generated at ~/.setup-config on first use.  Toggle Auto-Push:  Enable: setup-push-on  Disable: setup-push-off  (You can always override the global config for a single command by passing the --no-push flag.)[cite: 1]🔧 Troubleshooting & Edge Cases[cite: 1]  Repo Moved: If you move the cloned repository to a new directory, your global symlinks will break[cite: 1]. Update them manually by running:
sudo ln -sf "<new-path>/common/add-tool.sh" /usr/local/bin/add-tool[cite: 1]Git Commit Errors: Ensure your git user is configured (git config --global user.name "...")[cite: 1]. The tool will gracefully skip commits if git is not authenticated[cite: 1].Command Not Found: If wrappers like brew-add aren't recognized, run source ~/.zshrc (or .bashrc) to reload your injected shell functions[cite: 1].

