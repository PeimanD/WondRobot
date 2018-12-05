#
_XDCBUILDCOUNT = 
ifneq (,$(findstring path,$(_USEXDCENV_)))
override XDCPATH = C:/TI/bios_6_73_01_01/packages;C:/Users/peima/DOCUME~1/01-SCH~1/02-TER~1/02-Real-Time/03-Labs/task_WonBot/.config
override XDCROOT = C:/TI/xdctools_3_50_07_20_core
override XDCBUILDCFG = ./config.bld
endif
ifneq (,$(findstring args,$(_USEXDCENV_)))
override XDCARGS = 
override XDCTARGETS = 
endif
#
ifeq (0,1)
PKGPATH = C:/TI/bios_6_73_01_01/packages;C:/Users/peima/DOCUME~1/01-SCH~1/02-TER~1/02-Real-Time/03-Labs/task_WonBot/.config;C:/TI/xdctools_3_50_07_20_core/packages;..
HOSTOS = Windows
endif
