#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf kernel/motorola/sm8475 kernel/motorola/sm8475-devicetrees kernel/motorola/sm8475-modules
rm -rf hardware/motorola device/motorola/eqs device/motorola/sm8475-common vendor/motorola/eqs vendor/motorola/sm8475-common
rm -rf .repo/local_manifests

git clone https://github.com/ubaidraye/local_manifests .repo/local_manifests
repo init -u https://github.com/DerpFest-AOSP/android_manifest.git -b 16.2 --git-lfs --no-clone-bundle
/opt/crave/resync.sh || repo sync

export BUILD_USERNAME=RayeUB
export BUILD_HOSTNAME=crave
export DISABLE_STUB_VALIDATION=true

. build/envsetup.sh
lunch lineage_eqs-bp4a-userdebug
make installclean
mka derp
