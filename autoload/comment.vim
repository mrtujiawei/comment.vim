func s:sh_comment()
  " #!/usr/bin/env bash
  " #Filename: index.sh
  " #Author:  Mr Prince <m15988803646@163.com>
  " #Date: 2020-09-02 14:04:37

  call append(0, "\#!/bin/bash") 
  call append(1, "\#Filename: ".expand("%:.")) 
  call append(2, "\#Author: " . s:comment_field_author) 
  call append(3, "\#Date: ".strftime("%Y-%m-%d %T")) 
  call append(4, "")
endfunc

func s:js_comment()
  " /**
  "  * 
  "  * @filename index.js
  "  * @author Mr Prince
  "  * @date 2020-09-02 14:05:08
  "  */

  call append(0, "\/**")
  call append(1, "\ * ")
  call append(2, "\ * @filename ".expand("%:."))
  call append(3, "\ * @author " . s:comment_field_author)
  call append(4, "\ * @date ".strftime("%Y-%m-%d %T"))
  call append(5, "\ */")
  call append(6, "")
endfunc

func s:vim_comment()
  " 
  "
  " Maintainer:	mrtujiawei <m15988803646@163.com>
  " Last Change:	2021 Nov 05

  call append(0, '" ')
  call append(1, '"')
  call append(2, '" Maintainer: ' . s:comment_field_author)
  call append(3, '" Last Change: '.strftime("%Y-%m-%d")) 
endfunc

func s:fun_comment()
  " 搞笑
  " * 本人学识渊博、经验丰富，代码风骚、效率恐怖，
  " * c/c++ c#、java、php 安卓 ios  python node.js  无不精通玩转，
  " * 熟练掌握各种框架，并自写语言，创操作系统 写cpu处理器构架，做指令集成  。
  " * 深山苦练20余年，一天只睡3小时，千里之外定位问题，瞬息之间修复上线。
  " * 身体强壮、健步如飞，可连续工作100小时不休息，讨论技术方案9小时不喝水，
  " * 上至研发cpu芯片、带项目、出方案  弄计划，下至盗账号、黑网站、
  " * shell提权挂马、攻击同行、拍片摄影、泡妞把妹纸、开挖掘机 、威胁pm，啥都能干。
  " * 泡面矿泉水已备好，学校不支持已辍学，家人不支持已断绝关系，老婆不支持已离婚，
  " * 小孩不支持已送孤儿院，备用电源万兆光纤永不断电断网，门口已埋地雷无人打扰
endfunc

let s:comment_map = {}

let s:comment_map['sh'] = function('s:sh_comment')
let s:comment_map['javascript'] = function('s:js_comment')
let s:comment_map['typescript'] = function('s:js_comment')
let s:comment_map['typescriptreact'] = function('s:js_comment')
let s:comment_map['vim'] = function('s:vim_comment')

let s:show_fun = 0
let s:comment_field_author = ''

if exists('g:comment_show_fun') && g:comment_show_fun == 1
  let s:show_fun = 1
endif

if exists('g:comment_field_author')
  let s:comment_field_author = s:comment_field_author . ' ' . g:comment_field_author
endif

if exists('g:comment_field_email')
  let s:comment_field_author = s:comment_field_author . ' <' . g:comment_field_email . '>'
endif

func! comment#create()
  let l:ft = &filetype
  let l:author = ''

  if has_key(s:comment_map, l:ft)
    call s:comment_map[l:ft]()
  endif

  if s:show_fun == 1
    s:fun_comment()
  endif
endfunc

