#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/TI/bios_6_73_01_01/packages
override XDCROOT = C:/TI/xdctools_3_50_07_20_core
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/TI/bios_6_73_01_01/packages;C:/TI/xdctools_3_50_07_20_core/packages;..
HOSTOS = Windows
endif
