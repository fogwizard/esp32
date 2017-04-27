# Copyright Statement:
# (C) 2005-2016 MediaTek Inc. All rights reserved.
#
# This software/firmware and related documentation ("MediaTek Software") are
# protected under relevant copyright laws. The information contained herein
# is confidential and proprietary to MediaTek Inc. ("MediaTek") and/or its licensors.
# Without the prior written permission of MediaTek and/or its licensors,
# any reproduction, modification, use or disclosure of MediaTek Software,
# and information contained herein, in whole or in part, shall be strictly prohibited.
# You may only use, reproduce, modify, or distribute MediaTek Software
# if you have agreed to and been granted explicit permission within
# the "License Agreement" that is available on MediaTek's website ("Website") before
# downloading the relevant MediaTek Software from the Website ("Permitted User").
# If you are not a Permitted User, please cease any access or use of MediaTek Software immediately.
#
# BY OPENING THIS FILE, RECEIVER HEREBY UNEQUIVOCALLY ACKNOWLEDGES AND AGREES
# THAT MEDIATEK SOFTWARE RECEIVED FROM MEDIATEK AND/OR ITS REPRESENTATIVES 
# ARE PROVIDED TO RECEIVER ON AN "AS-IS" BASIS ONLY. MEDIATEK EXPRESSLY DISCLAIMS ANY AND ALL 
# WARRANTIES, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE OR NONINFRINGEMENT.
# NEITHER DOES MEDIATEK PROVIDE ANY WARRANTY WHATSOEVER WITH RESPECT TO THE
# SOFTWARE OF ANY THIRD PARTY WHICH MAY BE USED BY, INCORPORATED IN, OR
# SUPPLIED WITH MEDIATEK SOFTWARE, AND RECEIVER AGREES TO LOOK ONLY TO SUCH
# THIRD PARTY FOR ANY WARRANTY CLAIM RELATING THERETO. RECEIVER EXPRESSLY ACKNOWLEDGES
# THAT IT IS RECEIVER'S SOLE RESPONSIBILITY TO OBTAIN FROM ANY THIRD PARTY ALL PROPER LICENSES
# CONTAINED IN MEDIATEK SOFTWARE. MEDIATEK SHALL ALSO NOT BE RESPONSIBLE FOR ANY MEDIATEK
# SOFTWARE RELEASES MADE TO RECEIVER'S SPECIFICATION OR TO CONFORM TO A PARTICULAR
# STANDARD OR OPEN FORUM. RECEIVER'S SOLE AND EXCLUSIVE REMEDY AND MEDIATEK'S ENTIRE AND
# CUMULATIVE LIABILITY WITH RESPECT TO MEDIATEK SOFTWARE RELEASED HEREUNDER WILL BE,
# AT MEDIATEK'S OPTION, TO REVISE OR REPLACE MEDIATEK SOFTWARE AT ISSUE,
# OR REFUND ANY SOFTWARE LICENSE FEES OR SERVICE CHARGE PAID BY RECEIVER TO
# MEDIATEK FOR SUCH MEDIATEK SOFTWARE AT ISSUE.
#
SOURCE_DIR = ../../../../..
BINPATH    = ~/gcc-arm-none-eabi/bin

PWD        = $(shell pwd)

FEATURE    ?= feature.mk

include $(FEATURE)

# Gloabl Config
-include $(SOURCE_DIR)/.config
# IC Config
-include $(SOURCE_DIR)/config/chip/$(IC_CONFIG)/chip.mk
# Board Config
-include $(SOURCE_DIR)/config/board/$(BOARD_CONFIG)/board.mk

RAM_BOOTING=0

DEBUG      = 0
FLOAT_TYPE = hard
BUILD_DIR  = $(PWD)/Build

# Project name
PROJ_NAME = mt7687_iot_sdk
PROJ_PATH = $(PWD)
OUTPATH = $(PWD)/Build

# lzma files
LIBS += $(SOURCE_DIR)/middleware/third_party/lzma_decoder/lib/liblzma.a

# Main APP files
APP_PATH = project/mt7687_hdk/apps/iot_sdk
APP_PATH_SRC = $(APP_PATH)/src

