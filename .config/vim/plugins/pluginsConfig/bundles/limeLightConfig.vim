
" ... limeLightConfig.vim

" color name or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" color name or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" default: 0.5
let g:limelight_default_coefficient = 0.7

" number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"let g:limelight_bop = '^\s'
"let g:limelight_eop = '\ze\n^\s'

" highlighting priority (default: 10)
let g:limelight_priority = -1 " set it to -1 not to overrule hlsearch

" mappings
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

