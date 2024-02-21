Return-Path: <linux-kbuild+bounces-1031-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC485ECE7
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Feb 2024 00:29:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50A0F1F23A8C
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Feb 2024 23:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20C833062;
	Wed, 21 Feb 2024 23:29:19 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDC1E485
	for <linux-kbuild@vger.kernel.org>; Wed, 21 Feb 2024 23:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708558159; cv=none; b=m3tFY6D2WWueJPd989g/7BMW7OgV4KFfm8f9GfZ3RG9y1Zp4QVG/U925/v7g0rgf02EykpTZZkeP3mtPH2nTKnz+DJLiOOH1wez+ttCMFoe+Eji8wcSepOc/6mtnkfcf/stIR2wxgJ9BFrJTz2RsnC0eHgn7ZEBe9ORLv9VBSBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708558159; c=relaxed/simple;
	bh=YsMrQ06wkPCOCZy/SHznkK4uv7ZNbm1Iwa7Jxdxs38Q=;
	h=Message-Id:From:Date:Subject:To:Cc; b=P96oKZF/HjT4NjQ46Y+lF/MYmrNaBLoThgARQB8ERfBo7v8QAgird8FsqIUgwGL9g4tJHairH79QM8RLSmZ/p1/rUIHOPnAhD9yn9mi3OSAKl993JwWdzFnfjVJUx4s8c+NeH+VMou3eQrdbBa7rNt7PExmtzCmB9jUbpNwDirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 41LNFnJs041117
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 21 Feb 2024 18:15:55 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 41LNFllc041116;
	Wed, 21 Feb 2024 15:15:47 -0800 (PST)
	(envelope-from ehem)
Message-Id: <cover.1708478591.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Tue, 20 Feb 2024 17:23:11 -0800
Subject: [PATCH RFC 0/3] Adding trailing slash to $(srctree)
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

The subject states exactly what I'm suggesting.

The reason is the fallback value for $(srctree) of "." doesn't work
properly in several places under some conditions.  In particular in
several places a pattern of "$(srctree)/$(src)" is used.  If $(srctree)
ends up with the value "." and $(src) ends up with the value `pwd`, the
build breaks.  This can be triggered via in-tree/out-of-tree build
mechanisms.

As such, assuming $(srctree) includes the trailing slash and setting
the fallback for $(srctree) to "" fixes things.  This is untested, I'm
proposing this since I wanted to use a build approach which triggers
this.  This is really a single patch, but it has been split into 3 to
emphasize where the real work is done.

I'm suspicious of the fallback settings of $(srctree) found in several
Makefiles.  This might be a distinct workaround for the same situation.
I was wondering about adjusting some of those comments too.  I think
$(src) needs similar treatment, but that is rather messier.

Note, this is basically untested.  I'm hopeful this actually works, but
if it breaks then this was mostly to alert the maintainers of this
troublesome condition.


