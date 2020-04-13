--TODO:Catalina screen capture
--Turn On Zoom permissions
on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

on setPane(paneID)
	tell application "System Preferences"
		set the current pane to pane id "com.apple.preference.security"
		delay 1
		tell application "System Events"
			select (first row of table 1 of scroll area 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" whose value of item 1 of static text 1 of UI element 1 contains paneID)
		end tell
	end tell
end setPane

on toggleClick(onOroff, appName)
	set SWindow to "Security & Privacy"
	set stateOf to onOroff
	tell application "System Events"
		tell process "System Preferences"
			set i to 0
			repeat until i is 4
				set i to i + 1
				try
					--clicks the checkbox
					--click checkbox 1 of UI element appName of row i of table 1 of scroll area 1 of group 1 of tab group 1 of window SWindow -- click on activate check box if not yet set
					if value of checkbox 1 of UI element appName of row i of table 1 of scroll area 1 of group 1 of tab group 1 of window SWindow is onOroff then
						return
					else
						click checkbox 1 of UI element appName of row i of table 1 of scroll area 1 of group 1 of tab group 1 of window SWindow
					end if

				end try
				
			end repeat
		end tell
	end tell
end toggleClick



set zoomRunning to is_running("zoom.us")
if zoomRunning then
	try
		
		tell application "zoom.us" to quit
		
	on error error_message number error_number
		--zoom doesnt exit grafully like every other app...err
		if error_number is equal to -128 then
			delay 1
			setPane("Mic")
			toggleClick(0, "zoom.us")
			delay 0.1
			setPane("Cam")
			toggleClick(0, "zoom.us")
			
			
		end if
		
	end try
end if
