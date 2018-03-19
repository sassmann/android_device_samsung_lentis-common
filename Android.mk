#
# Copyright (C) 2016 The Sayanogen Project
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

ifneq ($(filter kccat6 lentislte,$(TARGET_DEVICE)),)
include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif

include $(CLEAR_VARS)
BT_FW_FILES := \
	nvm_tlv.bin nvm_tlv_1.3.bin nvm_tlv_2.1.bin nvm_tlv_3.0.bin \
	rampatch_tlv.img rampatch_tlv_1.3.tlv rampatch_tlv_2.1.tlv \
	rampatch_tlv_3.0.tlv

BT_FW_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/firmware/,$(notdir $(BT_FW_FILES)))
$(BT_FW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "BT FW symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/firmware/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(BT_FW_SYMLINKS)

include $(CLEAR_VARS)
SEC_LIB_FILES := \
	libprotobuf-cpp-full.so

SEC_LIB_SYMLINKS := $(addprefix $(TARGET_OUT)/lib/,$(notdir $(SEC_LIB_FILES)))
$(SEC_LIB_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SEC LIB symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SEC_LIB_SYMLINKS)

include $(CLEAR_VARS)
SEC_BIN_FILES := \
	ks

SEC_BIN_SYMLINKS := $(addprefix $(TARGET_OUT)/bin/,$(notdir $(SEC_BIN_FILES)))
$(SEC_BIN_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "SEC BIN symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/bin/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(SEC_BIN_SYMLINKS)
