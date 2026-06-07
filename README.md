# nolibc
nolibc - libc-less wrapper extracted from the Linux kernel (tools/include/nolibc) to make tiny static executables for simple programs 

The source code comes from:

```text
nolibc/include/nolibc/ -> linux/tools/include/nolibc/
nolibc/include/uapi/   -> linux/include/uapi/
```

## Usage

Add the following configuration in your CMakeLists.txt:

```cmake
add_subdirectory(nolibc)

target_link_libraries(${CMAKE_PROJECT_NAME} nolibc_headers)
```

Include nolibc.h in your source code:

```c
#include <nolibc.h>

int main()
{
    printf("hello, nolibc!\n");
}
```

## Licensing

This project contains code derived from the Linux kernel.

Unless otherwise specified, source files are licensed under:

SPDX-License-Identifier: LGPL-2.1 OR MIT

See LICENSES/ for full license texts.
