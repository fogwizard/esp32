#
# Main Makefile. This is basically the same as a component makefile.
#
# This Makefile should, at the very least, just include $(SDK_PATH)/make/component.mk. By default,
# this will take the sources in the src/ directory, compile them and link them into
# lib(subdirectory_name).a in the build directory. This behaviour is entirely configurable,
# please read the SDK documents if you need to do this.
#
THISDIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))
DATETIME := $(shell date "+%Y-%b-%d_%H:%M:%S_%Z")

COMPONENT_ADD_INCLUDEDIRS := include
CFLAGS += -DBUID_TIME=\"$(DATETIME)\" -Wno-error=format=

MQTT_SRC = $(THISDIR)/../aliyun-iot-device-sdk-c/src/mqtt
CCP_SRC = $(THISDIR)/../aliyun-iot-device-sdk-c/src/ccp
MBEDTLS_SRC = $(THISDIR)/../aliyun-iot-device-sdk-c/public_libs/mbedtls
SSL_PORTING_SRC = $(THISDIR)/../aliyun-iot-device-sdk-c/public_libs/porting/mbedtls

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

CFLAGS  += -I$(THISDIR)/../aliyun-iot-device-sdk-c/platform/freertos/inc
CFLAGS  += -I$(THISDIR)/../aliyun-iot-device-sdk-c/common/inc
CFLAGS  += -I$(THISDIR)/../aliyun-iot-device-sdk-c/include
CFLAGS  += -I$(THISDIR)/../../../components/freertos/include/freertos/
CFLAGS  += -I$(THISDIR)/../aliyun-iot-device-sdk-c/include/mqtt/

ifneq ("$(wildcard $(THISDIR)/include/user_config.local.h)","")
CFLAGS += -DLOCAL_CONFIG_AVAILABLE
endif

include $(IDF_PATH)/make/component_common.mk
#include $(IDF_PATH)/make/component.mk
