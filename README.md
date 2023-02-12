# Usage
Set up cpp file and input file.

```shell
$ bash init.sh (contest name) (contest number)
# example
$ bash init.sh abc 001
```

Execution Result. Generated cpp file is a copy of template file and input file is initially empty.

```
.
├── abc
│   └── 001
│       ├── a.cpp
│       ├── b.cpp
│       ├── c.cpp
│       ├── d.cpp
│       ├── e.cpp
│       ├── ex.cpp
│       ├── f.cpp
│       ├── g.cpp
│       └── input.txt
...
└── template.cpp
```

Build c++17 and run

```shell
$ bash br.sh (contest name) (contest number) (file name)
# example
$ bash br.sh abc 001 a
```