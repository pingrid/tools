function logc {
  grep ^{ | jq -r '. | "\(.level): \(.msg) exception: \(.exception) stack trace: \(.stack_trace)"' | gsed --unbuffered -e 's/\(.*FATAL.*\)/\o033[1;31m\1\o033[0;39m/' -e 's/\(.*50.*\)/\o033[31m\1\o033[39m/' -e 's/\(.*40.*\)/\o033[33m\1\o033[39m/' -e 's/\(.*30.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*10.*\)/\o033[34m\1\o033[39m/' -e 's/\(.*TRACE.*\)/\o033[30m\1\o033[39m/' -e 's/\(.*[Ee]xception.*\)/\o033[1;39m\1\o033[0;39m/'
}

function logn {
  
  grep ^{ | jq -r '. | "\(.level) time: \(.time) \(.msg) ex: \(.stack)"' | gsed --unbuffered -e 's/\(.*FATAL.*\)/\o033[1;31m\1\o033[0;39m/' -e 's/\(.*50.*\)/\o033[31m\1\o033[39m/' -e 's/\(.*40.*\)/\o033[33m\1\o033[39m/' -e 's/\(.*30.*\)/\o033[32m\1\o033[39m/' -e 's/\(.*DEBUG.*\)/\o033[34m\1\o033[39m/' -e 's/\(.*TRACE.*\)/\o033[30m\1\o033[39m/' -e 's/\(.*[Ee]xception.*\)/\o033[1;39m\1\o033[0;39m/'
}
