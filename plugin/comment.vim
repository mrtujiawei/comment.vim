" comment
"
" 头部注释插件
"
" Maintainer: mrtujiawei <m15988803646@163.com>
" Last Change: 2023-09-05

if exists('g:load_comment')
  finish
endif

let g:load_comment = 1

if !exists('g:comment_auto_create') || g:comment_auto_create != 0
  command! -n=0 -bar CommentCreate call comment#create()
endif

if !exists('g:comment_auto_map') || g:comment_auto_map != 0
  noremap <silent> <C-i> :call comment#create()<Enter>
endif
