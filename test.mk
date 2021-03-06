#
# Generated makefile for test "test_test2"
#

#
# Stop the MAKEFLAGS variable being exported.
# This is needed for sub-make processes to use different options.
#
unexport MAKEFLAGS

#
# The name of the test
#
THIS_TEST := test_test2

#
# Test script file
#
test_test2_TESTOBJ := test_test2

#
# Software under test
#
test_test2_SUTOBJ := Src/test

#
# Compile and link as 'C' or 'CXX'
#
test_test2_C_OR_CPP_MODE := C

#
# Additional libraries to link
#
test_test2_EXTLIBS := 

#
# Additional object files to link
#
test_test2_EXTOBJS := 

#
# Additional defines for this test
#
test_test2_DEFINES := 

#
# Additional includes for this test
#
test_test2_INCLUDES := ../../Inc

#
# Include the test definitions makefile
#
include ../configuration/test_defs.mk

#
# Rules for compiling the software under test
#
test_test2/Src/test.o : ../../Src/test.c
	$(MKDIR_CMD) -p test_test2/Src
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) ../../Src/test.c > $(DYNAMIC_THIS_TEST)/filelist.lst
	-@$(QAC_CMD)
	$(subst %DEFINES%, $(foreach define,$(test_test2_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(test_test2_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(test_test2_SUTOBJ),$(COMPILE_CC_CMD))))

#
# Rule for compiling the test script
#
test_test2/test_test2.o : test_test2/test_test2.c
	$(MKDIR_CMD) -p test_test2
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,0,0 >> $(CANTPP_TOP_LEVEL_LOG)
	-@$(ECHO_CMD_MED) test_test2/test_test2.c > $(DYNAMIC_THIS_TEST)/filelist.lst
	$(subst %DEFINES%, $(foreach define,$(test_test2_ALL_DEFINES),$(DEFINE_OPT)$(define)), $(subst %INCLUDES%, $(foreach include,$(test_test2_ALL_INCLUDES),$(subst %s,$(include),$(INCLUDE_PATH_OPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/$(test_test2_SUTOBJ),$(COMPILE_CC_CMD))))

#
# Rule for linking the test executable
#
$(test_test2_TEST_EXE) : \
	$(test_test2_SUTOBJ_FILENAMES) \
	$(test_test2_TESTOBJ_FILENAMES) \
	$(test_test2_EXTRA_DEPENDS)
	@$(RM_CMD) $(DYNAMIC_THIS_TEST)/*.cov $(DYNAMIC_THIS_TEST)/*.ctr $(DYNAMIC_THIS_TEST)/*.ctg
	@$(ECHO_CMD_MED) ",,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),1,0,0,1,0" >> $(CANTPP_TOP_LEVEL_LOG)
	$(subst %EXTLIBS%, $(foreach extlib,$(test_test2_ALL_EXTLIBS),$(subst %s,$(extlib),$(test_test2_LINK_EXTLIBOPT))), $(subst %n,$(DYNAMIC_THIS_TEST)/test_test2,$(subst %EXTOBJS%,$(test_test2_EXTOBJS),$(CC_LINK_CMD))))
	@$(ECHO_CMD_MED) Built test_test2 successfully

#
# Rule for running the test executable
#
$(test_test2_CTR_FILE) : $(test_test2_TEST_EXE)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,1,0,1,0 >> $(CANTPP_TOP_LEVEL_LOG)
	@$(RUN_CMD)
	@$(ECHO_CMD_MED) ,,$(NUMBER_OF_TESTS),$(firstword $(subst /, ,$(dir $@))),0,0,1,0,0 >> $(CANTPP_TOP_LEVEL_LOG)

#
# Rule for ensuring nothing is built/run unless the ctr file is out of date
#
$(test_test2_RUN) : $(test_test2_CTR_FILE)

#
# Rule for controlling the building and running of the test executable
#
ifeq ($(EXECUTE),1)
ifeq ($(PUSH_TO_SERVER),1)
$(test_test2_BUILD_AND_RUN) : 
	-@$(MAKE) $(test_test2_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Uploading test results to Cantata Server...
	@$(JAVA_CMD) -cp "$(CANTATA_INSTALL_DIR)/bin/client.jar" com.qas.cantata.client.control.CCLC filesToLoad=$(DYNAMIC_THIS_TEST)/.*.ctr,$(DYNAMIC_THIS_TEST)/.*.ctg,$(DYNAMIC_THIS_TEST)/.*.cov,../../Src/test.c,$(DYNAMIC_THIS_TEST)/test_test2.c optionsFiles=../../ipg.cop,$(DYNAMIC_THIS_TEST)/ipg.cop 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(CTR_STATE_CMD)
else
$(test_test2_BUILD_AND_RUN) : 
	-@$(MAKE) $(test_test2_RUN) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(CTR_STATE_CMD)
endif
else
$(test_test2_BUILD_AND_RUN) : 
	@$(MAKE) $(test_test2_TEST_EXE) --warn-undefined-variables -s -f $(DYNAMIC_THIS_TEST)/test.mk 2>&1 | tee -a $(DYNAMIC_THIS_TEST)/$($(DYNAMIC_THIS_TEST)_LOG)
	@$(ECHO_CMD_MED) Finished $(DYNAMIC_THIS_TEST)
endif

#
# Rules for generating the required folder structure
#
test_test2/Src : 
	-@$(MKDIR_CMD) $@

#
# Additional dependencies
#
test_test2/Src/test.o : ../../Inc/get.h
test_test2/Src/test.o : ../../ipg.cop
test_test2/Src/test.o : test_test2/ipg.cop
test_test2/test_test2.o : ../../Inc/get.h
test_test2/test_test2.o : ../../ipg.cop
test_test2/test_test2.o : test_test2/ipg.cop


