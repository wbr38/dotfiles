"Centered lines
noremap k kzz
noremap j jzz
noremap u uzz
noremap { {zz
noremap } }zz

"Sync Clipboard - https://github.com/VsVim/VsVim/issues/2423#issuecomment-439662133
set clipboard=unnamed

set number
set relativenumber "relative line numbers

"Case insensitive search (and replace unfortunately)
set ignorecase
set smartcase

"Remove copy on delete
nnoremap d "_d
vnoremap d "_d

"Paste without yank 
xnoremap p P