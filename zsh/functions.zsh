#!/usr/bin/env zsh

# use these in functions/shell scripts
export NC='\e[0m'
export white='\e[0;30m'
export WHITE='\e[1;30m'
export red='\e[0;31m'
export RED='\e[1;31m'
export green='\e[0;32m'
export GREEN='\e[1;32m'
export yellow='\e[0;33m'
export YELLOW='\e[1;33m'
export blue='\e[0;34m'
export BLUE='\e[1;34m'
export magenta='\e[0;35m'
export MAGENTA='\e[1;35m'
export cyan='\e[0;36m'
export CYAN='\e[1;36m'
export black='\e[0;37m'
export BLACK='\e[1;37m'

# Usage: simple-extract <file>
# Description: extracts archived files (maybe)
x() {
    if [[ -f "$1" ]]; then
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
    if [[ -n "$2" ]]; then
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
    if [[ -f $1 ]]; then
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

# Usage: password <length>
# Description: generates random string of specific length
password() {
  if [[ -z $1 ]]; then
    count=8
  else
    count="$1"
  fi
  echo $(< /dev/urandom tr -dc A-Za-z0-9 | head -c$count)
}

# idea by Gigamo http://bbs.archlinux.org/viewtopic.php?pid=478094#p478094
ls () {
  /bin/ls -rhbtF --color=auto $@ &&
  echo "${MAGENTA}Files: ${BLUE}$(/bin/ls -l $@ | grep -v "^[l|d|total]" | wc -l) ${GREEN}--- ${MAGENTA}Directories: ${BLUE}$(/bin/ls -l $@ | grep "^d" | wc -l)${NC}"
}

# Help for zsh's extglob, probably from grml zshrc
hglob () {
	echo -e "
      /      directories
      .      plain files
      @      symbolic links
      =      sockets
      p      named pipes (FIFOs)
      *      executable plain files (0100)
      %      device files (character or block special)
      %b     block special files
      %c     character special files
      r      owner-readable files (0400)
      w      owner-writable files (0200)
      x      owner-executable files (0100)
      A      group-readable files (0040)
      I      group-writable files (0020)
      E      group-executable files (0010)
      R      world-readable files (0004)
      W      world-writable files (0002)
      X      world-executable files (0001)
      s      setuid files (04000)
      S      setgid files (02000)
      t      files with the sticky bit (01000)
   print *(m-1)          # Dateien, die vor bis zu einem Tag modifiziert wurden.
   print *(a1)           # Dateien, auf die vor einem Tag zugegriffen wurde.
   print *(@)            # Nur Links
   print *(Lk+50)        # Dateien die ueber 50 Kilobytes grosz sind
   print *(Lk-50)        # Dateien die kleiner als 50 Kilobytes sind
   print **/*.c          # Alle *.c - Dateien unterhalb von \$PWD
   print **/*.c~file.c   # Alle *.c - Dateien, aber nicht 'file.c'
   print (foo|bar).*     # Alle Dateien mit 'foo' und / oder 'bar' am Anfang
   print *~*.*           # Nur Dateien ohne '.' in Namen
   chmod 644 *(.^x)      # make all non-executable files publically readable
   print -l *(.c|.h)     # Nur Dateien mit dem Suffix '.c' und / oder '.h'
   print **/*(g:users:)  # Alle Dateien/Verzeichnisse der Gruppe >users<
   echo /proc/*/cwd(:h:t:s/self//) # Analog zu >ps ax | awk '{print $1}'<"
}

# grep zsh history in ~/.history
histgrep () {
	grep -r "$@" ~/.zsh_history
	history | grep "$@"
}

# grep for running process, like: 'any vim'
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any <keyword>" >&2 ; return 1
    else
        ps xauwww | grep -i "${grep_options[@]}" "[${1[1]}]${1[2,-1]}"
    fi
}
