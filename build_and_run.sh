#!/usr/bin/env bash

function run_day () {
    DAY="${1}"
    YEAR="2025"
    LINK_LIB=""
    case "${YEAR}" in
        "2025")
            if [ ${1} -eq 8 ]; then
                LINK_LIB="-lqsort"
            elif [ ${1} -eq 9 ]; then
                LINK_LIB="-lqsort"
            fi
            ;;
        *)
            exit 1
    esac
    if [ ${1} -lt 10 ]; then
        DAY="0${DAY}"
    fi
    echo ""
    echo "----- Day ${DAY} -----"
    DAY="day${DAY}"

    NAME_OUT="build/${YEAR}_${DAY}"
    planet -O3 -E ${DEF_CHECK} -I$(pwd) ${LINK_LIB} -o ${NAME_OUT} \
        ${YEAR}/${DAY}.plx main.plx libaoc.plx
    if [ ${?} -ne 0 ]; then exit 1; fi
    ./${NAME_OUT}
    if [ ${?} -ne 0 ]; then exit 1; fi
}

ARG=${1}
DEF_CHECK="-DCHECK_ANSWER"
if [ "${1}" = "--no-check" ]; then
    DEF_CHECK=""
    ARG=${2}
fi

mkdir -p build/
if [ ! -z "${ARG}" ]; then
    run_day ${ARG}
else
    for i in $(seq 1 12); do
        run_day ${i}
    done
fi

exit 0
