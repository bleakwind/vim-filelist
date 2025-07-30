# vim-filelist

## A customizable file tree viewer plugin for Vim...
vim-filelist is a powerful file explorer plugin for Vim that provides a tree-style file navigation interface with rich features including bookmarks, file type icons, and customizable appearance.

## Features
- **Tree-style file navigation** with expandable/collapsible directories
- **File type icons** with support for many programming languages and file types
- **Bookmark system** to save frequently accessed files and directories
- **Customizable appearance** with configurable colors and icons
- **Quick file location** to jump to the current file in the explorer
- **Hidden file toggle** to show/hide dotfiles
- **Mouse support** for intuitive navigation
- **Color scheme adaptation** that works with both light and dark backgrounds

## Screenshot
![Filelist Screenshot](https://github.com/bleakwind/vim-filelist/blob/main/vim-filelist.png)

## Requirements
Recommended Vim 8.1+

## Installation
```vim
" Using Vundle
Plugin 'bleakwind/vim-filelist'
```

And Run:
```vim
:PluginInstall
```

## Configuration
Add these to your `.vimrc`:
```vim

" Set 1 enable filelist (default: 0)
let g:filelist_enabled = 1
" Set 1 autostart filelist (default: 0)
let g:filelist_autostart = 1
" Position of the filelist window: 'left' or 'right' (default: 'left')
let g:filelist_position = 'left'
" Width of the filelist window (default: 30)
let g:filelist_winwidth = 30
" Default directory to show (default: getcwd())
let g:filelist_mainpath = getcwd()
" Set 1 Show hidden files (default: 0)
let g:filelist_showhide = 0
" Set Bookmark place (default: $HOME.'/.vim/filelist')
let g:filelist_bmpath = $HOME.'/.vim/filelist'
```

Color Customization
```vim
" set highlight color mark
let g:filelist_hlsetmark     = '#A1ACA3'
" set highlight color icon
let g:filelist_hlseticon     = '#A1ACA3'
" Sets highlight color for closed folder icon
let g:filelist_hlfoldclose   = '#92BDE8'
" Sets highlight color for opened folder icon
let g:filelist_hlfoldopen    = '#92BDE8'
" Sets highlight color for regular files
let g:filelist_hlfiledefault = '#DDDDDD'
" Sets highlight color for executable files
let g:filelist_hlfileexecute = '#EEBE77'
" Sets highlight color for symbolic files
let g:filelist_hlfilesymlink = '#95D475'
" Sets highlight color for bookmark list title
let g:filelist_hlbmlisttitle = '#92BDE8'
" Sets highlight color for help list title
let g:filelist_hlhelplisttitle = '#92BDE8'
" Sets highlight color for help list key
let g:filelist_hlhelplistkey = '#EEBE77'
" Sets highlight color for help list description
let g:filelist_hlhelplistdes = '#A1ACA3'
```

## Usage
| Command               | Description                         |
| --------------------- | ----------------------------------- |
| `:FilelistOpen`       | Open the filelist                   |
| `:FilelistClose`      | Close the filelist                  |
| `:FilelistToggle`     | Toggle the filelist                 |
| `:FilelistLocateFile` | Locate current file in the filelist |

## Key Mappings

### When the filelist is focused:
| Key           | Action                                      |
| ------------- | ------------------------------------------- |
| `o/<CR>`      | Open file/folder or toggle folder expansion |
| `SingleClick` | Selects file/folder and highlights it       |
| `DoubleClick` | Open file/folder or toggle folder expansion |
| `MarkClick`   | Expand or collapse folders                  |
| `C`           | Set current folder as main path             |
| `U`           | Move up one folder level                    |
| `R`           | Refresh the file list                       |
| `E`           | Open in external program                    |
| `.`           | Toggle display hidden file/folder           |
| `B`           | Toggle display bookmark                     |
| `mi`          | Add current file/folder to bookmarks        |
| `md`          | Delete selected file/folder from bookmark   |
| `?`           | Toggle display help message                 |

## License
BSD 2-Clause - See LICENSE file
