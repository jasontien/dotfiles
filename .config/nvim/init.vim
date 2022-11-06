lua require("jason")

set termguicolors

set rtp+=~/.fzf
" set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Highlight yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=400}
augroup END

augroup nerdtree_open
    autocmd VimEnter * NERDTree
augroup END

