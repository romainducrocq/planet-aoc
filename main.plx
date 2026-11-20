import "libaoc"
use "stdio"
use "stdlib"
use "string"

m4_define(`YEARS', `2026')m4_dnl
answers: [m4_eval(YEARS` - 2014')][25][2]i64 = $(
m4_ifdef(`CHECK_ANSWER', `
    $( # year 2026
        $(nil)
    ),
    $( # year 2025
        $(1147, 6789),                    # day 1
        $(8576933996, 25663320831),       # day 2
        $(17301, 172162399742349),        # day 3
        $(1460, 9243),                    # day 4
        $(681, 348820208020395),          # day 5
        $(6172481852142, 10188206723429), # day 6
        $(1660, 305999729392659),         # day 7
        $(50760, 3206508875),             # day 8
        $(4750176210, 1574684850),        # day 9
        $(514, 21824),                    # day 10
        $(688, 293263494406608),          # day 11
        $(457, 0)                         # day 12
    )
', `
    $($(nil))
')
)m4_dnl

fn check_answer(part: i64, answer: i64) none {
    s: [32]char = $(nil)
    print(ltostr(s, part))
    if not answer {
        puts("")
        return none
    }
    if part ~= answer {
        puts(" - Wrong answer")
        ftext_close(@input)
        exit(1)
    }
    puts(" - OK")
}

pub fn main(_: i32, args: *string) i32 {
    exec: [16]char = $(nil)
    filename: [32]char = $(nil)
    strncpy(exec, @args[0][strlen(args[0]) - 10], 10)
    exec[4] = '/'
    snprint(filename, 22, fmt3("inputs/", exec, ".txt"))
    exec[4] = nil

    if (ftext_read(filename, @input)) {
        fprint(get_stderr(), fmt3("Cannot open file ", filename, "\n"))
        exit(1)
    }
    day: i32 = strtol(@exec[8], nil, 10) - 1
    year: i32 = YEARS - strtol(exec, nil, 10)
    check_answer(part_1(), answers[year][day][0])
    check_answer(part_2(), answers[year][day][1])
    ftext_close(@input)

    return 0
}
