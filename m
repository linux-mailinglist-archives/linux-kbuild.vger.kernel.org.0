Return-Path: <linux-kbuild+bounces-4929-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6379E069C
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6643F286B5B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D84520A5CE;
	Mon,  2 Dec 2024 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cRT2qO4M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60498208969;
	Mon,  2 Dec 2024 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152298; cv=none; b=UYMFexTmqMj/mxlPVWK97YOFhW/fpnZoImDLiNCuKAKu4EW2v+HckZDTiNLnsDTRu8J+9sYgSuripWYY2loiVyGGxb27YWD1hDAGmeLvt5KzmXXibWK7DisVAmwzzjFItH+c/4NIDsz9ZHhWNa6zxKBrRhQIK/pR74HWSOSYcxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152298; c=relaxed/simple;
	bh=/BtP/qlVHM7Z4hlrt/eqYTWoyrdDLF0JAr+lxHGE9/4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=cQ77v3fqRllvMZzJJ+9ouUlaxJvgzE84S82Y3UXpofG9OsdOHu6GBdIffmDomzyKJslaPJWn9AM8dJvDxoTs0W3qU94vxEUkCwB2XRroaFq8EzPPC+j0yuh0qRXX+Tk8sw9ycq+vpRA8qmE8CGddS5Y+L9Ivqu+WEoIRd0ioZEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cRT2qO4M; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=dd8ywItS5l0MJodf0VKFOFw4dzQZT04SKgV1jwEgOXs=; b=cRT2qO4MsmrnYBGsIVXiZfLLyz
	oZ4Q/5ivLCVbT+/sZ67Pi4wjM6AbJv9SljuqHDX3tA5pMvEAnQXZu/zUa3V9PCfwYbe99xwC0EOZk
	He1d8uAyIcp0u3uTgwLaZ6Mh9zyZBphvEoWnDvAPwonmaPpyT31uHk8A3S72ojnEOKoFB3Z+BVKTj
	hUjFkPQyltmBzjvQIALs0lM+pWpDNno5Oh6KmTuN4yB8gL/D6d/2CUU0/yXL8yIdWKM7ye8YYSFbs
	BSf5My8HgPp1EP8PoWyGO9SkML7QRKvQnh2/O2pPkHA8eewNhxoB6XssTSs0WPL4uCKkWXWvrOV8w
	fieTV+Cg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI85A-00000002Bkl-2eWs;
	Mon, 02 Dec 2024 15:11:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id BED9E30050D; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.048548103@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH -v2 1/7] module: Convert symbol namespace to string literal
References: <20241202145946.108093528@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Clean up the existing export namespace code along the same lines of
33def8498fdd ("treewide: Convert macro and uses of __section(foo) to
__section("foo")") and for the same reason, it is not desired for the
namespace argument to be a macro expansion itself.

git grep -l -e MODULE_IMPORT_NS -e EXPORT_SYMBOL_NS | while read file;
do
  awk -i inplace '
    /^#define EXPORT_SYMBOL_NS/ {
      gsub(/__stringify\(ns\)/, "ns");
      print;
      next;
    }
    /^#define MODULE_IMPORT_NS/ {
      gsub(/__stringify\(ns\)/, "ns");
      print;
      next;
    }
    /MODULE_IMPORT_NS/ {
      $0 = gensub(/MODULE_IMPORT_NS\(([^)]*)\)/, "MODULE_IMPORT_NS(\"\\1\")", "g");
    }
    /EXPORT_SYMBOL_NS/ {
      if ($0 ~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+),/) {
	if ($0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/ &&
	    $0 !~ /(EXPORT_SYMBOL_NS[^(]*)\(\)/ &&
	    $0 !~ /^my/) {
	  getline line;
	  gsub(/[[:space:]]*\\$/, "");
	  gsub(/[[:space:]]/, "", line);
	  $0 = $0 " " line;
	}

	$0 = gensub(/(EXPORT_SYMBOL_NS[^(]*)\(([^,]+), ([^)]+)\)/,
		    "\\1(\\2, \"\\3\")", "g");
      }
    }
    { print }' $file;
done

