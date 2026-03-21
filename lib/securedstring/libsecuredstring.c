#include <stdlib.h>
#include <string.h>

#include "libsecuredstring.h"

typedef struct SecuredString {
	const char* str;
	size_t len;

	// Functionality to allow locked access/behavior

} SString;

SString* ssCreateSecuredString(const char* str) {
	SString* sstr = (SString*) malloc(sizeof(SString));
	if (!sstr) return NULL;
	sstr->str = str;
	sstr->len = strlen(str);

	return sstr;
}

SString* ssCreateSecuredStringLen(const char* str, size_t len) {
	SString* sstr = (SString*) malloc(sizeof(SString));
	if (!sstr) return NULL;
	sstr->str = str;
	sstr->len = len;

	return sstr;
}

bool ssDestroySecuredString(SString* sstr) {
	if (!sstr->str) return false;
	free((char*) sstr->str);
	free(sstr);

	return true;
}

const char* ssGetString(SString* sstr) {
	return sstr->str;
}

size_t ssGetLength(SString* sstr) {
	return sstr->len;
}