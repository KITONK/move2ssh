# Move2SSH

Move2SSH is a handy script for working with `.ssh` directories. It allows you to copy, move, and manage files inside `.ssh`.

## 📥 Installation via Homebrew

```sh
brew tap KITONK/tap
brew install move2ssh
```

## ⚠️ Homebrew Installation Fix

If after installation, the move2ssh command is not found, follow these steps:

1. Create a symbolic link to ensure the move2ssh command works:
    ```sh
    sudo ln -s /opt/homebrew/Cellar/move2ssh/1.0.0/bin/move2ssh.sh /usr/local/bin/move2ssh
    ```

2. After creating the symbolic link, you can use the move2ssh command:
    ```sh
    move2ssh -help
    ```

## 🚀 Usage

```sh
move2ssh [source_folder] [-m] [-help] [-list]
```

### 🔹 Arguments:
- `source_folder` — name of the folder with files to copy.
- `-m` — move files before copying.
- `-help` — show help.
- `-list` — show list of available directories.

### 📌 Examples

✅ **Copy files from `my-folder` to `.ssh`**
```sh
move2ssh my-folder
```

✅ **Move files before copying**
```sh
move2ssh my-folder -m
```

✅ **Show list of available directories**
```sh
move2ssh -list
```

✅ **Show help**
```sh
move2ssh -help
```

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

2. Make the script executable:
   ```sh
   chmod +x move2ssh.sh
   ```

3. Run the script:
   ```sh
   ./move2ssh.sh my-folder
   ```

## 📜 License

This project is licensed under the MIT License.

---

💡 **Author:** [KITO](https://github.com/KITONK)  
🚀 **GitHub:** [Move2SSH](https://github.com/KITONK/move2ssh)

