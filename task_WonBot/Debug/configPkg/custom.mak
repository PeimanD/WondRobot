## THIS IS A GENERATED FILE -- DO NOT EDIT
.configuro: .libraries,28L linker.cmd package/cfg/task_p28L.o28L

# To simplify configuro usage in makefiles:
#     o create a generic linker command file name 
#     o set modification times of compiler.opt* files to be greater than
#       or equal to the generated config header
#
linker.cmd: package/cfg/task_p28L.xdl
	$(SED) 's"^\"\(package/cfg/task_p28Lcfg.cmd\)\"$""\"C:/Users/peima/Documents/01- School/02-Term 7/02-Real-Time/03-Labs/task_WonBot/Debug/configPkg/\1\""' package/cfg/task_p28L.xdl > $@
	-$(SETDATE) -r:max package/cfg/task_p28L.h compiler.opt compiler.opt.defs
