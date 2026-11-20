#!/usr/bin/env bash

function help () {
    echo "Usage: ./build_and_run.sh [--check] {2025..2026} [1..12]"
    exit 0
}

function run_day () {
    DAY="${1}"
    YEAR="${2}"
    LINK_LIB=""

    if [ -z "${1}" ]; then help; fi
    if [ -z "${2}" ]; then help; fi
    if [[ -n ${1//[0-9]/} ]]; then help; fi
    if [[ -n ${2//[0-9]/} ]]; then help; fi
    if [ ${1} -lt 1    ]; then help; fi
    if [ ${1} -gt 25   ]; then help; fi
    if [ ${2} -lt 2015 ]; then help; fi

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
        *)
            ;;
    esac

    BANNER="----- Day ${DAY} -----"
    DAY="day${DAY}"
    SOURCE_FILE="${YEAR}/${DAY}.plx"
    if [ ! -f "${SOURCE_FILE}" ]; then exit 0; fi

    echo ""
    echo "${BANNER}"
    EXEC_NAME="build/${YEAR}_${DAY}"
    planet -O3 -E ${DEF_CHECK} -I$(pwd) ${LINK_LIB} -o ${EXEC_NAME} \
        ${SOURCE_FILE} main.plx libaoc.plx
    if [ ${?} -ne 0 ]; then exit 1; fi
    ./${EXEC_NAME}
    if [ ${?} -ne 0 ]; then exit 1; fi
}

ARG_1=${1}
ARG_2=${2}
DEF_CHECK=""
if [ "${1}" = "--help" ]; then
    help
elif [ "${1}" = "--check" ]; then
    DEF_CHECK="-DCHECK_ANSWER"
    ARG_1=${2}
    ARG_2=${3}
fi

mkdir -p build/
if [ ! -z "${ARG_2}" ]; then
    run_day ${ARG_2} ${ARG_1}
else
    for i in $(seq 1 25); do
        run_day ${i} ${ARG_1}
    done
fi

exit 0
