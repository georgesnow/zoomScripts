--TODO:Catalina screen capture
--Turn On Zoom permissions
on is_running(appName)
	tell application "System Events" to (name of processes) contains appName
end is_running

set zoomRunning to is_running("zoom.us")
if zoomRunning then
	try
		
		tell application "zoom.us" to quit
		
	on error error_message number error_number
		--zoom doesnt exit grafully like every other app...err
		if error_number is equal to -128 then
			delay 1
			tell application "System Preferences"
				set the current pane to pane id "com.apple.preference.security"
				delay 1
				tell application "System Events"
					--not perfect but does the job of toggling the states
					select (first row of table 1 of scroll area 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" whose value of item 1 of static text 1 of UI element 1 contains "Mic")
					delay 0.1
					set micStatus to value of checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events" as boolean
					if micStatus is false then
						
						click checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events"
					end if
					select (first row of table 1 of scroll area 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" whose value of item 1 of static text 1 of UI element 1 contains "Cam")
					set camStatus to value of checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events" as boolean
					if camStatus is false then
						
						click checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events"
					end if
					delay 1
					tell application "zoom.us" to activate
				end tell
				
			end tell
		end if
		
	end try
else
	tell application "System Preferences"
		set the current pane to pane id "com.apple.preference.security"
		delay 1
		tell application "System Events"
			select (first row of table 1 of scroll area 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" whose value of item 1 of static text 1 of UI element 1 contains "Mic")
			delay 0.1
			set micStatus to value of checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events" as boolean
			if micStatus is false then
				
				click checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events"
			end if
			select (first row of table 1 of scroll area 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" whose value of item 1 of static text 1 of UI element 1 contains "Cam")
			set camStatus to value of checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events" as boolean
			if camStatus is false then
				
				click checkbox 1 of UI element "zoom.us" of row 2 of table 1 of scroll area 1 of group 1 of tab group 1 of window "Security & Privacy" of application process "System Preferences" of application "System Events"
			end if
			
		end tell
		
	end tell
end if