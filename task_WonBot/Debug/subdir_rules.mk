################################################################################
# Automatically-generated file. Do not edit!
################################################################################

SHELL = cmd.exe

# Each subdirectory must supply rules for building sources it contributes
DeviceInit_18Nov2018.obj: ../DeviceInit_18Nov2018.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/bin/cl2000" -v28 -ml -mt --include_path="C:/Users/peima/Documents/01- School/02-Term 7/02-Real-Time/03-Labs/task_WonBot" --include_path="C:/TI/bios_6_73_01_01/packages/ti/posix/ccs" --include_path="C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/include" -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="DeviceInit_18Nov2018.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

F2802x_GlobalVariableDefs.obj: ../F2802x_GlobalVariableDefs.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/bin/cl2000" -v28 -ml -mt --include_path="C:/Users/peima/Documents/01- School/02-Term 7/02-Real-Time/03-Labs/task_WonBot" --include_path="C:/TI/bios_6_73_01_01/packages/ti/posix/ccs" --include_path="C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/include" -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="F2802x_GlobalVariableDefs.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

task.obj: ../task.c $(GEN_OPTS) | $(GEN_HDRS)
	@echo 'Building file: "$<"'
	@echo 'Invoking: C2000 Compiler'
	"C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/bin/cl2000" -v28 -ml -mt --include_path="C:/Users/peima/Documents/01- School/02-Term 7/02-Real-Time/03-Labs/task_WonBot" --include_path="C:/TI/bios_6_73_01_01/packages/ti/posix/ccs" --include_path="C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS/include" -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="task.d_raw" $(GEN_OPTS__FLAG) "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

build-2081291697:
	@$(MAKE) --no-print-directory -Onone -f subdir_rules.mk build-2081291697-inproc

build-2081291697-inproc: ../task.cfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: XDCtools'
	"C:/TI/xdctools_3_50_07_20_core/xs" --xdcpath="C:/TI/bios_6_73_01_01/packages;" xdc.tools.configuro -o configPkg -t ti.targets.C28_large -p ti.platforms.tms320x28:TMS320F28027 -r release -c "C:/TI/ccsv8/tools/compiler/ti-cgt-c2000_18.1.2.LTS" --compileOptions "-g" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

configPkg/linker.cmd: build-2081291697 ../task.cfg
configPkg/compiler.opt: build-2081291697
configPkg/: build-2081291697


