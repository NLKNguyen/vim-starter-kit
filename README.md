Vim Starter Kit
==============

Get your Vim ready for real coding within a minute with Vim Starter Kit. Whether you just begin your Vim journey or has been into it for awhile, this starter kit can save you a great deal of time for configuration to set your Vim up as a real coding environment.

Each package contains all preinstalled plugin(s) and therefore can be installed without  Internet connection once you obtain a local copy of this project.


[TOC]
#1 Minute Installation
This Vim Starter Kit includes  [Vim Kit Installer](https://github.com/NLKNguyen/vim-kit-installer) that provides a quick and easy interface for loading and saving Vim configurations.
##Download
Download the source code of this project to anywhere in your local

**Option 1**: using Git (recommended)
```bash
git clone https://github.com/NLKNguyen/vim-starter-kit.git
cd vim-starter-kit
```
Later on, if you want to get updates from this project, just run `git pull` inside your local repo. 

**Option 2**: Download the zip file of this repository and extract it
##Install
*Optional*: If you have previous Vim settings in **~/.vim/** and **~/.vimrc** that you want to restore later, you can back them up using: `./install.sh --save myOldSettings`. 
To restore: `./install.sh --load myOldSettings`

###Basic package
Basic package is consist of a set of minimalist yet essential settings, a preinstalled plugin manager, and a color scheme. This is opinionated-free, meaning it doesn't target any specific programming language or enforce any kind of workflow in Vim. You can think of it as a better Vim default.
```bash
./install.sh --load Basic
```

###Extended package
[TODO: More documentation here]

```bash
./install.sh --load Extended
```

#Basic Package
##Preset Common Settings
Common Vim settings are set and documented in the **.vimrc** file. They are usually the essential settings that are generally used and recommended by most experienced Vim users.

The only key mapping that this package does is mapping the `<leader>` key to `,` as a common practice.


It is also highly recommended that you map `CAPSLOCK` key to `<ESC>` so that your left hand doesn't have to leave the home row to reach the physical ESC button on the keyboard. Also, it helps avoid leaving capslock on, which changes the behavior of keystrokes in normal mode (for example, you think you press 'u' to undo, but it is 'U' with the capslock on, and you don't know why it behaves incorrectly). This is easy to do, but it is outside of Vim scope, so you need to Google how to do it on your particular system.


##Preinstalled  Plugin Manager
The kits are preinstalled a plugin manager ([Vundle](github.com/vundle)) 

To update the preinstalled plugin(s), run `:PluginUpdate` when you have Internet connection. For more information, see Vundle github page.

##Preloaded Color Scheme
It comes with a copy of PaperColor theme designed by the same author of this kit. It is installed as a plugin so that you can update it easily.


#Extended Package
[TODO: More documentation here]

##Preinstalled  Plugins
These plugins have very minimal requirements. No compilation or extra software is required.  If your system can run Vim,  it can run these plugins. 

For each of these plugins, there is likely a valid alternative plugin, but you can't go wrong with either, especially when you are just starting out with Vim.  Some alternatives can be more powerful, and it is up to you to decide whether you want the extra power.


###Comment Toggling
**Vim-Commentary** by Tim Pope https://github.com/tpope/vim-commentary
Toggle comment line or block of code
| Mode   | Default Keys | Action
| ----   | :--         | ------
| Normal | `gcc`        | Toggle comment current line
| Visual | `gc`         | Toggle comment current visual selection
| Normal | `gcu`        | Uncomment adjacent commented lines
| Normal | `gc`[target] | Toggle comment the target of a motion

Examples for `gc`[target]:

* gcap : Toggle comment a paragraph
* gci{ : Toggle comment inner curly braces

###Text Surrounding
**Vim-Surround** by Tim Pope https://github.com/tpope/vim-surround
Surrounding text with parentheses, brackets, quotes, XML tags, and more
| Mode   | Example | Action    
| ----   | :---    | ------    
| Visual | `S"`    | Surround the selected text with `"`
| Normal | `cs"'`  | Change the Surrounding from `"` to `'`
| Normal | `ds"`   | Delete the Surrounding from `"`

See the Github page for more examples.

###Text Alignment
**Tabular** by Matt Wozniski https://github.com/godlygeek/tabular
Common text alignment usages with customized keys for both Normal and Visual modes. For non-trivial usecases, see the Github page.
| Keys   | Action                   | Note
| ----   | :-----                   | ---
| `,a=`  | Align text based on `=`  | `:Tabularize/=`
| `,a:`  | Align text based on `:`  |
| `,a,`  | Align text based on `,`  |
| `,a(`  | Align text based on `(`  |
| `,a)`  | Align text based on `)`  |
| `,a{`  | Align text based on `{`  |
| `,a}`  | Align text based on `}`  |
| `,a[`  | Align text based on `[`  |
| `,a]`  | Align text based on `]`  |
| `,a\|` | Align text based on `\|` |
| `,a\` | Align text based on `\` | useful for multiline C macro

###Source Code Outline Viewer
**Tagbar** by Jan Larres https://github.com/majutsushi/tagbar/
Provides a sidebar that displays the ctags-generated tags of the current file, ordered by their scope. Required *ctags* installed on the system.
| Keys | Action                                 | Note
| ---- | :-----                                 | ---
| `,T` | Toggle Tagbar                          | `:TagbarToggle`
| `,t` | Jump to Tagbar from the current window | `:TagbarOpen j`

###Fuzzy File Finder
**CtrlP** by Kien https://github.com/kien/ctrlp.vim
Full path fuzzy file, buffer, mru, tag, ... finder
| Mode   | Default Key | Action
| ----   | :---:       | ------
| Normal | `<c-p>`     | Open CtrlP window

When CtrlP window is opened:
| Default Keys | Action
| :---:        | ------
| `<c-c>`      | Close CtrlP window 
| `<c-j>`      | Move the cursor up
| `<c-k>`      | Move the cursor down
| `<c-v>`      | Open the selected file in a vertical split window
| `<c-x>`      | Open the selected file in a horizontal split window
| `<c-t>`      | Open the selected file in a new tab
| `<c-d>`      | Toggle between searching file name only and searching full 
| `<c-f>`      | Cycle between modes

See the Github page for more information.

###Directory Browser
**vim-vinegar** by Tim Pope https://github.com/tpope/vim-vinegar
Enhances the Vim's built-in directory browser *netrw*
| Mode   | Keys | Action
| ----   | :--- | ------
| Normal | `-`  | Open directory browser on the current buffer

See the Github page for more information.

###Doxygen Comment
**Doxygen Toolkit** by Mathias Lorente https://github.com/mrtazz/DoxygenToolkit.vim
Add comment in Doxygen format so that you can generate documentation from your code using *Doxygen* program
| Command      | Action
| ----         | ------
| `:Dox`       | Add Function/Class Comment
| `:DoxAuthor` | Add Author Comment and Version
| `:DoxLic`    | Add License Comment
In your **~/.vimrc**, set your name and license to be added in automatically
```
let g:DoxygenToolkit_authorName="[Your Name]"
let g:DoxygenToolkit_licenseTag="[Your License]"
```
See http://www.vim.org/scripts/script.php?script_id=987 for more information


###Syntax Highlighting Enhancement
These syntax highlighting plugins enhance upon Vim built-in syntax highlighting. Although there are different implementations of each, these plugins are compatible with the color scheme that comes with the kit.

* C, Flex, Bison: [Vim Syntax Extra](https://github.com/justinmk/vim-syntax-extra)
* Go: [Vim Go](https://github.com/fatih/vim-go)
* DTrace: [DTrace Syntax File](https://github.com/vim-scripts/dtrace-syntax-file)
* SystemTap: [Vim SystemTap](https://github.com/nickhutchinson/vim-systemtap)
* Haskell: [Haskell Vim](https://github.com/raichoo/haskell-vim)
* PlantUML: [PlantUML Syntax](https://github.com/aklt/plantuml-syntax)
* Markdown: [Vim Markdown](https://github.com/plasticboy/vim-markdown)
* Assembly MIPS: [MIPS](https://github.com/vim-scripts/mips.vim)



##Commonly Used Features


| Keys       | Action
| ----:      | ---
| `,,`       | Update (save) the current file
| `<space>h` | Turn off search highlighting
| `<space>n` | Toggle line number
| `<space>s` | Toggle spelling check
| `<space>w` | Toggle word wrap
| `<space>c` | Toggle highlight column 81+
| `<space>l` | Toggle listing whitespaces
| `<space>?` | Show where the current file is located

**Easier Navigation Between Buffers**
| Keys  | Action                | Default
| ----: | ---                   | ---
| `[b`  | Go to previous buffer | `:bprevious`
| `]b`  | Go to next buffer     | `:bnext`
| `[B`  | Go to first buffer    | `:bfirst`
| `]B`  | Go to last buffer     | `:blast`

**Easier Navigation Between Split Windows**
| Keys    | Action                      | Default
| ----:   | ---                         | ---
| `<c-j>` | Jump to window above        | `<c-w>j`
| `<c-k>` | Jump to window below        | `<c-w>k`
| `<c-h>` | Jump to window on the left  | `<c-w>h`
| `<c-l>` | Jump to window on the right | `<c-w>l`

*Note*: `<c-j>` means ctrl+j


**Easier Navigation Between Tabs**
| Keys  | Action             | Default
| ----: | ---                | ---
| `` ,` `` | Open new tab       | `:tabnew`
| `,1`  | Go to tab #1       | `1gt`
| `,2`  | Go to tab #2       | `2gt`
| `,3`  | Go to tab #3       | `3gt`
| `,4`  | Go to tab #4       | `4gt`
| `,5`  | Go to tab #5       | `5gt`
| `,6`  | Go to tab #6       | `6gt`
| `,7`  | Go to tab #7       | `7gt`
| `,8`  | Go to tab #8       | `8gt`
| `,9`  | Go to tab #9       | `9gt`
| `,0`  | Go to last tab     | `:tablast`
| `,n`  | Go to next tab     | `:tabnext`
| `,b`  | Go to previous tab | `:tabprevious`



##Command Line Interaction
###Execute Any Script
Any script that has an interpreter line at the top, e.g. `#!/usr/sbin/dtrace -s`, can be executed as an executable file, e.g. `./iosnoop.d`, if the file has execution permission.
| Keys             | Action(s)                                     | Note                                              |
| ---------------: | ----------------------------                  | --------------------------                        |
| `<F9>` or `,rr`  | Update & Execute the current file             | Require file execution permission                 |
| `<F8>` or `,sr`  | Update & Execute the current file with `sudo` | Require root password & file execution permission |

###Set Command Line Arguments
The command line arguments can be set to automatically pass right behind the program execution command. This is a convenient way to not having to repeat writing arguments manually for testing purpose.
Default arguments are set as empty in ~/.vimrc
```
let args=""
```
To temporarily change the command line arguments for the current Vim session 
`:let args="[Your Choice]"`

*Note: This is not applicable for Make command*

###Run Make Command (Makefile)
Make is a great build tool for sophisticated programs that pass the 'toy' level. You write the build instructions to a 'Makefile', and Make will look into it to execute. 
| Keys             | Action(s)                                  | Note           |
| ---------------: | ----------------------------               | -------------  |
| `<F7>` or `,ma`  | Save all, Run shell command `make`  | :!make        |
| `<F6>` or `,mc`  | Save all, Run shell command `make clean`   | :!make clean   |
| `<F5>` or `,mr`  | Save all, Run shell command `make run`     | :!make run     |
| `,md`            | Save all, Run shell command `make debug`   | :!make debug   |
| `,mp`            | Save all, Run shell command `make profile` | :!make profile |

***A few things worth mentioning***:
`:make` is actually a Vim command that runs **make**, takes care of the output, and sends the error and log reports to QuickFix window where you can circle through them and quickly jump to reported locations.
`:make!` is similar to the above but skip a second "Press any key to continue" prompt after it ran in the shell.
`:!make` will just send a make command to the shell, which you don't get the benefit of QuickFix. However, depending on your workflow, you may prefer this than using QuickFix.


###Use QuickFix (Debug Window)

| Keys   | Action(s)                 | Note   |
| -----  | -----------------------   | ------ |
| `<F4>` | Open QuickFix window      | :copen |
| `<F3>` | Go to the next target     | :cnext |
| `<F2>` | Go to the previous target | :cnext |




###Compile & Run C/C++ code and Test with Valgrind

Below are convenient shortcuts to work with small C/C++ programs. For more complex program, use Makefile.

**C **

> "C is quirky, flawed, and an enormous success."
> --- Dennis M. Ritchie (C language creator)

Default **C** compiler & compiler flags are set in ~/.vimrc
```
let CCompile="gcc -g -Wall -std=gnu99"
let CLibrary=""
```
To temporarily change it for the current Vim session `:let CCompile="[Your Choice]"`

The following keys only apply when the current buffer is a C file.
| Keys              | Action(s)                                                                                                                                                                 |
| ----:             | -----------------------                                                                                                                                                   |
| `<F9>`<br>or`,rr` | Update, Compile, and Run the current C file <br>Note: only work if the whole program contained within the file.<br>~ `[CCompile] filename.c [CLibrary] && ./a.out [args]` |
| `,cc`             | Update and Compile the current C file into an object file <br>~ `[CCompile] -c filename.c`                                                                                |
| `,CC`             | Save all, Compile all \*.c files in current directory into \*.o <br>~ `[CCompile] -c *.c`                                                                                 |
| `,la`             | Link all \*.o object files in current directory into  an executable file a.out <br>~ `[CCompile] *.o [CLibrary]`                                                          |
| `,ra`             | Run the executable file a.out <br>Similar to `./a.out [args]`                                                                                                             |
| `,lr`             | Shorthand for `,la` then `,ra`                                                                                                                                            |
| `,clr`            | Shorthand for `,cc` then `,la` then `,ra`                                                                                                                                 |
| `,Clr`            | Shorthand for `,CC` then `,la` then `,ra`                                                                                                                                 |
| `,rm`             | Remove object files  and a.out `rm -f *.o *.h.gch a.out`                                                                                                                  |


----------
**C ++**

> "In C++, it's harder to shoot yourself in the foot, but when you do, you blow off your whole leg."
> --- Bjarne Stroustrup (C++ creator)


Default **C++** compiler & compiler flags are set in ~/.vimrc
```
let CppCompile="g++ -g -Wall -std=c++11"
```
To temporarily change it for the current Vim session `:let CppCompile="[Your Choice]"`

The following keys only apply when the current buffer is a Cpp file.

| Keys              | Action(s)                                                                                                                                                          |
| ----:             | -----------------------                                                                                                                                            |
| `<F9>`<br>or`,rr` | Update, Compile, and Run the current C++ file <br>Note: only work if the whole program contained within the file.<br>~ `[CppCompile] filename.cpp && ./a.out [args]` |
| `,cc`             | Update and Compile the current C file into an object file <br>~`[CppCompile] -c filename.cpp`                                                                        |
| `,CC`             | Save all, Compile all \*.c files in current directory into \*.o <br>~`[CppCompile] -c *.cpp`                                                                         |
| `,la`             | Link all \*.o object files in current directory into  an executable file a.out <br>~ `[CppCompile] *.o`                                                              |
| `,ra`             | Run the executable file a.out ~ `./a.out [args]`                                                                                                                   |
| `,lr`             | Shorthand for `,la` then `,ra`                                                                                                                                     |
| `,clr`            | Shorthand for `,cc` then `,la` then `,ra`                                                                                                                          |
| `,Clr`            | Shorthand for `,CC` then `,la` then `,ra`                                                                                                                          |
| `,rm`             | Remove object files  and a.out `rm -f *.o *.h.gch a.out`                                                                                                           |

<br>
*Reminder*: you can set command line arguments for your program to execute with. See '*Set Command Line Arguments*'

----------

**Valgrind** is a powerful tool for detecting many memory management and threading bugs, and profile your programs in detail. It is a must-have/must-use for C/C++ programmers.

Default **Valgrind** command and flags are set in ~/.vimrc
```
let Valgrind="valgrind --leak-check=full --show-leak-kinds=all"
```
To temporarily change it for the current Vim session `:let Valgrind="[Your Choice]"`

The following key only applies when the current buffer is a C/C++ file.
| Key   | Action(s)                                 | Note
| ---:  | ---                                       | ---                                        |
| `,va` | Run Valgrind on the executable file a.out | Require *valgrind* installed on the system |

 
###Compile & Run Lex/Flex and Yacc/Bison code
 Default **Lex/Flex** compiler & compiler flags are set in ~/.vimrc

**Lex/Flex**
```
let Lex="flex"
let LexCompile=CCompile
let LexLibrary="-lfl"
" -lfl on Linux, -ll on Unix

```
To temporarily change it for the current Vim session
`:let Lex="[Your Choice]"`
`:let LexCompile="[Your Choice]"`
`:let LexLibrary="[Your Choice]"`

The following keys only apply when the current buffer is a Lex/Flex file.

| Keys              | Action(s)                                                                                                                                                          |
| ----:             | -----------------------                                                                                                                                            |
| `<F9>`<br>or`,rr` | Update, Compile, and Run the current Lex/Flex file <br>Note: only work if the whole program contained within the file.<br>`[Lex] filename.l` then<br> `[LexCompile] lex.yy.c [CLibrary]` then <br> `./a.out [args]`|
| `,cc`             | Update and Compile the Lex/Flex file to C code <br>`[Lex] filename.l`                                                             |

**Yacc/Bison**
```
let Yacc="bison -d"
let YaccCompile=CCompile
```
To temporarily change it for the current Vim session
`:let Yacc="[Your Choice]"`
`:let YaccCompile="[Your Choice]"`


The following keys only apply when the current buffer is a Lex/Flex file.

| Keys              | Action(s)                                                                                                                                                          |
| ----:             | -----------------------                                                                                                                                            |
| `<F9>`<br>or`,rr` | Update, Compile, and Run the current Yacc/Bison file <br>Note: only work if the whole program contained within the file.<br>`[Yacc] filename.y` then<br> `[YaccCompile] thisfile.tab.c` then <br> `./a.out [args]`|
| `,yy` | Update, Compile the current Yacc/Bison file with lex.yy.c file, then Run. Assume there is a lex.yy.c file generated from Lex/Flex.<br>`[Yacc] filename.y` then<br> `[YaccCompile] thisfile.tab.c lex.yy.c` then <br> `./a.out [args]`|
| `,cc`             | Update and Compile the Lex/Flex file to C code <br>`[Yacc] filename.y`                                                             |
###Compile & Run Assembly code

Default assembler and flags  for **NASM**, **GAS**,  and **MIPS** are set in ~/.vimrc
```VimL
let NASM="nasm -f elf64"
let MIPS="spim -file"
let GAS="gcc"
```
**NASM**
| Key             | Action(s)                                 
| ---:            | ---                                                 
| `<F9>` or `,rr` | Update then Compile, Link, and Run the current NASM file <br> `[NASM] thisfile.asm` then `ld thisfile.o` then `./a.out [args]`
| `,cc` | Update then Compile `[NASM] thisfile.asm`  

**GAS**
| Key             | Action(s)                                 
| ---:            | ---                                                 
| `<F9>` or `,rr` | Update then Compile & Link, and Run the current GAS file <br> `[GAS] thisfile.s` then `./a.out [args]`
| `,cc` | Update then Compile `[GAS] -c thisfile.s`  

**MIPS**
| Key             | Action(s)                                 
| ---:            | ---                                                 
| `<F9>` or `,rr` | Update then Run the current MIPS file<br> `[MIPS] thisfile.S [args]`

Since there are many different implementations of assembly language that use the same file extension ( .asm, .S or .s), these auto commands in **~/.vimrc** force \*.asm files to be recognized as NASM file, \*.S file as MIPS file, and  \*.s file as GAS file. This is for the purpose of letting Vim use the correct syntax highlighting for the language.
```VimL
au BufEnter *.asm setlocal filetype=nasm
au BufEnter *.S setlocal filetype=mips
au BufEnter *.s setlocal filetype=gas
```
This convention is purely subjective, so if you use a different Assembly or have a different convention, you may want to change or remove/comment out these lines.

You can manually set the correct file type for the current buffer so that Vim can use the correct syntax highlighting, for example `:set filetype=masm`. 
However, Vim has a way to handle  this semi-automatically,  which is to have a declaration line `asmsyntax=nasm` on the top of your Assembly file. Replace "nasm" with the name of the real assembly syntax.  This line must be one of the first five lines in the file.  No non-white text must be immediately before or after this text, for example `; asmsyntax=tasm ;` or `# asmsyntax=gas  #` depending on the symbol for comment in the language. After you put this declaration in for the first time, you need to reload the file. If you use this method, every Assembly file you work on needs to have the declaration line, and you have to remove/comment out the auto commands above.


###Run DTrace and SystemTap
Default **DTrace** and **SystemTap** commands and flags are set in ~/.vimrc
```
let DTrace="sudo dtrace -s"
let SystemTap="sudo stap"
```
To temporarily change any of them for the current Vim session 
`:let DTrace="[Your Choice]"`
`:let SystemTap="[Your Choice]"`

**Run DTrace**
| Keys             | Action(s)                                     | Note                         |
| ---------------: | ----------------------------                  | --------------------------   |
| `<F9>` or `,rr`  | Update & Run DTrace on the current .d file    | Require DTrace enable system |
| `<F8>` or `,sr`  | Update & Execute the current file with `sudo` | See *Execute Any Script*     |


**Run SystemTap**
| Keys              | Action(s)                                       | Note                            |
| ----------------: | ----------------------------                    | --------------------------      |
| `<F9>` or `,rr`   | Update & Run SystemTap on the current .stp file | Require SystemTap enable system |
| `<F8>` or `,sr`   | Update & Execute the current file with `sudo`   | See *Execute Any Script*        |


----------


***For DLang programmers***:
As you may know,  **.d** is unfortunately the same extension for both [DTrace](http://dtrace.org/blogs/about/) and [DLang](http://dlang.org/). To avoid file type recognizing confusion, an auto command is set to force Vim to recognize any .d file as DTrace script
```VimL
au FileType d setlocal filetype=dtrace
```
If you like to use DLang, remove or comment out that line in ~/.vimrc. Then, Vim will recognize \*.d as DLang by default. Any DTrace script that already has an interpreter line at the top (see '*Run Any Script*' section) is still recognized as DTrace file. If the interpreter line isn't set yet, run this command to let Vim knows that you are working on a DTrace script `:set filetype=dtrace`

###Work with PlantUML
Default PlantUML command is set in ~/.vimrc
```VimL
let PlantUML="java jar ~/PlantUML/plantuml.jar"
```
Change the path to *plantuml.jar* to your preferred location. Your system also needs to have Java installed.

| Keys | Action(s)                    |
 -------------------: | ---------------------------- |
| `,,`       | Update the current PlantUML file and generate a PNG image from it |
| `<F9>` or `,rr`      | Update the current PlantUML file and generate a SVG image from it |

If you want live preview, use a image viewer that doesn't block the image file from being overwritten and also supports auto reload the currently opened file when it changes. GNU Image Viewer that comes with Ubuntu OS is one example.



<br><br>


**Table of contents**

[TOC]

> **Author**: Nguyen Nguyen (NLKNguyen@MSN.com)

