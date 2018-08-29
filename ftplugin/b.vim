if exists ("b:did_ftplugin") || version < 700
   finish
endif

let b:did_ftplugin = 45

let $PATH.= ':' . expand('<sfile>:p:h') . '/..'
