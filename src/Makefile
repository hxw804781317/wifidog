
#BOARD  := MT7620

ifeq (MT7620, $(BOARD))
CROSS_PATH=/home/openwrt/staging_dir/toolchain-mipsel_24kec+dsp_gcc-4.8-linaro_uClibc-0.9.33.2/
CROSS_COMPILE=$(CROSS_PATH)bin/mipsel-openwrt-linux-
INCS = -I$(CROSS_PATH)../target-mipsel_24kec+dsp_uClibc-0.9.33.2/usr/include/
LIBS = -L$(CROSS_PATH)../target-mipsel_24kec+dsp_uClibc-0.9.33.2/usr/lib/
INCS += -I $(CROSS_PATH)include/
LIBS += -L $(CROSS_PATH)/lib/
CXX=$(CROSS_COMPILE)g++
CC=$(CROSS_COMPILE)gcc
export STAGING_DIR

else ifeq (UBUNTU, $(BOARD))
CXX=g++
CC=gcc
INCS = -I/include/ -I/usr/include/ -I/usr/local/include/
LIBS = -L/lib/ -L/usr/lib/ -L/usr/local/lib/

endif


wifidog_SOURCES = main.c
wdctl_SOURCES = wdctl.c

libgateway_a_SOURCES = $(wildcard ./src/*.c)
HTTPD  =  $(wildcard ./libhttpd/*.c)
COMMON_SRC =  $(HTTPD)
COMMON_SRC += $(libgateway_a_SOURCES)

WD_SRC = $(COMMON_SRC)
WD_SRC += $(wifidog_SOURCES)
WDCTL_SRC = $(COMMON_SRC)
WDCTL_SRC += $(wdctl_SOURCES)

WDCTL_OBJS = $(patsubst %.c,%.o,$(WDCTL_SRC))
WD_OBJS = $(patsubst %.c,%.o,$(WD_SRC))

INCS += -I./ -I./libhttpd/ -I./src/
LDLIBS := -lpthread -ldl -lm




all: wifidog wdctl
wifidog: $(WD_OBJS)
	$(CC) -o $@ $^ $(LIBS) $(LDLIBS)
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS) $(INCS)
	
wdctl: $(WDCTL_OBJS)
	$(CC) -o $@ $^ $(LIBS) $(LDLIBS)
%.o: %.c
	$(CC) -c -o $@ $< $(CFLAGS) $(INCS)

clean:
	rm -rf $(WD_OBJS) $(WDCTL_OBJS)
	rm -rf wifidog wdctl


