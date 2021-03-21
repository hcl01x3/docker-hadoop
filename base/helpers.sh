#!/bin/bash

GLOBIGNORE="*"

export HADOOP_CONF_DIR=${HADOOP_CONF_DIR:-"/etc/hadoop"}
export HADOOP_INIT_CONF_DIR=${HADOOP_INIT_CONF_DIR:-"./confs"}

function addXMLProperty  {
  local filePath=$1
  local name=`echo $2 | sed 's/__/-/g; s/_/./g'`
  local val=$3
  local prop=`echo "<property><name>$name</name><value>$val</value></property>" | sed 's,\/,\\\/,g'`
  sed -i "/<\/configuration>/ s/.*/${prop}\n&/" $filePath
}

function configureXML() {
  local file=$1
  local envPrefix=$2
  local envs=(`env | grep -e "^${envPrefix}_" | sed "s/^${envPrefix}_//"`)

  for i in ${!envs[@]}; do
	 if [[ $i = 0 ]]; then
		cp $HADOOP_INIT_CONF_DIR/$file $HADOOP_CONF_DIR/$file
	 fi

	 local key=`echo "${envs[$i]}" | cut -s -d= -f1`
	 local val=`echo "${envs[$i]}" | cut -s -d= -f2-`

	 addXMLProperty $HADOOP_CONF_DIR/$file $key $val
  done
}

