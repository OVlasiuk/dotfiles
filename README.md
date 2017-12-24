# Code snippets

This repository is intended for scripts in Python, Bash, and Vimscript, used as
hacks and tweaks in my current Linux install.

## Contents:

- **wspacetorus.py**
- **.vimrc**

## Usage

### wspacetorus.py

A script that treats the workspaces of the window manager as a 2-dimensional grid.<br>
**Prerequisites:** wmctrl.

<p align="center">
<img src="https://raw.githubusercontent.com/OVlasiuk/snippets/master/img/expogrid.png" width="800" title="A Cinnamon Expo view with the 'Grid' option enabled.">
</p>

Makes it a little easier to move windows between workspaces. Cinnamon allows
direct navigation between the workspaces, but I find it a little nicer to think
of the workspaces in terms of a grid. The pictured configuration is 

Call the script like this

> wspacetorus.py -h

to show help;

> wspacetorus.py -t left

to move the current window to the workspace to the left; the directions are
determined as in the picture above and periodized, so for example moving left
in workspace 1 puts you in workspace 2.

There is a Cinnamon [applet](https://cinnamon-spices.linuxmint.com/applets/view/116)
that is supposed to achieve the same goal, but it conflicts with the Expo, and is quite
buggy.


### .vimrc

A sample startup script for (Neo)vim.<br>
**Prerequisites:** a Vim-compatible editor.

I am using it with a Neovim on Arch (Manjaro), and before that on Mint. Essentially
everything not related to Youcompleteme, Pymode, and such should be portable.
Some autocommands towards the end, especially those involving window motions are
quite useful. The dual keyboard layout with **set keymap=ukrainian-jcuken** is
apparently somewhat uncommon, and not very practical; manually remapping the
symbols in **nmap** seems a better option.

The complete list of installed Vim plugins using this *.vim* is:<br>
conque_gdb, conque_term, calendar, delimitMate, diffchar, gundo, NERD_commenter,
NERDTree, pymode, tagbar, UltiSnips, airline, airline,-themes, bufferline,
solarized, cursorword, fugitive,  misc, session, speeddating, surround,
tmux-navigator, vimtex, vimwiki, vissort, youcompleteme.<br>
They all can be found through the [vimawesome.com](https://vimawesome.com)
website, for example.


