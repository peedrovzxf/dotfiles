#!/bin/bash
official=$(checkupdates 2>/dev/null | wc -l)
aur=$(yay -Qua 2>/dev/null | wc -l)
echo $(( official + aur ))
