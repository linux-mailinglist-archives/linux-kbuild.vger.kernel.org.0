Return-Path: <linux-kbuild+bounces-1116-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B2F86F87D
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 03:19:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 471C5281073
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 02:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4521138A;
	Mon,  4 Mar 2024 02:19:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB44C64
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.104.188.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709518752; cv=none; b=DvDzmaHITjnkIzhWbO9vkgiK+fQT5H3FHxZx+ZzOftAX2faR/JKKbTkoMU6Zvsye7nBW7jTRi2vp8NaEPSkmhnN9NQtgrTSP5OcpKhfTuWXsj1r5fYa/Gr5slsVFuouHlSJDSYfnL0L3NlUyB5N8n+TRykbls3G01qb+dOyqX+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709518752; c=relaxed/simple;
	bh=jiHzxpgerJp+ePhedE9MjxmyMRFwqD31c/XyKyB/cHA=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=fDjPGBkFUg2cm9g7h6O0Qu1U7yW4c9COghIRt5MxHJLrB5RLDTYAgQ41Hs2lItuA6c9EMbSWHO7tmB2XLpTKJWQVLchGidIHBQ6s8ADsNHd2tfeVw829t/U7ObU/LcUzEWmF7A+ARTN+YnM0JXWzLT2M9gVhpK/nPu+zP2YUGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com; spf=pass smtp.mailfrom=m5p.com; arc=none smtp.client-ip=74.104.188.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m5p.com
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 4242CNMR021833
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Sun, 3 Mar 2024 21:12:28 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.17.1/8.15.2/Submit) id 4242CMfn021832;
	Sun, 3 Mar 2024 18:12:22 -0800 (PST)
	(envelope-from ehem)
Message-Id: <d0f8727c7ecb2a828e2735dbe90423154f56b398.1709508290.git.ehem+linux@m5p.com>
In-Reply-To: <cover.1709508290.git.ehem+linux@m5p.com>
References: <cover.1709508290.git.ehem+linux@m5p.com>
From: Elliott Mitchell <ehem+linux@m5p.com>
Date: Sun, 3 Mar 2024 15:24:50 -0800
Subject: [WIP PATCH 05/30] build: modify uses of $(srctree) to assume trailing
 slash
To: masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu
Cc: linux-kbuild@vger.kernel.org
X-Spam-Level: *
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>

Date: Tue, 20 Feb 2024 09:13:37 -0800

This isn't much more than `find | sed` to adjust all uses of $(srctree).
This is split into a separate commit to highlight the actual changes to
the build machinery.

Signed-off-by: Elliott Mitchell <ehem+linux@m5p.com>
---
`grep` was also used to locate things which needed other actions
(notably the non-toplevel Makefile adjustments), but this is roughly:

find . -name Makefile\* -print0 | xargs -0 sed -i -e's,$(srctree)$,$(srctree:%/=%),' -e's,$(srctree)\([^,/]\),$(srctree:%/=%)\1,g' -es',$(srctree)/,$(srctree),g'

There could be goofs in here or missed bits.  I hope not, but...
---
 Documentation/Makefile                        |  44 +++---
 Documentation/devicetree/bindings/Makefile    |  18 +--
 Documentation/userspace-api/media/Makefile    |  10 +-
 Makefile                                      | 144 +++++++++---------
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
 arch/mips/Makefile                            |  20 +--
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
 samples/bpf/Makefile                          |  22 +--
 samples/coresight/Makefile                    |   2 +-
 samples/hid/Makefile                          |  14 +-
 security/apparmor/Makefile                    |   8 +-
 security/selinux/Makefile                     |   2 +-
 security/tomoyo/Makefile                      |   2 +-
 usr/Makefile                                  |   2 +-
 usr/include/Makefile                          |   4 +-
 243 files changed, 600 insertions(+), 600 deletions(-)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index d279c8b71280..55d847b0c36a 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -7,12 +7,12 @@ subdir- := devicetree/bindings
 
 # Check for broken documentation file references
 ifeq ($(CONFIG_WARN_MISSING_DOCUMENTS),y)
-$(shell $(srctree)/scripts/documentation-file-ref-check --warn)
+$(shell $(srctree)scripts/documentation-file-ref-check --warn)
 endif
 
 # Check for broken ABI files
 ifeq ($(CONFIG_WARN_ABI_ERRORS),y)
-$(shell $(srctree)/scripts/get_abi.pl validate --dir $(srctree)/Documentation/ABI)
+$(shell $(srctree)scripts/get_abi.pl validate --dir $(srctree)Documentation/ABI)
 endif
 
 # You can set these variables from the command line.
@@ -21,7 +21,7 @@ SPHINXOPTS    =
 SPHINXDIRS    = .
 DOCS_THEME    =
 DOCS_CSS      =
-_SPHINXDIRS   = $(sort $(patsubst $(srctree:%/=%)/Documentation/%/index.rst,%,$(wildcard $(srctree)/Documentation/*/index.rst)))
+_SPHINXDIRS   = $(sort $(patsubst $(srctree)Documentation/%/index.rst,%,$(wildcard $(srctree)Documentation/*/index.rst)))
 SPHINX_CONF   = conf.py
 PAPER         =
 BUILDDIR      = $(obj)/output
@@ -40,7 +40,7 @@ ifeq ($(HAVE_SPHINX),0)
 .DEFAULT:
 	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
 	@echo
-	@$(srctree)/scripts/sphinx-pre-install
+	@$(srctree)scripts/sphinx-pre-install
 	@echo "  SKIP    Sphinx $@ target."
 
 else # HAVE_SPHINX
@@ -56,10 +56,10 @@ endif #HAVE_LATEXMK
 # Internal variables.
 PAPEROPT_a4     = -D latex_paper_size=a4
 PAPEROPT_letter = -D latex_paper_size=letter
-KERNELDOC       = $(srctree)/scripts/kernel-doc
-KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree) -D kerneldoc_bin=$(KERNELDOC)
+KERNELDOC       = $(srctree)scripts/kernel-doc
+KERNELDOC_CONF  = -D kerneldoc_srctree=$(srctree:%/=%) -D kerneldoc_bin=$(KERNELDOC)
 ALLSPHINXOPTS   =  $(KERNELDOC_CONF) $(PAPEROPT_$(PAPER)) $(SPHINXOPTS)
-ifneq ($(wildcard $(srctree)/.config),)
+ifneq ($(wildcard $(srctree).config),)
 ifeq ($(CONFIG_RUST),y)
 	# Let Sphinx know we will include rustdoc
 	ALLSPHINXOPTS   +=  -t rustdoc
@@ -76,15 +76,15 @@ loop_cmd = $(echo-cmd) $(cmd_$(1)) || exit;
 #    * dest folder relative to $(BUILDDIR) and
 #    * cache folder relative to $(BUILDDIR)/.doctrees
 # $4 dest subfolder e.g. "man" for man pages at userspace-api/media/man
-# $5 reST source folder relative to $(srctree)/$(src),
+# $5 reST source folder relative to $(srctree)$(src),
 #    e.g. "userspace-api/media" for the linux-tv book-set at ./Documentation/userspace-api/media
 
 quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
       cmd_sphinx = $(MAKE) BUILDDIR=$(abspath $(BUILDDIR)) $(build)=Documentation/userspace-api/media $2 && \
 	PYTHONDONTWRITEBYTECODE=1 \
 	BUILDDIR=$(abspath $(BUILDDIR)) SPHINX_CONF=$(abs_srctree)/$(src)/$5/$(SPHINX_CONF) \
-	$(PYTHON3) $(srctree)/scripts/jobserver-exec \
-	$(CONFIG_SHELL) $(srctree)/Documentation/sphinx/parallel-wrapper.sh \
+	$(PYTHON3) $(srctree)scripts/jobserver-exec \
+	$(CONFIG_SHELL) $(srctree)Documentation/sphinx/parallel-wrapper.sh \
 	$(SPHINXBUILD) \
 	-b $2 \
 	-c $(abs_srctree)/$(src) \
@@ -97,10 +97,10 @@ quiet_cmd_sphinx = SPHINX  $@ --> file://$(abspath $(BUILDDIR)/$3/$4)
 		cp $(if $(patsubst /%,,$(DOCS_CSS)),$(abs_srctree)/$(DOCS_CSS),$(DOCS_CSS)) $(BUILDDIR)/$3/_static/; \
 	fi
 
