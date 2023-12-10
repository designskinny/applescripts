tell application "Messages" to activate

tell application "System Events"
	tell process "Messages"
		set frontmost to true
		delay 0.5
		
		-------------------------------------------------------------
		# Filter on and count unknown senders
		-------------------------------------------------------------
		click (first menu item whose name contains "Unknown") ¬
			of menu "View" of menu bar item "View" of menu bar 1
		delay 0.2
		
		set numberOfJunkMessages to count of ((UI elements of ¬
			group 1 of group 1 of group 1 of group 2 of ¬
			group 1 of group 1 of group 1 of group 2 of ¬
			group 1 of group 1 of group 1 of group 1 of ¬
			group 1 of group 1 of group 1 of window 1 of ¬
			application process "Messages" of application "System Events") ¬
			whose role is "AXGenericElement")
		
		-------------------------------------------------------------
		# Iterate selecting and deleting messages in sidebar
		-------------------------------------------------------------
		repeat numberOfJunkMessages times
			
			click ((first UI element of ¬
				group 1 of group 1 of group 1 of group 2 of ¬
				group 1 of group 1 of group 1 of group 2 of ¬
				group 1 of group 1 of group 1 of group 1 of ¬
				group 1 of group 1 of group 1 of window 1 of ¬
				application process "Messages" of application "System Events") ¬
				whose role is "AXGenericElement")
			delay 0.3
			
			click menu item "Delete Conversation…" of menu ¬
				"Conversation" of menu bar item "Conversation" of menu bar 1
			delay 0.2
			
			try
				click button "Delete and Report Junk" of sheet 1 of window 1
				delay 0.2
			on error errMessage number errNumber
				log errMessage
				try
					click button "Delete" of sheet 1 of window 1
					delay 0.2
				end try
			end try
			
		end repeat
		
		-------------------------------------------------------------
		# Switch back to known senders
		-------------------------------------------------------------
		click (first menu item whose name contains "All Messages") ¬
			of menu "View" of menu bar item "View" of menu bar 1
		
	end tell
end tell
