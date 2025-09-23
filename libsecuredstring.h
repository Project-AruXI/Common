#ifndef _SECUREDSTRING_H_
#define _SECUREDSTRING_H_

#include <stdlib.h>
#include <stdbool.h>

typedef struct SecuredString SString;

SString* ssCreateSecuredString(const char* str);
SString* ssCreateSecuredStringLen(const char* str, size_t len);
bool ssDestroySecuredString(SString* sstr);

const char* ssGetString(SString* sstr);
size_t ssGetLength(SString* sstr);


#endif