-YNL_INDEX:=$(srctree)/Documentation/networking/netlink_spec/index.rst
-YNL_RST_DIR:=$(srctree)/Documentation/networking/netlink_spec
-YNL_YAML_DIR:=$(srctree)/Documentation/netlink/specs
-YNL_TOOL:=$(srctree)/tools/net/ynl/ynl-gen-rst.py
+YNL_INDEX:=$(srctree)Documentation/networking/netlink_spec/index.rst
+YNL_RST_DIR:=$(srctree)Documentation/networking/netlink_spec
+YNL_YAML_DIR:=$(srctree)Documentation/netlink/specs
+YNL_TOOL:=$(srctree)tools/net/ynl/ynl-gen-rst.py
 
 YNL_RST_FILES_TMP := $(patsubst %.yaml,%.rst,$(wildcard $(YNL_YAML_DIR)/*.yaml))
 YNL_RST_FILES := $(patsubst $(YNL_YAML_DIR)%,$(YNL_RST_DIR)%, $(YNL_RST_FILES_TMP))
@@ -112,21 +112,21 @@ $(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
 	$(Q)$(YNL_TOOL) -i $< -o $@
 
 htmldocs: $(YNL_INDEX)
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
 # If Rust support is available and .config exists, add rustdoc generated contents.
 # If there are any, the errors from this make rustdoc will be displayed but
 # won't stop the execution of htmldocs
 
-ifneq ($(wildcard $(srctree)/.config),)
+ifneq ($(wildcard $(srctree).config),)
 ifeq ($(CONFIG_RUST),y)
 	$(Q)$(MAKE) rustdoc || true
 endif
 endif
 
 texinfodocs:
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,texinfo,$(var),texinfo,$(var)))
 
 # Note: the 'info' Make target is generated by sphinx itself when
@@ -138,7 +138,7 @@ linkcheckdocs:
 	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
 
 latexdocs:
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
 
 ifeq ($(HAVE_PDFLATEX),0)
@@ -150,7 +150,7 @@ pdfdocs:
 else # HAVE_PDFLATEX
 
 pdfdocs: latexdocs
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), \
 	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" -C $(BUILDDIR)/$(var)/latex || exit; \
 	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
@@ -160,11 +160,11 @@ pdfdocs: latexdocs
 endif # HAVE_PDFLATEX
 
 epubdocs:
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
 
 xmldocs:
-	@$(srctree)/scripts/sphinx-pre-install --version-check
+	@$(srctree)scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
 
 endif # HAVE_SPHINX
@@ -173,7 +173,7 @@ endif # HAVE_SPHINX
 # work or silently pass without Sphinx.
 
 refcheckdocs:
-	$(Q)cd $(srctree);scripts/documentation-file-ref-check
+	$(Q)cd $(srctree:%/=%);scripts/documentation-file-ref-check
 
 cleandocs:
 	$(Q)rm -rf $(BUILDDIR)
diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index d22bd9ec8dbf..cc213a171e24 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -25,23 +25,23 @@ quiet_cmd_extract_ex = DTEX    $@
 $(obj)/%.example.dts: $(src)/%.yaml check_dtschema_version FORCE
 	$(call if_changed,extract_ex)
 
-find_all_cmd = find $(srctree)/$(src) \( -name '*.yaml' ! \
+find_all_cmd = find $(srctree)$(src) \( -name '*.yaml' ! \
 		-name 'processed-schema*' \)
 
 find_cmd = $(find_all_cmd) | \
-		sed 's|^$(srctree)/||' | \
+		sed 's|^$(srctree)||' | \
 		grep -F -e "$(subst :," -e ",$(DT_SCHEMA_FILES))" | \
-		sed 's|^|$(srctree)/|'
+		sed 's|^|$(srctree)|'
 CHK_DT_DOCS := $(shell $(find_cmd))
 
 quiet_cmd_yamllint = LINT    $(src)
       cmd_yamllint = ($(find_cmd) | \
                      xargs -n200 -P$$(nproc) \
-		     $(DT_SCHEMA_LINT) -f parsable -c $(srctree)/$(src)/.yamllint >&2) || true
+		     $(DT_SCHEMA_LINT) -f parsable -c $(srctree)$(src)/.yamllint >&2) || true
 
 quiet_cmd_chk_bindings = CHKDT   $@
       cmd_chk_bindings = ($(find_cmd) | \
-                         xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(srctree)/$(src)) || true
+                         xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(srctree)$(src)) || true
 
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = f=$$(mktemp) ; \
@@ -55,7 +55,7 @@ define rule_chkdt
 	$(call cmd,mk_schema)
 endef
 
-DT_DOCS = $(patsubst $(srctree:%/=%)/%,%,$(shell $(find_all_cmd)))
+DT_DOCS = $(patsubst $(srctree)%,%,$(shell $(find_all_cmd)))
 
 override DTC_FLAGS := \
 	-Wno-avoid_unnecessary_addr_size \
@@ -71,8 +71,8 @@ $(obj)/processed-schema.json: $(DT_DOCS) $(src)/.yamllint check_dtschema_version
 	$(call if_changed_rule,chkdt)
 
 always-y += processed-schema.json
-always-$(CHECK_DT_BINDING) += $(patsubst $(srctree:%/=%)/$(src)/%.yaml,%.example.dts, $(CHK_DT_DOCS))
-always-$(CHECK_DT_BINDING) += $(patsubst $(srctree:%/=%)/$(src)/%.yaml,%.example.dtb, $(CHK_DT_DOCS))
+always-$(CHECK_DT_BINDING) += $(patsubst $(srctree)$(src)/%.yaml,%.example.dts, $(CHK_DT_DOCS))
+always-$(CHECK_DT_BINDING) += $(patsubst $(srctree)$(src)/%.yaml,%.example.dtb, $(CHK_DT_DOCS))
 
 # Hack: avoid 'Argument list too long' error for 'make clean'. Remove most of
 # build artifacts here before they are processed by scripts/Makefile.clean
@@ -80,4 +80,4 @@ clean-files = $(shell find $(obj) \( -name '*.example.dts' -o \
 			-name '*.example.dtb' \) -delete 2>/dev/null)
 
 dt_compatible_check: $(obj)/processed-schema.json
-	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
+	$(Q)$(srctree)scripts/dtc/dt-extract-compatibles $(srctree:%/=%) | xargs dt-check-compatible -v -s $<
diff --git a/Documentation/userspace-api/media/Makefile b/Documentation/userspace-api/media/Makefile
index 863c08c2d925..8a95673d37a1 100644
--- a/Documentation/userspace-api/media/Makefile
+++ b/Documentation/userspace-api/media/Makefile
@@ -2,10 +2,10 @@
 
 # Rules to convert a .h file to inline RST documentation
 
-SRC_DIR=$(srctree)/Documentation/userspace-api/media
-PARSER = $(srctree)/Documentation/sphinx/parse-headers.pl
-UAPI = $(srctree)/include/uapi/linux
-KAPI = $(srctree)/include/linux
+SRC_DIR=$(srctree)Documentation/userspace-api/media
+PARSER = $(srctree)Documentation/sphinx/parse-headers.pl
+UAPI = $(srctree)include/uapi/linux
+KAPI = $(srctree)include/linux
 
 FILES = ca.h.rst dmx.h.rst frontend.h.rst net.h.rst \
 	videodev2.h.rst media.h.rst cec.h.rst lirc.h.rst
@@ -16,7 +16,7 @@ gen_rst = \
 	echo ${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
-quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree:%/=%)/%,%,$<)'; \
+quiet_gen_rst = echo '  PARSE   $(patsubst $(srctree)%,%,$<)'; \
 	${PARSER} $< $@ $(SRC_DIR)/$(notdir $@).exceptions
 
 silent_gen_rst = ${gen_rst}
diff --git a/Makefile b/Makefile
index 6d7758a76429..1c09c7fb7839 100644
--- a/Makefile
+++ b/Makefile
@@ -66,7 +66,7 @@ unexport GREP_OPTIONS
 #
 # e.g.)
 #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
-#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
+#          cmd_depmod = $(srctree)scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
 #
 # A simple variant is to prefix commands with $(Q) - that's useful
 # for commands that shall be hidden in non-verbose mode.
@@ -355,19 +355,19 @@ $(MAKECMDGOALS): __build_one_by_one
 __build_one_by_one:
 	$(Q)set -e; \
 	for i in $(MAKECMDGOALS); do \
-		$(MAKE) -f $(srctree)/Makefile $$i; \
+		$(MAKE) -f $(srctree)Makefile $$i; \
 	done
 
 else # !mixed-build
 
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 # Read KERNELRELEASE from include/config/kernel.release (if it exists)
 KERNELRELEASE = $(call read-file, include/config/kernel.release)
 KERNELVERSION = $(VERSION)$(if $(PATCHLEVEL),.$(PATCHLEVEL)$(if $(SUBLEVEL),.$(SUBLEVEL)))$(EXTRAVERSION)
 export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
 
-include $(srctree)/scripts/subarch.include
+include $(srctree)scripts/subarch.include
 
 # Cross compiling and selecting different set of gcc/bin-utils
 # ---------------------------------------------------------------------------
@@ -533,19 +533,19 @@ LDFLAGS_vmlinux =
 
 # Use USERINCLUDE when you must reference the UAPI directories only.
 USERINCLUDE    := \
-		-I$(srctree)/arch/$(SRCARCH)/include/uapi \
+		-I$(srctree)arch/$(SRCARCH)/include/uapi \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
-		-I$(srctree)/include/uapi \
+		-I$(srctree)include/uapi \
 		-I$(objtree)/include/generated/uapi \
-                -include $(srctree)/include/linux/compiler-version.h \
-                -include $(srctree)/include/linux/kconfig.h
+                -include $(srctree)include/linux/compiler-version.h \
+                -include $(srctree)include/linux/kconfig.h
 
 # Use LINUXINCLUDE when you must reference the include/ directory.
 # Needed to be compatible with the O= option
 LINUXINCLUDE    := \
-		-I$(srctree)/arch/$(SRCARCH)/include \
+		-I$(srctree)arch/$(SRCARCH)/include \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated \
-		$(if $(building_out_of_srctree),-I$(srctree)/include) \
+		$(if $(building_out_of_srctree),-I$(srctree)include) \
 		-I$(objtree)/include \
 		$(USERINCLUDE)
 
@@ -635,21 +635,21 @@ ifdef building_out_of_srctree
 
 quiet_cmd_makefile = GEN     Makefile
       cmd_makefile = { \
-	echo "\# Automatically generated by $(srctree)/Makefile: don't edit"; \
-	echo "include $(srctree)/Makefile"; \
+	echo "\# Automatically generated by $(srctree)Makefile: don't edit"; \
+	echo "include $(srctree)Makefile"; \
 	} > Makefile
 
 outputmakefile:
-	@if [ -f $(srctree)/.config -o \
-		 -d $(srctree)/include/config -o \
-		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
+	@if [ -f $(srctree).config -o \
+		 -d $(srctree)include/config -o \
+		 -d $(srctree)arch/$(SRCARCH)/include/generated ]; then \
 		echo >&2 "***"; \
 		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
 		echo >&2 "*** in $(abs_srctree)";\
 		echo >&2 "***"; \
 		false; \
 	fi
-	$(Q)ln -fsn $(srctree) source
+	$(Q)ln -fsn $(srctree:%/=%) source
 	$(call cmd,makefile)
 	$(Q)test -e .gitignore || \
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
@@ -662,13 +662,13 @@ endif
 CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
 
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
-include $(srctree)/scripts/Makefile.clang
+include $(srctree)scripts/Makefile.clang
 endif
 
 # Include this also for config targets because some architectures need
 # cc-cross-prefix to determine CROSS_COMPILE.
 ifdef need-compiler
-include $(srctree)/scripts/Makefile.compiler
+include $(srctree)scripts/Makefile.compiler
 endif
 
 ifdef config-build
@@ -679,7 +679,7 @@ ifdef config-build
 # Read arch-specific Makefile to set KBUILD_DEFCONFIG as needed.
 # KBUILD_DEFCONFIG may point out an alternative default configuration
 # used for 'make defconfig'
-include $(srctree)/arch/$(SRCARCH)/Makefile
+include $(srctree)arch/$(SRCARCH)/Makefile
 export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
 
 config: outputmakefile scripts_basic FORCE
@@ -757,7 +757,7 @@ ifdef CONFIG_FUNCTION_TRACER
   CC_FLAGS_FTRACE := -pg
 endif
 
-include $(srctree)/arch/$(SRCARCH)/Makefile
+include $(srctree)arch/$(SRCARCH)/Makefile
 
 ifdef need-config
 ifdef may-sync-config
@@ -787,7 +787,7 @@ $(KCONFIG_CONFIG):
 # so you cannot notice that Kconfig is waiting for the user input.
 %/config/auto.conf %/config/auto.conf.cmd %/generated/autoconf.h %/generated/rustc_cfg: $(KCONFIG_CONFIG)
 	$(Q)$(kecho) "  SYNC    $@"
-	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
+	$(Q)$(MAKE) -f $(srctree)Makefile syncconfig
 else # !may-sync-config
 # External modules and some install targets need include/generated/autoconf.h
 # and include/config/auto.conf but do not care if they are up-to-date.
@@ -1002,7 +1002,7 @@ KBUILD_CFLAGS   += -fconserve-stack
 endif
 
 # change __FILE__ to the relative path from the srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)=)
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
@@ -1016,7 +1016,7 @@ include-$(CONFIG_KCOV)		+= scripts/Makefile.kcov
 include-$(CONFIG_RANDSTRUCT)	+= scripts/Makefile.randstruct
 include-$(CONFIG_GCC_PLUGINS)	+= scripts/Makefile.gcc-plugins
 
-include $(addprefix $(srctree)/, $(include-y))
+include $(addprefix $(srctree), $(include-y))
 
 # scripts/Makefile.gcc-plugins is intentionally included last.
 # Do not add $(call cc-option,...) below this line. When you build the kernel
@@ -1132,7 +1132,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
 	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)scripts/head-object-list.txt)
 
 targets += vmlinux.a
 vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
@@ -1140,7 +1140,7 @@ vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 
 PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_o
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.vmlinux_o
 
 vmlinux.o modules.builtin.modinfo modules.builtin: vmlinux_o
 	@:
@@ -1159,14 +1159,14 @@ PHONY += vmlinux
 vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 vmlinux: vmlinux.o $(KBUILD_LDS) modpost
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.vmlinux
 
 # The actual objects are generated when descending,
 # make sure no implicit rule kicks in
 $(sort $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)): . ;
 
 ifeq ($(origin KERNELRELEASE),file)
-filechk_kernel.release = $(srctree)/scripts/setlocalversion $(srctree)
+filechk_kernel.release = $(srctree)scripts/setlocalversion $(srctree)
 else
 filechk_kernel.release = echo $(KERNELRELEASE)
 endif
@@ -1201,16 +1201,16 @@ prepare0: archprepare
 # All the preparing..
 prepare: prepare0
 ifdef CONFIG_RUST
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/rust_is_available.sh
 	$(Q)$(MAKE) $(build)=rust
 endif
 
 PHONY += remove-stale-files
 remove-stale-files:
-	$(Q)$(srctree)/scripts/remove-stale-files
+	$(Q)$(srctree)scripts/remove-stale-files
 
 # Support for using generic headers in asm-generic
-asm-generic := -f $(srctree)/scripts/Makefile.asm-generic obj
+asm-generic := -f $(srctree)scripts/Makefile.asm-generic obj
 
 PHONY += asm-generic uapi-asm-generic
 asm-generic: uapi-asm-generic
@@ -1258,7 +1258,7 @@ $(version_h): FORCE
 include/generated/utsrelease.h: include/config/kernel.release FORCE
 	$(call filechk,utsrelease.h)
 
-filechk_compile.h = $(srctree)/scripts/mkcompile_h \
+filechk_compile.h = $(srctree)scripts/mkcompile_h \
 	"$(UTS_MACHINE)" "$(CONFIG_CC_VERSION_TEXT)" "$(LD)"
 
 include/generated/compile.h: FORCE
@@ -1266,8 +1266,8 @@ include/generated/compile.h: FORCE
 
 PHONY += headerdep
 headerdep:
-	$(Q)find $(srctree)/include/ -name '*.h' | xargs --max-args 1 \
-	$(srctree)/scripts/headerdep.pl -I$(srctree)/include
+	$(Q)find $(srctree)include/ -name '*.h' | xargs --max-args 1 \
+	$(srctree)scripts/headerdep.pl -I$(srctree)include
 
 # ---------------------------------------------------------------------------
 # Kernel headers
@@ -1287,7 +1287,7 @@ headers_install: headers
 
 PHONY += archheaders archscripts
 
-hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
+hdr-inst := -f $(srctree)scripts/Makefile.headersinst obj
 
 PHONY += headers
 headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
@@ -1312,7 +1312,7 @@ scripts_unifdef: scripts_basic
 # Cancel sub_make_done so that options such as M=, V=, etc. are parsed.
 
 quiet_cmd_install = INSTALL $(INSTALL_PATH)
-      cmd_install = unset sub_make_done; $(srctree)/scripts/install.sh
+      cmd_install = unset sub_make_done; $(srctree)scripts/install.sh
 
 # ---------------------------------------------------------------------------
 # vDSO install
@@ -1320,7 +1320,7 @@ quiet_cmd_install = INSTALL $(INSTALL_PATH)
 PHONY += vdso_install
 vdso_install: export INSTALL_FILES = $(vdso-install-y)
 vdso_install:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vdsoinst
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.vdsoinst
 
 # ---------------------------------------------------------------------------
 # Tools
@@ -1343,7 +1343,7 @@ resolve_btfids_O = $(abs_objtree)/tools/bpf/resolve_btfids
 # in output directory, skip its clean in that case
 resolve_btfids_clean:
 ifneq ($(wildcard $(resolve_btfids_O)),)
-	$(Q)$(MAKE) -sC $(srctree)/tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
+	$(Q)$(MAKE) -sC $(srctree)tools/bpf/resolve_btfids O=$(resolve_btfids_O) clean
 endif
 
 # Clear a bunch of variables before executing the submake
@@ -1353,33 +1353,33 @@ endif
 
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)/tools/
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)/tools/ $*
+	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abs_objtree) subdir=tools -C $(srctree)tools/ $*
 
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
 PHONY += kselftest
 kselftest: headers
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
+	$(Q)$(MAKE) -C $(srctree)tools/testing/selftests run_tests
 
 kselftest-%: headers FORCE
-	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
+	$(Q)$(MAKE) -C $(srctree)tools/testing/selftests $*
 
 PHONY += kselftest-merge
 kselftest-merge:
 	$(if $(wildcard $(objtree)/.config),, $(error No .config exists, config your kernel first!))
-	$(Q)find $(srctree)/tools/testing/selftests -name config -o -name config.$(UTS_MACHINE) | \
-		xargs $(srctree)/scripts/kconfig/merge_config.sh -y -m $(objtree)/.config
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)find $(srctree)tools/testing/selftests -name config -o -name config.$(UTS_MACHINE) | \
+		xargs $(srctree)scripts/kconfig/merge_config.sh -y -m $(objtree)/.config
+	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 
 # ---------------------------------------------------------------------------
 # Devicetree files
 
-ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/boot/dts/),)
+ifneq ($(wildcard $(srctree)arch/$(SRCARCH)/boot/dts/),)
 dtstree := arch/$(SRCARCH)/boot/dts
 endif
 
@@ -1501,7 +1501,7 @@ clean: rm-files := $(CLEAN_FILES)
 PHONY += archclean vmlinuxclean
 
 vmlinuxclean:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/link-vmlinux.sh clean
 	$(Q)$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) clean)
 
 clean: archclean vmlinuxclean resolve_btfids_clean
@@ -1538,16 +1538,16 @@ distclean: mrproper
 # ---------------------------------------------------------------------------
 
 %src-pkg: FORCE
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.package $@
 %pkg: include/config/kernel.release FORCE
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.package $@
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.package $@
 
 # Brief documentation of the typical targets used
 # ---------------------------------------------------------------------------
 
-boards := $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*_defconfig)
+boards := $(wildcard $(srctree)arch/$(SRCARCH)/configs/*_defconfig)
 boards := $(sort $(notdir $(boards)))
-board-dirs := $(dir $(wildcard $(srctree)/arch/$(SRCARCH)/configs/*/*_defconfig))
+board-dirs := $(dir $(wildcard $(srctree)arch/$(SRCARCH)/configs/*/*_defconfig))
 board-dirs := $(sort $(notdir $(board-dirs:/=)))
 
 PHONY += help
@@ -1558,7 +1558,7 @@ help:
 	@echo  '  mrproper	  - Remove all generated files + config + various backup files'
 	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
 	@echo  ''
-	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
+	@$(MAKE) -f $(srctree)scripts/kconfig/Makefile help
 	@echo  ''
 	@echo  'Other generic targets:'
 	@echo  '  all		  - Build all targets marked with [*]'
@@ -1639,10 +1639,10 @@ help:
 	@echo '  or  "cd tools; make help"'
 	@echo  ''
 	@echo  'Kernel packaging:'
-	@$(MAKE) -f $(srctree)/scripts/Makefile.package help
+	@$(MAKE) -f $(srctree)scripts/Makefile.package help
 	@echo  ''
 	@echo  'Documentation targets:'
-	@$(MAKE) -f $(srctree)/Documentation/Makefile dochelp
+	@$(MAKE) -f $(srctree)Documentation/Makefile dochelp
 	@echo  ''
 	@echo  'Architecture-specific targets ($(SRCARCH)):'
 	@$(or $(archhelp),\
@@ -1686,7 +1686,7 @@ help-board-dirs := $(addprefix help-,$(board-dirs))
 
 help-boards: $(help-board-dirs)
 
-boards-per-dir = $(sort $(notdir $(wildcard $(srctree)/arch/$(SRCARCH)/configs/$*/*_defconfig)))
+boards-per-dir = $(sort $(notdir $(wildcard $(srctree)arch/$(SRCARCH)/configs/$*/*_defconfig)))
 
 $(help-board-dirs): help-%:
 	@echo  'Architecture-specific targets ($(SRCARCH) $*):'
@@ -1711,7 +1711,7 @@ $(DOC_TARGETS):
 # "Is Rust available?" target
 PHONY += rustavailable
 rustavailable:
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/rust_is_available.sh && echo "Rust is available!"
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/rust_is_available.sh && echo "Rust is available!"
 
 # Documentation target
 #
@@ -1750,7 +1750,7 @@ rustfmtcheck: rustfmt
 
 PHONY += misc-check
 misc-check:
-	$(Q)$(srctree)/scripts/misc-check
+	$(Q)$(srctree)scripts/misc-check
 
 all: misc-check
 
@@ -1826,7 +1826,7 @@ endif # KBUILD_EXTMOD
 PHONY += modules modules_install modules_sign modules_prepare
 
 modules_install:
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modinst \
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.modinst \
 	sign-only=$(if $(filter modules_install,$(MAKECMDGOALS)),,y)
 
 ifeq ($(CONFIG_MODULE_SIG),y)
@@ -1851,12 +1851,12 @@ $(MODORDER): $(build-dir)
 # This is solely useful to speed up test compiles.
 modules: modpost
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.modfinal
 endif
 
 PHONY += modules_check
 modules_check: $(MODORDER)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh $<
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/modules-check.sh $<
 
 else # CONFIG_MODULES
 
@@ -1870,7 +1870,7 @@ endif # CONFIG_MODULES
 PHONY += modpost
 modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
 	 $(if $(KBUILD_MODULES), modules_check)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.modpost
 
 # Single targets
 # ---------------------------------------------------------------------------
@@ -1900,9 +1900,9 @@ $(single-no-ko): $(build-dir)
 PHONY += single_modules
 single_modules: $(single-no-ko) modules_prepare
 	$(Q){ $(foreach m, $(single-ko), echo $(extmod_prefix)$(m:%.ko=%.o);) } > $(MODORDER)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.modpost
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
-	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modfinal
+	$(Q)$(MAKE) -f $(srctree)scripts/Makefile.modfinal
 endif
 	$(Q)rm -f $(MODORDER)
 
@@ -1949,7 +1949,7 @@ clean: $(clean-dirs)
 # Generate tags for editors
 # ---------------------------------------------------------------------------
 quiet_cmd_tags = GEN     $@
-      cmd_tags = $(BASH) $(srctree)/scripts/tags.sh $@
+      cmd_tags = $(BASH) $(srctree)scripts/tags.sh $@
 
 tags TAGS cscope gtags: FORCE
 	$(call cmd,tags)
@@ -1965,7 +1965,7 @@ rust-analyzer:
 PHONY += nsdeps
 nsdeps: export KBUILD_NSDEPS=1
 nsdeps: modules
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/nsdeps
 
 # Clang Tooling
 # ---------------------------------------------------------------------------
@@ -1984,7 +1984,7 @@ PHONY += clang-tidy clang-analyzer
 
 ifdef CONFIG_CC_IS_CLANG
 quiet_cmd_clang_tools = CHECK   $<
-      cmd_clang_tools = $(PYTHON3) $(srctree)/scripts/clang-tools/run-clang-tools.py $@ $<
+      cmd_clang_tools = $(PYTHON3) $(srctree)scripts/clang-tools/run-clang-tools.py $@ $<
 
 clang-tidy clang-analyzer: $(extmod_prefix)compile_commands.json
 	$(call cmd,clang_tools)
@@ -2000,20 +2000,20 @@ endif
 PHONY += includecheck versioncheck coccicheck export_report
 
 includecheck:
-	find $(srctree)/* $(RCS_FIND_IGNORE) \
+	find $(srctree)* $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-		| xargs $(PERL) -w $(srctree)/scripts/checkincludes.pl
+		| xargs $(PERL) -w $(srctree)scripts/checkincludes.pl
 
 versioncheck:
-	find $(srctree)/* $(RCS_FIND_IGNORE) \
+	find $(srctree)* $(RCS_FIND_IGNORE) \
 		-name '*.[hcS]' -type f -print | sort \
-		| xargs $(PERL) -w $(srctree)/scripts/checkversion.pl
+		| xargs $(PERL) -w $(srctree)scripts/checkversion.pl
 
 coccicheck:
-	$(Q)$(BASH) $(srctree)/scripts/$@
+	$(Q)$(BASH) $(srctree)scripts/$@
 
 export_report:
-	$(PERL) $(srctree)/scripts/export_report.pl
+	$(PERL) $(srctree)scripts/export_report.pl
 
 PHONY += checkstack kernelrelease kernelversion image_name
 
@@ -2029,7 +2029,7 @@ endif
 MINSTACKSIZE	?= 100
 checkstack:
 	$(OBJDUMP) -d vmlinux $$(find . -name '*.ko') | \
-	$(PERL) $(srctree)/scripts/checkstack.pl $(CHECKSTACK_ARCH) $(MINSTACKSIZE)
+	$(PERL) $(srctree)scripts/checkstack.pl $(CHECKSTACK_ARCH) $(MINSTACKSIZE)
 
 kernelrelease:
 	@$(filechk_kernel.release)
diff --git a/arch/alpha/boot/Makefile b/arch/alpha/boot/Makefile
index d8dba85e606c..37b7ec3f7a7d 100644
--- a/arch/alpha/boot/Makefile
+++ b/arch/alpha/boot/Makefile
@@ -15,7 +15,7 @@ targets		:= vmlinux.gz vmlinux \
 OBJSTRIP	:= $(obj)/tools/objstrip
 
 KBUILD_HOSTCFLAGS := -Wall -I$(objtree)/usr/include
-BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
+BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)$(obj)
 
 # SRM bootable image.  Copy to offset 512 of a partition.
 $(obj)/bootimage: $(addprefix $(obj)/tools/,mkbb lxboot bootlx) $(obj)/vmlinux.nh
diff --git a/arch/alpha/kernel/syscalls/Makefile b/arch/alpha/kernel/syscalls/Makefile
index b265e4bc16c2..5571f3cf66fd 100644
--- a/arch/alpha/kernel/syscalls/Makefile
+++ b/arch/alpha/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 2390dd042e36..96599c5fff6e 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -34,7 +34,7 @@ ifdef CONFIG_ARC_CURR_IN_REG
 # any kernel headers, and missing the global register
 # Can't do unconditionally because of recursive include issues
 # due to <linux/thread_info.h>
-LINUXINCLUDE	+=  -include $(srctree)/arch/arc/include/asm/current.h
+LINUXINCLUDE	+=  -include $(srctree)arch/arc/include/asm/current.h
 cflags-y	+= -ffixed-gp
 endif
 
diff --git a/arch/arc/boot/dts/Makefile b/arch/arc/boot/dts/Makefile
index 5b27c668afe1..57e76d2aa1d4 100644
--- a/arch/arc/boot/dts/Makefile
+++ b/arch/arc/boot/dts/Makefile
@@ -10,7 +10,7 @@ obj-y   += $(builtindtb-y).dtb.o
 dtb-y := $(builtindtb-y).dtb
 
 # for CONFIG_OF_ALL_DTBS test
-dtstree	:= $(srctree:%/=%)/$(src)
+dtstree	:= $(srctree)$(src)
 dtb-	:= $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
 
 # board-specific dtc flags
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 473280d5adce..2bba58901196 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -228,7 +228,7 @@ machine-$(CONFIG_PLAT_SPEAR)		+= spear
 machdirs-$(CONFIG_ARCH_FOOTBRIDGE)	+= arch/arm/mach-footbridge
 machdirs-$(CONFIG_ARCH_RPC)		+= arch/arm/mach-rpc
 machdirs-$(CONFIG_ARCH_SA1100)		+= arch/arm/mach-sa1100
-KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%/include,$(machdirs-y))
+KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)%/include,$(machdirs-y))
 
 # The byte offset of the kernel image in RAM from the start of RAM.
 TEXT_OFFSET := $(textofs-y)
@@ -305,7 +305,7 @@ vdso-install-$(CONFIG_VDSO) += arch/arm/vdso/vdso.so.dbg
 # My testing targets (bypasses dependencies)
 bp:;	$(Q)$(MAKE) $(build)=$(boot) $(boot)/bootpImage
 
-include $(srctree)/scripts/Makefile.defconf
+include $(srctree)scripts/Makefile.defconf
 PHONY += multi_v7_lpae_defconfig
 multi_v7_lpae_defconfig:
 	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
diff --git a/arch/arm/boot/Makefile b/arch/arm/boot/Makefile
index abd6a2889fd0..369b7c12fe58 100644
--- a/arch/arm/boot/Makefile
+++ b/arch/arm/boot/Makefile
@@ -26,7 +26,7 @@ targets := Image zImage xipImage bootpImage uImage
 ifeq ($(CONFIG_XIP_KERNEL),y)
 
 cmd_deflate_xip_data = $(CONFIG_SHELL) -c \
-	'$(srctree)/$(src)/deflate_xip_data.sh $< $@'
+	'$(srctree)$(src)/deflate_xip_data.sh $< $@'
 
 ifeq ($(CONFIG_XIP_DEFLATED_DATA),y)
 quiet_cmd_mkxip = XIPZ    $@
diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index 726ecabcef09..8a468d737471 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -101,7 +101,7 @@ targets       := vmlinux vmlinux.lds piggy_data piggy.o \
 KBUILD_CFLAGS += -DDISABLE_BRANCH_PROFILING
 
 ccflags-y := -fpic $(call cc-option,-mno-single-pic-base,) -fno-builtin \
-	     -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+	     -I$(srctree)scripts/dtc/libfdt -fno-stack-protector \
 	     -I$(obj) $(DISABLE_ARM_SSP_PER_TASK_PLUGIN)
 ccflags-remove-$(CONFIG_FUNCTION_TRACER) += -pg
 asflags-y := -DZIMAGE
diff --git a/arch/arm/mach-dove/Makefile b/arch/arm/mach-dove/Makefile
index 0d31390be069..3a840ac648ef 100644
--- a/arch/arm/mach-dove/Makefile
+++ b/arch/arm/mach-dove/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
+ccflags-y := -I$(srctree)arch/arm/plat-orion/include
 
 obj-y				+= common.o
 obj-$(CONFIG_DOVE_LEGACY)	+= irq.o mpp.o
diff --git a/arch/arm/mach-mv78xx0/Makefile b/arch/arm/mach-mv78xx0/Makefile
index ddee6ae501bb..9f2a2f6024cd 100644
--- a/arch/arm/mach-mv78xx0/Makefile
+++ b/arch/arm/mach-mv78xx0/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
+ccflags-y := -I$(srctree)arch/arm/plat-orion/include
 
 obj-y				+= common.o mpp.o irq.o pcie.o
 obj-$(CONFIG_MACH_TERASTATION_WXL) += buffalo-wxl-setup.o
diff --git a/arch/arm/mach-mvebu/Makefile b/arch/arm/mach-mvebu/Makefile
index 569768a69ffc..87e43cc258bb 100644
--- a/arch/arm/mach-mvebu/Makefile
+++ b/arch/arm/mach-mvebu/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
+ccflags-y := -I$(srctree)arch/arm/plat-orion/include
 
 obj-$(CONFIG_MACH_MVEBU_ANY)	 += system-controller.o mvebu-soc-id.o
 
diff --git a/arch/arm/mach-orion5x/Makefile b/arch/arm/mach-orion5x/Makefile
index 6f54d7fef27a..f3857087d4d6 100644
--- a/arch/arm/mach-orion5x/Makefile
+++ b/arch/arm/mach-orion5x/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
+ccflags-y := -I$(srctree)arch/arm/plat-orion/include
 
 obj-y				+= common.o pci.o irq.o mpp.o
 obj-$(CONFIG_MACH_KUROBOX_PRO)	+= kurobox_pro-setup.o
diff --git a/arch/arm/mach-s3c/Makefile b/arch/arm/mach-s3c/Makefile
index 713827bef831..0aa9c287fd40 100644
--- a/arch/arm/mach-s3c/Makefile
+++ b/arch/arm/mach-s3c/Makefile
@@ -2,7 +2,7 @@
 #
 # Copyright 2009 Simtec Electronics
 
-include $(srctree)/$(src)/Makefile.s3c64xx
+include $(srctree)$(src)/Makefile.s3c64xx
 
 # Objects we always build independent of SoC choice
 
diff --git a/arch/arm/plat-orion/Makefile b/arch/arm/plat-orion/Makefile
index 830b0be038c6..123f39326789 100644
--- a/arch/arm/plat-orion/Makefile
+++ b/arch/arm/plat-orion/Makefile
@@ -2,7 +2,7 @@
 #
 # Makefile for the linux kernel.
 #
-ccflags-y := -I$(srctree)/$(src)/include
+ccflags-y := -I$(srctree)$(src)/include
 
 orion-gpio-$(CONFIG_GPIOLIB)      += gpio.o
 obj-$(CONFIG_PLAT_ORION_LEGACY)   += irq.o pcie.o time.o common.o mpp.o
diff --git a/arch/arm/tools/Makefile b/arch/arm/tools/Makefile
index 81f13bdf32f2..63e17472b323 100644
--- a/arch/arm/tools/Makefile
+++ b/arch/arm/tools/Makefile
@@ -8,9 +8,9 @@
 gen := arch/$(ARCH)/include/generated
 kapi := $(gen)/asm
 uapi := $(gen)/uapi/asm
-syshdr := $(srctree)/scripts/syscallhdr.sh
-sysnr := $(srctree)/$(src)/syscallnr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+sysnr := $(srctree)$(src)/syscallnr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 syscall := $(src)/syscall.tbl
 
 gen-y := $(gen)/calls-oabi.S
diff --git a/arch/arm/vdso/Makefile b/arch/arm/vdso/Makefile
index d761bd2e2f40..579bf0369e94 100644
--- a/arch/arm/vdso/Makefile
+++ b/arch/arm/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 hostprogs := vdsomunge
 
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index a88cdf910687..23df63ec4182 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -202,7 +202,7 @@ endif
 vdso-install-y				+= arch/arm64/kernel/vdso/vdso.so.dbg
 vdso-install-$(CONFIG_COMPAT_VDSO)	+= arch/arm64/kernel/vdso32/vdso32.so.dbg
 
-include $(srctree)/scripts/Makefile.defconf
+include $(srctree)scripts/Makefile.defconf
 
 PHONY += virtconfig
 virtconfig:
diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index a5a787371117..bd9154ec41db 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -47,4 +47,4 @@ EFI_ZBOOT_FORWARD_CFI	:= $(CONFIG_ARM64_BTI_KERNEL)
 EFI_ZBOOT_OBJCOPY_FLAGS	= --add-symbol zboot_code_size=0x$$( \
 				$(NM) vmlinux|grep _kernel_codesize|cut -d' ' -f1)
 
-include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
+include $(srctree)drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/arm64/kernel/pi/Makefile b/arch/arm64/kernel/pi/Makefile
index c844a0546d7f..4b436f09822a 100644
--- a/arch/arm64/kernel/pi/Makefile
+++ b/arch/arm64/kernel/pi/Makefile
@@ -5,8 +5,8 @@ KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(DISABLE_LATENT_ENTROPY_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
-		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
-		   -include $(srctree)/include/linux/hidden.h \
+		   -I$(srctree)scripts/dtc/libfdt -fno-stack-protector \
+		   -include $(srctree)include/linux/hidden.h \
 		   -D__DISABLE_EXPORTS -ffreestanding -D__NO_FORTIFY \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
@@ -28,7 +28,7 @@ $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 $(obj)/%.pi.o: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
+$(obj)/lib-%.o: $(srctree)lib/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 obj-y		:= kaslr_early.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 8818287f1095..2d4e79a1309b 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -7,7 +7,7 @@
 #
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 obj-vdso := vgettimeofday.o note.o sigreturn.o
 
@@ -68,7 +68,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
       cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index f5f80fdce0fe..848fec66bcbe 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -3,7 +3,7 @@
 # Makefile for vdso32
 #
 
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
diff --git a/arch/arm64/kvm/Makefile b/arch/arm64/kvm/Makefile
index c0c050e53157..d73989d74b79 100644
--- a/arch/arm64/kvm/Makefile
+++ b/arch/arm64/kvm/Makefile
@@ -3,9 +3,9 @@
 # Makefile for Kernel-based Virtual Machine module
 #
 
-ccflags-y += -I $(srctree)/$(src)
+ccflags-y += -I $(srctree)$(src)
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 obj-$(CONFIG_KVM) += hyp/
@@ -30,7 +30,7 @@ define rule_gen_hyp_constants
 	$(call filechk,offsets,__HYP_CONSTANTS_H__)
 endef
 
-CFLAGS_hyp-constants.o = -I $(srctree)/$(src)/hyp/include
+CFLAGS_hyp-constants.o = -I $(srctree)$(src)/hyp/include
 $(obj)/hyp-constants.s: $(src)/hyp/hyp-constants.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
diff --git a/arch/arm64/kvm/hyp/Makefile b/arch/arm64/kvm/hyp/Makefile
index a38dea6186c9..94f4049e858a 100644
--- a/arch/arm64/kvm/hyp/Makefile
+++ b/arch/arm64/kvm/hyp/Makefile
@@ -3,7 +3,7 @@
 # Makefile for Kernel-based Virtual Machine module, HYP part
 #
 
-incdir := $(srctree)/$(src)/include
+incdir := $(srctree)$(src)/include
 subdir-asflags-y := -I$(incdir)
 subdir-ccflags-y := -I$(incdir)
 
diff --git a/arch/csky/Makefile b/arch/csky/Makefile
index 0e4237e55758..fe1df2a3a272 100644
--- a/arch/csky/Makefile
+++ b/arch/csky/Makefile
@@ -52,7 +52,7 @@ KBUILD_CFLAGS += -mbacktrace
 endif
 
 abidirs := $(patsubst %,arch/csky/%/,$(CSKYABI))
-KBUILD_CFLAGS += $(patsubst %,-I$(srctree)/%inc,$(abidirs))
+KBUILD_CFLAGS += $(patsubst %,-I$(srctree)%inc,$(abidirs))
 
 KBUILD_CPPFLAGS += -mlittle-endian
 LDFLAGS += -EL
diff --git a/arch/csky/boot/dts/Makefile b/arch/csky/boot/dts/Makefile
index fdb7571758a2..9c3539c9cc50 100644
--- a/arch/csky/boot/dts/Makefile
+++ b/arch/csky/boot/dts/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-dtstree	:= $(srctree:%/=%)/$(src)
+dtstree	:= $(srctree)$(src)
 
 dtb-y := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index ddf784a62c11..05462cf2daa2 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 # Symbols present in the vdso
 vdso-syms  += rt_sigreturn
@@ -57,4 +57,4 @@ quiet_cmd_vdsold = VDSOLD  $@
 # Extracts symbol offsets from the VDSO, converting them into an assembly file
 # that contains the same symbols at the same offsets.
 quiet_cmd_so2s = SO2S    $@
-      cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
+      cmd_so2s = $(NM) -D $< | $(srctree)$(src)/so2s.sh > $@
diff --git a/arch/loongarch/boot/Makefile b/arch/loongarch/boot/Makefile
index 4e1c374c5782..52713e88e5b8 100644
--- a/arch/loongarch/boot/Makefile
+++ b/arch/loongarch/boot/Makefile
@@ -23,4 +23,4 @@ EFI_ZBOOT_PAYLOAD      := vmlinux.efi
 EFI_ZBOOT_BFD_TARGET   := elf64-loongarch
 EFI_ZBOOT_MACH_TYPE    := LOONGARCH64
 
-include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
+include $(srctree)drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/loongarch/kvm/Makefile b/arch/loongarch/kvm/Makefile
index 244467d7792a..55929abb0ba6 100644
--- a/arch/loongarch/kvm/Makefile
+++ b/arch/loongarch/kvm/Makefile
@@ -3,9 +3,9 @@
 # Makefile for LoongArch KVM support
 #
 
-ccflags-y += -I $(srctree)/$(src)
+ccflags-y += -I $(srctree)$(src)
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 
diff --git a/arch/loongarch/vdso/Makefile b/arch/loongarch/vdso/Makefile
index f597cd08a96b..ecef99e4767d 100644
--- a/arch/loongarch/vdso/Makefile
+++ b/arch/loongarch/vdso/Makefile
@@ -6,7 +6,7 @@ UBSAN_SANITIZE := n
 KCOV_INSTRUMENT := n
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgetcpu.o vgettimeofday.o sigreturn.o
 
@@ -51,7 +51,7 @@ quiet_cmd_vdsoas_o_S = AS       $@
       cmd_vdsoas_o_S = $(CC) $(a_flags) -c -o $@ $<
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
       cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/m68k/kernel/syscalls/Makefile b/arch/m68k/kernel/syscalls/Makefile
index b265e4bc16c2..5571f3cf66fd 100644
--- a/arch/m68k/kernel/syscalls/Makefile
+++ b/arch/m68k/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
diff --git a/arch/microblaze/kernel/syscalls/Makefile b/arch/microblaze/kernel/syscalls/Makefile
index b265e4bc16c2..5571f3cf66fd 100644
--- a/arch/microblaze/kernel/syscalls/Makefile
+++ b/arch/microblaze/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index f49807e1f19b..2eaf5ad2beb6 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -280,14 +280,14 @@ endif
 #
 # Board-dependent options and extra files
 #
-include $(srctree)/arch/mips/Kbuild.platforms
+include $(srctree)arch/mips/Kbuild.platforms
 
 ifdef CONFIG_PHYSICAL_START
 load-y					= $(CONFIG_PHYSICAL_START)
 endif
 
 entry-y				= $(shell $(objtree)/arch/mips/tools/elf-entry vmlinux)
-cflags-y			+= -I$(srctree)/arch/mips/include/asm/mach-generic
+cflags-y			+= -I$(srctree)arch/mips/include/asm/mach-generic
 drivers-$(CONFIG_PCI)		+= arch/mips/pci/
 
 #
@@ -492,7 +492,7 @@ define archhelp
 	echo '  Otherwise, the following default configurations are available:'
 endef
 
-generic_config_dir = $(srctree)/arch/$(ARCH)/configs/generic
+generic_config_dir = $(srctree)arch/$(ARCH)/configs/generic
 generic_defconfigs :=
 
 #
@@ -529,16 +529,16 @@ endef
 
 .PHONY: $(generic_defconfigs)
 $(generic_defconfigs):
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
-		-m -O $(objtree) $(srctree)/arch/$(ARCH)/configs/generic_defconfig $^ | \
+	$(Q)$(CONFIG_SHELL) $(srctree)scripts/kconfig/merge_config.sh \
+		-m -O $(objtree) $(srctree)arch/$(ARCH)/configs/generic_defconfig $^ | \
 		grep -Ev '^#'
 	$(Q)cp $(KCONFIG_CONFIG) $(objtree)/.config.$@
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig \
+	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig \
 		KCONFIG_CONFIG=$(objtree)/.config.$@ >/dev/null
-	$(Q)$(CONFIG_SHELL) $(srctree)/arch/$(ARCH)/tools/generic-board-config.sh \
-		$(srctree) $(objtree) $(objtree)/.config.$@ $(KCONFIG_CONFIG) \
+	$(Q)$(CONFIG_SHELL) $(srctree)arch/$(ARCH)/tools/generic-board-config.sh \
+		$(srctree:%/=%) $(objtree) $(objtree)/.config.$@ $(KCONFIG_CONFIG) \
 		"$(origin BOARDS)" $(BOARDS)
-	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
+	$(Q)$(MAKE) -f $(srctree)Makefile olddefconfig
 
 #
 # Prevent generic merge_config rules attempting to merge single fragments
@@ -580,4 +580,4 @@ pistachio_defconfig-y		:= 32r2el_defconfig BOARDS=marduk
 
 .PHONY: $(legacy_defconfigs)
 $(legacy_defconfigs):
-	$(Q)$(MAKE) -f $(srctree)/Makefile $($@-y)
+	$(Q)$(MAKE) -f $(srctree)Makefile $($@-y)
diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index 6cfdc149d3bc..7832709fc84b 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -10,7 +10,7 @@ PHONY := __archpost
 __archpost:
 
 -include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 CMD_LS3_LLSC = arch/mips/tools/loongson3-llsc-check
 quiet_cmd_ls3_llsc = LLSCCHK $@
diff --git a/arch/mips/boot/Makefile b/arch/mips/boot/Makefile
index 196c44fa72d9..a11867bc02fa 100644
--- a/arch/mips/boot/Makefile
+++ b/arch/mips/boot/Makefile
@@ -117,7 +117,7 @@ targets += vmlinux.its.S
 quiet_cmd_its_cat = CAT     $@
       cmd_its_cat = cat $(real-prereqs) >$@
 
-$(obj)/vmlinux.its.S: $(addprefix $(srctree)/arch/mips/$(PLATFORM)/,$(ITS_INPUTS)) FORCE
+$(obj)/vmlinux.its.S: $(addprefix $(srctree)arch/mips/$(PLATFORM)/,$(ITS_INPUTS)) FORCE
 	$(call if_changed,its_cat)
 
 targets += vmlinux.its
diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 6cc28173bee8..741f195bc9e8 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -12,7 +12,7 @@
 # Author: Wu Zhangjin <wuzhangjin@gmail.com>
 #
 
-include $(srctree)/arch/mips/Kbuild.platforms
+include $(srctree)arch/mips/Kbuild.platforms
 
 # set the default size of the mallocing area for decompressing
 BOOT_HEAP_SIZE := 0x400000
@@ -186,7 +186,7 @@ targets += ../vmlinuz.its.S
 quiet_cmd_its_cat = CAT     $@
       cmd_its_cat = cat $(real-prereqs) >$@
 
-$(objboot)/vmlinuz.its.S: $(addprefix $(srctree)/arch/mips/$(PLATFORM)/,$(ITS_INPUTS)) FORCE
+$(objboot)/vmlinuz.its.S: $(addprefix $(srctree)arch/mips/$(PLATFORM)/,$(ITS_INPUTS)) FORCE
 	$(call if_changed,its_cat)
 
 targets += ../vmlinuz.its
diff --git a/arch/mips/kernel/syscalls/Makefile b/arch/mips/kernel/syscalls/Makefile
index e6b21de65cca..c4a8cfb4cf0e 100644
--- a/arch/mips/kernel/syscalls/Makefile
+++ b/arch/mips/kernel/syscalls/Makefile
@@ -4,9 +4,9 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 
 $(shell mkdir -p $(uapi) $(kapi))
 
-syshdr := $(srctree)/scripts/syscallhdr.sh
-sysnr := $(srctree)/$(src)/syscallnr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+sysnr := $(srctree)$(src)/syscallnr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --offset __NR_Linux $< $@
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 805aeea2166e..6ce617de3cb7 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -2,7 +2,7 @@
 # Makefile for KVM support for MIPS
 #
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 ccflags-y += -Ivirt/kvm -Iarch/mips/kvm
 
diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index eb56581f6d73..c768741a677f 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -5,7 +5,7 @@
  KCSAN_SANITIZE			:= n
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 obj-vdso-y := elf.o vgettimeofday.o sigreturn.o
 
@@ -43,8 +43,8 @@ CFLAGS_vgettimeofday.o = -include $(c-gettimeofday-y)
 # config-n32-o32-env.c prepares the environment to build a 32bit vDSO
 # library on a 64bit kernel.
 # Note: Needs to be included before than the generic library.
-CFLAGS_vgettimeofday-o32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
-CFLAGS_vgettimeofday-n32.o = -include $(srctree)/$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
+CFLAGS_vgettimeofday-o32.o = -include $(srctree)$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
+CFLAGS_vgettimeofday-n32.o = -include $(srctree)$(src)/config-n32-o32-env.c -include $(c-gettimeofday-y)
 endif
 
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/nios2/boot/dts/Makefile b/arch/nios2/boot/dts/Makefile
index 1093e2111af0..9bfc2bc5fb6f 100644
--- a/arch/nios2/boot/dts/Makefile
+++ b/arch/nios2/boot/dts/Makefile
@@ -2,5 +2,5 @@
 
 obj-y := $(patsubst %.dts,%.dtb.o,$(CONFIG_NIOS2_DTB_SOURCE))
 
-dtstree		:= $(srctree:%/=%)/$(src)
+dtstree		:= $(srctree)$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
index 316f84f1d15c..2f25adc486ec 100644
--- a/arch/parisc/Makefile
+++ b/arch/parisc/Makefile
@@ -127,7 +127,7 @@ PALO := $(shell if (which palo 2>&1); then : ; \
 	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
 	fi)
 
-PALOCONF := $(shell if [ -f $(srctree)/palo.conf ]; then echo $(srctree)/palo.conf; \
+PALOCONF := $(shell if [ -f $(srctree)palo.conf ]; then echo $(srctree)palo.conf; \
 	else echo $(objtree)/palo.conf; \
 	fi)
 
@@ -138,7 +138,7 @@ palo lifimage: vmlinuz
 		false; \
 	fi
 	@if test ! -f "$(PALOCONF)"; then \
-		cp $(srctree)/arch/parisc/defpalo.conf $(objtree)/palo.conf; \
+		cp $(srctree)arch/parisc/defpalo.conf $(objtree)/palo.conf; \
 		echo 'A generic palo config file ($(objree)/palo.conf) has been created for you.'; \
 		echo 'You should check it and re-run "make palo".'; \
 		echo 'WARNING: the "lifimage" file is now placed in this directory by default!'; \
diff --git a/arch/parisc/kernel/syscalls/Makefile b/arch/parisc/kernel/syscalls/Makefile
index 8440c16dfb22..1c5be3e413ca 100644
--- a/arch/parisc/kernel/syscalls/Makefile
+++ b/arch/parisc/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis common,$* $< $@
diff --git a/arch/parisc/kernel/vdso32/Makefile b/arch/parisc/kernel/vdso32/Makefile
index 4459a48d2303..3216d26d3518 100644
--- a/arch/parisc/kernel/vdso32/Makefile
+++ b/arch/parisc/kernel/vdso32/Makefile
@@ -45,7 +45,7 @@ quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(CROSS32CC) $(c_flags) -c -fPIC -mno-fast-indirect-calls -o $@ $<
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/parisc/kernel/vdso64/Makefile b/arch/parisc/kernel/vdso64/Makefile
index f3d6045793f4..b29aab246852 100644
--- a/arch/parisc/kernel/vdso64/Makefile
+++ b/arch/parisc/kernel/vdso64/Makefile
@@ -40,7 +40,7 @@ quiet_cmd_vdso64as = VDSO64A $@
       cmd_vdso64as = $(CC) $(a_flags) -c -o $@ $<
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 051247027da0..7b482361b048 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -172,7 +172,7 @@ CFLAGS-y += $(CONFIG_TUNE_CPU)
 
 asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
-KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
+KBUILD_CPPFLAGS	+= -I $(srctree)arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
 KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
@@ -187,7 +187,7 @@ endif
 
 ifdef CONFIG_476FPE_ERR46
 	KBUILD_LDFLAGS_MODULE += --ppc476-workaround \
-		-T $(srctree)/arch/powerpc/platforms/44x/ppc476_modules.lds
+		-T $(srctree)arch/powerpc/platforms/44x/ppc476_modules.lds
 endif
 
 # No prefix or pcrel
@@ -255,7 +255,7 @@ PHONY += bootwrapper_install
 bootwrapper_install:
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
-include $(srctree)/scripts/Makefile.defconf
+include $(srctree)scripts/Makefile.defconf
 
 generated_configs += ppc64le_defconfig
 ppc64le_defconfig:
@@ -311,8 +311,8 @@ mpc86xx_smp_defconfig:
 
 generated_configs += ppc32_allmodconfig
 ppc32_allmodconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/book3s_32.config \
-		-f $(srctree)/Makefile allmodconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/book3s_32.config \
+		-f $(srctree)Makefile allmodconfig
 
 generated_configs += ppc_defconfig
 ppc_defconfig:
@@ -320,28 +320,28 @@ ppc_defconfig:
 
 generated_configs += ppc64le_allmodconfig
 ppc64le_allmodconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/le.config \
-		-f $(srctree)/Makefile allmodconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/le.config \
+		-f $(srctree)Makefile allmodconfig
 
 generated_configs += ppc64le_allnoconfig
 ppc64le_allnoconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/ppc64le.config \
-		-f $(srctree)/Makefile allnoconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/ppc64le.config \
+		-f $(srctree)Makefile allnoconfig
 
 generated_configs += ppc64_book3e_allmodconfig
 ppc64_book3e_allmodconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/85xx-64bit.config \
-		-f $(srctree)/Makefile allmodconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/85xx-64bit.config \
+		-f $(srctree)Makefile allmodconfig
 
 generated_configs += ppc32_randconfig
 ppc32_randconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/32-bit.config \
-		-f $(srctree)/Makefile randconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/32-bit.config \
+		-f $(srctree)Makefile randconfig
 
 generated_configs += ppc64_randconfig
 ppc64_randconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/powerpc/configs/64-bit.config \
-		-f $(srctree)/Makefile randconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/powerpc/configs/64-bit.config \
+		-f $(srctree)Makefile randconfig
 
 PHONY += $(generated_configs)
 
diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index ae5a4256b03d..61f56125d2d7 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -9,19 +9,19 @@ PHONY := __archpost
 __archpost:
 
 -include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 quiet_cmd_head_check = CHKHEAD $@
-      cmd_head_check = $(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/head_check.sh "$(NM)" "$@"
+      cmd_head_check = $(CONFIG_SHELL) $(srctree)arch/powerpc/tools/head_check.sh "$(NM)" "$@"
 
 quiet_cmd_relocs_check = CHKREL  $@
 ifdef CONFIG_PPC_BOOK3S_64
       cmd_relocs_check =						\
-	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@" ; \
-	$(BASH) $(srctree)/arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+	$(CONFIG_SHELL) $(srctree)arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@" ; \
+	$(BASH) $(srctree)arch/powerpc/tools/unrel_branch_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 else
       cmd_relocs_check =						\
-	$(CONFIG_SHELL) $(srctree)/arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+	$(CONFIG_SHELL) $(srctree)arch/powerpc/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 endif
 
 # `@true` prevents complaint when there is nothing to be done
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 968aee2025b8..bb3f791da736 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -98,8 +98,8 @@ ifeq ($(call cc-option-yn, -fstack-protector),y)
 BOOTCFLAGS	+= -fno-stack-protector
 endif
 
-BOOTCFLAGS	+= -include $(srctree)/include/linux/compiler_attributes.h
-BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)/$(obj)
+BOOTCFLAGS	+= -include $(srctree)include/linux/compiler_attributes.h
+BOOTCFLAGS	+= -I$(objtree)/$(obj) -I$(srctree)$(obj)
 
 DTC_FLAGS	?= -p 1024
 
@@ -195,30 +195,30 @@ obj-plat := $(addsuffix .o, $(basename $(addprefix $(obj)/, $(src-plat))))
 obj-plat: $(libfdt)
 
 quiet_cmd_copy_kern_src = COPY    $@
-      cmd_copy_kern_src = sed -f $(srctree)/arch/powerpc/boot/fixup-headers.sed $< > $@
+      cmd_copy_kern_src = sed -f $(srctree)arch/powerpc/boot/fixup-headers.sed $< > $@
 
-$(addprefix $(obj)/,$(zlib-y)): $(obj)/%: $(srctree)/lib/zlib_inflate/%
+$(addprefix $(obj)/,$(zlib-y)): $(obj)/%: $(srctree)lib/zlib_inflate/%
 	$(call cmd,copy_kern_src)
 
-$(addprefix $(obj)/,$(zlibheader-y)): $(obj)/%: $(srctree)/lib/zlib_inflate/%
+$(addprefix $(obj)/,$(zlibheader-y)): $(obj)/%: $(srctree)lib/zlib_inflate/%
 	$(call cmd,copy_kern_src)
 
-$(addprefix $(obj)/,$(zliblinuxheader-y)): $(obj)/%: $(srctree)/include/linux/%
+$(addprefix $(obj)/,$(zliblinuxheader-y)): $(obj)/%: $(srctree)include/linux/%
 	$(call cmd,copy_kern_src)
 
-$(addprefix $(obj)/,$(zlib-decomp-y)): $(obj)/%: $(srctree)/lib/%
+$(addprefix $(obj)/,$(zlib-decomp-y)): $(obj)/%: $(srctree)lib/%
 	$(call cmd,copy_kern_src)
 
 quiet_cmd_copy_libfdt = COPY    $@
       cmd_copy_libfdt = cp $< $@
 
-$(addprefix $(obj)/,$(libfdt) $(libfdtheader)): $(obj)/%: $(srctree)/scripts/dtc/libfdt/%
+$(addprefix $(obj)/,$(libfdt) $(libfdtheader)): $(obj)/%: $(srctree)scripts/dtc/libfdt/%
 	$(call cmd,copy_libfdt)
 
 $(obj)/empty.c:
 	$(Q)touch $@
 
-$(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)/$(src)/%.S
+$(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds : $(obj)/%: $(srctree)$(src)/%.S
 	$(Q)cp $< $@
 
 clean-files := $(zlib-) $(zlibheader-) $(zliblinuxheader-) \
@@ -234,7 +234,7 @@ quiet_cmd_bootas = BOOTAS  $@
 quiet_cmd_bootar = BOOTAR  $@
       cmd_bootar = $(BOOTAR) $(BOOTARFLAGS) $@.$$$$ $(real-prereqs); mv $@.$$$$ $@
 
-$(obj-libfdt): $(obj)/%.o: $(srctree)/scripts/dtc/libfdt/%.c FORCE
+$(obj-libfdt): $(obj)/%.o: $(srctree)scripts/dtc/libfdt/%.c FORCE
 	$(call if_changed_dep,bootcc)
 $(patsubst %.c,%.o, $(filter %.c, $(src-boot))): %.o: %.c FORCE
 	$(Q)mkdir -p $(dir $@)
@@ -252,9 +252,9 @@ targets		+= $(patsubst $(obj)/%,%,$(obj-boot) wrapper.a) zImage.lds
 extra-y		:= $(obj)/wrapper.a $(obj-plat) $(obj)/empty.o \
 		   $(obj)/zImage.lds $(obj)/zImage.coff.lds $(obj)/zImage.ps3.lds
 
-dtstree		:= $(srctree)/$(src)/dts
+dtstree		:= $(srctree)$(src)/dts
 
-wrapper		:=$(srctree)/$(src)/wrapper
+wrapper		:=$(srctree)$(src)/wrapper
 wrapperbits	:= $(extra-y) $(addprefix $(obj)/,addnote hack-coff mktree) \
 			$(wrapper) FORCE
 
@@ -483,13 +483,13 @@ quiet_cmd_install	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_OBJDIR)/%,%,$@)
       cmd_install	  = $(INSTALL)  -m0644 $(patsubst $(DESTDIR)$(WRAPPER_OBJDIR)/%,$(obj)/%,$@) $@
 
 quiet_cmd_install_dts	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,dts/%,$@)
-      cmd_install_dts	  = $(INSTALL)  -m0644 $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,$(srctree)/$(obj)/dts/%,$@) $@
+      cmd_install_dts	  = $(INSTALL)  -m0644 $(patsubst $(DESTDIR)$(WRAPPER_DTSDIR)/%,$(srctree)$(obj)/dts/%,$@) $@
 
 quiet_cmd_install_exe	  = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,%,$@)
       cmd_install_exe	  = $(INSTALL)  -m0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(obj)/%,$@) $@
 
 quiet_cmd_install_wrapper = INSTALL $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,%,$@)
-      cmd_install_wrapper = $(INSTALL)  -m0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(srctree)/$(obj)/%,$@) $@ ;\
+      cmd_install_wrapper = $(INSTALL)  -m0755 $(patsubst $(DESTDIR)$(WRAPPER_BINDIR)/%,$(srctree)$(obj)/%,$@) $@ ;\
 				sed -i $@ -e 's%^object=.*%object=$(WRAPPER_OBJDIR)%' \
 					  -e 's%^objbin=.*%objbin=$(WRAPPER_BINDIR)%' \
 
@@ -503,10 +503,10 @@ $(extra-installed)	: $(DESTDIR)$(WRAPPER_OBJDIR)/% : $(obj)/% | $(DESTDIR)$(WRAP
 $(hostprogs-installed)  : $(DESTDIR)$(WRAPPER_BINDIR)/% : $(obj)/% | $(DESTDIR)$(WRAPPER_BINDIR)
 	$(call cmd,install_exe)
 
-$(dts-installed)	: $(DESTDIR)$(WRAPPER_DTSDIR)/% : $(srctree)/$(obj)/dts/% | $(DESTDIR)$(WRAPPER_DTSDIR)
+$(dts-installed)	: $(DESTDIR)$(WRAPPER_DTSDIR)/% : $(srctree)$(obj)/dts/% | $(DESTDIR)$(WRAPPER_DTSDIR)
 	$(call cmd,install_dts)
 
-$(wrapper-installed): $(DESTDIR)$(WRAPPER_BINDIR) $(srctree)/$(obj)/wrapper | $(DESTDIR)$(WRAPPER_BINDIR)
+$(wrapper-installed): $(DESTDIR)$(WRAPPER_BINDIR) $(srctree)$(obj)/wrapper | $(DESTDIR)$(WRAPPER_BINDIR)
 	$(call cmd,install_wrapper)
 
 $(obj)/bootwrapper_install: $(all-installed)
diff --git a/arch/powerpc/boot/dts/Makefile b/arch/powerpc/boot/dts/Makefile
index 211b96e6ee6d..371b7313b5be 100644
--- a/arch/powerpc/boot/dts/Makefile
+++ b/arch/powerpc/boot/dts/Makefile
@@ -2,5 +2,5 @@
 
 subdir-y += fsl
 
-dtstree		:= $(srctree:%/=%)/$(src)
+dtstree		:= $(srctree)$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/boot/dts/fsl/Makefile b/arch/powerpc/boot/dts/fsl/Makefile
index ee7110fbbdbe..c54025b68b1e 100644
--- a/arch/powerpc/boot/dts/fsl/Makefile
+++ b/arch/powerpc/boot/dts/fsl/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
-dtstree		:= $(srctree:%/=%)/$(src)
+dtstree		:= $(srctree)$(src)
 dtb-$(CONFIG_OF_ALL_DTBS) := $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/powerpc/kernel/syscalls/Makefile b/arch/powerpc/kernel/syscalls/Makefile
index 9d7bd81510b8..a922dcbee6c4 100644
--- a/arch/powerpc/kernel/syscalls/Makefile
+++ b/arch/powerpc/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis $(abis) $< $@
diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso/Makefile
index 1b93655c2857..bc897b7918a7 100644
--- a/arch/powerpc/kernel/vdso/Makefile
+++ b/arch/powerpc/kernel/vdso/Makefile
@@ -3,7 +3,7 @@
 # List of files in the vdso, has to be asm only for now
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 obj-vdso32 = sigtramp32-32.o gettimeofday-32.o datapage-32.o cacheflush-32.o note-32.o getcpu-32.o
 obj-vdso64 = sigtramp64-64.o gettimeofday-64.o datapage-64.o cacheflush-64.o note-64.o getcpu-64.o
@@ -90,10 +90,10 @@ $(obj)/vgettimeofday-64.o: %-64.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
 # Generate VDSO offsets using helper script
-gen-vdso32sym := $(srctree)/$(src)/gen_vdso32_offsets.sh
+gen-vdso32sym := $(srctree)$(src)/gen_vdso32_offsets.sh
 quiet_cmd_vdso32sym = VDSO32SYM $@
       cmd_vdso32sym = $(NM) $< | $(gen-vdso32sym) | LC_ALL=C sort > $@
-gen-vdso64sym := $(srctree)/$(src)/gen_vdso64_offsets.sh
+gen-vdso64sym := $(srctree)$(src)/gen_vdso64_offsets.sh
 quiet_cmd_vdso64sym = VDSO64SYM $@
       cmd_vdso64sym = $(NM) $< | $(gen-vdso64sym) | LC_ALL=C sort > $@
 
diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
index 4bd9d1230869..1aa3983516d8 100644
--- a/arch/powerpc/kvm/Makefile
+++ b/arch/powerpc/kvm/Makefile
@@ -5,7 +5,7 @@
 
 ccflags-y := -Ivirt/kvm -Iarch/powerpc/kvm
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 common-objs-y += powerpc.o emulate_loadstore.o
 obj-$(CONFIG_KVM_EXIT_TIMING) += timing.o
diff --git a/arch/powerpc/platforms/cell/spufs/Makefile b/arch/powerpc/platforms/cell/spufs/Makefile
index 52e4c80ec8d0..e3cbde4e9794 100644
--- a/arch/powerpc/platforms/cell/spufs/Makefile
+++ b/arch/powerpc/platforms/cell/spufs/Makefile
@@ -15,8 +15,8 @@ SPU_CC		:= $(SPU_CROSS)gcc
 SPU_AS		:= $(SPU_CROSS)gcc
 SPU_LD		:= $(SPU_CROSS)ld
 SPU_OBJCOPY	:= $(SPU_CROSS)objcopy
-SPU_CFLAGS	:= -O2 -Wall -I$(srctree)/include -D__KERNEL__
-SPU_AFLAGS	:= -c -D__ASSEMBLY__ -I$(srctree)/include -D__KERNEL__
+SPU_CFLAGS	:= -O2 -Wall -I$(srctree)include -D__KERNEL__
+SPU_AFLAGS	:= -c -D__ASSEMBLY__ -I$(srctree)include -D__KERNEL__
 SPU_LDFLAGS	:= -N -Ttext=0x0
 
 $(obj)/switch.o: $(obj)/spu_save_dump.h $(obj)/spu_restore_dump.h
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 0b7d109258e7..267fbdd74613 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -179,18 +179,18 @@ install zinstall:
 
 PHONY += rv32_randconfig
 rv32_randconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/32-bit.config \
-		-f $(srctree)/Makefile randconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/riscv/configs/32-bit.config \
+		-f $(srctree)Makefile randconfig
 
 PHONY += rv64_randconfig
 rv64_randconfig:
-	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)/arch/riscv/configs/64-bit.config \
-		-f $(srctree)/Makefile randconfig
+	$(Q)$(MAKE) KCONFIG_ALLCONFIG=$(srctree)arch/riscv/configs/64-bit.config \
+		-f $(srctree)Makefile randconfig
 
 PHONY += rv32_defconfig
 rv32_defconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile defconfig 32-bit.config
+	$(Q)$(MAKE) -f $(srctree)Makefile defconfig 32-bit.config
 
 PHONY += rv32_nommu_virt_defconfig
 rv32_nommu_virt_defconfig:
-	$(Q)$(MAKE) -f $(srctree)/Makefile nommu_virt_defconfig 32-bit.config
+	$(Q)$(MAKE) -f $(srctree)Makefile nommu_virt_defconfig 32-bit.config
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index 829b9abc91f6..5908b0af8ea2 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -9,11 +9,11 @@ PHONY := __archpost
 __archpost:
 
 -include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
-	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
+	$(CONFIG_SHELL) $(srctree)arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 
 ifdef CONFIG_RELOCATABLE
 quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index 8e7fc0edf21d..f8e474384f9f 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -74,4 +74,4 @@ EFI_ZBOOT_PAYLOAD	:= Image
 EFI_ZBOOT_BFD_TARGET	:= elf$(BITS)-littleriscv
 EFI_ZBOOT_MACH_TYPE	:= RISCV$(BITS)
 
-include $(srctree)/drivers/firmware/efi/libstub/Makefile.zboot
+include $(srctree)drivers/firmware/efi/libstub/Makefile.zboot
diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 62fa393b2eb2..5dab506a39a8 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -58,7 +58,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
 # Generate VDSO offsets using helper script
-gen-compat_vdsosym := $(srctree)/$(src)/gen_compat_vdso_offsets.sh
+gen-compat_vdsosym := $(srctree)$(src)/gen_compat_vdso_offsets.sh
 quiet_cmd_compat_vdsosym = VDSOSYM $@
 	cmd_compat_vdsosym = $(NM) $< | $(gen-compat_vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 07915dc9279e..f3442904dd19 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -4,7 +4,7 @@
 KBUILD_CFLAGS	:= $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) -fpie \
 		   -Os -DDISABLE_BRANCH_PROFILING $(DISABLE_STACKLEAK_PLUGIN) \
 		   $(call cc-option,-mbranch-protection=none) \
-		   -I$(srctree)/scripts/dtc/libfdt -fno-stack-protector \
+		   -I$(srctree)scripts/dtc/libfdt -fno-stack-protector \
 		   -D__DISABLE_EXPORTS -ffreestanding \
 		   -fno-asynchronous-unwind-tables -fno-unwind-tables \
 		   $(call cc-option,-fno-addrsig)
@@ -26,13 +26,13 @@ $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 $(obj)/%.pi.o: $(obj)/%.o FORCE
 	$(call if_changed,objcopy)
 
-$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
+$(obj)/lib-%.o: $(srctree)lib/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/string.o: $(srctree)/lib/string.c FORCE
+$(obj)/string.o: $(srctree)lib/string.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
+$(obj)/ctype.o: $(srctree)lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 9b517fe1b8a8..e40437f074eb 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -2,7 +2,7 @@
 # Copied from arch/tile/kernel/vdso/Makefile
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 # Symbols present in the vdso
 vdso-syms  = rt_sigreturn
 ifdef CONFIG_64BIT
@@ -59,7 +59,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 	$(call if_changed,objcopy)
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index c9646521f113..fd79ef531b7f 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -3,9 +3,9 @@
 # Makefile for RISC-V KVM support
 #
 
-ccflags-y += -I $(srctree)/$(src)
+ccflags-y += -I $(srctree)$(src)
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 obj-$(CONFIG_KVM) += kvm.o
 
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index 280b0eb352b8..2e1967181564 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -7,28 +7,28 @@ purgatory-y += strcmp.o strlen.o strncmp.o
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 
-$(obj)/string.o: $(srctree)/lib/string.c FORCE
+$(obj)/string.o: $(srctree)lib/string.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
+$(obj)/ctype.o: $(srctree)lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
+$(obj)/memcpy.o: $(srctree)arch/riscv/lib/memcpy.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-$(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
+$(obj)/memset.o: $(srctree)arch/riscv/lib/memset.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-$(obj)/strcmp.o: $(srctree)/arch/riscv/lib/strcmp.S FORCE
+$(obj)/strcmp.o: $(srctree)arch/riscv/lib/strcmp.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-$(obj)/strlen.o: $(srctree)/arch/riscv/lib/strlen.S FORCE
+$(obj)/strlen.o: $(srctree)arch/riscv/lib/strlen.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-$(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S FORCE
+$(obj)/strncmp.o: $(srctree)arch/riscv/lib/strncmp.S FORCE
 	$(call if_changed_rule,as_o_S)
 
-$(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
+$(obj)/sha256.o: $(srctree)lib/crypto/sha256.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
diff --git a/arch/s390/Makefile b/arch/s390/Makefile
index 73873e451686..941a94546f9a 100644
--- a/arch/s390/Makefile
+++ b/arch/s390/Makefile
@@ -60,7 +60,7 @@ cflags-$(CONFIG_MARCH_Z14_TUNE)		+= -mtune=z14
 cflags-$(CONFIG_MARCH_Z15_TUNE)		+= -mtune=z15
 cflags-$(CONFIG_MARCH_Z16_TUNE)		+= -mtune=z16
 
-cflags-y += -Wa,-I$(srctree)/arch/$(ARCH)/include
+cflags-y += -Wa,-I$(srctree)arch/$(ARCH)/include
 
 #
 # Prevent tail-call optimizations, to get clearer backtraces:
diff --git a/arch/s390/boot/Makefile b/arch/s390/boot/Makefile
index c7c81e5f9218..64336b5ef3ba 100644
--- a/arch/s390/boot/Makefile
+++ b/arch/s390/boot/Makefile
@@ -33,7 +33,7 @@ CFLAGS_REMOVE_sclp_early_core.o	+= $(CC_FLAGS_MARCH)
 CFLAGS_sclp_early_core.o	+= $(CC_FLAGS_MARCH_MINIMUM)
 endif
 
-CFLAGS_sclp_early_core.o += -I$(srctree)/drivers/s390/char
+CFLAGS_sclp_early_core.o += -I$(srctree)drivers/s390/char
 
 obj-y	:= head.o als.o startup.o physmem_info.o ipl_parm.o ipl_report.o vmem.o
 obj-y	+= string.o ebcdic.o sclp_early_core.o mem.o ipl_vmparm.o cmdline.o
diff --git a/arch/s390/kernel/syscalls/Makefile b/arch/s390/kernel/syscalls/Makefile
index fb85e797946d..0cde9f928732 100644
--- a/arch/s390/kernel/syscalls/Makefile
+++ b/arch/s390/kernel/syscalls/Makefile
@@ -4,8 +4,8 @@ gen	:= arch/$(ARCH)/include/generated
 kapi	:= $(gen)/asm
 uapi	:= $(gen)/uapi/asm
 
-syscall	:= $(srctree)/$(src)/syscall.tbl
-systbl	:= $(srctree)/$(src)/syscalltbl
+syscall	:= $(srctree)$(src)/syscall.tbl
+systbl	:= $(srctree)$(src)/syscalltbl
 
 gen-y := $(kapi)/syscall_table.h
 kapi-hdrs-y := $(kapi)/unistd_nr.h
diff --git a/arch/s390/kernel/vdso32/Makefile b/arch/s390/kernel/vdso32/Makefile
index caec7db6f966..85d0a4401801 100644
--- a/arch/s390/kernel/vdso32/Makefile
+++ b/arch/s390/kernel/vdso32/Makefile
@@ -4,7 +4,7 @@
 KCOV_INSTRUMENT := n
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 obj-vdso32 = vdso_user_wrapper-32.o note-32.o
 
 # Build rules
@@ -62,7 +62,7 @@ quiet_cmd_vdso32cc = VDSO32C $@
       cmd_vdso32cc = $(CC) $(c_flags) -c -o $@ $<
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/s390/kernel/vdso64/Makefile b/arch/s390/kernel/vdso64/Makefile
index e3c9085f8fa7..7d3098e0cf80 100644
--- a/arch/s390/kernel/vdso64/Makefile
+++ b/arch/s390/kernel/vdso64/Makefile
@@ -4,7 +4,7 @@
 KCOV_INSTRUMENT := n
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 obj-vdso64 = vdso_user_wrapper.o note.o
 obj-cvdso64 = vdso64_generic.o getcpu.o
 VDSO_CFLAGS_REMOVE := -pg $(CC_FLAGS_FTRACE) $(CC_FLAGS_EXPOLINE) $(CC_FLAGS_CHECK_STACK)
@@ -71,7 +71,7 @@ quiet_cmd_vdso64cc = VDSO64C $@
       cmd_vdso64cc = $(CC) $(c_flags) -c -o $@ $<
 
 # Generate VDSO offsets using helper script
-gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
+gen-vdsosym := $(srctree)$(src)/gen_vdso_offsets.sh
 quiet_cmd_vdsosym = VDSOSYM $@
 	cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
 
diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
index 02217fb4ae10..18f932f79fe9 100644
--- a/arch/s390/kvm/Makefile
+++ b/arch/s390/kvm/Makefile
@@ -3,7 +3,7 @@
 #
 # Copyright IBM Corp. 2008
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
 
diff --git a/arch/s390/purgatory/Makefile b/arch/s390/purgatory/Makefile
index 4e930f566878..9e09a58b7a45 100644
--- a/arch/s390/purgatory/Makefile
+++ b/arch/s390/purgatory/Makefile
@@ -7,12 +7,12 @@ purgatory-y := head.o purgatory.o string.o sha256.o mem.o
 targets += $(purgatory-y) purgatory.lds purgatory purgatory.chk purgatory.ro
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 
-$(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
+$(obj)/sha256.o: $(srctree)lib/crypto/sha256.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
 
-$(obj)/mem.o: $(srctree)/arch/s390/lib/mem.S FORCE
+$(obj)/mem.o: $(srctree)arch/s390/lib/mem.S FORCE
 	$(call if_changed_rule,as_o_S)
 
 KCOV_INSTRUMENT := n
diff --git a/arch/s390/tools/Makefile b/arch/s390/tools/Makefile
index f9dd47ff9ac4..54405a082117 100644
--- a/arch/s390/tools/Makefile
+++ b/arch/s390/tools/Makefile
@@ -18,7 +18,7 @@ HOSTCFLAGS_gen_facilities.o += $(LINUXINCLUDE)
 filechk_facility-defs.h = $(obj)/gen_facilities
 
 filechk_dis-defs.h = \
-	$(obj)/gen_opcode_table < $(srctree)/arch/$(ARCH)/tools/opcodes.txt
+	$(obj)/gen_opcode_table < $(srctree)arch/$(ARCH)/tools/opcodes.txt
 
 $(kapi)/facility-defs.h: $(obj)/gen_facilities FORCE
 	$(call filechk,facility-defs.h)
diff --git a/arch/sh/Makefile b/arch/sh/Makefile
index cab2f9c011a8..0453767cb0ab 100644
--- a/arch/sh/Makefile
+++ b/arch/sh/Makefile
@@ -145,7 +145,7 @@ cpuincdir-y			+= cpu-common	# Must be last
 
 drivers-y			+= arch/sh/drivers/
 
-KBUILD_CPPFLAGS		+= $(addprefix -I $(srctree)/arch/sh/include/, $(cpuincdir-y) $(machdir-y))
+KBUILD_CPPFLAGS		+= $(addprefix -I $(srctree)arch/sh/include/, $(cpuincdir-y) $(machdir-y))
 KBUILD_CFLAGS		+= -pipe $(cflags-y)
 KBUILD_AFLAGS		+= $(cflags-y)
 
diff --git a/arch/sh/kernel/syscalls/Makefile b/arch/sh/kernel/syscalls/Makefile
index b265e4bc16c2..5571f3cf66fd 100644
--- a/arch/sh/kernel/syscalls/Makefile
+++ b/arch/sh/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
diff --git a/arch/sparc/kernel/syscalls/Makefile b/arch/sparc/kernel/syscalls/Makefile
index 8440c16dfb22..1c5be3e413ca 100644
--- a/arch/sparc/kernel/syscalls/Makefile
+++ b/arch/sparc/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr --abis common,$* $< $@
diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 7f5eedf1f5e0..11311caa099b 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -28,7 +28,7 @@ VDSO_LDFLAGS_vdso.lds = -m elf64_sparc -soname linux-vdso.so.1 --no-undefined \
 $(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
 	$(call if_changed,vdso)
 
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include
+HOST_EXTRACFLAGS += -I$(srctree)tools/include
 hostprogs += vdso2c
 
 quiet_cmd_vdso2c = VDSO2C  $@
@@ -102,7 +102,7 @@ quiet_cmd_vdso = VDSO    $@
       cmd_vdso = $(LD) -nostdlib -o $@ \
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^) && \
-		sh $(srctree)/$(src)/checkundef.sh '$(OBJDUMP)' '$@'
+		sh $(srctree)$(src)/checkundef.sh '$(OBJDUMP)' '$@'
 
 VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic
 GCOV_PROFILE := n
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 34957dcb88b9..6f8eb24b04d3 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -22,7 +22,7 @@ ARCH_DIR := arch/um
 # features.
 SHELL := /bin/bash
 
-MODE_INCLUDE	+= -I$(srctree)/$(ARCH_DIR)/include/shared/skas
+MODE_INCLUDE	+= -I$(srctree)$(ARCH_DIR)/include/shared/skas
 
 HEADER_ARCH 	:= $(SUBARCH)
 
@@ -36,15 +36,15 @@ endif
 
 HOST_DIR := arch/$(HEADER_ARCH)
 
-include $(srctree)/$(ARCH_DIR)/Makefile-skas
-include $(srctree)/$(HOST_DIR)/Makefile.um
+include $(srctree)$(ARCH_DIR)/Makefile-skas
+include $(srctree)$(HOST_DIR)/Makefile.um
 
 core-y += $(HOST_DIR)/um/
 
 SHARED_HEADERS	:= $(ARCH_DIR)/include/shared
-ARCH_INCLUDE	:= -I$(srctree)/$(SHARED_HEADERS)
-ARCH_INCLUDE	+= -I$(srctree)/$(HOST_DIR)/um/shared
-KBUILD_CPPFLAGS += -I$(srctree)/$(HOST_DIR)/um
+ARCH_INCLUDE	:= -I$(srctree)$(SHARED_HEADERS)
+ARCH_INCLUDE	+= -I$(srctree)$(HOST_DIR)/um/shared
+KBUILD_CPPFLAGS += -I$(srctree)$(HOST_DIR)/um
 
 # -Dvmap=kernel_vmap prevents anything from referencing the libpcap.o symbol so
 # named - it's a common symbol in libpcap, so we get a binary which crashes.
@@ -69,14 +69,14 @@ KBUILD_AFLAGS += $(ARCH_INCLUDE)
 
 USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		$(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
-		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
+		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)include \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__
 
 #This will adjust *FLAGS accordingly to the platform.
-include $(srctree)/$(ARCH_DIR)/Makefile-os-Linux
+include $(srctree)$(ARCH_DIR)/Makefile-os-Linux
 
-KBUILD_CPPFLAGS += -I$(srctree)/$(HOST_DIR)/include \
-		   -I$(srctree)/$(HOST_DIR)/include/uapi \
+KBUILD_CPPFLAGS += -I$(srctree)$(HOST_DIR)/include \
+		   -I$(srctree)$(HOST_DIR)/include/uapi \
 		   -I$(objtree)/$(HOST_DIR)/include/generated \
 		   -I$(objtree)/$(HOST_DIR)/include/generated/uapi
 
@@ -109,7 +109,7 @@ define archhelp
 endef
 
 archheaders:
-	$(Q)$(MAKE) -f $(srctree)/Makefile ARCH=$(HEADER_ARCH) asm-generic archheaders
+	$(Q)$(MAKE) -f $(srctree)Makefile ARCH=$(HEADER_ARCH) asm-generic archheaders
 
 archprepare:
 	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
diff --git a/arch/um/drivers/Makefile b/arch/um/drivers/Makefile
index 0e6af81096fd..b7de537582c7 100644
--- a/arch/um/drivers/Makefile
+++ b/arch/um/drivers/Makefile
@@ -74,4 +74,4 @@ CFLAGS_null.o = -DDEV_NULL=$(DEV_NULL_PATH)
 
 CFLAGS_xterm.o += '-DCONFIG_XTERM_CHAN_DEFAULT_EMULATOR="$(CONFIG_XTERM_CHAN_DEFAULT_EMULATOR)"'
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/um/kernel/Makefile b/arch/um/kernel/Makefile
index 811188be954c..c99b3d0b1014 100644
--- a/arch/um/kernel/Makefile
+++ b/arch/um/kernel/Makefile
@@ -29,7 +29,7 @@ obj-$(CONFIG_GENERIC_PCI_IOMAP) += ioport.o
 
 USER_OBJS := config.o
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
 
 targets := config.c config.tmp capflags.c
 
@@ -47,7 +47,7 @@ $(obj)/config.c: $(src)/config.c.in $(obj)/config.tmp FORCE
 	$(call if_changed,quote2)
 
 quiet_cmd_mkcapflags = MKCAP   $@
-      cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)/$(src)/../../x86/kernel/cpu/mkcapflags.sh $@ $^
+      cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)$(src)/../../x86/kernel/cpu/mkcapflags.sh $@ $^
 
 cpufeature = $(src)/../../x86/include/asm/cpufeatures.h
 vmxfeature = $(src)/../../x86/include/asm/vmxfeatures.h
diff --git a/arch/um/kernel/skas/Makefile b/arch/um/kernel/skas/Makefile
index f93972a25765..929dda4578bb 100644
--- a/arch/um/kernel/skas/Makefile
+++ b/arch/um/kernel/skas/Makefile
@@ -14,4 +14,4 @@ UNPROFILE_OBJS := clone.o
 
 KCOV_INSTRUMENT := n
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/um/os-Linux/Makefile b/arch/um/os-Linux/Makefile
index 544e0b344c75..7f380b0877bc 100644
--- a/arch/um/os-Linux/Makefile
+++ b/arch/um/os-Linux/Makefile
@@ -18,4 +18,4 @@ USER_OBJS := $(user-objs-y) elf_aux.o execvp.o file.o helper.o irq.o \
 	main.o mem.o process.o registers.o sigio.o signal.o start_up.o time.o \
 	tty.o umid.o util.o
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/um/os-Linux/drivers/Makefile b/arch/um/os-Linux/drivers/Makefile
index cf2d75bb1884..0ea1e47391d3 100644
--- a/arch/um/os-Linux/drivers/Makefile
+++ b/arch/um/os-Linux/drivers/Makefile
@@ -10,4 +10,4 @@ obj-y =
 obj-$(CONFIG_UML_NET_ETHERTAP) += ethertap.o
 obj-$(CONFIG_UML_NET_TUNTAP) += tuntap.o
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/um/os-Linux/skas/Makefile b/arch/um/os-Linux/skas/Makefile
index 75f11989d2e9..38b63b8bcf43 100644
--- a/arch/um/os-Linux/skas/Makefile
+++ b/arch/um/os-Linux/skas/Makefile
@@ -7,4 +7,4 @@ obj-y := mem.o process.o
 
 USER_OBJS := $(obj-y)
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/um/scripts/Makefile.rules b/arch/um/scripts/Makefile.rules
index a8b7d9dab0a6..80ef520399f5 100644
--- a/arch/um/scripts/Makefile.rules
+++ b/arch/um/scripts/Makefile.rules
@@ -9,7 +9,7 @@ USER_OBJS += $(filter %_user.o,$(obj-y) $(USER_SINGLE_OBJS))
 USER_OBJS := $(foreach file,$(USER_OBJS),$(obj)/$(file))
 
 $(USER_OBJS:.o=.%): \
-	c_flags = -Wp,-MD,$(depfile) $(USER_CFLAGS) -include $(srctree)/include/linux/kern_levels.h -include user.h $(CFLAGS_$(basetarget).o)
+	c_flags = -Wp,-MD,$(depfile) $(USER_CFLAGS) -include $(srctree)include/linux/kern_levels.h -include user.h $(CFLAGS_$(basetarget).o)
 
 # These are like USER_OBJS but filter USER_CFLAGS through unprofile instead of
 # using it directly.
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index da8f3caf2781..473c46ffb7f3 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -106,7 +106,7 @@ ifeq ($(CONFIG_X86_32),y)
         KBUILD_CFLAGS += $(cc_stack_align4)
 
         # CPU-specific tuning. Anything which can be shared with UML should go here.
-        include $(srctree)/arch/x86/Makefile_32.cpu
+        include $(srctree)arch/x86/Makefile_32.cpu
         KBUILD_CFLAGS += $(cflags-y)
 
         # temporary until string.h is fixed
@@ -311,12 +311,12 @@ endif
 
 ifdef CONFIG_UNWINDER_ORC
 orc_hash_h := arch/$(SRCARCH)/include/generated/asm/orc_hash.h
-orc_hash_sh := $(srctree)/scripts/orc_hash.sh
+orc_hash_sh := $(srctree)scripts/orc_hash.sh
 targets += $(orc_hash_h)
 quiet_cmd_orc_hash = GEN     $@
       cmd_orc_hash = mkdir -p $(dir $@); \
 		     $(CONFIG_SHELL) $(orc_hash_sh) < $< > $@
-$(orc_hash_h): $(srctree)/arch/x86/include/asm/orc_types.h $(orc_hash_sh) FORCE
+$(orc_hash_h): $(srctree)arch/x86/include/asm/orc_types.h $(orc_hash_sh) FORCE
 	$(call if_changed,orc_hash)
 archprepare: $(orc_hash_h)
 endif
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index fef2e977cc7d..4933f911e0d8 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -10,7 +10,7 @@ PHONY := __archpost
 __archpost:
 
 -include include/config/auto.conf
-include $(srctree)/scripts/Kbuild.include
+include $(srctree)scripts/Kbuild.include
 
 CMD_RELOCS = arch/x86/tools/relocs
 OUT_RELOCS = arch/x86/boot/compressed
diff --git a/arch/x86/Makefile.um b/arch/x86/Makefile.um
index 2106a2bd152b..211ac1bec33e 100644
--- a/arch/x86/Makefile.um
+++ b/arch/x86/Makefile.um
@@ -28,7 +28,7 @@ LDS_EXTRA		:= -Ui386
 export LDS_EXTRA
 
 # First of all, tune CFLAGS for the specific CPU. This actually sets cflags-y.
-include $(srctree)/arch/x86/Makefile_32.cpu
+include $(srctree)arch/x86/Makefile_32.cpu
 
 # prevent gcc from keeping the stack 16 byte aligned. Taken from i386.
 cflags-y += $(call cc-option,-mpreferred-stack-boundary=2)
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 3cece19b7473..6be0a94013cf 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -51,7 +51,7 @@ targets		+= $(setup-y)
 hostprogs	:= tools/build
 hostprogs	+= mkcpustr
 
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include \
+HOST_EXTRACFLAGS += -I$(srctree)tools/include \
 		    -include include/generated/autoconf.h \
 	            -D__EXPORTED_HEADERS__
 
@@ -67,7 +67,7 @@ targets += cpustr.h
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
-KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 GCOV_PROFILE := n
 UBSAN_SANITIZE := n
@@ -129,7 +129,7 @@ targets += mtools.conf
 # genimage.sh requires bash, but it also has a bunch of other
 # external dependencies.
 quiet_cmd_genimage = GENIMAGE $3
-cmd_genimage = $(BASH) $(srctree)/$(src)/genimage.sh $2 $3 $(obj)/bzImage \
+cmd_genimage = $(BASH) $(srctree)$(src)/genimage.sh $2 $3 $(obj)/bzImage \
 		$(obj)/mtools.conf '$(FDARGS)' $(FDINITRD)
 
 PHONY += bzdisk fdimage fdimage144 fdimage288 hdimage isoimage
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index f19c038409aa..1cf9666f3d6e 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -46,12 +46,12 @@ KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += -Wno-pointer-sign
-KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.
 KBUILD_CFLAGS += $(call cc-option,-Wa$(comma)-mrelax-relocations=no)
-KBUILD_CFLAGS += -include $(srctree)/include/linux/hidden.h
+KBUILD_CFLAGS += -include $(srctree)include/linux/hidden.h
 
 # sev.c indirectly includes inat-table.h which is generated during
 # compilation and stored in $(objtree). Add the directory to the includes so
@@ -82,7 +82,7 @@ endif
 LDFLAGS_vmlinux += -T
 
 hostprogs	:= mkpiggy
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include
+HOST_EXTRACFLAGS += -I$(srctree)tools/include
 
 sed-voffset := -e 's/^\([0-9a-fA-F]*\) [ABCDGRSTVW] \(_text\|__bss_start\|_end\)$$/\#define VO_\2 _AC(0x\1,UL)/p'
 
diff --git a/arch/x86/entry/syscalls/Makefile b/arch/x86/entry/syscalls/Makefile
index eca5d6eff132..b44920f88370 100644
--- a/arch/x86/entry/syscalls/Makefile
+++ b/arch/x86/entry/syscalls/Makefile
@@ -8,8 +8,8 @@ $(shell mkdir -p $(out) $(uapi))
 syscall32 := $(src)/syscall_32.tbl
 syscall64 := $(src)/syscall_64.tbl
 
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 offset :=
 prefix :=
 
@@ -57,10 +57,10 @@ $(out)/syscalls_x32.h: abis := common,x32
 $(out)/syscalls_x32.h: $(syscall64) $(systbl) FORCE
 	$(call if_changed,systbl)
 
-$(out)/xen-hypercalls.h: $(srctree)/scripts/xen-hypercalls.sh FORCE
+$(out)/xen-hypercalls.h: $(srctree)scripts/xen-hypercalls.sh FORCE
 	$(call if_changed,hypercalls)
 
-$(out)/xen-hypercalls.h: $(srctree)/include/xen/interface/xen*.h
+$(out)/xen-hypercalls.h: $(srctree)include/xen/interface/xen*.h
 
 uapisyshdr-y			+= unistd_32.h unistd_64.h unistd_x32.h
 syshdr-y			+= syscalls_32.h
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index b1b8dd1608f7..ac8d18aa861c 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -4,7 +4,7 @@
 #
 
 # Include the generic Makefile to check the built vdso.
-include $(srctree)/lib/vdso/Makefile
+include $(srctree)lib/vdso/Makefile
 
 # Sanitizer runtimes are unavailable and cannot be linked here.
 KASAN_SANITIZE			:= n
@@ -69,7 +69,7 @@ VDSO_LDFLAGS_vdso.lds = -m elf_x86_64 -soname linux-vdso.so.1 --no-undefined \
 $(obj)/vdso64.so.dbg: $(obj)/vdso.lds $(vobjs) FORCE
 	$(call if_changed,vdso_and_check)
 
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include -I$(srctree)/include/uapi -I$(srctree)/arch/$(SUBARCH)/include/uapi
+HOST_EXTRACFLAGS += -I$(srctree)tools/include -I$(srctree)include/uapi -I$(srctree)arch/$(SUBARCH)/include/uapi
 hostprogs += vdso2c
 
 quiet_cmd_vdso2c = VDSO2C  $@
@@ -182,7 +182,7 @@ quiet_cmd_vdso = VDSO    $@
       cmd_vdso = $(LD) -o $@ \
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^) && \
-		 sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
+		 sh $(srctree)$(src)/checkundef.sh '$(NM)' '$@'
 
 VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 \
 	$(call ld-option, --eh-frame-hdr) -Bsymbolic -z noexecstack
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0000325ab98f..afe50b80bed3 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -39,7 +39,7 @@ KMSAN_SANITIZE_nmi.o					:= n
 KCOV_INSTRUMENT_head$(BITS).o				:= n
 KCOV_INSTRUMENT_sev.o					:= n
 
-CFLAGS_irq.o := -I $(srctree)/$(src)/../include/asm/trace
+CFLAGS_irq.o := -I $(srctree)$(src)/../include/asm/trace
 
 obj-y			+= head_$(BITS).o
 obj-y			+= head$(BITS).o
diff --git a/arch/x86/kernel/cpu/Makefile b/arch/x86/kernel/cpu/Makefile
index 93eabf544031..86d19a37b592 100644
--- a/arch/x86/kernel/cpu/Makefile
+++ b/arch/x86/kernel/cpu/Makefile
@@ -57,7 +57,7 @@ obj-$(CONFIG_ACRN_GUEST)		+= acrn.o
 obj-$(CONFIG_DEBUG_FS)			+= debugfs.o
 
 quiet_cmd_mkcapflags = MKCAP   $@
-      cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)/$(src)/mkcapflags.sh $@ $^
+      cmd_mkcapflags = $(CONFIG_SHELL) $(srctree)$(src)/mkcapflags.sh $@ $^
 
 cpufeature = $(src)/../../include/asm/cpufeatures.h
 vmxfeature = $(src)/../../include/asm/vmxfeatures.h
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index 475b5fa917a6..bad2410edf8e 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -1,13 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y += -I $(srctree)/arch/x86/kvm
+ccflags-y += -I $(srctree)arch/x86/kvm
 ccflags-$(CONFIG_KVM_WERROR) += -Werror
 
 ifeq ($(CONFIG_FRAME_POINTER),y)
 OBJECT_FILES_NON_STANDARD_vmenter.o := y
 endif
 
-include $(srctree)/virt/kvm/Makefile.kvm
+include $(srctree)virt/kvm/Makefile.kvm
 
 kvm-y			+= x86.o emulate.o i8259.o irq.o lapic.o \
 			   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index ea3a28e7b613..08fedf5cf823 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -27,8 +27,8 @@ endif
 CFLAGS_cmdline.o := -fno-stack-protector -fno-jump-tables
 endif
 
-inat_tables_script = $(srctree)/arch/x86/tools/gen-insn-attr-x86.awk
-inat_tables_maps = $(srctree)/arch/x86/lib/x86-opcode-map.txt
+inat_tables_script = $(srctree)arch/x86/tools/gen-insn-attr-x86.awk
+inat_tables_maps = $(srctree)arch/x86/lib/x86-opcode-map.txt
 quiet_cmd_inat_tables = GEN     $@
       cmd_inat_tables = $(AWK) -f $(inat_tables_script) $(inat_tables_maps) > $@
 
diff --git a/arch/x86/mm/Makefile b/arch/x86/mm/Makefile
index c80febc44cd2..ef2a1c8f9950 100644
--- a/arch/x86/mm/Makefile
+++ b/arch/x86/mm/Makefile
@@ -33,7 +33,7 @@ obj-y				+= pat/
 CFLAGS_physaddr.o		:= -fno-stack-protector
 CFLAGS_mem_encrypt_identity.o	:= -fno-stack-protector
 
-CFLAGS_fault.o := -I $(srctree)/$(src)/../include/asm/trace
+CFLAGS_fault.o := -I $(srctree)$(src)/../include/asm/trace
 
 obj-$(CONFIG_X86_32)		+= pgtable_32.o iomap_32.o
 
diff --git a/arch/x86/purgatory/Makefile b/arch/x86/purgatory/Makefile
index 08aa0f25f12a..6e638431c9ad 100644
--- a/arch/x86/purgatory/Makefile
+++ b/arch/x86/purgatory/Makefile
@@ -6,10 +6,10 @@ purgatory-y := purgatory.o stack.o setup-x86_$(BITS).o sha256.o entry64.o string
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
 
-$(obj)/string.o: $(srctree)/arch/x86/boot/compressed/string.c FORCE
+$(obj)/string.o: $(srctree)arch/x86/boot/compressed/string.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-$(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
+$(obj)/sha256.o: $(srctree)lib/crypto/sha256.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
diff --git a/arch/x86/realmode/rm/Makefile b/arch/x86/realmode/rm/Makefile
index f614009d3e4e..61f038b91bda 100644
--- a/arch/x86/realmode/rm/Makefile
+++ b/arch/x86/realmode/rm/Makefile
@@ -73,7 +73,7 @@ $(obj)/realmode.relocs: $(obj)/realmode.elf FORCE
 # ---------------------------------------------------------------------------
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP -D_WAKEUP \
-		   -I$(srctree)/arch/x86/boot
+		   -I$(srctree)arch/x86/boot
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 GCOV_PROFILE := n
diff --git a/arch/x86/tools/Makefile b/arch/x86/tools/Makefile
index 7278e2545c35..224c6f3c48a5 100644
--- a/arch/x86/tools/Makefile
+++ b/arch/x86/tools/Makefile
@@ -13,8 +13,8 @@ else
   posttest_64bit = -n
 endif
 
-reformatter = $(srctree)/arch/x86/tools/objdump_reformat.awk
-chkobjdump = $(srctree)/arch/x86/tools/chkobjdump.awk
+reformatter = $(srctree)arch/x86/tools/objdump_reformat.awk
+chkobjdump = $(srctree)arch/x86/tools/chkobjdump.awk
 
 quiet_cmd_posttest = TEST    $@
       cmd_posttest = $(OBJDUMP) -d -j .text $(objtree)/vmlinux | $(AWK) -f $(reformatter) | $(obj)/insn_decoder_test $(posttest_64bit) $(posttest_verbose)
@@ -29,16 +29,16 @@ posttest: $(obj)/insn_decoder_test vmlinux $(obj)/insn_sanity
 hostprogs += insn_decoder_test insn_sanity
 
 # -I needed for generated C source and C source which in the kernel tree.
-HOSTCFLAGS_insn_decoder_test.o := -Wall -I$(srctree)/tools/arch/x86/lib/ -I$(srctree)/tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
+HOSTCFLAGS_insn_decoder_test.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
 
-HOSTCFLAGS_insn_sanity.o := -Wall -I$(srctree)/tools/arch/x86/lib/ -I$(srctree)/tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
+HOSTCFLAGS_insn_sanity.o := -Wall -I$(srctree)tools/arch/x86/lib/ -I$(srctree)tools/arch/x86/include/ -I$(objtree)/arch/x86/lib/
 
 # Dependencies are also needed.
-$(obj)/insn_decoder_test.o: $(srctree)/tools/arch/x86/lib/insn.c $(srctree)/tools/arch/x86/lib/inat.c $(srctree)/tools/arch/x86/include/asm/inat_types.h $(srctree)/tools/arch/x86/include/asm/inat.h $(srctree)/tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
+$(obj)/insn_decoder_test.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
 
-$(obj)/insn_sanity.o: $(srctree)/tools/arch/x86/lib/insn.c $(srctree)/tools/arch/x86/lib/inat.c $(srctree)/tools/arch/x86/include/asm/inat_types.h $(srctree)/tools/arch/x86/include/asm/inat.h $(srctree)/tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
+$(obj)/insn_sanity.o: $(srctree)tools/arch/x86/lib/insn.c $(srctree)tools/arch/x86/lib/inat.c $(srctree)tools/arch/x86/include/asm/inat_types.h $(srctree)tools/arch/x86/include/asm/inat.h $(srctree)tools/arch/x86/include/asm/insn.h $(objtree)/arch/x86/lib/inat-tables.c
 
-HOST_EXTRACFLAGS += -I$(srctree)/tools/include
+HOST_EXTRACFLAGS += -I$(srctree)tools/include
 hostprogs	+= relocs
 relocs-objs     := relocs_32.o relocs_64.o relocs_common.o
 PHONY += relocs
diff --git a/arch/x86/um/Makefile b/arch/x86/um/Makefile
index 8bc72a51b257..e0d577fa57bd 100644
--- a/arch/x86/um/Makefile
+++ b/arch/x86/um/Makefile
@@ -49,4 +49,4 @@ include/generated/user_constants.h: $(obj)/user-offsets.s FORCE
 UNPROFILE_OBJS := stub_segv.o
 CFLAGS_stub_segv.o := $(CFLAGS_NO_HARDENING)
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/x86/um/os-Linux/Makefile b/arch/x86/um/os-Linux/Makefile
index 5249bbc30dcd..6ba4f5c1945e 100644
--- a/arch/x86/um/os-Linux/Makefile
+++ b/arch/x86/um/os-Linux/Makefile
@@ -9,4 +9,4 @@ obj-$(CONFIG_X86_32) += tls.o
 
 USER_OBJS := $(obj-y)
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/arch/x86/um/vdso/Makefile b/arch/x86/um/vdso/Makefile
index b86d634730b2..d673d6fc9bf3 100644
--- a/arch/x86/um/vdso/Makefile
+++ b/arch/x86/um/vdso/Makefile
@@ -63,7 +63,7 @@ quiet_cmd_vdso = VDSO    $@
       cmd_vdso = $(CC) -nostdlib -o $@ \
 		       $(CC_FLAGS_LTO) $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -Wl,-T,$(filter %.lds,$^) $(filter %.o,$^) && \
-		 sh $(srctree)/$(src)/checkundef.sh '$(NM)' '$@'
+		 sh $(srctree)$(src)/checkundef.sh '$(NM)' '$@'
 
 VDSO_LDFLAGS = -fPIC -shared -Wl,--hash-style=sysv -z noexecstack
 GCOV_PROFILE := n
diff --git a/arch/xtensa/Makefile b/arch/xtensa/Makefile
index 4c14a02179eb..460fd238d49b 100644
--- a/arch/xtensa/Makefile
+++ b/arch/xtensa/Makefile
@@ -55,7 +55,7 @@ CHECKFLAGS += -D$(if $(CONFIG_CPU_BIG_ENDIAN),__XTENSA_EB__,__XTENSA_EL__)
 vardirs := $(patsubst %,arch/xtensa/variants/%/,$(variant-y))
 plfdirs := $(patsubst %,arch/xtensa/platforms/%/,$(platform-y))
 
-KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)/%include,$(vardirs) $(plfdirs))
+KBUILD_CPPFLAGS += $(patsubst %,-I$(srctree)%include,$(vardirs) $(plfdirs))
 
 KBUILD_DEFCONFIG := iss_defconfig
 
diff --git a/arch/xtensa/boot/boot-redboot/Makefile b/arch/xtensa/boot/boot-redboot/Makefile
index c0eef3f6f32d..9be1cfc2a16c 100644
--- a/arch/xtensa/boot/boot-redboot/Makefile
+++ b/arch/xtensa/boot/boot-redboot/Makefile
@@ -20,7 +20,7 @@ $(obj)/zImage.o: $(obj)/../vmlinux.bin.gz $(OBJS)
 
 $(obj)/zImage.elf: $(obj)/zImage.o $(LIBS)
 	$(Q)$(LD) $(KBUILD_LDFLAGS) \
-		-T $(srctree)/$(obj)/boot.ld \
+		-T $(srctree)$(obj)/boot.ld \
 		--build-id=none \
 		-o $@ $^
 
diff --git a/arch/xtensa/boot/dts/Makefile b/arch/xtensa/boot/dts/Makefile
index 9f69eaee2188..0e08da3219d0 100644
--- a/arch/xtensa/boot/dts/Makefile
+++ b/arch/xtensa/boot/dts/Makefile
@@ -10,5 +10,5 @@
 obj-$(CONFIG_OF) += $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_SOURCE))
 
 # for CONFIG_OF_ALL_DTBS test
-dtstree	:= $(srctree:%/=%)/$(src)
+dtstree	:= $(srctree)$(src)
 dtb-	:= $(patsubst $(dtstree)/%.dts,%.dtb, $(wildcard $(dtstree)/*.dts))
diff --git a/arch/xtensa/boot/lib/Makefile b/arch/xtensa/boot/lib/Makefile
index 0378a22a08e3..0355333a1d03 100644
--- a/arch/xtensa/boot/lib/Makefile
+++ b/arch/xtensa/boot/lib/Makefile
@@ -7,7 +7,7 @@ zlib	:= inffast.c inflate.c inftrees.c
 
 lib-y	+= $(zlib:.c=.o) zmem.o
 
-ccflags-y	:= -I $(srctree)/lib/zlib_inflate
+ccflags-y	:= -I $(srctree)lib/zlib_inflate
 ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_inflate.o = -pg
 CFLAGS_REMOVE_zmem.o = -pg
@@ -28,7 +28,7 @@ CFLAGS_REMOVE_inffast.o += -fstack-protector -fstack-protector-strong
 quiet_cmd_copy_zlib = COPY    $@
       cmd_copy_zlib = cat $< > $@
 
-$(addprefix $(obj)/,$(zlib)): $(obj)/%: $(srctree)/lib/zlib_inflate/%
+$(addprefix $(obj)/,$(zlib)): $(obj)/%: $(srctree)lib/zlib_inflate/%
 	$(call cmd,copy_zlib)
 
 clean-files	:= $(zlib)
diff --git a/arch/xtensa/kernel/syscalls/Makefile b/arch/xtensa/kernel/syscalls/Makefile
index b265e4bc16c2..5571f3cf66fd 100644
--- a/arch/xtensa/kernel/syscalls/Makefile
+++ b/arch/xtensa/kernel/syscalls/Makefile
@@ -5,8 +5,8 @@ uapi := arch/$(SRCARCH)/include/generated/uapi/asm
 $(shell mkdir -p $(uapi) $(kapi))
 
 syscall := $(src)/syscall.tbl
-syshdr := $(srctree)/scripts/syscallhdr.sh
-systbl := $(srctree)/scripts/syscalltbl.sh
+syshdr := $(srctree)scripts/syscallhdr.sh
+systbl := $(srctree)scripts/syscalltbl.sh
 
 quiet_cmd_syshdr = SYSHDR  $@
       cmd_syshdr = $(CONFIG_SHELL) $(syshdr) --emit-nr $< $@
diff --git a/certs/Makefile b/certs/Makefile
index 799ad7b9e68a..88a20d00e07e 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -13,7 +13,7 @@ CFLAGS_blacklist_hashes.o := -I $(obj)
 quiet_cmd_check_and_copy_blacklist_hash_list = GEN     $@
       cmd_check_and_copy_blacklist_hash_list = \
 	$(if $(CONFIG_SYSTEM_BLACKLIST_HASH_LIST), \
-	$(AWK) -f $(srctree)/$(src)/check-blacklist-hashes.awk $(CONFIG_SYSTEM_BLACKLIST_HASH_LIST) >&2; \
+	$(AWK) -f $(srctree)$(src)/check-blacklist-hashes.awk $(CONFIG_SYSTEM_BLACKLIST_HASH_LIST) >&2; \
 	{ cat $(CONFIG_SYSTEM_BLACKLIST_HASH_LIST); echo $(comma) NULL; } > $@, \
 	echo NULL > $@)
 
@@ -55,7 +55,7 @@ $(obj)/signing_key.pem: $(obj)/x509.genkey FORCE
 targets += signing_key.pem
 
 quiet_cmd_copy_x509_config = COPY    $@
-      cmd_copy_x509_config = cat $(srctree)/$(src)/default_x509.genkey > $@
+      cmd_copy_x509_config = cat $(srctree)$(src)/default_x509.genkey > $@
 
 # You can provide your own config file. If not present, copy the default one.
 $(obj)/x509.genkey:
diff --git a/drivers/Makefile b/drivers/Makefile
index 37fd6ce3bd7f..bd3dff481341 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -6,9 +6,9 @@
 # Rewritten to use lists instead of if-statements.
 #
 
-# Some driver Makefiles miss $(srctree)/ for include directive.
+# Some driver Makefiles miss $(srctree) for include directive.
 ifdef building_out_of_srctree
-MAKEFLAGS += --include-dir=$(srctree)
+MAKEFLAGS += --include-dir=$(srctree:%/=%)
 endif
 
 obj-y				+= cache/
diff --git a/drivers/accessibility/speakup/Makefile b/drivers/accessibility/speakup/Makefile
index 6f6a83565c0d..30f3d61d4a0a 100644
--- a/drivers/accessibility/speakup/Makefile
+++ b/drivers/accessibility/speakup/Makefile
@@ -40,8 +40,8 @@ hostprogs += makemapdata
 makemapdata-objs := makemapdata.o
 
 quiet_cmd_mkmap = MKMAP   $@
-      cmd_mkmap = TOPDIR=$(srctree) \
-		  SPKDIR=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(srctree)/drivers/accessibility/speakup) \
+      cmd_mkmap = TOPDIR=$(srctree:%/=%) \
+		  SPKDIR=$(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD),$(srctree)drivers/accessibility/speakup) \
 		  $(obj)/makemapdata > $@
 
 $(obj)/mapdata.h: $(obj)/makemapdata
diff --git a/drivers/base/firmware_loader/builtin/Makefile b/drivers/base/firmware_loader/builtin/Makefile
index 6c067dedc01e..3bd053f93931 100644
--- a/drivers/base/firmware_loader/builtin/Makefile
+++ b/drivers/base/firmware_loader/builtin/Makefile
@@ -2,9 +2,9 @@
 obj-y  += main.o
 
 # Create $(fwdir) from $(CONFIG_EXTRA_FIRMWARE_DIR) -- if it doesn't have a
-# leading /, it's relative to $(srctree).
+# leading /, it's relative to $(srctree:%/=%).
 fwdir := $(CONFIG_EXTRA_FIRMWARE_DIR)
-fwdir := $(addprefix $(srctree)/,$(filter-out /%,$(fwdir)))$(filter /%,$(fwdir))
+fwdir := $(addprefix $(srctree),$(filter-out /%,$(fwdir)))$(filter /%,$(fwdir))
 
 firmware  := $(addsuffix .gen.o, $(CONFIG_EXTRA_FIRMWARE))
 obj-y += $(firmware)
diff --git a/drivers/block/rnbd/Makefile b/drivers/block/rnbd/Makefile
index 208e5f865497..59ac4a23ca67 100644
--- a/drivers/block/rnbd/Makefile
+++ b/drivers/block/rnbd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
-ccflags-y := -I$(srctree)/drivers/infiniband/ulp/rtrs
+ccflags-y := -I$(srctree)drivers/infiniband/ulp/rtrs
 
 rnbd-client-y := rnbd-clt.o \
 		  rnbd-clt-sysfs.o
diff --git a/drivers/crypto/chelsio/Makefile b/drivers/crypto/chelsio/Makefile
index 2e5df484ab01..e649c9f73b96 100644
--- a/drivers/crypto/chelsio/Makefile
+++ b/drivers/crypto/chelsio/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4
 
 obj-$(CONFIG_CRYPTO_DEV_CHELSIO) += chcr.o
 chcr-objs :=  chcr_core.o chcr_algo.o
diff --git a/drivers/crypto/intel/iaa/Makefile b/drivers/crypto/intel/iaa/Makefile
index b64b208d2344..b0ec29855e7a 100644
--- a/drivers/crypto/intel/iaa/Makefile
+++ b/drivers/crypto/intel/iaa/Makefile
@@ -3,7 +3,7 @@
 # Makefile for IAA crypto device drivers
 #
 
-ccflags-y += -I $(srctree)/drivers/dma/idxd -DDEFAULT_SYMBOL_NAMESPACE=IDXD
+ccflags-y += -I $(srctree)drivers/dma/idxd -DDEFAULT_SYMBOL_NAMESPACE=IDXD
 
 obj-$(CONFIG_CRYPTO_DEV_IAA_CRYPTO) := iaa_crypto.o
 
diff --git a/drivers/crypto/intel/qat/qat_420xx/Makefile b/drivers/crypto/intel/qat/qat_420xx/Makefile
index a90fbe00b3c8..dc1a381b1b19 100644
--- a/drivers/crypto/intel/qat/qat_420xx/Makefile
+++ b/drivers/crypto/intel/qat/qat_420xx/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_420XX) += qat_420xx.o
 qat_420xx-objs := adf_drv.o adf_420xx_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_4xxx/Makefile b/drivers/crypto/intel/qat/qat_4xxx/Makefile
index ff9c8b5897ea..161dc1f1c4e3 100644
--- a/drivers/crypto/intel/qat/qat_4xxx/Makefile
+++ b/drivers/crypto/intel/qat/qat_4xxx/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (BSD-3-Clause OR GPL-2.0-only)
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_4XXX) += qat_4xxx.o
 qat_4xxx-objs := adf_drv.o adf_4xxx_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_c3xxx/Makefile b/drivers/crypto/intel/qat/qat_c3xxx/Makefile
index 92ef416ccc78..354826f62d94 100644
--- a/drivers/crypto/intel/qat/qat_c3xxx/Makefile
+++ b/drivers/crypto/intel/qat/qat_c3xxx/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_C3XXX) += qat_c3xxx.o
 qat_c3xxx-objs := adf_drv.o adf_c3xxx_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_c3xxxvf/Makefile b/drivers/crypto/intel/qat/qat_c3xxxvf/Makefile
index b6d76825a92c..e9c2563a1a55 100644
--- a/drivers/crypto/intel/qat/qat_c3xxxvf/Makefile
+++ b/drivers/crypto/intel/qat/qat_c3xxxvf/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_C3XXXVF) += qat_c3xxxvf.o
 qat_c3xxxvf-objs := adf_drv.o adf_c3xxxvf_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_c62x/Makefile b/drivers/crypto/intel/qat/qat_c62x/Makefile
index d581f7c87d6c..3922cc35bc9d 100644
--- a/drivers/crypto/intel/qat/qat_c62x/Makefile
+++ b/drivers/crypto/intel/qat/qat_c62x/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_C62X) += qat_c62x.o
 qat_c62x-objs := adf_drv.o adf_c62x_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_c62xvf/Makefile b/drivers/crypto/intel/qat/qat_c62xvf/Makefile
index 446c3d638605..3aa3a3400be7 100644
--- a/drivers/crypto/intel/qat/qat_c62xvf/Makefile
+++ b/drivers/crypto/intel/qat/qat_c62xvf/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_C62XVF) += qat_c62xvf.o
 qat_c62xvf-objs := adf_drv.o adf_c62xvf_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_dh895xcc/Makefile b/drivers/crypto/intel/qat/qat_dh895xcc/Makefile
index 38d6f8e1624a..982533590512 100644
--- a/drivers/crypto/intel/qat/qat_dh895xcc/Makefile
+++ b/drivers/crypto/intel/qat/qat_dh895xcc/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_DH895xCC) += qat_dh895xcc.o
 qat_dh895xcc-objs := adf_drv.o adf_dh895xcc_hw_data.o
diff --git a/drivers/crypto/intel/qat/qat_dh895xccvf/Makefile b/drivers/crypto/intel/qat/qat_dh895xccvf/Makefile
index 0153c85ce743..302700510fde 100644
--- a/drivers/crypto/intel/qat/qat_dh895xccvf/Makefile
+++ b/drivers/crypto/intel/qat/qat_dh895xccvf/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../qat_common
+ccflags-y := -I $(srctree)$(src)/../qat_common
 obj-$(CONFIG_CRYPTO_DEV_QAT_DH895xCCVF) += qat_dh895xccvf.o
 qat_dh895xccvf-objs := adf_drv.o adf_dh895xccvf_hw_data.o
diff --git a/drivers/crypto/marvell/octeontx2/Makefile b/drivers/crypto/marvell/octeontx2/Makefile
index f0f2942c1d27..b8c226e31f4e 100644
--- a/drivers/crypto/marvell/octeontx2/Makefile
+++ b/drivers/crypto/marvell/octeontx2/Makefile
@@ -7,4 +7,4 @@ rvu_cptpf-objs := otx2_cptpf_main.o otx2_cptpf_mbox.o \
 rvu_cptvf-objs := otx2_cptvf_main.o otx2_cptvf_mbox.o \
 		  otx2_cptvf_reqmgr.o otx2_cptvf_algs.o
 
-ccflags-y += -I$(srctree)/drivers/net/ethernet/marvell/octeontx2/af
+ccflags-y += -I$(srctree)drivers/net/ethernet/marvell/octeontx2/af
diff --git a/drivers/cxl/core/Makefile b/drivers/cxl/core/Makefile
index 9259bcc6773c..9d78d492f17c 100644
--- a/drivers/cxl/core/Makefile
+++ b/drivers/cxl/core/Makefile
@@ -2,7 +2,7 @@
 obj-$(CONFIG_CXL_BUS) += cxl_core.o
 obj-$(CONFIG_CXL_SUSPEND) += suspend.o
 
-ccflags-y += -I$(srctree)/drivers/cxl
+ccflags-y += -I$(srctree)drivers/cxl
 CFLAGS_trace.o = -DTRACE_INCLUDE_PATH=. -I$(src)
 
 cxl_core-y := port.o
diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 73f4810f6db3..a4f6abb08da9 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -31,11 +31,11 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
 cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE -mno-relax
 cflags-$(CONFIG_LOONGARCH)	+= -fpie
 
-cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
+cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)scripts/dtc/libfdt
 
 KBUILD_CFLAGS			:= $(subst $(CC_FLAGS_FTRACE),,$(cflags-y)) \
 				   -Os -DDISABLE_BRANCH_PROFILING \
-				   -include $(srctree)/include/linux/hidden.h \
+				   -include $(srctree)include/linux/hidden.h \
 				   -D__NO_FORTIFY \
 				   -ffreestanding \
 				   -fno-stack-protector \
@@ -79,7 +79,7 @@ libfdt-deps			:= fdt_rw.c fdt_ro.c fdt_wip.c fdt.c \
 lib-$(CONFIG_EFI_PARAMS_FROM_FDT) += fdt.o \
 				     $(patsubst %.c,lib-%.o,$(libfdt-deps))
 
-$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
+$(obj)/lib-%.o: $(srctree)lib/%.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 lib-$(CONFIG_EFI_GENERIC_STUB)	+= efi-stub.o string.o intrinsics.o systable.o \
diff --git a/drivers/firmware/efi/libstub/Makefile.zboot b/drivers/firmware/efi/libstub/Makefile.zboot
index 65ffd0b760b2..a8b73dfb17fb 100644
--- a/drivers/firmware/efi/libstub/Makefile.zboot
+++ b/drivers/firmware/efi/libstub/Makefile.zboot
@@ -47,12 +47,12 @@ AFLAGS_zboot-header.o += -DMACHINE_TYPE=IMAGE_FILE_MACHINE_$(EFI_ZBOOT_MACH_TYPE
 			 -DCOMP_TYPE="\"$(comp-type-y)\"" \
 			 $(aflags-zboot-header-y)
 
-$(obj)/zboot-header.o: $(srctree)/drivers/firmware/efi/libstub/zboot-header.S FORCE
+$(obj)/zboot-header.o: $(srctree)drivers/firmware/efi/libstub/zboot-header.S FORCE
 	$(call if_changed_rule,as_o_S)
 
 ZBOOT_DEPS := $(obj)/zboot-header.o $(objtree)/drivers/firmware/efi/libstub/lib.a
 
-LDFLAGS_vmlinuz.efi.elf := -T $(srctree)/drivers/firmware/efi/libstub/zboot.lds
+LDFLAGS_vmlinuz.efi.elf := -T $(srctree)drivers/firmware/efi/libstub/zboot.lds
 $(obj)/vmlinuz.efi.elf: $(obj)/vmlinuz.o $(ZBOOT_DEPS) FORCE
 	$(call if_changed,ld)
 
diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/amdgpu/Makefile
index 260e32ef7bae..b4934560a286 100644
--- a/drivers/gpu/drm/amd/amdgpu/Makefile
+++ b/drivers/gpu/drm/amd/amdgpu/Makefile
@@ -23,7 +23,7 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-FULL_AMD_PATH=$(srctree)/$(src)/..
+FULL_AMD_PATH=$(srctree)$(src)/..
 DISPLAY_FOLDER_NAME=display
 FULL_AMD_DISPLAY_PATH = $(FULL_AMD_PATH)/$(DISPLAY_FOLDER_NAME)
 
diff --git a/drivers/gpu/drm/arm/display/komeda/Makefile b/drivers/gpu/drm/arm/display/komeda/Makefile
index 1931a7fa1a14..489be5d2af9d 100644
--- a/drivers/gpu/drm/arm/display/komeda/Makefile
+++ b/drivers/gpu/drm/arm/display/komeda/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 
 ccflags-y := \
-	-I $(srctree)/$(src)/../include \
-	-I $(srctree)/$(src)
+	-I $(srctree)$(src)/../include \
+	-I $(srctree)$(src)
 
 komeda-y := \
 	komeda_drv.o \
diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index c13f14edb508..86f789782c98 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -41,7 +41,7 @@ CFLAGS_display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 # drivers. Define I915 when building i915.
 subdir-ccflags-y += -DI915
 
-subdir-ccflags-y += -I$(srctree)/$(src)
+subdir-ccflags-y += -I$(srctree)$(src)
 
 # Please keep these build lists sorted!
 
@@ -419,7 +419,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
 #
 # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
 ifdef CONFIG_DRM_I915_WERROR
-    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
+    cmd_checkdoc = $(srctree)scripts/kernel-doc -none -Werror $<
 endif
 
 # header test
@@ -430,11 +430,11 @@ no-header-test := \
 
 always-$(CONFIG_DRM_I915_WERROR) += \
 	$(patsubst %.h,%.hdrtest, $(filter-out $(no-header-test), \
-		$(shell cd $(srctree)/$(src) && find * -name '*.h')))
+		$(shell cd $(srctree)$(src) && find * -name '*.h')))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; \
-		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
+		$(srctree)scripts/kernel-doc -none -Werror $<; touch $@
 
 $(obj)/%.hdrtest: $(src)/%.h FORCE
 	$(call if_changed_dep,hdrtest)
diff --git a/drivers/gpu/drm/imagination/Makefile b/drivers/gpu/drm/imagination/Makefile
index ec6db8e9b403..126e97a78099 100644
--- a/drivers/gpu/drm/imagination/Makefile
+++ b/drivers/gpu/drm/imagination/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only OR MIT
 # Copyright (c) 2023 Imagination Technologies Ltd.
 
-subdir-ccflags-y := -I$(srctree)/$(src)
+subdir-ccflags-y := -I$(srctree)$(src)
 
 powervr-y := \
 	pvr_ccb.o \
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index b1173128b5b9..e63ed061ed7b 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -1,8 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I $(srctree)/$(src)
-ccflags-y += -I $(srctree)/$(src)/disp/dpu1
-ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
-ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
+ccflags-y := -I $(srctree)$(src)
+ccflags-y += -I $(srctree)$(src)/disp/dpu1
+ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)$(src)/dsi
+ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)$(src)/dp
 
 msm-y := \
 	adreno/adreno_device.o \
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index efcf0ab7a1a6..cfdb0667204d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -32,7 +32,7 @@ endif
 # Enable -Werror in CI and development
 subdir-ccflags-$(CONFIG_DRM_XE_WERROR) += -Werror
 
-subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
+subdir-ccflags-y += -I$(obj) -I$(srctree)$(src)
 
 # generated sources
 hostprogs := xe_gen_wa_oob
@@ -42,7 +42,7 @@ generated_oob := $(obj)/generated/xe_wa_oob.c $(obj)/generated/xe_wa_oob.h
 quiet_cmd_wa_oob = GEN     $(notdir $(generated_oob))
       cmd_wa_oob = mkdir -p $(@D); $^ $(generated_oob)
 
-$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rules
+$(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)$(src)/xe_wa_oob.rules
 	$(call cmd,wa_oob)
 
 uses_generated_oob := \
@@ -154,10 +154,10 @@ xe-$(CONFIG_PCI_IOV) += \
 
 # i915 Display compat #defines and #includes
 subdir-ccflags-$(CONFIG_DRM_XE_DISPLAY) += \
-	-I$(srctree)/$(src)/display/ext \
-	-I$(srctree)/$(src)/compat-i915-headers \
-	-I$(srctree)/drivers/gpu/drm/xe/display/ \
-	-I$(srctree)/drivers/gpu/drm/i915/display/ \
+	-I$(srctree)$(src)/display/ext \
+	-I$(srctree)$(src)/compat-i915-headers \
+	-I$(srctree)drivers/gpu/drm/xe/display/ \
+	-I$(srctree)drivers/gpu/drm/i915/display/ \
 	-Ddrm_i915_gem_object=xe_bo \
 	-Ddrm_i915_private=xe_device
 
@@ -165,12 +165,12 @@ CFLAGS_i915-display/intel_fbdev.o = $(call cc-disable-warning, override-init)
 CFLAGS_i915-display/intel_display_device.o = $(call cc-disable-warning, override-init)
 
 # Rule to build SOC code shared with i915
-$(obj)/i915-soc/%.o: $(srctree)/drivers/gpu/drm/i915/soc/%.c FORCE
+$(obj)/i915-soc/%.o: $(srctree)drivers/gpu/drm/i915/soc/%.c FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
 # Rule to build display code shared with i915
-$(obj)/i915-display/%.o: $(srctree)/drivers/gpu/drm/i915/display/%.c FORCE
+$(obj)/i915-display/%.o: $(srctree)drivers/gpu/drm/i915/display/%.c FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
@@ -295,7 +295,7 @@ ifneq ($(CONFIG_DRM_XE_DISPLAY),y)
 endif
 
 always-$(CONFIG_DRM_XE_WERROR) += \
-	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)/$(src) && find * -name '*.h' $(hdrtest_find_args)))
+	$(patsubst %.h,%.hdrtest, $(shell cd $(srctree)$(src) && find * -name '*.h' $(hdrtest_find_args)))
 
 quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
       cmd_hdrtest = $(CC) -DHDRTEST $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S -o /dev/null -x c /dev/null -include $<; touch $@
diff --git a/drivers/hid/amd-sfh-hid/Makefile b/drivers/hid/amd-sfh-hid/Makefile
index 0222170ab7ad..b0d47e74a298 100644
--- a/drivers/hid/amd-sfh-hid/Makefile
+++ b/drivers/hid/amd-sfh-hid/Makefile
@@ -13,4 +13,4 @@ amd_sfh-objs += sfh1_1/amd_sfh_init.o
 amd_sfh-objs += sfh1_1/amd_sfh_interface.o
 amd_sfh-objs += sfh1_1/amd_sfh_desc.o
 
-ccflags-y += -I $(srctree)/$(src)/
+ccflags-y += -I $(srctree)$(src)/
diff --git a/drivers/hid/bpf/Makefile b/drivers/hid/bpf/Makefile
index cf55120cf7d6..35197c76c03b 100644
--- a/drivers/hid/bpf/Makefile
+++ b/drivers/hid/bpf/Makefile
@@ -3,7 +3,7 @@
 # Makefile for HID-BPF
 #
 
-LIBBPF_INCLUDE = $(srctree)/tools/lib
+LIBBPF_INCLUDE = $(srctree)tools/lib
 
 obj-$(CONFIG_HID_BPF) += hid_bpf.o
 CFLAGS_hid_bpf_dispatch.o += -I$(LIBBPF_INCLUDE)
diff --git a/drivers/hid/intel-ish-hid/Makefile b/drivers/hid/intel-ish-hid/Makefile
index f0a82b1c7cb9..447607d0e975 100644
--- a/drivers/hid/intel-ish-hid/Makefile
+++ b/drivers/hid/intel-ish-hid/Makefile
@@ -23,4 +23,4 @@ intel-ishtp-hid-objs += ishtp-hid-client.o
 obj-$(CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER) += intel-ishtp-loader.o
 intel-ishtp-loader-objs += ishtp-fw-loader.o
 
-ccflags-y += -I $(srctree)/$(src)/ishtp
+ccflags-y += -I $(srctree)$(src)/ishtp
diff --git a/drivers/iio/humidity/Makefile b/drivers/iio/humidity/Makefile
index 5fbeef299f61..ebcf7623bac3 100644
--- a/drivers/iio/humidity/Makefile
+++ b/drivers/iio/humidity/Makefile
@@ -20,4 +20,4 @@ obj-$(CONFIG_HTU21) += htu21.o
 obj-$(CONFIG_SI7005) += si7005.o
 obj-$(CONFIG_SI7020) += si7020.o
 
-ccflags-y += -I$(srctree)/drivers/iio/common/hid-sensors
+ccflags-y += -I$(srctree)drivers/iio/common/hid-sensors
diff --git a/drivers/infiniband/hw/bnxt_re/Makefile b/drivers/infiniband/hw/bnxt_re/Makefile
index ee9bb1be61ea..4036e467c3d5 100644
--- a/drivers/infiniband/hw/bnxt_re/Makefile
+++ b/drivers/infiniband/hw/bnxt_re/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y := -I $(srctree)/drivers/net/ethernet/broadcom/bnxt
+ccflags-y := -I $(srctree)drivers/net/ethernet/broadcom/bnxt
 obj-$(CONFIG_INFINIBAND_BNXT_RE) += bnxt_re.o
 bnxt_re-y := main.o ib_verbs.o \
 	     qplib_res.o qplib_rcfw.o	\
diff --git a/drivers/infiniband/hw/cxgb4/Makefile b/drivers/infiniband/hw/cxgb4/Makefile
index 291d259d2319..656afc57136e 100644
--- a/drivers/infiniband/hw/cxgb4/Makefile
+++ b/drivers/infiniband/hw/cxgb4/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4
-ccflags-y += -I $(srctree)/drivers/net/ethernet/chelsio/libcxgb
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4
+ccflags-y += -I $(srctree)drivers/net/ethernet/chelsio/libcxgb
 
 obj-$(CONFIG_INFINIBAND_CXGB4) += iw_cxgb4.o
 
diff --git a/drivers/infiniband/hw/hns/Makefile b/drivers/infiniband/hw/hns/Makefile
index be1e1cdbcfa8..a2d71d080201 100644
--- a/drivers/infiniband/hw/hns/Makefile
+++ b/drivers/infiniband/hw/hns/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the Hisilicon RoCE drivers.
 #
 
-ccflags-y :=  -I $(srctree)/drivers/net/ethernet/hisilicon/hns3
+ccflags-y :=  -I $(srctree)drivers/net/ethernet/hisilicon/hns3
 
 hns-roce-objs := hns_roce_main.o hns_roce_cmd.o hns_roce_pd.o \
 	hns_roce_ah.o hns_roce_hem.o hns_roce_mr.o hns_roce_qp.o \
diff --git a/drivers/infiniband/hw/ocrdma/Makefile b/drivers/infiniband/hw/ocrdma/Makefile
index 14fba95021d8..6492aff4dbd2 100644
--- a/drivers/infiniband/hw/ocrdma/Makefile
+++ b/drivers/infiniband/hw/ocrdma/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/emulex/benet
+ccflags-y := -I $(srctree)drivers/net/ethernet/emulex/benet
 
 obj-$(CONFIG_INFINIBAND_OCRDMA)	+= ocrdma.o
 
diff --git a/drivers/infiniband/hw/usnic/Makefile b/drivers/infiniband/hw/usnic/Makefile
index f12a4938ffd2..e8b88c22d3f9 100644
--- a/drivers/infiniband/hw/usnic/Makefile
+++ b/drivers/infiniband/hw/usnic/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I $(srctree)/drivers/net/ethernet/cisco/enic
+ccflags-y := -I $(srctree)drivers/net/ethernet/cisco/enic
 
 obj-$(CONFIG_INFINIBAND_USNIC)+= usnic_verbs.o
 
diff --git a/drivers/media/common/b2c2/Makefile b/drivers/media/common/b2c2/Makefile
index 0e32b77f349b..e233e7b0c082 100644
--- a/drivers/media/common/b2c2/Makefile
+++ b/drivers/media/common/b2c2/Makefile
@@ -4,5 +4,5 @@ b2c2-flexcop-objs += flexcop-sram.o flexcop-eeprom.o flexcop-misc.o
 b2c2-flexcop-objs += flexcop-hw-filter.o
 obj-$(CONFIG_DVB_B2C2_FLEXCOP) += b2c2-flexcop.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
-ccflags-y += -I $(srctree)/drivers/media/tuners/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/tuners/
diff --git a/drivers/media/dvb-frontends/Makefile b/drivers/media/dvb-frontends/Makefile
index a93146cb428c..00cf914aecdc 100644
--- a/drivers/media/dvb-frontends/Makefile
+++ b/drivers/media/dvb-frontends/Makefile
@@ -3,11 +3,11 @@
 # Makefile for the kernel DVB frontend device drivers.
 #
 
-ccflags-y += -I$(srctree)/drivers/media/tuners/
+ccflags-y += -I$(srctree)drivers/media/tuners/
 
 # FIXME: RTL2832 SDR driver uses power management directly from USB IF driver
 ifdef CONFIG_DVB_RTL2832_SDR
-	ccflags-y += -I$(srctree)/drivers/media/usb/dvb-usb-v2
+	ccflags-y += -I$(srctree)drivers/media/usb/dvb-usb-v2
 endif
 
 cxd2820r-objs := cxd2820r_core.o cxd2820r_c.o cxd2820r_t.o cxd2820r_t2.o
diff --git a/drivers/media/dvb-frontends/drx39xyj/Makefile b/drivers/media/dvb-frontends/drx39xyj/Makefile
index e97ab6130a4a..6952747ce05e 100644
--- a/drivers/media/dvb-frontends/drx39xyj/Makefile
+++ b/drivers/media/dvb-frontends/drx39xyj/Makefile
@@ -3,4 +3,4 @@ drx39xyj-objs := drxj.o
 
 obj-$(CONFIG_DVB_DRX39XYJ) += drx39xyj.o
 
-ccflags-y += -I$(srctree)/drivers/media/tuners/
+ccflags-y += -I$(srctree)drivers/media/tuners/
diff --git a/drivers/media/i2c/ccs/Makefile b/drivers/media/i2c/ccs/Makefile
index 44601ba8cd53..2c48b0947668 100644
--- a/drivers/media/i2c/ccs/Makefile
+++ b/drivers/media/i2c/ccs/Makefile
@@ -3,4 +3,4 @@ ccs-objs			+= ccs-core.o ccs-reg-access.o \
 				   ccs-quirk.o ccs-limits.o ccs-data.o
 obj-$(CONFIG_VIDEO_CCS)		+= ccs.o
 
-ccflags-y += -I $(srctree)/drivers/media/i2c
+ccflags-y += -I $(srctree)drivers/media/i2c
diff --git a/drivers/media/mmc/siano/Makefile b/drivers/media/mmc/siano/Makefile
index 88cb8bec415a..9508ab059ddb 100644
--- a/drivers/media/mmc/siano/Makefile
+++ b/drivers/media/mmc/siano/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SMS_SDIO_DRV) += smssdio.o
 
-ccflags-y += -I $(srctree)/drivers/media/common/siano
+ccflags-y += -I $(srctree)drivers/media/common/siano
diff --git a/drivers/media/pci/b2c2/Makefile b/drivers/media/pci/b2c2/Makefile
index 14ed6e441738..b124db282e50 100644
--- a/drivers/media/pci/b2c2/Makefile
+++ b/drivers/media/pci/b2c2/Makefile
@@ -6,4 +6,4 @@ endif
 b2c2-flexcop-pci-objs += flexcop-pci.o
 obj-$(CONFIG_DVB_B2C2_FLEXCOP_PCI) += b2c2-flexcop-pci.o
 
-ccflags-y += -I $(srctree)/drivers/media/common/b2c2/
+ccflags-y += -I $(srctree)drivers/media/common/b2c2/
diff --git a/drivers/media/pci/bt8xx/Makefile b/drivers/media/pci/bt8xx/Makefile
index 69bc0d9c478e..ec0a496c427a 100644
--- a/drivers/media/pci/bt8xx/Makefile
+++ b/drivers/media/pci/bt8xx/Makefile
@@ -6,5 +6,5 @@ bttv-objs      :=      bttv-driver.o bttv-cards.o bttv-if.o \
 obj-$(CONFIG_VIDEO_BT848) += bttv.o
 obj-$(CONFIG_DVB_BT8XX) += bt878.o dvb-bt8xx.o dst.o dst_ca.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
diff --git a/drivers/media/pci/cx18/Makefile b/drivers/media/pci/cx18/Makefile
index df00ef8b4521..8ed40976c600 100644
--- a/drivers/media/pci/cx18/Makefile
+++ b/drivers/media/pci/cx18/Makefile
@@ -9,5 +9,5 @@ cx18-alsa-objs := cx18-alsa-main.o cx18-alsa-pcm.o
 obj-$(CONFIG_VIDEO_CX18) += cx18.o
 obj-$(CONFIG_VIDEO_CX18_ALSA) += cx18-alsa.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
diff --git a/drivers/media/pci/cx23885/Makefile b/drivers/media/pci/cx23885/Makefile
index a785169ec368..b6f89a5df11f 100644
--- a/drivers/media/pci/cx23885/Makefile
+++ b/drivers/media/pci/cx23885/Makefile
@@ -8,7 +8,7 @@ cx23885-objs	:= cx23885-cards.o cx23885-video.o cx23885-vbi.o \
 obj-$(CONFIG_VIDEO_CX23885) += cx23885.o
 obj-$(CONFIG_MEDIA_ALTERA_CI) += altera-ci.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
 
 ccflags-y += $(extra-cflags-y) $(extra-cflags-m)
diff --git a/drivers/media/pci/cx88/Makefile b/drivers/media/pci/cx88/Makefile
index c2a015869760..e7224bac277c 100644
--- a/drivers/media/pci/cx88/Makefile
+++ b/drivers/media/pci/cx88/Makefile
@@ -10,5 +10,5 @@ obj-$(CONFIG_VIDEO_CX88_ALSA) += cx88-alsa.o
 obj-$(CONFIG_VIDEO_CX88_BLACKBIRD) += cx88-blackbird.o
 obj-$(CONFIG_VIDEO_CX88_DVB) += cx88-dvb.o
 obj-$(CONFIG_VIDEO_CX88_VP3054) += cx88-vp3054-i2c.o
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/pci/ddbridge/Makefile b/drivers/media/pci/ddbridge/Makefile
index 5e7eab81173b..a034342c0e63 100644
--- a/drivers/media/pci/ddbridge/Makefile
+++ b/drivers/media/pci/ddbridge/Makefile
@@ -9,5 +9,5 @@ ddbridge-objs := ddbridge-main.o ddbridge-core.o ddbridge-ci.o \
 
 obj-$(CONFIG_DVB_DDBRIDGE) += ddbridge.o ddbridge-dummy-fe.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
-ccflags-y += -I $(srctree)/drivers/media/tuners/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/tuners/
diff --git a/drivers/media/pci/dm1105/Makefile b/drivers/media/pci/dm1105/Makefile
index bf804098ede0..c3e3afbf1ed4 100644
--- a/drivers/media/pci/dm1105/Makefile
+++ b/drivers/media/pci/dm1105/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DVB_DM1105) += dm1105.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/pci/ivtv/Makefile b/drivers/media/pci/ivtv/Makefile
index 5de95dbe3256..35baa8089069 100644
--- a/drivers/media/pci/ivtv/Makefile
+++ b/drivers/media/pci/ivtv/Makefile
@@ -10,6 +10,6 @@ obj-$(CONFIG_VIDEO_IVTV) += ivtv.o
 obj-$(CONFIG_VIDEO_IVTV_ALSA) += ivtv-alsa.o
 obj-$(CONFIG_VIDEO_FB_IVTV) += ivtvfb.o
 
-ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
 
diff --git a/drivers/media/pci/mantis/Makefile b/drivers/media/pci/mantis/Makefile
index 49e82247b618..6553a92d2264 100644
--- a/drivers/media/pci/mantis/Makefile
+++ b/drivers/media/pci/mantis/Makefile
@@ -26,4 +26,4 @@ obj-$(CONFIG_MANTIS_CORE)	+= mantis_core.o
 obj-$(CONFIG_DVB_MANTIS)	+= mantis.o
 obj-$(CONFIG_DVB_HOPPER)	+= hopper.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
diff --git a/drivers/media/pci/netup_unidvb/Makefile b/drivers/media/pci/netup_unidvb/Makefile
index 215bdafcc279..c3cd87ab7dad 100644
--- a/drivers/media/pci/netup_unidvb/Makefile
+++ b/drivers/media/pci/netup_unidvb/Makefile
@@ -6,4 +6,4 @@ netup-unidvb-objs += netup_unidvb_spi.o
 
 obj-$(CONFIG_DVB_NETUP_UNIDVB) += netup-unidvb.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/pci/ngene/Makefile b/drivers/media/pci/ngene/Makefile
index 5d16090e0677..38a5575abf15 100644
--- a/drivers/media/pci/ngene/Makefile
+++ b/drivers/media/pci/ngene/Makefile
@@ -7,5 +7,5 @@ ngene-objs := ngene-core.o ngene-i2c.o ngene-cards.o ngene-dvb.o
 
 obj-$(CONFIG_DVB_NGENE) += ngene.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
-ccflags-y += -I $(srctree)/drivers/media/tuners/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/tuners/
diff --git a/drivers/media/pci/pluto2/Makefile b/drivers/media/pci/pluto2/Makefile
index 0553479642a3..f3a2779232ef 100644
--- a/drivers/media/pci/pluto2/Makefile
+++ b/drivers/media/pci/pluto2/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DVB_PLUTO2) += pluto2.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
diff --git a/drivers/media/pci/pt1/Makefile b/drivers/media/pci/pt1/Makefile
index 45b21a923e3a..e40dab9dce18 100644
--- a/drivers/media/pci/pt1/Makefile
+++ b/drivers/media/pci/pt1/Makefile
@@ -3,5 +3,5 @@ earth-pt1-objs := pt1.o
 
 obj-$(CONFIG_DVB_PT1) += earth-pt1.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
diff --git a/drivers/media/pci/pt3/Makefile b/drivers/media/pci/pt3/Makefile
index da6b265f4b39..e4223d5bc8c3 100644
--- a/drivers/media/pci/pt3/Makefile
+++ b/drivers/media/pci/pt3/Makefile
@@ -4,5 +4,5 @@ earth-pt3-objs += pt3.o pt3_i2c.o pt3_dma.o
 
 obj-$(CONFIG_DVB_PT3) += earth-pt3.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I $(srctree)/drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
diff --git a/drivers/media/pci/saa7134/Makefile b/drivers/media/pci/saa7134/Makefile
index 82ac7f31221b..14a531744d51 100644
--- a/drivers/media/pci/saa7134/Makefile
+++ b/drivers/media/pci/saa7134/Makefile
@@ -12,6 +12,6 @@ obj-$(CONFIG_VIDEO_SAA7134_ALSA) += saa7134-alsa.o
 
 obj-$(CONFIG_VIDEO_SAA7134_DVB) += saa7134-dvb.o
 
-ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I$(srctree)/drivers/media/usb/go7007
+ccflags-y += -I$(srctree)drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/usb/go7007
diff --git a/drivers/media/pci/saa7146/Makefile b/drivers/media/pci/saa7146/Makefile
index 37c9336f83d5..e5d48c06cca0 100644
--- a/drivers/media/pci/saa7146/Makefile
+++ b/drivers/media/pci/saa7146/Makefile
@@ -3,4 +3,4 @@ obj-$(CONFIG_VIDEO_MXB) += mxb.o
 obj-$(CONFIG_VIDEO_HEXIUM_ORION) += hexium_orion.o
 obj-$(CONFIG_VIDEO_HEXIUM_GEMINI) += hexium_gemini.o
 
-ccflags-y += -I$(srctree)/drivers/media/i2c
+ccflags-y += -I$(srctree)drivers/media/i2c
diff --git a/drivers/media/pci/saa7164/Makefile b/drivers/media/pci/saa7164/Makefile
index dea076744ec9..bafd3cacb7c8 100644
--- a/drivers/media/pci/saa7164/Makefile
+++ b/drivers/media/pci/saa7164/Makefile
@@ -5,5 +5,5 @@ saa7164-objs	:= saa7164-cards.o saa7164-core.o saa7164-i2c.o saa7164-dvb.o \
 
 obj-$(CONFIG_VIDEO_SAA7164) += saa7164.o
 
-ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/pci/smipcie/Makefile b/drivers/media/pci/smipcie/Makefile
index 2426b7566553..772e0feea780 100644
--- a/drivers/media/pci/smipcie/Makefile
+++ b/drivers/media/pci/smipcie/Makefile
@@ -4,5 +4,5 @@ smipcie-objs	:= smipcie-main.o smipcie-ir.o
 
 obj-$(CONFIG_DVB_SMIPCIE) += smipcie.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/pci/ttpci/Makefile b/drivers/media/pci/ttpci/Makefile
index b0708f6e40cc..3539a0f318f8 100644
--- a/drivers/media/pci/ttpci/Makefile
+++ b/drivers/media/pci/ttpci/Makefile
@@ -8,6 +8,6 @@ obj-$(CONFIG_DVB_BUDGET) += budget.o
 obj-$(CONFIG_DVB_BUDGET_AV) += budget-av.o
 obj-$(CONFIG_DVB_BUDGET_CI) += budget-ci.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/common
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/common
diff --git a/drivers/media/platform/mediatek/mdp/Makefile b/drivers/media/platform/mediatek/mdp/Makefile
index b7c16ebecc80..ce193b467ced 100644
--- a/drivers/media/platform/mediatek/mdp/Makefile
+++ b/drivers/media/platform/mediatek/mdp/Makefile
@@ -7,4 +7,4 @@ mtk-mdp-y += mtk_mdp_vpu.o
 
 obj-$(CONFIG_VIDEO_MEDIATEK_MDP) += mtk-mdp.o
 
-ccflags-y += -I$(srctree)/drivers/media/platform/mediatek/vpu
+ccflags-y += -I$(srctree)drivers/media/platform/mediatek/vpu
diff --git a/drivers/media/platform/st/sti/c8sectpfe/Makefile b/drivers/media/platform/st/sti/c8sectpfe/Makefile
index aedfc725cc19..af683c2d2a74 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/Makefile
+++ b/drivers/media/platform/st/sti/c8sectpfe/Makefile
@@ -4,5 +4,5 @@ c8sectpfe-y += c8sectpfe-core.o c8sectpfe-common.o c8sectpfe-dvb.o \
 
 obj-$(CONFIG_DVB_C8SECTPFE) += c8sectpfe.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/
-ccflags-y += -I $(srctree)/drivers/media/tuners/
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/
+ccflags-y += -I $(srctree)drivers/media/tuners/
diff --git a/drivers/media/spi/Makefile b/drivers/media/spi/Makefile
index 6ac7adc64124..22af806d37f6 100644
--- a/drivers/media/spi/Makefile
+++ b/drivers/media/spi/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends/cxd2880
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends/cxd2880
 
 # Please keep it alphabetically sorted by Kconfig name
 # (e. g. LC_ALL=C sort Makefile)
diff --git a/drivers/media/tuners/Makefile b/drivers/media/tuners/Makefile
index bd350a285aad..db5914c00075 100644
--- a/drivers/media/tuners/Makefile
+++ b/drivers/media/tuners/Makefile
@@ -3,7 +3,7 @@
 # Makefile for common V4L/DVB tuners
 #
 
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
 tda18271-objs := tda18271-maps.o tda18271-common.o tda18271-fe.o
 
 # Please keep it alphabetically sorted by Kconfig name
diff --git a/drivers/media/usb/as102/Makefile b/drivers/media/usb/as102/Makefile
index de671aed5dfc..a0fab715c615 100644
--- a/drivers/media/usb/as102/Makefile
+++ b/drivers/media/usb/as102/Makefile
@@ -4,4 +4,4 @@ dvb-as102-objs := as102_drv.o as102_fw.o as10x_cmd.o as10x_cmd_stream.o \
 
 obj-$(CONFIG_DVB_AS102) += dvb-as102.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/usb/au0828/Makefile b/drivers/media/usb/au0828/Makefile
index 4347812d101a..3b24b7c63e57 100644
--- a/drivers/media/usb/au0828/Makefile
+++ b/drivers/media/usb/au0828/Makefile
@@ -11,7 +11,7 @@ endif
 
 obj-$(CONFIG_VIDEO_AU0828) += au0828.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
 
 ccflags-y += $(extra-cflags-y) $(extra-cflags-m)
diff --git a/drivers/media/usb/b2c2/Makefile b/drivers/media/usb/b2c2/Makefile
index 6ae0e43afb35..df29b4cae05f 100644
--- a/drivers/media/usb/b2c2/Makefile
+++ b/drivers/media/usb/b2c2/Makefile
@@ -2,4 +2,4 @@
 b2c2-flexcop-usb-objs := flexcop-usb.o
 obj-$(CONFIG_DVB_B2C2_FLEXCOP_USB) += b2c2-flexcop-usb.o
 
-ccflags-y += -I $(srctree)/drivers/media/common/b2c2/
+ccflags-y += -I $(srctree)drivers/media/common/b2c2/
diff --git a/drivers/media/usb/cx231xx/Makefile b/drivers/media/usb/cx231xx/Makefile
index 8acbbcba7d0c..4640848d1ece 100644
--- a/drivers/media/usb/cx231xx/Makefile
+++ b/drivers/media/usb/cx231xx/Makefile
@@ -9,5 +9,5 @@ obj-$(CONFIG_VIDEO_CX231XX) += cx231xx.o
 obj-$(CONFIG_VIDEO_CX231XX_ALSA) += cx231xx-alsa.o
 obj-$(CONFIG_VIDEO_CX231XX_DVB) += cx231xx-dvb.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/usb/dvb-usb-v2/Makefile b/drivers/media/usb/dvb-usb-v2/Makefile
index 58c0140e19de..72ffb4bcf139 100644
--- a/drivers/media/usb/dvb-usb-v2/Makefile
+++ b/drivers/media/usb/dvb-usb-v2/Makefile
@@ -44,6 +44,6 @@ obj-$(CONFIG_DVB_USB_DVBSKY) += dvb-usb-dvbsky.o
 dvb-usb-zd1301-objs := zd1301.o
 obj-$(CONFIG_DVB_USB_ZD1301) += zd1301.o
 
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/common
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/common
diff --git a/drivers/media/usb/dvb-usb/Makefile b/drivers/media/usb/dvb-usb/Makefile
index c22514948db2..3decc3432fc2 100644
--- a/drivers/media/usb/dvb-usb/Makefile
+++ b/drivers/media/usb/dvb-usb/Makefile
@@ -80,7 +80,7 @@ obj-$(CONFIG_DVB_USB_AZ6027) += dvb-usb-az6027.o
 dvb-usb-technisat-usb2-objs := technisat-usb2.o
 obj-$(CONFIG_DVB_USB_TECHNISAT_USB2) += dvb-usb-technisat-usb2.o
 
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends/
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends/
 # due to tuner-xc3028
-ccflags-y += -I$(srctree)/drivers/media/tuners
-ccflags-y += -I$(srctree)/drivers/media/common
+ccflags-y += -I$(srctree)drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/common
diff --git a/drivers/media/usb/em28xx/Makefile b/drivers/media/usb/em28xx/Makefile
index 8c2fc3104561..2e029f806993 100644
--- a/drivers/media/usb/em28xx/Makefile
+++ b/drivers/media/usb/em28xx/Makefile
@@ -11,5 +11,5 @@ obj-$(CONFIG_VIDEO_EM28XX_ALSA) += em28xx-alsa.o
 obj-$(CONFIG_VIDEO_EM28XX_DVB) += em28xx-dvb.o
 obj-$(CONFIG_VIDEO_EM28XX_RC) += em28xx-rc.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/usb/go7007/Makefile b/drivers/media/usb/go7007/Makefile
index 712a3507f195..d149cbf63078 100644
--- a/drivers/media/usb/go7007/Makefile
+++ b/drivers/media/usb/go7007/Makefile
@@ -9,4 +9,4 @@ go7007-y := go7007-v4l2.o go7007-driver.o go7007-i2c.o go7007-fw.o \
 
 s2250-y := s2250-board.o
 
-ccflags-$(CONFIG_VIDEO_GO7007_LOADER:m=y) += -I $(srctree)/drivers/media/common
+ccflags-$(CONFIG_VIDEO_GO7007_LOADER:m=y) += -I $(srctree)drivers/media/common
diff --git a/drivers/media/usb/gspca/gl860/Makefile b/drivers/media/usb/gspca/gl860/Makefile
index 7bcfa36f12ac..eb50225b6f46 100644
--- a/drivers/media/usb/gspca/gl860/Makefile
+++ b/drivers/media/usb/gspca/gl860/Makefile
@@ -7,5 +7,5 @@ gspca_gl860-objs := gl860.o \
 		    gl860-ov9655.o \
 		    gl860-mi2020.o
 
-ccflags-y += -I$(srctree)/drivers/media/usb/gspca
+ccflags-y += -I$(srctree)drivers/media/usb/gspca
 
diff --git a/drivers/media/usb/gspca/m5602/Makefile b/drivers/media/usb/gspca/m5602/Makefile
index 95c9db6dc59c..1daa7ecf68e3 100644
--- a/drivers/media/usb/gspca/m5602/Makefile
+++ b/drivers/media/usb/gspca/m5602/Makefile
@@ -9,4 +9,4 @@ gspca_m5602-objs := m5602_core.o \
 		    m5602_s5k83a.o \
 		    m5602_s5k4aa.o
 
-ccflags-y += -I$(srctree)/drivers/media/usb/gspca
+ccflags-y += -I$(srctree)drivers/media/usb/gspca
diff --git a/drivers/media/usb/gspca/stv06xx/Makefile b/drivers/media/usb/gspca/stv06xx/Makefile
index c4d7206e0c92..2e28b9adc91e 100644
--- a/drivers/media/usb/gspca/stv06xx/Makefile
+++ b/drivers/media/usb/gspca/stv06xx/Makefile
@@ -7,5 +7,5 @@ gspca_stv06xx-objs := stv06xx.o \
 		      stv06xx_pb0100.o \
 		      stv06xx_st6422.o
 
-ccflags-y += -I$(srctree)/drivers/media/usb/gspca
+ccflags-y += -I$(srctree)drivers/media/usb/gspca
 
diff --git a/drivers/media/usb/pvrusb2/Makefile b/drivers/media/usb/pvrusb2/Makefile
index 2e71afc4f6de..d5224698a065 100644
--- a/drivers/media/usb/pvrusb2/Makefile
+++ b/drivers/media/usb/pvrusb2/Makefile
@@ -17,5 +17,5 @@ pvrusb2-objs	:= pvrusb2-i2c-core.o \
 
 obj-$(CONFIG_VIDEO_PVRUSB2) += pvrusb2.o
 
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/usb/siano/Makefile b/drivers/media/usb/siano/Makefile
index 758c8686ad46..97a05a34ef98 100644
--- a/drivers/media/usb/siano/Makefile
+++ b/drivers/media/usb/siano/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_SMS_USB_DRV) += smsusb.o
 
-ccflags-y += -I $(srctree)/drivers/media/common/siano
+ccflags-y += -I $(srctree)drivers/media/common/siano
 ccflags-y += $(extra-cflags-y) $(extra-cflags-m)
 
diff --git a/drivers/media/usb/ttusb-budget/Makefile b/drivers/media/usb/ttusb-budget/Makefile
index 09e42bf312f2..e8404df190fb 100644
--- a/drivers/media/usb/ttusb-budget/Makefile
+++ b/drivers/media/usb/ttusb-budget/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DVB_TTUSB_BUDGET) += dvb-ttusb-budget.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 2177b9d63a8f..6ff0a265f152 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -3,8 +3,8 @@
 # Makefile for the V4L2 core
 #
 
-ccflags-y += -I$(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I$(srctree)/drivers/media/tuners
+ccflags-y += -I$(srctree)drivers/media/dvb-frontends
+ccflags-y += -I$(srctree)drivers/media/tuners
 
 tuner-objs	:=	tuner-core.o
 
diff --git a/drivers/net/ethernet/aquantia/atlantic/Makefile b/drivers/net/ethernet/aquantia/atlantic/Makefile
index 8ebcc68e807f..563e523e71cc 100644
--- a/drivers/net/ethernet/aquantia/atlantic/Makefile
+++ b/drivers/net/ethernet/aquantia/atlantic/Makefile
@@ -8,7 +8,7 @@
 
 obj-$(CONFIG_AQTION) += atlantic.o
 
-ccflags-y += -I$(srctree)/$(src)
+ccflags-y += -I$(srctree)$(src)
 
 atlantic-objs := aq_main.o \
 	aq_nic.o \
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/Makefile b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/Makefile
index efdcaaebc455..2e3051aeff13 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/Makefile
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ipsec/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4 \
-             -I $(srctree)/drivers/crypto/chelsio
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4 \
+             -I $(srctree)drivers/crypto/chelsio
 
 obj-$(CONFIG_CHELSIO_IPSEC_INLINE) += ch_ipsec.o
 ch_ipsec-objs := chcr_ipsec.o
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/Makefile b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/Makefile
index 5e7d161c3199..047cc45d1103 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/Makefile
+++ b/drivers/net/ethernet/chelsio/inline_crypto/ch_ktls/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4
 
 obj-$(CONFIG_CHELSIO_TLS_DEVICE) += ch_ktls.o
 ch_ktls-objs := chcr_ktls.o
diff --git a/drivers/net/ethernet/chelsio/inline_crypto/chtls/Makefile b/drivers/net/ethernet/chelsio/inline_crypto/chtls/Makefile
index bc11495acdb3..3ae41889aabf 100644
--- a/drivers/net/ethernet/chelsio/inline_crypto/chtls/Makefile
+++ b/drivers/net/ethernet/chelsio/inline_crypto/chtls/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4 \
-	     -I $(srctree)/drivers/crypto/chelsio
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4 \
+	     -I $(srctree)drivers/crypto/chelsio
 
 obj-$(CONFIG_CRYPTO_DEV_CHELSIO_TLS) += chtls.o
 chtls-objs := chtls_main.o chtls_cm.o chtls_io.o chtls_hw.o
diff --git a/drivers/net/ethernet/chelsio/libcxgb/Makefile b/drivers/net/ethernet/chelsio/libcxgb/Makefile
index aa79264e72ba..2659b76ec704 100644
--- a/drivers/net/ethernet/chelsio/libcxgb/Makefile
+++ b/drivers/net/ethernet/chelsio/libcxgb/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y := -I $(srctree)/$(src)/../cxgb4
+ccflags-y := -I $(srctree)$(src)/../cxgb4
 
 obj-$(CONFIG_CHELSIO_LIB) += libcxgb.o
 
diff --git a/drivers/net/ethernet/freescale/dpaa/Makefile b/drivers/net/ethernet/freescale/dpaa/Makefile
index 4f23e79232fa..ee55492231b5 100644
--- a/drivers/net/ethernet/freescale/dpaa/Makefile
+++ b/drivers/net/ethernet/freescale/dpaa/Makefile
@@ -4,7 +4,7 @@
 #
 
 # Include FMan headers
-FMAN        = $(srctree)/drivers/net/ethernet/freescale/fman
+FMAN        = $(srctree)drivers/net/ethernet/freescale/fman
 ccflags-y += -I$(FMAN)
 
 obj-$(CONFIG_FSL_DPAA_ETH) += fsl_dpa.o
diff --git a/drivers/net/ethernet/freescale/fman/Makefile b/drivers/net/ethernet/freescale/fman/Makefile
index b618091db091..a118b5c679ce 100644
--- a/drivers/net/ethernet/freescale/fman/Makefile
+++ b/drivers/net/ethernet/freescale/fman/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-subdir-ccflags-y +=  -I$(srctree)/drivers/net/ethernet/freescale/fman
+subdir-ccflags-y +=  -I$(srctree)drivers/net/ethernet/freescale/fman
 
 obj-$(CONFIG_FSL_FMAN) += fsl_dpaa_fman.o
 obj-$(CONFIG_FSL_FMAN) += fsl_dpaa_fman_port.o
diff --git a/drivers/net/ethernet/fungible/funeth/Makefile b/drivers/net/ethernet/fungible/funeth/Makefile
index 646d69595b4f..84ea8f214733 100644
--- a/drivers/net/ethernet/fungible/funeth/Makefile
+++ b/drivers/net/ethernet/fungible/funeth/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
-ccflags-y += -I$(srctree)/$(src)/../funcore -I$(srctree)/$(src)
+ccflags-y += -I$(srctree)$(src)/../funcore -I$(srctree)$(src)
 
 obj-$(CONFIG_FUN_ETH) += funeth.o
 
diff --git a/drivers/net/ethernet/hisilicon/hns3/Makefile b/drivers/net/ethernet/hisilicon/hns3/Makefile
index e214bfaece1f..8d8dda879bba 100644
--- a/drivers/net/ethernet/hisilicon/hns3/Makefile
+++ b/drivers/net/ethernet/hisilicon/hns3/Makefile
@@ -3,10 +3,10 @@
 # Makefile for the HISILICON network device drivers.
 #
 
-ccflags-y += -I$(srctree)/$(src)
-ccflags-y += -I$(srctree)/drivers/net/ethernet/hisilicon/hns3/hns3pf
-ccflags-y += -I$(srctree)/drivers/net/ethernet/hisilicon/hns3/hns3vf
-ccflags-y += -I$(srctree)/drivers/net/ethernet/hisilicon/hns3/hns3_common
+ccflags-y += -I$(srctree)$(src)
+ccflags-y += -I$(srctree)drivers/net/ethernet/hisilicon/hns3/hns3pf
+ccflags-y += -I$(srctree)drivers/net/ethernet/hisilicon/hns3/hns3vf
+ccflags-y += -I$(srctree)drivers/net/ethernet/hisilicon/hns3/hns3_common
 
 obj-$(CONFIG_HNS3) += hnae3.o
 
diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/Makefile b/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
index 5664f768cb0c..6e26027337c6 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/Makefile
@@ -15,4 +15,4 @@ rvu_nicpf-$(CONFIG_DCB) += otx2_dcbnl.o
 rvu_nicvf-$(CONFIG_DCB) += otx2_dcbnl.o
 rvu_nicpf-$(CONFIG_MACSEC) += cn10k_macsec.o
 
-ccflags-y += -I$(srctree)/drivers/net/ethernet/marvell/octeontx2/af
+ccflags-y += -I$(srctree)drivers/net/ethernet/marvell/octeontx2/af
diff --git a/drivers/net/ethernet/microchip/lan966x/Makefile b/drivers/net/ethernet/microchip/lan966x/Makefile
index 3b6ac331691d..d71d6ceff5a0 100644
--- a/drivers/net/ethernet/microchip/lan966x/Makefile
+++ b/drivers/net/ethernet/microchip/lan966x/Makefile
@@ -19,4 +19,4 @@ lan966x-switch-$(CONFIG_LAN966X_DCB) += lan966x_dcb.o
 lan966x-switch-$(CONFIG_DEBUG_FS) += lan966x_vcap_debugfs.o
 
 # Provide include files
-ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/vcap
+ccflags-y += -I$(srctree)drivers/net/ethernet/microchip/vcap
diff --git a/drivers/net/ethernet/microchip/sparx5/Makefile b/drivers/net/ethernet/microchip/sparx5/Makefile
index 1cb1cc3f1a85..4c46836f21b4 100644
--- a/drivers/net/ethernet/microchip/sparx5/Makefile
+++ b/drivers/net/ethernet/microchip/sparx5/Makefile
@@ -16,4 +16,4 @@ sparx5-switch-$(CONFIG_SPARX5_DCB) += sparx5_dcb.o
 sparx5-switch-$(CONFIG_DEBUG_FS) += sparx5_vcap_debugfs.o
 
 # Provide include files
-ccflags-y += -I$(srctree)/drivers/net/ethernet/microchip/vcap
+ccflags-y += -I$(srctree)drivers/net/ethernet/microchip/vcap
diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index 8119b49d1da9..d5c4427a677d 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -56,7 +56,7 @@ $(obj)/wanxlfw.bin: $(obj)/wanxlfw.o FORCE
 	$(call if_changed,m68kld_bin_o)
 
 quiet_cmd_m68kas_o_S = M68KAS  $@
-      cmd_m68kas_o_S = $(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
+      cmd_m68kas_o_S = $(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)include/uapi -c -o $@ $<
 
 $(obj)/wanxlfw.o: $(src)/wanxlfw.S FORCE
 	$(call if_changed_dep,m68kas_o_S)
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/Makefile
index dc6d27a36faa..b113712a140d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/Makefile
@@ -6,8 +6,8 @@
 #
 
 ccflags-y += \
-	-I $(srctree)/$(src) \
-	-I $(srctree)/$(src)/../include
+	-I $(srctree)$(src) \
+	-I $(srctree)$(src)/../include
 
 obj-$(CONFIG_BRCMFMAC) += brcmfmac.o
 brcmfmac-objs += \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/Makefile
index 46098705e236..25277805387e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/Makefile
@@ -3,9 +3,9 @@
 # Copyright (c) 2022 Broadcom Corporation
 
 ccflags-y += \
-	-I $(srctree)/$(src) \
-	-I $(srctree)/$(src)/.. \
-	-I $(srctree)/$(src)/../../include
+	-I $(srctree)$(src) \
+	-I $(srctree)$(src)/.. \
+	-I $(srctree)$(src)/../../include
 
 obj-m += brcmfmac-bca.o
 brcmfmac-bca-objs += \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/Makefile
index 5e1fddaff79e..964e6f36a38a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/Makefile
@@ -3,9 +3,9 @@
 # Copyright (c) 2022 Broadcom Corporation
 
 ccflags-y += \
-	-I $(srctree)/$(src) \
-	-I $(srctree)/$(src)/.. \
-	-I $(srctree)/$(src)/../../include
+	-I $(srctree)$(src) \
+	-I $(srctree)$(src)/.. \
+	-I $(srctree)$(src)/../../include
 
 obj-m += brcmfmac-cyw.o
 brcmfmac-cyw-objs += \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/Makefile
index 7f455a19a2b1..366f6232120a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/Makefile
@@ -3,9 +3,9 @@
 # Copyright (c) 2022 Broadcom Corporation
 
 ccflags-y += \
-	-I $(srctree)/$(src) \
-	-I $(srctree)/$(src)/.. \
-	-I $(srctree)/$(src)/../../include
+	-I $(srctree)$(src) \
+	-I $(srctree)$(src)/.. \
+	-I $(srctree)$(src)/../../include
 
 obj-m += brcmfmac-wcc.o
 brcmfmac-wcc-objs += \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
index 090757730ba6..574c2fdf48b7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/Makefile
@@ -16,9 +16,9 @@
 # CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 
 ccflags-y := \
-	-I $(srctree)/$(src) \
-	-I $(srctree)/$(src)/phy \
-	-I $(srctree)/$(src)/../include
+	-I $(srctree)$(src) \
+	-I $(srctree)$(src)/phy \
+	-I $(srctree)$(src)/../include
 
 brcmsmac-y := \
 	mac80211_if.o \
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
index 7a82d615ba2a..bf94658b5159 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmutil/Makefile
@@ -4,7 +4,7 @@
 #
 # Copyright (c) 2011 Broadcom Corporation
 #
-ccflags-y := -I $(srctree)/$(src)/../include
+ccflags-y := -I $(srctree)$(src)/../include
 
 obj-$(CONFIG_BRCMUTIL)	+= brcmutil.o
 brcmutil-objs	= utils.o d11.o
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/Makefile b/drivers/net/wireless/intel/iwlwifi/dvm/Makefile
index 0486b17d7c41..f705d1515316 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/Makefile
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/Makefile
@@ -11,4 +11,4 @@ iwldvm-objs		+= rxon.o devices.o
 iwldvm-$(CONFIG_IWLWIFI_LEDS) += led.o
 iwldvm-$(CONFIG_IWLWIFI_DEBUGFS) += debugfs.o
 
-ccflags-y += -I $(srctree)/$(src)/../
+ccflags-y += -I $(srctree)$(src)/../
diff --git a/drivers/net/wireless/intel/iwlwifi/mei/Makefile b/drivers/net/wireless/intel/iwlwifi/mei/Makefile
index 8e3ef0347db7..9c13119e0470 100644
--- a/drivers/net/wireless/intel/iwlwifi/mei/Makefile
+++ b/drivers/net/wireless/intel/iwlwifi/mei/Makefile
@@ -5,4 +5,4 @@ iwlmei-y += net.o
 iwlmei-$(CONFIG_IWLWIFI_DEVICE_TRACING) += trace.o
 CFLAGS_trace.o := -I$(src)
 
-ccflags-y += -I $(srctree)/$(src)/../
+ccflags-y += -I $(srctree)$(src)/../
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/Makefile b/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
index 593fe28d89cf..4180f8eb8fa8 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/Makefile
@@ -15,4 +15,4 @@ iwlmvm-$(CONFIG_IWLWIFI_LEDS) += led.o
 iwlmvm-$(CONFIG_PM) += d3.o
 iwlmvm-$(CONFIG_IWLMEI) += vendor-cmd.o
 
-ccflags-y += -I $(srctree)/$(src)/../
+ccflags-y += -I $(srctree)$(src)/../
diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8180/Makefile b/drivers/net/wireless/realtek/rtl818x/rtl8180/Makefile
index 565a9a114134..c5587362157e 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8180/Makefile
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8180/Makefile
@@ -3,4 +3,4 @@ rtl818x_pci-objs	:= dev.o rtl8225.o sa2400.o max2820.o grf5101.o rtl8225se.o
 
 obj-$(CONFIG_RTL8180)	+= rtl818x_pci.o
 
-ccflags-y += -I $(srctree)/$(src)/..
+ccflags-y += -I $(srctree)$(src)/..
diff --git a/drivers/net/wireless/realtek/rtl818x/rtl8187/Makefile b/drivers/net/wireless/realtek/rtl818x/rtl8187/Makefile
index 0bf64dfb233a..67eda47d49ad 100644
--- a/drivers/net/wireless/realtek/rtl818x/rtl8187/Makefile
+++ b/drivers/net/wireless/realtek/rtl818x/rtl8187/Makefile
@@ -3,4 +3,4 @@ rtl8187-objs		:= dev.o rtl8225.o leds.o rfkill.o
 
 obj-$(CONFIG_RTL8187)	+= rtl8187.o
 
-ccflags-y += -I $(srctree)/$(src)/..
+ccflags-y += -I $(srctree)$(src)/..
diff --git a/drivers/pinctrl/renesas/Makefile b/drivers/pinctrl/renesas/Makefile
index 3e776955bd4b..c8afc829263f 100644
--- a/drivers/pinctrl/renesas/Makefile
+++ b/drivers/pinctrl/renesas/Makefile
@@ -52,16 +52,16 @@ obj-$(CONFIG_PINCTRL_RZN1)	+= pinctrl-rzn1.o
 obj-$(CONFIG_PINCTRL_RZV2M)	+= pinctrl-rzv2m.o
 
 ifeq ($(CONFIG_COMPILE_TEST),y)
-CFLAGS_pfc-sh7203.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
-CFLAGS_pfc-sh7264.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
-CFLAGS_pfc-sh7269.o	+= -I$(srctree)/arch/sh/include/cpu-sh2a
-CFLAGS_pfc-sh7720.o	+= -I$(srctree)/arch/sh/include/cpu-sh3
-CFLAGS_pfc-sh7722.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7723.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7724.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7734.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7757.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7785.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-sh7786.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
-CFLAGS_pfc-shx3.o	+= -I$(srctree)/arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7203.o	+= -I$(srctree)arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7264.o	+= -I$(srctree)arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7269.o	+= -I$(srctree)arch/sh/include/cpu-sh2a
+CFLAGS_pfc-sh7720.o	+= -I$(srctree)arch/sh/include/cpu-sh3
+CFLAGS_pfc-sh7722.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7723.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7724.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7734.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7757.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7785.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-sh7786.o	+= -I$(srctree)arch/sh/include/cpu-sh4
+CFLAGS_pfc-shx3.o	+= -I$(srctree)arch/sh/include/cpu-sh4
 endif
diff --git a/drivers/scsi/aic7xxx/Makefile b/drivers/scsi/aic7xxx/Makefile
index e0188ecd85b2..1928c3ff81fe 100644
--- a/drivers/scsi/aic7xxx/Makefile
+++ b/drivers/scsi/aic7xxx/Makefile
@@ -55,9 +55,9 @@ aicasm-7xxx-opts-$(CONFIG_AIC7XXX_REG_PRETTY_PRINT) := \
 
 ifeq ($(CONFIG_AIC7XXX_BUILD_FIRMWARE),y)
 $(obj)/aic7xxx_seq.h: $(src)/aic7xxx.seq $(src)/aic7xxx.reg $(obj)/aicasm/aicasm
-	$(obj)/aicasm/aicasm -I$(srctree)/$(src) -r $(obj)/aic7xxx_reg.h \
+	$(obj)/aicasm/aicasm -I$(srctree)$(src) -r $(obj)/aic7xxx_reg.h \
 			      $(aicasm-7xxx-opts-y) -o $(obj)/aic7xxx_seq.h \
-			      $(srctree)/$(src)/aic7xxx.seq
+			      $(srctree)$(src)/aic7xxx.seq
 
 $(aic7xxx-gen-y): $(objtree)/$(obj)/aic7xxx_seq.h
 	@true
@@ -73,9 +73,9 @@ aicasm-79xx-opts-$(CONFIG_AIC79XX_REG_PRETTY_PRINT) := \
 
 ifeq ($(CONFIG_AIC79XX_BUILD_FIRMWARE),y)
 $(obj)/aic79xx_seq.h: $(src)/aic79xx.seq $(src)/aic79xx.reg $(obj)/aicasm/aicasm
-	$(obj)/aicasm/aicasm -I$(srctree)/$(src) -r $(obj)/aic79xx_reg.h \
+	$(obj)/aicasm/aicasm -I$(srctree)$(src) -r $(obj)/aic79xx_reg.h \
 			      $(aicasm-79xx-opts-y) -o $(obj)/aic79xx_seq.h \
-			      $(srctree)/$(src)/aic79xx.seq
+			      $(srctree)$(src)/aic79xx.seq
 
 $(aic79xx-gen-y): $(objtree)/$(obj)/aic79xx_seq.h
 	@true
@@ -83,5 +83,5 @@ else
 $(obj)/aic79xx_reg_print.c: $(src)/aic79xx_reg_print.c_shipped
 endif
 
-$(obj)/aicasm/aicasm: $(srctree)/$(src)/aicasm/*.[chyl]
-	$(MAKE) -C $(srctree)/$(src)/aicasm OUTDIR=$(shell pwd)/$(obj)/aicasm/
+$(obj)/aicasm/aicasm: $(srctree)$(src)/aicasm/*.[chyl]
+	$(MAKE) -C $(srctree)$(src)/aicasm OUTDIR=$(shell pwd)/$(obj)/aicasm/
diff --git a/drivers/scsi/csiostor/Makefile b/drivers/scsi/csiostor/Makefile
index d047e22eac0d..3c59133e8d08 100644
--- a/drivers/scsi/csiostor/Makefile
+++ b/drivers/scsi/csiostor/Makefile
@@ -4,7 +4,7 @@
 #
 ##
 
-ccflags-y += -I$(srctree)/drivers/net/ethernet/chelsio/cxgb4
+ccflags-y += -I$(srctree)drivers/net/ethernet/chelsio/cxgb4
 
 obj-$(CONFIG_SCSI_CHELSIO_FCOE) += csiostor.o
 
diff --git a/drivers/scsi/cxgbi/Makefile b/drivers/scsi/cxgbi/Makefile
index abfd38a26fec..c1f3a710025d 100644
--- a/drivers/scsi/cxgbi/Makefile
+++ b/drivers/scsi/cxgbi/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ccflags-y += -I $(srctree)/drivers/net/ethernet/chelsio/libcxgb
+ccflags-y += -I $(srctree)drivers/net/ethernet/chelsio/libcxgb
 
 obj-$(CONFIG_SCSI_CXGB3_ISCSI)	+= libcxgbi.o cxgb3i/
 obj-$(CONFIG_SCSI_CXGB4_ISCSI)	+= libcxgbi.o cxgb4i/
diff --git a/drivers/scsi/libsas/Makefile b/drivers/scsi/libsas/Makefile
index 9dc32736cf21..40d63adea355 100644
--- a/drivers/scsi/libsas/Makefile
+++ b/drivers/scsi/libsas/Makefile
@@ -18,4 +18,4 @@ libsas-y +=  sas_init.o     \
 libsas-$(CONFIG_SCSI_SAS_ATA) +=	sas_ata.o
 libsas-$(CONFIG_SCSI_SAS_HOST_SMP) +=	sas_host_smp.o
 
-ccflags-y := -DDEBUG -I$(srctree)/drivers/scsi
+ccflags-y := -DDEBUG -I$(srctree)drivers/scsi
diff --git a/drivers/scsi/pcmcia/Makefile b/drivers/scsi/pcmcia/Makefile
index 02f5b44a2685..23a073d8b485 100644
--- a/drivers/scsi/pcmcia/Makefile
+++ b/drivers/scsi/pcmcia/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-ccflags-y		:= -I $(srctree)/drivers/scsi
+ccflags-y		:= -I $(srctree)drivers/scsi
 
 # 16-bit client drivers
 obj-$(CONFIG_PCMCIA_QLOGIC)	+= qlogic_cs.o
diff --git a/drivers/staging/media/atomisp/Makefile b/drivers/staging/media/atomisp/Makefile
index fcd3e51ae9ce..26639cc33263 100644
--- a/drivers/staging/media/atomisp/Makefile
+++ b/drivers/staging/media/atomisp/Makefile
@@ -9,7 +9,7 @@ obj-$(CONFIG_VIDEO_ATOMISP) += pci/atomisp_gmin_platform.o
 # While on staging, keep debug enabled
 DEFINES += -DDEBUG
 
-atomisp = $(srctree)/drivers/staging/media/atomisp/
+atomisp = $(srctree)drivers/staging/media/atomisp/
 
 # SPDX-License-Identifier: GPL-2.0
 atomisp-objs += \
diff --git a/drivers/staging/media/av7110/Makefile b/drivers/staging/media/av7110/Makefile
index 307b267598ea..1454432aba56 100644
--- a/drivers/staging/media/av7110/Makefile
+++ b/drivers/staging/media/av7110/Makefile
@@ -16,7 +16,7 @@ obj-$(CONFIG_DVB_AV7110) += dvb-ttpci.o
 
 obj-$(CONFIG_DVB_SP8870) += sp8870.o
 
-ccflags-y += -I $(srctree)/drivers/media/dvb-frontends
-ccflags-y += -I $(srctree)/drivers/media/tuners
-ccflags-y += -I $(srctree)/drivers/media/pci/ttpci
-ccflags-y += -I $(srctree)/drivers/media/common
+ccflags-y += -I $(srctree)drivers/media/dvb-frontends
+ccflags-y += -I $(srctree)drivers/media/tuners
+ccflags-y += -I $(srctree)drivers/media/pci/ttpci
+ccflags-y += -I $(srctree)drivers/media/common
diff --git a/drivers/staging/rtl8723bs/Makefile b/drivers/staging/rtl8723bs/Makefile
index 590bde02058c..9504765881f9 100644
--- a/drivers/staging/rtl8723bs/Makefile
+++ b/drivers/staging/rtl8723bs/Makefile
@@ -62,4 +62,4 @@ r8723bs-y = \
 
 obj-$(CONFIG_RTL8723BS) := r8723bs.o
 
-ccflags-y += -I$(srctree)/$(src)/include -I$(srctree)/$(src)/hal
+ccflags-y += -I$(srctree)$(src)/include -I$(srctree)$(src)/hal
diff --git a/drivers/target/iscsi/cxgbit/Makefile b/drivers/target/iscsi/cxgbit/Makefile
index 0dcaf2006f78..6a740ea203c0 100644
--- a/drivers/target/iscsi/cxgbit/Makefile
+++ b/drivers/target/iscsi/cxgbit/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -I $(srctree)/drivers/net/ethernet/chelsio/cxgb4
-ccflags-y += -I $(srctree)/drivers/net/ethernet/chelsio/libcxgb
-ccflags-y += -I $(srctree)/drivers/target/iscsi
+ccflags-y := -I $(srctree)drivers/net/ethernet/chelsio/cxgb4
+ccflags-y += -I $(srctree)drivers/net/ethernet/chelsio/libcxgb
+ccflags-y += -I $(srctree)drivers/target/iscsi
 
 obj-$(CONFIG_ISCSI_TARGET_CXGB4)  += cxgbit.o
 
diff --git a/drivers/tty/serial/8250/Makefile b/drivers/tty/serial/8250/Makefile
index ea2e81f58eac..849c87f395aa 100644
--- a/drivers/tty/serial/8250/Makefile
+++ b/drivers/tty/serial/8250/Makefile
@@ -50,4 +50,4 @@ obj-$(CONFIG_SERIAL_8250_CS)		+= serial_cs.o
 obj-$(CONFIG_SERIAL_8250_UNIPHIER)	+= 8250_uniphier.o
 obj-$(CONFIG_SERIAL_8250_TEGRA)		+= 8250_tegra.o
 
-CFLAGS_8250_ingenic.o += -I$(srctree)/scripts/dtc/libfdt
+CFLAGS_8250_ingenic.o += -I$(srctree)scripts/dtc/libfdt
diff --git a/drivers/usb/gadget/function/Makefile b/drivers/usb/gadget/function/Makefile
index 87917a7d4a9b..c7e8b4c41b61 100644
--- a/drivers/usb/gadget/function/Makefile
+++ b/drivers/usb/gadget/function/Makefile
@@ -3,8 +3,8 @@
 # USB peripheral controller drivers
 #
 
-ccflags-y			:= -I$(srctree)/drivers/usb/gadget/
-ccflags-y			+= -I$(srctree)/drivers/usb/gadget/udc/
+ccflags-y			:= -I$(srctree)drivers/usb/gadget/
+ccflags-y			+= -I$(srctree)drivers/usb/gadget/udc/
 
 # USB Functions
 usb_f_acm-y			:= f_acm.o
diff --git a/drivers/usb/gadget/legacy/Makefile b/drivers/usb/gadget/legacy/Makefile
index 4d864bf82799..ea61cdea4366 100644
--- a/drivers/usb/gadget/legacy/Makefile
+++ b/drivers/usb/gadget/legacy/Makefile
@@ -3,9 +3,9 @@
 # USB gadget drivers
 #
 
-ccflags-y			:= -I$(srctree)/drivers/usb/gadget/
-ccflags-y			+= -I$(srctree)/drivers/usb/gadget/udc/
-ccflags-y			+= -I$(srctree)/drivers/usb/gadget/function/
+ccflags-y			:= -I$(srctree)drivers/usb/gadget/
+ccflags-y			+= -I$(srctree)drivers/usb/gadget/udc/
+ccflags-y			+= -I$(srctree)drivers/usb/gadget/function/
 
 g_zero-y			:= zero.o
 g_audio-y			:= audio.o
diff --git a/drivers/usb/storage/Makefile b/drivers/usb/storage/Makefile
index 46635fa4a340..1b3bfdabb0c2 100644
--- a/drivers/usb/storage/Makefile
+++ b/drivers/usb/storage/Makefile
@@ -6,7 +6,7 @@
 # Rewritten to use lists instead of if-statements.
 #
 
-ccflags-y := -I $(srctree)/drivers/scsi
+ccflags-y := -I $(srctree)drivers/scsi
 
 ccflags-y += -DDEFAULT_SYMBOL_NAMESPACE=USB_STORAGE
 
diff --git a/drivers/vdpa/mlx5/Makefile b/drivers/vdpa/mlx5/Makefile
index e791394c33e3..a06ab83397cd 100644
--- a/drivers/vdpa/mlx5/Makefile
+++ b/drivers/vdpa/mlx5/Makefile
@@ -1,4 +1,4 @@
-subdir-ccflags-y += -I$(srctree)/drivers/vdpa/mlx5/core
+subdir-ccflags-y += -I$(srctree)drivers/vdpa/mlx5/core
 
 obj-$(CONFIG_MLX5_VDPA_NET) += mlx5_vdpa.o
 mlx5_vdpa-$(CONFIG_MLX5_VDPA_NET) += net/mlx5_vnet.o core/resources.o core/mr.o net/debug.o
diff --git a/fs/hostfs/Makefile b/fs/hostfs/Makefile
index 16be592e8085..db0a7054acff 100644
--- a/fs/hostfs/Makefile
+++ b/fs/hostfs/Makefile
@@ -10,4 +10,4 @@ hostfs-builtin-$(CONFIG_HOSTFS) += hostfs_user.o hostfs_user_exp.o
 obj-y := $(hostfs-builtin-y) $(hostfs-builtin-m)
 obj-$(CONFIG_HOSTFS) += hostfs.o
 
-include $(srctree)/arch/um/scripts/Makefile.rules
+include $(srctree)arch/um/scripts/Makefile.rules
diff --git a/fs/iomap/Makefile b/fs/iomap/Makefile
index fc070184b7fa..ccb7313ef101 100644
--- a/fs/iomap/Makefile
+++ b/fs/iomap/Makefile
@@ -4,7 +4,7 @@
 # All Rights Reserved.
 #
 
-ccflags-y += -I $(srctree)/$(src)		# needed for trace events
+ccflags-y += -I $(srctree)$(src)		# needed for trace events
 
 obj-$(CONFIG_FS_IOMAP)		+= iomap.o
 
diff --git a/fs/unicode/Makefile b/fs/unicode/Makefile
index 0e51c0025a16..9ad8ab2fb9f4 100644
--- a/fs/unicode/Makefile
+++ b/fs/unicode/Makefile
@@ -18,13 +18,13 @@ ifdef REGENERATE_UTF8DATA
 
 quiet_cmd_utf8data = GEN     $@
       cmd_utf8data = $< \
-		-a $(srctree)/$(src)/DerivedAge.txt \
-		-c $(srctree)/$(src)/DerivedCombiningClass.txt \
-		-p $(srctree)/$(src)/DerivedCoreProperties.txt \
-		-d $(srctree)/$(src)/UnicodeData.txt \
-		-f $(srctree)/$(src)/CaseFolding.txt \
-		-n $(srctree)/$(src)/NormalizationCorrections.txt \
-		-t $(srctree)/$(src)/NormalizationTest.txt \
+		-a $(srctree)$(src)/DerivedAge.txt \
+		-c $(srctree)$(src)/DerivedCombiningClass.txt \
+		-p $(srctree)$(src)/DerivedCoreProperties.txt \
+		-d $(srctree)$(src)/UnicodeData.txt \
+		-f $(srctree)$(src)/CaseFolding.txt \
+		-n $(srctree)$(src)/NormalizationCorrections.txt \
+		-t $(srctree)$(src)/NormalizationTest.txt \
 		-o $@
 
 $(obj)/utf8data.c: $(obj)/mkutf8data $(filter %.txt, $(cmd_utf8data)) FORCE
diff --git a/fs/xfs/Makefile b/fs/xfs/Makefile
index fbe3cdc79036..8f67f725ba8f 100644
--- a/fs/xfs/Makefile
+++ b/fs/xfs/Makefile
@@ -4,8 +4,8 @@
 # All Rights Reserved.
 #
 
-ccflags-y += -I $(srctree)/$(src)		# needed for trace events
-ccflags-y += -I $(srctree)/$(src)/libxfs
+ccflags-y += -I $(srctree)$(src)		# needed for trace events
+ccflags-y += -I $(srctree)$(src)/libxfs
 
 obj-$(CONFIG_XFS_FS)		+= xfs.o
 
diff --git a/init/Makefile b/init/Makefile
index cbac576c57d6..bd4c1b653010 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -52,7 +52,7 @@ CFLAGS_version.o := -include $(obj)/utsversion-tmp.h
 # Build version-timestamp.c with final UTS_VERSION
 #
 
-include/generated/utsversion.h: build-version-auto = $(shell $(srctree)/$(src)/build-version)
+include/generated/utsversion.h: build-version-auto = $(shell $(srctree)$(src)/build-version)
 include/generated/utsversion.h: build-timestamp-auto = $(shell LC_ALL=C date)
 include/generated/utsversion.h: FORCE
 	$(call filechk,uts_version)
diff --git a/kernel/Makefile b/kernel/Makefile
index ce105a5558fc..08c6e8397125 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -154,7 +154,7 @@ $(obj)/config_data: $(KCONFIG_CONFIG) FORCE
 $(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
 
 quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
-      cmd_genikh = $(CONFIG_SHELL) $(srctree)/kernel/gen_kheaders.sh $@
+      cmd_genikh = $(CONFIG_SHELL) $(srctree)kernel/gen_kheaders.sh $@
 $(obj)/kheaders_data.tar.xz: FORCE
 	$(call cmd,genikh)
 
diff --git a/kernel/bpf/Makefile b/kernel/bpf/Makefile
index f526b7573e97..4dae910788c9 100644
--- a/kernel/bpf/Makefile
+++ b/kernel/bpf/Makefile
@@ -44,5 +44,5 @@ endif
 obj-$(CONFIG_BPF_PRELOAD) += preload/
 
 obj-$(CONFIG_BPF_SYSCALL) += relo_core.o
-$(obj)/relo_core.o: $(srctree)/tools/lib/bpf/relo_core.c FORCE
+$(obj)/relo_core.o: $(srctree)tools/lib/bpf/relo_core.c FORCE
 	$(call if_changed_rule,cc_o_c)
diff --git a/kernel/bpf/preload/Makefile b/kernel/bpf/preload/Makefile
index 20f89cc0a0a6..d0c310348e62 100644
--- a/kernel/bpf/preload/Makefile
+++ b/kernel/bpf/preload/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-LIBBPF_INCLUDE = $(srctree)/tools/lib
+LIBBPF_INCLUDE = $(srctree)tools/lib
 
 obj-$(CONFIG_BPF_PRELOAD_UMD) += bpf_preload.o
 CFLAGS_bpf_preload_kern.o += -I$(LIBBPF_INCLUDE)
diff --git a/kernel/gcov/Makefile b/kernel/gcov/Makefile
index ccd02afaeffb..0c53d1930044 100644
--- a/kernel/gcov/Makefile
+++ b/kernel/gcov/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ccflags-y := -DSRCTREE='"$(srctree)"' -DOBJTREE='"$(objtree)"'
+ccflags-y := -DSRCTREE='"$(srctree:%/=%)"' -DOBJTREE='"$(objtree)"'
 
 obj-y := base.o fs.o
 obj-$(CONFIG_CC_IS_GCC) += gcc_base.o gcc_4_7.o
diff --git a/lib/Makefile b/lib/Makefile
index 8511d8006fd1..37c2e014a14a 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -298,7 +298,7 @@ obj-$(CONFIG_REF_TRACKER) += ref_tracker.o
 libfdt_files = fdt.o fdt_ro.o fdt_wip.o fdt_rw.o fdt_sw.o fdt_strerror.o \
 	       fdt_empty_tree.o fdt_addresses.o
 $(foreach file, $(libfdt_files), \
-	$(eval CFLAGS_$(file) = -I $(srctree)/scripts/dtc/libfdt))
+	$(eval CFLAGS_$(file) = -I $(srctree)scripts/dtc/libfdt))
 lib-$(CONFIG_LIBFDT) += $(libfdt_files)
 
 obj-$(CONFIG_BOOT_CONFIG) += bootconfig.o
@@ -349,12 +349,12 @@ obj-$(CONFIG_OID_REGISTRY) += oid_registry.o
 
 $(obj)/oid_registry.o: $(obj)/oid_registry_data.c
 
-$(obj)/oid_registry_data.c: $(srctree)/include/linux/oid_registry.h \
+$(obj)/oid_registry_data.c: $(srctree)include/linux/oid_registry.h \
 			    $(src)/build_OID_registry
 	$(call cmd,build_OID_registry)
 
 quiet_cmd_build_OID_registry = GEN     $@
-      cmd_build_OID_registry = perl $(srctree)/$(src)/build_OID_registry $< $@
+      cmd_build_OID_registry = perl $(srctree)$(src)/build_OID_registry $< $@
 
 clean-files	+= oid_registry_data.c
 
@@ -412,12 +412,12 @@ obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
 obj-$(CONFIG_FIRMWARE_TABLE) += fw_table.o
 
 # FORTIFY_SOURCE compile-time behavior tests
-TEST_FORTIFY_SRCS = $(wildcard $(srctree)/$(src)/test_fortify/*-*.c)
-TEST_FORTIFY_LOGS = $(patsubst $(srctree:%/=%)/$(src)/%.c, %.log, $(TEST_FORTIFY_SRCS))
+TEST_FORTIFY_SRCS = $(wildcard $(srctree)$(src)/test_fortify/*-*.c)
+TEST_FORTIFY_LOGS = $(patsubst $(srctree)$(src)/%.c, %.log, $(TEST_FORTIFY_SRCS))
 TEST_FORTIFY_LOG = test_fortify.log
 
 quiet_cmd_test_fortify = TEST    $@
-      cmd_test_fortify = $(CONFIG_SHELL) $(srctree)/scripts/test_fortify.sh \
+      cmd_test_fortify = $(CONFIG_SHELL) $(srctree)scripts/test_fortify.sh \
 			$< $@ "$(NM)" $(CC) $(c_flags) \
 			$(call cc-disable-warning,fortify-source) \
 			-DKBUILD_EXTRA_WARN1
@@ -427,8 +427,8 @@ clean-files += $(TEST_FORTIFY_LOGS)
 clean-files += $(addsuffix .o, $(TEST_FORTIFY_LOGS))
 $(obj)/test_fortify/%.log: $(src)/test_fortify/%.c \
 			   $(src)/test_fortify/test_fortify.h \
-			   $(srctree)/include/linux/fortify-string.h \
-			   $(srctree)/scripts/test_fortify.sh \
+			   $(srctree)include/linux/fortify-string.h \
+			   $(srctree)scripts/test_fortify.sh \
 			   FORCE
 	$(call if_changed,test_fortify)
 
diff --git a/lib/raid6/Makefile b/lib/raid6/Makefile
index 1c5420ff254e..20bb80c98742 100644
--- a/lib/raid6/Makefile
+++ b/lib/raid6/Makefile
@@ -53,7 +53,7 @@ endif
 endif
 
 quiet_cmd_unroll = UNROLL  $@
-      cmd_unroll = $(AWK) -v N=$* -f $(srctree)/$(src)/unroll.awk < $< > $@
+      cmd_unroll = $(AWK) -v N=$* -f $(srctree)$(src)/unroll.awk < $< > $@
 
 targets += int1.c int2.c int4.c int8.c
 $(obj)/int%.c: $(src)/int.uc $(src)/unroll.awk FORCE
diff --git a/net/wireless/Makefile b/net/wireless/Makefile
index 72074fd36df4..2552b060ef8f 100644
--- a/net/wireless/Makefile
+++ b/net/wireless/Makefile
@@ -25,7 +25,7 @@ ifneq ($(CONFIG_CFG80211_EXTRA_REGDB_KEYDIR),)
 cfg80211-y += extra-certs.o
 endif
 
-$(obj)/shipped-certs.c: $(sort $(wildcard $(srctree)/$(src)/certs/*.hex))
+$(obj)/shipped-certs.c: $(sort $(wildcard $(srctree)$(src)/certs/*.hex))
 	@$(kecho) "  GEN     $@"
 	$(Q)(echo '#include "reg.h"'; \
 	  echo 'const u8 shipped_regdb_certs[] = {'; \
diff --git a/rust/Makefile b/rust/Makefile
index 0a7c278abf0b..749619e4cfc3 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -94,8 +94,8 @@ quiet_cmd_rustdoc = RUSTDOC $(if $(rustdoc_host),H, ) $<
 # and then retouch the generated files.
 rustdoc: rustdoc-core rustdoc-macros rustdoc-compiler_builtins \
     rustdoc-alloc rustdoc-kernel
-	$(Q)cp $(srctree)/Documentation/images/logo.svg $(rustdoc_output)/static.files/
-	$(Q)cp $(srctree)/Documentation/images/COPYING-logo $(rustdoc_output)/static.files/
+	$(Q)cp $(srctree)Documentation/images/logo.svg $(rustdoc_output)/static.files/
+	$(Q)cp $(srctree)Documentation/images/COPYING-logo $(rustdoc_output)/static.files/
 	$(Q)find $(rustdoc_output) -name '*.html' -type f -print0 | xargs -0 sed -Ei \
 		-e 's:rust-logo-[0-9a-f]+\.svg:logo.svg:g' \
 		-e 's:favicon-[0-9a-f]+\.svg:logo.svg:g' \
@@ -239,7 +239,7 @@ quiet_cmd_rustsysroot = RUSTSYSROOT
 	rm -rf $(objtree)/$(obj)/test; \
 	mkdir -p $(objtree)/$(obj)/test; \
 	cp -a $(rustc_sysroot) $(objtree)/$(obj)/test/sysroot; \
-	cp -r $(srctree)/$(src)/alloc/* \
+	cp -r $(srctree)$(src)/alloc/* \
 		$(objtree)/$(obj)/test/sysroot/lib/rustlib/src/rust/library/alloc/src; \
 	echo '\#!/bin/sh' > $(objtree)/$(obj)/test/rustc_sysroot; \
 	echo "$(RUSTC) --sysroot=$(abs_objtree)/$(obj)/test/sysroot \"\$$@\"" \
@@ -312,7 +312,7 @@ bindgen_extra_c_flags = -w --target=$(BINDGEN_TARGET)
 # https://github.com/llvm/llvm-project/issues/44842
 # https://github.com/llvm/llvm-project/blob/llvmorg-16.0.0-rc2/clang/docs/ReleaseNotes.rst#deprecated-compiler-flags
 ifdef CONFIG_INIT_STACK_ALL_ZERO
-libclang_maj_ver=$(shell $(BINDGEN) $(srctree)/scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
+libclang_maj_ver=$(shell $(BINDGEN) $(srctree)scripts/rust_is_available_bindgen_libclang.h 2>&1 | sed -ne 's/.*clang version \([0-9]*\).*/\1/p')
 ifeq ($(shell expr $(libclang_maj_ver) \< 16), 1)
 bindgen_extra_c_flags += -enable-trivial-auto-var-init-zero-knowing-it-will-be-removed-from-clang
 endif
@@ -339,7 +339,7 @@ quiet_cmd_bindgen = BINDGEN $@
 		$(bindgen_target_cflags) $(bindgen_target_extra)
 
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_flags = \
-    $(shell grep -Ev '^#|^$$' $(srctree)/$(src)/bindgen_parameters)
+    $(shell grep -Ev '^#|^$$' $(srctree)$(src)/bindgen_parameters)
 $(obj)/bindings/bindings_generated.rs: private bindgen_target_extra = ; \
     sed -Ei 's/pub const RUST_CONST_HELPER_([a-zA-Z0-9_]*)/pub const \1/g' $@
 $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
@@ -347,7 +347,7 @@ $(obj)/bindings/bindings_generated.rs: $(src)/bindings/bindings_helper.h \
 	$(call if_changed_dep,bindgen)
 
 $(obj)/uapi/uapi_generated.rs: private bindgen_target_flags = \
-    $(shell grep -Ev '^#|^$$' $(srctree)/$(src)/bindgen_parameters)
+    $(shell grep -Ev '^#|^$$' $(srctree)$(src)/bindgen_parameters)
 $(obj)/uapi/uapi_generated.rs: $(src)/uapi/uapi_helper.h \
     $(src)/bindgen_parameters FORCE
 	$(call if_changed_dep,bindgen)
@@ -411,7 +411,7 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@)
 
 rust-analyzer:
-	$(Q)$(srctree)/scripts/generate_rust_analyzer.py \
+	$(Q)$(srctree)scripts/generate_rust_analyzer.py \
 		--cfgs='core=$(core-cfgs)' --cfgs='alloc=$(alloc-cfgs)' \
 		$(abs_srctree) $(abs_objtree) \
 		$(RUST_LIB_SRC) $(KBUILD_EXTMOD) > \
diff --git a/samples/bpf/Makefile b/samples/bpf/Makefile
index 8b53249aa73a..e3951cfe3d10 100644
--- a/samples/bpf/Makefile
+++ b/samples/bpf/Makefile
@@ -164,8 +164,8 @@ endif
 ifeq ($(ARCH), mips)
 TPROGS_CFLAGS += -D__SANE_USERSPACE_TYPES__
 ifdef CONFIG_MACH_LOONGSON64
-BPF_EXTRA_CFLAGS += -I$(srctree)/arch/mips/include/asm/mach-loongson64
-BPF_EXTRA_CFLAGS += -I$(srctree)/arch/mips/include/asm/mach-generic
+BPF_EXTRA_CFLAGS += -I$(srctree)arch/mips/include/asm/mach-loongson64
+BPF_EXTRA_CFLAGS += -I$(srctree)arch/mips/include/asm/mach-generic
 endif
 endif
 
@@ -177,11 +177,11 @@ TPROGS_CFLAGS += $(call try-run,\
 	$(CC) -Werror -fsanitize=bounds -x c - -o "$$TMP",-fsanitize=bounds,)
 
 TPROGS_CFLAGS += -I$(objtree)/usr/include
-TPROGS_CFLAGS += -I$(srctree)/tools/testing/selftests/bpf/
+TPROGS_CFLAGS += -I$(srctree)tools/testing/selftests/bpf/
 TPROGS_CFLAGS += -I$(LIBBPF_INCLUDE)
-TPROGS_CFLAGS += -I$(srctree)/tools/include
-TPROGS_CFLAGS += -I$(srctree)/tools/perf
-TPROGS_CFLAGS += -I$(srctree)/tools/lib
+TPROGS_CFLAGS += -I$(srctree)tools/include
+TPROGS_CFLAGS += -I$(srctree)tools/perf
+TPROGS_CFLAGS += -I$(srctree)tools/lib
 TPROGS_CFLAGS += -DHAVE_ATTR_TEST=0
 
 ifdef SYSROOT
@@ -312,7 +312,7 @@ $(obj)/hbm_out_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
 $(obj)/hbm.o: $(src)/hbm.h
 $(obj)/hbm_edt_kern.o: $(src)/hbm.h $(src)/hbm_kern.h
 
-# Override includes for xdp_sample_user.o because $(srctree)/usr/include in
+# Override includes for xdp_sample_user.o because $(srctree)usr/include in
 # TPROGS_CFLAGS causes conflicts
 XDP_SAMPLE_CFLAGS += -Wall -O2 \
 		     -I$(src)/../../tools/include \
@@ -365,8 +365,8 @@ $(obj)/xdp_router_ipv4.bpf.o: $(obj)/xdp_sample.bpf.o
 $(obj)/%.bpf.o: $(src)/%.bpf.c $(obj)/vmlinux.h $(src)/xdp_sample.bpf.h $(src)/xdp_sample_shared.h
 	@echo "  CLANG-BPF " $@
 	$(Q)$(CLANG) -g -O2 --target=bpf -D__TARGET_ARCH_$(SRCARCH) \
-		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
-		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
+		-Wno-compare-distinct-pointer-types -I$(srctree)include \
+		-I$(srctree)samples/bpf -I$(srctree)tools/include \
 		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
 		-c $(filter %.bpf.c,$^) -o $@
 
@@ -398,7 +398,7 @@ $(BPF_SKELS_LINKED): $(BPF_OBJS_LINKED) $(BPFTOOL)
 $(obj)/%.o: $(src)/%.c
 	@echo "  CLANG-bpf " $@
 	$(Q)$(CLANG) $(NOSTDINC_FLAGS) $(LINUXINCLUDE) $(BPF_EXTRA_CFLAGS) \
-		-I$(obj) -I$(srctree)/tools/testing/selftests/bpf/ \
+		-I$(obj) -I$(srctree)tools/testing/selftests/bpf/ \
 		-I$(LIBBPF_INCLUDE) \
 		-D__KERNEL__ -D__BPF_TRACING__ -Wno-unused-value -Wno-pointer-sign \
 		-D__TARGET_ARCH_$(SRCARCH) -Wno-compare-distinct-pointer-types \
@@ -406,7 +406,7 @@ $(obj)/%.o: $(src)/%.c
 		-Wno-address-of-packed-member -Wno-tautological-compare \
 		-Wno-unknown-warning-option $(CLANG_ARCH_ARGS) \
 		-fno-asynchronous-unwind-tables -fcf-protection \
-		-I$(srctree)/samples/bpf/ -include asm_goto_workaround.h \
+		-I$(srctree)samples/bpf/ -include asm_goto_workaround.h \
 		-O2 -emit-llvm -Xclang -disable-llvm-passes -c $< -o - | \
 		$(OPT) -O2 -mtriple=bpf-pc-linux | $(LLVM_DIS) | \
 		$(LLC) -march=bpf $(LLC_FLAGS) -filetype=obj -o $@
diff --git a/samples/coresight/Makefile b/samples/coresight/Makefile
index b3fce4af2347..931bd2900ec3 100644
--- a/samples/coresight/Makefile
+++ b/samples/coresight/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_SAMPLE_CORESIGHT_SYSCFG) += coresight-cfg-sample.o
-ccflags-y += -I$(srctree)/drivers/hwtracing/coresight
+ccflags-y += -I$(srctree)drivers/hwtracing/coresight
diff --git a/samples/hid/Makefile b/samples/hid/Makefile
index 8af8a52d0ab7..28078ce84d65 100644
--- a/samples/hid/Makefile
+++ b/samples/hid/Makefile
@@ -36,8 +36,8 @@ endif
 ifeq ($(ARCH), mips)
 TPROGS_CFLAGS += -D__SANE_USERSPACE_TYPES__
 ifdef CONFIG_MACH_LOONGSON64
-BPF_EXTRA_CFLAGS += -I$(srctree)/arch/mips/include/asm/mach-loongson64
-BPF_EXTRA_CFLAGS += -I$(srctree)/arch/mips/include/asm/mach-generic
+BPF_EXTRA_CFLAGS += -I$(srctree)arch/mips/include/asm/mach-loongson64
+BPF_EXTRA_CFLAGS += -I$(srctree)arch/mips/include/asm/mach-generic
 endif
 endif
 
@@ -47,7 +47,7 @@ TPROGS_CFLAGS += -Wstrict-prototypes
 
 TPROGS_CFLAGS += -I$(objtree)/usr/include
 TPROGS_CFLAGS += -I$(LIBBPF_INCLUDE)
-TPROGS_CFLAGS += -I$(srctree)/tools/include
+TPROGS_CFLAGS += -I$(srctree)tools/include
 
 ifdef SYSROOT
 TPROGS_CFLAGS += --sysroot=$(SYSROOT)
@@ -199,8 +199,8 @@ EXTRA_BPF_HEADERS_SRC := $(addprefix $(src)/,$(EXTRA_BPF_HEADERS))
 $(obj)/%.bpf.o: $(src)/%.bpf.c $(EXTRA_BPF_HEADERS_SRC) $(obj)/vmlinux.h
 	@echo "  CLANG-BPF " $@
 	$(Q)$(CLANG) -g -O2 --target=bpf -D__TARGET_ARCH_$(SRCARCH) \
-		-Wno-compare-distinct-pointer-types -I$(srctree)/include \
-		-I$(srctree)/samples/bpf -I$(srctree)/tools/include \
+		-Wno-compare-distinct-pointer-types -I$(srctree)include \
+		-I$(srctree)samples/bpf -I$(srctree)tools/include \
 		-I$(LIBBPF_INCLUDE) $(CLANG_SYS_INCLUDES) \
 		-c $(filter %.bpf.c,$^) -o $@
 
@@ -233,7 +233,7 @@ $(BPF_SKELS_LINKED): $(BPF_OBJS_LINKED) $(BPFTOOL)
 $(obj)/%.o: $(src)/%.c
 	@echo "  CLANG-bpf " $@
 	$(Q)$(CLANG) $(NOSTDINC_FLAGS) $(LINUXINCLUDE) $(BPF_EXTRA_CFLAGS) \
-		-I$(obj) -I$(srctree)/tools/testing/selftests/bpf/ \
+		-I$(obj) -I$(srctree)tools/testing/selftests/bpf/ \
 		-I$(LIBBPF_INCLUDE) \
 		-D__KERNEL__ -D__BPF_TRACING__ -Wno-unused-value -Wno-pointer-sign \
 		-D__TARGET_ARCH_$(SRCARCH) -Wno-compare-distinct-pointer-types \
@@ -241,7 +241,7 @@ $(obj)/%.o: $(src)/%.c
 		-Wno-address-of-packed-member -Wno-tautological-compare \
 		-Wno-unknown-warning-option $(CLANG_ARCH_ARGS) \
 		-fno-asynchronous-unwind-tables \
-		-I$(srctree)/samples/hid/ \
+		-I$(srctree)samples/hid/ \
 		-O2 -emit-llvm -Xclang -disable-llvm-passes -c $< -o - | \
 		$(OPT) -O2 -mtriple=bpf-pc-linux | $(LLVM_DIS) | \
 		$(LLC) -march=bpf $(LLC_FLAGS) -filetype=obj -o $@
diff --git a/security/apparmor/Makefile b/security/apparmor/Makefile
index b9c5879dd599..a0aeec293268 100644
--- a/security/apparmor/Makefile
+++ b/security/apparmor/Makefile
@@ -101,14 +101,14 @@ cmd_make-rlim = echo "static const char *const rlim_names[RLIM_NLIMITS] = {" \
 $(obj)/capability.o : $(obj)/capability_names.h
 $(obj)/net.o : $(obj)/net_names.h
 $(obj)/resource.o : $(obj)/rlim_names.h
-$(obj)/capability_names.h : $(srctree)/include/uapi/linux/capability.h \
+$(obj)/capability_names.h : $(srctree)include/uapi/linux/capability.h \
 			    $(src)/Makefile
 	$(call cmd,make-caps)
-$(obj)/rlim_names.h : $(srctree)/include/uapi/asm-generic/resource.h \
+$(obj)/rlim_names.h : $(srctree)include/uapi/asm-generic/resource.h \
 		      $(src)/Makefile
 	$(call cmd,make-rlim)
-$(obj)/net_names.h : $(srctree)/include/linux/socket.h \
-		     $(srctree)/include/linux/net.h \
+$(obj)/net_names.h : $(srctree)include/linux/socket.h \
+		     $(srctree)include/linux/net.h \
 		     $(src)/Makefile
 	$(call cmd,make-af)
 	$(call cmd,make-sock)
diff --git a/security/selinux/Makefile b/security/selinux/Makefile
index c47519ed8156..f95c6772a73b 100644
--- a/security/selinux/Makefile
+++ b/security/selinux/Makefile
@@ -10,7 +10,7 @@
 
 obj-$(CONFIG_SECURITY_SELINUX) := selinux.o
 
-ccflags-y := -I$(srctree)/security/selinux -I$(srctree)/security/selinux/include
+ccflags-y := -I$(srctree)security/selinux -I$(srctree)security/selinux/include
 
 ccflags-$(CONFIG_SECURITY_SELINUX_DEBUG) += -DDEBUG
 
diff --git a/security/tomoyo/Makefile b/security/tomoyo/Makefile
index 884ff155edc3..dbf13507f77f 100644
--- a/security/tomoyo/Makefile
+++ b/security/tomoyo/Makefile
@@ -11,7 +11,7 @@ quiet_cmd_policy = POLICY  $@
 	printf '\t"";\n';) \
 	} > $@
 
