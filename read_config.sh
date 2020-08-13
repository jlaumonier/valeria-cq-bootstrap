#!/bin/bash

# Get INI section
# thanks to https://blog.sleeplessbeastie.eu/2019/11/11/how-to-parse-ini-configuration-file-using-bash/
ReadINISections(){
  local filename="$1"
  awk '{ if ($1 ~ /^\[/) section=tolower(gensub(/\[(.+)\]/,"\\1",1,$1)); configuration[section]=1 } END {for (key in configuration) { print key} }' ${filename}
}


# Get/Set all INI sections
GetINISections(){
  local filename="$1"

  sections="$(ReadINISections $filename)"
  for section in $sections; do
    array_name="configuration_${section}"
    declare -g -A ${array_name}
  done
  eval $(awk -F= '{ 
                    if ($1 ~ /^\[/) 
                      section=tolower(gensub(/\[(.+)\]/,"\\1",1,$1)) 
                    else if ($1 !~ /^$/ && $1 !~ /^;/) {
                      gsub(/^[ \t]+|[ \t]+$/, "", $1); 
                      gsub(/[\[\]]/, "", $1);
                      gsub(/^[ \t]+|[ \t]+$/, "", $2); 
                      if (configuration[section][$1] == "")  
                        configuration[section][$1]=$2
                      else
                        configuration[section][$1]=configuration[section][$1]" "$2} 
                    } 
                    END {
                      for (section in configuration)    
                        for (key in configuration[section])  
                          print "configuration_"section"[\""key"\"]=\""configuration[section][key]"\";"
                    }' ${filename}
        )


}

echo "Read configuration $1"
section="default"
GetINISections "$1" "$section"

echo "Adding python to the modules to load"
PYTHON_VERSION="$(eval echo $\{configuration_${section}[PYTHON_VERSION]\})"
MODULES="$(eval echo $\{configuration_${section}[MODULES]\}) python/$PYTHON_VERSION"
VENV_DIR="$(eval echo $\{configuration_${section}[VENV_DIR]\})"



