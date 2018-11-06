#!/bin/bash

getCakeBasePath () {
  cakeFileName="build.cake"
  originalDir="$PWD"

  while [ ! "$PWD" == "/" ] ; do
     path=(`find . -maxdepth 1 -name "$cakeFileName"`)
 
     if [ "${#path[@]}" -eq "1" ]; then
       break
     fi
 
    if [ "${#path[@]}" -gt "1" ]; then
      for i in "${path[@]}"; do
        echo "$i"
      done
    fi

    cd ..
  done

  if [ ! "$PWD" == "/" ]; then
    echo "$PWD"
  fi

  cd $originalDir
}
