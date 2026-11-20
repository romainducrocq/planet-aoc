## Advent of Code with planet

[planet](https://github.com/romainducrocq/planet) is a C-like programming language with a fully selfhosted compiler, written from scratch for GNU/Linux, MacOS and FreeBSD. It compiles programs to native x86-64 assembly and uses the C standard library at runtime. I'm using [Advent of Code](https://adventofcode.com) as a fun way to test my language on puzzle-like programs.  
<!---->
Here are the solutions for AOC 2025 in `planet`!  

### Quick install

See the language's repo for more info, or get started now:  
```
$ git clone --depth 1 --branch master --recurse-submodules --shallow-submodules https://github.com/romainducrocq/planet
$ cd planet/bin/
$ ./configure.sh
$ ./make.sh
$ ./install.sh
$ . ~/.bashrc # or . ~/.zshrc or . ~/.shrc
$ ./selfhost.sh
$ ./selfhost.sh
```

### Run AOC solutions

1. Add your inputs with `inputs/YYYY/dayDD.txt` from `01` to `12` (for example, `inputs/2025/day08.txt`). I'm keeping my own inputs private in a submodule, [as requested by Eric](https://adventofcode.com/2026/about#faq_copying).  
> Can I copy/redistribute part of Advent of Code? Please don't. Advent of Code is free to use, not free to copy. If you're posting a code repository somewhere, please don't include parts of Advent of Code like the puzzle text or your inputs.

2. Build and run solutions with `$ ./build_and_run.sh [--check] 2025 [1..12]`
- on all puzzles for a year  
```
# with inputs/2025/day*.txt
$ ./build_and_run.sh 2025
```
- or just for a specific day  
```
# with inputs/2025/day08.txt
$ ./build_and_run.sh 2025 8

----- Day 08 -----
50760
3206508875
```
(The `--check` flag tests against my answers, see `main.plx` to replace them with yours.)  

****

@romainducrocq
