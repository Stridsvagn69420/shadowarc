import std/os
import system

type ShadowplayFolders* = object
    shadowplay: string
    videoout: string
    imageout: string

# Attempts to read the required paths from env vars.
# Quits if paths are not valid.
# Returns a ShadowplayFolders object on success.
proc read_config*(): ShadowplayFolders =
    let dirs = ShadowplayFolders(
        shadowplay: getEnv("SHADOWARC_SHADOWPLAY"),
        videoout: getEnv("SHADOWARC_VIDEOS"),
        imageout: getEnv("SHADOWARC_IMAGES")
    )

    if not dirExists(dirs.shadowplay) or not dirExists(dirs.videoout) or not dirExists(dirs.imageout):
        # TODO: Better error message. User should know to check this and that section of manual.
        stderr.writeLine("Config broken! Check environment variables SHADOWARC_SHADOWPLAY, SHADOWARC_VIDEOS and SHADOWARC_IMAGES.")
        quit(1)

    return dirs