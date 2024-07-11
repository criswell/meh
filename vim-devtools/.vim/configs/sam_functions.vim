function! RefactorGlobal()
    let old_word = expand("<cword>")    " Get the word under the cursor
    let new_word = input("Enter new word: ")  " Prompt for the new word
    if new_word != ""   " Check if a new word is provided
        execute 'bufdo %s/\<' . old_word . '\>/' . new_word . '/gc | w'
        " Replace occurrences of old word with new word in all buffers, asking for confirmation
    else
        echo "No new word provided. Aborting."   " Print error message if no new word is provided
    endif
endfunction

nnoremap <PageUp> :call PageUpOrTop()<CR>

function! PageUpOrTop()
    " Get the current line number
    let l:current_line = line('.')
    " Scroll one page up
    execute "normal! \<PageUp>"
    " Get the new line number after scrolling up
    let l:new_line = line('.')
    " Check if the line number did not change (indicating no more pages left to scroll)
    if l:current_line == l:new_line
        " Move to the first line
        normal! gg
    endif
endfunction
