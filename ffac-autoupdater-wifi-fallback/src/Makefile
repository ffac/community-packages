# SPDX-FileCopyrightText: kb-light, Patric Steffen, Andreas Ziegler, Florian Maurer
#
# SPDX-License-Identifier: BSD-2-Clause

all: respondd.so

CFLAGS += -Wall

respondd.so: respondd.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -shared -fPIC -D_GNU_SOURCE -o $@ $^ $(LDLIBS) -lgluonutil -luci