-$(obj)/builtin-policy.h: $(wildcard $(obj)/policy/*.conf $(srctree)/$(src)/policy/*.conf.default) FORCE
+$(obj)/builtin-policy.h: $(wildcard $(obj)/policy/*.conf $(srctree)$(src)/policy/*.conf.default) FORCE
 	$(call if_changed,policy)
 
 ifndef CONFIG_SECURITY_TOMOYO_INSECURE_BUILTIN_SETTING
diff --git a/usr/Makefile b/usr/Makefile
index f8e1ad19e05c..4a48399cc571 100644
--- a/usr/Makefile
+++ b/usr/Makefile
@@ -22,7 +22,7 @@ cpio-data :=
 # If CONFIG_INITRAMFS_SOURCE is empty, generate a small initramfs with the
 # default contents.
 ifeq ($(ramfs-input),)
-ramfs-input := $(srctree)/$(src)/default_cpio_list
+ramfs-input := $(srctree)$(src)/default_cpio_list
 endif
 
 ifeq ($(words $(ramfs-input)),1)
diff --git a/usr/include/Makefile b/usr/include/Makefile
index 338c81f1fcf3..cfc497e945d7 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -15,7 +15,7 @@ UAPI_CFLAGS += $(filter -m32 -m64 --target=%, $(KBUILD_CFLAGS))
 # USERCFLAGS might contain sysroot location for CC.
 UAPI_CFLAGS += $(USERCFLAGS)
 
-override c_flags = $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)/usr/dummy-include
+override c_flags = $(UAPI_CFLAGS) -Wp,-MMD,$(depfile) -I $(obj) -I $(srctree)usr/dummy-include
 
 # The following are excluded for now because they fail to build.
 #
@@ -78,7 +78,7 @@ quiet_cmd_hdrtest = HDRTEST $<
       cmd_hdrtest = \
 		$(CC) $(c_flags) -fsyntax-only -x c /dev/null \
 			$(if $(filter-out $(no-header-test), $*.h), -include $< -include $<); \
-		$(PERL) $(srctree)/$(src)/headers_check.pl $(obj) $(SRCARCH) $<; \
+		$(PERL) $(srctree)$(src)/headers_check.pl $(obj) $(SRCARCH) $<; \
 		touch $@
 
 $(obj)/%.hdrtest: $(obj)/%.h FORCE
-- 
2.39.2


