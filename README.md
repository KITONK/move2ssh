# Move2SSH

Move2SSH is a handy script for working with `.ssh` directories. It allows you to copy, move, and manage files inside `.ssh`.

## 📥 Installation via Homebrew

```sh
brew tap username/tap
brew install move2ssh
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
   git clone https://github.com/username/move2ssh.git
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

