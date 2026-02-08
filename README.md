# macOS dotfiles

Managed with GNU Stow.

## Tools

| Category        | Tools                                 |
| --------------- | ------------------------------------- |
| Editor          | Neovim                                |
| Terminal        | WezTerm                               |
| Shell           | Zsh (Powerlevel10k)                   |
| Multiplexer     | Tmux                                  |
| Version Control | Git, Jujutsu                          |
| Formatters      | Prettier, Black, Stylua, gofmt, shfmt |
| Linters         | ESLint, Ruff, Codespell               |
| Package Manager | Homebrew                              |

## Keymaps

> **NOTE** Use `:map` to inspect all active mappings.

### General Editing

| Keymap       | Mode   | Action           | Description                   |
| ------------ | ------ | ---------------- | ----------------------------- |
| `jk`         | Insert | Exit insert mode | Leave insert mode             |
| `<leader>+`  | Normal | Increment        | Increment number under cursor |
| `<leader>-`  | Normal | Decrement        | Decrement number under cursor |
| `<leader>cs` | Normal | Clear search     | Clear search highlights       |

### File Navigation

| Keymap       | Mode   | Action    | Description                  |
| ------------ | ------ | --------- | ---------------------------- |
| `<leader>ff` | Normal | Find file | Telescope file picker        |
| `<leader>fg` | Normal | Grep      | Telescope live grep          |
| `<leader>fb` | Normal | Buffers   | Telescope buffer list        |
| `<leader>fh` | Normal | Help      | Telescope help tags          |
| `:Ex`        | Normal | Explorer  | Toggle file explorer (netrw) |

### LSP

| Keymap | Mode   | Action           | Description              |
| ------ | ------ | ---------------- | ------------------------ |
| `grr`  | Normal | References       | List references          |
| `gri`  | Normal | Implementation   | Go to implementation     |
| `grt`  | Normal | Type definition  | Go to type definition    |
| `gO`   | Normal | Document symbols | Show document symbols    |
| `K`    | Normal | Hover            | Show hover documentation |

### Actions

| Keymap  | Mode          | Action         | Description             |
| ------- | ------------- | -------------- | ----------------------- |
| `grn`   | Normal        | Rename         | Rename symbol           |
| `gra`   | Normal/Visual | Code action    | Show available actions  |
| `<C-s>` | Insert        | Signature help | Show function signature |

### Diagnostics

| Keymap       | Mode   | Action        | Description                     |
| ------------ | ------ | ------------- | ------------------------------- |
| `[d`         | Normal | Previous      | Jump to previous diagnostic     |
| `]d`         | Normal | Next          | Jump to next diagnostic         |
| `<leader>xq` | Normal | Quickfix      | Send diagnostics to quickfix    |
| `<leader>xl` | Normal | Location list | Send diagnostics to loclist     |
| `<leader>xf` | Normal | Float         | Show diagnostic in float window |
| `<leader>xd` | Normal | Toggle        | Enable/disable diagnostics      |
| `<leader>xt` | Normal | Virtual text  | Toggle virtual text diagnostics |

### Git

| Keymap       | Mode            | Action           | Description                      |
| ------------ | --------------- | ---------------- | -------------------------------- |
| `[c`         | Normal          | Prev hunk        | Jump to previous git hunk        |
| `]c`         | Normal          | Next hunk        | Jump to next git hunk            |
| `<leader>hs` | Normal          | Stage hunk       | Stage current hunk               |
| `<leader>hr` | Normal          | Reset hunk       | Reset current hunk               |
| `<leader>hs` | Visual          | Stage hunk       | Stage selected hunk              |
| `<leader>hr` | Visual          | Reset hunk       | Reset selected hunk              |
| `<leader>hS` | Normal          | Stage buffer     | Stage entire buffer              |
| `<leader>hR` | Normal          | Reset buffer     | Reset entire buffer              |
| `<leader>hp` | Normal          | Preview hunk     | Preview hunk diff                |
| `<leader>hi` | Normal          | Preview inline   | Preview hunk inline              |
| `<leader>hb` | Normal          | Blame line       | Show full blame for current line |
| `<leader>hd` | Normal          | Diff buffer      | Diff buffer against index        |
| `<leader>hD` | Normal          | Diff last commit | Diff buffer against last commit  |
| `<leader>hq` | Normal          | Quickfix hunks   | Populate quickfix with hunks     |
| `<leader>hQ` | Normal          | Quickfix all     | Populate quickfix with all hunks |
| `<leader>tb` | Normal          | Toggle blame     | Toggle inline blame              |
| `<leader>tw` | Normal          | Toggle diff      | Toggle word diff                 |
| `ih`         | Operator/Visual | Select hunk      | Select git hunk text object      |

### Editing Utilities

#### Surround

| Keymap         | Mode   | Action             |
| -------------- | ------ | ------------------ |
| `ys{motion}`   | Normal | Surround           |
| `yss`          | Normal | Surround line      |
| `ds{char}`     | Normal | Delete surround    |
| `cs{old}{new}` | Normal | Change surround    |
| `S`            | Visual | Surround selection |

#### Refactoring

| Keymap      | Mode   | Action   |
| ----------- | ------ | -------- |
| `<leader>r` | Visual | Refactor |

#### Database

| Keymap       | Mode   | Action    | Description     |
| ------------ | ------ | --------- | --------------- |
| `<leader>db` | Normal | Open UI   | Database UI     |
| `<leader>dt` | Normal | Toggle UI | Database UI     |
| `<leader>da` | Normal | Add       | Connection      |
| `<leader>df` | Normal | Find      | Database buffer |
