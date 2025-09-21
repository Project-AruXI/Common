
# Common

Welcome to the **Common** repository! This repository contains code and libraries shared across the entire [AruXI Project](https://github.com/Project-AruXI).

---

## Purpose
This repository serves as a central location for code that is used by multiple components of the AruXI project, ensuring consistency and reducing duplication.

---

## Current Contents

- **File Type Definitions Header**  
	`aoef.h`  
	Provides type definitions and macros for the AOE file format (AOEFF).

- **Dynamic String Library**  
	`sds.h`, `sdsalloc.h`, `libsds.a`  
	A robust, efficient dynamic string library for C, enabling flexible string manipulation and memory management.

---

## Usage
To use the contents, simply add this repo as a submodule:
```sh
git submodule add https://github.com/Project-AruXI/Common.git common
```

The submodule is to only serve as a view into the repository, so no modifications are to be made. The only location where modifications are allowed is in the `Common` repository.