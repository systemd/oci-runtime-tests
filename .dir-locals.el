; Sets emacs variables based on mode.
; A list of (major-mode . ((var1 . value1) (var2 . value2)))
; Mode can be nil, which gives default values.

((sh-mode . ((sh-basic-offset . 8)))
 (nil . ((indent-tabs-mode . nil)
         (tab-width . 8)
         (fill-column . 79))) )
