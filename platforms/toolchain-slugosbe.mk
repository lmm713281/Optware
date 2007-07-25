TARGET_ARCH=armeb
TARGET_OS=linux
LIBC_STYLE=glibc

CROSS_CONFIGURATION_GCC_VERSION=4.1.1
CROSS_CONFIGURATION_GLIBC_VERSION=2.3.5
CROSS_CONFIGURATION_GCC=gcc-$(CROSS_CONFIGURATION_GCC_VERSION)
CROSS_CONFIGURATION_GLIBC=glibc-$(CROSS_CONFIGURATION_GLIBC_VERSION)
CROSS_CONFIGURATION = $(CROSS_CONFIGURATION_GCC)-$(CROSS_CONFIGURATION_GLIBC)

STAGING_CPPFLAGS+= -DPATH_MAX=4096 -DLINE_MAX=2048

ifeq ($(HOST_MACHINE),armv5teb)
HOSTCC = $(TARGET_CC)
GNU_HOST_NAME = armeb-linux
GNU_TARGET_NAME = armeb-linux
TARGET_CROSS = /usr/bin/$(GNU_TARGET_NAME)-
TARGET_LIBDIR = /usr/lib
TARGET_INCDIR = /usr/include
TARGET_LDFLAGS =
TARGET_CUSTOM_FLAGS=
TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_CUSTOM_FLAGS)
toolchain:
else
HOSTCC = gcc
GNU_HOST_NAME = $(HOST_MACHINE)-pc-linux-gnu
GNU_TARGET_NAME = armeb-linux
TARGET_CROSS_TOP = $(shell cd $(BASE_DIR)/../..; pwd)/slugosbe/tmp/cross
TARGET_CROSS = $(TARGET_CROSS_TOP)/bin/$(GNU_TARGET_NAME)-
TARGET_LIBDIR = $(TARGET_CROSS_TOP)/$(GNU_TARGET_NAME)/lib
TARGET_INCDIR = $(TARGET_CROSS_TOP)/$(GNU_TARGET_NAME)/include
TARGET_LDFLAGS = 
TARGET_CUSTOM_FLAGS= -pipe 
TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING) $(TARGET_CUSTOM_FLAGS)
toolchain:
endif
