# Common

Welcome to the **Common** repository. This repository contains code and libraries shared across the entire [AruXI Project](https://github.com/Project-AruXI).

---

## Purpose
This repository serves as a central location for code that is used by multiple components of the AruXI project, ensuring consistency and reducing duplication.

---

## Usage
To use the contents, simply add this repo as a submodule:
```sh
git submodule add https://github.com/Project-AruXI/Common.git common
```

The submodule is to only serve as a view into the repository, so no modifications are to be made. The only location where modifications are allowed is in the `Common` repository.

---

## Repository layout

- `lib/`: holds the libraries, each library in its own directory. Binaries are output to `lib/`. Each library directory includes a `Makefile` that can be used to build the library.
- `defs/`: holds headers and other definitions to be used by projects. Currently present are `aoef.h` and `aoef.v`, which provide definitions and macros for the AOE file format.
- `defs/instr/`: holds auto-generated headers and definitions for Aru32 instruction names and opcodes. These files are generated from a consolidated JSON definition using the Python script in `defs/instr/` along with the template files in that directory.

### Libraries in `lib/`

- `argparse`: third-party library providing argument-parsing utilities for C programs.
- `sds`: third-party dynamic string library for C.
- `securedstring`: library that provides a mechanism to "lock" or otherwise protect easy access to a string in memory.
- `utf8v`: a C-facing UTF-8 helper library that re-exports V language UTF-8 functionality for use from C (uses V source code).
