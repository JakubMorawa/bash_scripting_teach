#!/usr/bin/env bash
CASE_NAME="Incident Doomsday"
LOG_DIR="logs"
LOG_FILES=("login.log" "file_access.log" "downloads.log" "usb_activity.log" "network.log" "security.log")
printf 'Case: %s
' "$CASE_NAME"
for file in "${LOG_FILES[@]}"
do
    printf '
EVIDENCE FILE: %s
' "$file"
    while IFS= read -r line || [[ -n "$line" ]]
    do
        printf '%s
' "$line"
    done < "$LOG_DIR/$file"
done
