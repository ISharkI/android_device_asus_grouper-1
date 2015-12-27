#
# Copyright (C) 2010 The Android Open Source Project
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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := tvdpi


include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/asus/grouper/rootdir/ueventd.grouper.rc:root/ueventd.grouper.rc \
    device/asus/grouper/rootdir/init.grouper.usb.rc:root/init.grouper.usb.rc \
    device/asus/grouper/gps/gps.conf:system/etc/gps.conf \
    device/asus/grouper/gps/gps_daemon.sh:system/bin/gps_daemon.sh

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml

PRODUCT_COPY_FILES += \
    device/asus/grouper/touchscreen/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/asus/grouper/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_PACKAGES += \
    lights.grouper \
    audio.primary.grouper \
    power.grouper \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

PRODUCT_PACKAGES += \
    keystore.grouper

# NFC packages
PRODUCT_PACKAGES += \
    nfc.grouper \
    Nfc \
    Tag

# Filesystem management tools
PRODUCT_PACKAGES += \
    setup_fs

PRODUCT_CHARACTERISTICS := tablet,nosdcard

# media config xml file
PRODUCT_COPY_FILES += \
    device/asus/grouper/media/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    device/asus/grouper/media/media_codecs.xml:system/etc/media_codecs.xml

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/asus/grouper/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/asus/grouper/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)

# inherit from the non-open-source side
$(call inherit-product, vendor/asus/grouper/asus-vendor.mk)
$(call inherit-product, vendor/broadcom/grouper/broadcom-vendor.mk)
$(call inherit-product, vendor/elan/grouper/elan-vendor.mk)
$(call inherit-product, vendor/invensense/grouper/invensense-vendor.mk)
$(call inherit-product, vendor/nvidia/grouper/nvidia-vendor.mk)
$(call inherit-product, vendor/nxp/grouper/nxp-vendor.mk)
$(call inherit-product, vendor/widevine/grouper/widevine-vendor.mk)