MQTT_SRC = $(APP_PATH_SRC)/sdk/src/mqtt
CCP_SRC = $(APP_PATH_SRC)/sdk/src/ccp
MBEDTLS_SRC = $(APP_PATH_SRC)/sdk/public_libs/mbedtls
SSL_PORTING_SRC = $(APP_PATH_SRC)/sdk/public_libs/porting/mbedtls

#################################################################################
#include path
CFLAGS 	+= -I./include
CFLAGS	+= -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include
CFLAGS  += -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include/lwip
CFLAGS  += -I$(SOURCE_DIR)/middleware/third_party/lwip/ports/include
CFLAGS  += -I$(SOURCE_DIR)/kernel/rtos/FreeRTOS/Source/include
CFLAGS  += -I$(SOURCE_DIR)/kernel/rtos/FreeRTOS/Source/portable/GCC/ARM_CM4F
CFLAGS  += -I$(MQTT_SRC)/MQTTPacket/src
CFLAGS  += -I$(MQTT_SRC)/MQTTClient-C/src
CFLAGS  += -I$(MBEDTLS_SRC)/include
CFLAGS	+= -I$(MQTT_SRC)/MQTTClient-C/nettype/tls
CFLAGS  += -I$(CCP_SRC)/include
CFLAGS  += -I$(SSL_PORTING_SRC)/

CFLAGS  += $(FPUFLAGS) -DPRODUCT_VERSION=$(PRODUCT_VERSION)
CFLAGS  += -Os -fno-common
CFLAGS  += -fomit-frame-pointer
CFLAGS  += -DSUPPORT_MBEDTLS
#CFLAGS  += -I./src/mbedtls/include
#CFLAGS	+= -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include
CFLAGS	+= -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include/posix
#CFLAGS  += -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include/lwip
#CFLAGS  += -I$(SOURCE_DIR)/middleware/third_party/lwip/ports/include
CFLAGS  += -I$(MBEDTLS_SRC)/include
CFLAGS  += -I$(MBEDTLS_SRC)/include/mbedtls
CFLAGS  += -I$(MBEDTLS_SRC)/configs
#CFLAGS  += "-I$PWD/configs -DMBEDTLS_CONFIG_FILE='<foo.h>'"
CFLAGS  += -I$(SOURCE_DIR)/kernel/rtos/FreeRTOS/Source/include 
CFLAGS  += -I$(SOURCE_DIR)/kernel/rtos/FreeRTOS/Source/portable/GCC/ARM_CM4F
CFLAGS  += -I$(SOURCE_DIR)/kernel/service/inc

