^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::

    global Astal2_X
    global Astral_Y
    
    Initialize()

    KeepCheckingAstrals()
Return

KeepCheckingAstrals()
{
    while (1 = 1)
    {
        if HasAstral(2)
        {
            ;Tooltip, has 2nd Astral, 50, 50, 2
        }
        else
        {
            ;Tooltip, has NOT 2nd Astral, 50, 50, 2
        }

        SleepForMilliseconds(500)
    }
}

Initialize()
{
    global

    Astal2_X := 569
    Astral_Y := 797

    CaptureAstalBaseColors()

    ;Astral2_BaseColor := 0x232323
    ;Astral3_BaseColor := 0x282828
    ;Astral4_BaseColor := 0x282828
    ;Astral5_BaseColor := 0x282828
}

CaptureAstalBaseColors()
{
    global

    SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %Astal2_X%, %Astral_Y%
    Astral2_BaseColor := pixel_value
    Tooltip, %Astral2_BaseColor%, %Astal2_X%, 50, 11

    SleepForMilliseconds(1000)
}

SleepForMilliseconds(milliseconds)
{
	Sleep, milliseconds
}

; index is [1..5]
HasAstral(index)
{
    if (index = 2)
    {
        return HasSecondAstral()
    }

    return false
}

HasSecondAstral()
{
    global

    PixelGetColor, pixel_value, %Astal2_X%, %Astral_Y%

	;if (pixel_value <> %Astral2_BaseColor%)
    if not InStr(pixel_value, Astral2_BaseColor)
    {
        Tooltip, has 2nd Astral %pixel_value% ? %Astral2_BaseColor%, 50, 50, 2
		return true
    }
	else
    {
        Tooltip, doesn't have 2nd Astral %pixel_value% ? %Astral2_BaseColor%, 50, 50, 2
		return false
    }
}
