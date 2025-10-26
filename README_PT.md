<div align="center">
  <img src="github/docs/logo-2.png" alt="logo amnesia" width="200"/>
  <h1>amnesia</h1>
  <sup>Busca fuzzy e checkout de branches Git a partir do seu terminal</sup>
</div>

---

**amnesia** é uma ferramenta de shell para buscar rapidamente e fazer checkout de branches Git utilizando o poder do [`fzf`](https://github.com/junegunn/fzf). Ela agiliza seu fluxo de trabalho tornando a navegação entre branches rápida e interativa.

[Read in English](README.md)

## Funcionalidades

- 🔍 Busca fuzzy para branches locais
- 🚀 Checkout rápido com um único comando
- 📝 Exibe nomes de branches sem trocar
- 🖱️ Seleção interativa de branches
- 🏠 Retorna rapidamente para a branch padrão

## Requisitos

- [fzf](https://github.com/junegunn/fzf) (precisa estar no seu `$PATH`)
- [git](https://git-scm.com/)

## Instalação (no momento)

1. **Instale a dependência fzf**
   ```sh
   sudo apt install fzf
   ```

2. **Clone o repositório:**
   ```sh
   git clone https://github.com/ZaikoXander/amnesia.git
   ```

3. **Inclua o script na configuração do seu shell:**
   ```sh
   # Para bash:
   echo 'source /caminho/para/amnesia/index.sh' >> ~/.bashrc
   # Para zsh:
   echo 'source /caminho/para/amnesia/index.sh' >> ~/.zshrc
   ```

4. **Recarregue seu shell:**
   ```sh
   source ~/.bashrc   # ou
   source ~/.zshrc
   ```

## Uso

| Comando                | Descrição                                       |
|------------------------|-------------------------------------------------|
| `amn`                  | Faz checkout da branch padrão (`main`/`master`)      |
| `amn --pull`           | Faz checkout da branch padrão e puxa as últimas alterações |
| `amn <branch>`         | Busca fuzzy e faz checkout de uma branch       |
| `amn --pull <branch>`  | Busca fuzzy, faz checkout e puxa as últimas alterações |
| `amni`                 | Seleciona interativamente e faz checkout       |
| `amni --pull`          | Seleciona interativamente, faz checkout e puxa as últimas alterações |
| `amnb <branch>`        | Exibe o nome da branch correspondente (sem checkout) |
| `amnbi`                | Seleciona interativamente e exibe o nome da branch   |

### Exemplos

- **Fazer checkout da branch padrão:**
  ```sh
  amn
  ```
- **Fazer checkout da branch padrão e puxar as últimas alterações:**
  ```sh
  amn --pull
  ```
- **Fazer checkout de uma branch pelo nome:**
  ```sh
  amn feat/login
  ```
- **Fazer checkout de uma branch e puxar as últimas alterações:**
  ```sh
  amn --pull feat/login
  ```
- **Selecionar interativamente uma branch para checkout:**
  ```sh
  amni
  ```
- **Selecionar interativamente uma branch, fazer checkout e puxar as últimas alterações:**
  ```sh
  amni --pull
  ```
- **Exibir o nome de uma branch correspondente:**
  ```sh
  amnb fix/typo
  ```
- **Selecionar interativamente e exibir o nome de uma branch:**
  ```sh
  amnbi
  ```

## Contribuindo

Contribuições são bem-vindas! Abra issues ou envie pull requests para melhorar funcionalidades, corrigir bugs ou aprimorar a documentação.

---

<p align="center">
  <sub>Feito com ❤️ por <a href="https://github.com/ZaikoXander">ZaikoXander</a></sub>
</p>