C_FILES = $(MBEDTLS_SRC)/library/aes.c \
$(MBEDTLS_SRC)/library/aesni.c \
$(MBEDTLS_SRC)/library/arc4.c \
$(MBEDTLS_SRC)/library/asn1parse.c \
$(MBEDTLS_SRC)/library/asn1write.c \
$(MBEDTLS_SRC)/library/base64.c \
$(MBEDTLS_SRC)/library/bignum.c \
$(MBEDTLS_SRC)/library/blowfish.c \
$(MBEDTLS_SRC)/library/camellia.c \
$(MBEDTLS_SRC)/library/ccm.c \
$(MBEDTLS_SRC)/library/certs.c \
$(MBEDTLS_SRC)/library/cipher.c \
$(MBEDTLS_SRC)/library/cipher_wrap.c \
$(MBEDTLS_SRC)/library/ctr_drbg.c \
$(MBEDTLS_SRC)/library/debug.c \
$(MBEDTLS_SRC)/library/des.c \
$(MBEDTLS_SRC)/library/dhm.c \
$(MBEDTLS_SRC)/library/ecdh.c \
$(MBEDTLS_SRC)/library/ecdsa.c \
$(MBEDTLS_SRC)/library/ecp.c \
$(MBEDTLS_SRC)/library/ecp_curves.c \
$(MBEDTLS_SRC)/library/entropy.c \
$(MBEDTLS_SRC)/library/entropy_poll.c \
$(MBEDTLS_SRC)/library/gcm.c \
$(MBEDTLS_SRC)/library/havege.c \
$(MBEDTLS_SRC)/library/hmac_drbg.c \
$(MBEDTLS_SRC)/library/md2.c \
$(MBEDTLS_SRC)/library/md4.c \
$(MBEDTLS_SRC)/library/md5.c \
$(MBEDTLS_SRC)/library/md.c \
$(MBEDTLS_SRC)/library/md_wrap.c \
$(MBEDTLS_SRC)/library/memory_buffer_alloc.c \
$(MBEDTLS_SRC)/library/net.c \
$(MBEDTLS_SRC)/library/oid.c \
$(MBEDTLS_SRC)/library/padlock.c \
$(MBEDTLS_SRC)/library/pem.c \
$(MBEDTLS_SRC)/library/pk.c \
$(MBEDTLS_SRC)/library/pkcs11.c \
$(MBEDTLS_SRC)/library/pkcs12.c \
$(MBEDTLS_SRC)/library/pkcs5.c \
$(MBEDTLS_SRC)/library/pkparse.c \
$(MBEDTLS_SRC)/library/pk_wrap.c \
$(MBEDTLS_SRC)/library/pkwrite.c \
$(MBEDTLS_SRC)/library/platform.c \
$(MBEDTLS_SRC)/library/ripemd160.c \
$(MBEDTLS_SRC)/library/rsa.c \
$(MBEDTLS_SRC)/library/sha1.c \
$(MBEDTLS_SRC)/library/sha256.c \
$(MBEDTLS_SRC)/library/sha512.c \
$(MBEDTLS_SRC)/library/ssl_cache.c \
$(MBEDTLS_SRC)/library/ssl_ciphersuites.c \
$(MBEDTLS_SRC)/library/ssl_cli.c \
$(MBEDTLS_SRC)/library/ssl_srv.c \
$(MBEDTLS_SRC)/library/ssl_tls.c \
$(MBEDTLS_SRC)/library/threading.c \
$(MBEDTLS_SRC)/library/timing.c \
$(MBEDTLS_SRC)/library/version.c \
$(MBEDTLS_SRC)/library/version_features.c \
$(MBEDTLS_SRC)/library/x509.c \
$(MBEDTLS_SRC)/library/x509_create.c \
$(MBEDTLS_SRC)/library/x509_crl.c \
$(MBEDTLS_SRC)/library/x509_crt.c \
$(MBEDTLS_SRC)/library/x509_csr.c \
$(MBEDTLS_SRC)/library/x509write_crt.c \
$(MBEDTLS_SRC)/library/x509write_csr.c \
$(MBEDTLS_SRC)/library/xtea.c \
$(MBEDTLS_SRC)/library/ssl_cookie.c \
$(MBEDTLS_SRC)/library/error.c \
$(MBEDTLS_SRC)/library/ssl_ticket.c

CFLAGS  += -I$(APP_PATH_SRC)/sdk/platform/freertos/inc
CFLAGS  += -I$(APP_PATH_SRC)/sdk/common/inc
CFLAGS  += -I$(APP_PATH_SRC)/sdk/include

C_FILES   +=    $(MQTT_SRC)/MQTTPacket/src/MQTTConnectClient.c    \
                $(MQTT_SRC)/MQTTPacket/src/MQTTConnectServer.c     \
                $(MQTT_SRC)/MQTTPacket/src/MQTTDeserializePublish.c    \
                $(MQTT_SRC)/MQTTPacket/src/MQTTFormat.c   \
                $(MQTT_SRC)/MQTTPacket/src/MQTTPacket.c   \
                $(MQTT_SRC)/MQTTPacket/src/MQTTSerializePublish.c   \
                $(MQTT_SRC)/MQTTPacket/src/MQTTSubscribeClient.c    \
                $(MQTT_SRC)/MQTTPacket/src/MQTTSubscribeServer.c    \
                $(MQTT_SRC)/MQTTPacket/src/MQTTUnsubscribeClient.c    \
                $(MQTT_SRC)/MQTTPacket/src/MQTTUnsubscribeServer.c	  \
                $(MQTT_SRC)/MQTTClient-C/src/aliyun_iot_mqtt_client.c			\
				$(MQTT_SRC)/MQTTClient-C/src/aliyun_iot_mqtt_common.c	\
				$(MQTT_SRC)/MQTTClient-C/nettype/tls/aliyun_iot_mqtt_nettype.c \
				$(SSL_PORTING_SRC)/aliyun_iot_network_ssl.c
            
