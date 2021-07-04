
## links
- [bash-for-loop](https://www.cyberciti.biz/faq/bash-for-loop/)

### variables
- $log
- $PWD

#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
for i in {0..10..2}
    do 
        echo "Welcome $i times"
    done