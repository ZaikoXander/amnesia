<div align="center">
  <img src="github/docs/logo-2.png" alt="amnesia logo" width="200"/>
  <h1>amnesia</h1>
  <sup>Fuzzy search and checkout Git branches from your terminal</sup>
</div>

---

**amnesia** is a shell utility for quickly searching and checking out Git branches using the power of [`fzf`](https://github.com/junegunn/fzf). It streamlines your workflow by making branch navigation fast and interactive.

## Features

- 🔍 Fuzzy search for local branches
- 🚀 Fast checkout with a single command
- 📝 Print branch names without switching
- 🖱️ Interactive branch selection
- 🏠 Quickly return to the default branch

## Requirements

- [fzf](https://github.com/junegunn/fzf) (must be in your `$PATH`)
- [git](https://git-scm.com/)

## Installation(at the moment)

1. **Clone the repository:**
   ```sh
   git clone https://github.com/ZaikoXander/amnesia.git
   ```

2. **Source the script in your shell config:**
   ```sh
   # For bash:
   echo 'source /path/to/amnesia/index.sh' >> ~/.bashrc
   # For zsh:
   echo 'source /path/to/amnesia/index.sh' >> ~/.zshrc
   ```

3. **Reload your shell:**
   ```sh
   source ~/.bashrc   # or
   source ~/.zshrc
   ```

## Usage

| Command                | Description                                      |
|------------------------|--------------------------------------------------|
| `amn <branch>`         | Fuzzy-search and checkout a branch               |
| `amni`                 | Interactively select and checkout a branch       |
| `amnb <branch>`        | Print matching branch name (no checkout)         |
| `amnbi`                | Interactively select and print branch name       |
| `amn`                  | Checkout the default branch (`main`/`master`)    |

### Examples

- **Checkout a branch by name:**
  ```sh
  amn feature/login
  ```
- **Interactively select a branch to checkout:**
  ```sh
  amni
  ```
- **Print a matching branch name:**
  ```sh
  amnb fix/typo
  ```
- **Interactively print a branch name:**
  ```sh
  amnbi
  ```
- **Checkout the default branch:**
  ```sh
  amn
  ```

## Contributing

Contributions are welcome! Please open issues or submit pull requests to improve features, fix bugs, or enhance documentation.

---

<p align="center">
  <sub>Made with ❤️ by <a href="https://github.com/ZaikoXander">ZaikoXander</a></sub>
</p>
