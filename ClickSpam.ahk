^!p::Pause  ; Press Ctrl+Alt+P to pause. Press it again to resume.

^g::
	if IsClickerHeroes()
	{	
		; Important settings!
		Maximum_Runs := 1000	
		ClickSpam(Maximum_Runs)
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

ClickSpam(Maximum_Runs)
{
    Loop, %Maximum_Runs%
    {
	    Click
    }
}

