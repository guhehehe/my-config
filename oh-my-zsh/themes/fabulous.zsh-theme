# This script uses oh-my-zsh's spectrum library (.oh-my-zsh/lib/spectrum.zsh)
# Author: He Gu

_CBASE="$FX[reset]$FG[244]$FX[bold]"
_CNAME="$FX[reset]$FG[024]$FX[bold]"
_CAT="$FX[reset]$FG[009]"
_CHOST="$FX[reset]$FG[064]$FX[bold]"
_CPATH="$FX[reset]$FG[248]$FX[bold]"
_CDATE="$FX[reset]$FG[136]$FX[bold]"
_CMODE="$FX[reset]$FG[009]$FX[bold]"
_CGIT="$FX[reset]$FG[130]$FX[bold]"

_NAMEHOST="${_CBASE}┌─[${_CNAME}%n${_CAT}@${_CHOST}%m${_CBASE}]"
_DIR="${_CBASE}[${_CPATH}%~${_CBASE}]"
_DATE="${_CBASE}[${_CDATE}%D{%a %b %d, %I:%M}${_CBASE}]"
_DOLLAR="${_CBASE}└─[${_CMODE}"$"${_CBASE}]"
PROMPT="${_NAMEHOST} - ${_DIR} - ${_DATE}"

PROMPT="${PROMPT}
${_DOLLAR} <"$'$(show_git_prompt)'"${_CBASE}> ${FX[reset]}"

PS2=' > '
