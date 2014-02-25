CFLAGS += -Werror -Wall
all: test mypam.so

CURL_LINK_ARGS = `curl-config --static-libs`

clean:
	$(RM) test mypam.so *.o

mypam.so: src/mypam.c
	$(CC) $(CFLAGS) -fPIC -shared -Xlinker -x -o $@ $< $(CURL_LINK_ARGS)

test: src/test.c
	$(CC) $(CFLAGS) -o $@ $< -lpam -lpam_misc
