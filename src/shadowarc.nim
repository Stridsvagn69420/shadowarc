import std/os
import std/strformat
import config
import consts

## Handles simple command-line args.
## Automatically quits if parameter is unknown.
## Returns false if no flags are present to start daemon.
proc handleFlags(): bool =
    try:
        case paramStr(1):
        of "-V", "--version", "version":
            echo(fmt"{Name} {Version} {hostOS}/{hostCPU} (Nim {NimVersion})")
        of "-h", "--help", "help":
            echo(fmt"{Name} - {Desc}")
            echo(fmt"Version: {Version}@{hostOS}-{hostCPU}")
            echo(fmt"GitHub: {GitRepo}")
            echo(fmt"License: {License} ©️ {Author}")
            echo(fmt"Nim: {NimVersion}")
        # Flag is present. Do not start service!
        return true
    except IndexDefect:
        # No additional flags present.
        return false

## --- Main ----
## shadowarc service
proc main(): int =
    echo(Name & " is still in development!")
    let dirs = read_config()
    return 0

when isMainModule:
    if handleFlags():
        quit(0)
    else:
        when not defined(linux):
            echo(Name & " is currently only supported on Linux!")
        else:
            quit(main())