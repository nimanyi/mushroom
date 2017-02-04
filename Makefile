#自动区分平台
OS := $(shell uname)
ifeq ($(OS), $(filter $(OS), Darwin))
	PLAT=macosx
else 
	PLAT=linux
endif

.PHONY: all skynet clean install

SHARED := -fPIC --shared
LUA_CLIB_PATH ?= common/luaclib
PREFIX ?= install

CFLAGS = -g -O2 -Wall -std=gnu99 -lrt

BIN = $(LUA_CLIB_PATH)/log.so

all : skynet

skynet/Makefile :
	git submodule update --init

skynet : skynet/Makefile
	cd 3rd/skynet && $(MAKE) $(PLAT)

all : \
	$(foreach v, $(BIN), $(v))

$(LUA_CLIB_PATH) :
	mkdir $(LUA_CLIB_PATH)

$(LUA_CLIB_PATH)/log.so : common/luaclib-src/lua-log.c | $(LUA_CLIB_PATH)
	$(CC) $(CFLAGS) $(SHARED) -I./3rd/skynet/3rd/lua $^ -o $@

#install
install : $(PREFIX)
$(PREFIX) :
	mkdir $(PREFIX)
	cp 3rd/skynet/skynet $(PREFIX)/main
	cp -r common/luaclib $(PREFIX)
	cp -r common/lualib $(PREFIX)
	cp -r common/luasvr $(PREFIX)

#clean
clean :
	rm -rf $(LUA_CLIB_PATH)/*
	rm -rf $(PREFIX)