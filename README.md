# vim-shift-movers

A package for the Atom Text Editor

If you're a VIM user, you've got those arrow keys just hanging out over there
in the lower right of your keyboard.  They're pretty useless, right?  What if
you could use them for something... more?

This package remaps your arrow keys to shift text around easily on the screen.
Once you start shifting lines up and down, or indenting selections using arrows,
you'll never want to go back!

Requires vim-mode to really be useful.

# Usage

Install vim-mode and vim-shift-movers. In command & visual modes, the arrow keys
will now move lines of text around.

# Keymaps

`up` — remove empty lines, one at a time, above the current line (wihtout moving the cursor)

`down` — Add lines above the current line, one at a time.

`right` — Indent current or selected lines.

`left` — Outdent current or selected lines.

`shift-up` — swap the current line with the one above it.

`shift-down` — swap the current line with the one below it.