#C_FILES   +=    $(CCP_SRC)/CCPAuth.c    \
#                $(CCP_SRC)/CCPClient.c     \
#                $(CCP_SRC)/CCPClientInternal.c    \
#                $(CCP_SRC)/CCPConnect.c   \
#                $(CCP_SRC)/CCPConnectAck.c   \
#                $(CCP_SRC)/CCPDisconnect.c   \
#                $(CCP_SRC)/CCPNetwork.c    \
#                $(CCP_SRC)/CCPPacket.c    \
#                $(CCP_SRC)/CCPPong.c    \
#                $(CCP_SRC)/CCPPublish.c	  \
#                $(CCP_SRC)/CCPPublishAck.c			\
#				$(CCP_SRC)/CCPPush.c	\
#				$(CCP_SRC)/CCPPushAck.c	\
#				$(CCP_SRC)/CCPReconnect.c	\
#				$(CCP_SRC)/CCPReconnectAck.c	\
#				$(CCP_SRC)/CCPRPCRequest.c	\
#				$(CCP_SRC)/CCPRPCResponse.c	\
#				$(CCP_SRC)/CCPRRPCRequest.c	\
#				$(CCP_SRC)/CCPRRPCResponse.c	\
#				$(CCP_SRC)/CCPSubscribe.c	\
#				$(CCP_SRC)/CCPSubscribeAck.c	\
#				$(CCP_SRC)/CCPUnknownSession.c	\
#				$(CCP_SRC)/CCPUnsubscribe.c	\
#				$(CCP_SRC)/CCPUnsubscribeAck.c	
				
				
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_base64.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_config.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_httpclient.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_json.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_md5.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_log.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_hmac.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_urlencode.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_list.c
C_FILES += $(APP_PATH_SRC)/sdk/common/src/aliyun_iot_common_sha1.c
C_FILES += $(APP_PATH_SRC)/sdk/src/mqtt/MQTTClient-C/src/aliyun_iot_auth.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_pthread.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_memory.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_network.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_persistence.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_signal.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_timer.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_random.c
C_FILES += $(APP_PATH_SRC)/sdk/platform/freertos/src/aliyun_iot_platform_threadsync.c
C_FILES += $(APP_PATH_SRC)/sdk/examples/freertos/mqtt/demo.c
#C_FILES += $(APP_PATH_SRC)/sdk/examples/freertos/ccp/demo.c
				

APP_FILES = $(APP_PATH_SRC)/main.c \
			$(APP_PATH_SRC)/cli_def.c \
			$(APP_PATH_SRC)/io_def.c \
			$(APP_PATH_SRC)/task_def.c \
			$(APP_PATH_SRC)/net_init.c \
			$(APP_PATH)/GCC/syscalls.c
			
ifeq ($(MTK_HOMEKIT_ENABLE),y)
APP_FILES += $(APP_PATH_SRC)/homekit_init.c
endif

C_FILES += $(APP_FILES)
C_FILES += $(APP_PATH_SRC)/system_mt7687.c


# add startup file to build
S_FILES += $(APP_PATH)/GCC/startup_mt7687.s



C_OBJS = $(C_FILES:%.c=$(BUILD_DIR)/%.o)
S_OBJS = $(S_FILES:%.s=$(BUILD_DIR)/%.o)

CFLAGS += -DMTK_FW_VERSION=\"$(MTK_FW_VERSION)\"

DATIME = $(shell date --iso=seconds)
CFLAGS += -DMTK_FW_VERSION=\"$(MTK_FW_VERSION)\"

###################################################
# include path
CFLAGS += -I$(SOURCE_DIR)/$(APP_PATH)/inc
CFLAGS += -I$(SOURCE_DIR)/driver/chip/mt7687/inc
CFLAGS += -I$(SOURCE_DIR)/driver/chip/inc
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/lwip/src/include
CFLAGS += -I$(SOURCE_DIR)/middleware/third_party/lwip/ports/include

