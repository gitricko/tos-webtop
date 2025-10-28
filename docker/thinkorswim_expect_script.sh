#!/usr/bin/expect -f

# Set a timeout for commands (in seconds)
set timeout 5

# The path to your installer script
set INSTALLER_SCRIPT "/tmp/thinkorswim_installer.sh"
set FOLDER_PATH "/config/thinkorswim"

# Use Tcl's 'file exist' command to check if the path exists AND
# 'file isdirectory' to ensure it is specifically a directory.
if {[file exist $FOLDER_PATH] && [file isdirectory $FOLDER_PATH]} {
    # The folder exists and is a directory. Exit the script.
    puts "ToS Desktop is already installed. Exiting script."
    exit 0
} else {
    puts "ToS Desktop is not installed. Proceeding with installation."
}

# 1. Start the installer in console mode (-c)
spawn sh $INSTALLER_SCRIPT -c

# 2. Respond to "Please select a language:"
# Expected: "3: English [Enter]"
expect "\[1 - 3\]"
send "3\r"

# 3. Respond to "OK [o, Enter], Cancel [c]"
# Expected: "OK [o, Enter]"
expect "Cancel \[c\]"
send "o\r"

# 4. Respond to "Please select your account provider"
# Expected: "Schwab [1, Enter]"
expect "thinkorswim Guest Pass - 30 days trial account \[2\]"
send "1\r"

# 5. Respond to "I acknowledge, continue with installation. [1], I do not agree; cancel installation. [2, Enter]"
# Expected: "I acknowledge, continue with installation. [1]"
expect "\[2, Enter\]"
send "1\r"

# 6. Respond to "For which users shall thinkorswim be installed?"
# Expected: "Install for all users of this machine [2]"
expect "Install for all users of this machine \[2\]"
send "2\r"

# 7. Respond to "Where should thinkorswim be installed?"
# Expected: "[/config/thinkorswim]" and custom path /tmp/thinkorswim
expect "\[/config/thinkorswim\]"
send "/config/thinkorswim\r"

# 8. Respond to "Create desktop icon?"
# Expected: "Yes [y, Enter]"
expect "No \[n\]"
send "\r"

# Wait for the "Extracting files ..." and "Setup has finished" lines
expect "Setup has finished installing thinkorswim on your computer."

# 9. Respond to "Run thinkorswim?"
# Expected: "No [n]"
expect "No \[n\]"
send "y\r"

# Wait for the script to finish and the prompt to return
expect eof

puts "ToS Desktop installation done..."