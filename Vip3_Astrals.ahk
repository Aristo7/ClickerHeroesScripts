^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::

    global Capture_X
    global Synthesize_X
	global Button_Y

    Initialize()

    ; Important settings!
    Maximum_Runs := 3000

    Astral(Maximum_Runs)
Return

Astral(Maximum_Runs)
{
    Loop, %Maximum_Runs%
    {
	    Click %Capture_X%, %Button_Y%
		SleepForMilliseconds(500)
	    Click %Synthesize_X%, %Button_Y%
		SleepForMilliseconds(500)
    }
}

Initialize()
{
    global

    Capture_X := 744
    Synthesize_X := 911
    Button_Y := 697
}

SleepForMilliseconds(milliseconds)
{
	Sleep, milliseconds
}
