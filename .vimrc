"Centered lines
noremap k kzz
noremap j jzz
noremap u uzz
noremap { {zz
noremap } }zz

"Sync Clipboard - https://github.com/VsVim/VsVim/issues/2423#issuecomment-439662133
"set clipboard=unnamed

"https://superuser.com/questions/1291425/how-to-make-vim-use-the-clipboard-in-windows-subsystem-linux
set clipboard=unnamedplus

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

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
