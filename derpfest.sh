#!/bin/bash
rm -rf prebuilts/clang/host/linux-x86
rm -rf hardware/motorola
rm -rf device/motorola
rm -rf kernel/motorola
rm -rf vendor/motorola
rm -rf .repo/local_manifests

repo init -u --depth=1 https://github.com/DerpFest-AOSP/android_manifest.git -b 16.2 --git-lfs --no-clone-bundle
git clone https://github.com/ubaidraye/local_manifests .repo/local_manifests
/opt/crave/resync.sh || repo sync

export BUILD_USERNAME=RayeUB
export BUILD_HOSTNAME=crave
export DISABLE_STUB_VALIDATION=true

. build/envsetup.sh
lunch lineage_eqs-bp4a-userdebug
make installclean
mka derp
