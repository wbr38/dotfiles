syntax on "Syntax highlighting

"Centered editing
set scrolloff=9999

"Sync Clipboard - https://github.com/VsVim/VsVim/issues/2423#issuecomment-439662133
set clipboard=unnamed

set number "Line numbers
set relativenumber "relative line numbers

"Indentation
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent

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
