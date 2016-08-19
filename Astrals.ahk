^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::

    global Astal2_X
    global Astal3_X
    global Astal4_X
    global Astal5_X

    global Astral_Y

    global LastAstralSpot_X
    global LastAstralSpot_Y

    global LastAstralSpot_BaseColor
    
    Initialize()

    ; Important settings!
    Maximum_Runs := 3000

    Astral(Maximum_Runs)
Return

Astral(Maximum_Runs)
{
    astrals_on_board := 0

    Loop, %Maximum_Runs%
    {
        Tooltip, Run %a_index% out of %Maximum_Runs% Press Ctrl+Alt+P to pause or resume, 50, 50, 2	

        if HasAstral(2)
        {
            ; has astral 2
            if HasAstral(3)
            {
                ; has 2 and 3
                if  HasAstral(4)
                {
                    ; has 2 and 3 and 4
                    if HasAstral(5)
                    {
                        ClickAstral(5)
                    }
                    else
                    {
                        ClickAstral(4)
                    }
                }
                else
                {
                    ClickAstral(3)
                }
            }
            else
            {
                ClickAstral(2)                
            }            
        }
        else
        {
            ClickAstral(1)
        }

        astrals_on_board := astrals_on_board + 1

        ;if AreAstralsFull()
        if astrals_on_board > 15
        {
            Synthesize()
            astrals_on_board := 0
        }
    }

    Tooltip, Done, 50, 50, 2
}

Initialize()
{
    global

    Astal2_X := 524+50
    Astal3_X := 620+50
    Astal4_X := 717+50
    Astal5_X := 815+50

    Astral_Y := 792

    LastAstralSpot_X := 984
    LastAstralSpot_Y := 618

    CaptureAstalBaseColors()

    ;Astral2_BaseColor := 0x232323
    ;Astral3_BaseColor := 0x282828
    ;Astral4_BaseColor := 0x282828
    ;Astral5_BaseColor := 0x282828
}

CaptureAstalBaseColors()
{
    global

    ;SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %Astal2_X%, %Astral_Y%
    Astral2_BaseColor := pixel_value
    Tooltip, %Astral2_BaseColor%, %Astal2_X%, 50, 11

    ;SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %Astal3_X%, %Astral_Y%
    Astral3_BaseColor := pixel_value
    Tooltip, %Astral3_BaseColor%, %Astal3_X%, 50, 12

    ;SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %Astal4_X%, %Astral_Y%
    Astral4_BaseColor := pixel_value
    Tooltip, %Astral4_BaseColor%, %Astal4_X%, 50, 13

    ;SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %Astal5_X%, %Astral_Y%
    Astral5_BaseColor := pixel_value
    Tooltip, %Astral5_BaseColor%, %Astal5_X%, 50, 14

    ;SleepForMilliseconds(1000)

    PixelGetColor, pixel_value, %LastAstralSpot_X%, %LastAstralSpot_Y%
    LastAstralSpot_BaseColor := pixel_value    
}

Synthesize()
{
    Click, 923, 703
    SleepForMilliseconds(100)
}

AreAstralsFull()
{
    PixelGetColor, pixel_value, 982, 618
	
	if InStr(pixel_value, LastAstralSpot_BaseColor)
		return false
	else
		return true
}

; index [1..5]
ClickAstral(index)
{
    global
    if index = 1
    {
        Click, 470, %Astral_Y%
    }
    if index = 2
    {
        Click, 570, %Astral_Y%
    }
    if index = 3
    {
        Click, 670, %Astral_Y%
    }
    if index = 4
    {
        Click, 770, %Astral_Y%
    }
    if index = 5
    {
        Click, 870, %Astral_Y%
    }
    SleepForMilliseconds(350)
}

SleepForMilliseconds(milliseconds)
{
	Sleep, milliseconds
}

; index is [1..5]
HasAstral(index)
{
    if index = 2
    {
        return HasSecondAstral()
    }
    if index = 3
    {
        return HasThirdAstral()
    }
    if index = 4
    {
        return HasFourthAstral()
    }
    if index = 5
    {
        return HasFifthAstral()    
    }

    return false
}

HasSecondAstral()
{
    global

    PixelGetColor, pixel_value, %Astal2_X%, %Astral_Y%

	if InStr(pixel_value, Astral2_BaseColor)
    {
		return false
    }
	else
    {
		return true
    }
}

HasThirdAstral()
{    
    global

    PixelGetColor, pixel_value, %Astal3_X%, %Astral_Y%
	
	if InStr(pixel_value, Astral3_BaseColor)
		return false
	else
		return true
}

HasFourthAstral()
{
    global
    
    PixelGetColor, pixel_value, %Astal4_X%, %Astral_Y%
    ;Tooltip, %pixel_value%, 773, 794+10, 13
	
	if InStr(pixel_value, Astral4_BaseColor)
		return false
	else
		return true
}

HasFifthAstral()
{
    global

    PixelGetColor, pixel_value, %Astal5_X%, %Astral_Y%
    ;Tooltip, %pixel_value%, 851, 799+10, 14
	
	if InStr(pixel_value, Astral5_BaseColor)
		return false
	else
		return true
}
