import std/os

## Attempts to move a file, first by renaming it, then by copying and removing it.
## Returns true if file was successful moved, false if an error occured.
proc move(src: string, dst: string): bool {.discardable.} =
    try:
        moveFile(src, dst)
    except:
        try:
            copyFile(src, dst)
            tryRemoveFile(src)
        except:
            return false
    return true