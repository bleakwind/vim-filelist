" vim: set expandtab tabstop=4 softtabstop=4 shiftwidth=4: */
"
" +--------------------------------------------------------------------------+
" | $Id: filelist.vim 2025-07-12 05:37:12 Bleakwind Exp $                    |
" +--------------------------------------------------------------------------+
" | Copyright (c) 2008-2025 Bleakwind(Rick Wu).                              |
" +--------------------------------------------------------------------------+
" | This source file is filelist.vim.                                        |
" | This source file is release under BSD license.                           |
" +--------------------------------------------------------------------------+
" | Author: Bleakwind(Rick Wu) <bleakwind@qq.com>                            |
" +--------------------------------------------------------------------------+
"

if exists('g:filelist_plugin') || &compatible
    finish
endif
let g:filelist_plugin = 1

scriptencoding utf-8

let s:save_cpo = &cpoptions
set cpoptions&vim

" ============================================================================
" filelist setting
" ============================================================================
" public setting - [g:filelist_position:left|right]
let g:filelist_enabled              = get(g:, 'filelist_enabled',             0)
let g:filelist_autostart            = get(g:, 'filelist_autostart',           0)
let g:filelist_position             = get(g:, 'filelist_position',            'left')
let g:filelist_winwidth             = get(g:, 'filelist_winwidth',            30)
let g:filelist_mainpath             = get(g:, 'filelist_mainpath',            getcwd())
let g:filelist_showhide             = get(g:, 'filelist_showhide',            0)
let g:filelist_bmpath               = get(g:, 'filelist_bmpath',              $HOME.'/.vim/filelist')

" fold and file color
let g:filelist_hlsetmark            = get(g:, 'filelist_hlsetmark',           '#A1ACA3')
let g:filelist_hlseticon            = get(g:, 'filelist_hlseticon',           '#A1ACA3')
let g:filelist_hlfoldclose          = get(g:, 'filelist_hlfoldclose',         '#92BDE8')
let g:filelist_hlfoldopen           = get(g:, 'filelist_hlfoldopen',          '#92BDE8')
let g:filelist_hlfiledefault        = get(g:, 'filelist_hlfiledefault',       '#DDDDDD')
let g:filelist_hlfileexecute        = get(g:, 'filelist_hlfileexecute',       '#EEBE77')
let g:filelist_hlfilesymlink        = get(g:, 'filelist_hlfilesymlink',       '#95D475')
let g:filelist_hlbmlisttitle        = get(g:, 'filelist_hlbmlisttitle',       '#92BDE8')

" file mark
let g:filelist_mark                 = get(g:, 'filelist_mark', {})
let g:filelist_mark.collapsed       = get(g:filelist_mark, 'collapsed',       nr2char(0x23F5))
let g:filelist_mark.expanded        = get(g:filelist_mark, 'expanded',        nr2char(0x23F7))
let g:filelist_mark.reserve         = get(g:filelist_mark, 'reserve',         ' ')

" file attr
let g:filelist_attr                 = get(g:, 'filelist_attr', {})
let g:filelist_attr.fold_close      = get(g:filelist_attr, 'fold_close',      nr2char(0x1F4C1))
let g:filelist_attr.fold_open       = get(g:filelist_attr, 'fold_open',       nr2char(0x1F4C2))
let g:filelist_attr.file_default    = get(g:filelist_attr, 'file_default',    nr2char(0x1F4C4))
let g:filelist_attr.file_execute    = get(g:filelist_attr, 'file_execute',    nr2char(0x1F4D9))
let g:filelist_attr.file_symlink    = get(g:filelist_attr, 'file_symlink',    nr2char(0x1F517))
let g:filelist_attr.bmlist_title    = get(g:filelist_attr, 'bmlist_title',    nr2char(0x1F516))

" file type
let g:filelist_type                 = get(g:, 'filelist_type', {})
let g:filelist_type.type_mp3        = get(g:filelist_type, 'type_mp3',        { 'icon': nr2char(0x1F3B5), 'ext': ['mp3'] })
let g:filelist_type.type_mp4        = get(g:filelist_type, 'type_mp4',        { 'icon': nr2char(0x1F39E), 'ext': ['mp4'] })
let g:filelist_type.type_php        = get(g:filelist_type, 'type_php',        { 'icon': nr2char(0x1F418), 'ext': ['php'] })
let g:filelist_type.type_java       = get(g:filelist_type, 'type_java',       { 'icon': nr2char(0x2615),  'ext': ['java'] })
let g:filelist_type.type_python     = get(g:filelist_type, 'type_python',     { 'icon': nr2char(0x1F40D), 'ext': ['py'] })
let g:filelist_type.type_csharp     = get(g:filelist_type, 'type_csharp',     { 'icon': nr2char(0x1F3AF), 'ext': ['cs'] })
let g:filelist_type.type_c          = get(g:filelist_type, 'type_c',          { 'icon': nr2char(0x1F1E8), 'ext': ['c'] })
let g:filelist_type.type_cpp        = get(g:filelist_type, 'type_cpp',        { 'icon': nr2char(0x1F1E8), 'ext': ['cpp', 'cxx', 'h', 'hpp'] })
let g:filelist_type.type_kotlin     = get(g:filelist_type, 'type_kotlin',     { 'icon': nr2char(0x1F1F0), 'ext': ['kt', 'kts'] })
let g:filelist_type.type_go         = get(g:filelist_type, 'type_go',         { 'icon': nr2char(0x1F9AB), 'ext': ['go'] })
let g:filelist_type.type_swift      = get(g:filelist_type, 'type_swift',      { 'icon': nr2char(0x1F54A), 'ext': ['swift'] })
let g:filelist_type.type_dart       = get(g:filelist_type, 'type_dart',       { 'icon': nr2char(0x1F680), 'ext': ['dart'] })
let g:filelist_type.type_rust       = get(g:filelist_type, 'type_rust',       { 'icon': nr2char(0x1F1F7), 'ext': ['rs'] })
let g:filelist_type.type_ruby       = get(g:filelist_type, 'type_ruby',       { 'icon': nr2char(0x1F48E), 'ext': ['rb'] })
let g:filelist_type.type_perl       = get(g:filelist_type, 'type_perl',       { 'icon': nr2char(0x1F42A), 'ext': ['pl', 'pm'] })
let g:filelist_type.type_lua        = get(g:filelist_type, 'type_lua',        { 'icon': nr2char(0x1F319), 'ext': ['lua'] })
let g:filelist_type.type_shell      = get(g:filelist_type, 'type_shell',      { 'icon': nr2char(0x1F41A), 'ext': ['sh', 'bash', 'zsh'] })
let g:filelist_type.type_markdown   = get(g:filelist_type, 'type_markdown',   { 'icon': nr2char(0x1F5D2), 'ext': ['md', 'markdown'] })
let g:filelist_type.type_matlab     = get(g:filelist_type, 'type_matlab',     { 'icon': nr2char(0x1F9EE), 'ext': ['m'] })
let g:filelist_type.type_r          = get(g:filelist_type, 'type_r',          { 'icon': nr2char(0x1F4CA), 'ext': ['r', 'rmd'] })
let g:filelist_type.type_powershell = get(g:filelist_type, 'type_powershell', { 'icon': nr2char(0x1F1F5), 'ext': ['psl'] })
let g:filelist_type.type_makefile   = get(g:filelist_type, 'type_makefile',   { 'icon': nr2char(0x1F1F2), 'ext': ['mk','mkfile'] })
let g:filelist_type.type_sql        = get(g:filelist_type, 'type_sql',        { 'icon': nr2char(0x1F5C4), 'ext': ['sql'] })
let g:filelist_type.type_javascript = get(g:filelist_type, 'type_javascript', { 'icon': nr2char(0x1F1EF), 'ext': ['js'] })
let g:filelist_type.type_typescript = get(g:filelist_type, 'type_typescript', { 'icon': nr2char(0x1F1F9), 'ext': ['ts', 'tsx'] })
let g:filelist_type.type_html       = get(g:filelist_type, 'type_html',       { 'icon': nr2char(0x1F310), 'ext': ['html', 'htm'] })
let g:filelist_type.type_css        = get(g:filelist_type, 'type_css',        { 'icon': nr2char(0x1F3A8), 'ext': ['css'] })
let g:filelist_type.type_json       = get(g:filelist_type, 'type_json',       { 'icon': nr2char(0x1F4C3), 'ext': ['json'] })
let g:filelist_type.type_xml        = get(g:filelist_type, 'type_xml',        { 'icon': nr2char(0x1F4F0), 'ext': ['xml'] })
let g:filelist_type.type_yaml       = get(g:filelist_type, 'type_yaml',       { 'icon': nr2char(0x1F4CB), 'ext': ['yaml', 'yml'] })

