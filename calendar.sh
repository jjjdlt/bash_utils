#!/bin/zsh

# A simple Zsh calendar program
echo "----------------------------------"
echo "          Calendar Program"
echo "----------------------------------"

# Display current date and time
echo "Today's Date: $(date '+%A, %B %d, %Y')"
echo "Current Time: $(date '+%H:%M:%S')"

# Dynamic Reminder of the Day
DAY=$(date +%A)
case $DAY in
  Monday)
    REMINDER="Start the week with focus!"
    ;;
  Tuesday)
    REMINDER="Stay on track and keep working!"
    ;;
  Wednesday)
    REMINDER="Midweek check-in: how's your progress?"
    ;;
  Thursday)
    REMINDER="Almost there—keep pushing forward!"
    ;;
  Friday)
    REMINDER="Wrap up the week with determination!"
    ;;
  Saturday)
    REMINDER="Enjoy your weekend and recharge!"
    ;;
  Sunday)
    REMINDER="Plan ahead for a productive week!"
    ;;
  *)
    REMINDER="Have a great day!"
    ;;
esac

echo "----------------------------------"
echo "Reminder of the Day: $REMINDER"
echo "----------------------------------"

# Determine which shell the user is using
case "$SHELL" in
  */zsh)
    STARTUP_FILE="$HOME/.zshrc"
    ;;
  */bash)
    STARTUP_FILE="$HOME/.bashrc"
    ;;
  */ksh)
    STARTUP_FILE="$HOME/.kshrc"
    ;;
  */csh)
    STARTUP_FILE="$HOME/.cshrc"
    ;;
  */fish)
    STARTUP_FILE="$HOME/.config/fish/config.fish"
    ;;
  *)
    echo "Unsupported shell: $SHELL"
    exit 1
    ;;
esac

# Check if the calendar script is already included in the appropriate startup file
if ! grep -Fxq "/home/jj/calendar.sh" "$STARTUP_FILE"; then
  echo "Adding calendar script to $STARTUP_FILE..."
  # Append the call to the script in the detected startup file
  echo "/home/jj/calendar.sh" >> "$STARTUP_FILE"
  echo "Calendar script successfully added to $STARTUP_FILE."
else
  echo "Calendar script is already included in $STARTUP_FILE."
fi
