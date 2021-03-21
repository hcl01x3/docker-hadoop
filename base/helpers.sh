#!/bin/bash

GLOBIGNORE="*"

function addXMLProperty  {
  local filePath=$1
  local name=`echo $2 | sed 's/__/-/g; s/_/./g'`
  local val=$3
  local prop=`echo "<property><name>$name</name><value>$val</value></property>" | sed 's,\/,\\\/,g'`
  sed -i "/<\/configuration>/ s/.*/${prop}\n&/" $filePath
}

function configureXML() {
  local source=$1
  local target=$2
  local envPrefix=$3
  local envs=(`env | grep -e "^${envPrefix}_" | sed "s/^${envPrefix}_//"`)

  for i in ${!envs[@]}; do
	 if [[ $i = 0 ]]; then
		cp $source $target
	 fi

	 local key=`echo "${envs[$i]}" | cut -s -d= -f1`
	 local val=`echo "${envs[$i]}" | cut -s -d= -f2-`

	 addXMLProperty $target $key $val
  done
}

