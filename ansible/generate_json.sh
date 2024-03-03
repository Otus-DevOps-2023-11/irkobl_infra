#! /bin/bash

function helps {
    echo 'Use ./generate_json.sh [ STRING name instance. Example: "reddit-MyPrefixOne reddit-MyPrefixTwo --list"  ] [ OPTIONS ... ]
        --list - create file json with name instance
        --help - short message help'
}

function wip {
    wip=`yc compute instance list | grep $1 | cut -d'|' -f6`
    wip=${wip// /}
    suff=$(echo $1 | sed 's/.*-//g')
    arr=( $suff $suff"server" $wip )
    echo ${arr[*]}
}

function json {
    arr=$(wip $1)
    first=($arr)
    arr=$(wip $2)
    second=($arr)

    echo -e '{\n' \
            '   '\"${first[0]}\"': {\n' \
            '       "hosts": {\n' \
            '           '\"${first[1]}\"': {\n' \
            '               "ansible_user": "ubuntu",\n' \
            '               "ansible_host": '\"${first[2]}\"'\n' \
            '           }\n' \
            '       }\n' \
            '   },\n' \
            '   '\"${second[0]}\"': {\n' \
            '       "hosts": {\n' \
            '           '\"${second[1]}\"': {\n' \
            '               "ansible_user": "appuser",\n' \
            '               "ansible_host": '\"${second[2]}\"'\n' \
            '           }\n' \
            '       }\n' \
            '   }\n' \
            '}' > inventory.json
}

if [ $# -eq 0 ] || [ $# -gt 3 ]; then
    echo -e 'Должно быть три параметра \n'
    helps
elif [ $# -gt 0 ] && [ $# -lt 3 ]; then
    if [ $1 == "--help" ]; then
        helps
    elif [ $# -eq 2 ]; then
        echo -e 'Недостаточно аргументов \n'
        echo $(wip $1)
        echo $(wip $2)
        helps
    elif [[ $1 =~ ^[a-zA-Z] ]]; then
        echo -e 'Недостаточно аргументов \n'
        echo $(wip $1)
        helps
    else
        helps
    fi
elif [ $# -eq 3 ] && [ $3 == "--list" ]; then
    json $1 $2
fi