###################################################
# LD Flags
LDFLAGS = $(ALLFLAGS) $(FPUFLAGS) --specs=nano.specs -lnosys -nostartfiles -u _printf_float -u _scanf_float 
ifeq ($(RAM_BOOTING), 1)
LDFLAGS += -Wl,-Tmt7687_sram.ld -Wl,--gc-sections
else
LDFLAGS += -Wl,-Tmt7687_flash.ld -Wl,--gc-sections
endif

LDFLAGS += -Wl,-wrap=printf

###################################################
# Libraries
ifeq ($(MTK_HOMEKIT_ENABLE),y)
LIBS += $(SOURCE_DIR)/middleware/MTK/homekit/lib/libhomekit.a
LIBS += $(OUTPATH)/libjsonc.a
LIBS += $(OUTPATH)/libed25519.a
LIBS += $(OUTPATH)/libchacha20poly1305.a
LIBS += $(OUTPATH)/libcurve25519.a
LIBS += $(OUTPATH)/libsrp.a
endif
#LIBS += $(OUTPATH)/libcjson.a
#LIBS += $(OUTPATH)/libhttpclient.a
#LIBS += $(OUTPATH)/libmbedtls.a
LIBS += $(SOURCE_DIR)/middleware/MTK/minicli/lib/libminicli.a
ifeq ($(MTK_WIFI_WPS_ENABLE),y)
LIBS += $(SOURCE_DIR)/middleware/MTK/minisupp/lib/libminisupp_wps.a
else
LIBS += $(SOURCE_DIR)/middleware/MTK/minisupp/lib/libminisupp.a
endif
#LIBS += $(OUTPATH)/libmqtt.a
#LIBS += $(OUTPATH)/libnghttp2.a
ifeq ($(MTK_NVRAM_ENABLE),y)
LIBS += $(SOURCE_DIR)/middleware/MTK/nvram/lib/libnvram.a
endif
#LIBS += $(OUTPATH)/libsntp.a
#LIBS += $(OUTPATH)/libxml.a
LIBS += $(OUTPATH)/libiperf.a
LIBS += $(OUTPATH)/librtos.a
LIBS += $(OUTPATH)/libbspex.a
LIBS += $(OUTPATH)/libbsp.a
LIBS += $(SOURCE_DIR)/driver/board/mt76x7_hdk/lib/libbsp_sec.a
LIBS += $(OUTPATH)/libsmtcn.a
LIBS += $(SOURCE_DIR)/middleware/MTK/smtcn/lib/libsmtcn_core.a
LIBS += $(SOURCE_DIR)/kernel/service/lib/libservice_core.a
LIBS += $(OUTPATH)/libservice.a
LIBS += $(OUTPATH)/libping.a
LIBS += $(OUTPATH)/liblwip.a
LIBS += $(SOURCE_DIR)/driver/chip/mt7687/lib/libhal_core.a
LIBS += $(OUTPATH)/libhal.a
LIBS += $(SOURCE_DIR)/driver/chip/mt7687/lib/libhal_sec.a
LIBS += $(OUTPATH)/libdhcpd.a
LIBS += $(OUTPATH)/libfota.a
LIBS += $(OUTPATH)/libtftp.a

###################################################
# Rules
.PHONY: libs proj clean

all: libs proj
	@mkdir -p $(BUILD_DIR)
	@$(SIZE) $(OUTPATH)/$(PROJ_NAME)_xip.elf
	@echo "Generate Assembly from elf:"
	#@echo cp $(SOURCE_DIR)/$(APP_PATH)/download_config/* $(OUTPATH)/
	@cp $(SOURCE_DIR)/$(APP_PATH)/download_config/flash_download.txt $(OUTPATH)/
	@$(OBJDUMP) -S $(OUTPATH)/$(PROJ_NAME)_xip.elf > $(OUTPATH)/$(PROJ_NAME)_xip.elf.s
	#@cp $(SOURCE_DIR)/driver/chip/mt7687/wifi_n9/WIFI_RAM_CODE_MT7687_in_flash.bin $(OUTPATH)/
	#@cp $(SOURCE_DIR)/driver/board/mt76x7_hdk/bootloader/loader_inflash.bin $(OUTPATH)/
	@$(SOURCE_DIR)/tools/scripts/build/copy_firmware.sh $(SOURCE_DIR) $(OUTPATH) $(IC_CONFIG) $(BOARD_CONFIG) $(PROJ_NAME)_xip.bin
	@cp *.cmm $(OUTPATH)/


