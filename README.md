# nolibc
nolibc - libc-less wrapper extracted from the Linux kernel (tools/include/nolibc) to make tiny static executables for simple programs 

The source code comes from:

```text
nolibc/include/nolibc/ -> linux/tools/include/nolibc/
nolibc/include/uapi/   -> linux/include/uapi/
```

## Usage

Add to your CMakeLists.txt:

```cmake
add_subdirectory(nolibc)

add_executable(${CMAKE_PROJECT_NAME} main.c)
target_link_libraries(${CMAKE_PROJECT_NAME} nolibc_headers)
```

Use in your C code:

```c
// main.c

#include <nolibc.h>

int main()
{
    printf("hello, nolibc!\n");
    return 0;
}
```

## License

This project contains code derived from the Linux kernel.

Unless otherwise specified, source files are licensed under:

**SPDX-License-Identifier:** LGPL-2.1 OR MIT

See [LICENSES/](LICENSES/) for full license texts.
