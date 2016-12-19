#!/bin/bash -x
GIT=git
GIT_REVISION=$($GIT rev-parse --short=7 HEAD)

PREFIX=opentx219-$GIT_REVISION-multi-$(date +"%Y-%m-%d")
make clean
make GVARS=YES MIXERS_MONITOR=YES PCB=TARANIS  LUA=YES HELI=YES MULTIMODULE=YES PCBREV=REV9E && mv opentx.bin ${PREFIX}-x9e.bin

make clean
make GVARS=YES MIXERS_MONITOR=YES PCB=TARANIS  LUA=YES HELI=YES MULTIMODULE=YES PCBREV=REVPLUS && mv opentx.bin ${PREFIX}-taranis-plus.bin

make clean
make GVARS=YES MIXERS_MONITOR=YES PCB=TARANIS LUA=YES HELI=YES MULTIMODULE=YES && mv opentx.bin ${PREFIX}-taranis.bin

cp build.sh ${PREFIX}-buildoptions.txt