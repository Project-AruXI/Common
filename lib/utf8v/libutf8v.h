#ifndef _LIBUTF8V_H_
#define _LIBUTF8V_H_

extern char* utf8v_version();
typedef void (*utf8v_versionPtr)(void);

extern int utf8v_strlen(const char* str);
typedef int (*utf8v_strlenPtr)(const char*);

extern int utf8v_streq(const char* str1, const char* str2);
typedef int (*utf8v_streqPtr)(const char* str1, const char* str2);

extern signed long utf8v_parseint(const char* str, int base, int size, signed long* out);
typedef signed long (*utf8v_parseintPtr)(const char* str, int base, int size, signed long* out);

extern unsigned long utf8v_parseuint(const char* str, int base, int size, unsigned long* out);
typedef unsigned long (*utf8v_parseuintPtr)(const char* str, int base, int size, unsigned long* out);

extern char* utf8v_toupper(const char* str);
typedef char* (*utf8v_toupperPtr)(const char* str);

extern char* utf8v_trim(const char* str, const char* cutset);
typedef char* (*utf8v_vtrimPtr)(const char* str, const char* cutset);

extern char* utf8v_trimLeft(const char* str, const char* cutset);
typedef char* (*utf8v_vtrimLeftPtr)(const char* str, const char* cutset);

extern char* utf8v_trimRight(const char* str, const char* cutset);
typedef char* (*utf8v_vtrimRightPtr)(const char* str, const char* cutset);

extern char* utf8v_trimSpace(const char* str);
typedef char* (*utf8v_vtrimSpacePtr)(const char* str);

extern char* utf8v_trimSpaceLeft(const char* str);
typedef char* (*utf8v_vtrimSpaceLeftPtr)(const char* str);

extern char* utf8v_trimSpaceRight(const char* str);
typedef char* (*utf8v_vtrimSpaceRightPtr)(const char* str);

extern char* utf8v_trimStringLeft(const char* str);
typedef char* (*utf8v_vtrimStringLeftPtr)(const char* str);

extern char* utf8v_trimStringRight(const char* str);
typedef char* (*utf8v_vtrimStringRightPtr)(const char* str);

#endif