#define NULL 0

typedef struct _OKObject {
	void* okClass;
} *OKObject;

typedef const char* OKMsg;

typedef OKObject (*OKImp)(OKObject self, OKMsg cmd);


OKImp objK_msgFind(OKObject self, OKMsg cmd) {
	return NULL;
}

OKObject objK_msgSend(OKObject self, OKMsg cmd) {
	if( !self ) return NULL;
	OKImp imp = objK_msgFind(self, cmd);
	return ((OKObject(*)(void))imp)();
}

int main(int argc, char *argv[]) {
	struct _OKObject obj;
	OKObject result = ((OKObject (*)(OKObject,OKMsg, int))objK_msgSend)(&obj,"alloc", 42);
}