# Move2SSH

Move2SSH is a handy script for working with `.ssh` directories. It allows you to copy, move, and manage files inside `.ssh` with automatic Git configuration updates.

## 📥 Installation via Homebrew

```sh
brew tap KITONK/tap
brew install move2ssh
```

## ⚠️ Homebrew Installation Fix

If after installation, the move2ssh command is not found, follow these steps:

1. Create a symbolic link to ensure the move2ssh command works:
    ```sh
    sudo ln -s /opt/homebrew/Cellar/move2ssh/1.2.0/bin/move2ssh.sh /usr/local/bin/move2ssh
    ```

2. After creating the symbolic link, you can use the move2ssh command:
    ```sh
    move2ssh --h
    ```
    or
    ```sh
    move2ssh --help
    ```

## 📁 Directory Structure
   ~/.ssh/
   ├── personal/
   │ ├── id_rsa
   │ ├── id_rsa.pub
   │ └── gitconfig
   ├── work/
   │ ├── id_rsa
   │ ├── id_rsa.pub
   │ └── gitconfig
   └── ...


## 🚀 Usage

```sh
move2ssh [source_folder] [--m|--move] [--h|--help] [--l|--list] [--b|--backup]
```

### 🔹 Arguments:
- `source_folder` — name of the folder with files to copy.
- `--m | --move` — move existing files to a new folder before copying from source folder.
- `--h | --help` — show help message.
- `--l | --list` — show list of all directories inside .ssh.
- `--b | --backup` - create a backup of current .ssh files before replacing them.

### 🔄 Git Configuration
Each SSH configuration folder can contain a `gitconfig` file with the following format:
user.name=John Doe
user.email=john@example.com


### 📌 Examples

✅ **Copy files from `personal` to `.ssh` and update Git config**
```sh
move2ssh personal
```

✅ **Move existing files to a new folder before copying from source folder**
```sh
move2ssh work --m
```

or

```sh
move2ssh work --move
```

✅ **Show list of available directories**
```sh
move2ssh --l
```

or

```sh
move2ssh --list
```

✅ **Show help message**
```sh
move2ssh --h
```

or

```sh
move2ssh --help
```

✅ **Create a backup of current .ssh files before replacing them**
```sh
move2ssh --b
```

or

```sh
move2ssh --backup
```

## 🔤 Shell Completion

Move2SSH supports command completion in various shells:
- Zsh
- Bash
- Fish
- PowerShell
- WSL
- Git Bash

Tab completion works for both folder names and options:
```sh
move2ssh [TAB]          # Shows available configurations
move2ssh -[TAB]         # Shows available options
```

## 💻 Supported Environments

- macOS (Bash, Zsh)
- Linux (Bash, Zsh)
- Windows Subsystem for Linux (WSL)
- Git Bash
- PowerShell

## 🔄 Update

```sh
brew upgrade move2ssh
```

## ❌ Uninstall

```sh
brew uninstall move2ssh
```

## 🛠 Development

1. Clone the repository:
   ```sh
   git clone https://github.com/KITONK/move2ssh.git
   cd move2ssh
   ```

2. Project structure:
   ```
   move2ssh/
   ├── bin/
   │   └── move2ssh
   ├── completions/
   │   ├── bash/
   │   ├── fish/
   │   ├── powershell/
   │   └── zsh/
   └── Formula/
   ```

3. Make the script executable:
   ```sh
   chmod +x bin/move2ssh
   ```

4. Run the script:
   ```sh
   ./bin/move2ssh personal
   ```

## 🔒 Security Features

- Automatically sets correct permissions (700 for .ssh, 600 for private keys)
- Creates backups when using --backup
- Safe file movement with --move option

## 📜 License

This project is licensed under the MIT License.

---

💡 **Author:** [KITO](https://github.com/KITONK)  
🚀 **GitHub:** [Move2SSH](https://github.com/KITONK/move2ssh)