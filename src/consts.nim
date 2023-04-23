import system
import std/strutils

## App Name
const Name* {.strdefine.} = "shadowarc"

## App Description
const Desc* {.strdefine.} = "Daemon for properly storing ShadowPlay files when written to a Linux NAS"

## App Version
const Version* {.strdefine.} = staticExec("git describe --tags --abbrev=0").replace("\n", "")

## Git Repository
const GitRepo* {.strdefine.} = staticExec("git config remote.origin.url").replace(".git", "").replace("\n", "")

## App Author
const Author* {.strdefine.} = "Stridsvagn69420"

## App License
const License* {.strdefine.} = "MIT"