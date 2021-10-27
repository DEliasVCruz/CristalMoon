function! s:deregister_autocmd() abort
    autocmd TextChanged <buffer> ++once autocmd! LspInstallerWindow
endfunction

wincmd H | call s:deregister_autocmd()
