# invoke SourceDir generated makefile for task.p28L
task.p28L: .libraries,task.p28L
.libraries,task.p28L: package/cfg/task_p28L.xdl
	$(MAKE) -f C:\Users\peima\DOCUME~1\01-SCH~1\02-TER~1\02-Real-Time\03-Labs\task_WonBot/src/makefile.libs

clean::
	$(MAKE) -f C:\Users\peima\DOCUME~1\01-SCH~1\02-TER~1\02-Real-Time\03-Labs\task_WonBot/src/makefile.libs clean