Requested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Documentation/core-api/symbol-namespaces.rst                          |    8 -
 Documentation/translations/it_IT/core-api/symbol-namespaces.rst       |    8 -
 Documentation/translations/zh_CN/core-api/symbol-namespaces.rst       |    8 -
 arch/arm64/crypto/aes-ce-ccm-glue.c                                   |    2 
 arch/arm64/crypto/aes-glue.c                                          |    2 
 arch/powerpc/crypto/vmx.c                                             |    2 
 arch/s390/crypto/aes_s390.c                                           |    2 
 arch/x86/mm/pat/set_memory.c                                          |    4 
 crypto/adiantum.c                                                     |    2 
 crypto/ansi_cprng.c                                                   |    2 
 crypto/ccm.c                                                          |    2 
 crypto/cipher.c                                                       |    6 
 crypto/cmac.c                                                         |    2 
 crypto/ctr.c                                                          |    2 
 crypto/drbg.c                                                         |    2 
 crypto/ecb.c                                                          |    2 
 crypto/essiv.c                                                        |    2 
 crypto/hctr2.c                                                        |    2 
 crypto/keywrap.c                                                      |    2 
 crypto/pcbc.c                                                         |    2 
 crypto/skcipher.c                                                     |    2 
 crypto/testmgr.c                                                      |    2 
 crypto/vmac.c                                                         |    2 
 crypto/xcbc.c                                                         |    2 
 crypto/xctr.c                                                         |    2 
 crypto/xts.c                                                          |    2 
 drivers/accel/habanalabs/common/memory.c                              |    2 
 drivers/accel/qaic/qaic_drv.c                                         |    2 
 drivers/acpi/apei/einj-cxl.c                                          |    8 -
 drivers/acpi/apei/ghes.c                                              |    6 
 drivers/acpi/numa/hmat.c                                              |    2 
 drivers/acpi/thermal.c                                                |    2 
 drivers/acpi/thermal_lib.c                                            |    8 -
 drivers/auxdisplay/ht16k33.c                                          |    2 
 drivers/auxdisplay/img-ascii-lcd.c                                    |    2 
 drivers/auxdisplay/line-display.c                                     |    4 
 drivers/auxdisplay/max6959.c                                          |    2 
 drivers/auxdisplay/seg-led-gpio.c                                     |    2 
 drivers/base/firmware_loader/builtin/main.c                           |    2 
 drivers/base/firmware_loader/fallback_table.c                         |    6 
 drivers/base/firmware_loader/sysfs.h                                  |    2 
 drivers/cdx/cdx.c                                                     |    8 -
 drivers/cdx/cdx_msi.c                                                 |    2 
 drivers/cdx/controller/cdx_controller.c                               |    2 
 drivers/clk/meson/a1-peripherals.c                                    |    2 
 drivers/clk/meson/a1-pll.c                                            |    2 
 drivers/clk/meson/axg-aoclk.c                                         |    2 
 drivers/clk/meson/axg-audio.c                                         |    2 
 drivers/clk/meson/axg.c                                               |    2 
 drivers/clk/meson/c3-peripherals.c                                    |    2 
 drivers/clk/meson/c3-pll.c                                            |    2 
 drivers/clk/meson/clk-cpu-dyndiv.c                                    |    4 
 drivers/clk/meson/clk-dualdiv.c                                       |    6 
 drivers/clk/meson/clk-mpll.c                                          |    6 
 drivers/clk/meson/clk-phase.c                                         |    8 -
 drivers/clk/meson/clk-pll.c                                           |    8 -
 drivers/clk/meson/clk-regmap.c                                        |   14 -
 drivers/clk/meson/g12a-aoclk.c                                        |    2 
 drivers/clk/meson/g12a.c                                              |    2 
 drivers/clk/meson/gxbb-aoclk.c                                        |    2 
 drivers/clk/meson/gxbb.c                                              |    2 
 drivers/clk/meson/meson-aoclk.c                                       |    4 
 drivers/clk/meson/meson-clkc-utils.c                                  |    4 
 drivers/clk/meson/meson-eeclk.c                                       |    4 
 drivers/clk/meson/s4-peripherals.c                                    |    2 
 drivers/clk/meson/s4-pll.c                                            |    2 
 drivers/clk/meson/sclk-div.c                                          |    4 
 drivers/clk/meson/vclk.c                                              |    6 
 drivers/clk/meson/vid-pll-div.c                                       |    4 
 drivers/clk/microchip/clk-mpfs.c                                      |    2 
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c                                |    2 
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c                              |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c                                |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c                                 |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c                                |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c                                |    2 
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c                                 |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                                   |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                                    |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c                               |    2 
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c                              |    2 
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c                                  |    2 
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c                              |    2 
 drivers/clk/sunxi-ng/ccu_common.c                                     |    8 -
 drivers/clk/sunxi-ng/ccu_div.c                                        |    2 
 drivers/clk/sunxi-ng/ccu_frac.c                                       |   12 -
 drivers/clk/sunxi-ng/ccu_gate.c                                       |    8 -
 drivers/clk/sunxi-ng/ccu_mp.c                                         |    4 
 drivers/clk/sunxi-ng/ccu_mult.c                                       |    2 
 drivers/clk/sunxi-ng/ccu_mux.c                                        |   12 -
 drivers/clk/sunxi-ng/ccu_nk.c                                         |    2 
 drivers/clk/sunxi-ng/ccu_nkm.c                                        |    2 
 drivers/clk/sunxi-ng/ccu_nkmp.c                                       |    2 
 drivers/clk/sunxi-ng/ccu_nm.c                                         |    2 
 drivers/clk/sunxi-ng/ccu_phase.c                                      |    2 
 drivers/clk/sunxi-ng/ccu_reset.c                                      |    2 
 drivers/clk/sunxi-ng/ccu_sdm.c                                        |   12 -
 drivers/counter/104-quad-8.c                                          |    2 
 drivers/counter/counter-chrdev.c                                      |    2 
 drivers/counter/counter-core.c                                        |   14 -
 drivers/counter/ftm-quaddec.c                                         |    2 
 drivers/counter/i8254.c                                               |    4 
 drivers/counter/intel-qep.c                                           |    2 
 drivers/counter/interrupt-cnt.c                                       |    2 
 drivers/counter/microchip-tcb-capture.c                               |    2 
 drivers/counter/rz-mtu3-cnt.c                                         |    2 
 drivers/counter/stm32-lptimer-cnt.c                                   |    2 
 drivers/counter/stm32-timer-cnt.c                                     |    2 
 drivers/counter/ti-ecap-capture.c                                     |    2 
 drivers/counter/ti-eqep.c                                             |    2 
 drivers/crypto/geode-aes.c                                            |    2 
 drivers/crypto/inside-secure/safexcel.c                               |    2 
 drivers/crypto/intel/iaa/iaa_crypto_main.c                            |    2 
 drivers/crypto/intel/qat/qat_420xx/adf_drv.c                          |    2 
 drivers/crypto/intel/qat/qat_4xxx/adf_drv.c                           |    2 
 drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c                          |    2 
 drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c                        |    2 
 drivers/crypto/intel/qat/qat_c62x/adf_drv.c                           |    2 
 drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c                         |    2 
 drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c                     |    2 
 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c                       |    2 
 drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c                     |    2 
 drivers/crypto/marvell/octeontx2/cn10k_cpt.c                          |   14 -
 drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c               |   20 +-
 drivers/crypto/marvell/octeontx2/otx2_cptlf.c                         |   20 +-
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c                    |    2 
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c                    |    2 
 drivers/cxl/acpi.c                                                    |    4 
 drivers/cxl/core/cdat.c                                               |    6 
 drivers/cxl/core/hdm.c                                                |   12 -
 drivers/cxl/core/mbox.c                                               |   22 +-
 drivers/cxl/core/memdev.c                                             |   20 +-
 drivers/cxl/core/pci.c                                                |   18 +-
 drivers/cxl/core/pmem.c                                               |   14 -
 drivers/cxl/core/pmu.c                                                |    2 
 drivers/cxl/core/port.c                                               |   72 ++++-----
 drivers/cxl/core/region.c                                             |   14 -
 drivers/cxl/core/regs.c                                               |   22 +-
 drivers/cxl/core/suspend.c                                            |    4 
 drivers/cxl/mem.c                                                     |    2 
 drivers/cxl/pci.c                                                     |    2 
 drivers/cxl/pmem.c                                                    |    2 
 drivers/cxl/port.c                                                    |    2 
 drivers/dax/cxl.c                                                     |    2 
 drivers/dma-buf/dma-buf.c                                             |   42 ++---
 drivers/dma/idxd/compat.c                                             |    2 
 drivers/dma/idxd/device.c                                             |   14 -
 drivers/dma/idxd/init.c                                               |    2 
 drivers/dma/idxd/submit.c                                             |    6 
 drivers/firmware/cirrus/cs_dsp.c                                      |   68 ++++-----
 drivers/firmware/efi/efi-pstore.c                                     |    2 
 drivers/firmware/efi/embedded-firmware.c                              |    4 
 drivers/firmware/efi/vars.c                                           |   16 +-
 drivers/fpga/intel-m10-bmc-sec-update.c                               |    2 
 drivers/gpio/gpio-104-dio-48e.c                                       |    4 
 drivers/gpio/gpio-104-idio-16.c                                       |    2 
 drivers/gpio/gpio-elkhartlake.c                                       |    2 
 drivers/gpio/gpio-gpio-mm.c                                           |    2 
 drivers/gpio/gpio-i8255.c                                             |    2 
 drivers/gpio/gpio-ljca.c                                              |    2 
 drivers/gpio/gpio-menz127.c                                           |    2 
 drivers/gpio/gpio-merrifield.c                                        |    2 
 drivers/gpio/gpio-pci-idio-16.c                                       |    2 
 drivers/gpio/gpio-tangier.c                                           |    2 
 drivers/gpio/gpiolib-swnode.c                                         |    2 
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c                               |    2 
 drivers/gpu/drm/armada/armada_gem.c                                   |    2 
 drivers/gpu/drm/drm_gem_dma_helper.c                                  |    2 
 drivers/gpu/drm/drm_gem_framebuffer_helper.c                          |    2 
 drivers/gpu/drm/drm_gem_shmem_helper.c                                |    4 
 drivers/gpu/drm/drm_prime.c                                           |    2 
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c                           |    2 
 drivers/gpu/drm/exynos/exynos_drm_gem.c                               |    2 
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c                            |    2 
 drivers/gpu/drm/i915/gvt/kvmgt.c                                      |    4 
 drivers/gpu/drm/i915/intel_gvt.c                                      |   74 +++++-----
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c                           |    2 
 drivers/gpu/drm/imagination/pvr_drv.c                                 |    2 
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c                             |    2 
 drivers/gpu/drm/solomon/ssd130x-i2c.c                                 |    2 
 drivers/gpu/drm/solomon/ssd130x-spi.c                                 |    2 
 drivers/gpu/drm/solomon/ssd130x.c                                     |    2 
 drivers/gpu/drm/tegra/gem.c                                           |    2 
 drivers/gpu/drm/vmwgfx/ttm_object.c                                   |    2 
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c                           |    2 
 drivers/gpu/drm/xe/tests/xe_test_mod.c                                |    2 
 drivers/gpu/drm/xe/xe_dma_buf.c                                       |    2 
 drivers/hid/hid-uclogic-rdesc-test.c                                  |    2 
 drivers/hwmon/hwmon.c                                                 |    2 
 drivers/hwmon/intel-m10-bmc-hwmon.c                                   |    2 
 drivers/hwmon/nct6775-i2c.c                                           |    2 
 drivers/hwmon/nct6775-platform.c                                      |    2 
 drivers/hwmon/peci/cputemp.c                                          |    2 
 drivers/hwmon/peci/dimmtemp.c                                         |    2 
 drivers/hwmon/pmbus/acbel-fsg032.c                                    |    2 
 drivers/hwmon/pmbus/adm1266.c                                         |    2 
 drivers/hwmon/pmbus/adm1275.c                                         |    2 
 drivers/hwmon/pmbus/adp1050.c                                         |    2 
 drivers/hwmon/pmbus/bel-pfe.c                                         |    2 
 drivers/hwmon/pmbus/bpa-rs600.c                                       |    2 
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c                               |    2 
 drivers/hwmon/pmbus/dps920ab.c                                        |    2 
 drivers/hwmon/pmbus/fsp-3y.c                                          |    2 
 drivers/hwmon/pmbus/ibm-cffps.c                                       |    2 
 drivers/hwmon/pmbus/inspur-ipsps.c                                    |    2 
 drivers/hwmon/pmbus/ir35221.c                                         |    2 
 drivers/hwmon/pmbus/ir36021.c                                         |    2 
 drivers/hwmon/pmbus/ir38064.c                                         |    2 
 drivers/hwmon/pmbus/irps5401.c                                        |    2 
 drivers/hwmon/pmbus/isl68137.c                                        |    2 
 drivers/hwmon/pmbus/lm25066.c                                         |    2 
 drivers/hwmon/pmbus/lt7182s.c                                         |    2 
 drivers/hwmon/pmbus/ltc2978.c                                         |    2 
 drivers/hwmon/pmbus/ltc3815.c                                         |    2 
 drivers/hwmon/pmbus/max15301.c                                        |    2 
 drivers/hwmon/pmbus/max16064.c                                        |    2 
 drivers/hwmon/pmbus/max16601.c                                        |    2 
 drivers/hwmon/pmbus/max20730.c                                        |    2 
 drivers/hwmon/pmbus/max20751.c                                        |    2 
 drivers/hwmon/pmbus/max31785.c                                        |    2 
 drivers/hwmon/pmbus/max34440.c                                        |    2 
 drivers/hwmon/pmbus/max8688.c                                         |    2 
 drivers/hwmon/pmbus/mp2856.c                                          |    2 
 drivers/hwmon/pmbus/mp2888.c                                          |    2 
 drivers/hwmon/pmbus/mp2891.c                                          |    2 
 drivers/hwmon/pmbus/mp2975.c                                          |    2 
 drivers/hwmon/pmbus/mp2993.c                                          |    2 
 drivers/hwmon/pmbus/mp5023.c                                          |    2 
 drivers/hwmon/pmbus/mp5920.c                                          |    2 
 drivers/hwmon/pmbus/mp5990.c                                          |    2 
 drivers/hwmon/pmbus/mp9941.c                                          |    2 
 drivers/hwmon/pmbus/mpq7932.c                                         |    2 
 drivers/hwmon/pmbus/mpq8785.c                                         |    2 
 drivers/hwmon/pmbus/pim4328.c                                         |    2 
 drivers/hwmon/pmbus/pli1209bc.c                                       |    2 
 drivers/hwmon/pmbus/pm6764tr.c                                        |    2 
 drivers/hwmon/pmbus/pmbus.c                                           |    2 
 drivers/hwmon/pmbus/pmbus_core.c                                      |   42 ++---
 drivers/hwmon/pmbus/pxe1610.c                                         |    2 
 drivers/hwmon/pmbus/q54sj108a2.c                                      |    2 
 drivers/hwmon/pmbus/stpddc60.c                                        |    2 
 drivers/hwmon/pmbus/tda38640.c                                        |    2 
 drivers/hwmon/pmbus/tps40422.c                                        |    2 
 drivers/hwmon/pmbus/tps53679.c                                        |    2 
 drivers/hwmon/pmbus/tps546d24.c                                       |    2 
 drivers/hwmon/pmbus/ucd9000.c                                         |    2 
 drivers/hwmon/pmbus/ucd9200.c                                         |    2 
 drivers/hwmon/pmbus/xdp710.c                                          |    2 
 drivers/hwmon/pmbus/xdpe12284.c                                       |    2 
 drivers/hwmon/pmbus/xdpe152c4.c                                       |    2 
 drivers/hwmon/pmbus/zl6100.c                                          |    2 
 drivers/i2c/busses/i2c-amd-asf-plat.c                                 |    2 
 drivers/i2c/busses/i2c-designware-master.c                            |    2 
 drivers/i2c/busses/i2c-designware-pcidrv.c                            |    4 
 drivers/i2c/busses/i2c-designware-platdrv.c                           |    4 
 drivers/i2c/busses/i2c-designware-slave.c                             |    2 
 drivers/i2c/busses/i2c-ljca.c                                         |    2 
 drivers/i2c/busses/i2c-piix4.c                                        |    8 -
 drivers/i2c/i2c-atr.c                                                 |   12 -
 drivers/i2c/i2c-core-of-prober.c                                      |   10 -
 drivers/iio/accel/adis16201.c                                         |    2 
 drivers/iio/accel/adis16209.c                                         |    2 
 drivers/iio/accel/adxl313_core.c                                      |   16 +-
 drivers/iio/accel/adxl313_i2c.c                                       |    2 
 drivers/iio/accel/adxl313_spi.c                                       |    2 
 drivers/iio/accel/adxl345_core.c                                      |    2 
 drivers/iio/accel/adxl345_i2c.c                                       |    2 
 drivers/iio/accel/adxl345_spi.c                                       |    2 
 drivers/iio/accel/adxl355_core.c                                      |    8 -
 drivers/iio/accel/adxl355_i2c.c                                       |    2 
 drivers/iio/accel/adxl355_spi.c                                       |    2 
 drivers/iio/accel/adxl367.c                                           |    2 
 drivers/iio/accel/adxl367_i2c.c                                       |    2 
 drivers/iio/accel/adxl367_spi.c                                       |    2 
 drivers/iio/accel/adxl372.c                                           |    4 
 drivers/iio/accel/adxl372_i2c.c                                       |    2 
 drivers/iio/accel/adxl372_spi.c                                       |    2 
 drivers/iio/accel/adxl380.c                                           |    8 -
 drivers/iio/accel/adxl380_i2c.c                                       |    2 
 drivers/iio/accel/adxl380_spi.c                                       |    2 
 drivers/iio/accel/bma400_core.c                                       |    4 
 drivers/iio/accel/bma400_i2c.c                                        |    2 
 drivers/iio/accel/bma400_spi.c                                        |    2 
 drivers/iio/accel/bmc150-accel-core.c                                 |    8 -
 drivers/iio/accel/bmc150-accel-i2c.c                                  |    2 
 drivers/iio/accel/bmc150-accel-spi.c                                  |    2 
 drivers/iio/accel/bmi088-accel-core.c                                 |    6 
 drivers/iio/accel/bmi088-accel-i2c.c                                  |    2 
 drivers/iio/accel/bmi088-accel-spi.c                                  |    2 
 drivers/iio/accel/fxls8962af-core.c                                   |    6 
 drivers/iio/accel/fxls8962af-i2c.c                                    |    2 
 drivers/iio/accel/fxls8962af-spi.c                                    |    2 
 drivers/iio/accel/hid-sensor-accel-3d.c                               |    2 
 drivers/iio/accel/kionix-kx022a-i2c.c                                 |    2 
 drivers/iio/accel/kionix-kx022a-spi.c                                 |    2 
 drivers/iio/accel/kionix-kx022a.c                                     |    8 -
 drivers/iio/accel/kxsd9-i2c.c                                         |    2 
 drivers/iio/accel/kxsd9-spi.c                                         |    2 
 drivers/iio/accel/kxsd9.c                                             |    4 
 drivers/iio/accel/mma7455_core.c                                      |    6 
 drivers/iio/accel/mma7455_i2c.c                                       |    2 
 drivers/iio/accel/mma7455_spi.c                                       |    2 
 drivers/iio/accel/mma9551.c                                           |    2 
 drivers/iio/accel/mma9551_core.c                                      |   36 ++--
 drivers/iio/accel/mma9553.c                                           |    2 
 drivers/iio/accel/ssp_accel_sensor.c                                  |    2 
 drivers/iio/accel/st_accel_core.c                                     |    6 
 drivers/iio/accel/st_accel_i2c.c                                      |    2 
 drivers/iio/accel/st_accel_spi.c                                      |    2 
 drivers/iio/adc/ad7091r-base.c                                        |    8 -
 drivers/iio/adc/ad7091r5.c                                            |    2 
 drivers/iio/adc/ad7091r8.c                                            |    2 
 drivers/iio/adc/ad7124.c                                              |    2 
 drivers/iio/adc/ad7173.c                                              |    2 
 drivers/iio/adc/ad7192.c                                              |    2 
 drivers/iio/adc/ad7606.c                                              |   28 +--
 drivers/iio/adc/ad7606_par.c                                          |    4 
 drivers/iio/adc/ad7606_spi.c                                          |    2 
 drivers/iio/adc/ad7625.c                                              |    2 
 drivers/iio/adc/ad7780.c                                              |    2 
 drivers/iio/adc/ad7791.c                                              |    2 
 drivers/iio/adc/ad7793.c                                              |    2 
 drivers/iio/adc/ad9467.c                                              |    2 
 drivers/iio/adc/ad_sigma_delta.c                                      |   20 +-
 drivers/iio/adc/adi-axi-adc.c                                         |    4 
 drivers/iio/adc/ltc2497-core.c                                        |    4 
 drivers/iio/adc/ltc2497.h                                             |    2 
 drivers/iio/adc/max11205.c                                            |    2 
 drivers/iio/adc/men_z188_adc.c                                        |    2 
 drivers/iio/adc/sd_adc_modulator.c                                    |    2 
 drivers/iio/adc/stm32-dfsdm-adc.c                                     |    2 
 drivers/iio/addac/stx104.c                                            |    2 
 drivers/iio/afe/iio-rescale.c                                         |    4 
 drivers/iio/buffer/industrialio-buffer-dma.c                          |   36 ++--
 drivers/iio/buffer/industrialio-buffer-dmaengine.c                    |    8 -
 drivers/iio/chemical/bme680_core.c                                    |    4 
 drivers/iio/chemical/bme680_i2c.c                                     |    2 
 drivers/iio/chemical/bme680_spi.c                                     |    2 
 drivers/iio/chemical/ens160_core.c                                    |    2 
 drivers/iio/chemical/ens160_i2c.c                                     |    2 
 drivers/iio/chemical/ens160_spi.c                                     |    2 
 drivers/iio/chemical/scd30_core.c                                     |    2 
 drivers/iio/chemical/scd30_i2c.c                                      |    2 
 drivers/iio/chemical/scd30_serial.c                                   |    2 
 drivers/iio/chemical/sps30.c                                          |    2 
 drivers/iio/chemical/sps30_i2c.c                                      |    2 
 drivers/iio/chemical/sps30_serial.c                                   |    2 
 drivers/iio/common/hid-sensors/hid-sensor-attributes.c                |   26 +--
 drivers/iio/common/hid-sensors/hid-sensor-trigger.c                   |   10 -
 drivers/iio/common/inv_sensors/inv_sensors_timestamp.c                |    8 -
 drivers/iio/common/ms_sensors/ms_sensors_i2c.c                        |   24 +--
 drivers/iio/common/ssp_sensors/ssp_dev.c                              |   10 -
 drivers/iio/common/ssp_sensors/ssp_iio.c                              |    8 -
 drivers/iio/common/st_sensors/st_sensors_buffer.c                     |    2 
 drivers/iio/common/st_sensors/st_sensors_core.c                       |   28 +--
 drivers/iio/common/st_sensors/st_sensors_i2c.c                        |    2 
 drivers/iio/common/st_sensors/st_sensors_spi.c                        |    2 
 drivers/iio/common/st_sensors/st_sensors_trigger.c                    |    4 
 drivers/iio/dac/ad3552r-common.c                                      |   16 +-
 drivers/iio/dac/ad3552r-hs.c                                          |    4 
 drivers/iio/dac/ad3552r.c                                             |    2 
 drivers/iio/dac/ad5592r-base.c                                        |    4 
 drivers/iio/dac/ad5592r.c                                             |    2 
 drivers/iio/dac/ad5593r.c                                             |    2 
 drivers/iio/dac/ad5686-spi.c                                          |    2 
 drivers/iio/dac/ad5686.c                                              |    4 
 drivers/iio/dac/ad5696-i2c.c                                          |    2 
 drivers/iio/dac/ad8460.c                                              |    2 
 drivers/iio/dac/ad9739a.c                                             |    2 
 drivers/iio/dac/adi-axi-dac.c                                         |    4 
 drivers/iio/gyro/adis16136.c                                          |    2 
 drivers/iio/gyro/adis16260.c                                          |    2 
 drivers/iio/gyro/fxas21002c_core.c                                    |    4 
 drivers/iio/gyro/fxas21002c_i2c.c                                     |    2 
 drivers/iio/gyro/fxas21002c_spi.c                                     |    2 
 drivers/iio/gyro/hid-sensor-gyro-3d.c                                 |    2 
 drivers/iio/gyro/ssp_gyro_sensor.c                                    |    2 
 drivers/iio/gyro/st_gyro_core.c                                       |    6 
 drivers/iio/gyro/st_gyro_i2c.c                                        |    2 
 drivers/iio/gyro/st_gyro_spi.c                                        |    2 
 drivers/iio/humidity/hid-sensor-humidity.c                            |    2 
 drivers/iio/humidity/hts221_core.c                                    |    2 
 drivers/iio/humidity/hts221_i2c.c                                     |    2 
 drivers/iio/humidity/hts221_spi.c                                     |    2 
 drivers/iio/humidity/htu21.c                                          |    2 
 drivers/iio/imu/adis.c                                                |   20 +-
 drivers/iio/imu/adis16400.c                                           |    2 
 drivers/iio/imu/adis16460.c                                           |    2 
 drivers/iio/imu/adis16475.c                                           |    2 
 drivers/iio/imu/adis16480.c                                           |    2 
 drivers/iio/imu/adis_buffer.c                                         |    4 
 drivers/iio/imu/adis_trigger.c                                        |    2 
 drivers/iio/imu/bmi160/bmi160_core.c                                  |    6 
 drivers/iio/imu/bmi160/bmi160_i2c.c                                   |    2 
 drivers/iio/imu/bmi160/bmi160_spi.c                                   |    2 
 drivers/iio/imu/bmi270/bmi270_core.c                                  |    6 
 drivers/iio/imu/bmi270/bmi270_i2c.c                                   |    2 
 drivers/iio/imu/bmi270/bmi270_spi.c                                   |    2 
 drivers/iio/imu/bmi323/bmi323_core.c                                  |    4 
 drivers/iio/imu/bmi323/bmi323_i2c.c                                   |    2 
 drivers/iio/imu/bmi323/bmi323_spi.c                                   |    2 
 drivers/iio/imu/bno055/bno055.c                                       |    4 
 drivers/iio/imu/bno055/bno055_i2c.c                                   |    2 
 drivers/iio/imu/bno055/bno055_ser_core.c                              |    2 
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c                      |    6 
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c                       |    2 
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c                       |    2 
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c                            |    4 
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c                             |    2 
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c                             |    2 
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c                          |    2 
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c                           |    2 
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c                           |    2 
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c                           |    2 
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c                          |    4 
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c                           |    2 
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c                           |    2 
 drivers/iio/industrialio-backend.c                                    |   58 +++----
 drivers/iio/industrialio-buffer.c                                     |    2 
 drivers/iio/industrialio-gts-helper.c                                 |   26 +--
 drivers/iio/light/apds9306.c                                          |    2 
 drivers/iio/light/bh1745.c                                            |    2 
 drivers/iio/light/hid-sensor-als.c                                    |    2 
 drivers/iio/light/hid-sensor-prox.c                                   |    2 
 drivers/iio/light/rohm-bu27008.c                                      |    2 
 drivers/iio/light/rohm-bu27034.c                                      |    2 
 drivers/iio/light/st_uvis25_core.c                                    |    2 
 drivers/iio/light/st_uvis25_i2c.c                                     |    2 
 drivers/iio/light/st_uvis25_spi.c                                     |    2 
 drivers/iio/magnetometer/bmc150_magn.c                                |    8 -
 drivers/iio/magnetometer/bmc150_magn_i2c.c                            |    2 
 drivers/iio/magnetometer/bmc150_magn_spi.c                            |    2 
 drivers/iio/magnetometer/hid-sensor-magn-3d.c                         |    2 
 drivers/iio/magnetometer/hmc5843_core.c                               |    4 
 drivers/iio/magnetometer/hmc5843_i2c.c                                |    2 
 drivers/iio/magnetometer/hmc5843_spi.c                                |    2 
 drivers/iio/magnetometer/rm3100-core.c                                |    8 -
 drivers/iio/magnetometer/rm3100-i2c.c                                 |    2 
 drivers/iio/magnetometer/rm3100-spi.c                                 |    2 
 drivers/iio/magnetometer/st_magn_core.c                               |    6 
 drivers/iio/magnetometer/st_magn_i2c.c                                |    2 
 drivers/iio/magnetometer/st_magn_spi.c                                |    2 
 drivers/iio/orientation/hid-sensor-incl-3d.c                          |    2 
 drivers/iio/orientation/hid-sensor-rotation.c                         |    2 
 drivers/iio/position/hid-sensor-custom-intel-hinge.c                  |    2 
 drivers/iio/pressure/bmp280-core.c                                    |   14 -
 drivers/iio/pressure/bmp280-i2c.c                                     |    2 
 drivers/iio/pressure/bmp280-regmap.c                                  |   10 -
 drivers/iio/pressure/bmp280-spi.c                                     |    2 
 drivers/iio/pressure/hid-sensor-press.c                               |    2 
 drivers/iio/pressure/hsc030pa.c                                       |    2 
 drivers/iio/pressure/hsc030pa_i2c.c                                   |    2 
 drivers/iio/pressure/hsc030pa_spi.c                                   |    2 
 drivers/iio/pressure/mpl115.c                                         |    2 
 drivers/iio/pressure/mpl115_i2c.c                                     |    2 
 drivers/iio/pressure/mpl115_spi.c                                     |    2 
 drivers/iio/pressure/mprls0025pa.c                                    |    2 
 drivers/iio/pressure/mprls0025pa_i2c.c                                |    2 
 drivers/iio/pressure/mprls0025pa_spi.c                                |    2 
 drivers/iio/pressure/ms5611_core.c                                    |    2 
 drivers/iio/pressure/ms5611_i2c.c                                     |    2 
 drivers/iio/pressure/ms5611_spi.c                                     |    2 
 drivers/iio/pressure/ms5637.c                                         |    2 
 drivers/iio/pressure/st_pressure_core.c                               |    6 
 drivers/iio/pressure/st_pressure_i2c.c                                |    2 
 drivers/iio/pressure/st_pressure_spi.c                                |    2 
 drivers/iio/pressure/zpa2326.c                                        |   12 -
 drivers/iio/pressure/zpa2326_i2c.c                                    |    2 
 drivers/iio/pressure/zpa2326_spi.c                                    |    2 
 drivers/iio/proximity/sx9310.c                                        |    2 
 drivers/iio/proximity/sx9324.c                                        |    2 
 drivers/iio/proximity/sx9360.c                                        |    2 
 drivers/iio/proximity/sx_common.c                                     |   10 -
 drivers/iio/temperature/hid-sensor-temperature.c                      |    2 
 drivers/iio/temperature/tsys01.c                                      |    2 
 drivers/iio/temperature/tsys02d.c                                     |    2 
 drivers/iio/test/iio-test-gts.c                                       |    2 
 drivers/iio/test/iio-test-rescale.c                                   |    2 
 drivers/infiniband/core/umem_dmabuf.c                                 |    2 
 drivers/infiniband/hw/mana/device.c                                   |    2 
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c                   |    2 
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c                      |    2 
 drivers/iommu/iommu.c                                                 |   10 -
 drivers/iommu/iommufd/device.c                                        |   32 ++--
 drivers/iommu/iommufd/driver.c                                        |    4 
 drivers/iommu/iommufd/iova_bitmap.c                                   |    8 -
 drivers/iommu/iommufd/main.c                                          |   12 -
 drivers/iommu/iommufd/vfio_compat.c                                   |    6 
 drivers/leds/flash/leds-ktd2692.c                                     |    2 
 drivers/leds/leds-expresswire.c                                       |   12 -
 drivers/mcb/mcb-core.c                                                |   28 +--
 drivers/mcb/mcb-lpc.c                                                 |    2 
 drivers/mcb/mcb-parse.c                                               |    2 
 drivers/mcb/mcb-pci.c                                                 |    2 
 drivers/media/common/videobuf2/videobuf2-core.c                       |    2 
 drivers/media/common/videobuf2/videobuf2-dma-contig.c                 |    2 
 drivers/media/common/videobuf2/videobuf2-dma-sg.c                     |    2 
 drivers/media/common/videobuf2/videobuf2-vmalloc.c                    |    2 
 drivers/media/i2c/ds90ub913.c                                         |    2 
 drivers/media/i2c/ds90ub953.c                                         |    2 
 drivers/media/i2c/ds90ub960.c                                         |    2 
 drivers/media/pci/intel/ipu-bridge.c                                  |    6 
 drivers/media/pci/intel/ipu3/ipu3-cio2.c                              |    2 
 drivers/media/pci/intel/ipu6/ipu6-buttress.c                          |   12 -
 drivers/media/pci/intel/ipu6/ipu6-cpd.c                               |    4 
 drivers/media/pci/intel/ipu6/ipu6-dma.c                               |   18 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c                            |   18 +-
 drivers/media/pci/intel/ipu6/ipu6-isys.c                              |    4 
 drivers/media/pci/intel/ipu6/ipu6-mmu.c                               |    4 
 drivers/media/pci/intel/ipu6/ipu6.c                                   |    4 
 drivers/media/pci/intel/ivsc/mei_csi.c                                |    2 
 drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c                |    2 
 drivers/mfd/cs40l50-core.c                                            |    2 
 drivers/mfd/cs42l43-i2c.c                                             |    2 
 drivers/mfd/cs42l43-sdw.c                                             |    2 
 drivers/mfd/cs42l43.c                                                 |   12 -
 drivers/mfd/intel-lpss-acpi.c                                         |    2 
 drivers/mfd/intel-lpss-pci.c                                          |    2 
 drivers/mfd/intel-lpss.c                                              |    4 
 drivers/mfd/intel-m10-bmc-core.c                                      |   10 -
 drivers/mfd/intel-m10-bmc-pmci.c                                      |    2 
 drivers/mfd/intel-m10-bmc-spi.c                                       |    2 
 drivers/mfd/ocelot-core.c                                             |    6 
 drivers/mfd/ocelot-spi.c                                              |    4 
 drivers/misc/fastrpc.c                                                |    2 
 drivers/misc/mei/platform-vsc.c                                       |    2 
 drivers/misc/mei/vsc-fw-loader.c                                      |    2 
 drivers/misc/mei/vsc-tp.c                                             |   18 +-
 drivers/net/dsa/ocelot/ocelot_ext.c                                   |    2 
 drivers/net/dsa/realtek/realtek-mdio.c                                |    6 
 drivers/net/dsa/realtek/realtek-smi.c                                 |    6 
 drivers/net/dsa/realtek/rtl8365mb.c                                   |    2 
 drivers/net/dsa/realtek/rtl8366-core.c                                |   22 +-
 drivers/net/dsa/realtek/rtl8366rb.c                                   |    2 
 drivers/net/dsa/realtek/rtl83xx.c                                     |   16 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c                           |    2 
 drivers/net/ethernet/intel/iavf/iavf_main.c                           |    4 
 drivers/net/ethernet/intel/ice/ice_main.c                             |    2 
 drivers/net/ethernet/intel/idpf/idpf_main.c                           |    2 
 drivers/net/ethernet/intel/libeth/rx.c                                |    8 -
 drivers/net/ethernet/intel/libie/rx.c                                 |    4 
 drivers/net/ethernet/microsoft/mana/gdma_main.c                       |   12 -
 drivers/net/ethernet/microsoft/mana/mana_en.c                         |   10 -
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c         |    2 
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h               |    2 
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c         |    2 
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c         |    2 
 drivers/net/wireless/intel/iwlwifi/dvm/main.c                         |    2 
 drivers/net/wireless/intel/iwlwifi/iwl-drv.h                          |    2 
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c                          |    2 
 drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c                  |    2 
 drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c                   |    2 
 drivers/net/wireless/intel/iwlwifi/tests/devinfo.c                    |    2 
 drivers/nvdimm/region_devs.c                                          |    2 
 drivers/nvme/host/core.c                                              |   14 -
 drivers/nvme/target/passthru.c                                        |    2 
 drivers/pci/pcie/aer.c                                                |    4 
 drivers/peci/controller/peci-aspeed.c                                 |    2 
 drivers/peci/controller/peci-npcm.c                                   |    2 
 drivers/peci/core.c                                                   |    2 
 drivers/peci/cpu.c                                                    |   12 -
 drivers/peci/device.c                                                 |    4 
 drivers/peci/request.c                                                |   30 ++--
 drivers/perf/cxl_pmu.c                                                |    2 
 drivers/pinctrl/intel/pinctrl-alderlake.c                             |    2 
 drivers/pinctrl/intel/pinctrl-baytrail.c                              |    2 
 drivers/pinctrl/intel/pinctrl-broxton.c                               |    2 
 drivers/pinctrl/intel/pinctrl-cannonlake.c                            |    2 
 drivers/pinctrl/intel/pinctrl-cedarfork.c                             |    2 
 drivers/pinctrl/intel/pinctrl-cherryview.c                            |    2 
 drivers/pinctrl/intel/pinctrl-denverton.c                             |    2 
 drivers/pinctrl/intel/pinctrl-elkhartlake.c                           |    2 
 drivers/pinctrl/intel/pinctrl-emmitsburg.c                            |    2 
 drivers/pinctrl/intel/pinctrl-geminilake.c                            |    2 
 drivers/pinctrl/intel/pinctrl-icelake.c                               |    2 
 drivers/pinctrl/intel/pinctrl-intel-platform.c                        |    2 
 drivers/pinctrl/intel/pinctrl-intel.c                                 |   22 +-
 drivers/pinctrl/intel/pinctrl-jasperlake.c                            |    2 
 drivers/pinctrl/intel/pinctrl-lakefield.c                             |    2 
 drivers/pinctrl/intel/pinctrl-lewisburg.c                             |    2 
 drivers/pinctrl/intel/pinctrl-lynxpoint.c                             |    2 
 drivers/pinctrl/intel/pinctrl-merrifield.c                            |    2 
 drivers/pinctrl/intel/pinctrl-meteorlake.c                            |    2 
 drivers/pinctrl/intel/pinctrl-meteorpoint.c                           |    2 
 drivers/pinctrl/intel/pinctrl-moorefield.c                            |    2 
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c                          |    2 
 drivers/pinctrl/intel/pinctrl-tangier.c                               |    2 
 drivers/pinctrl/intel/pinctrl-tigerlake.c                             |    2 
 drivers/platform/chrome/chromeos_of_hw_prober.c                       |    2 
 drivers/platform/x86/amd/hsmp/acpi.c                                  |    2 
 drivers/platform/x86/amd/hsmp/hsmp.c                                  |   16 +-
 drivers/platform/x86/amd/hsmp/plat.c                                  |    2 
 drivers/platform/x86/ideapad-laptop.c                                 |    6 
 drivers/platform/x86/intel/plr_tpmi.c                                 |    4 
 drivers/platform/x86/intel/pmc/core_ssram.c                           |    4 
 drivers/platform/x86/intel/pmt/class.c                                |    8 -
 drivers/platform/x86/intel/pmt/crashlog.c                             |    2 
 drivers/platform/x86/intel/pmt/telemetry.c                            |   16 +-
 drivers/platform/x86/intel/speed_select_if/isst_tpmi.c                |    2 
 drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c           |   16 +-
 drivers/platform/x86/intel/tpmi_power_domains.c                       |    8 -
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c |    8 -
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c   |    4 
 drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c        |    2 
 drivers/platform/x86/intel/vsec.c                                     |    4 
 drivers/platform/x86/intel/vsec_tpmi.c                                |   12 -
 drivers/platform/x86/lenovo-ymc.c                                     |    2 
 drivers/powercap/idle_inject.c                                        |   16 +-
 drivers/powercap/intel_rapl_tpmi.c                                    |    2 
 drivers/pwm/pwm-dwc.h                                                 |    2 
 drivers/pwm/pwm-lpss-pci.c                                            |    2 
 drivers/pwm/pwm-lpss-platform.c                                       |    2 
 drivers/reset/amlogic/reset-meson-aux.c                               |    2 
 drivers/reset/amlogic/reset-meson-common.c                            |    8 -
 drivers/reset/amlogic/reset-meson.c                                   |    2 
 drivers/reset/reset-mpfs.c                                            |    4 
 drivers/rtc/rtc-hid-sensor-time.c                                     |    2 
 drivers/soundwire/amd_init.c                                          |    6 
 drivers/soundwire/intel.c                                             |    2 
 drivers/soundwire/intel_ace2x.c                                       |    4 
 drivers/soundwire/intel_init.c                                        |   10 -
 drivers/soundwire/slave.c                                             |    2 
 drivers/spi/spi-cs42l43.c                                             |    2 
 drivers/spi/spi-dw-bt1.c                                              |    2 
 drivers/spi/spi-dw-core.c                                             |   14 -
 drivers/spi/spi-dw-dma.c                                              |    4 
 drivers/spi/spi-dw-mmio.c                                             |    2 
 drivers/spi/spi-dw-pci.c                                              |    2 
 drivers/spi/spi-ljca.c                                                |    2 
 drivers/spi/spi-loongson-core.c                                       |    4 
 drivers/spi/spi-loongson-pci.c                                        |    2 
 drivers/spi/spi-loongson-plat.c                                       |    2 
 drivers/spi/spi-pxa2xx-pci.c                                          |    2 
 drivers/spi/spi-pxa2xx-platform.c                                     |    2 
 drivers/spi/spi-pxa2xx.c                                              |    4 
 drivers/staging/iio/accel/adis16203.c                                 |    2 
 drivers/staging/iio/accel/adis16240.c                                 |    2 
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c                      |    2 
 drivers/thermal/intel/int340x_thermal/processor_thermal_device.c      |    4 
 drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c  |    2 
 drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c        |    6 
 drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c |   12 -
 drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c        |    2 
 drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c     |   10 -
 drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c      |    2 
 drivers/thermal/intel/intel_powerclamp.c                              |    2 
 drivers/thermal/intel/intel_soc_dts_iosf.c                            |    2 
 drivers/thermal/intel/intel_tcc.c                                     |   10 -
 drivers/thermal/intel/intel_tcc_cooling.c                             |    2 
 drivers/thermal/intel/x86_pkg_temp_thermal.c                          |    2 
 drivers/thermal/thermal_hwmon.c                                       |    2 
 drivers/tty/serial/8250/8250_exar.c                                   |    2 
 drivers/tty/serial/8250/8250_men_mcb.c                                |    2 
 drivers/tty/serial/8250/8250_pci.c                                    |    2 
 drivers/tty/serial/8250/8250_pci1xxxx.c                               |    2 
 drivers/tty/serial/8250/8250_pcilib.c                                 |    4 
 drivers/tty/serial/men_z135_uart.c                                    |    2 
 drivers/tty/serial/sc16is7xx_i2c.c                                    |    2 
 drivers/tty/serial/sc16is7xx_spi.c                                    |    2 
 drivers/usb/gadget/function/f_fs.c                                    |    2 
 drivers/usb/host/xhci-pci-renesas.c                                   |    2 
 drivers/usb/host/xhci-pci.c                                           |    4 
 drivers/usb/misc/usb-ljca.c                                           |    8 -
 drivers/usb/storage/alauda.c                                          |    2 
 drivers/usb/storage/cypress_atacb.c                                   |    2 
 drivers/usb/storage/datafab.c                                         |    2 
 drivers/usb/storage/ene_ub6250.c                                      |    2 
 drivers/usb/storage/freecom.c                                         |    2 
 drivers/usb/storage/isd200.c                                          |    2 
 drivers/usb/storage/jumpshot.c                                        |    2 
 drivers/usb/storage/karma.c                                           |    2 
 drivers/usb/storage/onetouch.c                                        |    2 
 drivers/usb/storage/realtek_cr.c                                      |    2 
 drivers/usb/storage/sddr09.c                                          |    2 
 drivers/usb/storage/sddr55.c                                          |    2 
 drivers/usb/storage/shuttle_usbat.c                                   |    2 
 drivers/usb/storage/uas.c                                             |    2 
 drivers/vfio/cdx/main.c                                               |    2 
 drivers/vfio/iommufd.c                                                |    4 
 drivers/vfio/pci/mlx5/main.c                                          |    2 
 drivers/vfio/pci/pds/pci_drv.c                                        |    2 
 drivers/vfio/pci/qat/main.c                                           |    2 
 drivers/vfio/vfio_main.c                                              |    2 
 drivers/video/backlight/ktd2801-backlight.c                           |    2 
 drivers/virtio/virtio_dma_buf.c                                       |    2 
 drivers/watchdog/menz69_wdt.c                                         |    2 
 drivers/xen/gntdev-dmabuf.c                                           |    2 
 fs/efivarfs/vars.c                                                    |    2 
 include/kunit/visibility.h                                            |    5 
 include/linux/acpi.h                                                  |    2 
 include/linux/export.h                                                |    4 
 include/linux/fw_table.h                                              |    2 
 include/linux/module.h                                                |    2 
 include/linux/pm.h                                                    |    2 
 include/linux/pwm.h                                                   |    2 
 kernel/module/Kconfig                                                 |    2 
 kernel/resource.c                                                     |    2 
 lib/kunit/user_alloc.c                                                |    2 
 lib/test_firmware.c                                                   |    2 
 mm/kasan/kasan_test_c.c                                               |    2 
 net/handshake/handshake-test.c                                        |    2 
 net/mac80211/tests/elems.c                                            |    2 
 net/mac80211/tests/mfp.c                                              |    2 
 net/mac80211/tests/tpe.c                                              |    2 
 net/sunrpc/auth_gss/gss_krb5_test.c                                   |    2 
 net/wireless/tests/chan.c                                             |    2 
 net/wireless/tests/scan.c                                             |    2 
 samples/vfio-mdev/mbochs.c                                            |    2 
 scripts/coccinelle/misc/add_namespace.cocci                           |    4 
 security/apparmor/policy_unpack_test.c                                |    2 
 sound/hda/intel-dsp-config.c                                          |    2 
 sound/hda/intel-sdw-acpi.c                                            |    2 
 sound/pci/hda/cirrus_scodec.c                                         |    2 
 sound/pci/hda/cirrus_scodec_test.c                                    |    2 
 sound/pci/hda/cs35l41_hda.c                                           |   12 -
 sound/pci/hda/cs35l41_hda_i2c.c                                       |    2 
 sound/pci/hda/cs35l41_hda_spi.c                                       |    2 
 sound/pci/hda/cs35l56_hda.c                                           |   16 +-
 sound/pci/hda/cs35l56_hda_i2c.c                                       |    4 
 sound/pci/hda/cs35l56_hda_spi.c                                       |    4 
 sound/pci/hda/hda_component.c                                         |   14 -
 sound/pci/hda/hda_cs_dsp_ctl.c                                        |   12 -
 sound/pci/hda/patch_realtek.c                                         |    2 
 sound/pci/hda/tas2781_hda_i2c.c                                       |    2 
 sound/soc/amd/acp/acp-i2s.c                                           |    2 
 sound/soc/amd/acp/acp-legacy-common.c                                 |   18 +-
 sound/soc/amd/acp/acp-legacy-mach.c                                   |    2 
 sound/soc/amd/acp/acp-mach-common.c                                   |    4 
 sound/soc/amd/acp/acp-pci.c                                           |    2 
 sound/soc/amd/acp/acp-pdm.c                                           |    2 
 sound/soc/amd/acp/acp-platform.c                                      |   10 -
 sound/soc/amd/acp/acp-rembrandt.c                                     |    2 
 sound/soc/amd/acp/acp-renoir.c                                        |    2 
 sound/soc/amd/acp/acp-sdw-legacy-mach.c                               |    4 
 sound/soc/amd/acp/acp-sdw-mach-common.c                               |    2 
 sound/soc/amd/acp/acp-sdw-sof-mach.c                                  |    4 
 sound/soc/amd/acp/acp-sof-mach.c                                      |    2 
 sound/soc/amd/acp/acp63.c                                             |    2 
 sound/soc/amd/acp/acp70.c                                             |    2 
 sound/soc/amd/acp/amd-sdw-acpi.c                                      |    2 
 sound/soc/amd/ps/pci-ps.c                                             |    4 
 sound/soc/codecs/cs-amp-lib-test.c                                    |    2 
 sound/soc/codecs/cs-amp-lib.c                                         |    8 -
 sound/soc/codecs/cs35l45-i2c.c                                        |    2 
 sound/soc/codecs/cs35l45-spi.c                                        |    2 
 sound/soc/codecs/cs35l45-tables.c                                     |    8 -
 sound/soc/codecs/cs35l45.c                                            |    4 
 sound/soc/codecs/cs35l56-i2c.c                                        |    4 
 sound/soc/codecs/cs35l56-sdw.c                                        |    4 
 sound/soc/codecs/cs35l56-shared.c                                     |   52 +++----
 sound/soc/codecs/cs35l56-spi.c                                        |    4 
 sound/soc/codecs/cs35l56.c                                            |   10 -
 sound/soc/codecs/cs42l42-i2c.c                                        |    2 
 sound/soc/codecs/cs42l42-sdw.c                                        |    2 
 sound/soc/codecs/cs42l42.c                                            |   32 ++--
 sound/soc/codecs/cs42l43-sdw.c                                        |    6 
 sound/soc/codecs/cs42l43.c                                            |    2 
 sound/soc/codecs/cs42l83-i2c.c                                        |    2 
 sound/soc/codecs/cs530x-i2c.c                                         |    2 
 sound/soc/codecs/cs530x.c                                             |    4 
 sound/soc/codecs/rt712-sdca-sdw.c                                     |    2 
 sound/soc/codecs/tas2781-fmwlib.c                                     |   20 +-
 sound/soc/codecs/tas2781-i2c.c                                        |    2 
 sound/soc/codecs/wm_adsp.c                                            |    2 
 sound/soc/intel/boards/ehl_rt5660.c                                   |    2 
 sound/soc/intel/boards/hda_dsp_common.c                               |    2 
 sound/soc/intel/boards/skl_hda_dsp_generic.c                          |    2 
 sound/soc/intel/boards/sof_board_helpers.c                            |   10 -
 sound/soc/intel/boards/sof_cirrus_common.c                            |    4 
 sound/soc/intel/boards/sof_cs42l42.c                                  |    4 
 sound/soc/intel/boards/sof_da7219.c                                   |    4 
 sound/soc/intel/boards/sof_es8336.c                                   |    2 
 sound/soc/intel/boards/sof_maxim_common.c                             |   12 -
 sound/soc/intel/boards/sof_nau8825.c                                  |    8 -
 sound/soc/intel/boards/sof_nuvoton_common.c                           |    2 
 sound/soc/intel/boards/sof_pcm512x.c                                  |    2 
 sound/soc/intel/boards/sof_realtek_common.c                           |   16 +-
 sound/soc/intel/boards/sof_rt5682.c                                   |    6 
 sound/soc/intel/boards/sof_sdw.c                                      |    4 
 sound/soc/intel/boards/sof_ssp_amp.c                                  |    6 
 sound/soc/intel/common/soc-acpi-intel-mtl-match.c                     |    2 
 sound/soc/intel/common/soc-acpi-intel-sdca-quirks.c                   |    4 
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c                    |   10 -
 sound/soc/sdca/sdca_device.c                                          |    4 
 sound/soc/sdca/sdca_functions.c                                       |    2 
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c                          |    6 
 sound/soc/sdw_utils/soc_sdw_cs42l42.c                                 |    2 
 sound/soc/sdw_utils/soc_sdw_cs42l43.c                                 |    8 -
 sound/soc/sdw_utils/soc_sdw_cs_amp.c                                  |    4 
 sound/soc/sdw_utils/soc_sdw_dmic.c                                    |    2 
 sound/soc/sdw_utils/soc_sdw_maxim.c                                   |    4 
 sound/soc/sdw_utils/soc_sdw_rt5682.c                                  |    2 
 sound/soc/sdw_utils/soc_sdw_rt700.c                                   |    2 
 sound/soc/sdw_utils/soc_sdw_rt711.c                                   |    6 
 sound/soc/sdw_utils/soc_sdw_rt_amp.c                                  |    8 -
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c                                 |    2 
 sound/soc/sdw_utils/soc_sdw_rt_mf_sdca.c                              |    2 
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c                     |    6 
 sound/soc/sdw_utils/soc_sdw_utils.c                                   |   42 ++---
 sound/soc/sof/amd/acp-common.c                                        |    8 -
 sound/soc/sof/amd/acp-ipc.c                                           |   16 +-
 sound/soc/sof/amd/acp-loader.c                                        |   12 -
 sound/soc/sof/amd/acp-pcm.c                                           |    8 -
 sound/soc/sof/amd/acp-probes.c                                        |    6 
 sound/soc/sof/amd/acp-stream.c                                        |    6 
 sound/soc/sof/amd/acp-trace.c                                         |    4 
 sound/soc/sof/amd/acp.c                                               |   12 -
 sound/soc/sof/amd/acp63.c                                             |    2 
 sound/soc/sof/amd/acp70.c                                             |    2 
 sound/soc/sof/amd/pci-acp63.c                                         |    4 
 sound/soc/sof/amd/pci-acp70.c                                         |    4 
 sound/soc/sof/amd/pci-rmb.c                                           |    4 
 sound/soc/sof/amd/pci-rn.c                                            |    4 
 sound/soc/sof/amd/pci-vangogh.c                                       |    4 
 sound/soc/sof/amd/rembrandt.c                                         |    2 
 sound/soc/sof/amd/renoir.c                                            |    2 
 sound/soc/sof/amd/vangogh.c                                           |    2 
 sound/soc/sof/core.c                                                  |    2 
 sound/soc/sof/imx/imx8.c                                              |    2 
 sound/soc/sof/imx/imx8m.c                                             |    2 
 sound/soc/sof/imx/imx8ulp.c                                           |    2 
 sound/soc/sof/intel/atom.c                                            |   22 +-
 sound/soc/sof/intel/bdw.c                                             |    6 
 sound/soc/sof/intel/byt.c                                             |    8 -
 sound/soc/sof/intel/cnl.c                                             |   18 +-
 sound/soc/sof/intel/hda-bus.c                                         |    4 
 sound/soc/sof/intel/hda-codec.c                                       |   32 ++--
 sound/soc/sof/intel/hda-common-ops.c                                  |    2 
 sound/soc/sof/intel/hda-ctrl.c                                        |   16 +-
 sound/soc/sof/intel/hda-dai.c                                         |   14 -
 sound/soc/sof/intel/hda-dsp.c                                         |   62 ++++----
 sound/soc/sof/intel/hda-ipc.c                                         |   34 ++--
 sound/soc/sof/intel/hda-loader.c                                      |   16 +-
 sound/soc/sof/intel/hda-mlink.c                                       |   68 ++++-----
 sound/soc/sof/intel/hda-pcm.c                                         |   12 -
 sound/soc/sof/intel/hda-probes.c                                      |    6 
 sound/soc/sof/intel/hda-stream.c                                      |   18 +-
 sound/soc/sof/intel/hda-trace.c                                       |    6 
 sound/soc/sof/intel/hda.c                                             |   40 ++---
 sound/soc/sof/intel/lnl.c                                             |    6 
 sound/soc/sof/intel/mtl.c                                             |   30 ++--
 sound/soc/sof/intel/pci-apl.c                                         |    6 
 sound/soc/sof/intel/pci-cnl.c                                         |    6 
 sound/soc/sof/intel/pci-icl.c                                         |    8 -
 sound/soc/sof/intel/pci-lnl.c                                         |   10 -
 sound/soc/sof/intel/pci-mtl.c                                         |    6 
 sound/soc/sof/intel/pci-ptl.c                                         |   12 -
 sound/soc/sof/intel/pci-skl.c                                         |    6 
 sound/soc/sof/intel/pci-tgl.c                                         |    8 -
 sound/soc/sof/intel/pci-tng.c                                         |    8 -
 sound/soc/sof/intel/skl.c                                             |    6 
 sound/soc/sof/intel/telemetry.c                                       |    2 
 sound/soc/sof/mediatek/mt8186/mt8186.c                                |    4 
 sound/soc/sof/mediatek/mt8195/mt8195.c                                |    4 
 sound/soc/sof/sof-acpi-dev.c                                          |    6 
 sound/soc/sof/sof-client-ipc-flood-test.c                             |    2 
 sound/soc/sof/sof-client-ipc-kernel-injector.c                        |    2 
 sound/soc/sof/sof-client-ipc-msg-injector.c                           |    2 
 sound/soc/sof/sof-client-probes.c                                     |    2 
 sound/soc/sof/sof-client.c                                            |   40 ++---
 sound/soc/sof/sof-pci-dev.c                                           |    8 -
 sound/soc/sof/xtensa/core.c                                           |    2 
 tools/testing/cxl/cxl_core_exports.c                                  |    2 
 tools/testing/cxl/test/cxl.c                                          |    4 
 tools/testing/cxl/test/mem.c                                          |    2 
 tools/testing/cxl/test/mock.c                                         |   28 +--
 876 files changed, 2189 insertions(+), 2196 deletions(-)