" plugin variable
let s:filelist_bufnbr               = -1
let s:filelist_winidn               = -1
let s:filelist_msetimer             = 0
let s:filelist_filedata             = {}
let s:filelist_bmstate              = 0
let s:filelist_bmfile               = g:filelist_bmpath.'/bookmark'
let s:filelist_bmdata               = {}

" ============================================================================
" filelist detail
" g:filelist_enabled = 1
" ============================================================================
if exists('g:filelist_enabled') && g:filelist_enabled == 1

    " --------------------------------------------------
    " filelist#IsSpecial
    " --------------------------------------------------
    function! filelist#IsSpecial(...) abort
        let l:ret = 0
        if a:0 > 0
            let l:buftype = getbufvar(a:1, '&buftype')
            let l:ret = l:buftype != '' && l:buftype != 'help' ? 1 : 0
        endif
        return l:ret
    endfunction

    " --------------------------------------------------
    " filelist#WinDatalist
    " --------------------------------------------------
    function! filelist#WinDatalist(...) abort
        if s:filelist_winidn != -1 && win_id2win(s:filelist_winidn) != 0
            " save cursor position
            let l:current_cursor = getpos('.')
            let l:current_line = line('.')

            " clean highlight
            if exists('w:filelist_highlight')
                for id in w:filelist_highlight
                    silent! call matchdelete(id)
                endfor
                let w:filelist_highlight = []
            endif

            " init data
            let l:lines = []

            " build bmdata
            call filelist#BookmarkLoad()
            if exists('s:filelist_bmstate') && s:filelist_bmstate
                call filelist#BookmarkRender(l:lines)
            endif

            " build filedata
            if !exists('s:filelist_filedata') || empty(s:filelist_filedata)
                call filelist#FilelistLoad(g:filelist_mainpath)
            endif
            call filelist#FilelistRender(s:filelist_filedata, l:lines, 0)

            " setbufvar filelist
            call setbufvar(s:filelist_bufnbr, '&modifiable', 1)
            silent! call deletebufline(s:filelist_bufnbr, 1, '$')
            silent! call setbufline(s:filelist_bufnbr, 1, l:lines)
            call setbufvar(s:filelist_bufnbr, '&modifiable', 0)
            call setbufvar(s:filelist_bufnbr, '&modified', 0)

            " set highlight
            call win_execute(s:filelist_winidn, 'call filelist#SetHlcolor()')

            " restore cursor position
            if l:current_line <= line('$')
                call cursor(l:current_line, l:current_cursor[2])
            else
                call cursor(line('$'), l:current_cursor[2])
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#FilelistLoad
    " --------------------------------------------------
    function! filelist#FilelistLoad(root) abort
        if isdirectory(a:root)
            execute 'cd '.fnameescape(a:root)
        endif
        let s:filelist_filedata = {
                    \ 'name'     : a:root == '/' ? '/' : fnamemodify(a:root, ':t'),
                    \ 'path'     : a:root,
                    \ 'type'     : 'fold',
                    \ 'expand'   : 1,
                    \ 'children' : []
                    \ }
        call filelist#FilelistBuild(s:filelist_filedata)
    endfunction

    " --------------------------------------------------
    " filelist#FilelistBuild
    " --------------------------------------------------
    function! filelist#FilelistBuild(node) abort
        if a:node.type == 'fold' && a:node.expand
            " read dir
            let a:node.children = []
            let l:dir_list = globpath(a:node.path, '*', 1, 1) + globpath(a:node.path, '.*', 1, 1)

            " loop dir
            for il in l:dir_list
                " skip . and ..
                if il =~# '/\.\.\?$'
                    continue
                endif
                " skip hidden files
                if !get(g:, 'filelist_showhide', 0) && il =~# '/\.'
                    continue
                endif
                " set data
                let l:data = {
                            \ 'name'   : il == '/' ? '/' : fnamemodify(il, ':t'),
                            \ 'path'   : il,
                            \ 'type'   : isdirectory(il) ? 'fold' : 'file',
                            \ 'expand' : 0,
                            \ 'parent' : a:node
                            \ }
                if executable(il)
                    let l:data.type = 'execute'
                elseif getftype(il) == 'link'
                    let l:data.type = 'symlink'
                endif
                " add data
                call add(a:node.children, l:data)
            endfor

            " sort dir and files
            call sort(a:node.children, function('filelist#NodeSort'))
        endif
    endfunction

    " --------------------------------------------------
    " filelist#FilelistRender
    " --------------------------------------------------
    function! filelist#FilelistRender(node, lines, level) abort
        let l:prefix = repeat('  ', a:level)

        " init highlight
        if !exists('w:filelist_highlight')
            let w:filelist_highlight = []
        endif

        " fold icon
        if a:node.type == 'fold'
            if a:node.expand
                let l:mark = g:filelist_mark.expanded
                let l:icon = g:filelist_attr.fold_open
                let l:hl_name = 'FilelistHlFoldOpen'
            else
                let l:mark = g:filelist_mark.collapsed
                let l:icon = g:filelist_attr.fold_close
                let l:hl_name = 'FilelistHlFoldClose'
            endif
        else
            let l:mark = g:filelist_mark.reserve
            let l:icon = g:filelist_attr.file_default
            let l:hl_name = 'FilelistHlFileDefault'

            " file icon
            if a:node.type == 'file' || a:node.type == 'execute' || a:node.type == 'symlink'
                " check file type
                let l:ext = fnamemodify(a:node.path, ':e')
                let l:found_type = 0
                for [type, config] in items(g:filelist_type)
                    if index(config.ext, l:ext) != -1
                        let l:icon = config.icon
                        let l:found_type = 1
                        break
                    endif
                endfor
                " check file attr
                if a:node.type == 'execute'
                    let l:icon = !l:found_type ? g:filelist_attr.file_execute : l:icon
                    let l:hl_name = 'FilelistHlFileExecute'
                elseif a:node.type == 'symlink'
                    let l:icon = !l:found_type ? g:filelist_attr.file_symlink : l:icon
                    let l:hl_name = 'FilelistHlFileSymlink'
                endif
            endif
        endif

        " set line
        let l:disname = a:level == 0 && has_key(a:node, 'path') ? a:node.name.' - '.a:node.path : a:node.name
        let l:data_line = l:prefix.l:mark.' '.l:icon.' '.l:disname
        call add(a:lines, l:data_line)

        " hl filelist
        let l:line_num = len(a:lines)

        let l:mark_col = len(l:prefix) + 1
        let l:mark_width = strlen(l:mark)
        let l:mark_id = matchaddpos('FilelistHlSetMark', [[l:line_num, l:mark_col, l:mark_width]])
        call add(w:filelist_highlight, l:mark_id)

        let l:icon_col = len(l:prefix) + strlen(l:mark) + 1 + 1
        let l:icon_width = strlen(l:icon)
        let l:icon_id = matchaddpos('FilelistHlSetIcon', [[l:line_num, l:icon_col, l:icon_width]])
        call add(w:filelist_highlight, l:icon_id)

        let l:cont_col = len(l:prefix) + strlen(l:mark) + 1 + strlen(l:icon) + 1 + 1
        let l:cont_width = strlen(l:data_line) - (l:cont_col - 1)
        let l:cont_id = matchaddpos(l:hl_name, [[l:line_num, l:cont_col, l:cont_width]])
        call add(w:filelist_highlight, l:cont_id)

        " operate child
        if a:node.expand && has_key(a:node, 'children')
            for child in a:node.children
                call filelist#FilelistRender(child, a:lines, a:level + 1)
            endfor
        endif
    endfunction

    " --------------------------------------------------
    " filelist#NodeSort
    " --------------------------------------------------
    function! filelist#NodeSort(a, b) abort
        if a:a.type == 'fold' && a:b.type != 'fold'
            return -1
        elseif a:a.type != 'fold' && a:b.type == 'fold'
            return 1
        else
            return a:a.name == a:b.name ? 0 : a:a.name > a:b.name ? 1 : -1
        endif
    endfunction

    " --------------------------------------------------
    " filelist#GetNode
    " --------------------------------------------------
    function! filelist#GetNode(...) abort
        " get message
        let l:node_line = getline('.')

        " handle bookmark
        if exists('s:filelist_bmstate') && s:filelist_bmstate
            let l:bmdata = filelist#BookmarkLoad()
            if !empty(l:bmdata.items)
                let l:current_line = line('.')
                let l:header_line = 1
                if l:current_line > l:header_line && l:current_line <= (len(l:bmdata.items) + l:header_line)
                    return l:bmdata.items[l:current_line - l:header_line - 1]
                elseif l:current_line <= l:header_line || l:current_line == (len(l:bmdata.items) + l:header_line + 1)
                    return {}
                endif
            endif
        endif

        " set something
        let l:indent = len(matchstr(l:node_line, '^\s*')) / 2
        let l:path = split(l:node_line, ' ')[1:]
        let l:name = join(l:path, ' ')

        let l:current_node = s:filelist_filedata
        let l:current_line = 1
        let l:found_node = 0

        " handle bookmark
        if exists('s:filelist_bmstate') && s:filelist_bmstate
            let l:bmdata = filelist#BookmarkLoad()
            let l:current_line += len(l:bmdata.items) + 2
        endif

        " loop file
        while 1
            " if found
            if l:current_line == line('.')
                let l:found_node = 1
                break
            endif
            " sub node
            if l:current_node.expand && has_key(l:current_node, 'children') && !empty(l:current_node.children)
                let l:current_node = l:current_node.children[0]
                let l:current_line += 1
            " node list
            else
                while has_key(l:current_node, 'parent')
                    let l:par = l:current_node.parent
                    let l:idx = index(l:par.children, l:current_node)
                    if l:idx < len(l:par.children) - 1
                        let l:current_node = l:par.children[l:idx + 1]
                        let l:current_line += 1
                        break
                    else
                        let l:current_node = l:par
                    endif
                endwhile
                if !has_key(l:current_node, 'parent')
                    break
                endif
            endif
        endwhile
        return l:found_node ? l:current_node : {}
    endfunction

    " --------------------------------------------------
    " filelist#GetPath
    " --------------------------------------------------
    function! filelist#GetPath(node) abort
        let l:paths = []
        if a:node.expand && a:node.type == 'fold'
            call add(l:paths, a:node.path)
            if has_key(a:node, 'children')
                for child in a:node.children
                    let l:paths += filelist#GetPath(child)
                endfor
            endif
        endif
        return l:paths
    endfunction

    " --------------------------------------------------
    " filelist#OpenFile
    " --------------------------------------------------
    function! filelist#OpenFile(path) abort
        " find basicwin
        let l:basic_winidn = get(filter(map(range(1, winnr('$')), 'win_getid(v:val)'), '!filelist#IsSpecial(winbufnr(win_id2win(v:val)))'), 0, -1)
        if l:basic_winidn != -1 && win_id2win(l:basic_winidn) != 0
            call win_gotoid(l:basic_winidn)
        else
            if g:filelist_position == 'left'
                execute 'silent! botright vsplit'
            elseif g:filelist_position == 'right'
                execute 'silent! topleft vsplit'
            endif
        endif
        " edit file
        execute 'silent! edit '.fnameescape(a:path)
        if s:filelist_winidn != -1 && win_id2win(s:filelist_winidn) != 0
            if g:filelist_position == 'left'
                execute 'vertical '.win_id2win(s:filelist_winidn).'resize '.g:filelist_winwidth
            elseif g:filelist_position == 'right'
                execute 'vertical '.win_id2win(s:filelist_winidn).'resize '.g:filelist_winwidth
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#OpenNode
    " --------------------------------------------------
    function! filelist#OpenNode(...) abort
        " save cursor
        let l:winidn = win_getid()
        let l:current_cursor = getpos('.')

        " operate node
        let l:node = filelist#GetNode()
        if !empty(l:node)

            " handle bookmark item
            if has_key(l:node, 'type') && (l:node.type == 'bfold' || l:node.type == 'bfile')
                if !filereadable(l:node.path) && !isdirectory(l:node.path)
                    let l:prompt_bok = "The bookmark not found: ".l:node.path
                    echohl FilelistPmtError | echo l:prompt_bok | echohl None
                elseif l:node.type == 'bfold'
                    let g:filelist_mainpath = l:node.path
                    execute 'cd '.fnameescape(l:node.path)
                    call cursor(1, 1)
                    call filelist#RefreshList()

                    " restore cursor
                    if win_id2win(l:winidn) != 0
                        call win_gotoid(l:winidn)
                        call setpos('.', l:current_cursor)
                    endif
                else
                    call filelist#OpenFile(l:node.path)
                endif
            " handle normal folder/file
            elseif has_key(l:node, 'name') && has_key(l:node, 'path')
                if l:node.type == 'fold'
                    let l:node.expand = !l:node.expand
                    if l:node.expand | call filelist#FilelistBuild(l:node) | endif
                    call filelist#WinDatalist()

                    " restore cursor
                    if win_id2win(l:winidn) != 0
                        call win_gotoid(l:winidn)
                        call setpos('.', l:current_cursor)
                    endif
                else
                    call filelist#OpenFile(l:node.path)
                endif
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#MouseNode
    " --------------------------------------------------
    function! filelist#MouseNode(...) abort
        " get message
        let l:orig_winidn = win_getid()

        " check mouse
        let l:type = (a:0 > 0 && a:1 == 1) ? 1 : 2
        let l:current_time = reltimefloat(reltime())
        if l:type == 1 && (l:current_time - s:filelist_msetimer) < 0.3
            let s:filelist_msetimer = 0
        else
            let s:filelist_msetimer = l:current_time

            " check pos
            let l:mouse_pos = getmousepos()
            let l:click_wid = l:mouse_pos.winid
            let l:click_lin = l:mouse_pos.line
            let l:click_col = l:mouse_pos.column

            " process click
            if l:click_wid == l:orig_winidn
                call cursor(l:click_lin, l:click_col)

                " click mark
                let l:fold_line = getline(l:click_lin)
                let l:fold_char = matchstr(l:fold_line, '\v^\s*\zs.')
                if l:fold_char ==# g:filelist_mark.collapsed || l:fold_char ==# g:filelist_mark.expanded
                    let l:mark_start = match(l:fold_line, '\v^\s*\zs.') + 1
                    let l:mark_end = l:mark_start + strlen(l:fold_char) - 1
                    if l:click_col >= l:mark_start && l:click_col <= l:mark_end
                        let l:type = 9
                    endif
                endif

                " click node
                let l:node = filelist#GetNode()
                if !empty(l:node)
                    if l:type == 9
                        if l:node.type == 'fold'
                            let l:node.expand = !l:node.expand
                            if l:node.expand | call filelist#FilelistBuild(l:node) | endif
                            call filelist#WinDatalist()
                        endif
                    elseif l:type == 1
                        if l:node.type == 'fold'
                            "let l:node.expand = !l:node.expand
                            "if l:node.expand | call filelist#FilelistBuild(l:node) | endif
                            "call filelist#WinDatalist()
                        else
                            "call filelist#OpenFile(l:node.path)
                        endif
                    else
                        if l:node.type == 'fold'
                            let l:node.expand = !l:node.expand
                            if l:node.expand | call filelist#FilelistBuild(l:node) | endif
                            call filelist#WinDatalist()
                        else
                            call filelist#OpenFile(l:node.path)
                        endif
                    endif
                endif
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#RefreshList
    " --------------------------------------------------
    function! filelist#RefreshList(...) abort
        if exists('s:filelist_filedata')
            " save line
            let l:current_line = line('.')
            let l:current_col = col('.')
            let l:current_topline = line('w0')

            " save state
            let l:expand_path = filelist#GetPath(s:filelist_filedata)

            " refresh list
            call filelist#FilelistLoad(g:filelist_mainpath)
            call filelist#RestorePath(s:filelist_filedata, l:expand_path)
            call filelist#WinDatalist()

            " restore cursor
            if l:current_line <= line('$')
                call cursor(l:current_line, l:current_col)
            else
                call cursor(line('$'), l:current_col)
            endif
            execute "normal! ".l:current_topline."zt"

            " set highlight
            call win_execute(s:filelist_winidn, 'call filelist#SetHlcolor()')
        endif
    endfunction

    " --------------------------------------------------
    " filelist#SetNodepath
    " --------------------------------------------------
    function! filelist#SetNodepath(...) abort
        let l:node = filelist#GetNode()
        if !empty(l:node) && l:node.type == 'fold'
            let g:filelist_mainpath = l:node.path
            execute 'cd '.fnameescape(l:node.path)
            call cursor(1, 1)
            call filelist#RefreshList()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#SetUppath
    " --------------------------------------------------
    function! filelist#SetUppath() abort
        " save list
        let l:paths = []
        call filelist#CollectPath(s:filelist_filedata, l:paths)

        " save cursor
        let l:saved_pos = getpos('.')
        let l:saved_topline = line('w0')

        " get upfold
        let l:parent_dir = fnamemodify(g:filelist_mainpath, ':h')
        if l:parent_dir == g:filelist_mainpath
            return
        endif

        " update mainpath
        let g:filelist_mainpath = l:parent_dir
        execute 'cd '.fnameescape(l:parent_dir)

        " rebuild filelist
        call filelist#FilelistLoad(g:filelist_mainpath)

        " restore save list
        call filelist#RestorePath(s:filelist_filedata, l:paths)

        " refresh
        call filelist#WinDatalist()

        " restore cursor
        if l:saved_pos[1] <= line('$')
            call setpos('.', l:saved_pos)
        else
            call cursor(line('$'), l:saved_pos[2])
        endif
        execute "normal! ".l:saved_topline."zt"
    endfunction

    " --------------------------------------------------
    " filelist#CollectPath
    " --------------------------------------------------
    function! filelist#CollectPath(node, paths) abort
        if a:node.type == 'fold' && a:node.expand
            call add(a:paths, a:node.path)
            if has_key(a:node, 'children')
                for child in a:node.children
                    call filelist#CollectPath(child, a:paths)
                endfor
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#RestorePath
    " --------------------------------------------------
    function! filelist#RestorePath(node, paths) abort
        if a:node.type == 'fold' && index(a:paths, a:node.path) != -1
            let a:node.expand = 1
            call filelist#FilelistBuild(a:node)
            if has_key(a:node, 'children')
                for child in a:node.children
                    call filelist#RestorePath(child, a:paths)
                endfor
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#ToggleHidden
    " --------------------------------------------------
    function! filelist#ToggleHidden(...) abort
        let g:filelist_showhide = !get(g:, 'filelist_showhide', 0)
        call filelist#RefreshList()
    endfunction

    " --------------------------------------------------
    " filelist#LocateFile
    " --------------------------------------------------
    function! filelist#LocateFile() abort
        if !filelist#IsSpecial(bufnr('%'))

            " get filepath
            let l:current_file = expand('%:p')
            if !empty(l:current_file)

                " check win
                if s:filelist_winidn == -1 || win_id2win(s:filelist_winidn) == 0
                    call filelist#WinOpen()
                endif

                " check filepath
                let l:relative_path = substitute(l:current_file, '^'.g:filelist_mainpath.'/', '', '')

                " not in mainpath
                if l:relative_path ==# l:current_file
                    let l:parent_dir = fnamemodify(l:current_file, ':h')
                    let g:filelist_mainpath = l:parent_dir
                    execute 'cd '.fnameescape(l:parent_dir)
                    let l:relative_path = fnamemodify(l:current_file, ':t')
                endif

                " check filepath
                let l:path_list = split(l:relative_path, '/')
                if !empty(l:path_list)

                    " goto filelist win
                    call win_gotoid(s:filelist_winidn)
                    call filelist#RefreshList()

                    " ready node
                    let l:current_node = s:filelist_filedata
                    call cursor(1, 1)

                    " loop path
                    for il in l:path_list
                        " ready node expand
                        if l:current_node.type == 'fold' && !l:current_node.expand
                            let l:current_node.expand = 1
                            call filelist#FilelistBuild(l:current_node)
                            call filelist#WinDatalist()
                        endif
                        " find subnode
                        let l:found_node = 0
                        for child in l:current_node.children
                            if child.name ==# il
                                let l:current_node = child
                                let l:current_line = filelist#LocateLine(child)
                                call cursor(l:current_line, 1)
                                normal! zz
                                let l:found_node = 1
                                break
                            endif
                        endfor
                        " if not found
                        if !l:found_node
                            break
                        endif
                    endfor

                    " move cursor
                    if l:current_node.path ==# l:current_file
                        let l:data_line = getline('.')
                        let l:name_start = matchend(l:data_line, '^\s*.\s.\s') + 1
                        call cursor(line('.'), l:name_start)
                    endif
                endif
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#LocateLine
    " --------------------------------------------------
    function! filelist#LocateLine(node) abort
        let l:current_node = s:filelist_filedata
        let l:current_line = 1

        " loop list
        while 1
            " if found
            if l:current_node == a:node
                break
            endif
            " sub node
            if l:current_node.expand && has_key(l:current_node, 'children') && !empty(l:current_node.children)
                let l:current_node = l:current_node.children[0]
                let l:current_line += 1
            " node list
            else
                while has_key(l:current_node, 'parent')
                    let l:par = l:current_node.parent
                    let l:idx = index(l:par.children, l:current_node)
                    if l:idx < len(l:par.children) - 1
                        let l:current_node = l:par.children[l:idx + 1]
                        let l:current_line += 1
                        break
                    else
                        let l:current_node = l:par
                    endif
                endwhile
                if !has_key(l:current_node, 'parent')
                    break
                endif
            endif
        endwhile
        return l:current_line
    endfunction

    " --------------------------------------------------
    " filelist#WinOpen
    " --------------------------------------------------
    function! filelist#WinOpen(...) abort
        if s:filelist_winidn == -1 || win_id2win(s:filelist_winidn) == 0
            " get message
            let l:orig_winidn = win_getid()

            " open win
            if g:filelist_position == 'right'
                execute 'silent! botright vnew vim-filelist | vertical resize '.g:filelist_winwidth
            else
                execute 'silent! topleft vnew vim-filelist | vertical resize '.g:filelist_winwidth
            endif

            let s:filelist_bufnbr = bufnr('%')
            let s:filelist_winidn = win_getid()

            " set option
            call win_execute(s:filelist_winidn, 'setlocal buftype=nofile bufhidden=hide noswapfile nobuflisted nomodifiable')
            call win_execute(s:filelist_winidn, 'setlocal nonumber norelativenumber nolist cursorline nocursorcolumn nospell')
            call win_execute(s:filelist_winidn, 'setlocal nowrap nofoldenable foldcolumn=0 signcolumn=no colorcolumn=')
            call win_execute(s:filelist_winidn, 'setlocal mouse=nc filetype=filelist')
            call win_execute(s:filelist_winidn, 'file vim-filelist')

            " set win
            if g:filelist_position == 'right'
                call win_execute(s:filelist_winidn, 'setlocal winfixwidth')
            else
                call win_execute(s:filelist_winidn, 'setlocal winfixwidth')
            endif

            " set keymap
            nnoremap <silent> <buffer> <CR>          :call filelist#OpenNode()<CR>
            nnoremap <silent> <buffer> o             :call filelist#OpenNode()<CR>
            nnoremap <silent> <buffer> <LeftRelease> :<C-U>call timer_start(200, {-> filelist#MouseNode(1)})<CR>
            nnoremap <silent> <buffer> <2-LeftMouse> :<C-U>call filelist#MouseNode(2)<CR>

            nnoremap <silent> <buffer> C             :call filelist#SetNodepath()<CR>
            nnoremap <silent> <buffer> U             :call filelist#SetUppath()<CR>
            nnoremap <silent> <buffer> R             :call filelist#RefreshList()<CR>
            nnoremap <silent> <buffer> .             :call filelist#ToggleHidden()<CR>

            nnoremap <silent> <buffer> B             :<C-U>call filelist#BookmarkToggle()<CR>
            nnoremap <silent> <buffer> mi            :<C-U>call filelist#BookmarkInsert()<CR>
            nnoremap <silent> <buffer> md            :<C-U>call filelist#BookmarkDelete()<CR>

            " set autocmd
            augroup FilelistAutoCommands
                autocmd!
                autocmd BufEnter <buffer> let b:filelist_currsor = getpos('.')[1:2]
                autocmd BufLeave <buffer> let b:filelist_currsor = getpos('.')[1:2]
            augroup END

            " render list
            call filelist#WinDatalist()

            " back win
            if l:orig_winidn != 0 && win_id2win(l:orig_winidn) != 0
                call win_gotoid(l:orig_winidn)
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#WinClose
    " --------------------------------------------------
    function! filelist#WinClose(...) abort
        if s:filelist_winidn != -1 && win_id2win(s:filelist_winidn) != 0

            " save win
            let l:orig_winidn = win_getid()
            call win_gotoid(s:filelist_winidn)

            " operate
            close
            let s:filelist_bufnbr = -1
            let s:filelist_winidn = -1

            " back win
            if l:orig_winidn != 0 && win_id2win(l:orig_winidn) != 0
                call win_gotoid(l:orig_winidn)
            endif
        else
            let s:filelist_bufnbr = -1
            let s:filelist_winidn = -1
        endif
    endfunction

    " --------------------------------------------------
    " filelist#Open
    " --------------------------------------------------
    function! filelist#Open(...) abort
        if s:filelist_winidn == -1 || win_id2win(s:filelist_winidn) == 0
            call filelist#WinOpen()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#Close
    " --------------------------------------------------
    function! filelist#Close(...) abort
        if s:filelist_winidn != -1 && win_id2win(s:filelist_winidn) != 0
            call filelist#WinClose()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#Toggle
    " --------------------------------------------------
    function! filelist#Toggle(...) abort
        if s:filelist_winidn != -1 && win_id2win(s:filelist_winidn) != 0
            call filelist#WinClose()
        else
            call filelist#WinOpen()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkRender
    " --------------------------------------------------
    function! filelist#BookmarkRender(lines) abort
        " init highlight
        if !exists('w:filelist_highlight')
            let w:filelist_highlight = []
        endif

        " set title
        let l:mark = g:filelist_mark.expanded
        let l:icon = g:filelist_attr.bmlist_title
        let l:hl_name = 'FilelistHlBmlistTitle'
        let l:prefix = repeat('  ', 0)
        let l:data_line = g:filelist_mark.expanded.' '.g:filelist_attr.bmlist_title.' Bookmarks'
        call add(a:lines, l:data_line)

        " hl filelist
        let l:line_num = len(a:lines)

        let l:mark_col = len(l:prefix) + 1
        let l:mark_width = strlen(l:mark)
        let l:mark_id = matchaddpos('FilelistHlSetMark', [[l:line_num, l:mark_col, l:mark_width]])
        call add(w:filelist_highlight, l:mark_id)

        let l:icon_col = len(l:prefix) + strlen(l:mark) + 1 + 1
        let l:icon_width = strlen(l:icon)
        let l:icon_id = matchaddpos('FilelistHlSetIcon', [[l:line_num, l:icon_col, l:icon_width]])
        call add(w:filelist_highlight, l:icon_id)

        let l:cont_col = len(l:prefix) + strlen(l:mark) + 1 + strlen(l:icon) + 1 + 1
        let l:cont_width = strlen(l:data_line) - (l:cont_col - 1)
        let l:cont_id = matchaddpos(l:hl_name, [[l:line_num, l:cont_col, l:cont_width]])
        call add(w:filelist_highlight, l:cont_id)

        " loop bmdata
        if !empty(s:filelist_bmdata.items)
            for il in s:filelist_bmdata.items

                " fold icon
                if il.type == 'bfold'
                    let l:mark = g:filelist_mark.reserve
                    let l:icon = g:filelist_attr.fold_close
                    let l:hl_name = 'FilelistHlFoldClose'
                else
                    let l:mark = g:filelist_mark.reserve
                    let l:icon = g:filelist_attr.file_default
                    let l:hl_name = 'FilelistHlFileDefault'

                    " check file type
                    let l:ext = fnamemodify(il.path, ':e')
                    let l:found_type = 0
                    for [type, config] in items(g:filelist_type)
                        if index(config.ext, l:ext) != -1
                            let l:icon = config.icon
                            let l:found_type = 1
                            break
                        endif
                    endfor
                    " check file attr
                    if executable(il.path)
                        let l:icon = !l:found_type ? g:filelist_attr.file_execute : l:icon
                        let l:hl_name = 'FilelistHlFileExecute'
                    elseif getftype(il.path) == 'link'
                        let l:icon = !l:found_type ? g:filelist_attr.file_symlink : l:icon
                        let l:hl_name = 'FilelistHlFileSymlink'
                    endif
                endif

                " set line
                let l:prefix = repeat('  ', 1)
                let l:data_line = l:prefix.l:mark.' '.l:icon.' '.il.name.' '.il.path
                call add(a:lines, l:data_line)

                " hl filelist
                let l:line_num = len(a:lines)

                let l:mark_col = len(l:prefix) + 1
                let l:mark_width = strlen(l:mark)
                let l:mark_id = matchaddpos('FilelistHlSetMark', [[l:line_num, l:mark_col, l:mark_width]])
                call add(w:filelist_highlight, l:mark_id)

                let l:icon_col = len(l:prefix) + strlen(l:mark) + 1 + 1
                let l:icon_width = strlen(l:icon)
                let l:icon_id = matchaddpos('FilelistHlSetIcon', [[l:line_num, l:icon_col, l:icon_width]])
                call add(w:filelist_highlight, l:icon_id)

                let l:cont_col = len(l:prefix) + strlen(l:mark) + 1 + strlen(l:icon) + 1 + 1
                let l:cont_width = strlen(l:data_line) - (l:cont_col - 1)
                let l:cont_id = matchaddpos(l:hl_name, [[l:line_num, l:cont_col, l:cont_width]])
                call add(w:filelist_highlight, l:cont_id)

            endfor
        endif
        call add(a:lines, "")
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkLoad
    " --------------------------------------------------
    function! filelist#BookmarkLoad() abort
        let s:filelist_bmdata.items = []

        " check dir
        if !isdirectory(g:filelist_bmpath)
            call mkdir(g:filelist_bmpath, 'p', 0777)
        endif

        " check file
        if filereadable(s:filelist_bmfile)
            for il in readfile(s:filelist_bmfile)
                let il = substitute(il, '\\ ', "\u0001", 'g')
                let l:parts = split(il, ' ', 1)
                if len(l:parts) >= 2
                    let l:name = substitute(l:parts[0], "\u0001", ' ', 'g')
                    let l:path = substitute(join(l:parts[1:]), "\u0001", ' ', 'g')
                    call add(s:filelist_bmdata.items, {
                                \ 'name': l:name,
                                \ 'path': l:path,
                                \ 'type': isdirectory(l:path) ? 'bfold' : 'bfile'
                                \ })
                endif
            endfor
        endif
        return s:filelist_bmdata
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkSave
    " --------------------------------------------------
    function! filelist#BookmarkSave() abort
        let l:lines = []
        for il in s:filelist_bmdata.items
            let l:name = substitute(il.name, ' ', '\\ ', 'g')
            let l:path = substitute(il.path, ' ', '\\ ', 'g')
            call add(l:lines, l:name.' '.l:path)
        endfor
        call writefile(l:lines, s:filelist_bmfile)
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkInsert
    " --------------------------------------------------
    function! filelist#BookmarkInsert(...) abort
        " get path
        let l:path = ''
        if a:0 > 0
            let l:path = a:1
        else
            let l:node = filelist#GetNode()
            if !empty(l:node)
                let l:path = l:node.path
            endif
        endif
        if empty(l:path)
            let l:prompt_bok = "No valid path specified"
            echohl FilelistPmtError | echo l:prompt_bok | echohl None
            return
        endif

        " get name
        let l:prompt_def = "Please input bookmark name: "
        let l:prompt_fmt = "The name is incorrect. Please try again. (Press Ctrl+C to exit): "
        let l:name_def = fnamemodify(l:path, ':t')

        echohl FilelistPmtNormal | echo l:prompt_def | echohl None
        let l:name_ipt = input('> ', l:name_def)

        while empty(l:name_ipt)
            echohl FilelistPmtWarning | echo l:prompt_fmt | echohl None
            let l:name_ipt = input('> ', l:name_def)
        endwhile

        " check name
        if !empty(l:name_ipt)
            " check exists
            for il in s:filelist_bmdata.items
                if il.path ==# l:path
                    let l:prompt_ext = "\nThis bookmark already exists: ".l:name_ipt." -> ".l:path
                    echohl FilelistPmtError | echo l:prompt_ext | echohl None
                    return
                endif
            endfor

            " add bmdata
            call add(s:filelist_bmdata.items, {
                        \ 'name': l:name_ipt,
                        \ 'path': l:path,
                        \ 'type': isdirectory(l:path) ? 'bfold' : 'bfile'
                        \ })
            call filelist#BookmarkSave()
            let l:prompt_suc = "\nThe bookmark added success: ".l:name_ipt." -> ".l:path
            echohl FilelistPmtSuccess | echo l:prompt_suc | echohl None

            " refresh list
            if exists('s:filelist_bmstate') && s:filelist_bmstate
                call filelist#WinDatalist()
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkDelete
    " --------------------------------------------------
    function! filelist#BookmarkDelete() abort
        if exists('s:filelist_bmstate') && s:filelist_bmstate
            " check node
            let l:node = filelist#GetNode()
            if !empty(l:node) && has_key(l:node, 'path')

                " set new list
                let l:items = []
                let l:removed = 0
                for il in s:filelist_bmdata.items
                    if il.path !=# l:node.path || il.name !=# l:node.name
                        call add(l:items, il)
                    else
                        let l:removed = 1
                    endif
                endfor

                " update list
                if l:removed
                    let s:filelist_bmdata.items = l:items
                    call filelist#BookmarkSave()
                    call filelist#WinDatalist()

                    " move cursor
                    if line('.') > line('$')
                        call cursor(line('$'), 1)
                    endif
                endif
            endif
        endif
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkOpen
    " --------------------------------------------------
    function! filelist#BookmarkOpen() abort
        if !exists('s:filelist_bmstate') || !s:filelist_bmstate
            let s:filelist_bmstate = 1
            call filelist#RefreshList()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkClose
    " --------------------------------------------------
    function! filelist#BookmarkClose() abort
        if exists('s:filelist_bmstate') && s:filelist_bmstate
            let s:filelist_bmstate = 0
            call filelist#RefreshList()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#BookmarkToggle
    " --------------------------------------------------
    function! filelist#BookmarkToggle() abort
        if exists('s:filelist_bmstate') && s:filelist_bmstate
            call filelist#BookmarkClose()
        else
            call filelist#BookmarkOpen()
        endif
    endfunction

    " --------------------------------------------------
    " filelist#ColorBgtype
    " --------------------------------------------------
    function! filelist#ColorBgtype(hex) abort
        let l:r = str2nr(a:hex[1:2], 16)
        let l:g = str2nr(a:hex[3:4], 16)
        let l:b = str2nr(a:hex[5:6], 16)
        let l:brightness = (0.299 * l:r + 0.587 * l:g + 0.114 * l:b) / 255
        return l:brightness > 0.5 ? 'White' : 'Black'
    endfunction

    " --------------------------------------------------
    " filelist#ColorMask
    " --------------------------------------------------
    function! filelist#ColorMask(color, alpha) abort
        let l:res_color = a:color
        if a:color =~? '^#[0-9a-fA-F]\{6}$' && a:alpha >= 0.0 && a:alpha <= 1.0
            let l:r = str2nr(a:color[1:2], 16)
            let l:g = str2nr(a:color[3:4], 16)
            let l:b = str2nr(a:color[5:6], 16)

            let l:mixed_r = float2nr(l:r * (1.0 - a:alpha) + 255 * a:alpha)
            let l:mixed_g = float2nr(l:g * (1.0 - a:alpha) + 255 * a:alpha)
            let l:mixed_b = float2nr(l:b * (1.0 - a:alpha) + 255 * a:alpha)

            let l:mixed_r = max([0, min([255, l:mixed_r])])
            let l:mixed_g = max([0, min([255, l:mixed_g])])
            let l:mixed_b = max([0, min([255, l:mixed_b])])

            let l:res_color = printf('#%02X%02X%02X', l:mixed_r, l:mixed_g, l:mixed_b)
        endif
        return l:res_color
    endfunction

    " --------------------------------------------------
    " filelist#ColorInvert
    " --------------------------------------------------
    function! filelist#ColorInvert(hex)
        let sat = 1.5
        let lit = 0.4

        " HexToHSL
        let r = str2nr(a:hex[1:2], 16) / 255.0
        let g = str2nr(a:hex[3:4], 16) / 255.0
        let b = str2nr(a:hex[5:6], 16) / 255.0

        let max = r > g ? (r > b ? r : b) : (g > b ? g : b)
        let min = r < g ? (r < b ? r : b) : (g < b ? g : b)
        let delta = max - min

        let l = (max + min) / 2.0

        if delta == 0.0
            let h = 0.0
            let s = 0.0
        else
            let s = l < 0.5 ? delta / (max + min) : delta / (2.0 - max - min)
            if max == r
                let h = (g - b) / delta
            elseif max == g
                let h = 2.0 + (b - r) / delta
            else
                let h = 4.0 + (r - g) / delta
            endif
            let h = h * 60.0
            if h < 0.0
                let h = h + 360.0
            endif
        endif

        " change saturation and light
        let s = s * sat > 1.0 ? 1.0 : s * sat
        let l = l * lit

        " HSLToHex
        let h = h >= 360.0 ? 0.0 : h / 360.0
        let s = s < 0.0 ? 0.0 : s > 1.0 ? 1.0 : s
        let l = l < 0.0 ? 0.0 : l > 1.0 ? 1.0 : l

        if s == 0.0
            let r = l
            let g = l
            let b = l
        else
            let q = l < 0.5 ? l * (1.0 + s) : l + s - l * s
            let p = 2.0 * l - q

            let rt = h + 1.0/3.0
            let rt = rt < 0.0 ? rt + 1.0 : rt > 1.0 ? rt - 1.0 : rt
            let r = rt < 1.0/6.0 ? p + (q - p) * 6.0 * rt : rt < 1.0/2.0 ? q : rt < 2.0/3.0 ? p + (q - p) * (2.0/3.0 - rt) * 6.0 : p

            let gt = h
            let gt = gt < 0.0 ? gt + 1.0 : gt > 1.0 ? gt - 1.0 : gt
            let g = gt < 1.0/6.0 ? p + (q - p) * 6.0 * gt : gt < 1.0/2.0 ? q : gt < 2.0/3.0 ? p + (q - p) * (2.0/3.0 - gt) * 6.0 : p

            let bt = h - 1.0/3.0
            let bt = bt < 0.0 ? bt + 1.0 : bt > 1.0 ? bt - 1.0 : bt
            let b = bt < 1.0/6.0 ? p + (q - p) * 6.0 * bt : bt < 1.0/2.0 ? q : bt < 2.0/3.0 ? p + (q - p) * (2.0/3.0 - bt) * 6.0 : p
        endif

        let r = float2nr(round(r * 255.0))
        let g = float2nr(round(g * 255.0))
        let b = float2nr(round(b * 255.0))
        let r = r < 0 ? 0 : r > 255 ? 255 : r
        let g = g < 0 ? 0 : g > 255 ? 255 : g
        let b = b < 0 ? 0 : b > 255 ? 255 : b

        return printf("#%02X%02X%02X", r, g, b)
    endfunction

    " --------------------------------------------------
    " filelist#ColorName
    " --------------------------------------------------
    function! filelist#ColorName(color)
        let l:color_hex = {
                    \ 'Red':            '#FF0000',
                    \ 'LightRed':       '#FF6666',
                    \ 'DarkRed':        '#8B0000',
                    \ 'Green':          '#00FF00',
                    \ 'LightGreen':     '#66FF66',
                    \ 'DarkGreen':      '#006400',
                    \ 'Blue':           '#0000FF',
                    \ 'LightBlue':      '#6666FF',
                    \ 'DarkBlue':       '#00008B',
                    \ 'Cyan':           '#00FFFF',
                    \ 'LightCyan':      '#66FFFF',
                    \ 'DarkCyan':       '#008B8B',
                    \ 'Magenta':        '#FF00FF',
                    \ 'LightMagenta':   '#FF66FF',
                    \ 'DarkMagenta':    '#8B008B',
                    \ 'Yellow':         '#FFFF00',
                    \ 'LightYellow':    '#FFFF66',
                    \ 'Brown':          '#A52A2A',
                    \ 'DarkYellow':     '#CCCC00',
                    \ 'Gray':           '#808080',
                    \ 'LightGray':      '#C0C0C0',
                    \ 'DarkGray':       '#404040',
                    \ 'Black':          '#000000',
                    \ 'White':          '#FFFFFF',
                    \ }

        " parse color
        let l:input_rgb = [0, 0, 0]
        if a:color =~? '^#[0-9a-f]\{3}$'
            let l:hex = a:color[1:]
            let l:input_rgb = [str2nr(l:hex[0].l:hex[0], 16), str2nr(l:hex[1].l:hex[1], 16), str2nr(l:hex[2].l:hex[2], 16)]
        elseif a:color =~? '^#[0-9a-f]\{6}$'
            let l:hex = a:color[1:]
            let l:input_rgb = [str2nr(l:hex[0:1], 16), str2nr(l:hex[2:3], 16), str2nr(l:hex[4:5], 16)]
        elseif a:color =~? '^rgb(\s*\d\+\s*,\s*\d\+\s*,\s*\d\+\s*)$'
            let l:parts = split(matchstr(a:color, '\d\+\s*,\s*\d\+\s*,\s*\d\+'), '\s*,\s*')
            let l:input_rgb = [str2nr(l:parts[0]), str2nr(l:parts[1]), str2nr(l:parts[2])]
        elseif has_key(l:color_hex, a:color)
            let l:hex = l:color_hex[a:color][1:]
            if len(l:hex) == 3
                let l:input_rgb = [str2nr(l:hex[0].l:hex[0], 16), str2nr(l:hex[1].l:hex[1], 16), str2nr(l:hex[2].l:hex[2], 16)]
            else
                let l:input_rgb = [str2nr(l:hex[0:1], 16), str2nr(l:hex[2:3], 16), str2nr(l:hex[4:5], 16)]
            endif
        else
            return 'Black'
        endif

        " check brightness
        let l:brightness = l:input_rgb[0] * 0.299 + l:input_rgb[1] * 0.587 + l:input_rgb[2] * 0.114
        if l:input_rgb[2] > max([l:input_rgb[0], l:input_rgb[1]]) + 20
            return l:brightness > 150 ? 'LightBlue' : 'DarkBlue'
        endif
        if abs(l:input_rgb[0] - l:input_rgb[1]) < 30 && abs(l:input_rgb[1] - l:input_rgb[2]) < 30
            if l:brightness > 180
                return 'White'
            elseif l:brightness > 120
                return 'LightGray'
            elseif l:brightness > 60
                return 'Gray'
            else
                return l:brightness > 30 ? 'DarkGray' : 'Black'
            endif
        endif

        " find name
        let l:min_distance = 999999
        let l:nearest_color = 'Black'
        for [l:color_name, l:hex] in items(l:color_hex)
            let l:palette_hex = l:hex[1:]
            if len(l:palette_hex) == 3
                let l:palette_rgb = [ str2nr(l:palette_hex[0].l:palette_hex[0], 16), str2nr(l:palette_hex[1].l:palette_hex[1], 16), str2nr(l:palette_hex[2].l:palette_hex[2], 16)]
            else
                let l:palette_rgb = [ str2nr(l:palette_hex[0:1], 16), str2nr(l:palette_hex[2:3], 16), str2nr(l:palette_hex[4:5], 16)]
            endif

            let l:dr = l:input_rgb[0] - l:palette_rgb[0]
            let l:dg = l:input_rgb[1] - l:palette_rgb[1]
            let l:db = l:input_rgb[2] - l:palette_rgb[2]
            let l:distance = l:dr*l:dr*0.3 + l:dg*l:dg*0.59 + l:db*l:db*0.11

            if l:distance < l:min_distance
                let l:min_distance = l:distance
                let l:nearest_color = l:color_name
            endif
        endfor

        " adjust result
        if l:brightness > 180 && l:nearest_color =~? '^Dark'
            let l:nearest_color = substitute(l:nearest_color, 'Dark', 'Light', '')
        elseif l:brightness < 80 && l:nearest_color =~? '^Light'
            let l:nearest_color = substitute(l:nearest_color, 'Light', 'Dark', '')
        endif

        return l:nearest_color
    endfunction

    " --------------------------------------------------
    " filelist#SetHlcolor
    " --------------------------------------------------
    function! filelist#SetHlcolor(...) abort
        " check bgcolor
        let l:gbg = !empty(synIDattr(hlID('Normal'), 'bg', 'gui'))   ? synIDattr(hlID('Normal'), 'bg', 'gui')   : '#171C22'
        let l:hlsetmark     = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlsetmark)     : g:filelist_hlsetmark
        let l:hlseticon     = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlseticon)     : g:filelist_hlseticon
        let l:hlfoldclose   = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlfoldclose)   : g:filelist_hlfoldclose
        let l:hlfoldopen    = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlfoldopen)    : g:filelist_hlfoldopen
        let l:hlfiledefault = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlfiledefault) : g:filelist_hlfiledefault
        let l:hlfileexecute = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlfileexecute) : g:filelist_hlfileexecute
        let l:hlfilesymlink = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlfilesymlink) : g:filelist_hlfilesymlink
        let l:hlbmlisttitle = filelist#ColorBgtype(l:gbg) == "White" ? filelist#ColorInvert(g:filelist_hlbmlisttitle) : g:filelist_hlbmlisttitle

        " hl fold and file
        execute 'hi! FilelistHlSetMark     ctermfg='.filelist#ColorName(l:hlsetmark).'     ctermbg=NONE cterm=NONE guifg='.l:hlsetmark     .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlSetIcon     ctermfg='.filelist#ColorName(l:hlseticon).'     ctermbg=NONE cterm=NONE guifg='.l:hlseticon     .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlFoldClose   ctermfg='.filelist#ColorName(l:hlfoldclose).'   ctermbg=NONE cterm=NONE guifg='.l:hlfoldclose   .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlFoldOpen    ctermfg='.filelist#ColorName(l:hlfoldopen).'    ctermbg=NONE cterm=NONE guifg='.l:hlfoldopen    .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlFileDefault ctermfg='.filelist#ColorName(l:hlfiledefault).' ctermbg=NONE cterm=NONE guifg='.l:hlfiledefault .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlFileExecute ctermfg='.filelist#ColorName(l:hlfileexecute).' ctermbg=NONE cterm=NONE guifg='.l:hlfileexecute .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlFileSymlink ctermfg='.filelist#ColorName(l:hlfilesymlink).' ctermbg=NONE cterm=NONE guifg='.l:hlfilesymlink .' guibg=NONE gui=NONE'
        execute 'hi! FilelistHlBmlistTitle ctermfg='.filelist#ColorName(l:hlbmlisttitle).' ctermbg=NONE cterm=NONE guifg='.l:hlbmlisttitle .' guibg=NONE gui=NONE'

        " prompt message
        hi! FilelistPmtDefault ctermfg=Gray   ctermbg=NONE cterm=Bold guifg=#B1B3B8 guibg=NONE gui=Bold
        hi! FilelistPmtNormal  ctermfg=Blue   ctermbg=NONE cterm=Bold guifg=#79BBFF guibg=NONE gui=Bold
        hi! FilelistPmtSuccess ctermfg=Green  ctermbg=NONE cterm=Bold guifg=#95D475 guibg=NONE gui=Bold
        hi! FilelistPmtWarning ctermfg=Yellow ctermbg=NONE cterm=Bold guifg=#EEBE77 guibg=NONE gui=Bold
        hi! FilelistPmtError   ctermfg=Red    ctermbg=NONE cterm=Bold guifg=#F56C6C guibg=NONE gui=Bold
    endfunction

    " --------------------------------------------------
    " filelist_cmd_bas
    " --------------------------------------------------
    augroup filelist_cmd_bas
        autocmd!
        autocmd ColorScheme * call filelist#SetHlcolor()
        autocmd FileType filelist call filelist#SetHlcolor()
        if g:filelist_autostart == 1
            autocmd VimEnter * call timer_start(0, {-> execute('FilelistOpen', '')})
        endif
    augroup END

    " --------------------------------------------------
    " command
    " --------------------------------------------------
    command! -nargs=? FilelistOpen call filelist#Open()
    command! -nargs=? FilelistClose call filelist#Close()
    command! -nargs=? FilelistToggle call filelist#Toggle()
    command! -nargs=? FilelistLocateFile call filelist#LocateFile()

endif

" ============================================================================
" Other
" ============================================================================
let &cpoptions = s:save_cpo
unlet s:save_cpo
