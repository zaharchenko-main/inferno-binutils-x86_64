/* Default linker script, for normal executables */
/* Copyright (C) 2014-2021 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("a.out-pdp11", "a.out-pdp11",
	      "a.out-pdp11")
OUTPUT_ARCH(pdp11)
PROVIDE (__stack = 0);
SECTIONS
{
  . = 0;
  .text :
  {
    CREATE_OBJECT_SYMBOLS
    *(.text)
    _etext = .;
    __etext = .;
  }
  . = ALIGN(8192);
  .data :
  {
    *(.data)
    CONSTRUCTORS
    _edata  =  .;
    __edata  =  .;
  }
  .bss :
  {
    __bss_start = .;
   *(.bss)
   *(COMMON)
   . = ALIGN(2);
   _end = . ;
   __end = . ;
  }
}
