Typecheck B files in vim using AtelierB's bcomp.

== Prerequisite
  * AtelierB (www.atelierb.eu)
  * Vim8 (www.vim.org)
  * Ale (github.com/w0rp/ale)

== Install
  cd ~/.vim/pack/foo/start
  git clone https://github.com/rsaill/vim-b

== Usage
  * Write a bcwrap.json file for your project and put it in your source file directory or in a parent directory. 
  * Open a B component with Vim.
  * That's all! Ale is now configured to lint b files.

