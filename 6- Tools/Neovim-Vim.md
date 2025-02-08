## Basic Movement

- `h` - Move cursor left.
- `j` - Move cursor down.
- `k` - Move cursor up.
- `l` - Move cursor right.
- `0` - Move to the start of the line.
- `$` - Move to the end of the line.
- `G` - Move to the end of the file.
- `gg` - Move to the start of the file.
- `<C-g>` - Show cursor location and file status.
- `number G` - Move to a specific line number.

## Editing Commands

- `x` - Delete the character under the cursor.
- `dw` - Delete a word.
- `d$` - Delete to the end of the line.
- `dd` - Delete the entire line.
- `u` - Undo the last change.
- `U` - Undo all changes on the current line.
- `<C-r>` - Redo the last undone change.
- `p` - Paste text after the cursor.
- `P` - Paste text before the cursor.
- `r` - Replace the character under the cursor.
- `R` - Enter Replace mode (replace multiple characters).
- `ce` - Change text until the end of the word.
- `c$` - Change text until the end of the line.
- `o` - Open a new line below the cursor and enter Insert mode.
- `O` - Open a new line above the cursor and enter Insert mode.
- `a` - Append text after the cursor.
- `A` - Append text at the end of the line.
- `i` - Insert text before the cursor.
- `y` - Yank (copy) text.
- `yw` - Yank a word.
- `yy` - Yank a line.

## Search and Replace

- `/phrase` - Search forward.
- `?phrase` - Search backward/
- `n` - Repeat the last search in the same direction.
- `N` - Repeat the last search in the opposite direction.
- `%` - Move to the matching parenthesis, bracket, or brace.
- `:s/old/new/` - Substitute "new" for the first occurrence of "old" in the current line.
- `:s/old/new/g` - Substitute "new" for all occurrences of "old" in the current line.
- `:#,#s/old/new/g` - Substitute "new" for "old" between two line numbers.
- `:%s/old/new/g` - Substitute "new" for "old" in the entire file.
- `:%s/old/new/gc` - Substitute with confirmation for each occurrence.

## File Operations

- `:w` - Save the file.
- `:w FILENAME` - Save the file with a new name.
- `:q` - Quit Neovim.
- `:q!` - Quit Neovim without saving changes.
- `:wq` - Save and quit.
- `:r FILENAME` - Insert the contents of a file below the cursor.
- `:r !command` - Insert the output of a shell command below the cursor.
- `:!command` - Execute a shell command (e.g., `:!ls`).

## Visual Mode

- `v` - Start Visual mode (character-wise selection).
- `V` - Start Visual mode (line-wise selection).
- `y` - Yank (copy) the selected text.
- `d` - Delete the selected text.
- `:w FILENAME` - Save the selected lines to a file.

## Settings and Options

- `:set ic` - Ignore case in searches.
- `:set noic` - Disable ignore case in searches.
- `:set hls` - Highlight search matches.
- `:set is` - Enable incremental search.
- `:set invic` - Toggle ignore case.
- `:nohlsearch` - Remove search highlighting.

## Help and Completion

- `:help` - Open the help system.
- `:help TOPIC` - Get help on a specific topic.
- `<C-d>` - Show command completions.
- `<Tab>` - Use a completion.
## Miscellaneous

- `<Esc>` - Return to Normal mode.
- `<C-w><C-w>` - Switch between windows.
- `<C-o>` - Go back to the previous cursor position.
- `<C-i>` - Go forward to the next cursor position.