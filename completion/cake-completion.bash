#/usr/bin/env bash

source "$( dirname "${BASH_SOURCE[0]}")/../get-cake-basepath.sh"

_cake_completions() {
  cakeBasePath=$(getCakeBasePath)

  if [ ! -e "$cakeBasePath/build.cake" ] || [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  myStr="$(grep -i Task\(\"${COMP_WORDS[1]} $cakeBasePath/build.cake)"
  myStr=${myStr//Task(\"/}
  myStr=${myStr//\")/}

  COMPREPLY=($myStr)
}

complete -F _cake_completions cake
