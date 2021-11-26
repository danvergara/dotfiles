let g:nvim_data_root = stdpath('data')
let g:nvim_config_root = stdpath('config')
let g:config_file_list = ['/nvim-plugins/plugins.vim',
    \ '/general/settings.vim',
    \ '/keymapping/keys.vim',
    \ '/plug-config/ale.vim',
    \ '/plug-config/airline.vim',
    \ '/plug-config/coc.vim',
    \ '/plug-config/ctrlp.vim',
    \ '/plug-config/nerdcommenter.vim',
    \ '/plug-config/nerdtree.vim',
    \ '/plug-config/terraform.vim',
    \ '/plug-config/vim-go.vim',
    \ ]

for f in g:config_file_list
    execute 'source ' . g:nvim_config_root . f
endfor
