syntax on "Syntax highlighting

"Centered editing
noremap k kzz
noremap j jzz
noremap u uzz
noremap { {zz
noremap } }zz

"Center after jumping to mark
nnoremap ` :<C-u>execute "normal! `" . getcharstr() . "zz"<CR> 
nnoremap ' :<C-u>execute "normal! '" . getcharstr() . "zz"<CR>

"Sync Clipboard - https://github.com/VsVim/VsVim/issues/2423#issuecomment-439662133
set clipboard=unnamed

set number "Line numbers
set relativenumber "relative line numbers

"Indentation
set tabstop=4
set shiftwidth=4

"Case insensitive search (and replace unfortunately)
set ignorecase
set smartcase

"set hlsearch "Highlight all matching selections when searching
set incsearch "Incremental search - show matches while searching

"Remove copy on delete
nnoremap d "_d
vnoremap d "_d

"Paste without yank 
xnoremap p P
