#! /bin/bash
 
function helps { 
    echo 'Use dynamo.sh [ STRING name instance ] [ OPTIONS ... ]
        --list - create file json with name instance
        --help - short message help' 
}
 
function wip { 
    wip=`yc compute instance list | grep $1 | cut -d'|' -f6` 
    wip=${wip// /}
    echo $wip 
}
 
function json {
    echo -e '{\n' \
            '   "app": {\n' \
            '       "hosts": {\n' \
            '           "appserver": {\n' \
            '               "ansible_user": "ubuntu",\n' \
            '               "ansible_host": '\"$(wip $1)\"'\n' \
            '           }\n' \
            '       }\n' \
            '   },\n' \
            '   "db": {\n' \
            '       "hosts": {\n' \
            '           "dbserver": {\n' \
            '               "ansible_user": "appuser",\n' \
            '               "ansible_host": '\"$(wip $2)\"'\n' \
            '           }\n' \
            '       }\n' \
            '   }\n' \
            '}' > inventory.json
}
 
if [ $# -eq 0 ] || [ $# -gt 3 ]; then
    echo -e 'Должно быть максимум два параметра \n'
    helps 
elif [ $# -eq 1 ]; then
    if [ $1 == "--help" ]; then
        helps
    elif [ $# -eq 2 ]; then
        helps
    elif [[ $1 =~ ^[a-zA-Z] ]] && [[ $1 =~ ^[a-zA-Z] ]]; then
        echo $(wip $1)
        echo $(wip $2)
    else
        helps
    fi
elif [ $# -eq 3 ] && [ $3 == "--list" ]; then
    json $1 $2
fi