import std/os
import system
import consts

type ShadowplayFolders* = object
    shadowplay: string
    videoout: string
    imageout: string

## Attempts to read the required paths from env vars.
## Quits if paths are not valid.
## Returns a `ShadowplayFolders` object on success.
proc read_config*(): ShadowplayFolders {.discardable.} =
    let dirs = ShadowplayFolders(
        shadowplay: getEnv("SHADOWARC_SHADOWPLAY"), # Location that ShadowPlay writes to
        videoout: getEnv("SHADOWARC_VIDEOS"),       # Location only for Videos and Clips
        imageout: getEnv("SHADOWARC_IMAGES")        # Location only for Screenshots
    )

    if not dirExists(dirs.shadowplay) or not dirExists(dirs.videoout) or not dirExists(dirs.imageout):
        stderr.writeLine("Faulty config! Either the required environment variables are not set or do not point to a directory!")
        stderr.writeLine("Make sure that SHADOWARC_SHADOWPLAY, SHADOWARC_VIDEOS and SHADOWARC_IMAGES are properly set!")
        stderr.writeLine("See " & GitRepo & "#systemd for more. Exiting...")
        quit(1)

    return dirs