Return-Path: <linux-kbuild+bounces-1123-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC086F88F
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B33C62810D1
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B65F15B7;
	Mon,  4 Mar 2024 02:29:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A4D138A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709519373; cv=none; b=Z4YxjVx+fPbTith+QemprD+TXw4QjZtJ6YDmodD16Lhz4AE4iSTlIKBgJt62B7A3/jaakBGmRCzYGOguu1A9bErOIFaoiBm2LJQAe1Nokmex/64UhEvoYOjZ4rrdsoVURD8iv+pc6LtCcKYrtwySgxjQjsUWXjJNQpwqgaO2anI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709519373; c=relaxed/simple;
	bh=hIZQtsByRi5I6Yd9Ux+7NvNw7gdNnN78Y2wPDbaHYf4=;
	h=Message-Id:From:Date:Subject:To:Cc; b=YbZL4NBT/Ufuw/feJwfB8QFJuCiZ5ZPOsPTxNYfNo2lA1uRSmG8v4HQufIq9tLl20PV2CRkRWzWtccQhlqw73r4xHCo94DJai52wJwZYAtc/rfBCrP8MaOQgnqQPDCHmLpnNCMyBnEL+2bK5COhHE3Uwfg1NQk13zq+w7gbRivo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 42424Ace021755
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:04:15 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 424247KR021754;
	Sun, 3 Mar 2024 18:04:07 -0800 (PST)
	(envelope-from ehem)
Message-Id: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 00/30] Adding trailing slash to $(*tree)
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Having done more experimentation with this, I've now got a better idea as
to why some things are the way they are.  At this point I'm able to
successfully build kernels with this modification, but I doubt I'm even
close to full coverage.  Yet the general approach does appear to work.

There are several places I'm rather unsure of.  I've never used many of
the scripts and tools.  As such I've got no idea whether they need
further adaptation.  There is a good chance I may have broken some of
them.

I've ended up with the suspicion 16671c1e1cac2 was wrong.  It may have
made some sense in 2015, but I'm now skeptical of it being a good
approach.  In particular setting $(srctree) at the top of Makefiles in
tools/ looks like a workaround for 16671c1e1cac2.  Perhaps this is part
of a superior solution to the referenced problem?

Much of scripts/ seems meant to be invoked by Makefiles.  Yet some
portions may also be intended for use at regular shell command-lines.
Being unsure which category these fall into means further adjustment is
likely needed.


Again, right now I'm pretty sure my test coverage is quite incomplete.
Things Work For Me(tm), but we know how that goes.  I've done some work
on avoiding broken intermediate states, yet my ego is smaller than
Jupiter so I'm less than optimistic I've gotten everything.


