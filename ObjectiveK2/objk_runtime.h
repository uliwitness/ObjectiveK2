#ifndef objk_runtime_h
#define objk_runtime_h

typedef struct _OKObject {
	void* okClass;
} *OKObject;

typedef const char* OKMsg;

typedef OKObject (*OKImp)(OKObject self, OKMsg cmd);

OKImp objK_msgFind(OKObject self, OKMsg cmd);

// Test object:
typedef struct _OKString {
	struct _OKObject super;
	const char* str;
} *OKString;

#endif /* objk_runtime_h */
