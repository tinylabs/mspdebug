# MSPDebug - debugging tool for the eZ430
# Copyright (C) 2009 Daniel Beer
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA

CC = gcc

all: mspdebug

clean:
	/bin/rm -f *.o
	/bin/rm -f mspdebug

.SUFFIXES: .c .o

mspdebug: main.o fet.o rf2500.o dis.o uif.o ihex.o elf32.o stab.o util.o \
	  bsl.o
	$(CC) $(CFLAGS) -o $@ $^ -lusb

.c.o:
	$(CC) $(CFLAGS) -O1 -Wall -o $@ -c $*.c
