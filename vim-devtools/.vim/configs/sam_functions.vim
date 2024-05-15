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

command! RefactorGlobal call RefactorGlobal()
