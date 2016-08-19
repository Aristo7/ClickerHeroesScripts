^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::
    ; Important settings!
    Maximum_Runs := 30
    ClickSpam(Maximum_Runs)
Return

ClickSpam(Maximum_Runs)
{
    start_x := 484
    astral_y := 789    

    Loop, %Maximum_Runs%
    {
        Tooltip, %a_index% out of %Maximum_Runs% ..., 50, 50

        Loop, 10
        {
            astral := 5
            while astral > 0
            {
                astral_x := start_x + (astral - 1) * 100

                Click, %astral_x%, %astral_y%
                SleepForMilliseconds(50)

                astral := astral - 1
            }
        }

        Synthesize()
    }

    Tooltip, Done!, 50, 50
}

Synthesize()
{
    Click, 909, 701
    SleepForMilliseconds(50)
}

SleepForMilliseconds(milliseconds)
{
	Sleep, milliseconds
}
