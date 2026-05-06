# 🧰 OmniSetup: Declarative System Bootstrapper

OmniSetup is a lightweight, cross-platform (macOS and Linux) utility designed to bootstrap fresh machines and automatically track your installed tools in version-controlled text files. 

## 🎯 Who is it for?
This tool is built for developers who frequently switch between macOS and Linux machines and want a reproducible environment without the overhead of heavy infrastructure tools like Ansible or Nix. It replaces manual installation steps with a streamlined, self-documenting workflow.

## 🚀 First-Time Setup
To set up a fresh machine, clone the repository and run the bootstrap script.
```bash
git clone [https://github.com/SinAyByCosAy/system-setup.git](https://github.com/SinAyByCosAy/system-setup.git) ~/system-setup
cd ~/system-setup
chmod +x bootstrap.sh
./bootstrap.sh
source ~/.zshrc