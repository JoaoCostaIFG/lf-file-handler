include config.mk

OBJS		= lf-file-handler.o
SOURCE	= lf-file-handler.c
HEADER	=
OUT			= lf-file-handler
FLAGS		= -g -c -Wall `$(PKG_CONFIG) --cflags dbus-1`
LFLAGS	= `$(PKG_CONFIG) --libs dbus-1`
CC			= gcc

all: $(OUT)

lf-file-handler: $(OBJS)
	$(CC) -g $(OBJS) -o $(OUT) $(LFLAGS)

lf-file-handler.o: lf-file-handler.c
	$(CC) $(FLAGS) lf-file-handler.c

clean:
	rm -f $(OBJS) $(OUT)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(OUT) $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/$(OUT)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(OUT)
