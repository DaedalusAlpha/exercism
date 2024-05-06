#!/usr/bin/env bash

#fixed all indentation
while IFS= read -r line; do
    while true; do
        orig=$line
        if [[ $line =~ ^(.+)__(.*) ]]; then
            pre=${BASH_REMATCH[1]} #swapped pre/post order
            post=${BASH_REMATCH[2]}
            if [[ $pre =~ ^(.*)__(.+) ]]; then
                printf -v line "%s<strong>%s</strong>%s" "${BASH_REMATCH[1]}" \
                "${BASH_REMATCH[2]}" "$post" #add line break for readability
            fi
        fi
        [ "$line" != "$orig" ] || break
    done

    echo "$line" | grep '^\*' > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        if [ X$inside_a_list != Xyes ]; then
            h="$h<ul>"
            inside_a_list=yes
        fi

        while [[ $line == *_*?_* ]]; do
            one=${line#*_}
            two=${one#*_}
            if [ ${#two} -lt ${#one} -a ${#one} -lt ${#line} ]; then
                line="${line%%_$one}<em>${one%%_$two}</em>$two"
            fi
        done
        h="$h<li>${line#??}</li>"

    else
        if [ X$inside_a_list = Xyes ]; then #change else/if to elif
            h="$h</ul>"
            inside_a_list=no
        fi
        n=$(expr "$line" : "#\{1,\}") # change `` to $()
        if [ "$n" -gt 0 ] && [ 7 -gt "$n" ]; then #change -a to ] && [ and quote variables
            while [[ $line == *_*?_* ]]; do
                s=${line#*_}
                t=${s#*_}
                if [ ${#t} -lt ${#s} -a ${#s} -lt ${#line} ]; then
                    line="${line%%_$s}<em>${s%%_$t}</em>$t"
                fi
            done
            HEAD=${line:n}
            while [[ $HEAD == " "* ]]; do HEAD=${HEAD# }; done
            h="$h<h$n>$HEAD</h$n>"

        else

        grep '_..*_' <<<"$line" > /dev/null &&
            line=$(echo "$line" | sed -E 's,_([^_]+)_,<em>\1</em>,g') # change `` to $()
        h="$h<p>$line</p>"
        fi
    fi
    done < "$1"

if [ X$inside_a_list = Xyes ]; then
    h="$h</ul>"
fi

echo "$h"
