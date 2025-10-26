<div align="center">
  <img src="github/docs/logo-2.png" alt="amnesia logo" width="200"/>
  <h1>amnesia</h1>
  <sup>Fuzzy search and checkout Git branches from your terminal</sup>
</div>

---

**amnesia** is a shell utility for quickly searching and checking out Git branches using the power of [`fzf`](https://github.com/junegunn/fzf). It streamlines your workflow by making branch navigation fast and interactive.

[Leia em português](README_PT.md)

## Features

- 🔍 Fuzzy search for local branches
- 🚀 Fast checkout with a single command
- 📝 Print branch names without switching
- 🖱️ Interactive branch selection
- 🏠 Quickly return to the default branch

## Requirements

- [fzf](https://github.com/junegunn/fzf) (must be in your `$PATH`)
- [git](https://git-scm.com/)

## Installation (at the moment)

1. **Install fzf dependency**
   ```sh
   sudo apt install fzf
   ```

2. **Clone the repository:**
   ```sh
   git clone https://github.com/ZaikoXander/amnesia.git
   ```

3. **Source the script in your shell config:**
   ```sh
   # For bash:
   echo 'source /path/to/amnesia/index.sh' >> ~/.bashrc
   # For zsh:
   echo 'source /path/to/amnesia/index.sh' >> ~/.zshrc
   ```

4. **Reload your shell:**
   ```sh
   source ~/.bashrc   # or
   source ~/.zshrc
   ```

## Usage

| Command                | Description                                      |
|------------------------|--------------------------------------------------|
| `amn`                  | Checkout the default branch (`main`/`master`)    |
| `amn --pull`           | Checkout the default branch and pull latest changes |
| `amn <branch>`         | Fuzzy-search and checkout a branch               |
| `amn --pull <branch>`  | Fuzzy-search, checkout a branch, and pull latest changes |
| `amni`                 | Interactively select and checkout a branch       |
| `amni --pull`          | Interactively select, checkout a branch, and pull latest changes |
| `amnb <branch>`        | Print matching branch name (no checkout)         |
| `amnbi`                | Interactively select and print branch name       |

### Examples

- **Checkout the default branch:**
  ```sh
  amn
  ```
- **Checkout the default branch and pull latest changes:**
  ```sh
  amn --pull
  ```
- **Checkout a branch by name:**
  ```sh
  amn feat/login
  ```
- **Checkout a branch and pull latest changes:**
  ```sh
  amn --pull feat/login
  ```
- **Interactively select a branch to checkout:**
  ```sh
  amni
  ```
- **Interactively select a branch, checkout and pull latest changes:**
  ```sh
  amni --pull
  ```
- **Print a matching branch name:**
  ```sh
  amnb fix/typo
  ```
- **Interactively print a branch name:**
  ```sh
  amnbi
  ```

## Contributing

Contributions are welcome! Please open issues or submit pull requests to improve features, fix bugs, or enhance documentation.

---

<p align="center">
  <sub>Made with ❤️ by <a href="https://github.com/ZaikoXander">ZaikoXander</a></sub>
</p>
