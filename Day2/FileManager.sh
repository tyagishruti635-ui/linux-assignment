#!/bin/bash
case "$1" in
addDir)
    mkdir -p "$2/$3"
    ;;
deleteDir)
     rmdir "$2/$3"
    ;;
listContent)
    ls "$2"
    ;;
listFiles)
    find "$2" -maxdepth 1 -type f
    ;;
listDirs)
    find "$2" -maxdepth 1 -type d
    ;;
listAll)
    ls -la "$2"
    ;;
addFile)
    touch "$2/$3"
    ;;
addContentToFile)
    echo "$4" >> "$2/$3"
    ;;
addContentToFileBeginning)
    echo "$4" | cat - "$2/$3" > /tmp/tmpfile
    mv /tmp/tmpfile "$2/$3"
    ;;
showFileBeginningContent)
    head -n "$4" "$2/$3"
    ;;
showFileEndContent)
    tail -n "$4" "$2/$3"
    ;;
showFileContentAtLine)
    head -n "$4" "$2/$3" | tail -n 1
    ;;
showFileContentFortLineRange)
    tail -n +"$4" "$2/$3" | head -n "$(( $5 - $4 + 1 ))"
    ;;
moveFile)
    mv "$2/$3" "$4"
    ;;
copyFile)
    cp "$2" "$3"
    ;;
clearFileContent)
    > "$2/$3"
    ;;
deleteFile)
    rm "$2/$3"
    ;;
*)
   echo "Wrong command"
   ;;
esac