Elliott Mitchell (3):
  build: add trailing slash to $(srctree)
  build: modify uses of $(srctree) to assume trailing slash
  build: change $(srctree) to empty for current directory

 Documentation/Makefile                        |  48 +++---
 Documentation/devicetree/bindings/Makefile    |  18 +--
 Documentation/userspace-api/media/Makefile    |  10 +-
 Makefile                                      | 152 +++++++++---------
 arch/alpha/boot/Makefile                      |   2 +-
 arch/alpha/kernel/syscalls/Makefile           |   4 +-
 arch/arc/Makefile                             |   2 +-
 arch/arc/boot/dts/Makefile                    |   2 +-
 arch/arm/Makefile                             |   4 +-
 arch/arm/boot/Makefile                        |   2 +-
 arch/arm/boot/compressed/Makefile             |   2 +-
 arch/arm/mach-dove/Makefile                   |   2 +-
 arch/arm/mach-mv78xx0/Makefile                |   2 +-
 arch/arm/mach-mvebu/Makefile                  |   2 +-
 arch/arm/mach-orion5x/Makefile                |   2 +-
 arch/arm/mach-s3c/Makefile                    |   2 +-
 arch/arm/plat-orion/Makefile                  |   2 +-
 arch/arm/tools/Makefile                       |   6 +-
 arch/arm/vdso/Makefile                        |   2 +-
 arch/arm64/Makefile                           |   2 +-
 arch/arm64/boot/Makefile                      |   2 +-
 arch/arm64/kernel/pi/Makefile                 |   6 +-
 arch/arm64/kernel/vdso/Makefile               |   4 +-
 arch/arm64/kernel/vdso32/Makefile             |   2 +-
 arch/arm64/kvm/Makefile                       |   6 +-
 arch/arm64/kvm/hyp/Makefile                   |   2 +-
 arch/csky/Makefile                            |   2 +-
 arch/csky/boot/dts/Makefile                   |   2 +-
 arch/csky/kernel/vdso/Makefile                |   4 +-
 arch/loongarch/boot/Makefile                  |   2 +-
 arch/loongarch/kvm/Makefile                   |   4 +-
 arch/loongarch/vdso/Makefile                  |   4 +-
 arch/m68k/kernel/syscalls/Makefile            |   4 +-
 arch/microblaze/kernel/syscalls/Makefile      |   4 +-
 arch/mips/Makefile                            |  18 +--
 arch/mips/Makefile.postlink                   |   2 +-
 arch/mips/boot/Makefile                       |   2 +-
 arch/mips/boot/compressed/Makefile            |   4 +-
 arch/mips/kernel/syscalls/Makefile            |   6 +-
 arch/mips/kvm/Makefile                        |   2 +-
 arch/mips/vdso/Makefile                       |   6 +-
 arch/nios2/boot/dts/Makefile                  |   2 +-
 arch/parisc/Makefile                          |   4 +-
 arch/parisc/kernel/syscalls/Makefile          |   4 +-
 arch/parisc/kernel/vdso32/Makefile            |   2 +-
 arch/parisc/kernel/vdso64/Makefile            |   2 +-
 arch/powerpc/Makefile                         |  30 ++--
 arch/powerpc/Makefile.postlink                |  10 +-
 arch/powerpc/boot/Makefile                    |  32 ++--
 arch/powerpc/boot/dts/Makefile                |   2 +-
 arch/powerpc/boot/dts/fsl/Makefile            |   2 +-
 arch/powerpc/kernel/syscalls/Makefile         |   4 +-
 arch/powerpc/kernel/vdso/Makefile             |   6 +-
 arch/powerpc/kvm/Makefile                     |   2 +-
 arch/powerpc/platforms/cell/spufs/Makefile    |   4 +-
 arch/riscv/Makefile                           |  12 +-
 arch/riscv/Makefile.postlink                  |   4 +-
 arch/riscv/boot/Makefile                      |   2 +-
 arch/riscv/kernel/compat_vdso/Makefile        |   2 +-
 arch/riscv/kernel/pi/Makefile                 |   8 +-
 arch/riscv/kernel/vdso/Makefile               |   4 +-
 arch/riscv/kvm/Makefile                       |   4 +-
 arch/riscv/purgatory/Makefile                 |  16 +-
 arch/s390/Makefile                            |   2 +-
 arch/s390/boot/Makefile                       |   2 +-
 arch/s390/kernel/syscalls/Makefile            |   4 +-
 arch/s390/kernel/vdso32/Makefile              |   4 +-
 arch/s390/kernel/vdso64/Makefile              |   4 +-
 arch/s390/kvm/Makefile                        |   2 +-
 arch/s390/purgatory/Makefile                  |   4 +-
 arch/s390/tools/Makefile                      |   2 +-
 arch/sh/Makefile                              |   2 +-
 arch/sh/kernel/syscalls/Makefile              |   4 +-
 arch/sparc/kernel/syscalls/Makefile           |   4 +-
 arch/sparc/vdso/Makefile                      |   4 +-
 arch/um/Makefile                              |  22 +--
 arch/um/drivers/Makefile                      |   2 +-
 arch/um/kernel/Makefile                       |   4 +-
 arch/um/kernel/skas/Makefile                  |   2 +-
 arch/um/os-Linux/Makefile                     |   2 +-
 arch/um/os-Linux/drivers/Makefile             |   2 +-
 arch/um/os-Linux/skas/Makefile                |   2 +-
 arch/um/scripts/Makefile.rules                |   2 +-
 arch/x86/Makefile                             |   6 +-
 arch/x86/Makefile.postlink                    |   2 +-
 arch/x86/Makefile.um                          |   2 +-
 arch/x86/boot/Makefile                        |   6 +-
 arch/x86/boot/compressed/Makefile             |   6 +-
 arch/x86/entry/syscalls/Makefile              |   8 +-
 arch/x86/entry/vdso/Makefile                  |   6 +-
 arch/x86/kernel/Makefile                      |   2 +-
 arch/x86/kernel/cpu/Makefile                  |   2 +-
 arch/x86/kvm/Makefile                         |   4 +-
 arch/x86/lib/Makefile                         |   4 +-
 arch/x86/mm/Makefile                          |   2 +-
 arch/x86/purgatory/Makefile                   |   4 +-
 arch/x86/realmode/rm/Makefile                 |   2 +-
 arch/x86/tools/Makefile                       |  14 +-
 arch/x86/um/Makefile                          |   2 +-
 arch/x86/um/os-Linux/Makefile                 |   2 +-
 arch/x86/um/vdso/Makefile                     |   2 +-
 arch/xtensa/Makefile                          |   2 +-
 arch/xtensa/boot/boot-redboot/Makefile        |   2 +-
 arch/xtensa/boot/dts/Makefile                 |   2 +-
 arch/xtensa/boot/lib/Makefile                 |   4 +-
 arch/xtensa/kernel/syscalls/Makefile          |   4 +-
 certs/Makefile                                |   4 +-
 drivers/Makefile                              |   2 +-
 drivers/accessibility/speakup/Makefile        |   2 +-
 drivers/base/firmware_loader/builtin/Makefile |   2 +-
 drivers/block/rnbd/Makefile                   |   2 +-
 drivers/crypto/chelsio/Makefile               |   2 +-
 drivers/crypto/intel/iaa/Makefile             |   2 +-
 drivers/crypto/intel/qat/qat_420xx/Makefile   |   2 +-
 drivers/crypto/intel/qat/qat_4xxx/Makefile    |   2 +-
 drivers/crypto/intel/qat/qat_c3xxx/Makefile   |   2 +-
 drivers/crypto/intel/qat/qat_c3xxxvf/Makefile |   2 +-
 drivers/crypto/intel/qat/qat_c62x/Makefile    |   2 +-
 drivers/crypto/intel/qat/qat_c62xvf/Makefile  |   2 +-
 .../crypto/intel/qat/qat_dh895xcc/Makefile    |   2 +-
 .../crypto/intel/qat/qat_dh895xccvf/Makefile  |   2 +-
 drivers/crypto/marvell/octeontx2/Makefile     |   2 +-
 drivers/cxl/core/Makefile                     |   2 +-
 drivers/firmware/efi/libstub/Makefile         |   6 +-
 drivers/firmware/efi/libstub/Makefile.zboot   |   4 +-
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/arm/display/komeda/Makefile   |   4 +-
 drivers/gpu/drm/i915/Makefile                 |   8 +-
 drivers/gpu/drm/imagination/Makefile          |   2 +-
 drivers/gpu/drm/msm/Makefile                  |   8 +-
 drivers/gpu/drm/xe/Makefile                   |  18 +--
 drivers/hid/amd-sfh-hid/Makefile              |   2 +-
 drivers/hid/bpf/Makefile                      |   2 +-
 drivers/hid/intel-ish-hid/Makefile            |   2 +-
 drivers/iio/humidity/Makefile                 |   2 +-
 drivers/infiniband/hw/bnxt_re/Makefile        |   2 +-
 drivers/infiniband/hw/cxgb4/Makefile          |   4 +-
 drivers/infiniband/hw/hns/Makefile            |   2 +-
 drivers/infiniband/hw/ocrdma/Makefile         |   2 +-
 drivers/infiniband/hw/usnic/Makefile          |   2 +-
 drivers/media/common/b2c2/Makefile            |   4 +-
 drivers/media/dvb-frontends/Makefile          |   4 +-
 drivers/media/dvb-frontends/drx39xyj/Makefile |   2 +-
 drivers/media/i2c/ccs/Makefile                |   2 +-
 drivers/media/mmc/siano/Makefile              |   2 +-
 drivers/media/pci/b2c2/Makefile               |   2 +-
 drivers/media/pci/bt8xx/Makefile              |   4 +-
 drivers/media/pci/cx18/Makefile               |   4 +-
 drivers/media/pci/cx23885/Makefile            |   4 +-
 drivers/media/pci/cx88/Makefile               |   4 +-
 drivers/media/pci/ddbridge/Makefile           |   4 +-
 drivers/media/pci/dm1105/Makefile             |   2 +-
 drivers/media/pci/ivtv/Makefile               |   4 +-
 drivers/media/pci/mantis/Makefile             |   2 +-
 drivers/media/pci/netup_unidvb/Makefile       |   2 +-
 drivers/media/pci/ngene/Makefile              |   4 +-
 drivers/media/pci/pluto2/Makefile             |   2 +-
 drivers/media/pci/pt1/Makefile                |   4 +-
 drivers/media/pci/pt3/Makefile                |   4 +-
 drivers/media/pci/saa7134/Makefile            |   6 +-
 drivers/media/pci/saa7146/Makefile            |   2 +-
 drivers/media/pci/saa7164/Makefile            |   4 +-
 drivers/media/pci/smipcie/Makefile            |   4 +-
 drivers/media/pci/ttpci/Makefile              |   6 +-
 drivers/media/platform/mediatek/mdp/Makefile  |   2 +-
 .../media/platform/st/sti/c8sectpfe/Makefile  |   4 +-
 drivers/media/spi/Makefile                    |   2 +-
 drivers/media/tuners/Makefile                 |   2 +-
 drivers/media/usb/as102/Makefile              |   2 +-
 drivers/media/usb/au0828/Makefile             |   4 +-
 drivers/media/usb/b2c2/Makefile               |   2 +-
 drivers/media/usb/cx231xx/Makefile            |   4 +-
 drivers/media/usb/dvb-usb-v2/Makefile         |   6 +-
 drivers/media/usb/dvb-usb/Makefile            |   6 +-
 drivers/media/usb/em28xx/Makefile             |   4 +-
 drivers/media/usb/go7007/Makefile             |   2 +-
 drivers/media/usb/gspca/gl860/Makefile        |   2 +-
 drivers/media/usb/gspca/m5602/Makefile        |   2 +-
 drivers/media/usb/gspca/stv06xx/Makefile      |   2 +-
 drivers/media/usb/pvrusb2/Makefile            |   4 +-
 drivers/media/usb/siano/Makefile              |   2 +-
 drivers/media/usb/ttusb-budget/Makefile       |   2 +-
 drivers/media/v4l2-core/Makefile              |   4 +-
 .../net/ethernet/aquantia/atlantic/Makefile   |   2 +-
 .../chelsio/inline_crypto/ch_ipsec/Makefile   |   4 +-
 .../chelsio/inline_crypto/ch_ktls/Makefile    |   2 +-
 .../chelsio/inline_crypto/chtls/Makefile      |   4 +-
 drivers/net/ethernet/chelsio/libcxgb/Makefile |   2 +-
 drivers/net/ethernet/freescale/dpaa/Makefile  |   2 +-
 drivers/net/ethernet/freescale/fman/Makefile  |   2 +-
 drivers/net/ethernet/fungible/funeth/Makefile |   2 +-
 drivers/net/ethernet/hisilicon/hns3/Makefile  |   8 +-
 .../ethernet/marvell/octeontx2/nic/Makefile   |   2 +-
 .../net/ethernet/microchip/lan966x/Makefile   |   2 +-
 .../net/ethernet/microchip/sparx5/Makefile    |   2 +-
 drivers/net/wan/Makefile                      |   2 +-
 .../broadcom/brcm80211/brcmfmac/Makefile      |   4 +-
 .../broadcom/brcm80211/brcmfmac/bca/Makefile  |   6 +-
 .../broadcom/brcm80211/brcmfmac/cyw/Makefile  |   6 +-
 .../broadcom/brcm80211/brcmfmac/wcc/Makefile  |   6 +-
 .../broadcom/brcm80211/brcmsmac/Makefile      |   6 +-
 .../broadcom/brcm80211/brcmutil/Makefile      |   2 +-
 .../net/wireless/intel/iwlwifi/dvm/Makefile   |   2 +-
 .../net/wireless/intel/iwlwifi/mei/Makefile   |   2 +-
 .../net/wireless/intel/iwlwifi/mvm/Makefile   |   2 +-
 .../wireless/realtek/rtl818x/rtl8180/Makefile |   2 +-
 .../wireless/realtek/rtl818x/rtl8187/Makefile |   2 +-
 drivers/pinctrl/renesas/Makefile              |  24 +--
 drivers/scsi/aic7xxx/Makefile                 |  12 +-
 drivers/scsi/csiostor/Makefile                |   2 +-
 drivers/scsi/cxgbi/Makefile                   |   2 +-
 drivers/scsi/libsas/Makefile                  |   2 +-
 drivers/scsi/pcmcia/Makefile                  |   2 +-
 drivers/staging/media/atomisp/Makefile        |   2 +-
 drivers/staging/media/av7110/Makefile         |   8 +-
 drivers/staging/rtl8723bs/Makefile            |   2 +-
 drivers/target/iscsi/cxgbit/Makefile          |   6 +-
 drivers/tty/serial/8250/Makefile              |   2 +-
 drivers/usb/gadget/function/Makefile          |   4 +-
 drivers/usb/gadget/legacy/Makefile            |   6 +-
 drivers/usb/storage/Makefile                  |   2 +-
 drivers/vdpa/mlx5/Makefile                    |   2 +-
 fs/hostfs/Makefile                            |   2 +-
 fs/iomap/Makefile                             |   2 +-
 fs/unicode/Makefile                           |  14 +-
 fs/xfs/Makefile                               |   4 +-
 init/Makefile                                 |   2 +-
 kernel/Makefile                               |   2 +-
 kernel/bpf/Makefile                           |   2 +-
 kernel/bpf/preload/Makefile                   |   2 +-
 kernel/gcov/Makefile                          |   2 +-
 lib/Makefile                                  |  16 +-
 lib/raid6/Makefile                            |   2 +-
 net/wireless/Makefile                         |   2 +-
 rust/Makefile                                 |  14 +-
 samples/bpf/Makefile                          |  24 +--
 samples/coresight/Makefile                    |   2 +-
 samples/hid/Makefile                          |  16 +-
 scripts/Makefile                              |   6 +-
 scripts/Makefile.asm-generic                  |   8 +-
 scripts/Makefile.build                        |  22 +--
 scripts/Makefile.clean                        |   2 +-
 scripts/Makefile.defconf                      |  16 +-
 scripts/Makefile.dtbinst                      |   2 +-
 scripts/Makefile.headersinst                  |  10 +-
 scripts/Makefile.lib                          |  22 +--
 scripts/Makefile.modfinal                     |   4 +-
 scripts/Makefile.modinst                      |   6 +-
 scripts/Makefile.modpost                      |   4 +-
 scripts/Makefile.package                      |  22 +--
 scripts/Makefile.vdsoinst                     |   2 +-
 scripts/Makefile.vmlinux                      |   6 +-
 scripts/Makefile.vmlinux_o                    |   8 +-
 scripts/basic/Makefile                        |   2 +-
 scripts/dtc/Makefile                          |   6 +-
 scripts/gcc-plugins/Makefile                  |   2 +-
 scripts/gdb/linux/Makefile                    |   2 +-
 scripts/genksyms/Makefile                     |   4 +-
 scripts/kconfig/Makefile                      |  22 +--
 scripts/selinux/genheaders/Makefile           |   4 +-
 scripts/selinux/mdp/Makefile                  |   4 +-
 security/apparmor/Makefile                    |   8 +-
 security/selinux/Makefile                     |   2 +-
 security/tomoyo/Makefile                      |   2 +-
 tools/bootconfig/Makefile                     |   6 +-
 tools/bpf/Makefile                            |  16 +-
 tools/bpf/bpftool/Makefile                    |  24 +--
 tools/bpf/resolve_btfids/Makefile             |  12 +-
 tools/build/Makefile                          |   8 +-
 tools/build/Makefile.build                    |   2 +-
 tools/build/Makefile.feature                  |   2 +-
 tools/build/Makefile.include                  |   6 +-
 tools/build/tests/ex/Makefile                 |   4 +-
 tools/counter/Makefile                        |   8 +-
 tools/gpio/Makefile                           |   6 +-
 tools/hv/Makefile                             |   6 +-
 tools/iio/Makefile                            |   6 +-
 tools/include/nolibc/Makefile                 |   4 +-
 tools/lib/api/Makefile                        |  14 +-
 tools/lib/bpf/Makefile                        |  22 +--
 tools/lib/perf/Makefile                       |  26 +--
 tools/lib/subcmd/Makefile                     |  10 +-
 tools/lib/symbol/Makefile                     |  14 +-
 tools/lib/thermal/Makefile                    |  26 +--
 tools/objtool/Makefile                        |  18 +--
 tools/pci/Makefile                            |   6 +-
 tools/perf/Makefile.config                    |  22 +--
 tools/perf/Makefile.perf                      | 136 ++++++++--------
 tools/perf/arch/arm64/Makefile                |   6 +-
 tools/perf/arch/loongarch/Makefile            |   6 +-
 tools/perf/arch/mips/Makefile                 |   2 +-
 tools/perf/arch/powerpc/Makefile              |   2 +-
 tools/perf/arch/s390/Makefile                 |   2 +-
 tools/perf/arch/x86/Makefile                  |   2 +-
 tools/power/acpi/Makefile.config              |  10 +-
 tools/power/acpi/Makefile.rules               |   2 +-
 tools/power/acpi/tools/acpidump/Makefile      |   2 +-
 tools/power/acpi/tools/pfrut/Makefile         |   2 +-
 tools/power/x86/intel-speed-select/Makefile   |  10 +-
 tools/spi/Makefile                            |   6 +-
 tools/testing/selftests/nolibc/Makefile       |  14 +-
 tools/thermal/lib/Makefile                    |  24 +--
 tools/thermal/thermal-engine/Makefile         |  14 +-
 tools/thermal/thermometer/Makefile            |  10 +-
 tools/usb/Makefile                            |   8 +-
 usr/Makefile                                  |   2 +-
 usr/include/Makefile                          |   4 +-
 307 files changed, 960 insertions(+), 960 deletions(-)

-- 
2.39.2


