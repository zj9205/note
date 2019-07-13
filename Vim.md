# To copy and paste a chunk of code in Vim follow these instructions
- Place the cursor on the line you want to begin cutting.
- Press `V` to select the entire line, or `v` to select from where your cursor is.
- Move the cursor to the end of what you want to cut, using `h,j,k, or l`
- Press `y` to copy it, or `d` to cut it.
- Place the cursor where you would like to paste your copied stuff.
- Press `P` to paste it before your cursor, or `p` to paste it after the cursor.
- You can copy and paste between buffers.

# Deleta or cut
Pressing `dd` will remove that line (actually it will cut it). So you can paste it via `p`.

# Enable syntax color
- create/edit `~/.vimrc`
- add `syntax on`
