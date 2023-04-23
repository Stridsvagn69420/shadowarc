import std/os
import std/strformat
import std/terminal
import config
import consts

## Wrapper for colorful output on the info message
proc prettyKV(k: string, v: string) =
    styledEcho(fgYellow, k & ": ", resetStyle, v)

## Handles simple command-line args.
## Automatically quits if parameter is unknown.
## Returns false if no flags are present to start daemon.
proc handleFlags(): bool =
    try:
        case paramStr(1):
        of "-V", "--version", "version":
            echo(fmt"{Name} {Version} {hostOS}/{hostCPU} (Nim {NimVersion})")
        of "-h", "--help", "help", "info":
            styledEcho(fgYellow, styleBright, fmt"{Name} - {Desc}")
            prettyKV("Version", fmt"{Version}@{hostOS}-{hostCPU}")
            prettyKV("GitHub", GitRepo)
            prettyKV("License", fmt"{License} ©️ {Author}")
            prettyKV("Nim", NimVersion)
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
            styledEcho(fgRed, Name & " is currently only supported on Linux!")
        else:
            quit(main())