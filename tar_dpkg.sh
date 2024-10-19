#!/bin/bash

# confirm a file is passed
if [ -z "$1" ]; then
    echo "Usage: $0 <path-to-archive-file>"
    exit 1
fi

ARCHIVE_FILE=$1

# directory for desktop application entries
DESKTOP_DIR="$HOME/.local/share/applications"

echo "Starting installation/update process for $ARCHIVE_FILE..."

# check if the provided file exists
if [ ! -f "$ARCHIVE_FILE" ]; then
    echo "Error: File $ARCHIVE_FILE not found!"
    exit 1
fi

# determine the directory name by removing the file extension from the archive
TARGET_DIR="${ARCHIVE_FILE%.*}"

echo "Creating/Updating target directory $TARGET_DIR..."
# Create the target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# remove old files in the target directory to ensure a clean install/update
echo "Cleaning up old files in $TARGET_DIR..."
rm -rf "$TARGET_DIR/*"

echo "Extracting $ARCHIVE_FILE..."

# extract the archive based on its extension
case "$ARCHIVE_FILE" in
    *.tar.gz|*.tgz)
        tar -xzf "$ARCHIVE_FILE" -C "$TARGET_DIR"  # Extract .tar.gz or .tgz
        ;;
    *.tar.bz2|*.tbz2)
        tar -xjf "$ARCHIVE_FILE" -C "$TARGET_DIR"  # Extract .tar.bz2 or .tbz2
        ;;
    *.tar)
        tar -xf "$ARCHIVE_FILE" -C "$TARGET_DIR"  # Extract .tar
        ;;
    *)
        echo "Error: Unsupported file type: $ARCHIVE_FILE"
        exit 1
        ;;
esac

echo "Extraction completed."

# change directory to the unpacked files
cd "$TARGET_DIR" || { echo "Error: Could not navigate into $TARGET_DIR"; exit 1; }
echo "Navigated into $TARGET_DIR."

# find the first executable file in the unpacked directory
echo "Searching for the first executable..."
APP_EXEC=$(find . -type f -executable | head -n 1)

# check if an executable was found
if [ -z "$APP_EXEC" ]; then
    echo "Error: No executable file found in $TARGET_DIR!"
    exit 1
fi

echo "Executable found: $APP_EXEC"

# parse out the application name by removing everything after the first special character
# this regex will keep only the first word or alphanumeric sequence before any special character
APP_NAME=$(basename "$TARGET_DIR" | sed 's/[^a-zA-Z0-9].*//')

echo "Parsed application name: $APP_NAME"

# search for a .png file named after the parsed app name
echo "Checking for an icon named after the application..."
NAMED_ICON_FILE=$(find . -type f -name "$APP_NAME.png" | head -n 1)

# if an icon named after the app is found, use that. otherwise, find the largest .png file.
if [ -n "$NAMED_ICON_FILE" ]; then
    ICON_FILE=$(pwd)/$NAMED_ICON_FILE
    echo "Found named icon: $ICON_FILE"
else
    echo "No named icon found. Searching for the largest .png file..."
    ICON_FILE=$(find . -type f -name "*.png" -exec ls -S {} + | head -n 1)
    
    if [ -n "$ICON_FILE" ]; then
        ICON_FILE=$(pwd)/$ICON_FILE
        echo "Largest icon found: $ICON_FILE"
    else
        echo "No icon found. Proceeding without an icon."
        ICON_FILE=""  # Leave the icon field empty if no .png is found
    fi
fi

# create/update the desktop entry (the .desktop file)
DESKTOP_ENTRY="$DESKTOP_DIR/$APP_NAME.desktop"

echo "Creating/Updating a desktop entry for $APP_NAME..."

# confirm the directory for desktop entries exists
mkdir -p "$DESKTOP_DIR"

# write the .desktop file with the application's information
cat > "$DESKTOP_ENTRY" <<EOL
[Desktop Entry]
Version=1.0
Name=$APP_NAME
Exec=$(pwd)/$APP_EXEC
Icon=$ICON_FILE
Terminal=false
Type=Application
Categories=Utility;
EOL

# make the desktop entry executable
chmod +x "$DESKTOP_ENTRY"

echo "Desktop entry created/updated: $DESKTOP_ENTRY"
echo "Application $APP_NAME installed/updated successfully!"

