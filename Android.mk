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
CAMVERS_FILES := \
    F16UL_s5k2p2xx_module_info.xml F16US_imx240_module_info.xml

CAMVERS_SYMLINKS := $(addprefix $(TARGET_OUT_ETC)/,$(notdir $(CAMVERS_FILES)))
$(CAMVERS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Camera module version link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/etc/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMVERS_SYMLINKS)

include $(CLEAR_VARS)
CAMDATA_SYMLINK := $(TARGET_OUT)/cameradata
$(CAMDATA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Cameradata symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/cameradata $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMDATA_SYMLINK)

include $(CLEAR_VARS)
CAMLIB_FILES := \
    F16UL_libchromatix_s5k2p2xx_default_video.so \
    F16UL_libchromatix_s5k2p2xx_golfshot.so \
    F16UL_libchromatix_s5k2p2xx_golfshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_liveshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_preview.so \
    F16UL_libchromatix_s5k2p2xx_hdr_preview_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_preview_lls_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_uhd_video.so \
    F16UL_libchromatix_s5k2p2xx_hdr_uhd_video_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_video.so \
    F16UL_libchromatix_s5k2p2xx_hdr_video_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_zslshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hdr_zslshot_lls_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hfr_1080p_b.so \
    F16UL_libchromatix_s5k2p2xx_hfr_1080p_b_cpp.so \
    F16UL_libchromatix_s5k2p2xx_hfr_120.so \
    F16UL_libchromatix_s5k2p2xx_hfr_120_cpp.so \
    F16UL_libchromatix_s5k2p2xx_liveshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_pip.so \
    F16UL_libchromatix_s5k2p2xx_preview.so \
    F16UL_libchromatix_s5k2p2xx_preview_cpp.so \
    F16UL_libchromatix_s5k2p2xx_preview_drama_cpp.so \
    F16UL_libchromatix_s5k2p2xx_preview_lls_cpp.so \
    F16UL_libchromatix_s5k2p2xx_preview_panorama_cpp.so \
    F16UL_libchromatix_s5k2p2xx_preview_pip_cpp.so \
    F16UL_libchromatix_s5k2p2xx_shotmode_preview.so \
    F16UL_libchromatix_s5k2p2xx_shotmode_preview_cpp.so \
    F16UL_libchromatix_s5k2p2xx_shotmode_zslshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_uhd_video.so \
    F16UL_libchromatix_s5k2p2xx_uhd_video_cpp.so \
    F16UL_libchromatix_s5k2p2xx_video_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso100_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso200_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso400_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_iso800_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_2_4_lls_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_iso100_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_iso200_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_iso400_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_iso800_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_lls_cpp.so \
    F16UL_libchromatix_s5k2p2xx_zslshot_pip_cpp.so \
    F16UL_libTsAe.so F16UL_libTsAf.so \
    F16UL_libTs_J_Accm.so F16UL_libTs_J_Awb.so \
    F16US_libchromatix_imx240_default_video.so \
    F16US_libchromatix_imx240_golfshot.so \
    F16US_libchromatix_imx240_golfshot_cpp.so \
    F16US_libchromatix_imx240_hdr_liveshot_cpp.so \
    F16US_libchromatix_imx240_hdr_preview.so \
    F16US_libchromatix_imx240_hdr_preview_cpp.so \
    F16US_libchromatix_imx240_hdr_preview_lls_cpp.so \
    F16US_libchromatix_imx240_hdr_uhd_video.so \
    F16US_libchromatix_imx240_hdr_uhd_video_cpp.so \
    F16US_libchromatix_imx240_hdr_video.so \
    F16US_libchromatix_imx240_hdr_video_cpp.so \
    F16US_libchromatix_imx240_hdr_zslshot_cpp.so \
    F16US_libchromatix_imx240_hdr_zslshot_lls_cpp.so \
    F16US_libchromatix_imx240_hfr_1080p_b.so \
    F16US_libchromatix_imx240_hfr_1080p_b_cpp.so \
    F16US_libchromatix_imx240_hfr_120.so \
    F16US_libchromatix_imx240_hfr_120_cpp.so \
    F16US_libchromatix_imx240_liveshot_cpp.so \
    F16US_libchromatix_imx240_pip.so \
    F16US_libchromatix_imx240_preview.so \
    F16US_libchromatix_imx240_preview_cpp.so \
    F16US_libchromatix_imx240_preview_drama_cpp.so \
    F16US_libchromatix_imx240_preview_lls_cpp.so \
    F16US_libchromatix_imx240_preview_panorama_cpp.so \
    F16US_libchromatix_imx240_preview_pip_cpp.so \
    F16US_libchromatix_imx240_shotmode_preview.so \
    F16US_libchromatix_imx240_shotmode_preview_cpp.so \
    F16US_libchromatix_imx240_shotmode_zslshot_cpp.so \
    F16US_libchromatix_imx240_uhd_video.so \
    F16US_libchromatix_imx240_uhd_video_cpp.so \
    F16US_libchromatix_imx240_video_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_iso100_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_iso200_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_iso400_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_iso800_cpp.so \
    F16US_libchromatix_imx240_zslshot_2_4_lls_cpp.so \
    F16US_libchromatix_imx240_zslshot_cpp.so \
    F16US_libchromatix_imx240_zslshot_iso100_cpp.so \
    F16US_libchromatix_imx240_zslshot_iso200_cpp.so \
    F16US_libchromatix_imx240_zslshot_iso400_cpp.so \
    F16US_libchromatix_imx240_zslshot_iso800_cpp.so \
    F16US_libchromatix_imx240_zslshot_lls_cpp.so \
    F16US_libchromatix_imx240_zslshot_pip_cpp.so \
    F16US_libTsAe.so F16US_libTsAf.so \
    F16US_libTs_J_Accm.so F16US_libTs_J_Awb.so \
    libmmcamera_cac3_lib.so libmmcamera_fidelix_eeprom.so \
    libmmcamera_interface.so libmmcamera2_stats_algorithm.so \
    libTsAe.so libTsAf.so libTs_J_Accm.so libTs_J_Awb.so

CAMLIB_SYMLINKS := $(addprefix $(TARGET_OUT)/lib/,$(notdir $(CAMLIB_FILES)))
$(CAMLIB_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Camera module version link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CAMLIB_SYMLINKS)
