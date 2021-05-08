#include <stdio.h>
#include "objk_runtime.h"
#include "objk_msgsend.h"

int main(int argc, const char * argv[]) {
	struct _OKString objStorage = { .super = { NULL }, .str = "SpecialK" };
	OKObject obj = &objStorage.super;
	OKObject result = ((OKObject(*)(OKObject,OKMsg,int))objK_msgSend)(obj, "showString:", 42);
	if (result == obj) {
		printf("Result returning works!\n");
	} else {
		printf("ERROR: Result damaged (%p ≠ %p).\n", obj, result);
	}
	return 0;
}
