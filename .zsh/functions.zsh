#!/usr/bin/env zsh

# Usage: simple-extract <file>
# Description: extracts archived files (maybe)
x() {
    if [[ -f "$1" ]]
    then
        case "$1" in
    #		*.tar.bz2)  bzip2 -v -d "$1" ;;
    		*.tar.bz2)  tar xvjf "$1"    ;;
    		*.tar.gz)   tar -xvzf "$1"   ;;
    		*.ace)      unace e "$1"     ;;
    		*.rar)      unrar x "$1"     ;;
    		*.deb)      ar -x "$1"       ;;
    		*.bz2)      bzip2 -d "$1"    ;;
    		*.lzh)      lha x "$1"       ;;
    		*.gz)       gunzip -d "$1"   ;;
    		*.tar)      tar -xvf "$1"    ;;
    		*.tgz)      gunzip -d "$1"   ;;
    		*.tbz2)     tar -jxvf "$1"   ;;
    		*.zip)      unzip "$1"       ;;
    		*.Z)        uncompress "$1"  ;;
            *.7z)       7z e "$1"        ;;
    		*.shar)     sh "$1"          ;;
    		*)          echo "'"$1"' Error. Please go away" ;;
        esac
    else
        echo "'"$1"' is not a valid file"
    fi
}

# Usage: smartcompress <file> (<type>)
# Description: compresses files or a directory.  Defaults to tar.gz
smartcompress() {
    if [[ -n "$2" ]]
    then
        case "$2" in
    		tgz | tar.gz)   tar -zcvf$1.$2 '$1' ;;
    		tbz2 | tar.bz2) tar -jcvf$1.$2 '$1' ;;
    		tar.Z)          tar -Zcvf$1.$2 '$1' ;;
    		tar)            tar -cvf$1.$2  '$1' ;;
    		gz | gzip)      gzip           '$1' ;;
    		bz2 | bzip2)    bzip2          '$1' ;;
    		*)          	echo "Error: $2 is not a valid compression type" ;;
    	esac
    else
        smartcompress "$1" tar.gz
    fi
}

# Usage: show-archive <archive>
# Description: view archive without unpack
show-archive() {
    if [[ -f $1 ]]
    then
    	case $1 in
    		*.tar.gz)      gunzip -c $1 | tar -tf - -- ;;
    		*.tar)         tar -tf $1 ;;
    		*.tgz)         tar -ztf $1 ;;
            *.rar)         unrar l $1 ;;
    		*.zip)         unzip -l $1 ;;
    		*.bz2)         bzless $1 ;;
            *.7z)          7z l $1 ;;
    		*)             echo "'$1' Error. Please go away" ;;
    	esac
    else
    	echo "'$1' is not a valid archive"
    fi
}

# Usage: q3demo <demofile>
# Description: plays a .dm_68 file in q3 with cpma
q3demo () {
    cp $1 ~/.q3a/cpma/demos/demoplay.dm_68
    /usr/local/bin/quake3 +set fs_Game cpma +demo demoplay
    rm ~/.q3a/cpma/demos/demoplay.dm_68
}
