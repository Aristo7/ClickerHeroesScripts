^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::
	if IsClickerHeroes()
	{	
		; Important settings!
		Maximum_Runs := 1000
		Row_To_Guild := 2
		Column_To_Guild := 2	
	
		Guild(Maximum_Runs)
	}
Return

IsClickerHeroes()
{
	Title := "unknown"
	WinGetTitle, Title, A
	
	LookingFor := "Clicker Heroes"
	
	if InStr(Title, LookingFor)
		return true
	else
		return false
}

IsGuilded(x, y)
{
	PixelGetColor, pixel_value, %x%, %y%
	
	if (pixel_value == 0x666666)
		return false
	else
		return true
}

ShouldBeGuilded(row, column)
{
	; TODO if Row_To_Guild and Column_To_Guild are actually available in this scope
	if row = 2
		if column = 2
			return true
	
	return false
}

SleepForMilliseconds(milliseconds)
{
	Sleep, milliseconds
}

Deguild(x, y)
{
	Click %x%, %y%
	
	SleepForMilliseconds(100) ; wait for the menu to come up
	Click 850, 666 ; where YES button for de-guild for 2 hero souls
	
	SleepForMilliseconds(300) ; wait for the menu to come up	
	Click 960, 550 ; clicking on chest
	
	SleepForMilliseconds(1000) ; wait for the chest to open
	Click 975, 800 ; clicking on Get More
	
	SleepForMilliseconds(100) ; wait for the menu to go away
	MouseMove, 50, 50 ; to avoid in-game popup
}

Guild(Maximum_Runs)
{	
	; vertically a guild button is 100 pixel high
	; with 10 pixel in between
	
	x_start := 550
	x_step	:= 570-210
	
	y_start := 200
	y_step 	:= 100+10
	
	irow := 1
	icol := 1
	rows := 6
	cols := 4
	
	run := 1
	
	while run <= Maximum_Runs
	{
		Tooltip, Run %run% out of %Maximum_Runs% Press Ctrl+Alt+P to pause or resume, 50, 50, 2		
	
		run++
		found_wrong_guild := false
	
		irow := rows
		while irow >= 1 and !found_wrong_guild
		{
			icol := cols
			while icol >= 1 and !found_wrong_guild
			{
				x := x_start + (icol-1) * x_step
				y := y_start + (irow-1) * y_step
				
				is_guilded := IsGuilded(x, y)
				if (!ShouldBeGuilded(irow, icol) and is_guilded)
				{
					; Tooltip, Should not be guilded, x, y-50
					found_wrong_guild := true
				}
				else
				{
					; Tooltip, OK, x, y-50
				}				
				
				if found_wrong_guild
				{
					Deguild(x, y)
					; Tooltip
				}

				icol--
			}	
			irow--
		}
		
		if !found_wrong_guild
		{
			; then check higher heroes
			Click 1738, 590
			SleepForMilliseconds(100)
		}
	}
	
	; Tooltip
	Tooltip, Done Guilding, 50, 50, 2
}

