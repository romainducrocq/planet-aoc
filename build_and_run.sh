#!/usr/bin/env bash

function run_day () {
    DAY="${1}"
    YEAR="${2}"
    LINK_LIB=""
    if [ ${1} -lt 10 ]; then
        DAY="0${DAY}"
    fi
    case "${YEAR}" in
        "2025")
            case "${DAY}" in
                "08") LINK_LIB="-lqsort" ;;
                "09") LINK_LIB="-lqsort" ;;
                *) ;;
            esac
            ;;
        "2026")
            ;;
        *)
            exit 1 # TODO usage
    esac
    echo ""
    echo "----- Day ${DAY} -----"
    DAY="day${DAY}"

    EXEC_NAME="build/${YEAR}_${DAY}"
    planet -O3 -E ${DEF_CHECK} -I$(pwd) ${LINK_LIB} -o ${EXEC_NAME} \
        ${YEAR}/${DAY}.plx main.plx libaoc.plx
    if [ ${?} -ne 0 ]; then exit 1; fi
    ./${EXEC_NAME}
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
    run_day ${ARG} 2025
else
    for i in $(seq 1 12); do
        run_day ${i} 2025
    done
fi

exit 0