MOD_EXTRA = BUILD_DIR=$(BUILD_DIR) OUTPATH=$(OUTPATH) PROJ_PATH=$(PROJ_PATH)

libs:
	make -C $(KRL_OS_PATH) $(MOD_EXTRA)
	make -C $(MID_TFTP_PATH) $(MOD_EXTRA)
	make -C $(MID_LWIP_PATH) $(MOD_EXTRA)
#	make -C $(MID_CJSON_PATH) $(MOD_EXTRA)
	make -C $(MID_DHCPD_PATH) $(MOD_EXTRA)
	make -C $(MID_HTTPCLIENT_PATH) $(MOD_EXTRA)
#	make -C $(MID_MBEDTLS_PATH) $(MOD_EXTRA)
#	make -C $(MID_MQTT_PATH) $(MOD_EXTRA)
#	make -C $(MID_NGHTTP2_PATH) $(MOD_EXTRA)
ifeq ($(MTK_NVRAM_ENABLE),y)
endif
	make -C $(MID_SMTCN_PATH) $(MOD_EXTRA)
#	make -C $(MID_SNTP_PATH) $(MOD_EXTRA)
#	make -C $(MID_XML_PATH) $(MOD_EXTRA)
	make -C $(MID_BSPEXT_PATH) $(MOD_EXTRA)
	make -C $(DRV_CHIP_PATH) $(MOD_EXTRA)
	make -C $(KRL_SRV_PATH) $(MOD_EXTRA)
	make -C $(DRV_BSP_PATH) $(MOD_EXTRA)
	make -C $(MID_PING_PATH) $(MOD_EXTRA)
	make -C $(MID_IPERF_PATH) $(MOD_EXTRA)
	make -C $(MID_FOTA_PATH) $(MOD_EXTRA)
ifeq ($(MTK_HOMEKIT_ENABLE),y)
	make -C $(MID_CURVE25519_PATH)  $(MOD_EXTRA)
	make -C $(MID_JSONC_PATH)  $(MOD_EXTRA)
	make -C $(MID_ED25519_PATH)  $(MOD_EXTRA)
	make -C $(MID_CHACHA20POLY1305_PATH)  $(MOD_EXTRA)
	make -C $(MID_SRP_PATH)  $(MOD_EXTRA)
endif


proj: $(OUTPATH)/$(PROJ_NAME)_xip.elf

$(OUTPATH)/$(PROJ_NAME)_xip.elf: $(C_OBJS) $(S_OBJS) $(LIBS)
	@echo Linking...
	@$(CC) $(LDFLAGS) -Wl,--start-group $^ -Wl,--end-group -Wl,-Map=$(OUTPATH)/$(PROJ_NAME)_xip.map -lm -o $@ 2>>$(ERR_LOG)
	@$(OBJCOPY) -O ihex $(OUTPATH)/$(PROJ_NAME)_xip.elf $(OUTPATH)/$(PROJ_NAME)_xip.hex
	@$(OBJCOPY) -O binary $(OUTPATH)/$(PROJ_NAME)_xip.elf $(OUTPATH)/$(PROJ_NAME)_xip.bin
	@echo Done

$(LIBS): libs

include $(SOURCE_DIR)/.rule.mk

clean:
	rm -rf $(OUTPATH)
	make -C $(MID_MINISUPP_PATH) $(MOD_EXTRA) clean

.PHONY: options

options:
	@for opt in `sed 's/[()]/\n/g' $(SOURCE_DIR)/config/chip/$(IC_CONFIG)/chip.mk|sed 's/-D/ /'|sort|uniq|grep ^MTK_|grep _ENABLE$$`; do echo $$opt; done
print-%  : ; @echo $* = $($*)
