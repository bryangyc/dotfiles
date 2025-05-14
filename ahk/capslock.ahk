; ahk to map caplock to ctrl when pressed with another key, and esc when pressed alone.
*CapsLock::Send "{Blind}{Ctrl DownR}"

*CapsLock Up::
{
    Send "{Blind}{Ctrl up}"
    If (A_PriorKey = "CapsLock")
        Send "{Esc}"
}

