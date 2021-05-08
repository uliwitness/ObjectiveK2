#include "objk_runtime.h"
#include <stdio.h>

OKObject testImp(OKObject self, OKMsg cmd, int param) {
	printf( "String is: %s, int is %d (cmd: %s, self: %p)\n", ((OKString)self)->str, param, cmd, self );
	return self;
}

OKImp objK_msgFind(OKObject self, OKMsg cmd) {
	return (OKImp)testImp;
}
