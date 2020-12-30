# Vi/Vim
## Mode of operation in VI
- Command Mode : keys pressed are not visible,for cursor movement etc
- Insert Mode : to insert new text etc 
- Ex Command Mode : give commands at the command line, bottom lien of the vi screen in called command line   

Note: Press i to go to insert mode, esc to leave insert mode and enter commmand mode

## Command Mode 
- press R to override characters while typing  
- w - move characters word by word on right
- b - move characters word by word on left(backword)  
- e - go to end of the word, constant pressign move forward with cursor at end of the words  
- H, M , L : mvoe to first, mid and last line of screen  
- ctrl + f : scroll one window forward  
- ctrl + b : scroll one window backward
- u - Undo
- ctrl + r - Redo
- J : joing current line with the next line


### Delete text in vi
- x : delete char at curent position  
- X : delete char to the left of  cursor  
- dw : delete a word from cursor to next space(including)  
- dd : delete current line  
- nx, ndw, ndd : delete n chars, words or lines  
- d0 : delete current line to left till begining of line from cursor  
- d$ : delete line from cursor to the end of file  
- d30G : delete from current line till 30th
- df. : delete from cursor till first .

## copy
- yy : copy current line
- y$ : copy from cursor till end
- 6yy : copy 6 lines
- yw : copy current word
- y3w or 3yw : copy 3 words

## paste
- p : put deleted/copied text below line or right of cursor
- P : put deleted/copied text above line or left of cursor

## Misc
- c : change character, consider variants like c0,c$ etc
- cc : change current line
- ~ : change case of the character under cursor , consider 3~ for 3 characters
- . : repeat last editing command
- u : undo 
- U : undo all changes done in the file
- Ctrl r : redo

## Insert Mode  
- a : shift to input mode and append text after the cursor  
- A : shift to input mode and append text at end of line  
- i : shift to input mode and append text at the cursor  
- I : shift to input mode and append text at begining of line  
- o : shift to input mode and open a new line below current line  
- O : shift to input mode and open a new line aove current line

- ## Ex Commmand Mode
- :w - save 
- :wq - save and quit
- :w new_file  - save current content to another file, current file remains same
- :5w newfilename - save first 5 lines to newfilename
- :10,15w newfilename - saves 10th through 15 line to newfilename
- :.,$ newfilename - saves current line throgh end in newfilename

- :e -> open new file
- :ls 

## String search in Vi
- search for a string/regex in entire file
- search char in current line
```sh
/pat : search pat in file
?pat : search pat backward
n : next match forward
N : next match backward or previous
fch : move to next 'ch' in current line 
Fch : fch but backward
tch : move to just before next 'ch' in current line 
Tch : move to just before next 'ch' in current line  but backward
; : repeat search with f,F,t,T

```
### replace
```sh
:s/s1/s2/ -> replace first occurance of s1 with s2 from current line
:n1,n2s/s1/s2/ -> replace first occurance of s1 with s2 from line n1 to n2
:n1,n2s/s1/s2/g -> replace ALL first occurance of s1 with s2 from line n1 to n2
:n1,n2s/s1/s2/gc -> interactively  replace ALL first occurance of s1 with s2 from line n1 to n2
    n1 and n2 can be 
    . - current line 
    1 - first line 
    $ - last line 
:.,$s/s1/s2/gcI -> (I represents case insensitive)interactively  replace ALL first occurance of s1 with s2 from current line through the end
```
Once can abort(q), break interactive(a) on getting confirmation before replacing in addition to y and n

### Reqular expression to search in vi
```sh
* 0 or more previous charactor, t*his will match this and his both
[pqr] any of characters in [], [pqr]atch will match for patch/qatch/ratch
[^pqr] any except p,q,r
. Single character, r.t will match rat and rut both
^pat, matches pattern at begining of the file
pat$, matches pattern at end of the file
\<pat matches pattern at start of the word
pat\> matches pattern at end of the word
```
Note: use regex to search and replace text in above section
## Misc Vi/Vim
Recover form crash
>  vi -r foo

Prepend each line with line number using vim
> :%s/^/\=line('.').". " // Ex Command Mode

From Vi switch to shell ($ prompt) and come back
```
:sh -> vi to shell
ctrl d -> shell to vi again
```

- 40G : Go to start of 40th(nth) line
- G : Go to begining of last line of the file
- vi +40 filename : Open file with cursor on nth(40th) line
- vi + filename : Open file with cursor on last line

Move through words
    Beginning of word : b
    End of the words : e
    Beginning of next word : w 

## misc vi command
ctrl + l : clear the window