Elliott Mitchell (30):
  build: replace uses of $(abspath ) with existing variables
  scripts/coccicheck: modify to handle ${srctree} with trailing slash
  build: handle optional trailing slash in $(srctree)
  build: add trailing slash to $(*tree)
  build: modify uses of $(srctree) to assume trailing slash
  build: modify uses of $(srctree) to assume trailing slash
  build: modify uses of $(srctree) to assume trailing slash
  build: modify uses of $(srctree) to assume trailing slash
  build: modify uses of $(objtree) to assume trailing slash
  scripts: modify uses of $(srctree) to assume trailing slash
  scripts: modify uses of $(srctree) to assume trailing slash
  scripts: modify uses of $(srctree) to assume trailing slash
  scripts: modify uses of $(objtree) to assume trailing slash
  build/scripts: link-vmlinux.sh: modify use of ${objtree} for trailing
    slash
  build/scripts: install.sh: modify use of ${srctree} for trailing slash
  scripts/dtc: dtx_diff: include trailing slash in ${srctree} variable
  build/scripts: generate_initcall_order.pl: modify use of ${srctree}
    for trailing slash
  build/scripts: streamline_config.pl: modify use of ${srctree} for
    trailing slash
  scripts/package: mkdebian: modify use of ${srctree} to assume trailing
    slash
  scripts/package: buildtar: modify use of ${srctree} to assume trailing
    slash
  scripts/package: mkspec: modify use of ${srctree} to assume trailing
    slash
  scripts/nsdeps: modify use of ${srctree} to assume trailing slash
  build/scripts: makelst: modify suggested use of ${srctree} for
    trailing slash
  scripts/generate_rust_analyzer.py: modify use of ${srctree} for
    trailing slash
  scripts/coccicheck: modify to handle ${srctree} with trailing slash
  build: change $(*tree) to empty for current directory
  tools/build: add trailing slash to $(*tree)
  tools/build: modify uses of $(srctree) to assume trailing slash
  tools/build: modify uses of $(srctree) to assume trailing slash
  tools/build: modify uses of $(objtree) to assume trailing slash

 Documentation/Makefile                        |  52 ++---
 Documentation/devicetree/bindings/Makefile    |  18 +-
 Documentation/userspace-api/media/Makefile    |  10 +-
 Makefile                                      | 180 +++++++++---------
 arch/alpha/boot/Makefile                      |   4 +-
 arch/alpha/kernel/syscalls/Makefile           |   4 +-
 arch/arc/Makefile                             |   2 +-
 arch/arc/boot/dts/Makefile                    |   2 +-
 arch/arm/Kbuild                               |   2 +-
 arch/arm/Makefile                             |   4 +-
 arch/arm/boot/Makefile                        |   2 +-
 arch/arm/boot/compressed/Makefile             |   4 +-
 arch/arm/mach-dove/Makefile                   |   2 +-
 arch/arm/mach-mv78xx0/Makefile                |   2 +-
 arch/arm/mach-mvebu/Makefile                  |   2 +-
 arch/arm/mach-orion5x/Makefile                |   2 +-
 arch/arm/mach-s3c/Makefile                    |   2 +-
 arch/arm/plat-orion/Makefile                  |   2 +-
 arch/arm/tools/Makefile                       |   6 +-
 arch/arm/vdso/Makefile                        |   4 +-
 arch/arm64/Makefile                           |   4 +-
 arch/arm64/boot/Makefile                      |   2 +-
 arch/arm64/kernel/Makefile                    |   2 +-
 arch/arm64/kernel/pi/Makefile                 |   6 +-
 arch/arm64/kernel/vdso/Makefile               |   4 +-
 arch/arm64/kernel/vdso32/Makefile             |   2 +-
 arch/arm64/kvm/Makefile                       |   6 +-
 arch/arm64/kvm/hyp/Makefile                   |   2 +-
 arch/arm64/kvm/hyp/nvhe/Makefile              |   2 +-
 arch/csky/Makefile                            |   2 +-
 arch/csky/boot/dts/Makefile                   |   2 +-
 arch/csky/kernel/vdso/Makefile                |   4 +-
 arch/loongarch/Makefile                       |   2 +-
 arch/loongarch/boot/Makefile                  |   2 +-
 arch/loongarch/kvm/Makefile                   |   4 +-
 arch/loongarch/vdso/Makefile                  |   4 +-
 arch/m68k/kernel/syscalls/Makefile            |   4 +-
 arch/microblaze/kernel/syscalls/Makefile      |   4 +-
 arch/mips/Kbuild                              |   2 +-
 arch/mips/Kbuild.platforms                    |   2 +-
 arch/mips/Makefile                            |  26 +--
 arch/mips/Makefile.postlink                   |   2 +-
 arch/mips/boot/Makefile                       |   6 +-
 arch/mips/boot/compressed/Makefile            |  22 +--
 arch/mips/kernel/syscalls/Makefile            |   6 +-
 arch/mips/kvm/Makefile                        |   2 +-
 arch/mips/vdso/Makefile                       |   6 +-
 arch/nios2/boot/dts/Makefile                  |   2 +-
 arch/parisc/Makefile                          |   6 +-
 arch/parisc/boot/Makefile                     |   2 +-
 arch/parisc/boot/compressed/Makefile          |   6 +-
 arch/parisc/kernel/syscalls/Makefile          |   4 +-
 arch/parisc/kernel/vdso32/Makefile            |   2 +-
 arch/parisc/kernel/vdso64/Makefile            |   2 +-
 arch/powerpc/Kconfig                          |   8 +-
 arch/powerpc/Makefile                         |  30 +--
 arch/powerpc/Makefile.postlink                |  10 +-
 arch/powerpc/boot/Makefile                    |  32 ++--
 arch/powerpc/boot/dts/Makefile                |   2 +-
 arch/powerpc/boot/dts/fsl/Makefile            |   2 +-
 arch/powerpc/kernel/syscalls/Makefile         |   4 +-
 arch/powerpc/kernel/vdso/Makefile             |   6 +-
 arch/powerpc/kvm/Makefile                     |   4 +-
 arch/powerpc/platforms/cell/spufs/Makefile    |   4 +-
 arch/riscv/Makefile                           |  14 +-
 arch/riscv/Makefile.postlink                  |   4 +-
 arch/riscv/boot/Makefile                      |   2 +-
 arch/riscv/kernel/compat_vdso/Makefile        |   2 +-
 arch/riscv/kernel/pi/Makefile                 |   8 +-
 arch/riscv/kernel/vdso/Makefile               |   4 +-
 arch/riscv/kvm/Makefile                       |   4 +-
 arch/riscv/purgatory/Makefile                 |  16 +-
 arch/s390/Kconfig                             |   2 +-
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
 arch/um/Makefile                              |  28 +--
 arch/um/drivers/Makefile                      |   2 +-
 arch/um/kernel/Makefile                       |   6 +-
 arch/um/kernel/skas/Makefile                  |   2 +-
 arch/um/os-Linux/Makefile                     |   2 +-
 arch/um/os-Linux/drivers/Makefile             |   2 +-
 arch/um/os-Linux/skas/Makefile                |   2 +-
 arch/um/scripts/Makefile.rules                |   2 +-
 arch/x86/Kconfig                              |   4 +-
 arch/x86/Makefile                             |  14 +-
 arch/x86/Makefile.postlink                    |   2 +-
 arch/x86/Makefile.um                          |   2 +-
 arch/x86/boot/Makefile                        |   8 +-
 arch/x86/boot/compressed/Makefile             |  12 +-
 arch/x86/entry/syscalls/Makefile              |   8 +-
 arch/x86/entry/vdso/Makefile                  |   6 +-
 arch/x86/kernel/Makefile                      |   2 +-
 arch/x86/kernel/cpu/Makefile                  |   2 +-
 arch/x86/kvm/Makefile                         |   4 +-
 arch/x86/lib/Makefile                         |   4 +-
 arch/x86/mm/Makefile                          |   2 +-
 arch/x86/purgatory/Makefile                   |   4 +-
 arch/x86/realmode/rm/Makefile                 |   4 +-
 arch/x86/tools/Makefile                       |  16 +-
 arch/x86/um/Makefile                          |   2 +-
 arch/x86/um/os-Linux/Makefile                 |   2 +-
 arch/x86/um/vdso/Makefile                     |   2 +-
 arch/xtensa/Makefile                          |   2 +-
 arch/xtensa/boot/boot-redboot/Makefile        |   2 +-
 arch/xtensa/boot/dts/Makefile                 |   2 +-
 arch/xtensa/boot/lib/Makefile                 |   4 +-
 arch/xtensa/kernel/syscalls/Makefile          |   4 +-
 certs/Makefile                                |   4 +-
 drivers/Makefile                              |   4 +-
 drivers/accessibility/speakup/Makefile        |   4 +-
 drivers/base/firmware_loader/builtin/Makefile |   4 +-
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
 drivers/firmware/efi/libstub/Makefile.zboot   |   6 +-
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +-
 drivers/gpu/drm/arm/display/komeda/Makefile   |   4 +-
 drivers/gpu/drm/i915/Makefile                 |   8 +-
 drivers/gpu/drm/imagination/Makefile          |   2 +-
 drivers/gpu/drm/msm/Makefile                  |   8 +-
 drivers/gpu/drm/nouveau/Kbuild                |   2 +-
 drivers/gpu/drm/xe/Makefile                   |  18 +-
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
 drivers/scsi/aic7xxx/Makefile                 |  16 +-
 drivers/scsi/csiostor/Makefile                |   2 +-
 drivers/scsi/cxgbi/Makefile                   |   2 +-
 drivers/scsi/cxgbi/cxgb3i/Kbuild              |   4 +-
 drivers/scsi/cxgbi/cxgb4i/Kbuild              |   4 +-
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
 include/uapi/Kbuild                           |   8 +-
 init/Kconfig                                  |  14 +-
 init/Makefile                                 |   2 +-
 kernel/Makefile                               |   2 +-
 kernel/bpf/Makefile                           |   2 +-
 kernel/bpf/preload/Makefile                   |   2 +-
 kernel/gcov/Makefile                          |   2 +-
 lib/Makefile                                  |  16 +-
 lib/raid6/Makefile                            |   2 +-
 net/wireless/Makefile                         |   2 +-
 rust/Makefile                                 | 108 +++++------
 samples/bpf/Makefile                          |  26 +--
 samples/bpf/Makefile.target                   |   4 +-
 samples/coresight/Makefile                    |   2 +-
 samples/hid/Makefile                          |  18 +-
 samples/hid/Makefile.target                   |   4 +-
 scripts/Kbuild.include                        |   8 +-
 scripts/Kconfig.include                       |   6 +-
 scripts/Makefile                              |   6 +-
 scripts/Makefile.asm-generic                  |   8 +-
 scripts/Makefile.build                        |  30 +--
 scripts/Makefile.clean                        |   2 +-
 scripts/Makefile.defconf                      |  16 +-
 scripts/Makefile.dtbinst                      |   2 +-
 scripts/Makefile.gcc-plugins                  |   2 +-
 scripts/Makefile.headersinst                  |  12 +-
 scripts/Makefile.host                         |   6 +-
 scripts/Makefile.kcov                         |   2 +-
 scripts/Makefile.lib                          |  34 ++--
 scripts/Makefile.modfinal                     |   4 +-
 scripts/Makefile.modinst                      |   6 +-
 scripts/Makefile.modpost                      |   4 +-
 scripts/Makefile.package                      |  34 ++--
 scripts/Makefile.randstruct                   |   4 +-
 scripts/Makefile.vdsoinst                     |   2 +-
 scripts/Makefile.vmlinux                      |   6 +-
 scripts/Makefile.vmlinux_o                    |   8 +-
 scripts/basic/Makefile                        |   4 +-
 scripts/coccicheck                            |   6 +-
 scripts/dtc/Makefile                          |   6 +-
 scripts/dtc/dtx_diff                          |  14 +-
 scripts/gcc-plugins/Makefile                  |   4 +-
 scripts/gdb/linux/Makefile                    |   4 +-
 scripts/generate_initcall_order.pl            |   4 +-
 scripts/generate_rust_analyzer.py             |   2 +-
 scripts/genksyms/Makefile                     |   4 +-
 scripts/install.sh                            |   4 +-
 scripts/kconfig/Makefile                      |  22 +--
 scripts/kconfig/streamline_config.pl          |   4 +-
 scripts/link-vmlinux.sh                       |  12 +-
 scripts/makelst                               |   2 +-
 scripts/nsdeps                                |   2 +-
 scripts/package/builddeb                      |  12 +-
 scripts/package/buildtar                      |  60 +++---
 scripts/package/debian/rules                  |   2 +-
 scripts/package/kernel.spec                   |   2 +-
 scripts/package/mkdebian                      |   8 +-
 scripts/package/mkspec                        |   4 +-
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
 tools/include/nolibc/Makefile                 |   8 +-
 tools/lib/api/Makefile                        |  16 +-
 tools/lib/bpf/Makefile                        |  24 +--
 tools/lib/perf/Makefile                       |  28 +--
 tools/lib/subcmd/Makefile                     |  12 +-
 tools/lib/symbol/Makefile                     |  16 +-
 tools/lib/thermal/Makefile                    |  28 +--
 tools/objtool/Makefile                        |  18 +-
 tools/pci/Makefile                            |   6 +-
 tools/perf/Makefile.config                    |  22 +--
 tools/perf/Makefile.perf                      | 140 +++++++-------
 tools/perf/arch/arm64/Makefile                |   6 +-
 tools/perf/arch/loongarch/Makefile            |   6 +-
 tools/perf/arch/mips/Makefile                 |   2 +-
 tools/perf/arch/powerpc/Makefile              |   2 +-
 tools/perf/arch/s390/Makefile                 |   2 +-
 tools/perf/arch/x86/Makefile                  |   2 +-
 tools/power/acpi/Makefile.config              |  12 +-
 tools/power/acpi/Makefile.rules               |   2 +-
 tools/power/acpi/tools/acpidump/Makefile      |   2 +-
 tools/power/acpi/tools/pfrut/Makefile         |   2 +-
 tools/power/x86/intel-speed-select/Makefile   |  10 +-
 tools/spi/Makefile                            |   6 +-
 tools/testing/cxl/Kbuild                      |   4 +-
 tools/testing/cxl/test/Kbuild                 |   2 +-
 tools/testing/nvdimm/Kbuild                   |   4 +-
 tools/testing/nvdimm/test/Kbuild              |   4 +-
 tools/testing/selftests/nolibc/Makefile       |  26 +--
 tools/thermal/lib/Makefile                    |  26 +--
 tools/thermal/thermal-engine/Makefile         |  16 +-
 tools/thermal/thermometer/Makefile            |  12 +-
 tools/usb/Makefile                            |   8 +-
 usr/Makefile                                  |   2 +-
 usr/include/Makefile                          |   4 +-
 350 files changed, 1232 insertions(+), 1236 deletions(-)

-- 
2.39.2


