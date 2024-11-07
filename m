Return-Path: <linux-kbuild+bounces-4544-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D75669C062E
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 13:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3E701C2173E
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 12:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C6BB20F5B9;
	Thu,  7 Nov 2024 12:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kqiPQAha"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028651EF087;
	Thu,  7 Nov 2024 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730983889; cv=none; b=fxOm6uEnn88mjFJ8iz+EhEy7bB/XgHr0OWhZuh1mbPCA48s7AbHfBwqMuxMZI66ovXR+1jI9reO8Y2GJFVUj03fHlCM5m+Vvq7oGoJZrMGuBaBBIeDb6UGbm/PybUURzyFxqmOuee/qZY9iguJxvhuzcz42xmiouQnLkkxZG8Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730983889; c=relaxed/simple;
	bh=B9ZLBfMjCqVxk8Esa5kLWWLjxUOsvI41aJqAKME5wME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sizUX/mpdrZZ645Xd3eRUb2byLguQxDwnMx7sA367WBBYzvhIJ0cBxFBnv5+JC3a6FwEO3dJomrpIComW/i3H/EWGrqaqhYHDWgqPAM5fzV5eRBAH4kWdn7OInEnELPKlqfGGQD/6LN0DBLYJDH7sdSSGIZx7YyoKFVvKGyWCoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kqiPQAha; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GhgoEH331mpaSfa62pdmyQrVjKzc158XhUXvVBl/PLM=; b=kqiPQAhaZna3u2a20OER5WA/nQ
	VlR7QhQm54DXTkXmlhIRPFA7psxesw49z4b53tLIlyvGqbGatICMohGfjcze0InnPKz3Z/jmglul+
	dfWZMAz+UPzM5HP43sUFXXys3FruQ59s+YUUDrAyxLPCoNBnW1AFfB20eFrAwWrOS95PDgxlUVIyM
	2UOyS8blDgaMSSD70P0NMmy9qta0EYcFPQGJnXllwHenumrGHt/HZvVbnW6zkVLPHgp+j+M/5RzCQ
	xvXPu+ywUVkhKc2pDg5jvOMX0ZHacuDvkPKcg7Cs42ojgYAXBeDOWuamVE7hatVLqoLr0/Gm4AO6t
	Oy+DSnag==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t91yH-00000006f62-2dbK;
	Thu, 07 Nov 2024 12:50:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 24DFF3006AB; Thu,  7 Nov 2024 13:50:45 +0100 (CET)
Date: Thu, 7 Nov 2024 13:50:44 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>,
	Luis Chamberlain <mcgrof@kernel.org>, x86@kernel.org, hpa@zytor.com,
	petr.pavlu@suse.com, samitolvanen@google.com, da.gomez@samsung.com,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <20241107125044.GB38786@noisy.programming.kicks-ass.net>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
 <Zyv-yxClglfwvmUa@bombadil.infradead.org>
 <ZyxUTT8t28XUkk4x@infradead.org>
 <CAK7LNASDnB86Ds_dqBTxfHi=OfTXqu66U3v+4M_OEzKiK5Skdw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASDnB86Ds_dqBTxfHi=OfTXqu66U3v+4M_OEzKiK5Skdw@mail.gmail.com>

On Thu, Nov 07, 2024 at 05:12:57PM +0900, Masahiro Yamada wrote:
> Commit d143b9db8069f0e2a0fa34484e806a55a0dd4855
> revealed a bare namespace string was a bad idea.
> 
> With EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, SPI_DW_CORE)
> we do not know if "SPI_DW_CORE" is really a namespace string, or
> replaced with another string by macro expansions.
> 
> 
> With EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, "SPI_DW_CORE")
> we clearly know  "SPI_DW_CORE" is a namespace string.

Ah yes, that problem. But this is easily solved.

git grep -l MODULE_IMPORT_NS | while read file; do sed -i 's/MODULE_IMPORT_NS(\([^)]*\))/MODULE_IMPORT_NS("\1")/g' $file ; done
git grep -l EXPORT_SYMBOL_NS | while read file; do sed -i 's/\(EXPORT_SYMBOL_NS[^(]*\)(\([^,]*\), \([^)]*\))/\1(\2, "\3")/g' $file ; done

and small manual edits to module.h and export.h should ...
*sigh* and a few stray files because they split the EXPORT over two
lines.

This passes allmodconfig

---
 Documentation/core-api/symbol-namespaces.rst       |  8 +--
 .../it_IT/core-api/symbol-namespaces.rst           |  8 +--
 .../zh_CN/core-api/symbol-namespaces.rst           |  8 +--
 arch/arm64/crypto/aes-ce-ccm-glue.c                |  2 +-
 arch/arm64/crypto/aes-glue.c                       |  2 +-
 arch/powerpc/crypto/vmx.c                          |  2 +-
 arch/s390/crypto/aes_s390.c                        |  2 +-
 arch/x86/mm/pat/set_memory.c                       |  4 +-
 crypto/adiantum.c                                  |  2 +-
 crypto/ansi_cprng.c                                |  2 +-
 crypto/ccm.c                                       |  2 +-
 crypto/cipher.c                                    |  6 +-
 crypto/cmac.c                                      |  2 +-
 crypto/ctr.c                                       |  2 +-
 crypto/drbg.c                                      |  2 +-
 crypto/ecb.c                                       |  2 +-
 crypto/essiv.c                                     |  2 +-
 crypto/hctr2.c                                     |  2 +-
 crypto/keywrap.c                                   |  2 +-
 crypto/pcbc.c                                      |  2 +-
 crypto/skcipher.c                                  |  2 +-
 crypto/testmgr.c                                   |  2 +-
 crypto/vmac.c                                      |  2 +-
 crypto/xcbc.c                                      |  2 +-
 crypto/xctr.c                                      |  2 +-
 crypto/xts.c                                       |  2 +-
 drivers/accel/habanalabs/common/memory.c           |  2 +-
 drivers/accel/qaic/qaic_drv.c                      |  2 +-
 drivers/acpi/apei/einj-cxl.c                       |  8 +--
 drivers/acpi/apei/ghes.c                           |  6 +-
 drivers/acpi/numa/hmat.c                           |  2 +-
 drivers/acpi/thermal.c                             |  2 +-
 drivers/acpi/thermal_lib.c                         |  8 +--
 drivers/auxdisplay/ht16k33.c                       |  2 +-
 drivers/auxdisplay/img-ascii-lcd.c                 |  2 +-
 drivers/auxdisplay/line-display.c                  |  4 +-
 drivers/auxdisplay/max6959.c                       |  2 +-
 drivers/auxdisplay/seg-led-gpio.c                  |  2 +-
 drivers/base/firmware_loader/builtin/main.c        |  2 +-
 drivers/base/firmware_loader/fallback_table.c      |  6 +-
 drivers/base/firmware_loader/sysfs.h               |  2 +-
 drivers/cdx/cdx.c                                  |  8 +--
 drivers/cdx/cdx_msi.c                              |  2 +-
 drivers/cdx/controller/cdx_controller.c            |  2 +-
 drivers/clk/meson/a1-peripherals.c                 |  2 +-
 drivers/clk/meson/a1-pll.c                         |  2 +-
 drivers/clk/meson/axg-aoclk.c                      |  2 +-
 drivers/clk/meson/axg-audio.c                      |  2 +-
 drivers/clk/meson/axg.c                            |  2 +-
 drivers/clk/meson/c3-peripherals.c                 |  2 +-
 drivers/clk/meson/c3-pll.c                         |  2 +-
 drivers/clk/meson/clk-cpu-dyndiv.c                 |  4 +-
 drivers/clk/meson/clk-dualdiv.c                    |  6 +-
 drivers/clk/meson/clk-mpll.c                       |  6 +-
 drivers/clk/meson/clk-phase.c                      |  8 +--
 drivers/clk/meson/clk-pll.c                        |  8 +--
 drivers/clk/meson/clk-regmap.c                     | 14 ++--
 drivers/clk/meson/g12a-aoclk.c                     |  2 +-
 drivers/clk/meson/g12a.c                           |  2 +-
 drivers/clk/meson/gxbb-aoclk.c                     |  2 +-
 drivers/clk/meson/gxbb.c                           |  2 +-
 drivers/clk/meson/meson-aoclk.c                    |  4 +-
 drivers/clk/meson/meson-clkc-utils.c               |  4 +-
 drivers/clk/meson/meson-eeclk.c                    |  4 +-
 drivers/clk/meson/s4-peripherals.c                 |  2 +-
 drivers/clk/meson/s4-pll.c                         |  2 +-
 drivers/clk/meson/sclk-div.c                       |  4 +-
 drivers/clk/meson/vclk.c                           |  6 +-
 drivers/clk/meson/vid-pll-div.c                    |  4 +-
 drivers/clk/microchip/clk-mpfs.c                   |  2 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun20i-d1.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c           |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a100.c             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h616.c             |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c              |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c            |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           |  2 +-
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c               |  2 +-
 drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c           |  2 +-
 drivers/clk/sunxi-ng/ccu_common.c                  |  8 +--
 drivers/clk/sunxi-ng/ccu_div.c                     |  2 +-
 drivers/clk/sunxi-ng/ccu_frac.c                    | 12 ++--
 drivers/clk/sunxi-ng/ccu_gate.c                    |  8 +--
 drivers/clk/sunxi-ng/ccu_mp.c                      |  4 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |  2 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     | 12 ++--
 drivers/clk/sunxi-ng/ccu_nk.c                      |  2 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |  2 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |  2 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |  2 +-
 drivers/clk/sunxi-ng/ccu_phase.c                   |  2 +-
 drivers/clk/sunxi-ng/ccu_reset.c                   |  2 +-
 drivers/clk/sunxi-ng/ccu_sdm.c                     | 12 ++--
 drivers/counter/104-quad-8.c                       |  2 +-
 drivers/counter/counter-chrdev.c                   |  2 +-
 drivers/counter/counter-core.c                     | 14 ++--
 drivers/counter/ftm-quaddec.c                      |  2 +-
 drivers/counter/i8254.c                            |  4 +-
 drivers/counter/intel-qep.c                        |  2 +-
 drivers/counter/interrupt-cnt.c                    |  2 +-
 drivers/counter/microchip-tcb-capture.c            |  2 +-
 drivers/counter/rz-mtu3-cnt.c                      |  2 +-
 drivers/counter/stm32-lptimer-cnt.c                |  2 +-
 drivers/counter/stm32-timer-cnt.c                  |  2 +-
 drivers/counter/ti-ecap-capture.c                  |  2 +-
 drivers/counter/ti-eqep.c                          |  2 +-
 drivers/crypto/geode-aes.c                         |  2 +-
 drivers/crypto/inside-secure/safexcel.c            |  2 +-
 drivers/crypto/intel/iaa/iaa_crypto_main.c         |  2 +-
 drivers/crypto/intel/qat/qat_420xx/adf_drv.c       |  2 +-
 drivers/crypto/intel/qat/qat_4xxx/adf_drv.c        |  2 +-
 drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c       |  2 +-
 drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c     |  2 +-
 drivers/crypto/intel/qat/qat_c62x/adf_drv.c        |  2 +-
 drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c      |  2 +-
 drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c  |  2 +-
 drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c    |  2 +-
 drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c  |  2 +-
 drivers/crypto/marvell/octeontx2/cn10k_cpt.c       | 14 ++--
 .../marvell/octeontx2/otx2_cpt_mbox_common.c       | 20 +++---
 drivers/crypto/marvell/octeontx2/otx2_cptlf.c      | 20 +++---
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c |  2 +-
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c |  2 +-
 drivers/cxl/acpi.c                                 |  4 +-
 drivers/cxl/core/cdat.c                            |  6 +-
 drivers/cxl/core/hdm.c                             | 12 ++--
 drivers/cxl/core/mbox.c                            | 22 +++----
 drivers/cxl/core/memdev.c                          | 20 +++---
 drivers/cxl/core/pci.c                             | 18 +++---
 drivers/cxl/core/pmem.c                            | 14 ++--
 drivers/cxl/core/pmu.c                             |  2 +-
 drivers/cxl/core/port.c                            | 72 ++++++++++-----------
 drivers/cxl/core/region.c                          | 14 ++--
 drivers/cxl/core/regs.c                            | 20 +++---
 drivers/cxl/core/suspend.c                         |  4 +-
 drivers/cxl/mem.c                                  |  2 +-
 drivers/cxl/pci.c                                  |  2 +-
 drivers/cxl/pmem.c                                 |  2 +-
 drivers/cxl/port.c                                 |  2 +-
 drivers/dax/cxl.c                                  |  2 +-
 drivers/dma-buf/dma-buf.c                          | 42 ++++++------
 drivers/dma/idxd/compat.c                          |  2 +-
 drivers/dma/idxd/device.c                          | 14 ++--
 drivers/dma/idxd/init.c                            |  2 +-
 drivers/dma/idxd/submit.c                          |  6 +-
 drivers/firmware/cirrus/cs_dsp.c                   | 68 ++++++++++----------
 drivers/firmware/efi/efi-pstore.c                  |  2 +-
 drivers/firmware/efi/embedded-firmware.c           |  4 +-
 drivers/firmware/efi/vars.c                        | 16 ++---
 drivers/fpga/intel-m10-bmc-sec-update.c            |  2 +-
 drivers/gpio/gpio-104-dio-48e.c                    |  4 +-
 drivers/gpio/gpio-104-idio-16.c                    |  2 +-
 drivers/gpio/gpio-elkhartlake.c                    |  2 +-
 drivers/gpio/gpio-gpio-mm.c                        |  2 +-
 drivers/gpio/gpio-i8255.c                          |  2 +-
 drivers/gpio/gpio-ljca.c                           |  2 +-
 drivers/gpio/gpio-menz127.c                        |  2 +-
 drivers/gpio/gpio-merrifield.c                     |  2 +-
 drivers/gpio/gpio-pci-idio-16.c                    |  2 +-
 drivers/gpio/gpio-tangier.c                        |  2 +-
 drivers/gpio/gpiolib-swnode.c                      |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c            |  2 +-
 drivers/gpu/drm/armada/armada_gem.c                |  2 +-
 drivers/gpu/drm/drm_gem_dma_helper.c               |  2 +-
 drivers/gpu/drm/drm_gem_framebuffer_helper.c       |  2 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c             |  4 +-
 drivers/gpu/drm/drm_prime.c                        |  2 +-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c        |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c            |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c         |  2 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c                   |  4 +-
 drivers/gpu/drm/i915/intel_gvt.c                   | 74 +++++++++++-----------
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c        |  2 +-
 drivers/gpu/drm/imagination/pvr_drv.c              |  2 +-
 drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c          |  2 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c              |  2 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c              |  2 +-
 drivers/gpu/drm/solomon/ssd130x.c                  |  2 +-
 drivers/gpu/drm/tegra/gem.c                        |  2 +-
 drivers/gpu/drm/vmwgfx/ttm_object.c                |  2 +-
 drivers/gpu/drm/xe/tests/xe_live_test_mod.c        |  2 +-
 drivers/gpu/drm/xe/tests/xe_test_mod.c             |  2 +-
 drivers/gpu/drm/xe/xe_dma_buf.c                    |  2 +-
 drivers/hid/hid-uclogic-rdesc-test.c               |  2 +-
 drivers/hwmon/hwmon.c                              |  2 +-
 drivers/hwmon/intel-m10-bmc-hwmon.c                |  2 +-
 drivers/hwmon/nct6775-i2c.c                        |  2 +-
 drivers/hwmon/nct6775-platform.c                   |  2 +-
 drivers/hwmon/peci/cputemp.c                       |  2 +-
 drivers/hwmon/peci/dimmtemp.c                      |  2 +-
 drivers/hwmon/pmbus/acbel-fsg032.c                 |  2 +-
 drivers/hwmon/pmbus/adm1266.c                      |  2 +-
 drivers/hwmon/pmbus/adm1275.c                      |  2 +-
 drivers/hwmon/pmbus/adp1050.c                      |  2 +-
 drivers/hwmon/pmbus/bel-pfe.c                      |  2 +-
 drivers/hwmon/pmbus/bpa-rs600.c                    |  2 +-
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c            |  2 +-
 drivers/hwmon/pmbus/dps920ab.c                     |  2 +-
 drivers/hwmon/pmbus/fsp-3y.c                       |  2 +-
 drivers/hwmon/pmbus/ibm-cffps.c                    |  2 +-
 drivers/hwmon/pmbus/inspur-ipsps.c                 |  2 +-
 drivers/hwmon/pmbus/ir35221.c                      |  2 +-
 drivers/hwmon/pmbus/ir36021.c                      |  2 +-
 drivers/hwmon/pmbus/ir38064.c                      |  2 +-
 drivers/hwmon/pmbus/irps5401.c                     |  2 +-
 drivers/hwmon/pmbus/isl68137.c                     |  2 +-
 drivers/hwmon/pmbus/lm25066.c                      |  2 +-
 drivers/hwmon/pmbus/lt7182s.c                      |  2 +-
 drivers/hwmon/pmbus/ltc2978.c                      |  2 +-
 drivers/hwmon/pmbus/ltc3815.c                      |  2 +-
 drivers/hwmon/pmbus/max15301.c                     |  2 +-
 drivers/hwmon/pmbus/max16064.c                     |  2 +-
 drivers/hwmon/pmbus/max16601.c                     |  2 +-
 drivers/hwmon/pmbus/max20730.c                     |  2 +-
 drivers/hwmon/pmbus/max20751.c                     |  2 +-
 drivers/hwmon/pmbus/max31785.c                     |  2 +-
 drivers/hwmon/pmbus/max34440.c                     |  2 +-
 drivers/hwmon/pmbus/max8688.c                      |  2 +-
 drivers/hwmon/pmbus/mp2856.c                       |  2 +-
 drivers/hwmon/pmbus/mp2888.c                       |  2 +-
 drivers/hwmon/pmbus/mp2891.c                       |  2 +-
 drivers/hwmon/pmbus/mp2975.c                       |  2 +-
 drivers/hwmon/pmbus/mp2993.c                       |  2 +-
 drivers/hwmon/pmbus/mp5023.c                       |  2 +-
 drivers/hwmon/pmbus/mp5920.c                       |  2 +-
 drivers/hwmon/pmbus/mp5990.c                       |  2 +-
 drivers/hwmon/pmbus/mp9941.c                       |  2 +-
 drivers/hwmon/pmbus/mpq7932.c                      |  2 +-
 drivers/hwmon/pmbus/mpq8785.c                      |  2 +-
 drivers/hwmon/pmbus/pim4328.c                      |  2 +-
 drivers/hwmon/pmbus/pli1209bc.c                    |  2 +-
 drivers/hwmon/pmbus/pm6764tr.c                     |  2 +-
 drivers/hwmon/pmbus/pmbus.c                        |  2 +-
 drivers/hwmon/pmbus/pmbus_core.c                   | 42 ++++++------
 drivers/hwmon/pmbus/pxe1610.c                      |  2 +-
 drivers/hwmon/pmbus/q54sj108a2.c                   |  2 +-
 drivers/hwmon/pmbus/stpddc60.c                     |  2 +-
 drivers/hwmon/pmbus/tda38640.c                     |  2 +-
 drivers/hwmon/pmbus/tps40422.c                     |  2 +-
 drivers/hwmon/pmbus/tps53679.c                     |  2 +-
 drivers/hwmon/pmbus/tps546d24.c                    |  2 +-
 drivers/hwmon/pmbus/ucd9000.c                      |  2 +-
 drivers/hwmon/pmbus/ucd9200.c                      |  2 +-
 drivers/hwmon/pmbus/xdp710.c                       |  2 +-
 drivers/hwmon/pmbus/xdpe12284.c                    |  2 +-
 drivers/hwmon/pmbus/xdpe152c4.c                    |  2 +-
 drivers/hwmon/pmbus/zl6100.c                       |  2 +-
 drivers/i2c/busses/i2c-designware-master.c         |  2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  4 +-
 drivers/i2c/busses/i2c-designware-platdrv.c        |  4 +-
 drivers/i2c/busses/i2c-designware-slave.c          |  2 +-
 drivers/i2c/busses/i2c-ljca.c                      |  2 +-
 drivers/i2c/i2c-atr.c                              | 12 ++--
 drivers/iio/accel/adis16201.c                      |  2 +-
 drivers/iio/accel/adis16209.c                      |  2 +-
 drivers/iio/accel/adxl313_core.c                   | 16 ++---
 drivers/iio/accel/adxl313_i2c.c                    |  2 +-
 drivers/iio/accel/adxl313_spi.c                    |  2 +-
 drivers/iio/accel/adxl345_core.c                   |  2 +-
 drivers/iio/accel/adxl345_i2c.c                    |  2 +-
 drivers/iio/accel/adxl345_spi.c                    |  2 +-
 drivers/iio/accel/adxl355_core.c                   |  8 +--
 drivers/iio/accel/adxl355_i2c.c                    |  2 +-
 drivers/iio/accel/adxl355_spi.c                    |  2 +-
 drivers/iio/accel/adxl367.c                        |  2 +-
 drivers/iio/accel/adxl367_i2c.c                    |  2 +-
 drivers/iio/accel/adxl367_spi.c                    |  2 +-
 drivers/iio/accel/adxl372.c                        |  4 +-
 drivers/iio/accel/adxl372_i2c.c                    |  2 +-
 drivers/iio/accel/adxl372_spi.c                    |  2 +-
 drivers/iio/accel/adxl380.c                        |  8 +--
 drivers/iio/accel/adxl380_i2c.c                    |  2 +-
 drivers/iio/accel/adxl380_spi.c                    |  2 +-
 drivers/iio/accel/bma400_core.c                    |  4 +-
 drivers/iio/accel/bma400_i2c.c                     |  2 +-
 drivers/iio/accel/bma400_spi.c                     |  2 +-
 drivers/iio/accel/bmc150-accel-core.c              |  8 +--
 drivers/iio/accel/bmc150-accel-i2c.c               |  2 +-
 drivers/iio/accel/bmc150-accel-spi.c               |  2 +-
 drivers/iio/accel/bmi088-accel-core.c              |  6 +-
 drivers/iio/accel/bmi088-accel-i2c.c               |  2 +-
 drivers/iio/accel/bmi088-accel-spi.c               |  2 +-
 drivers/iio/accel/fxls8962af-core.c                |  6 +-
 drivers/iio/accel/fxls8962af-i2c.c                 |  2 +-
 drivers/iio/accel/fxls8962af-spi.c                 |  2 +-
 drivers/iio/accel/hid-sensor-accel-3d.c            |  2 +-
 drivers/iio/accel/kionix-kx022a-i2c.c              |  2 +-
 drivers/iio/accel/kionix-kx022a-spi.c              |  2 +-
 drivers/iio/accel/kionix-kx022a.c                  |  8 +--
 drivers/iio/accel/kxsd9-i2c.c                      |  2 +-
 drivers/iio/accel/kxsd9-spi.c                      |  2 +-
 drivers/iio/accel/kxsd9.c                          |  4 +-
 drivers/iio/accel/mma7455_core.c                   |  6 +-
 drivers/iio/accel/mma7455_i2c.c                    |  2 +-
 drivers/iio/accel/mma7455_spi.c                    |  2 +-
 drivers/iio/accel/mma9551.c                        |  2 +-
 drivers/iio/accel/mma9551_core.c                   | 36 +++++------
 drivers/iio/accel/mma9553.c                        |  2 +-
 drivers/iio/accel/ssp_accel_sensor.c               |  2 +-
 drivers/iio/accel/st_accel_core.c                  |  6 +-
 drivers/iio/accel/st_accel_i2c.c                   |  2 +-
 drivers/iio/accel/st_accel_spi.c                   |  2 +-
 drivers/iio/adc/ad7091r-base.c                     |  8 +--
 drivers/iio/adc/ad7091r5.c                         |  2 +-
 drivers/iio/adc/ad7091r8.c                         |  2 +-
 drivers/iio/adc/ad7124.c                           |  2 +-
 drivers/iio/adc/ad7173.c                           |  2 +-
 drivers/iio/adc/ad7192.c                           |  2 +-
 drivers/iio/adc/ad7606.c                           |  6 +-
 drivers/iio/adc/ad7606_par.c                       |  2 +-
 drivers/iio/adc/ad7606_spi.c                       |  2 +-
 drivers/iio/adc/ad7780.c                           |  2 +-
 drivers/iio/adc/ad7791.c                           |  2 +-
 drivers/iio/adc/ad7793.c                           |  2 +-
 drivers/iio/adc/ad9467.c                           |  2 +-
 drivers/iio/adc/ad_sigma_delta.c                   | 20 +++---
 drivers/iio/adc/adi-axi-adc.c                      |  4 +-
 drivers/iio/adc/ltc2497-core.c                     |  4 +-
 drivers/iio/adc/ltc2497.h                          |  2 +-
 drivers/iio/adc/max11205.c                         |  2 +-
 drivers/iio/adc/men_z188_adc.c                     |  2 +-
 drivers/iio/adc/sd_adc_modulator.c                 |  2 +-
 drivers/iio/adc/stm32-dfsdm-adc.c                  |  2 +-
 drivers/iio/addac/stx104.c                         |  2 +-
 drivers/iio/afe/iio-rescale.c                      |  4 +-
 drivers/iio/buffer/industrialio-buffer-dma.c       | 36 +++++------
 drivers/iio/buffer/industrialio-buffer-dmaengine.c |  8 +--
 drivers/iio/chemical/bme680_core.c                 |  4 +-
 drivers/iio/chemical/bme680_i2c.c                  |  2 +-
 drivers/iio/chemical/bme680_spi.c                  |  2 +-
 drivers/iio/chemical/ens160_core.c                 |  2 +-
 drivers/iio/chemical/ens160_i2c.c                  |  2 +-
 drivers/iio/chemical/ens160_spi.c                  |  2 +-
 drivers/iio/chemical/scd30_core.c                  |  2 +-
 drivers/iio/chemical/scd30_i2c.c                   |  2 +-
 drivers/iio/chemical/scd30_serial.c                |  2 +-
 drivers/iio/chemical/sps30.c                       |  2 +-
 drivers/iio/chemical/sps30_i2c.c                   |  2 +-
 drivers/iio/chemical/sps30_serial.c                |  2 +-
 .../iio/common/hid-sensors/hid-sensor-attributes.c | 26 ++++----
 .../iio/common/hid-sensors/hid-sensor-trigger.c    | 10 +--
 .../iio/common/inv_sensors/inv_sensors_timestamp.c |  8 +--
 drivers/iio/common/ms_sensors/ms_sensors_i2c.c     | 24 +++----
 drivers/iio/common/ssp_sensors/ssp_dev.c           | 10 +--
 drivers/iio/common/ssp_sensors/ssp_iio.c           |  8 +--
 drivers/iio/common/st_sensors/st_sensors_buffer.c  |  2 +-
 drivers/iio/common/st_sensors/st_sensors_core.c    | 28 ++++----
 drivers/iio/common/st_sensors/st_sensors_i2c.c     |  2 +-
 drivers/iio/common/st_sensors/st_sensors_spi.c     |  2 +-
 drivers/iio/common/st_sensors/st_sensors_trigger.c |  4 +-
 drivers/iio/dac/ad5592r-base.c                     |  4 +-
 drivers/iio/dac/ad5592r.c                          |  2 +-
 drivers/iio/dac/ad5593r.c                          |  2 +-
 drivers/iio/dac/ad5686-spi.c                       |  2 +-
 drivers/iio/dac/ad5686.c                           |  4 +-
 drivers/iio/dac/ad5696-i2c.c                       |  2 +-
 drivers/iio/dac/ad9739a.c                          |  2 +-
 drivers/iio/dac/adi-axi-dac.c                      |  4 +-
 drivers/iio/gyro/adis16136.c                       |  2 +-
 drivers/iio/gyro/adis16260.c                       |  2 +-
 drivers/iio/gyro/fxas21002c_core.c                 |  4 +-
 drivers/iio/gyro/fxas21002c_i2c.c                  |  2 +-
 drivers/iio/gyro/fxas21002c_spi.c                  |  2 +-
 drivers/iio/gyro/hid-sensor-gyro-3d.c              |  2 +-
 drivers/iio/gyro/ssp_gyro_sensor.c                 |  2 +-
 drivers/iio/gyro/st_gyro_core.c                    |  6 +-
 drivers/iio/gyro/st_gyro_i2c.c                     |  2 +-
 drivers/iio/gyro/st_gyro_spi.c                     |  2 +-
 drivers/iio/humidity/hid-sensor-humidity.c         |  2 +-
 drivers/iio/humidity/hts221_core.c                 |  2 +-
 drivers/iio/humidity/hts221_i2c.c                  |  2 +-
 drivers/iio/humidity/hts221_spi.c                  |  2 +-
 drivers/iio/humidity/htu21.c                       |  2 +-
 drivers/iio/imu/adis.c                             | 20 +++---
 drivers/iio/imu/adis16400.c                        |  2 +-
 drivers/iio/imu/adis16460.c                        |  2 +-
 drivers/iio/imu/adis16475.c                        |  2 +-
 drivers/iio/imu/adis16480.c                        |  2 +-
 drivers/iio/imu/adis_buffer.c                      |  4 +-
 drivers/iio/imu/adis_trigger.c                     |  2 +-
 drivers/iio/imu/bmi160/bmi160_core.c               |  6 +-
 drivers/iio/imu/bmi160/bmi160_i2c.c                |  2 +-
 drivers/iio/imu/bmi160/bmi160_spi.c                |  2 +-
 drivers/iio/imu/bmi323/bmi323_core.c               |  4 +-
 drivers/iio/imu/bmi323/bmi323_i2c.c                |  2 +-
 drivers/iio/imu/bmi323/bmi323_spi.c                |  2 +-
 drivers/iio/imu/bno055/bno055.c                    |  4 +-
 drivers/iio/imu/bno055/bno055_i2c.c                |  2 +-
 drivers/iio/imu/bno055/bno055_ser_core.c           |  2 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_core.c   |  6 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c    |  2 +-
 drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c    |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |  4 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |  2 +-
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c        |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c        |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c        |  2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c       |  4 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c        |  2 +-
 drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c        |  2 +-
 drivers/iio/industrialio-backend.c                 | 48 +++++++-------
 drivers/iio/industrialio-buffer.c                  |  2 +-
 drivers/iio/industrialio-gts-helper.c              | 26 ++++----
 drivers/iio/light/apds9306.c                       |  2 +-
 drivers/iio/light/bh1745.c                         |  2 +-
 drivers/iio/light/hid-sensor-als.c                 |  2 +-
 drivers/iio/light/hid-sensor-prox.c                |  2 +-
 drivers/iio/light/rohm-bu27008.c                   |  2 +-
 drivers/iio/light/rohm-bu27034.c                   |  2 +-
 drivers/iio/light/st_uvis25_core.c                 |  2 +-
 drivers/iio/light/st_uvis25_i2c.c                  |  2 +-
 drivers/iio/light/st_uvis25_spi.c                  |  2 +-
 drivers/iio/magnetometer/bmc150_magn.c             |  8 +--
 drivers/iio/magnetometer/bmc150_magn_i2c.c         |  2 +-
 drivers/iio/magnetometer/bmc150_magn_spi.c         |  2 +-
 drivers/iio/magnetometer/hid-sensor-magn-3d.c      |  2 +-
 drivers/iio/magnetometer/hmc5843_core.c            |  4 +-
 drivers/iio/magnetometer/hmc5843_i2c.c             |  2 +-
 drivers/iio/magnetometer/hmc5843_spi.c             |  2 +-
 drivers/iio/magnetometer/rm3100-core.c             |  8 +--
 drivers/iio/magnetometer/rm3100-i2c.c              |  2 +-
 drivers/iio/magnetometer/rm3100-spi.c              |  2 +-
 drivers/iio/magnetometer/st_magn_core.c            |  6 +-
 drivers/iio/magnetometer/st_magn_i2c.c             |  2 +-
 drivers/iio/magnetometer/st_magn_spi.c             |  2 +-
 drivers/iio/orientation/hid-sensor-incl-3d.c       |  2 +-
 drivers/iio/orientation/hid-sensor-rotation.c      |  2 +-
 .../iio/position/hid-sensor-custom-intel-hinge.c   |  2 +-
 drivers/iio/pressure/bmp280-core.c                 | 12 ++--
 drivers/iio/pressure/bmp280-i2c.c                  |  2 +-
 drivers/iio/pressure/bmp280-regmap.c               | 10 +--
 drivers/iio/pressure/bmp280-spi.c                  |  2 +-
 drivers/iio/pressure/hid-sensor-press.c            |  2 +-
 drivers/iio/pressure/hsc030pa.c                    |  2 +-
 drivers/iio/pressure/hsc030pa_i2c.c                |  2 +-
 drivers/iio/pressure/hsc030pa_spi.c                |  2 +-
 drivers/iio/pressure/mpl115.c                      |  2 +-
 drivers/iio/pressure/mpl115_i2c.c                  |  2 +-
 drivers/iio/pressure/mpl115_spi.c                  |  2 +-
 drivers/iio/pressure/mprls0025pa.c                 |  2 +-
 drivers/iio/pressure/mprls0025pa_i2c.c             |  2 +-
 drivers/iio/pressure/mprls0025pa_spi.c             |  2 +-
 drivers/iio/pressure/ms5611_core.c                 |  2 +-
 drivers/iio/pressure/ms5611_i2c.c                  |  2 +-
 drivers/iio/pressure/ms5611_spi.c                  |  2 +-
 drivers/iio/pressure/ms5637.c                      |  2 +-
 drivers/iio/pressure/st_pressure_core.c            |  6 +-
 drivers/iio/pressure/st_pressure_i2c.c             |  2 +-
 drivers/iio/pressure/st_pressure_spi.c             |  2 +-
 drivers/iio/pressure/zpa2326.c                     | 12 ++--
 drivers/iio/pressure/zpa2326_i2c.c                 |  2 +-
 drivers/iio/pressure/zpa2326_spi.c                 |  2 +-
 drivers/iio/proximity/sx9310.c                     |  2 +-
 drivers/iio/proximity/sx9324.c                     |  2 +-
 drivers/iio/proximity/sx9360.c                     |  2 +-
 drivers/iio/proximity/sx_common.c                  | 12 ++--
 drivers/iio/temperature/hid-sensor-temperature.c   |  2 +-
 drivers/iio/temperature/tsys01.c                   |  2 +-
 drivers/iio/temperature/tsys02d.c                  |  2 +-
 drivers/iio/test/iio-test-gts.c                    |  2 +-
 drivers/iio/test/iio-test-rescale.c                |  2 +-
 drivers/infiniband/core/umem_dmabuf.c              |  2 +-
 drivers/infiniband/hw/mana/device.c                |  2 +-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c   |  2 +-
 drivers/iommu/iommu.c                              | 10 +--
 drivers/iommu/iommufd/device.c                     | 32 +++++-----
 drivers/iommu/iommufd/iova_bitmap.c                |  8 +--
 drivers/iommu/iommufd/main.c                       | 12 ++--
 drivers/iommu/iommufd/vfio_compat.c                |  6 +-
 drivers/leds/flash/leds-ktd2692.c                  |  2 +-
 drivers/leds/leds-expresswire.c                    | 12 ++--
 drivers/mcb/mcb-core.c                             | 28 ++++----
 drivers/mcb/mcb-lpc.c                              |  2 +-
 drivers/mcb/mcb-parse.c                            |  2 +-
 drivers/mcb/mcb-pci.c                              |  2 +-
 drivers/media/common/videobuf2/videobuf2-core.c    |  2 +-
 .../media/common/videobuf2/videobuf2-dma-contig.c  |  2 +-
 drivers/media/common/videobuf2/videobuf2-dma-sg.c  |  2 +-
 drivers/media/common/videobuf2/videobuf2-vmalloc.c |  2 +-
 drivers/media/i2c/ds90ub913.c                      |  2 +-
 drivers/media/i2c/ds90ub953.c                      |  2 +-
 drivers/media/i2c/ds90ub960.c                      |  2 +-
 drivers/media/pci/intel/ipu-bridge.c               |  6 +-
 drivers/media/pci/intel/ipu3/ipu3-cio2.c           |  2 +-
 drivers/media/pci/intel/ipu6/ipu6-buttress.c       | 12 ++--
 drivers/media/pci/intel/ipu6/ipu6-cpd.c            |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-fw-com.c         | 18 +++---
 drivers/media/pci/intel/ipu6/ipu6-isys.c           |  4 +-
 drivers/media/pci/intel/ipu6/ipu6-mmu.c            |  4 +-
 drivers/media/pci/intel/ipu6/ipu6.c                |  4 +-
 drivers/media/pci/intel/ivsc/mei_csi.c             |  2 +-
 .../media/platform/nvidia/tegra-vde/dmabuf-cache.c |  2 +-
 drivers/mfd/cs40l50-core.c                         |  2 +-
 drivers/mfd/cs42l43-i2c.c                          |  2 +-
 drivers/mfd/cs42l43-sdw.c                          |  2 +-
 drivers/mfd/cs42l43.c                              | 12 ++--
 drivers/mfd/intel-lpss-acpi.c                      |  2 +-
 drivers/mfd/intel-lpss-pci.c                       |  2 +-
 drivers/mfd/intel-lpss.c                           |  4 +-
 drivers/mfd/intel-m10-bmc-core.c                   | 10 +--
 drivers/mfd/intel-m10-bmc-pmci.c                   |  2 +-
 drivers/mfd/intel-m10-bmc-spi.c                    |  2 +-
 drivers/mfd/ocelot-core.c                          |  6 +-
 drivers/mfd/ocelot-spi.c                           |  4 +-
 drivers/misc/fastrpc.c                             |  2 +-
 drivers/misc/mei/platform-vsc.c                    |  2 +-
 drivers/misc/mei/vsc-fw-loader.c                   |  2 +-
 drivers/misc/mei/vsc-tp.c                          | 18 +++---
 drivers/net/dsa/ocelot/ocelot_ext.c                |  2 +-
 drivers/net/dsa/realtek/realtek-mdio.c             |  6 +-
 drivers/net/dsa/realtek/realtek-smi.c              |  6 +-
 drivers/net/dsa/realtek/rtl8365mb.c                |  2 +-
 drivers/net/dsa/realtek/rtl8366-core.c             | 22 +++----
 drivers/net/dsa/realtek/rtl8366rb.c                |  2 +-
 drivers/net/dsa/realtek/rtl83xx.c                  | 16 ++---
 drivers/net/ethernet/intel/i40e/i40e_main.c        |  2 +-
 drivers/net/ethernet/intel/iavf/iavf_main.c        |  4 +-
 drivers/net/ethernet/intel/ice/ice_main.c          |  2 +-
 drivers/net/ethernet/intel/idpf/idpf_main.c        |  2 +-
 drivers/net/ethernet/intel/libeth/rx.c             |  8 +--
 drivers/net/ethernet/intel/libie/rx.c              |  4 +-
 drivers/net/ethernet/microsoft/mana/gdma_main.c    | 12 ++--
 drivers/net/ethernet/microsoft/mana/mana_en.c      | 10 +--
 .../broadcom/brcm80211/brcmfmac/bca/module.c       |  2 +-
 .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  2 +-
 .../broadcom/brcm80211/brcmfmac/cyw/module.c       |  2 +-
 .../broadcom/brcm80211/brcmfmac/wcc/module.c       |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/main.c      |  2 +-
 drivers/net/wireless/intel/iwlwifi/iwl-drv.h       |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/ops.c       |  2 +-
 .../net/wireless/intel/iwlwifi/mvm/tests/links.c   |  2 +-
 .../net/wireless/intel/iwlwifi/mvm/tests/scan.c    |  2 +-
 drivers/net/wireless/intel/iwlwifi/tests/devinfo.c |  2 +-
 drivers/nvdimm/region_devs.c                       |  2 +-
 drivers/nvme/host/core.c                           | 14 ++--
 drivers/nvme/target/passthru.c                     |  2 +-
 drivers/pci/pcie/aer.c                             |  4 +-
 drivers/peci/controller/peci-aspeed.c              |  2 +-
 drivers/peci/controller/peci-npcm.c                |  2 +-
 drivers/peci/core.c                                |  2 +-
 drivers/peci/cpu.c                                 | 12 ++--
 drivers/peci/device.c                              |  4 +-
 drivers/peci/request.c                             | 30 ++++-----
 drivers/perf/cxl_pmu.c                             |  2 +-
 drivers/pinctrl/intel/pinctrl-alderlake.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c           |  2 +-
 drivers/pinctrl/intel/pinctrl-broxton.c            |  2 +-
 drivers/pinctrl/intel/pinctrl-cannonlake.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-cedarfork.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-denverton.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-elkhartlake.c        |  2 +-
 drivers/pinctrl/intel/pinctrl-emmitsburg.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-geminilake.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-icelake.c            |  2 +-
 drivers/pinctrl/intel/pinctrl-intel-platform.c     |  2 +-
 drivers/pinctrl/intel/pinctrl-intel.c              | 22 +++----
 drivers/pinctrl/intel/pinctrl-jasperlake.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-lakefield.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-lewisburg.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c          |  2 +-
 drivers/pinctrl/intel/pinctrl-merrifield.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-meteorlake.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-meteorpoint.c        |  2 +-
 drivers/pinctrl/intel/pinctrl-moorefield.c         |  2 +-
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c       |  2 +-
 drivers/pinctrl/intel/pinctrl-tangier.c            |  2 +-
 drivers/pinctrl/intel/pinctrl-tigerlake.c          |  2 +-
 drivers/platform/x86/ideapad-laptop.c              |  6 +-
 drivers/platform/x86/intel/intel_plr_tpmi.c        |  4 +-
 drivers/platform/x86/intel/pmc/core_ssram.c        |  4 +-
 drivers/platform/x86/intel/pmt/class.c             |  8 +--
 drivers/platform/x86/intel/pmt/crashlog.c          |  2 +-
 drivers/platform/x86/intel/pmt/telemetry.c         | 16 ++---
 .../platform/x86/intel/speed_select_if/isst_tpmi.c |  2 +-
 .../x86/intel/speed_select_if/isst_tpmi_core.c     | 16 ++---
 drivers/platform/x86/intel/tpmi.c                  | 12 ++--
 drivers/platform/x86/intel/tpmi_power_domains.c    |  8 +--
 .../uncore-frequency/uncore-frequency-common.c     |  8 +--
 .../intel/uncore-frequency/uncore-frequency-tpmi.c |  4 +-
 .../x86/intel/uncore-frequency/uncore-frequency.c  |  2 +-
 drivers/platform/x86/intel/vsec.c                  |  4 +-
 drivers/platform/x86/lenovo-ymc.c                  |  2 +-
 drivers/powercap/idle_inject.c                     | 16 ++---
 drivers/powercap/intel_rapl_tpmi.c                 |  2 +-
 drivers/pwm/pwm-dwc.h                              |  2 +-
 drivers/pwm/pwm-lpss-pci.c                         |  2 +-
 drivers/pwm/pwm-lpss-platform.c                    |  2 +-
 drivers/reset/reset-mpfs.c                         |  4 +-
 drivers/rtc/rtc-hid-sensor-time.c                  |  2 +-
 drivers/soundwire/amd_init.c                       |  6 +-
 drivers/soundwire/intel.c                          |  2 +-
 drivers/soundwire/intel_ace2x.c                    |  4 +-
 drivers/soundwire/intel_init.c                     | 10 +--
 drivers/spi/spi-cs42l43.c                          |  2 +-
 drivers/spi/spi-dw-bt1.c                           |  2 +-
 drivers/spi/spi-dw-core.c                          | 14 ++--
 drivers/spi/spi-dw-dma.c                           |  4 +-
 drivers/spi/spi-dw-mmio.c                          |  2 +-
 drivers/spi/spi-dw-pci.c                           |  2 +-
 drivers/spi/spi-ljca.c                             |  2 +-
 drivers/spi/spi-loongson-core.c                    |  4 +-
 drivers/spi/spi-loongson-pci.c                     |  2 +-
 drivers/spi/spi-loongson-plat.c                    |  2 +-
 drivers/spi/spi-pxa2xx-pci.c                       |  2 +-
 drivers/spi/spi-pxa2xx-platform.c                  |  2 +-
 drivers/spi/spi-pxa2xx.c                           |  4 +-
 drivers/staging/iio/accel/adis16203.c              |  2 +-
 drivers/staging/iio/accel/adis16240.c              |  2 +-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   |  2 +-
 .../int340x_thermal/processor_thermal_device.c     |  4 +-
 .../int340x_thermal/processor_thermal_device_pci.c |  2 +-
 .../intel/int340x_thermal/processor_thermal_mbox.c |  6 +-
 .../processor_thermal_power_floor.c                | 12 ++--
 .../intel/int340x_thermal/processor_thermal_rfim.c |  2 +-
 .../int340x_thermal/processor_thermal_wt_hint.c    | 10 +--
 .../int340x_thermal/processor_thermal_wt_req.c     |  2 +-
 drivers/thermal/intel/intel_powerclamp.c           |  2 +-
 drivers/thermal/intel/intel_soc_dts_iosf.c         |  2 +-
 drivers/thermal/intel/intel_tcc.c                  | 10 +--
 drivers/thermal/intel/intel_tcc_cooling.c          |  2 +-
 drivers/thermal/intel/x86_pkg_temp_thermal.c       |  2 +-
 drivers/thermal/thermal_hwmon.c                    |  2 +-
 drivers/tty/serial/8250/8250_exar.c                |  2 +-
 drivers/tty/serial/8250/8250_men_mcb.c             |  2 +-
 drivers/tty/serial/8250/8250_pci.c                 |  2 +-
 drivers/tty/serial/8250/8250_pci1xxxx.c            |  2 +-
 drivers/tty/serial/8250/8250_pcilib.c              |  2 +-
 drivers/tty/serial/men_z135_uart.c                 |  2 +-
 drivers/tty/serial/sc16is7xx_i2c.c                 |  2 +-
 drivers/tty/serial/sc16is7xx_spi.c                 |  2 +-
 drivers/usb/gadget/function/f_fs.c                 |  2 +-
 drivers/usb/host/xhci-pci-renesas.c                |  2 +-
 drivers/usb/host/xhci-pci.c                        |  4 +-
 drivers/usb/misc/usb-ljca.c                        |  8 +--
 drivers/usb/storage/alauda.c                       |  2 +-
 drivers/usb/storage/cypress_atacb.c                |  2 +-
 drivers/usb/storage/datafab.c                      |  2 +-
 drivers/usb/storage/ene_ub6250.c                   |  2 +-
 drivers/usb/storage/freecom.c                      |  2 +-
 drivers/usb/storage/isd200.c                       |  2 +-
 drivers/usb/storage/jumpshot.c                     |  2 +-
 drivers/usb/storage/karma.c                        |  2 +-
 drivers/usb/storage/onetouch.c                     |  2 +-
 drivers/usb/storage/realtek_cr.c                   |  2 +-
 drivers/usb/storage/sddr09.c                       |  2 +-
 drivers/usb/storage/sddr55.c                       |  2 +-
 drivers/usb/storage/shuttle_usbat.c                |  2 +-
 drivers/usb/storage/uas.c                          |  2 +-
 drivers/vfio/cdx/main.c                            |  2 +-
 drivers/vfio/iommufd.c                             |  4 +-
 drivers/vfio/pci/mlx5/main.c                       |  2 +-
 drivers/vfio/pci/pds/pci_drv.c                     |  2 +-
 drivers/vfio/pci/qat/main.c                        |  2 +-
 drivers/vfio/vfio_main.c                           |  2 +-
 drivers/video/backlight/ktd2801-backlight.c        |  2 +-
 drivers/virtio/virtio_dma_buf.c                    |  2 +-
 drivers/watchdog/menz69_wdt.c                      |  2 +-
 drivers/xen/gntdev-dmabuf.c                        |  2 +-
 fs/efivarfs/vars.c                                 |  2 +-
 include/kunit/visibility.h                         |  5 +-
 include/linux/acpi.h                               |  2 +-
 include/linux/export.h                             |  4 +-
 include/linux/fw_table.h                           |  2 +-
 include/linux/module.h                             |  2 +-
 include/linux/pm.h                                 |  2 +-
 include/linux/pwm.h                                |  2 +-
 kernel/module/Kconfig                              |  2 +-
 kernel/resource.c                                  |  2 +-
 lib/kunit/user_alloc.c                             |  2 +-
 lib/test_firmware.c                                |  2 +-
 net/handshake/handshake-test.c                     |  2 +-
 net/mac80211/tests/elems.c                         |  2 +-
 net/mac80211/tests/mfp.c                           |  2 +-
 net/mac80211/tests/tpe.c                           |  2 +-
 net/sunrpc/auth_gss/gss_krb5_test.c                |  2 +-
 net/wireless/tests/chan.c                          |  2 +-
 net/wireless/tests/scan.c                          |  2 +-
 samples/vfio-mdev/mbochs.c                         |  2 +-
 scripts/coccinelle/misc/add_namespace.cocci        |  4 +-
 security/apparmor/policy_unpack_test.c             |  2 +-
 sound/hda/intel-dsp-config.c                       |  2 +-
 sound/hda/intel-sdw-acpi.c                         |  2 +-
 sound/pci/hda/cirrus_scodec.c                      |  2 +-
 sound/pci/hda/cirrus_scodec_test.c                 |  2 +-
 sound/pci/hda/cs35l41_hda.c                        | 12 ++--
 sound/pci/hda/cs35l41_hda_i2c.c                    |  2 +-
 sound/pci/hda/cs35l41_hda_spi.c                    |  2 +-
 sound/pci/hda/cs35l56_hda.c                        | 16 ++---
 sound/pci/hda/cs35l56_hda_i2c.c                    |  4 +-
 sound/pci/hda/cs35l56_hda_spi.c                    |  4 +-
 sound/pci/hda/hda_component.c                      | 14 ++--
 sound/pci/hda/hda_cs_dsp_ctl.c                     | 12 ++--
 sound/pci/hda/patch_realtek.c                      |  2 +-
 sound/pci/hda/tas2781_hda_i2c.c                    |  2 +-
 sound/soc/amd/acp/acp-i2s.c                        |  2 +-
 sound/soc/amd/acp/acp-legacy-common.c              | 18 +++---
 sound/soc/amd/acp/acp-legacy-mach.c                |  2 +-
 sound/soc/amd/acp/acp-mach-common.c                |  4 +-
 sound/soc/amd/acp/acp-pci.c                        |  2 +-
 sound/soc/amd/acp/acp-pdm.c                        |  2 +-
 sound/soc/amd/acp/acp-platform.c                   | 10 +--
 sound/soc/amd/acp/acp-rembrandt.c                  |  2 +-
 sound/soc/amd/acp/acp-renoir.c                     |  2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c               |  2 +-
 sound/soc/amd/acp/acp-sof-mach.c                   |  2 +-
 sound/soc/amd/acp/acp63.c                          |  2 +-
 sound/soc/amd/acp/acp70.c                          |  2 +-
 sound/soc/amd/acp/amd-sdw-acpi.c                   |  2 +-
 sound/soc/amd/ps/pci-ps.c                          |  4 +-
 sound/soc/codecs/cs-amp-lib-test.c                 |  2 +-
 sound/soc/codecs/cs-amp-lib.c                      |  8 +--
 sound/soc/codecs/cs35l45-i2c.c                     |  2 +-
 sound/soc/codecs/cs35l45-spi.c                     |  2 +-
 sound/soc/codecs/cs35l45-tables.c                  |  8 +--
 sound/soc/codecs/cs35l45.c                         |  4 +-
 sound/soc/codecs/cs35l56-i2c.c                     |  4 +-
 sound/soc/codecs/cs35l56-sdw.c                     |  4 +-
 sound/soc/codecs/cs35l56-shared.c                  | 52 +++++++--------
 sound/soc/codecs/cs35l56-spi.c                     |  4 +-
 sound/soc/codecs/cs35l56.c                         | 10 +--
 sound/soc/codecs/cs42l42-i2c.c                     |  2 +-
 sound/soc/codecs/cs42l42-sdw.c                     |  2 +-
 sound/soc/codecs/cs42l42.c                         | 32 +++++-----
 sound/soc/codecs/cs42l43-sdw.c                     |  6 +-
 sound/soc/codecs/cs42l43.c                         |  2 +-
 sound/soc/codecs/cs42l83-i2c.c                     |  2 +-
 sound/soc/codecs/cs530x-i2c.c                      |  2 +-
 sound/soc/codecs/cs530x.c                          |  4 +-
 sound/soc/codecs/tas2781-fmwlib.c                  | 20 +++---
 sound/soc/codecs/tas2781-i2c.c                     |  2 +-
 sound/soc/codecs/wm_adsp.c                         |  2 +-
 sound/soc/intel/boards/ehl_rt5660.c                |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c            |  2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c       |  2 +-
 sound/soc/intel/boards/sof_board_helpers.c         | 10 +--
 sound/soc/intel/boards/sof_cirrus_common.c         |  4 +-
 sound/soc/intel/boards/sof_cs42l42.c               |  4 +-
 sound/soc/intel/boards/sof_da7219.c                |  4 +-
 sound/soc/intel/boards/sof_es8336.c                |  2 +-
 sound/soc/intel/boards/sof_maxim_common.c          | 12 ++--
 sound/soc/intel/boards/sof_nau8825.c               |  8 +--
 sound/soc/intel/boards/sof_nuvoton_common.c        |  2 +-
 sound/soc/intel/boards/sof_pcm512x.c               |  2 +-
 sound/soc/intel/boards/sof_realtek_common.c        | 16 ++---
 sound/soc/intel/boards/sof_rt5682.c                |  6 +-
 sound/soc/intel/boards/sof_sdw.c                   |  4 +-
 sound/soc/intel/boards/sof_ssp_amp.c               |  6 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c | 10 +--
 sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c       |  6 +-
 sound/soc/sdw_utils/soc_sdw_cs42l42.c              |  2 +-
 sound/soc/sdw_utils/soc_sdw_cs42l43.c              |  8 +--
 sound/soc/sdw_utils/soc_sdw_cs_amp.c               |  4 +-
 sound/soc/sdw_utils/soc_sdw_dmic.c                 |  2 +-
 sound/soc/sdw_utils/soc_sdw_maxim.c                |  4 +-
 sound/soc/sdw_utils/soc_sdw_rt5682.c               |  2 +-
 sound/soc/sdw_utils/soc_sdw_rt700.c                |  2 +-
 sound/soc/sdw_utils/soc_sdw_rt711.c                |  6 +-
 sound/soc/sdw_utils/soc_sdw_rt712_sdca.c           |  2 +-
 sound/soc/sdw_utils/soc_sdw_rt722_sdca.c           |  2 +-
 sound/soc/sdw_utils/soc_sdw_rt_amp.c               |  8 +--
 sound/soc/sdw_utils/soc_sdw_rt_dmic.c              |  2 +-
 sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c  |  6 +-
 sound/soc/sdw_utils/soc_sdw_utils.c                | 42 ++++++------
 sound/soc/sof/amd/acp-common.c                     |  8 +--
 sound/soc/sof/amd/acp-ipc.c                        | 16 ++---
 sound/soc/sof/amd/acp-loader.c                     | 12 ++--
 sound/soc/sof/amd/acp-pcm.c                        |  8 +--
 sound/soc/sof/amd/acp-probes.c                     |  6 +-
 sound/soc/sof/amd/acp-stream.c                     |  6 +-
 sound/soc/sof/amd/acp-trace.c                      |  4 +-
 sound/soc/sof/amd/acp.c                            | 12 ++--
 sound/soc/sof/amd/acp63.c                          |  2 +-
 sound/soc/sof/amd/acp70.c                          |  2 +-
 sound/soc/sof/amd/pci-acp63.c                      |  4 +-
 sound/soc/sof/amd/pci-acp70.c                      |  4 +-
 sound/soc/sof/amd/pci-rmb.c                        |  4 +-
 sound/soc/sof/amd/pci-rn.c                         |  4 +-
 sound/soc/sof/amd/pci-vangogh.c                    |  4 +-
 sound/soc/sof/amd/rembrandt.c                      |  2 +-
 sound/soc/sof/amd/renoir.c                         |  2 +-
 sound/soc/sof/amd/vangogh.c                        |  2 +-
 sound/soc/sof/core.c                               |  2 +-
 sound/soc/sof/imx/imx8.c                           |  2 +-
 sound/soc/sof/imx/imx8m.c                          |  2 +-
 sound/soc/sof/imx/imx8ulp.c                        |  2 +-
 sound/soc/sof/intel/atom.c                         | 22 +++----
 sound/soc/sof/intel/bdw.c                          |  6 +-
 sound/soc/sof/intel/byt.c                          |  8 +--
 sound/soc/sof/intel/cnl.c                          | 18 +++---
 sound/soc/sof/intel/hda-bus.c                      |  4 +-
 sound/soc/sof/intel/hda-codec.c                    | 32 +++++-----
 sound/soc/sof/intel/hda-common-ops.c               |  2 +-
 sound/soc/sof/intel/hda-ctrl.c                     | 16 ++---
 sound/soc/sof/intel/hda-dai.c                      | 14 ++--
 sound/soc/sof/intel/hda-dsp.c                      | 62 +++++++++---------
 sound/soc/sof/intel/hda-ipc.c                      | 34 +++++-----
 sound/soc/sof/intel/hda-loader.c                   | 16 ++---
 sound/soc/sof/intel/hda-mlink.c                    | 66 +++++++++----------
 sound/soc/sof/intel/hda-pcm.c                      | 12 ++--
 sound/soc/sof/intel/hda-probes.c                   |  6 +-
 sound/soc/sof/intel/hda-stream.c                   | 18 +++---
 sound/soc/sof/intel/hda-trace.c                    |  6 +-
 sound/soc/sof/intel/hda.c                          | 40 ++++++------
 sound/soc/sof/intel/lnl.c                          |  6 +-
 sound/soc/sof/intel/mtl.c                          | 30 ++++-----
 sound/soc/sof/intel/pci-apl.c                      |  6 +-
 sound/soc/sof/intel/pci-cnl.c                      |  6 +-
 sound/soc/sof/intel/pci-icl.c                      |  8 +--
 sound/soc/sof/intel/pci-lnl.c                      | 10 +--
 sound/soc/sof/intel/pci-mtl.c                      |  6 +-
 sound/soc/sof/intel/pci-ptl.c                      | 12 ++--
 sound/soc/sof/intel/pci-skl.c                      |  6 +-
 sound/soc/sof/intel/pci-tgl.c                      |  8 +--
 sound/soc/sof/intel/pci-tng.c                      |  8 +--
 sound/soc/sof/intel/skl.c                          |  6 +-
 sound/soc/sof/intel/telemetry.c                    |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c             |  4 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c             |  4 +-
 sound/soc/sof/sof-acpi-dev.c                       |  6 +-
 sound/soc/sof/sof-client-ipc-flood-test.c          |  2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c     |  2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c        |  2 +-
 sound/soc/sof/sof-client-probes.c                  |  2 +-
 sound/soc/sof/sof-client.c                         | 40 ++++++------
 sound/soc/sof/sof-pci-dev.c                        |  8 +--
 sound/soc/sof/xtensa/core.c                        |  2 +-
 tools/testing/cxl/cxl_core_exports.c               |  2 +-
 tools/testing/cxl/test/cxl.c                       |  4 +-
 tools/testing/cxl/test/mem.c                       |  2 +-
 tools/testing/cxl/test/mock.c                      | 28 ++++----
 847 files changed, 2100 insertions(+), 2107 deletions(-)

diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
index 12e4aecdae94..d04639fd8a41 100644
--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -46,7 +46,7 @@ Please note that due to macro expansion that argument needs to be a
 preprocessor symbol. E.g. to export the symbol ``usb_stor_suspend`` into the
 namespace ``USB_STORAGE``, use::
 
-	EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
+	EXPORT_SYMBOL_NS(usb_stor_suspend, "USB_STORAGE");
 
 The corresponding ksymtab entry struct ``kernel_symbol`` will have the member
 ``namespace`` set accordingly. A symbol that is exported without a namespace will
@@ -94,7 +94,7 @@ for the namespaces it uses symbols from. E.g. a module using the
 usb_stor_suspend symbol from above, needs to import the namespace USB_STORAGE
 using a statement like::
 
-	MODULE_IMPORT_NS(USB_STORAGE);
+	MODULE_IMPORT_NS("USB_STORAGE");
 
 This will create a ``modinfo`` tag in the module for each imported namespace.
 This has the side effect, that the imported namespaces of a module can be
@@ -106,7 +106,7 @@ inspected with modinfo::
 	[...]
 
 
-It is advisable to add the MODULE_IMPORT_NS() statement close to other module
+It is advisable to add the MODULE_IMPORT_NS("") statement close to other module
 metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
 5. for a way to create missing import statements automatically.
 
@@ -128,7 +128,7 @@ enable loading regardless, but will emit a warning.
 Missing namespaces imports can easily be detected at build time. In fact,
 modpost will emit a warning if a module uses a symbol from a namespace
 without importing it.
-MODULE_IMPORT_NS() statements will usually be added at a definite location
+MODULE_IMPORT_NS("") statements will usually be added at a definite location
 (along with other module meta data). To make the life of module authors (and
 subsystem maintainers) easier, a script and make target is available to fixup
 missing imports. Fixing missing imports can be done with::
diff --git a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
index 17abc25ee4c1..55a7978c662b 100644
--- a/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/it_IT/core-api/symbol-namespaces.rst
@@ -43,7 +43,7 @@ Tenete presente che per via dell'espansione delle macro questo argomento deve
 essere un simbolo di preprocessore. Per esempio per esportare il
 simbolo ``usb_stor_suspend`` nello spazio dei nomi ``USB_STORAGE`` usate::
 
-	EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
+	EXPORT_SYMBOL_NS(usb_stor_suspend, "USB_STORAGE");
 
 Di conseguenza, nella tabella dei simboli del kernel ci sarà una voce
 rappresentata dalla struttura ``kernel_symbol`` che avrà il campo
@@ -94,7 +94,7 @@ dei nomi che contiene i simboli desiderati. Per esempio un modulo che
 usa il simbolo usb_stor_suspend deve importare lo spazio dei nomi
 USB_STORAGE usando la seguente dichiarazione::
 
-	MODULE_IMPORT_NS(USB_STORAGE);
+	MODULE_IMPORT_NS("USB_STORAGE");
 
 Questo creerà un'etichetta ``modinfo`` per ogni spazio dei nomi
 importato. Un risvolto di questo fatto è che gli spazi dei
@@ -107,7 +107,7 @@ modinfo::
 	[...]
 
 
-Si consiglia di posizionare la dichiarazione MODULE_IMPORT_NS() vicino
+Si consiglia di posizionare la dichiarazione MODULE_IMPORT_NS("") vicino
 ai metadati del modulo come MODULE_AUTHOR() o MODULE_LICENSE(). Fate
 riferimento alla sezione 5. per creare automaticamente le importazioni
 mancanti.
@@ -131,7 +131,7 @@ emetterà un avviso.
 La mancanza di un'importazione può essere individuata facilmente al momento
 della compilazione. Infatti, modpost emetterà un avviso se il modulo usa
 un simbolo da uno spazio dei nomi che non è stato importato.
-La dichiarazione MODULE_IMPORT_NS() viene solitamente aggiunta in un posto
+La dichiarazione MODULE_IMPORT_NS("") viene solitamente aggiunta in un posto
 ben definito (assieme agli altri metadati del modulo). Per facilitare
 la vita di chi scrive moduli (e i manutentori di sottosistemi), esistono uno
 script e un target make per correggere le importazioni mancanti. Questo può
diff --git a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
index bb16f0611046..5e698f58b3fe 100644
--- a/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
+++ b/Documentation/translations/zh_CN/core-api/symbol-namespaces.rst
@@ -48,7 +48,7 @@
 要是一个预处理器符号。例如，要把符号 ``usb_stor_suspend`` 导出到命名空间 ``USB_STORAGE``，
 请使用::
 
-       EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
+       EXPORT_SYMBOL_NS(usb_stor_suspend, "USB_STORAGE");
 
 相应的 ksymtab 条目结构体 ``kernel_symbol`` 将有相应的成员 ``命名空间`` 集。
 导出时未指明命名空间的符号将指向 ``NULL`` 。如果没有定义命名空间，则默认没有。
@@ -88,7 +88,7 @@
 表示它所使用的命名空间的符号。例如，一个使用usb_stor_suspend符号的
 模块，需要使用如下语句导入命名空间USB_STORAGE::
 
-       MODULE_IMPORT_NS(USB_STORAGE);
+       MODULE_IMPORT_NS("USB_STORAGE");
 
 这将在模块中为每个导入的命名空间创建一个 ``modinfo`` 标签。这也顺带
 使得可以用modinfo检查模块已导入的命名空间::
@@ -99,7 +99,7 @@
        [...]
 
 
-建议将 MODULE_IMPORT_NS() 语句添加到靠近其他模块元数据定义的地方，
+建议将 MODULE_IMPORT_NS("") 语句添加到靠近其他模块元数据定义的地方，
 如 MODULE_AUTHOR() 或 MODULE_LICENSE() 。关于自动创建缺失的导入
 语句的方法，请参考第5节。
 
@@ -118,7 +118,7 @@ EINVAL方式失败。要允许加载不满足这个前提条件的模块，可
 
 缺少命名空间的导入可以在构建时很容易被检测到。事实上，如果一个模块
 使用了一个命名空间的符号而没有导入它，modpost会发出警告。
-MODULE_IMPORT_NS()语句通常会被添加到一个明确的位置（和其他模块元
+MODULE_IMPORT_NS("")语句通常会被添加到一个明确的位置（和其他模块元
 数据一起）。为了使模块作者（和子系统维护者）的生活更加轻松，我们提
 供了一个脚本和make目标来修复丢失的导入。修复丢失的导入可以用::
 
diff --git a/arch/arm64/crypto/aes-ce-ccm-glue.c b/arch/arm64/crypto/aes-ce-ccm-glue.c
index a523b519700f..a2b5d6f20f4d 100644
--- a/arch/arm64/crypto/aes-ce-ccm-glue.c
+++ b/arch/arm64/crypto/aes-ce-ccm-glue.c
@@ -18,7 +18,7 @@
 
 #include "aes-ce-setkey.h"
 
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
 
 static int num_rounds(struct crypto_aes_ctx *ctx)
 {
diff --git a/arch/arm64/crypto/aes-glue.c b/arch/arm64/crypto/aes-glue.c
index a147e847a5a1..b0150999743f 100644
--- a/arch/arm64/crypto/aes-glue.c
+++ b/arch/arm64/crypto/aes-glue.c
@@ -1048,7 +1048,7 @@ static int __init aes_init(void)
 
 #ifdef USE_V8_CRYPTO_EXTENSIONS
 module_cpu_feature_match(AES, aes_init);
-EXPORT_SYMBOL_NS(ce_aes_mac_update, CRYPTO_INTERNAL);
+EXPORT_SYMBOL_NS(ce_aes_mac_update, "CRYPTO_INTERNAL");
 #else
 module_init(aes_init);
 EXPORT_SYMBOL(neon_aes_ecb_encrypt);
diff --git a/arch/powerpc/crypto/vmx.c b/arch/powerpc/crypto/vmx.c
index 7eb713cc87c8..0b725e826388 100644
--- a/arch/powerpc/crypto/vmx.c
+++ b/arch/powerpc/crypto/vmx.c
@@ -74,4 +74,4 @@ MODULE_DESCRIPTION("IBM VMX cryptographic acceleration instructions "
 		   "support on Power 8");
 MODULE_LICENSE("GPL");
 MODULE_VERSION("1.0.0");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/arch/s390/crypto/aes_s390.c b/arch/s390/crypto/aes_s390.c
index 8cc02d6e0d0f..9c46b1b630b1 100644
--- a/arch/s390/crypto/aes_s390.c
+++ b/arch/s390/crypto/aes_s390.c
@@ -1168,4 +1168,4 @@ MODULE_ALIAS_CRYPTO("aes-all");
 
 MODULE_DESCRIPTION("Rijndael (AES) Cipher Algorithm");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 44f7b2ea6a07..68781ce473ef 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -354,7 +354,7 @@ bool cpu_cache_has_invalidate_memregion(void)
 {
 	return !cpu_feature_enabled(X86_FEATURE_HYPERVISOR);
 }
-EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, DEVMEM);
+EXPORT_SYMBOL_NS_GPL(cpu_cache_has_invalidate_memregion, "DEVMEM");
 
 int cpu_cache_invalidate_memregion(int res_desc)
 {
@@ -363,7 +363,7 @@ int cpu_cache_invalidate_memregion(int res_desc)
 	wbinvd_on_all_cpus();
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, DEVMEM);
+EXPORT_SYMBOL_NS_GPL(cpu_cache_invalidate_memregion, "DEVMEM");
 #endif
 
 static void __cpa_flush_all(void *arg)
diff --git a/crypto/adiantum.c b/crypto/adiantum.c
index 60f3883b736a..c3ef583598b4 100644
--- a/crypto/adiantum.c
+++ b/crypto/adiantum.c
@@ -646,4 +646,4 @@ MODULE_DESCRIPTION("Adiantum length-preserving encryption mode");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Eric Biggers <ebiggers@google.com>");
 MODULE_ALIAS_CRYPTO("adiantum");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/ansi_cprng.c b/crypto/ansi_cprng.c
index 3f512efaba3a..64f57c4c4b06 100644
--- a/crypto/ansi_cprng.c
+++ b/crypto/ansi_cprng.c
@@ -471,4 +471,4 @@ subsys_initcall(prng_mod_init);
 module_exit(prng_mod_fini);
 MODULE_ALIAS_CRYPTO("stdrng");
 MODULE_ALIAS_CRYPTO("ansi_cprng");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/ccm.c b/crypto/ccm.c
index 36f0acec32e1..06476b53b491 100644
--- a/crypto/ccm.c
+++ b/crypto/ccm.c
@@ -949,4 +949,4 @@ MODULE_ALIAS_CRYPTO("ccm_base");
 MODULE_ALIAS_CRYPTO("rfc4309");
 MODULE_ALIAS_CRYPTO("ccm");
 MODULE_ALIAS_CRYPTO("cbcmac");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/cipher.c b/crypto/cipher.c
index 40cae908788e..1fe62bf79656 100644
--- a/crypto/cipher.c
+++ b/crypto/cipher.c
@@ -53,7 +53,7 @@ int crypto_cipher_setkey(struct crypto_cipher *tfm,
 
 	return cia->cia_setkey(crypto_cipher_tfm(tfm), key, keylen);
 }
-EXPORT_SYMBOL_NS_GPL(crypto_cipher_setkey, CRYPTO_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(crypto_cipher_setkey, "CRYPTO_INTERNAL");
 
 static inline void cipher_crypt_one(struct crypto_cipher *tfm,
 				    u8 *dst, const u8 *src, bool enc)
@@ -81,14 +81,14 @@ void crypto_cipher_encrypt_one(struct crypto_cipher *tfm,
 {
 	cipher_crypt_one(tfm, dst, src, true);
 }
-EXPORT_SYMBOL_NS_GPL(crypto_cipher_encrypt_one, CRYPTO_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(crypto_cipher_encrypt_one, "CRYPTO_INTERNAL");
 
 void crypto_cipher_decrypt_one(struct crypto_cipher *tfm,
 			       u8 *dst, const u8 *src)
 {
 	cipher_crypt_one(tfm, dst, src, false);
 }
-EXPORT_SYMBOL_NS_GPL(crypto_cipher_decrypt_one, CRYPTO_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(crypto_cipher_decrypt_one, "CRYPTO_INTERNAL");
 
 struct crypto_cipher *crypto_clone_cipher(struct crypto_cipher *cipher)
 {
diff --git a/crypto/cmac.c b/crypto/cmac.c
index c7aa3665b076..c66a0f4d8808 100644
--- a/crypto/cmac.c
+++ b/crypto/cmac.c
@@ -313,4 +313,4 @@ module_exit(crypto_cmac_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("CMAC keyed hash algorithm");
 MODULE_ALIAS_CRYPTO("cmac");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/ctr.c b/crypto/ctr.c
index 1420496062d5..73c0d6e53b2f 100644
--- a/crypto/ctr.c
+++ b/crypto/ctr.c
@@ -357,4 +357,4 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("CTR block cipher mode of operation");
 MODULE_ALIAS_CRYPTO("rfc3686");
 MODULE_ALIAS_CRYPTO("ctr");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/drbg.c b/crypto/drbg.c
index 3addce90930c..9f5eae77d2e3 100644
--- a/crypto/drbg.c
+++ b/crypto/drbg.c
@@ -2150,4 +2150,4 @@ MODULE_DESCRIPTION("NIST SP800-90A Deterministic Random Bit Generator (DRBG) "
 		   CRYPTO_DRBG_HMAC_STRING
 		   CRYPTO_DRBG_CTR_STRING);
 MODULE_ALIAS_CRYPTO("stdrng");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/ecb.c b/crypto/ecb.c
index e3a67789050e..95d7e972865a 100644
--- a/crypto/ecb.c
+++ b/crypto/ecb.c
@@ -225,4 +225,4 @@ module_exit(crypto_ecb_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("ECB block cipher mode of operation");
 MODULE_ALIAS_CRYPTO("ecb");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/essiv.c b/crypto/essiv.c
index e63fc6442e32..1c00c3324058 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -649,4 +649,4 @@ module_exit(essiv_module_exit);
 MODULE_DESCRIPTION("ESSIV skcipher/aead wrapper for block encryption");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("essiv");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/hctr2.c b/crypto/hctr2.c
index 87e7547ad186..cbcd673be481 100644
--- a/crypto/hctr2.c
+++ b/crypto/hctr2.c
@@ -576,4 +576,4 @@ module_exit(hctr2_module_exit);
 MODULE_DESCRIPTION("HCTR2 length-preserving encryption mode");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("hctr2");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/keywrap.c b/crypto/keywrap.c
index 054d9a216fc9..385ffdfd5a9b 100644
--- a/crypto/keywrap.c
+++ b/crypto/keywrap.c
@@ -317,4 +317,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Stephan Mueller <smueller@chronox.de>");
 MODULE_DESCRIPTION("Key Wrapping (RFC3394 / NIST SP800-38F)");
 MODULE_ALIAS_CRYPTO("kw");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/pcbc.c b/crypto/pcbc.c
index ab469ba50c13..cbfb3ac14b3a 100644
--- a/crypto/pcbc.c
+++ b/crypto/pcbc.c
@@ -192,4 +192,4 @@ module_exit(crypto_pcbc_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("PCBC block cipher mode of operation");
 MODULE_ALIAS_CRYPTO("pcbc");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/skcipher.c b/crypto/skcipher.c
index ceed7f33a67b..f74e4d0d87a2 100644
--- a/crypto/skcipher.c
+++ b/crypto/skcipher.c
@@ -1085,4 +1085,4 @@ EXPORT_SYMBOL_GPL(skcipher_alloc_instance_simple);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Symmetric key cipher type");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 2f5f6b52b2d4..ee153639ee3f 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -38,7 +38,7 @@
 
 #include "internal.h"
 
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
 
 static bool notests;
 module_param(notests, bool, 0644);
diff --git a/crypto/vmac.c b/crypto/vmac.c
index bd9d70eac22e..2ea384645ecf 100644
--- a/crypto/vmac.c
+++ b/crypto/vmac.c
@@ -693,4 +693,4 @@ module_exit(vmac_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("VMAC hash algorithm");
 MODULE_ALIAS_CRYPTO("vmac64");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/xcbc.c b/crypto/xcbc.c
index a9e8ee9c1949..fc785667b134 100644
--- a/crypto/xcbc.c
+++ b/crypto/xcbc.c
@@ -261,4 +261,4 @@ module_exit(crypto_xcbc_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCBC keyed hash algorithm");
 MODULE_ALIAS_CRYPTO("xcbc");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/xctr.c b/crypto/xctr.c
index 5c00147e8ec4..6ed9c85ededa 100644
--- a/crypto/xctr.c
+++ b/crypto/xctr.c
@@ -188,4 +188,4 @@ module_exit(crypto_xctr_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XCTR block cipher mode of operation");
 MODULE_ALIAS_CRYPTO("xctr");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/crypto/xts.c b/crypto/xts.c
index 672e1a3f0b0c..821060ede2cf 100644
--- a/crypto/xts.c
+++ b/crypto/xts.c
@@ -472,5 +472,5 @@ module_exit(xts_module_exit);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("XTS block cipher mode");
 MODULE_ALIAS_CRYPTO("xts");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
 MODULE_SOFTDEP("pre: ecb");
diff --git a/drivers/accel/habanalabs/common/memory.c b/drivers/accel/habanalabs/common/memory.c
index 3348ad12c237..601fdbe70179 100644
--- a/drivers/accel/habanalabs/common/memory.c
+++ b/drivers/accel/habanalabs/common/memory.c
@@ -14,7 +14,7 @@
 #include <linux/vmalloc.h>
 #include <linux/pci-p2pdma.h>
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 #define HL_MMU_DEBUG	0
 
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index bf10156c334e..16f5b4bbbb34 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -32,7 +32,7 @@
 #include "qaic_timesync.h"
 #include "sahara.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 #define PCI_DEV_AIC100			0xa100
 #define QAIC_NAME			"qaic"
diff --git a/drivers/acpi/apei/einj-cxl.c b/drivers/acpi/apei/einj-cxl.c
index a4e709937236..78da9ae543a2 100644
--- a/drivers/acpi/apei/einj-cxl.c
+++ b/drivers/acpi/apei/einj-cxl.c
@@ -45,7 +45,7 @@ int einj_cxl_available_error_type_show(struct seq_file *m, void *v)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(einj_cxl_available_error_type_show, CXL);
+EXPORT_SYMBOL_NS_GPL(einj_cxl_available_error_type_show, "CXL");
 
 static int cxl_dport_get_sbdf(struct pci_dev *dport_dev, u64 *sbdf)
 {
@@ -83,7 +83,7 @@ int einj_cxl_inject_rch_error(u64 rcrb, u64 type)
 	return einj_cxl_rch_error_inject(type, 0x2, rcrb, GENMASK_ULL(63, 0),
 					 0, 0);
 }
-EXPORT_SYMBOL_NS_GPL(einj_cxl_inject_rch_error, CXL);
+EXPORT_SYMBOL_NS_GPL(einj_cxl_inject_rch_error, "CXL");
 
 int einj_cxl_inject_error(struct pci_dev *dport, u64 type)
 {
@@ -104,10 +104,10 @@ int einj_cxl_inject_error(struct pci_dev *dport, u64 type)
 
 	return einj_error_inject(type, 0x4, 0, 0, 0, param4);
 }
-EXPORT_SYMBOL_NS_GPL(einj_cxl_inject_error, CXL);
+EXPORT_SYMBOL_NS_GPL(einj_cxl_inject_error, "CXL");
 
 bool einj_cxl_is_initialized(void)
 {
 	return einj_initialized;
 }
-EXPORT_SYMBOL_NS_GPL(einj_cxl_is_initialized, CXL);
+EXPORT_SYMBOL_NS_GPL(einj_cxl_is_initialized, "CXL");
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index ada93cfde9ba..f05cb77354b5 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -726,7 +726,7 @@ int cxl_cper_register_work(struct work_struct *work)
 	cxl_cper_work = work;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_cper_register_work, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_cper_register_work, "CXL");
 
 int cxl_cper_unregister_work(struct work_struct *work)
 {
@@ -737,13 +737,13 @@ int cxl_cper_unregister_work(struct work_struct *work)
 	cxl_cper_work = NULL;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_work, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_cper_unregister_work, "CXL");
 
 int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
 {
 	return kfifo_get(&cxl_cper_fifo, wd);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, "CXL");
 
 static bool ghes_do_proc(struct ghes *ghes,
 			 const struct acpi_hest_generic_status *estatus)
diff --git a/drivers/acpi/numa/hmat.c b/drivers/acpi/numa/hmat.c
index 1a902a02390f..80a3481c0470 100644
--- a/drivers/acpi/numa/hmat.c
+++ b/drivers/acpi/numa/hmat.c
@@ -151,7 +151,7 @@ int acpi_get_genport_coordinates(u32 uid,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acpi_get_genport_coordinates, CXL);
+EXPORT_SYMBOL_NS_GPL(acpi_get_genport_coordinates, "CXL");
 
 static __init void alloc_memory_initiator(unsigned int cpu_pxm)
 {
diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 78db38c7076e..559825e59fe8 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -1082,7 +1082,7 @@ static void __exit acpi_thermal_exit(void)
 module_init(acpi_thermal_init);
 module_exit(acpi_thermal_exit);
 
-MODULE_IMPORT_NS(ACPI_THERMAL);
+MODULE_IMPORT_NS("ACPI_THERMAL");
 MODULE_AUTHOR("Paul Diefenbaugh");
 MODULE_DESCRIPTION("ACPI Thermal Zone Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/acpi/thermal_lib.c b/drivers/acpi/thermal_lib.c
index 6214d6ebe1fa..f81591927e86 100644
--- a/drivers/acpi/thermal_lib.c
+++ b/drivers/acpi/thermal_lib.c
@@ -53,25 +53,25 @@ int acpi_active_trip_temp(struct acpi_device *adev, int id, int *ret_temp)
 
 	return acpi_trip_temp(adev, obj_name, ret_temp);
 }
-EXPORT_SYMBOL_NS_GPL(acpi_active_trip_temp, ACPI_THERMAL);
+EXPORT_SYMBOL_NS_GPL(acpi_active_trip_temp, "ACPI_THERMAL");
 
 int acpi_passive_trip_temp(struct acpi_device *adev, int *ret_temp)
 {
 	return acpi_trip_temp(adev, "_PSV", ret_temp);
 }
-EXPORT_SYMBOL_NS_GPL(acpi_passive_trip_temp, ACPI_THERMAL);
+EXPORT_SYMBOL_NS_GPL(acpi_passive_trip_temp, "ACPI_THERMAL");
 
 int acpi_hot_trip_temp(struct acpi_device *adev, int *ret_temp)
 {
 	return acpi_trip_temp(adev, "_HOT", ret_temp);
 }
-EXPORT_SYMBOL_NS_GPL(acpi_hot_trip_temp, ACPI_THERMAL);
+EXPORT_SYMBOL_NS_GPL(acpi_hot_trip_temp, "ACPI_THERMAL");
 
 int acpi_critical_trip_temp(struct acpi_device *adev, int *ret_temp)
 {
 	return acpi_trip_temp(adev, "_CRT", ret_temp);
 }
-EXPORT_SYMBOL_NS_GPL(acpi_critical_trip_temp, ACPI_THERMAL);
+EXPORT_SYMBOL_NS_GPL(acpi_critical_trip_temp, "ACPI_THERMAL");
 
 static int thermal_temp(int error, int temp_decik, int *ret_temp)
 {
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index a816f9e10255..7a5d1f3ad1b6 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -780,5 +780,5 @@ module_i2c_driver(ht16k33_driver);
 
 MODULE_DESCRIPTION("Holtek HT16K33 driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LINEDISP);
+MODULE_IMPORT_NS("LINEDISP");
 MODULE_AUTHOR("Robin van der Gracht <robin@protonic.nl>");
diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index 9ba132dc6143..3cc7af4e09de 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -298,4 +298,4 @@ module_platform_driver(img_ascii_lcd_driver);
 MODULE_DESCRIPTION("Imagination Technologies ASCII LCD Display");
 MODULE_AUTHOR("Paul Burton <paul.burton@mips.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LINEDISP);
+MODULE_IMPORT_NS("LINEDISP");
diff --git a/drivers/auxdisplay/line-display.c b/drivers/auxdisplay/line-display.c
index 731ffdfafc4e..fcec77f100ce 100644
--- a/drivers/auxdisplay/line-display.c
+++ b/drivers/auxdisplay/line-display.c
@@ -381,7 +381,7 @@ int linedisp_register(struct linedisp *linedisp, struct device *parent,
 	put_device(&linedisp->dev);
 	return err;
 }
-EXPORT_SYMBOL_NS_GPL(linedisp_register, LINEDISP);
+EXPORT_SYMBOL_NS_GPL(linedisp_register, "LINEDISP");
 
 /**
  * linedisp_unregister - unregister a character line display
@@ -394,7 +394,7 @@ void linedisp_unregister(struct linedisp *linedisp)
 	del_timer_sync(&linedisp->timer);
 	put_device(&linedisp->dev);
 }
-EXPORT_SYMBOL_NS_GPL(linedisp_unregister, LINEDISP);
+EXPORT_SYMBOL_NS_GPL(linedisp_unregister, "LINEDISP");
 
 MODULE_DESCRIPTION("Character line display core support");
 MODULE_LICENSE("GPL");
diff --git a/drivers/auxdisplay/max6959.c b/drivers/auxdisplay/max6959.c
index 5519c014bd29..962488197b9e 100644
--- a/drivers/auxdisplay/max6959.c
+++ b/drivers/auxdisplay/max6959.c
@@ -191,4 +191,4 @@ module_i2c_driver(max6959_i2c_driver);
 MODULE_DESCRIPTION("MAX6958/6959 7-segment LED controller");
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LINEDISP);
+MODULE_IMPORT_NS("LINEDISP");
diff --git a/drivers/auxdisplay/seg-led-gpio.c b/drivers/auxdisplay/seg-led-gpio.c
index 183ab3011cbb..5cea6ec9d721 100644
--- a/drivers/auxdisplay/seg-led-gpio.c
+++ b/drivers/auxdisplay/seg-led-gpio.c
@@ -108,4 +108,4 @@ module_platform_driver(seg_led_driver);
 MODULE_AUTHOR("Chris Packham <chris.packham@alliedtelesis.co.nz>");
 MODULE_DESCRIPTION("7 segment LED driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LINEDISP);
+MODULE_IMPORT_NS("LINEDISP");
diff --git a/drivers/base/firmware_loader/builtin/main.c b/drivers/base/firmware_loader/builtin/main.c
index a065c3150897..d36befebb1b9 100644
--- a/drivers/base/firmware_loader/builtin/main.c
+++ b/drivers/base/firmware_loader/builtin/main.c
@@ -61,7 +61,7 @@ bool firmware_request_builtin(struct firmware *fw, const char *name)
 
 	return false;
 }
-EXPORT_SYMBOL_NS_GPL(firmware_request_builtin, TEST_FIRMWARE);
+EXPORT_SYMBOL_NS_GPL(firmware_request_builtin, "TEST_FIRMWARE");
 
 /**
  * firmware_request_builtin_buf() - load builtin firmware into optional buffer
diff --git a/drivers/base/firmware_loader/fallback_table.c b/drivers/base/firmware_loader/fallback_table.c
index 8432ab2c3b3c..ddb70e29eb42 100644
--- a/drivers/base/firmware_loader/fallback_table.c
+++ b/drivers/base/firmware_loader/fallback_table.c
@@ -22,7 +22,7 @@ struct firmware_fallback_config fw_fallback_config = {
 	.loading_timeout = 60,
 	.old_timeout = 60,
 };
-EXPORT_SYMBOL_NS_GPL(fw_fallback_config, FIRMWARE_LOADER_PRIVATE);
+EXPORT_SYMBOL_NS_GPL(fw_fallback_config, "FIRMWARE_LOADER_PRIVATE");
 
 #ifdef CONFIG_SYSCTL
 static struct ctl_table firmware_config_table[] = {
@@ -56,13 +56,13 @@ int register_firmware_config_sysctl(void)
 		return -ENOMEM;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(register_firmware_config_sysctl, FIRMWARE_LOADER_PRIVATE);
+EXPORT_SYMBOL_NS_GPL(register_firmware_config_sysctl, "FIRMWARE_LOADER_PRIVATE");
 
 void unregister_firmware_config_sysctl(void)
 {
 	unregister_sysctl_table(firmware_config_sysct_table_header);
 	firmware_config_sysct_table_header = NULL;
 }
-EXPORT_SYMBOL_NS_GPL(unregister_firmware_config_sysctl, FIRMWARE_LOADER_PRIVATE);
+EXPORT_SYMBOL_NS_GPL(unregister_firmware_config_sysctl, "FIRMWARE_LOADER_PRIVATE");
 
 #endif /* CONFIG_SYSCTL */
diff --git a/drivers/base/firmware_loader/sysfs.h b/drivers/base/firmware_loader/sysfs.h
index 2060add8ef81..1cabea544a40 100644
--- a/drivers/base/firmware_loader/sysfs.h
+++ b/drivers/base/firmware_loader/sysfs.h
@@ -6,7 +6,7 @@
 
 #include "firmware.h"
 
-MODULE_IMPORT_NS(FIRMWARE_LOADER_PRIVATE);
+MODULE_IMPORT_NS("FIRMWARE_LOADER_PRIVATE");
 
 extern struct firmware_fallback_config fw_fallback_config;
 extern struct device_attribute dev_attr_loading;
diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
index 07371cb653d3..0c4d1eb8ef11 100644
--- a/drivers/cdx/cdx.c
+++ b/drivers/cdx/cdx.c
@@ -868,7 +868,7 @@ int cdx_device_add(struct cdx_dev_params *dev_params)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cdx_device_add, CDX_BUS_CONTROLLER);
+EXPORT_SYMBOL_NS_GPL(cdx_device_add, "CDX_BUS_CONTROLLER");
 
 struct device *cdx_bus_add(struct cdx_controller *cdx, u8 bus_num)
 {
@@ -915,7 +915,7 @@ struct device *cdx_bus_add(struct cdx_controller *cdx, u8 bus_num)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(cdx_bus_add, CDX_BUS_CONTROLLER);
+EXPORT_SYMBOL_NS_GPL(cdx_bus_add, "CDX_BUS_CONTROLLER");
 
 int cdx_register_controller(struct cdx_controller *cdx)
 {
@@ -940,7 +940,7 @@ int cdx_register_controller(struct cdx_controller *cdx)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cdx_register_controller, CDX_BUS_CONTROLLER);
+EXPORT_SYMBOL_NS_GPL(cdx_register_controller, "CDX_BUS_CONTROLLER");
 
 void cdx_unregister_controller(struct cdx_controller *cdx)
 {
@@ -955,7 +955,7 @@ void cdx_unregister_controller(struct cdx_controller *cdx)
 
 	mutex_unlock(&cdx_controller_lock);
 }
-EXPORT_SYMBOL_NS_GPL(cdx_unregister_controller, CDX_BUS_CONTROLLER);
+EXPORT_SYMBOL_NS_GPL(cdx_unregister_controller, "CDX_BUS_CONTROLLER");
 
 static int __init cdx_bus_init(void)
 {
diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
index e55f1716cfcb..06d723978232 100644
--- a/drivers/cdx/cdx_msi.c
+++ b/drivers/cdx/cdx_msi.c
@@ -189,4 +189,4 @@ struct irq_domain *cdx_msi_domain_init(struct device *dev)
 
 	return cdx_msi_domain;
 }
-EXPORT_SYMBOL_NS_GPL(cdx_msi_domain_init, CDX_BUS_CONTROLLER);
+EXPORT_SYMBOL_NS_GPL(cdx_msi_domain_init, "CDX_BUS_CONTROLLER");
diff --git a/drivers/cdx/controller/cdx_controller.c b/drivers/cdx/controller/cdx_controller.c
index 201f9a6fbde7..e9ca792fed3b 100644
--- a/drivers/cdx/controller/cdx_controller.c
+++ b/drivers/cdx/controller/cdx_controller.c
@@ -275,4 +275,4 @@ module_exit(cdx_controller_exit);
 MODULE_AUTHOR("AMD Inc.");
 MODULE_DESCRIPTION("CDX controller for AMD devices");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CDX_BUS_CONTROLLER);
+MODULE_IMPORT_NS("CDX_BUS_CONTROLLER");
diff --git a/drivers/clk/meson/a1-peripherals.c b/drivers/clk/meson/a1-peripherals.c
index 7aa6abb2eb1f..36489e0f948a 100644
--- a/drivers/clk/meson/a1-peripherals.c
+++ b/drivers/clk/meson/a1-peripherals.c
@@ -2246,4 +2246,4 @@ MODULE_DESCRIPTION("Amlogic A1 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
index 8e5a42d1afbb..8d7c7b4493c4 100644
--- a/drivers/clk/meson/a1-pll.c
+++ b/drivers/clk/meson/a1-pll.c
@@ -360,4 +360,4 @@ MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Jian Hu <jian.hu@amlogic.com>");
 MODULE_AUTHOR("Dmitry Rokosov <ddrokosov@sberdevices.ru>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index 1dabc81535a6..f44091ffb57d 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -342,4 +342,4 @@ module_platform_driver(axg_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index beda86349389..9df627b142f8 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -1912,4 +1912,4 @@ module_platform_driver(axg_audio_driver);
 MODULE_DESCRIPTION("Amlogic AXG/G12A/SM1 Audio Clock driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 757c7a28c53d..eaf75efd28d5 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -2187,4 +2187,4 @@ module_platform_driver(axg_driver);
 
 MODULE_DESCRIPTION("Amlogic AXG Main Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
index 7dcbf4ebee07..2075668ed306 100644
--- a/drivers/clk/meson/c3-peripherals.c
+++ b/drivers/clk/meson/c3-peripherals.c
@@ -2364,4 +2364,4 @@ module_platform_driver(c3_peripherals_driver);
 MODULE_DESCRIPTION("Amlogic C3 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/c3-pll.c b/drivers/clk/meson/c3-pll.c
index 32bd2ed9d304..e6fbe23128c9 100644
--- a/drivers/clk/meson/c3-pll.c
+++ b/drivers/clk/meson/c3-pll.c
@@ -745,4 +745,4 @@ module_platform_driver(c3_pll_driver);
 MODULE_DESCRIPTION("Amlogic C3 PLL Clock Controller driver");
 MODULE_AUTHOR("Chuan Liu <chuan.liu@amlogic.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
index 6c1f58826e24..cb043b52b65d 100644
--- a/drivers/clk/meson/clk-cpu-dyndiv.c
+++ b/drivers/clk/meson/clk-cpu-dyndiv.c
@@ -65,9 +65,9 @@ const struct clk_ops meson_clk_cpu_dyndiv_ops = {
 	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
 	.set_rate = meson_clk_cpu_dyndiv_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_cpu_dyndiv_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_cpu_dyndiv_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic CPU Dynamic Clock divider");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
index 913bf25d3771..c896cf29b318 100644
--- a/drivers/clk/meson/clk-dualdiv.c
+++ b/drivers/clk/meson/clk-dualdiv.c
@@ -130,15 +130,15 @@ const struct clk_ops meson_clk_dualdiv_ops = {
 	.determine_rate	= meson_clk_dualdiv_determine_rate,
 	.set_rate	= meson_clk_dualdiv_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_dualdiv_ro_ops = {
 	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic dual divider driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index f639d56f0fd3..38bb1c28db06 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -165,7 +165,7 @@ const struct clk_ops meson_clk_mpll_ro_ops = {
 	.recalc_rate	= mpll_recalc_rate,
 	.determine_rate	= mpll_determine_rate,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ro_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_mpll_ops = {
 	.recalc_rate	= mpll_recalc_rate,
@@ -173,9 +173,9 @@ const struct clk_ops meson_clk_mpll_ops = {
 	.set_rate	= mpll_set_rate,
 	.init		= mpll_init,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_mpll_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic MPLL driver");
 MODULE_AUTHOR("Michael Turquette <mturquette@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
index c1526fbfb6c4..701211120610 100644
--- a/drivers/clk/meson/clk-phase.c
+++ b/drivers/clk/meson/clk-phase.c
@@ -61,7 +61,7 @@ const struct clk_ops meson_clk_phase_ops = {
 	.get_phase	= meson_clk_phase_get_phase,
 	.set_phase	= meson_clk_phase_set_phase,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_phase_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_phase_ops, "CLK_MESON");
 
 /*
  * This is a special clock for the audio controller.
@@ -123,7 +123,7 @@ const struct clk_ops meson_clk_triphase_ops = {
 	.get_phase	= meson_clk_triphase_get_phase,
 	.set_phase	= meson_clk_triphase_set_phase,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_triphase_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_triphase_ops, "CLK_MESON");
 
 /*
  * This is a special clock for the audio controller.
@@ -178,9 +178,9 @@ const struct clk_ops meson_sclk_ws_inv_ops = {
 	.get_phase	= meson_sclk_ws_inv_get_phase,
 	.set_phase	= meson_sclk_ws_inv_set_phase,
 };
-EXPORT_SYMBOL_NS_GPL(meson_sclk_ws_inv_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_sclk_ws_inv_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic phase driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index bc570a2ff3a3..2af89c41e573 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -472,7 +472,7 @@ const struct clk_ops meson_clk_pcie_pll_ops = {
 	.enable		= meson_clk_pcie_pll_enable,
 	.disable	= meson_clk_pll_disable
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_pcie_pll_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pcie_pll_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_pll_ops = {
 	.init		= meson_clk_pll_init,
@@ -483,16 +483,16 @@ const struct clk_ops meson_clk_pll_ops = {
 	.enable		= meson_clk_pll_enable,
 	.disable	= meson_clk_pll_disable
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, "CLK_MESON");
 
 const struct clk_ops meson_clk_pll_ro_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.is_enabled	= meson_clk_pll_is_enabled,
 };
-EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ro_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic PLL driver");
 MODULE_AUTHOR("Carlo Caione <carlo@endlessm.com>");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 07f7e441b916..f3e504f67571 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -49,12 +49,12 @@ const struct clk_ops clk_regmap_gate_ops = {
 	.disable = clk_regmap_gate_disable,
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_gate_ro_ops = {
 	.is_enabled = clk_regmap_gate_is_enabled,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, "CLK_MESON");
 
 static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 						unsigned long prate)
@@ -125,13 +125,13 @@ const struct clk_ops clk_regmap_divider_ops = {
 	.determine_rate = clk_regmap_div_determine_rate,
 	.set_rate = clk_regmap_div_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.recalc_rate = clk_regmap_div_recalc_rate,
 	.determine_rate = clk_regmap_div_determine_rate,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, "CLK_MESON");
 
 static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
 {
@@ -174,14 +174,14 @@ const struct clk_ops clk_regmap_mux_ops = {
 	.set_parent = clk_regmap_mux_set_parent,
 	.determine_rate = clk_regmap_mux_determine_rate,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, "CLK_MESON");
 
 const struct clk_ops clk_regmap_mux_ro_ops = {
 	.get_parent = clk_regmap_mux_get_parent,
 };
-EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic regmap backed clock driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index f0a18d8c9fc2..71c758ffa493 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -477,4 +477,4 @@ module_platform_driver(g12a_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic G12A Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 02dda57105b1..6623141ac9b0 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5616,4 +5616,4 @@ module_platform_driver(g12a_driver);
 
 MODULE_DESCRIPTION("Amlogic G12/SM1 Main Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 83b034157b35..43940232f718 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -303,4 +303,4 @@ module_platform_driver(gxbb_aoclkc_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Always-ON Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index f071faad1ebb..45b9d5a29f72 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -3571,4 +3571,4 @@ module_platform_driver(gxbb_driver);
 
 MODULE_DESCRIPTION("Amlogic GXBB Main Clock Controller driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 053940ee8940..995be51987f4 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -88,8 +88,8 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
-EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic Always-ON Clock Controller helpers");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-clkc-utils.c b/drivers/clk/meson/meson-clkc-utils.c
index a8cd2c21fab7..6937d1482719 100644
--- a/drivers/clk/meson/meson-clkc-utils.c
+++ b/drivers/clk/meson/meson-clkc-utils.c
@@ -20,8 +20,8 @@ struct clk_hw *meson_clk_hw_get(struct of_phandle_args *clkspec, void *clk_hw_da
 
 	return data->hws[idx];
 }
-EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_clk_hw_get, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic Clock Controller Utilities");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
index 66f79e384fe5..3053ee7425eb 100644
--- a/drivers/clk/meson/meson-eeclk.c
+++ b/drivers/clk/meson/meson-eeclk.c
@@ -57,8 +57,8 @@ int meson_eeclkc_probe(struct platform_device *pdev)
 
 	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
 }
-EXPORT_SYMBOL_NS_GPL(meson_eeclkc_probe, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_eeclkc_probe, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic Main Clock Controller Helpers");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index c930cf0614a0..8a4037377787 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -3814,4 +3814,4 @@ module_platform_driver(s4_driver);
 MODULE_DESCRIPTION("Amlogic S4 Peripherals Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/s4-pll.c b/drivers/clk/meson/s4-pll.c
index b0258933fb9d..877cc38638f4 100644
--- a/drivers/clk/meson/s4-pll.c
+++ b/drivers/clk/meson/s4-pll.c
@@ -873,4 +873,4 @@ module_platform_driver(s4_driver);
 MODULE_DESCRIPTION("Amlogic S4 PLL Clock Controller driver");
 MODULE_AUTHOR("Yu Tu <yu.tu@amlogic.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
index ae03b048182f..9c4945234f26 100644
--- a/drivers/clk/meson/sclk-div.c
+++ b/drivers/clk/meson/sclk-div.c
@@ -247,9 +247,9 @@ const struct clk_ops meson_sclk_div_ops = {
 	.set_duty_cycle = sclk_div_set_duty_cycle,
 	.init		= sclk_div_init,
 };
-EXPORT_SYMBOL_NS_GPL(meson_sclk_div_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_sclk_div_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic Sample divider driver");
 MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
index 36f637d2d01b..6a167ebdc8d7 100644
--- a/drivers/clk/meson/vclk.c
+++ b/drivers/clk/meson/vclk.c
@@ -49,7 +49,7 @@ const struct clk_ops meson_vclk_gate_ops = {
 	.disable = meson_vclk_gate_disable,
 	.is_enabled = meson_vclk_gate_is_enabled,
 };
-EXPORT_SYMBOL_NS_GPL(meson_vclk_gate_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_vclk_gate_ops, "CLK_MESON");
 
 /* The VCLK Divider has supplementary reset & enable bits */
 
@@ -134,9 +134,9 @@ const struct clk_ops meson_vclk_div_ops = {
 	.disable = meson_vclk_div_disable,
 	.is_enabled = meson_vclk_div_is_enabled,
 };
-EXPORT_SYMBOL_NS_GPL(meson_vclk_div_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_vclk_div_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic vclk clock driver");
 MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index 486cf68fc97a..965ed7281f57 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -92,9 +92,9 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
 const struct clk_ops meson_vid_pll_div_ro_ops = {
 	.recalc_rate	= meson_vid_pll_div_recalc_rate,
 };
-EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, CLK_MESON);
+EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, "CLK_MESON");
 
 MODULE_DESCRIPTION("Amlogic video pll divider driver");
 MODULE_AUTHOR("Neil Armstrong <narmstrong@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CLK_MESON);
+MODULE_IMPORT_NS("CLK_MESON");
diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 28ec0da88cb3..c22632a7439c 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -443,4 +443,4 @@ MODULE_DESCRIPTION("Microchip PolarFire SoC Clock Driver");
 MODULE_AUTHOR("Padmarao Begari <padmarao.begari@microchip.com>");
 MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
 MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
-MODULE_IMPORT_NS(MCHP_CLK_MPFS);
+MODULE_IMPORT_NS("MCHP_CLK_MPFS");
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
index de36e21d3eaf..b65b204edb35 100644
--- a/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1-r.c
@@ -137,6 +137,6 @@ static struct platform_driver sun20i_d1_r_ccu_driver = {
 };
 module_platform_driver(sun20i_d1_r_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner D1/R528/T113 PRCM CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
index 9b5cfac2ee70..5bd5f5ae5929 100644
--- a/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
+++ b/drivers/clk/sunxi-ng/ccu-sun20i-d1.c
@@ -1406,6 +1406,6 @@ static struct platform_driver sun20i_d1_ccu_driver = {
 };
 module_platform_driver(sun20i_d1_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner D1/R528/T113 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
index d1a1683baff4..4f2926d7e272 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
@@ -1493,6 +1493,6 @@ static struct platform_driver sun4i_a10_ccu_driver = {
 };
 module_platform_driver(sun4i_a10_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A10/A20 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
index 2c791761a646..91d3fb41c474 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100-r.c
@@ -214,6 +214,6 @@ static struct platform_driver sun50i_a100_r_ccu_driver = {
 };
 module_platform_driver(sun50i_a100_r_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A100 PRCM CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
index bbaa82978716..6aaa66b7fe15 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a100.c
@@ -1276,6 +1276,6 @@ static struct platform_driver sun50i_a100_ccu_driver = {
 };
 module_platform_driver(sun50i_a100_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A100 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
index c255dba2c96d..ab60da60c20e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
@@ -994,6 +994,6 @@ static struct platform_driver sun50i_a64_ccu_driver = {
 };
 module_platform_driver(sun50i_a64_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A64 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
index c72815841111..e965c4ca6318 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
@@ -256,6 +256,6 @@ static struct platform_driver sun50i_h6_r_ccu_driver = {
 };
 module_platform_driver(sun50i_h6_r_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H6 and H616 PRCM CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
index a20b621ad8f1..d40e446d78a6 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h6.c
@@ -1286,6 +1286,6 @@ static struct platform_driver sun50i_h6_ccu_driver = {
 };
 module_platform_driver(sun50i_h6_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H6 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 84e406ddf9d1..dff5e6d14791 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1171,6 +1171,6 @@ static struct platform_driver sun50i_h616_ccu_driver = {
 };
 module_platform_driver(sun50i_h616_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H616 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
index e8b8d2dd7f2c..8da1788b065e 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-a31.c
@@ -1283,6 +1283,6 @@ static struct platform_driver sun6i_a31_ccu_driver = {
 };
 module_platform_driver(sun6i_a31_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A31/A31s CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 87e23d16ed0f..73eec08705b7 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -381,6 +381,6 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	return devm_sunxi_ccu_probe(dev, reg, &sun6i_rtc_ccu_desc);
 }
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H616/R329 RTC CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
index 6c2a08f722a8..7e2a73ec2147 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a23.c
@@ -763,6 +763,6 @@ static struct platform_driver sun8i_a23_ccu_driver = {
 };
 module_platform_driver(sun8i_a23_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A23 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
index 5e0bc08a9ce3..54b543e3212b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a33.c
@@ -835,6 +835,6 @@ static struct platform_driver sun8i_a33_ccu_driver = {
 };
 module_platform_driver(sun8i_a33_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A33 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
index cb4c6b16c467..7517f0822d71 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
@@ -923,6 +923,6 @@ static struct platform_driver sun8i_a83t_ccu_driver = {
 };
 module_platform_driver(sun8i_a83t_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A83T CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 7683ea08d8e3..f7beb3dec98f 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -348,6 +348,6 @@ static struct platform_driver sunxi_de2_clk_driver = {
 };
 module_platform_driver(sunxi_de2_clk_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner SoCs DE2 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 13e57db2f8d5..d2705653b42c 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -1094,6 +1094,6 @@ static struct platform_driver sun8i_h3_ccu_driver = {
 };
 module_platform_driver(sun8i_h3_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner H3 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
index da6569334d68..5a8ee2b0ee44 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r.c
@@ -274,6 +274,6 @@ static struct platform_driver sun8i_r_ccu_driver = {
 };
 module_platform_driver(sun8i_r_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for Allwinner SoCs' PRCM CCUs");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index 2f51ceab8016..a2e0a5eae511 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -1375,6 +1375,6 @@ static struct platform_driver sun8i_r40_ccu_driver = {
 };
 module_platform_driver(sun8i_r40_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner R40 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
index d24c0d8dfee4..2a15abcc90d8 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
@@ -780,6 +780,6 @@ static struct platform_driver sun8i_v3s_ccu_driver = {
 };
 module_platform_driver(sun8i_v3s_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner V3s CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
index 0975ac58949f..01d8f8df8eac 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
@@ -266,6 +266,6 @@ static struct platform_driver sun9i_a80_de_clk_driver = {
 };
 module_platform_driver(sun9i_a80_de_clk_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A80 Display Engine CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
index e5527c8cc64f..8d71f4615d5b 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
@@ -138,6 +138,6 @@ static struct platform_driver sun9i_a80_usb_clk_driver = {
 };
 module_platform_driver(sun9i_a80_usb_clk_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A80 USB CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
index 756dd8fca6b0..b51baec04508 100644
--- a/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
+++ b/drivers/clk/sunxi-ng/ccu-sun9i-a80.c
@@ -1248,6 +1248,6 @@ static struct platform_driver sun9i_a80_ccu_driver = {
 };
 module_platform_driver(sun9i_a80_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner A80 CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
index 52f1a04269f8..eb9654d8a953 100644
--- a/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
+++ b/drivers/clk/sunxi-ng/ccu-suniv-f1c100s.c
@@ -577,6 +577,6 @@ static struct platform_driver suniv_f1c100s_ccu_driver = {
 };
 module_platform_driver(suniv_f1c100s_ccu_driver);
 
-MODULE_IMPORT_NS(SUNXI_CCU);
+MODULE_IMPORT_NS("SUNXI_CCU");
 MODULE_DESCRIPTION("Support for the Allwinner newer F1C100s CCU");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/sunxi-ng/ccu_common.c b/drivers/clk/sunxi-ng/ccu_common.c
index 4117b0bea267..88ed89658d45 100644
--- a/drivers/clk/sunxi-ng/ccu_common.c
+++ b/drivers/clk/sunxi-ng/ccu_common.c
@@ -37,7 +37,7 @@ void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
 
 	WARN_ON(readl_relaxed_poll_timeout(addr, reg, reg & lock, 100, 70000));
 }
-EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_helper_wait_for_lock, "SUNXI_CCU");
 
 bool ccu_is_better_rate(struct ccu_common *common,
 			unsigned long target_rate,
@@ -59,7 +59,7 @@ bool ccu_is_better_rate(struct ccu_common *common,
 
 	return current_rate <= target_rate && current_rate > best_rate;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_is_better_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_is_better_rate, "SUNXI_CCU");
 
 /*
  * This clock notifier is called when the frequency of a PLL clock is
@@ -107,7 +107,7 @@ int ccu_pll_notifier_register(struct ccu_pll_nb *pll_nb)
 	return clk_notifier_register(pll_nb->common->hw.clk,
 				     &pll_nb->clk_nb);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_pll_notifier_register, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_pll_notifier_register, "SUNXI_CCU");
 
 static int sunxi_ccu_probe(struct sunxi_ccu *ccu, struct device *dev,
 			   struct device_node *node, void __iomem *reg,
@@ -234,7 +234,7 @@ int devm_sunxi_ccu_probe(struct device *dev, void __iomem *reg,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(devm_sunxi_ccu_probe, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(devm_sunxi_ccu_probe, "SUNXI_CCU");
 
 void of_sunxi_ccu_probe(struct device_node *node, void __iomem *reg,
 			const struct sunxi_ccu_desc *desc)
diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index cb10a3ea23f9..7f4691f09e01 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -141,4 +141,4 @@ const struct clk_ops ccu_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_div_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_div_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_div_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_frac.c b/drivers/clk/sunxi-ng/ccu_frac.c
index b31f3ad946d6..75323912608a 100644
--- a/drivers/clk/sunxi-ng/ccu_frac.c
+++ b/drivers/clk/sunxi-ng/ccu_frac.c
@@ -18,7 +18,7 @@ bool ccu_frac_helper_is_enabled(struct ccu_common *common,
 
 	return !(readl(common->base + common->reg) & cf->enable);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_is_enabled, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_is_enabled, "SUNXI_CCU");
 
 void ccu_frac_helper_enable(struct ccu_common *common,
 			    struct ccu_frac_internal *cf)
@@ -34,7 +34,7 @@ void ccu_frac_helper_enable(struct ccu_common *common,
 	writel(reg & ~cf->enable, common->base + common->reg);
 	spin_unlock_irqrestore(common->lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_enable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_enable, "SUNXI_CCU");
 
 void ccu_frac_helper_disable(struct ccu_common *common,
 			     struct ccu_frac_internal *cf)
@@ -50,7 +50,7 @@ void ccu_frac_helper_disable(struct ccu_common *common,
 	writel(reg | cf->enable, common->base + common->reg);
 	spin_unlock_irqrestore(common->lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_disable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_disable, "SUNXI_CCU");
 
 bool ccu_frac_helper_has_rate(struct ccu_common *common,
 			      struct ccu_frac_internal *cf,
@@ -61,7 +61,7 @@ bool ccu_frac_helper_has_rate(struct ccu_common *common,
 
 	return (cf->rates[0] == rate) || (cf->rates[1] == rate);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_has_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_has_rate, "SUNXI_CCU");
 
 unsigned long ccu_frac_helper_read_rate(struct ccu_common *common,
 					struct ccu_frac_internal *cf)
@@ -83,7 +83,7 @@ unsigned long ccu_frac_helper_read_rate(struct ccu_common *common,
 
 	return (reg & cf->select) ? cf->rates[1] : cf->rates[0];
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_read_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_read_rate, "SUNXI_CCU");
 
 int ccu_frac_helper_set_rate(struct ccu_common *common,
 			     struct ccu_frac_internal *cf,
@@ -112,4 +112,4 @@ int ccu_frac_helper_set_rate(struct ccu_common *common,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_set_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_frac_helper_set_rate, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index a2115a21807d..ac52fd6bff67 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -24,7 +24,7 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 
 	spin_unlock_irqrestore(common->lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_disable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_disable, "SUNXI_CCU");
 
 static void ccu_gate_disable(struct clk_hw *hw)
 {
@@ -50,7 +50,7 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_enable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_enable, "SUNXI_CCU");
 
 static int ccu_gate_enable(struct clk_hw *hw)
 {
@@ -66,7 +66,7 @@ int ccu_gate_helper_is_enabled(struct ccu_common *common, u32 gate)
 
 	return readl(common->base + common->reg) & gate;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_is_enabled, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_gate_helper_is_enabled, "SUNXI_CCU");
 
 static int ccu_gate_is_enabled(struct clk_hw *hw)
 {
@@ -127,4 +127,4 @@ const struct clk_ops ccu_gate_ops = {
 	.set_rate	= ccu_gate_set_rate,
 	.recalc_rate	= ccu_gate_recalc_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_gate_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_gate_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu_mp.c
index cc94a694cb67..2bb8987ddcc2 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.c
+++ b/drivers/clk/sunxi-ng/ccu_mp.c
@@ -246,7 +246,7 @@ const struct clk_ops ccu_mp_ops = {
 	.recalc_rate	= ccu_mp_recalc_rate,
 	.set_rate	= ccu_mp_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_mp_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mp_ops, "SUNXI_CCU");
 
 /*
  * Support for MMC timing mode switching
@@ -327,4 +327,4 @@ const struct clk_ops ccu_mp_mmc_ops = {
 	.recalc_rate	= ccu_mp_mmc_recalc_rate,
 	.set_rate	= ccu_mp_mmc_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_mp_mmc_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mp_mmc_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_mult.c b/drivers/clk/sunxi-ng/ccu_mult.c
index 7bee217ef111..8d5720f3dec1 100644
--- a/drivers/clk/sunxi-ng/ccu_mult.c
+++ b/drivers/clk/sunxi-ng/ccu_mult.c
@@ -170,4 +170,4 @@ const struct clk_ops ccu_mult_ops = {
 	.recalc_rate	= ccu_mult_recalc_rate,
 	.set_rate	= ccu_mult_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_mult_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mult_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 5edc63b46651..d7ffbdeee9e0 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -66,7 +66,7 @@ unsigned long ccu_mux_helper_apply_prediv(struct ccu_common *common,
 {
 	return parent_rate / ccu_mux_get_prediv(common, cm, parent_index);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_apply_prediv, "SUNXI_CCU");
 
 static unsigned long ccu_mux_helper_unapply_prediv(struct ccu_common *common,
 					    struct ccu_mux_internal *cm,
@@ -155,7 +155,7 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 	req->rate = best_rate;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_determine_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_determine_rate, "SUNXI_CCU");
 
 u8 ccu_mux_helper_get_parent(struct ccu_common *common,
 			     struct ccu_mux_internal *cm)
@@ -178,7 +178,7 @@ u8 ccu_mux_helper_get_parent(struct ccu_common *common,
 
 	return parent;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_get_parent, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_get_parent, "SUNXI_CCU");
 
 int ccu_mux_helper_set_parent(struct ccu_common *common,
 			      struct ccu_mux_internal *cm,
@@ -205,7 +205,7 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_set_parent, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_helper_set_parent, "SUNXI_CCU");
 
 static void ccu_mux_disable(struct clk_hw *hw)
 {
@@ -273,7 +273,7 @@ const struct clk_ops ccu_mux_ops = {
 	.determine_rate	= ccu_mux_determine_rate,
 	.recalc_rate	= ccu_mux_recalc_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_mux_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_ops, "SUNXI_CCU");
 
 /*
  * This clock notifier is called when the frequency of the of the parent
@@ -308,4 +308,4 @@ int ccu_mux_notifier_register(struct clk *clk, struct ccu_mux_nb *mux_nb)
 
 	return clk_notifier_register(clk, &mux_nb->clk_nb);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_mux_notifier_register, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_mux_notifier_register, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index 8aa35d5804f3..555e99de2cc6 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -158,4 +158,4 @@ const struct clk_ops ccu_nk_ops = {
 	.round_rate	= ccu_nk_round_rate,
 	.set_rate	= ccu_nk_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_nk_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 1168d894d636..784eec9ac997 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -267,4 +267,4 @@ const struct clk_ops ccu_nkm_ops = {
 	.recalc_rate	= ccu_nkm_recalc_rate,
 	.set_rate	= ccu_nkm_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_nkm_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_nkm_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 99359a06892d..6e03b69d4028 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -230,4 +230,4 @@ const struct clk_ops ccu_nkmp_ops = {
 	.round_rate	= ccu_nkmp_round_rate,
 	.set_rate	= ccu_nkmp_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_nkmp_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_nkmp_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index ffac3deb89d6..a4e2243b8d6b 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -236,4 +236,4 @@ const struct clk_ops ccu_nm_ops = {
 	.round_rate	= ccu_nm_round_rate,
 	.set_rate	= ccu_nm_set_rate,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_nm_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_nm_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_phase.c b/drivers/clk/sunxi-ng/ccu_phase.c
index e4cae2afe9db..ca43cf448666 100644
--- a/drivers/clk/sunxi-ng/ccu_phase.c
+++ b/drivers/clk/sunxi-ng/ccu_phase.c
@@ -121,4 +121,4 @@ const struct clk_ops ccu_phase_ops = {
 	.get_phase	= ccu_phase_get_phase,
 	.set_phase	= ccu_phase_set_phase,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_phase_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_phase_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_reset.c b/drivers/clk/sunxi-ng/ccu_reset.c
index 6577aa18cb01..55bc7c7cda0f 100644
--- a/drivers/clk/sunxi-ng/ccu_reset.c
+++ b/drivers/clk/sunxi-ng/ccu_reset.c
@@ -75,4 +75,4 @@ const struct reset_control_ops ccu_reset_ops = {
 	.reset		= ccu_reset_reset,
 	.status		= ccu_reset_status,
 };
-EXPORT_SYMBOL_NS_GPL(ccu_reset_ops, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_reset_ops, "SUNXI_CCU");
diff --git a/drivers/clk/sunxi-ng/ccu_sdm.c b/drivers/clk/sunxi-ng/ccu_sdm.c
index 41937ed0766d..c564e5f9e610 100644
--- a/drivers/clk/sunxi-ng/ccu_sdm.c
+++ b/drivers/clk/sunxi-ng/ccu_sdm.c
@@ -20,7 +20,7 @@ bool ccu_sdm_helper_is_enabled(struct ccu_common *common,
 
 	return !!(readl(common->base + sdm->tuning_reg) & sdm->tuning_enable);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_is_enabled, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_is_enabled, "SUNXI_CCU");
 
 void ccu_sdm_helper_enable(struct ccu_common *common,
 			   struct ccu_sdm_internal *sdm,
@@ -50,7 +50,7 @@ void ccu_sdm_helper_enable(struct ccu_common *common,
 	writel(reg | sdm->enable, common->base + common->reg);
 	spin_unlock_irqrestore(common->lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_enable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_enable, "SUNXI_CCU");
 
 void ccu_sdm_helper_disable(struct ccu_common *common,
 			    struct ccu_sdm_internal *sdm)
@@ -71,7 +71,7 @@ void ccu_sdm_helper_disable(struct ccu_common *common,
 	writel(reg & ~sdm->tuning_enable, common->base + sdm->tuning_reg);
 	spin_unlock_irqrestore(common->lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_disable, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_disable, "SUNXI_CCU");
 
 /*
  * Sigma delta modulation provides a way to do fractional-N frequency
@@ -105,7 +105,7 @@ bool ccu_sdm_helper_has_rate(struct ccu_common *common,
 
 	return false;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_has_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_has_rate, "SUNXI_CCU");
 
 unsigned long ccu_sdm_helper_read_rate(struct ccu_common *common,
 				       struct ccu_sdm_internal *sdm,
@@ -136,7 +136,7 @@ unsigned long ccu_sdm_helper_read_rate(struct ccu_common *common,
 	/* We can't calculate the effective clock rate, so just fail. */
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_read_rate, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_read_rate, "SUNXI_CCU");
 
 int ccu_sdm_helper_get_factors(struct ccu_common *common,
 			       struct ccu_sdm_internal *sdm,
@@ -158,4 +158,4 @@ int ccu_sdm_helper_get_factors(struct ccu_common *common,
 	/* nothing found */
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_get_factors, SUNXI_CCU);
+EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_get_factors, "SUNXI_CCU");
diff --git a/drivers/counter/104-quad-8.c b/drivers/counter/104-quad-8.c
index 4a6868b8f58b..ce81fc4e1ae7 100644
--- a/drivers/counter/104-quad-8.c
+++ b/drivers/counter/104-quad-8.c
@@ -1360,4 +1360,4 @@ module_isa_driver_with_irq(quad8_driver, num_quad8, num_irq);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES 104-QUAD-8 driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/counter-chrdev.c b/drivers/counter/counter-chrdev.c
index 3ee75e1a78cd..23fdf0caf712 100644
--- a/drivers/counter/counter-chrdev.c
+++ b/drivers/counter/counter-chrdev.c
@@ -672,4 +672,4 @@ void counter_push_event(struct counter_device *const counter, const u8 event,
 	if (copied)
 		wake_up_poll(&counter->events_wait, EPOLLIN);
 }
-EXPORT_SYMBOL_NS_GPL(counter_push_event, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_push_event, "COUNTER");
diff --git a/drivers/counter/counter-core.c b/drivers/counter/counter-core.c
index 893b4f0726d2..50bd30ba3d03 100644
--- a/drivers/counter/counter-core.c
+++ b/drivers/counter/counter-core.c
@@ -74,7 +74,7 @@ void *counter_priv(const struct counter_device *const counter)
 
 	return &ch->privdata;
 }
-EXPORT_SYMBOL_NS_GPL(counter_priv, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_priv, "COUNTER");
 
 /**
  * counter_alloc - allocate a counter_device
@@ -134,13 +134,13 @@ struct counter_device *counter_alloc(size_t sizeof_priv)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(counter_alloc, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_alloc, "COUNTER");
 
 void counter_put(struct counter_device *counter)
 {
 	put_device(&counter->dev);
 }
-EXPORT_SYMBOL_NS_GPL(counter_put, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_put, "COUNTER");
 
 /**
  * counter_add - complete registration of a counter
@@ -167,7 +167,7 @@ int counter_add(struct counter_device *counter)
 	/* implies device_add(dev) */
 	return cdev_device_add(&counter->chrdev, dev);
 }
-EXPORT_SYMBOL_NS_GPL(counter_add, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_add, "COUNTER");
 
 /**
  * counter_unregister - unregister Counter from the system
@@ -189,7 +189,7 @@ void counter_unregister(struct counter_device *const counter)
 
 	mutex_unlock(&counter->ops_exist_lock);
 }
-EXPORT_SYMBOL_NS_GPL(counter_unregister, COUNTER);
+EXPORT_SYMBOL_NS_GPL(counter_unregister, "COUNTER");
 
 static void devm_counter_release(void *counter)
 {
@@ -224,7 +224,7 @@ struct counter_device *devm_counter_alloc(struct device *dev, size_t sizeof_priv
 
 	return counter;
 }
-EXPORT_SYMBOL_NS_GPL(devm_counter_alloc, COUNTER);
+EXPORT_SYMBOL_NS_GPL(devm_counter_alloc, "COUNTER");
 
 /**
  * devm_counter_add - complete registration of a counter
@@ -245,7 +245,7 @@ int devm_counter_add(struct device *dev,
 
 	return devm_add_action_or_reset(dev, devm_counter_release, counter);
 }
-EXPORT_SYMBOL_NS_GPL(devm_counter_add, COUNTER);
+EXPORT_SYMBOL_NS_GPL(devm_counter_add, "COUNTER");
 
 #define COUNTER_DEV_MAX 256
 
diff --git a/drivers/counter/ftm-quaddec.c b/drivers/counter/ftm-quaddec.c
index 200876f3ec04..a99f3d3c3151 100644
--- a/drivers/counter/ftm-quaddec.c
+++ b/drivers/counter/ftm-quaddec.c
@@ -326,4 +326,4 @@ MODULE_DESCRIPTION("Flex Timer Module Quadrature decoder");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Kjeld Flarup <kfa@deif.com>");
 MODULE_AUTHOR("Patrick Havelange <patrick.havelange@essensium.com>");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/i8254.c b/drivers/counter/i8254.c
index 6d74e8ef92f0..95ad928725ec 100644
--- a/drivers/counter/i8254.c
+++ b/drivers/counter/i8254.c
@@ -439,9 +439,9 @@ int devm_i8254_regmap_register(struct device *const dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(devm_i8254_regmap_register, I8254);
+EXPORT_SYMBOL_NS_GPL(devm_i8254_regmap_register, "I8254");
 
 MODULE_AUTHOR("William Breathitt Gray");
 MODULE_DESCRIPTION("Intel 8254 Programmable Interval Timer");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/intel-qep.c b/drivers/counter/intel-qep.c
index af5942e66f7d..dbd54a7bdf4f 100644
--- a/drivers/counter/intel-qep.c
+++ b/drivers/counter/intel-qep.c
@@ -523,4 +523,4 @@ MODULE_AUTHOR("Jarkko Nikula <jarkko.nikula@linux.intel.com>");
 MODULE_AUTHOR("Raymond Tan <raymond.tan@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel Quadrature Encoder Peripheral driver");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/interrupt-cnt.c b/drivers/counter/interrupt-cnt.c
index 229473855c5b..949598d51575 100644
--- a/drivers/counter/interrupt-cnt.c
+++ b/drivers/counter/interrupt-cnt.c
@@ -253,4 +253,4 @@ MODULE_ALIAS("platform:interrupt-counter");
 MODULE_AUTHOR("Oleksij Rempel <o.rempel@pengutronix.de>");
 MODULE_DESCRIPTION("Interrupt counter driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index b3e615cbd2ca..2f096a5b973d 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -403,4 +403,4 @@ module_platform_driver(mchp_tc_driver);
 MODULE_AUTHOR("Kamel Bouhara <kamel.bouhara@bootlin.com>");
 MODULE_DESCRIPTION("Microchip TCB Capture driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
index ee821493b166..e755d54dfece 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -903,4 +903,4 @@ MODULE_AUTHOR("Biju Das <biju.das.jz@bp.renesas.com>");
 MODULE_ALIAS("platform:rz-mtu3-counter");
 MODULE_DESCRIPTION("Renesas RZ/G2L MTU3a counter driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/stm32-lptimer-cnt.c b/drivers/counter/stm32-lptimer-cnt.c
index 8439755559b2..cf73f65baf60 100644
--- a/drivers/counter/stm32-lptimer-cnt.c
+++ b/drivers/counter/stm32-lptimer-cnt.c
@@ -520,4 +520,4 @@ MODULE_AUTHOR("Fabrice Gasnier <fabrice.gasnier@st.com>");
 MODULE_ALIAS("platform:stm32-lptimer-counter");
 MODULE_DESCRIPTION("STMicroelectronics STM32 LPTIM counter driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/stm32-timer-cnt.c b/drivers/counter/stm32-timer-cnt.c
index 186e73d6ccb4..04264b61352f 100644
--- a/drivers/counter/stm32-timer-cnt.c
+++ b/drivers/counter/stm32-timer-cnt.c
@@ -853,4 +853,4 @@ MODULE_AUTHOR("Benjamin Gaignard <benjamin.gaignard@st.com>");
 MODULE_ALIAS("platform:stm32-timer-counter");
 MODULE_DESCRIPTION("STMicroelectronics STM32 TIMER counter driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/ti-ecap-capture.c b/drivers/counter/ti-ecap-capture.c
index 675447315caf..9f7ab24e604c 100644
--- a/drivers/counter/ti-ecap-capture.c
+++ b/drivers/counter/ti-ecap-capture.c
@@ -610,4 +610,4 @@ module_platform_driver(ecap_cnt_driver);
 MODULE_DESCRIPTION("ECAP Capture driver");
 MODULE_AUTHOR("Julien Panis <jpanis@baylibre.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/counter/ti-eqep.c b/drivers/counter/ti-eqep.c
index 313b91456f26..f385f6cb622d 100644
--- a/drivers/counter/ti-eqep.c
+++ b/drivers/counter/ti-eqep.c
@@ -559,4 +559,4 @@ module_platform_driver(ti_eqep_driver);
 MODULE_AUTHOR("David Lechner <david@lechnology.com>");
 MODULE_DESCRIPTION("TI eQEP counter driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(COUNTER);
+MODULE_IMPORT_NS("COUNTER");
diff --git a/drivers/crypto/geode-aes.c b/drivers/crypto/geode-aes.c
index fa5a9f207bc9..d933f26aeb3a 100644
--- a/drivers/crypto/geode-aes.c
+++ b/drivers/crypto/geode-aes.c
@@ -433,4 +433,4 @@ module_pci_driver(geode_aes_driver);
 MODULE_AUTHOR("Advanced Micro Devices, Inc.");
 MODULE_DESCRIPTION("Geode LX Hardware AES driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/drivers/crypto/inside-secure/safexcel.c b/drivers/crypto/inside-secure/safexcel.c
index f5c1912aa564..b6c9729ee42a 100644
--- a/drivers/crypto/inside-secure/safexcel.c
+++ b/drivers/crypto/inside-secure/safexcel.c
@@ -2031,7 +2031,7 @@ MODULE_AUTHOR("Ofer Heifetz <oferh@marvell.com>");
 MODULE_AUTHOR("Igal Liberman <igall@marvell.com>");
 MODULE_DESCRIPTION("Support for SafeXcel cryptographic engines: EIP97 & EIP197");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
 
 MODULE_FIRMWARE("ifpp.bin");
 MODULE_FIRMWARE("ipue.bin");
diff --git a/drivers/crypto/intel/iaa/iaa_crypto_main.c b/drivers/crypto/intel/iaa/iaa_crypto_main.c
index 237f87000070..f0a8c571b953 100644
--- a/drivers/crypto/intel/iaa/iaa_crypto_main.c
+++ b/drivers/crypto/intel/iaa/iaa_crypto_main.c
@@ -2084,7 +2084,7 @@ static void __exit iaa_crypto_cleanup_module(void)
 	pr_debug("cleaned up\n");
 }
 
-MODULE_IMPORT_NS(IDXD);
+MODULE_IMPORT_NS("IDXD");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_IDXD_DEVICE(0);
 MODULE_AUTHOR("Intel Corporation");
diff --git a/drivers/crypto/intel/qat/qat_420xx/adf_drv.c b/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
index f49818a13013..498e1bccbbe9 100644
--- a/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_420xx/adf_drv.c
@@ -199,4 +199,4 @@ MODULE_FIRMWARE(ADF_420XX_MMP);
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
 MODULE_SOFTDEP("pre: crypto-intel_qat");
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c b/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
index 659905e45950..a66e83ed462f 100644
--- a/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_4xxx/adf_drv.c
@@ -203,4 +203,4 @@ MODULE_FIRMWARE(ADF_402XX_MMP);
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
 MODULE_SOFTDEP("pre: crypto-intel_qat");
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c b/drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c
index 4d18057745d4..caa53882fda6 100644
--- a/drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_c3xxx/adf_drv.c
@@ -252,4 +252,4 @@ MODULE_FIRMWARE(ADF_C3XXX_FW);
 MODULE_FIRMWARE(ADF_C3XXX_MMP);
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c b/drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c
index f0023cfb234c..c622793e94a8 100644
--- a/drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_c3xxxvf/adf_drv.c
@@ -226,4 +226,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Intel");
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_c62x/adf_drv.c b/drivers/crypto/intel/qat/qat_c62x/adf_drv.c
index e6b5de55434e..b7398fee19ed 100644
--- a/drivers/crypto/intel/qat/qat_c62x/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_c62x/adf_drv.c
@@ -252,4 +252,4 @@ MODULE_FIRMWARE(ADF_C62X_FW);
 MODULE_FIRMWARE(ADF_C62X_MMP);
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c b/drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c
index 2bd5b0ff00e3..4840d44bbd5b 100644
--- a/drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_c62xvf/adf_drv.c
@@ -226,4 +226,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Intel");
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c b/drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c
index 70fa0f6497a9..48c62a14a6a7 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_ctl_drv.c
@@ -475,4 +475,4 @@ MODULE_AUTHOR("Intel");
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_ALIAS_CRYPTO("intel_qat");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_INTERNAL);
+MODULE_IMPORT_NS("CRYPTO_INTERNAL");
diff --git a/drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c b/drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c
index 2a50cce41515..3137fc3b5cf6 100644
--- a/drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_dh895xcc/adf_drv.c
@@ -252,4 +252,4 @@ MODULE_FIRMWARE(ADF_DH895XCC_FW);
 MODULE_FIRMWARE(ADF_DH895XCC_MMP);
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c b/drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c
index 7cb015b55122..7cd528ee31e7 100644
--- a/drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c
+++ b/drivers/crypto/intel/qat/qat_dh895xccvf/adf_drv.c
@@ -226,4 +226,4 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Intel");
 MODULE_DESCRIPTION("Intel(R) QuickAssist Technology");
 MODULE_VERSION(ADF_DRV_VERSION);
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/crypto/marvell/octeontx2/cn10k_cpt.c b/drivers/crypto/marvell/octeontx2/cn10k_cpt.c
index 6bfc59e67747..5cae8fafa151 100644
--- a/drivers/crypto/marvell/octeontx2/cn10k_cpt.c
+++ b/drivers/crypto/marvell/octeontx2/cn10k_cpt.c
@@ -73,7 +73,7 @@ int cn10k_cptpf_lmtst_init(struct otx2_cptpf_dev *cptpf)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cptpf_lmtst_init, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cptpf_lmtst_init, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int cn10k_cptvf_lmtst_init(struct otx2_cptvf_dev *cptvf)
 {
@@ -94,7 +94,7 @@ int cn10k_cptvf_lmtst_init(struct otx2_cptvf_dev *cptvf)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cptvf_lmtst_init, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cptvf_lmtst_init, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void cn10k_cpt_hw_ctx_clear(struct pci_dev *pdev,
 			    struct cn10k_cpt_errata_ctx *er_ctx)
@@ -110,7 +110,7 @@ void cn10k_cpt_hw_ctx_clear(struct pci_dev *pdev,
 			 DMA_BIDIRECTIONAL);
 	kfree(er_ctx->hw_ctx);
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_clear, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_clear, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void cn10k_cpt_hw_ctx_set(union cn10k_cpt_hw_ctx *hctx, u16 ctx_sz)
 {
@@ -119,7 +119,7 @@ void cn10k_cpt_hw_ctx_set(union cn10k_cpt_hw_ctx *hctx, u16 ctx_sz)
 	hctx->w0.ctx_sz = ctx_sz;
 	hctx->w0.ctx_push_sz = 1;
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_set, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_set, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int cn10k_cpt_hw_ctx_init(struct pci_dev *pdev,
 			  struct cn10k_cpt_errata_ctx *er_ctx)
@@ -149,7 +149,7 @@ int cn10k_cpt_hw_ctx_init(struct pci_dev *pdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_init, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cpt_hw_ctx_init, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void cn10k_cpt_ctx_flush(struct pci_dev *pdev, u64 cptr, bool inval)
 {
@@ -168,7 +168,7 @@ void cn10k_cpt_ctx_flush(struct pci_dev *pdev, u64 cptr, bool inval)
 	otx2_cpt_read64(lfs->reg_base, lfs->blkaddr, lfs->lf[0].slot,
 			OTX2_CPT_LF_CTX_ERR);
 }
-EXPORT_SYMBOL_NS_GPL(cn10k_cpt_ctx_flush, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cn10k_cpt_ctx_flush, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void cptvf_hw_ops_get(struct otx2_cptvf_dev *cptvf)
 {
@@ -177,4 +177,4 @@ void cptvf_hw_ops_get(struct otx2_cptvf_dev *cptvf)
 	else
 		cptvf->lfs.ops = &otx2_hw_ops;
 }
-EXPORT_SYMBOL_NS_GPL(cptvf_hw_ops_get, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(cptvf_hw_ops_get, "CRYPTO_DEV_OCTEONTX2_CPT");
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c b/drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c
index 5be0103c1fb8..b8b7c8a3c0ca 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cpt_mbox_common.c
@@ -19,7 +19,7 @@ int otx2_cpt_send_mbox_msg(struct otx2_mbox *mbox, struct pci_dev *pdev)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_mbox_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_mbox_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_send_ready_msg(struct otx2_mbox *mbox, struct pci_dev *pdev)
 {
@@ -37,13 +37,13 @@ int otx2_cpt_send_ready_msg(struct otx2_mbox *mbox, struct pci_dev *pdev)
 
 	return otx2_cpt_send_mbox_msg(mbox, pdev);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_ready_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_ready_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_send_af_reg_requests(struct otx2_mbox *mbox, struct pci_dev *pdev)
 {
 	return otx2_cpt_send_mbox_msg(mbox, pdev);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_af_reg_requests, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_send_af_reg_requests, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 static int otx2_cpt_add_read_af_reg(struct otx2_mbox *mbox,
 				    struct pci_dev *pdev, u64 reg,
@@ -95,7 +95,7 @@ int otx2_cpt_add_write_af_reg(struct otx2_mbox *mbox, struct pci_dev *pdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_add_write_af_reg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_add_write_af_reg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_read_af_reg(struct otx2_mbox *mbox, struct pci_dev *pdev,
 			 u64 reg, u64 *val, int blkaddr)
@@ -108,7 +108,7 @@ int otx2_cpt_read_af_reg(struct otx2_mbox *mbox, struct pci_dev *pdev,
 
 	return otx2_cpt_send_mbox_msg(mbox, pdev);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_read_af_reg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_read_af_reg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_write_af_reg(struct otx2_mbox *mbox, struct pci_dev *pdev,
 			  u64 reg, u64 val, int blkaddr)
@@ -121,7 +121,7 @@ int otx2_cpt_write_af_reg(struct otx2_mbox *mbox, struct pci_dev *pdev,
 
 	return otx2_cpt_send_mbox_msg(mbox, pdev);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_write_af_reg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_write_af_reg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_attach_rscrs_msg(struct otx2_cptlfs_info *lfs)
 {
@@ -180,7 +180,7 @@ int otx2_cpt_detach_rsrcs_msg(struct otx2_cptlfs_info *lfs)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_detach_rsrcs_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_detach_rsrcs_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_msix_offset_msg(struct otx2_cptlfs_info *lfs)
 {
@@ -213,7 +213,7 @@ int otx2_cpt_msix_offset_msg(struct otx2_cptlfs_info *lfs)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_msix_offset_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_msix_offset_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_sync_mbox_msg(struct otx2_mbox *mbox)
 {
@@ -228,7 +228,7 @@ int otx2_cpt_sync_mbox_msg(struct otx2_mbox *mbox)
 
 	return otx2_mbox_check_rsp_msgs(mbox, 0);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_sync_mbox_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_sync_mbox_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cpt_lf_reset_msg(struct otx2_cptlfs_info *lfs, int slot)
 {
@@ -254,4 +254,4 @@ int otx2_cpt_lf_reset_msg(struct otx2_cptlfs_info *lfs, int slot)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cpt_lf_reset_msg, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cpt_lf_reset_msg, "CRYPTO_DEV_OCTEONTX2_CPT");
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptlf.c b/drivers/crypto/marvell/octeontx2/otx2_cptlf.c
index b52728e3c0d1..b5d66afcc030 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptlf.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptlf.c
@@ -288,8 +288,7 @@ void otx2_cptlf_unregister_misc_interrupts(struct otx2_cptlfs_info *lfs)
 
 	cptlf_set_misc_intrs(lfs, false);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_misc_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_misc_interrupts, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void otx2_cptlf_unregister_done_interrupts(struct otx2_cptlfs_info *lfs)
 {
@@ -308,8 +307,7 @@ void otx2_cptlf_unregister_done_interrupts(struct otx2_cptlfs_info *lfs)
 
 	cptlf_set_done_intrs(lfs, false);
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_done_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_unregister_done_interrupts, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 static int cptlf_do_register_interrrupts(struct otx2_cptlfs_info *lfs,
 					 int lf_num, int irq_offset,
@@ -351,8 +349,7 @@ int otx2_cptlf_register_misc_interrupts(struct otx2_cptlfs_info *lfs)
 	otx2_cptlf_unregister_misc_interrupts(lfs);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_misc_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_misc_interrupts, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cptlf_register_done_interrupts(struct otx2_cptlfs_info *lfs)
 {
@@ -375,8 +372,7 @@ int otx2_cptlf_register_done_interrupts(struct otx2_cptlfs_info *lfs)
 	otx2_cptlf_unregister_done_interrupts(lfs);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts,
-		     CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_register_done_interrupts, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void otx2_cptlf_free_irqs_affinity(struct otx2_cptlfs_info *lfs)
 {
@@ -390,7 +386,7 @@ void otx2_cptlf_free_irqs_affinity(struct otx2_cptlfs_info *lfs)
 		free_cpumask_var(lfs->lf[slot].affinity_mask);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_free_irqs_affinity, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_free_irqs_affinity, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cptlf_set_irqs_affinity(struct otx2_cptlfs_info *lfs)
 {
@@ -423,7 +419,7 @@ int otx2_cptlf_set_irqs_affinity(struct otx2_cptlfs_info *lfs)
 	otx2_cptlf_free_irqs_affinity(lfs);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_set_irqs_affinity, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_set_irqs_affinity, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 int otx2_cptlf_init(struct otx2_cptlfs_info *lfs, u8 eng_grp_mask, int pri,
 		    int lfs_num)
@@ -486,7 +482,7 @@ int otx2_cptlf_init(struct otx2_cptlfs_info *lfs, u8 eng_grp_mask, int pri,
 	lfs->lfs_num = 0;
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_init, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_init, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 void otx2_cptlf_shutdown(struct otx2_cptlfs_info *lfs)
 {
@@ -498,7 +494,7 @@ void otx2_cptlf_shutdown(struct otx2_cptlfs_info *lfs)
 	otx2_cpt_detach_rsrcs_msg(lfs);
 	lfs->lfs_num = 0;
 }
-EXPORT_SYMBOL_NS_GPL(otx2_cptlf_shutdown, CRYPTO_DEV_OCTEONTX2_CPT);
+EXPORT_SYMBOL_NS_GPL(otx2_cptlf_shutdown, "CRYPTO_DEV_OCTEONTX2_CPT");
 
 MODULE_AUTHOR("Marvell");
 MODULE_DESCRIPTION("Marvell RVU CPT Common module");
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
index 400e36d9908f..03335f462d08 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c
@@ -864,7 +864,7 @@ static struct pci_driver otx2_cpt_pci_driver = {
 
 module_pci_driver(otx2_cpt_pci_driver);
 
-MODULE_IMPORT_NS(CRYPTO_DEV_OCTEONTX2_CPT);
+MODULE_IMPORT_NS("CRYPTO_DEV_OCTEONTX2_CPT");
 
 MODULE_AUTHOR("Marvell");
 MODULE_DESCRIPTION(OTX2_CPT_DRV_STRING);
diff --git a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
index 527d34cc258b..1ce48b360bf5 100644
--- a/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
+++ b/drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c
@@ -448,7 +448,7 @@ static struct pci_driver otx2_cptvf_pci_driver = {
 
 module_pci_driver(otx2_cptvf_pci_driver);
 
-MODULE_IMPORT_NS(CRYPTO_DEV_OCTEONTX2_CPT);
+MODULE_IMPORT_NS("CRYPTO_DEV_OCTEONTX2_CPT");
 
 MODULE_AUTHOR("Marvell");
 MODULE_DESCRIPTION("Marvell RVU CPT Virtual Function Driver");
diff --git a/drivers/cxl/acpi.c b/drivers/cxl/acpi.c
index 432b7cfd12a8..cb14829bb9be 100644
--- a/drivers/cxl/acpi.c
+++ b/drivers/cxl/acpi.c
@@ -934,5 +934,5 @@ MODULE_SOFTDEP("pre: cxl_port");
 module_exit(cxl_acpi_exit);
 MODULE_DESCRIPTION("CXL ACPI: Platform Support");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
-MODULE_IMPORT_NS(ACPI);
+MODULE_IMPORT_NS("CXL");
+MODULE_IMPORT_NS("ACPI");
diff --git a/drivers/cxl/core/cdat.c b/drivers/cxl/core/cdat.c
index e9cd7939c407..4e14c51172ff 100644
--- a/drivers/cxl/core/cdat.c
+++ b/drivers/cxl/core/cdat.c
@@ -416,7 +416,7 @@ void cxl_endpoint_parse_cdat(struct cxl_port *port)
 	cxl_qos_class_verify(cxlmd);
 	cxl_memdev_update_perf(cxlmd);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_endpoint_parse_cdat, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_endpoint_parse_cdat, "CXL");
 
 static int cdat_sslbis_handler(union acpi_subtable_headers *header, void *arg,
 			       const unsigned long end)
@@ -513,7 +513,7 @@ void cxl_switch_parse_cdat(struct cxl_port *port)
 	if (rc)
 		dev_dbg(&port->dev, "Failed to parse SSLBIS: %d\n", rc);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_switch_parse_cdat, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_switch_parse_cdat, "CXL");
 
 static void __cxl_coordinates_combine(struct access_coordinate *out,
 				      struct access_coordinate *c1,
@@ -545,7 +545,7 @@ void cxl_coordinates_combine(struct access_coordinate *out,
 		__cxl_coordinates_combine(&out[i], &c1[i], &c2[i]);
 }
 
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
 
 static void cxl_bandwidth_add(struct access_coordinate *coord,
 			      struct access_coordinate *c1,
diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index 223c273c0cd1..802fe0e7334f 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -73,7 +73,7 @@ int devm_cxl_add_passthrough_decoder(struct cxl_port *port)
 
 	return add_hdm_decoder(port, &cxlsd->cxld, single_port_map);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_passthrough_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_passthrough_decoder, "CXL");
 
 static void parse_hdm_decoder_caps(struct cxl_hdm *cxlhdm)
 {
@@ -199,7 +199,7 @@ struct cxl_hdm *devm_cxl_setup_hdm(struct cxl_port *port,
 
 	return cxlhdm;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_setup_hdm, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_setup_hdm, "CXL");
 
 static void __cxl_dpa_debug(struct seq_file *file, struct resource *r, int depth)
 {
@@ -221,7 +221,7 @@ void cxl_dpa_debug(struct seq_file *file, struct cxl_dev_state *cxlds)
 	}
 	up_read(&cxl_dpa_rwsem);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_dpa_debug, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_dpa_debug, "CXL");
 
 /*
  * Must be called in a context that synchronizes against this decoder's
@@ -358,7 +358,7 @@ int devm_cxl_dpa_reserve(struct cxl_endpoint_decoder *cxled,
 
 	return devm_add_action_or_reset(&port->dev, cxl_dpa_release, cxled);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_dpa_reserve, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_dpa_reserve, "CXL");
 
 resource_size_t cxl_dpa_size(struct cxl_endpoint_decoder *cxled)
 {
@@ -747,7 +747,7 @@ void cxl_port_commit_reap(struct cxl_decoder *cxld)
 	device_for_each_child_reverse_from(&port->dev, &cxld->dev, NULL,
 					   commit_reap);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_port_commit_reap, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_port_commit_reap, "CXL");
 
 static void cxl_decoder_reset(struct cxl_decoder *cxld)
 {
@@ -1073,4 +1073,4 @@ int devm_cxl_enumerate_decoders(struct cxl_hdm *cxlhdm,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_enumerate_decoders, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_enumerate_decoders, "CXL");
diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
index 5175138c4fb7..548564c770c0 100644
--- a/drivers/cxl/core/mbox.c
+++ b/drivers/cxl/core/mbox.c
@@ -281,7 +281,7 @@ int cxl_internal_send_cmd(struct cxl_mailbox *cxl_mbox,
 		return -EIO;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_internal_send_cmd, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_internal_send_cmd, "CXL");
 
 static bool cxl_mem_raw_command_allowed(u16 opcode)
 {
@@ -854,7 +854,7 @@ int cxl_enumerate_cmds(struct cxl_memdev_state *mds)
 	kvfree(gsl);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_enumerate_cmds, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_enumerate_cmds, "CXL");
 
 void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
 			    enum cxl_event_log_type type,
@@ -894,7 +894,7 @@ void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
 			trace_cxl_dram(cxlmd, type, cxlr, hpa, &evt->dram);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_event_trace_record, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_event_trace_record, "CXL");
 
 static void __cxl_event_trace_record(const struct cxl_memdev *cxlmd,
 				     enum cxl_event_log_type type,
@@ -1063,7 +1063,7 @@ void cxl_mem_get_event_records(struct cxl_memdev_state *mds, u32 status)
 	if (status & CXLDEV_EVENT_STATUS_INFO)
 		cxl_mem_get_records_log(mds, CXL_EVENT_TYPE_INFO);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_get_event_records, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_get_event_records, "CXL");
 
 /**
  * cxl_mem_get_partition_info - Get partition info
@@ -1155,7 +1155,7 @@ int cxl_dev_state_identify(struct cxl_memdev_state *mds)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_dev_state_identify, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_dev_state_identify, "CXL");
 
 static int __cxl_mem_sanitize(struct cxl_memdev_state *mds, u16 cmd)
 {
@@ -1306,7 +1306,7 @@ int cxl_mem_create_range_info(struct cxl_memdev_state *mds)
 			   mds->active_volatile_bytes,
 			   mds->active_persistent_bytes, "pmem");
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_create_range_info, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_create_range_info, "CXL");
 
 int cxl_set_timestamp(struct cxl_memdev_state *mds)
 {
@@ -1333,7 +1333,7 @@ int cxl_set_timestamp(struct cxl_memdev_state *mds)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_set_timestamp, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_set_timestamp, "CXL");
 
 int cxl_mem_get_poison(struct cxl_memdev *cxlmd, u64 offset, u64 len,
 		       struct cxl_region *cxlr)
@@ -1384,7 +1384,7 @@ int cxl_mem_get_poison(struct cxl_memdev *cxlmd, u64 offset, u64 len,
 	mutex_unlock(&mds->poison.lock);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_get_poison, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_get_poison, "CXL");
 
 static void free_poison_buf(void *buf)
 {
@@ -1420,7 +1420,7 @@ int cxl_poison_state_init(struct cxl_memdev_state *mds)
 	mutex_init(&mds->poison.lock);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_poison_state_init, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_poison_state_init, "CXL");
 
 int cxl_mailbox_init(struct cxl_mailbox *cxl_mbox, struct device *host)
 {
@@ -1433,7 +1433,7 @@ int cxl_mailbox_init(struct cxl_mailbox *cxl_mbox, struct device *host)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mailbox_init, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mailbox_init, "CXL");
 
 struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
 {
@@ -1455,7 +1455,7 @@ struct cxl_memdev_state *cxl_memdev_state_create(struct device *dev)
 
 	return mds;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_memdev_state_create, "CXL");
 
 void __init cxl_mbox_init(void)
 {
diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
index 84fefb76dafa..ae3dfcbe8938 100644
--- a/drivers/cxl/core/memdev.c
+++ b/drivers/cxl/core/memdev.c
@@ -250,7 +250,7 @@ int cxl_trigger_poison_list(struct cxl_memdev *cxlmd)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_trigger_poison_list, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_trigger_poison_list, "CXL");
 
 static int cxl_validate_poison_dpa(struct cxl_memdev *cxlmd, u64 dpa)
 {
@@ -329,7 +329,7 @@ int cxl_inject_poison(struct cxl_memdev *cxlmd, u64 dpa)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_inject_poison, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_inject_poison, "CXL");
 
 int cxl_clear_poison(struct cxl_memdev *cxlmd, u64 dpa)
 {
@@ -393,7 +393,7 @@ int cxl_clear_poison(struct cxl_memdev *cxlmd, u64 dpa)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_clear_poison, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_clear_poison, "CXL");
 
 static struct attribute *cxl_memdev_attributes[] = {
 	&dev_attr_serial.attr,
@@ -537,7 +537,7 @@ void cxl_memdev_update_perf(struct cxl_memdev *cxlmd)
 	sysfs_update_group(&cxlmd->dev.kobj, &cxl_memdev_ram_attribute_group);
 	sysfs_update_group(&cxlmd->dev.kobj, &cxl_memdev_pmem_attribute_group);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_memdev_update_perf, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_memdev_update_perf, "CXL");
 
 static const struct device_type cxl_memdev_type = {
 	.name = "cxl_memdev",
@@ -550,7 +550,7 @@ bool is_cxl_memdev(const struct device *dev)
 {
 	return dev->type == &cxl_memdev_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_memdev, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_memdev, "CXL");
 
 /**
  * set_exclusive_cxl_commands() - atomically disable user cxl commands
@@ -569,7 +569,7 @@ void set_exclusive_cxl_commands(struct cxl_memdev_state *mds,
 		  CXL_MEM_COMMAND_ID_MAX);
 	up_write(&cxl_memdev_rwsem);
 }
-EXPORT_SYMBOL_NS_GPL(set_exclusive_cxl_commands, CXL);
+EXPORT_SYMBOL_NS_GPL(set_exclusive_cxl_commands, "CXL");
 
 /**
  * clear_exclusive_cxl_commands() - atomically enable user cxl commands
@@ -584,7 +584,7 @@ void clear_exclusive_cxl_commands(struct cxl_memdev_state *mds,
 		      CXL_MEM_COMMAND_ID_MAX);
 	up_write(&cxl_memdev_rwsem);
 }
-EXPORT_SYMBOL_NS_GPL(clear_exclusive_cxl_commands, CXL);
+EXPORT_SYMBOL_NS_GPL(clear_exclusive_cxl_commands, "CXL");
 
 static void cxl_memdev_shutdown(struct device *dev)
 {
@@ -1006,7 +1006,7 @@ int devm_cxl_setup_fw_upload(struct device *host, struct cxl_memdev_state *mds)
 		return PTR_ERR(fwl);
 	return devm_add_action_or_reset(host, cxl_remove_fw_upload, fwl);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_setup_fw_upload, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_setup_fw_upload, "CXL");
 
 static const struct file_operations cxl_memdev_fops = {
 	.owner = THIS_MODULE,
@@ -1060,7 +1060,7 @@ struct cxl_memdev *devm_cxl_add_memdev(struct device *host,
 	put_device(dev);
 	return ERR_PTR(rc);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_memdev, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_memdev, "CXL");
 
 static void sanitize_teardown_notifier(void *data)
 {
@@ -1105,7 +1105,7 @@ int devm_cxl_sanitize_setup_notifier(struct device *host,
 
 	return devm_add_action_or_reset(host, sanitize_teardown_notifier, mds);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_sanitize_setup_notifier, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_sanitize_setup_notifier, "CXL");
 
 __init int cxl_memdev_init(void)
 {
diff --git a/drivers/cxl/core/pci.c b/drivers/cxl/core/pci.c
index 5b46bc46aaa9..9d58ab9d33c5 100644
--- a/drivers/cxl/core/pci.c
+++ b/drivers/cxl/core/pci.c
@@ -101,7 +101,7 @@ int devm_cxl_port_enumerate_dports(struct cxl_port *port)
 		return ctx.error;
 	return ctx.count;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_port_enumerate_dports, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_port_enumerate_dports, "CXL");
 
 static int cxl_dvsec_mem_range_valid(struct cxl_dev_state *cxlds, int id)
 {
@@ -209,7 +209,7 @@ int cxl_await_media_ready(struct cxl_dev_state *cxlds)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_await_media_ready, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_await_media_ready, "CXL");
 
 static int cxl_set_mem_enable(struct cxl_dev_state *cxlds, u16 val)
 {
@@ -386,7 +386,7 @@ int cxl_dvsec_rr_decode(struct device *dev, struct cxl_port *port,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_dvsec_rr_decode, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_dvsec_rr_decode, "CXL");
 
 /**
  * cxl_hdm_decode_init() - Setup HDM decoding for the endpoint
@@ -464,7 +464,7 @@ int cxl_hdm_decode_init(struct cxl_dev_state *cxlds, struct cxl_hdm *cxlhdm,
 	 */
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_hdm_decode_init, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_hdm_decode_init, "CXL");
 
 #define CXL_DOE_TABLE_ACCESS_REQ_CODE		0x000000ff
 #define   CXL_DOE_TABLE_ACCESS_REQ_CODE_READ	0
@@ -648,7 +648,7 @@ void read_cdat_data(struct cxl_port *port)
 	devm_kfree(dev, buf);
 	dev_err(dev, "Failed to read/validate CDAT.\n");
 }
-EXPORT_SYMBOL_NS_GPL(read_cdat_data, CXL);
+EXPORT_SYMBOL_NS_GPL(read_cdat_data, "CXL");
 
 static void __cxl_handle_cor_ras(struct cxl_dev_state *cxlds,
 				 void __iomem *ras_base)
@@ -805,7 +805,7 @@ void cxl_dport_init_ras_reporting(struct cxl_dport *dport, struct device *host)
 		cxl_disable_rch_root_ints(dport);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_dport_init_ras_reporting, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_dport_init_ras_reporting, "CXL");
 
 static void cxl_handle_rdport_cor_ras(struct cxl_dev_state *cxlds,
 					  struct cxl_dport *dport)
@@ -916,7 +916,7 @@ void cxl_cor_error_detected(struct pci_dev *pdev)
 		cxl_handle_endpoint_cor_ras(cxlds);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_cor_error_detected, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_cor_error_detected, "CXL");
 
 pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
 				    pci_channel_state_t state)
@@ -966,7 +966,7 @@ pci_ers_result_t cxl_error_detected(struct pci_dev *pdev,
 	}
 	return PCI_ERS_RESULT_NEED_RESET;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_error_detected, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_error_detected, "CXL");
 
 static int cxl_flit_size(struct pci_dev *pdev)
 {
@@ -1030,7 +1030,7 @@ bool cxl_endpoint_decoder_reset_detected(struct cxl_port *port)
 	return device_for_each_child(&port->dev, port,
 				     __cxl_endpoint_decoder_reset_detected);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_endpoint_decoder_reset_detected, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_endpoint_decoder_reset_detected, "CXL");
 
 int cxl_pci_get_bandwidth(struct pci_dev *pdev, struct access_coordinate *c)
 {
diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
index c00f3a933164..b3378d3f6acb 100644
--- a/drivers/cxl/core/pmem.c
+++ b/drivers/cxl/core/pmem.c
@@ -49,13 +49,13 @@ struct cxl_nvdimm_bridge *to_cxl_nvdimm_bridge(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_nvdimm_bridge, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_nvdimm_bridge, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_nvdimm_bridge, "CXL");
 
 bool is_cxl_nvdimm_bridge(struct device *dev)
 {
 	return dev->type == &cxl_nvdimm_bridge_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
 
 static int match_nvdimm_bridge(struct device *dev, void *data)
 {
@@ -82,7 +82,7 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
 
 	return to_cxl_nvdimm_bridge(dev);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_find_nvdimm_bridge, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_find_nvdimm_bridge, "CXL");
 
 static struct lock_class_key cxl_nvdimm_bridge_key;
 
@@ -164,7 +164,7 @@ struct cxl_nvdimm_bridge *devm_cxl_add_nvdimm_bridge(struct device *host,
 	put_device(dev);
 	return ERR_PTR(rc);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_nvdimm_bridge, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_nvdimm_bridge, "CXL");
 
 static void cxl_nvdimm_release(struct device *dev)
 {
@@ -188,7 +188,7 @@ bool is_cxl_nvdimm(struct device *dev)
 {
 	return dev->type == &cxl_nvdimm_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm, "CXL");
 
 struct cxl_nvdimm *to_cxl_nvdimm(struct device *dev)
 {
@@ -197,7 +197,7 @@ struct cxl_nvdimm *to_cxl_nvdimm(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_nvdimm, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_nvdimm, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_nvdimm, "CXL");
 
 static struct lock_class_key cxl_nvdimm_key;
 
@@ -293,4 +293,4 @@ int devm_cxl_add_nvdimm(struct cxl_port *parent_port,
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_nvdimm, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_nvdimm, "CXL");
diff --git a/drivers/cxl/core/pmu.c b/drivers/cxl/core/pmu.c
index 5d8e06b0ba6e..b3136d7664ab 100644
--- a/drivers/cxl/core/pmu.c
+++ b/drivers/cxl/core/pmu.c
@@ -65,4 +65,4 @@ int devm_cxl_pmu_add(struct device *parent, struct cxl_pmu_regs *regs,
 	put_device(&pmu->dev);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_pmu_add, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_pmu_add, "CXL");
diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
index af92c67bc954..78a5c2c25982 100644
--- a/drivers/cxl/core/port.c
+++ b/drivers/cxl/core/port.c
@@ -437,7 +437,7 @@ struct cxl_root_decoder *to_cxl_root_decoder(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_root_decoder, cxlsd.cxld.dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_root_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_root_decoder, "CXL");
 
 static void cxl_root_decoder_release(struct device *dev)
 {
@@ -471,19 +471,19 @@ bool is_endpoint_decoder(struct device *dev)
 {
 	return dev->type == &cxl_decoder_endpoint_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_endpoint_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(is_endpoint_decoder, "CXL");
 
 bool is_root_decoder(struct device *dev)
 {
 	return dev->type == &cxl_decoder_root_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_root_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(is_root_decoder, "CXL");
 
 bool is_switch_decoder(struct device *dev)
 {
 	return is_root_decoder(dev) || dev->type == &cxl_decoder_switch_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_switch_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(is_switch_decoder, "CXL");
 
 struct cxl_decoder *to_cxl_decoder(struct device *dev)
 {
@@ -493,7 +493,7 @@ struct cxl_decoder *to_cxl_decoder(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_decoder, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_decoder, "CXL");
 
 struct cxl_endpoint_decoder *to_cxl_endpoint_decoder(struct device *dev)
 {
@@ -502,7 +502,7 @@ struct cxl_endpoint_decoder *to_cxl_endpoint_decoder(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_endpoint_decoder, cxld.dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_endpoint_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_endpoint_decoder, "CXL");
 
 struct cxl_switch_decoder *to_cxl_switch_decoder(struct device *dev)
 {
@@ -511,7 +511,7 @@ struct cxl_switch_decoder *to_cxl_switch_decoder(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_switch_decoder, cxld.dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_switch_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_switch_decoder, "CXL");
 
 static void cxl_ep_release(struct cxl_ep *ep)
 {
@@ -585,7 +585,7 @@ bool is_cxl_port(const struct device *dev)
 {
 	return dev->type == &cxl_port_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_port, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_port, "CXL");
 
 struct cxl_port *to_cxl_port(const struct device *dev)
 {
@@ -594,7 +594,7 @@ struct cxl_port *to_cxl_port(const struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_port, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_port, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_port, "CXL");
 
 static void unregister_port(void *_port)
 {
@@ -942,7 +942,7 @@ struct cxl_port *devm_cxl_add_port(struct device *host,
 
 	return port;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_port, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_port, "CXL");
 
 struct cxl_root *devm_cxl_add_root(struct device *host,
 				   const struct cxl_root_ops *ops)
@@ -958,7 +958,7 @@ struct cxl_root *devm_cxl_add_root(struct device *host,
 	cxl_root->ops = ops;
 	return cxl_root;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_root, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_root, "CXL");
 
 struct pci_bus *cxl_port_to_pci_bus(struct cxl_port *port)
 {
@@ -974,7 +974,7 @@ struct pci_bus *cxl_port_to_pci_bus(struct cxl_port *port)
 
 	return xa_load(&cxl_root_buses, (unsigned long)port->uport_dev);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_port_to_pci_bus, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_port_to_pci_bus, "CXL");
 
 static void unregister_pci_bus(void *uport_dev)
 {
@@ -995,7 +995,7 @@ int devm_cxl_register_pci_bus(struct device *host, struct device *uport_dev,
 		return rc;
 	return devm_add_action_or_reset(host, unregister_pci_bus, uport_dev);
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_register_pci_bus, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_register_pci_bus, "CXL");
 
 static bool dev_is_cxl_root_child(struct device *dev)
 {
@@ -1027,7 +1027,7 @@ struct cxl_root *find_cxl_root(struct cxl_port *port)
 	get_device(&iter->dev);
 	return to_cxl_root(iter);
 }
-EXPORT_SYMBOL_NS_GPL(find_cxl_root, CXL);
+EXPORT_SYMBOL_NS_GPL(find_cxl_root, "CXL");
 
 void put_cxl_root(struct cxl_root *cxl_root)
 {
@@ -1036,7 +1036,7 @@ void put_cxl_root(struct cxl_root *cxl_root)
 
 	put_device(&cxl_root->port.dev);
 }
-EXPORT_SYMBOL_NS_GPL(put_cxl_root, CXL);
+EXPORT_SYMBOL_NS_GPL(put_cxl_root, "CXL");
 
 static struct cxl_dport *find_dport(struct cxl_port *port, int id)
 {
@@ -1230,7 +1230,7 @@ struct cxl_dport *devm_cxl_add_dport(struct cxl_port *port,
 
 	return dport;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_dport, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_dport, "CXL");
 
 /**
  * devm_cxl_add_rch_dport - append RCH downstream port data to a cxl_port
@@ -1264,7 +1264,7 @@ struct cxl_dport *devm_cxl_add_rch_dport(struct cxl_port *port,
 
 	return dport;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_add_rch_dport, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_add_rch_dport, "CXL");
 
 static int add_ep(struct cxl_ep *new)
 {
@@ -1421,7 +1421,7 @@ int cxl_endpoint_autoremove(struct cxl_memdev *cxlmd, struct cxl_port *endpoint)
 	cxlmd->depth = endpoint->depth;
 	return devm_add_action_or_reset(dev, delete_endpoint, cxlmd);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_endpoint_autoremove, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_endpoint_autoremove, "CXL");
 
 /*
  * The natural end of life of a non-root 'cxl_port' is when its parent port goes
@@ -1692,21 +1692,21 @@ int devm_cxl_enumerate_ports(struct cxl_memdev *cxlmd)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(devm_cxl_enumerate_ports, CXL);
+EXPORT_SYMBOL_NS_GPL(devm_cxl_enumerate_ports, "CXL");
 
 struct cxl_port *cxl_pci_find_port(struct pci_dev *pdev,
 				   struct cxl_dport **dport)
 {
 	return find_cxl_port(pdev->dev.parent, dport);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_pci_find_port, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_pci_find_port, "CXL");
 
 struct cxl_port *cxl_mem_find_port(struct cxl_memdev *cxlmd,
 				   struct cxl_dport **dport)
 {
 	return find_cxl_port(grandparent(&cxlmd->dev), dport);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_find_port, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_find_port, "CXL");
 
 static int decoder_populate_targets(struct cxl_switch_decoder *cxlsd,
 				    struct cxl_port *port, int *target_map)
@@ -1840,7 +1840,7 @@ struct cxl_root_decoder *cxl_root_decoder_alloc(struct cxl_port *port,
 	cxlrd->qos_class = CXL_QOS_CLASS_INVALID;
 	return cxlrd;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_root_decoder_alloc, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_root_decoder_alloc, "CXL");
 
 /**
  * cxl_switch_decoder_alloc - Allocate a switch level decoder
@@ -1877,7 +1877,7 @@ struct cxl_switch_decoder *cxl_switch_decoder_alloc(struct cxl_port *port,
 	cxld->dev.type = &cxl_decoder_switch_type;
 	return cxlsd;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_switch_decoder_alloc, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_switch_decoder_alloc, "CXL");
 
 /**
  * cxl_endpoint_decoder_alloc - Allocate an endpoint decoder
@@ -1909,7 +1909,7 @@ struct cxl_endpoint_decoder *cxl_endpoint_decoder_alloc(struct cxl_port *port)
 	cxld->dev.type = &cxl_decoder_endpoint_type;
 	return cxled;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_endpoint_decoder_alloc, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_endpoint_decoder_alloc, "CXL");
 
 /**
  * cxl_decoder_add_locked - Add a decoder with targets
@@ -1965,7 +1965,7 @@ int cxl_decoder_add_locked(struct cxl_decoder *cxld, int *target_map)
 
 	return device_add(dev);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_decoder_add_locked, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_decoder_add_locked, "CXL");
 
 /**
  * cxl_decoder_add - Add a decoder with targets
@@ -1995,7 +1995,7 @@ int cxl_decoder_add(struct cxl_decoder *cxld, int *target_map)
 	guard(device)(&port->dev);
 	return cxl_decoder_add_locked(cxld, target_map);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_decoder_add, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_decoder_add, "CXL");
 
 static void cxld_unregister(void *dev)
 {
@@ -2013,7 +2013,7 @@ int cxl_decoder_autoremove(struct device *host, struct cxl_decoder *cxld)
 {
 	return devm_add_action_or_reset(host, cxld_unregister, &cxld->dev);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_decoder_autoremove, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_decoder_autoremove, "CXL");
 
 /**
  * __cxl_driver_register - register a driver for the cxl bus
@@ -2046,13 +2046,13 @@ int __cxl_driver_register(struct cxl_driver *cxl_drv, struct module *owner,
 
 	return driver_register(&cxl_drv->drv);
 }
-EXPORT_SYMBOL_NS_GPL(__cxl_driver_register, CXL);
+EXPORT_SYMBOL_NS_GPL(__cxl_driver_register, "CXL");
 
 void cxl_driver_unregister(struct cxl_driver *cxl_drv)
 {
 	driver_unregister(&cxl_drv->drv);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_driver_unregister, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_driver_unregister, "CXL");
 
 static int cxl_bus_uevent(const struct device *dev, struct kobj_uevent_env *env)
 {
@@ -2104,19 +2104,19 @@ void cxl_bus_rescan(void)
 
 	queue_work(cxl_bus_wq, &rescan_work);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_bus_rescan, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_bus_rescan, "CXL");
 
 void cxl_bus_drain(void)
 {
 	drain_workqueue(cxl_bus_wq);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_bus_drain, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_bus_drain, "CXL");
 
 bool schedule_cxl_memdev_detach(struct cxl_memdev *cxlmd)
 {
 	return queue_work(cxl_bus_wq, &cxlmd->detach_work);
 }
-EXPORT_SYMBOL_NS_GPL(schedule_cxl_memdev_detach, CXL);
+EXPORT_SYMBOL_NS_GPL(schedule_cxl_memdev_detach, "CXL");
 
 static void add_latency(struct access_coordinate *c, long latency)
 {
@@ -2242,7 +2242,7 @@ int cxl_endpoint_get_perf_coordinates(struct cxl_port *port,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_endpoint_get_perf_coordinates, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_endpoint_get_perf_coordinates, "CXL");
 
 int cxl_port_get_switch_dport_bandwidth(struct cxl_port *port,
 					struct access_coordinate *c)
@@ -2299,7 +2299,7 @@ struct bus_type cxl_bus_type = {
 	.remove = cxl_bus_remove,
 	.bus_groups = cxl_bus_attribute_groups,
 };
-EXPORT_SYMBOL_NS_GPL(cxl_bus_type, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_bus_type, "CXL");
 
 static struct dentry *cxl_debugfs;
 
@@ -2307,7 +2307,7 @@ struct dentry *cxl_debugfs_create_dir(const char *dir)
 {
 	return debugfs_create_dir(dir, cxl_debugfs);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_debugfs_create_dir, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_debugfs_create_dir, "CXL");
 
 static __init int cxl_core_init(void)
 {
@@ -2363,4 +2363,4 @@ subsys_initcall(cxl_core_init);
 module_exit(cxl_core_exit);
 MODULE_DESCRIPTION("CXL: Core Compute Express Link support");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
diff --git a/drivers/cxl/core/region.c b/drivers/cxl/core/region.c
index dff618c708dc..b812684e943b 100644
--- a/drivers/cxl/core/region.c
+++ b/drivers/cxl/core/region.c
@@ -2299,7 +2299,7 @@ bool is_cxl_region(struct device *dev)
 {
 	return dev->type == &cxl_region_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_region, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_region, "CXL");
 
 static struct cxl_region *to_cxl_region(struct device *dev)
 {
@@ -2658,7 +2658,7 @@ bool is_cxl_pmem_region(struct device *dev)
 {
 	return dev->type == &cxl_pmem_region_type;
 }
-EXPORT_SYMBOL_NS_GPL(is_cxl_pmem_region, CXL);
+EXPORT_SYMBOL_NS_GPL(is_cxl_pmem_region, "CXL");
 
 struct cxl_pmem_region *to_cxl_pmem_region(struct device *dev)
 {
@@ -2667,7 +2667,7 @@ struct cxl_pmem_region *to_cxl_pmem_region(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_pmem_region, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_pmem_region, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_pmem_region, "CXL");
 
 struct cxl_poison_context {
 	struct cxl_port *port;
@@ -3021,7 +3021,7 @@ struct cxl_dax_region *to_cxl_dax_region(struct device *dev)
 		return NULL;
 	return container_of(dev, struct cxl_dax_region, dev);
 }
-EXPORT_SYMBOL_NS_GPL(to_cxl_dax_region, CXL);
+EXPORT_SYMBOL_NS_GPL(to_cxl_dax_region, "CXL");
 
 static struct lock_class_key cxl_dax_region_key;
 
@@ -3365,7 +3365,7 @@ int cxl_add_to_region(struct cxl_port *root, struct cxl_endpoint_decoder *cxled)
 	put_device(cxlrd_dev);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_add_to_region, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_add_to_region, "CXL");
 
 static int is_system_ram(struct resource *res, void *arg)
 {
@@ -3468,6 +3468,6 @@ void cxl_region_exit(void)
 	cxl_driver_unregister(&cxl_region_driver);
 }
 
-MODULE_IMPORT_NS(CXL);
-MODULE_IMPORT_NS(DEVMEM);
+MODULE_IMPORT_NS("CXL");
+MODULE_IMPORT_NS("DEVMEM");
 MODULE_ALIAS_CXL(CXL_DEVICE_REGION);
diff --git a/drivers/cxl/core/regs.c b/drivers/cxl/core/regs.c
index e1082e749c69..aee1789a6ec4 100644
--- a/drivers/cxl/core/regs.c
+++ b/drivers/cxl/core/regs.c
@@ -106,7 +106,7 @@ void cxl_probe_component_regs(struct device *dev, void __iomem *base,
 		rmap->size = length;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_probe_component_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_probe_component_regs, "CXL");
 
 /**
  * cxl_probe_device_regs() - Detect CXL Device register blocks
@@ -174,7 +174,7 @@ void cxl_probe_device_regs(struct device *dev, void __iomem *base,
 		rmap->size = length;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_probe_device_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_probe_device_regs, "CXL");
 
 void __iomem *devm_cxl_iomap_block(struct device *dev, resource_size_t addr,
 				   resource_size_t length)
@@ -232,7 +232,7 @@ int cxl_map_component_regs(const struct cxl_register_map *map,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_map_component_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_map_component_regs, "CXL");
 
 int cxl_map_device_regs(const struct cxl_register_map *map,
 			struct cxl_device_regs *regs)
@@ -266,7 +266,7 @@ int cxl_map_device_regs(const struct cxl_register_map *map,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_map_device_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_map_device_regs, "CXL");
 
 static bool cxl_decode_regblock(struct pci_dev *pdev, u32 reg_lo, u32 reg_hi,
 				struct cxl_register_map *map)
@@ -344,7 +344,7 @@ int cxl_find_regblock_instance(struct pci_dev *pdev, enum cxl_regloc_type type,
 	map->resource = CXL_RESOURCE_NONE;
 	return -ENODEV;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_find_regblock_instance, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_find_regblock_instance, "CXL");
 
 /**
  * cxl_find_regblock() - Locate register blocks by type
@@ -362,7 +362,7 @@ int cxl_find_regblock(struct pci_dev *pdev, enum cxl_regloc_type type,
 {
 	return cxl_find_regblock_instance(pdev, type, map, 0);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_find_regblock, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_find_regblock, "CXL");
 
 /**
  * cxl_count_regblock() - Count instances of a given regblock type.
@@ -385,7 +385,7 @@ int cxl_count_regblock(struct pci_dev *pdev, enum cxl_regloc_type type)
 		count++;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cxl_count_regblock, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_count_regblock, "CXL");
 
 int cxl_map_pmu_regs(struct cxl_register_map *map, struct cxl_pmu_regs *regs)
 {
@@ -399,7 +399,7 @@ int cxl_map_pmu_regs(struct cxl_register_map *map, struct cxl_pmu_regs *regs)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_map_pmu_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_map_pmu_regs, "CXL");
 
 static int cxl_map_regblock(struct cxl_register_map *map)
 {
@@ -468,7 +468,7 @@ int cxl_setup_regs(struct cxl_register_map *map)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(cxl_setup_regs, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_setup_regs, "CXL");
 
 u16 cxl_rcrb_to_aer(struct device *dev, resource_size_t rcrb)
 {
@@ -577,4 +577,4 @@ resource_size_t cxl_rcd_component_reg_phys(struct device *dev,
 		return CXL_RESOURCE_NONE;
 	return __rcrb_to_component(dev, &dport->rcrb, CXL_RCRB_UPSTREAM);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_rcd_component_reg_phys, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_rcd_component_reg_phys, "CXL");
diff --git a/drivers/cxl/core/suspend.c b/drivers/cxl/core/suspend.c
index a5984d96ea1d..29aa5cc5e565 100644
--- a/drivers/cxl/core/suspend.c
+++ b/drivers/cxl/core/suspend.c
@@ -15,10 +15,10 @@ void cxl_mem_active_inc(void)
 {
 	atomic_inc(&mem_active);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_active_inc, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_active_inc, "CXL");
 
 void cxl_mem_active_dec(void)
 {
 	atomic_dec(&mem_active);
 }
-EXPORT_SYMBOL_NS_GPL(cxl_mem_active_dec, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_mem_active_dec, "CXL");
diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
index a9fd5cd5a0d2..2f03a4d5606e 100644
--- a/drivers/cxl/mem.c
+++ b/drivers/cxl/mem.c
@@ -252,7 +252,7 @@ module_cxl_driver(cxl_mem_driver);
 
 MODULE_DESCRIPTION("CXL: Memory Expansion");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
 MODULE_ALIAS_CXL(CXL_DEVICE_MEMORY_EXPANDER);
 /*
  * create_endpoint() wants to validate port driver attach immediately after
diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 188412d45e0d..ee38608190ab 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -1093,4 +1093,4 @@ module_init(cxl_pci_driver_init);
 module_exit(cxl_pci_driver_exit);
 MODULE_DESCRIPTION("CXL: PCI manageability");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
diff --git a/drivers/cxl/pmem.c b/drivers/cxl/pmem.c
index d2d43a4fc053..f9c95996e937 100644
--- a/drivers/cxl/pmem.c
+++ b/drivers/cxl/pmem.c
@@ -459,7 +459,7 @@ MODULE_DESCRIPTION("CXL PMEM: Persistent Memory Support");
 MODULE_LICENSE("GPL v2");
 module_init(cxl_pmem_init);
 module_exit(cxl_pmem_exit);
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
 MODULE_ALIAS_CXL(CXL_DEVICE_NVDIMM_BRIDGE);
 MODULE_ALIAS_CXL(CXL_DEVICE_NVDIMM);
 MODULE_ALIAS_CXL(CXL_DEVICE_PMEM_REGION);
diff --git a/drivers/cxl/port.c b/drivers/cxl/port.c
index 9dc394295e1f..52bfb6645cdc 100644
--- a/drivers/cxl/port.c
+++ b/drivers/cxl/port.c
@@ -226,5 +226,5 @@ module_exit(cxl_port_exit);
 
 MODULE_DESCRIPTION("CXL: Port enumeration and services");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
 MODULE_ALIAS_CXL(CXL_DEVICE_PORT);
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 9b29e732b39a..13cd94d32ff7 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -46,4 +46,4 @@ MODULE_ALIAS_CXL(CXL_DEVICE_DAX_REGION);
 MODULE_DESCRIPTION("CXL DAX: direct access to CXL regions");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Intel Corporation");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..b516257cc8a6 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -702,7 +702,7 @@ struct dma_buf *dma_buf_export(const struct dma_buf_export_info *exp_info)
 	module_put(exp_info->owner);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_export, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_export, "DMA_BUF");
 
 /**
  * dma_buf_fd - returns a file descriptor for the given struct dma_buf
@@ -726,7 +726,7 @@ int dma_buf_fd(struct dma_buf *dmabuf, int flags)
 
 	return fd;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_fd, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_fd, "DMA_BUF");
 
 /**
  * dma_buf_get - returns the struct dma_buf related to an fd
@@ -752,7 +752,7 @@ struct dma_buf *dma_buf_get(int fd)
 
 	return file->private_data;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_get, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_get, "DMA_BUF");
 
 /**
  * dma_buf_put - decreases refcount of the buffer
@@ -771,7 +771,7 @@ void dma_buf_put(struct dma_buf *dmabuf)
 
 	fput(dmabuf->file);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_put, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_put, "DMA_BUF");
 
 static void mangle_sg_table(struct sg_table *sg_table)
 {
@@ -976,7 +976,7 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
 	dma_buf_detach(dmabuf, attach);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
 
 /**
  * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
@@ -991,7 +991,7 @@ struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
 {
 	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_attach, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
 
 static void __unmap_dma_buf(struct dma_buf_attachment *attach,
 			    struct sg_table *sg_table,
@@ -1035,7 +1035,7 @@ void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
 
 	kfree(attach);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_detach, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_detach, "DMA_BUF");
 
 /**
  * dma_buf_pin - Lock down the DMA-buf
@@ -1065,7 +1065,7 @@ int dma_buf_pin(struct dma_buf_attachment *attach)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_pin, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_pin, "DMA_BUF");
 
 /**
  * dma_buf_unpin - Unpin a DMA-buf
@@ -1086,7 +1086,7 @@ void dma_buf_unpin(struct dma_buf_attachment *attach)
 	if (dmabuf->ops->unpin)
 		dmabuf->ops->unpin(attach);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_unpin, "DMA_BUF");
 
 /**
  * dma_buf_map_attachment - Returns the scatterlist table of the attachment;
@@ -1174,7 +1174,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
 #endif /* CONFIG_DMA_API_DEBUG */
 	return sg_table;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment, "DMA_BUF");
 
 /**
  * dma_buf_map_attachment_unlocked - Returns the scatterlist table of the attachment;
@@ -1202,7 +1202,7 @@ dma_buf_map_attachment_unlocked(struct dma_buf_attachment *attach,
 
 	return sg_table;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_map_attachment_unlocked, "DMA_BUF");
 
 /**
  * dma_buf_unmap_attachment - unmaps and decreases usecount of the buffer;might
@@ -1234,7 +1234,7 @@ void dma_buf_unmap_attachment(struct dma_buf_attachment *attach,
 	    !IS_ENABLED(CONFIG_DMABUF_MOVE_NOTIFY))
 		dma_buf_unpin(attach);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment, "DMA_BUF");
 
 /**
  * dma_buf_unmap_attachment_unlocked - unmaps and decreases usecount of the buffer;might
@@ -1259,7 +1259,7 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
 	dma_buf_unmap_attachment(attach, sg_table, direction);
 	dma_resv_unlock(attach->dmabuf->resv);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
 
 /**
  * dma_buf_move_notify - notify attachments that DMA-buf is moving
@@ -1279,7 +1279,7 @@ void dma_buf_move_notify(struct dma_buf *dmabuf)
 		if (attach->importer_ops)
 			attach->importer_ops->move_notify(attach);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_move_notify, "DMA_BUF");
 
 /**
  * DOC: cpu access
@@ -1424,7 +1424,7 @@ int dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_begin_cpu_access, "DMA_BUF");
 
 /**
  * dma_buf_end_cpu_access - Must be called after accessing a dma_buf from the
@@ -1452,7 +1452,7 @@ int dma_buf_end_cpu_access(struct dma_buf *dmabuf,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_end_cpu_access, "DMA_BUF");
 
 
 /**
@@ -1494,7 +1494,7 @@ int dma_buf_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma,
 
 	return dmabuf->ops->mmap(dmabuf, vma);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_mmap, "DMA_BUF");
 
 /**
  * dma_buf_vmap - Create virtual mapping for the buffer object into kernel
@@ -1547,7 +1547,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosys_map *map)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap, "DMA_BUF");
 
 /**
  * dma_buf_vmap_unlocked - Create virtual mapping for the buffer object into kernel
@@ -1574,7 +1574,7 @@ int dma_buf_vmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vmap_unlocked, "DMA_BUF");
 
 /**
  * dma_buf_vunmap - Unmap a vmap obtained by dma_buf_vmap.
@@ -1598,7 +1598,7 @@ void dma_buf_vunmap(struct dma_buf *dmabuf, struct iosys_map *map)
 		iosys_map_clear(&dmabuf->vmap_ptr);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap, "DMA_BUF");
 
 /**
  * dma_buf_vunmap_unlocked - Unmap a vmap obtained by dma_buf_vmap.
@@ -1614,7 +1614,7 @@ void dma_buf_vunmap_unlocked(struct dma_buf *dmabuf, struct iosys_map *map)
 	dma_buf_vunmap(dmabuf, map);
 	dma_resv_unlock(dmabuf->resv);
 }
-EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, DMA_BUF);
+EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, "DMA_BUF");
 
 #ifdef CONFIG_DEBUG_FS
 static int dma_buf_debug_show(struct seq_file *s, void *unused)
diff --git a/drivers/dma/idxd/compat.c b/drivers/dma/idxd/compat.c
index a4adb0c17995..eff9943f1a42 100644
--- a/drivers/dma/idxd/compat.c
+++ b/drivers/dma/idxd/compat.c
@@ -103,4 +103,4 @@ struct idxd_device_driver dsa_drv = {
 };
 
 module_idxd_driver(dsa_drv);
-MODULE_IMPORT_NS(IDXD);
+MODULE_IMPORT_NS("IDXD");
diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index c41ef195eeb9..5cf419fe6b46 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -161,7 +161,7 @@ int idxd_wq_alloc_resources(struct idxd_wq *wq)
 	free_hw_descs(wq);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(idxd_wq_alloc_resources, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_wq_alloc_resources, "IDXD");
 
 void idxd_wq_free_resources(struct idxd_wq *wq)
 {
@@ -175,7 +175,7 @@ void idxd_wq_free_resources(struct idxd_wq *wq)
 	dma_free_coherent(dev, wq->compls_size, wq->compls, wq->compls_addr);
 	sbitmap_queue_free(&wq->sbq);
 }
-EXPORT_SYMBOL_NS_GPL(idxd_wq_free_resources, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_wq_free_resources, "IDXD");
 
 int idxd_wq_enable(struct idxd_wq *wq)
 {
@@ -407,7 +407,7 @@ int idxd_wq_init_percpu_ref(struct idxd_wq *wq)
 	reinit_completion(&wq->wq_resurrect);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(idxd_wq_init_percpu_ref, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_wq_init_percpu_ref, "IDXD");
 
 void __idxd_wq_quiesce(struct idxd_wq *wq)
 {
@@ -417,7 +417,7 @@ void __idxd_wq_quiesce(struct idxd_wq *wq)
 	complete_all(&wq->wq_resurrect);
 	wait_for_completion(&wq->wq_dead);
 }
-EXPORT_SYMBOL_NS_GPL(__idxd_wq_quiesce, IDXD);
+EXPORT_SYMBOL_NS_GPL(__idxd_wq_quiesce, "IDXD");
 
 void idxd_wq_quiesce(struct idxd_wq *wq)
 {
@@ -425,7 +425,7 @@ void idxd_wq_quiesce(struct idxd_wq *wq)
 	__idxd_wq_quiesce(wq);
 	mutex_unlock(&wq->wq_lock);
 }
-EXPORT_SYMBOL_NS_GPL(idxd_wq_quiesce, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_wq_quiesce, "IDXD");
 
 /* Device control bits */
 static inline bool idxd_is_enabled(struct idxd_device *idxd)
@@ -1494,7 +1494,7 @@ int idxd_drv_enable_wq(struct idxd_wq *wq)
 err:
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(idxd_drv_enable_wq, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_drv_enable_wq, "IDXD");
 
 void idxd_drv_disable_wq(struct idxd_wq *wq)
 {
@@ -1516,7 +1516,7 @@ void idxd_drv_disable_wq(struct idxd_wq *wq)
 	wq->type = IDXD_WQT_NONE;
 	wq->client_count = 0;
 }
-EXPORT_SYMBOL_NS_GPL(idxd_drv_disable_wq, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_drv_disable_wq, "IDXD");
 
 int idxd_device_drv_probe(struct idxd_dev *idxd_dev)
 {
diff --git a/drivers/dma/idxd/init.c b/drivers/dma/idxd/init.c
index 234c1c658ec7..140f8d772bee 100644
--- a/drivers/dma/idxd/init.c
+++ b/drivers/dma/idxd/init.c
@@ -25,7 +25,7 @@ MODULE_VERSION(IDXD_DRIVER_VERSION);
 MODULE_DESCRIPTION("Intel Data Streaming Accelerator and In-Memory Analytics Accelerator common driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Intel Corporation");
-MODULE_IMPORT_NS(IDXD);
+MODULE_IMPORT_NS("IDXD");
 
 static bool sva = true;
 module_param(sva, bool, 0644);
diff --git a/drivers/dma/idxd/submit.c b/drivers/dma/idxd/submit.c
index 94eca25ae9b9..6db1c5fcedc5 100644
--- a/drivers/dma/idxd/submit.c
+++ b/drivers/dma/idxd/submit.c
@@ -61,7 +61,7 @@ struct idxd_desc *idxd_alloc_desc(struct idxd_wq *wq, enum idxd_op_type optype)
 
 	return __get_desc(wq, idx, cpu);
 }
-EXPORT_SYMBOL_NS_GPL(idxd_alloc_desc, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_alloc_desc, "IDXD");
 
 void idxd_free_desc(struct idxd_wq *wq, struct idxd_desc *desc)
 {
@@ -70,7 +70,7 @@ void idxd_free_desc(struct idxd_wq *wq, struct idxd_desc *desc)
 	desc->cpu = -1;
 	sbitmap_queue_clear(&wq->sbq, desc->id, cpu);
 }
-EXPORT_SYMBOL_NS_GPL(idxd_free_desc, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_free_desc, "IDXD");
 
 static struct idxd_desc *list_abort_desc(struct idxd_wq *wq, struct idxd_irq_entry *ie,
 					 struct idxd_desc *desc)
@@ -219,4 +219,4 @@ int idxd_submit_desc(struct idxd_wq *wq, struct idxd_desc *desc)
 	percpu_ref_put(&wq->wq_active);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(idxd_submit_desc, IDXD);
+EXPORT_SYMBOL_NS_GPL(idxd_submit_desc, "IDXD");
diff --git a/drivers/firmware/cirrus/cs_dsp.c b/drivers/firmware/cirrus/cs_dsp.c
index 419220fa42fd..5365e9a43000 100644
--- a/drivers/firmware/cirrus/cs_dsp.c
+++ b/drivers/firmware/cirrus/cs_dsp.c
@@ -378,7 +378,7 @@ const char *cs_dsp_mem_region_name(unsigned int type)
 		return NULL;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_mem_region_name, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_mem_region_name, "FW_CS_DSP");
 
 #ifdef CONFIG_DEBUG_FS
 static void cs_dsp_debugfs_save_wmfwname(struct cs_dsp *dsp, const char *s)
@@ -519,7 +519,7 @@ void cs_dsp_init_debugfs(struct cs_dsp *dsp, struct dentry *debugfs_root)
 
 	dsp->debugfs_root = root;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_init_debugfs, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_init_debugfs, "FW_CS_DSP");
 
 /**
  * cs_dsp_cleanup_debugfs() - Removes DSP representation from debugfs
@@ -531,17 +531,17 @@ void cs_dsp_cleanup_debugfs(struct cs_dsp *dsp)
 	debugfs_remove_recursive(dsp->debugfs_root);
 	dsp->debugfs_root = ERR_PTR(-ENODEV);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_cleanup_debugfs, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_cleanup_debugfs, "FW_CS_DSP");
 #else
 void cs_dsp_init_debugfs(struct cs_dsp *dsp, struct dentry *debugfs_root)
 {
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_init_debugfs, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_init_debugfs, "FW_CS_DSP");
 
 void cs_dsp_cleanup_debugfs(struct cs_dsp *dsp)
 {
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_cleanup_debugfs, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_cleanup_debugfs, "FW_CS_DSP");
 
 static inline void cs_dsp_debugfs_save_wmfwname(struct cs_dsp *dsp,
 						const char *s)
@@ -749,7 +749,7 @@ int cs_dsp_coeff_write_acked_control(struct cs_dsp_coeff_ctl *ctl, unsigned int
 
 	return -ETIMEDOUT;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_write_acked_control, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_write_acked_control, "FW_CS_DSP");
 
 static int cs_dsp_coeff_write_ctrl_raw(struct cs_dsp_coeff_ctl *ctl,
 				       unsigned int off, const void *buf, size_t len)
@@ -827,7 +827,7 @@ int cs_dsp_coeff_write_ctrl(struct cs_dsp_coeff_ctl *ctl,
 
 	return 1;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_write_ctrl, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_write_ctrl, "FW_CS_DSP");
 
 /**
  * cs_dsp_coeff_lock_and_write_ctrl() - Writes the given buffer to the given coefficient control
@@ -926,7 +926,7 @@ int cs_dsp_coeff_read_ctrl(struct cs_dsp_coeff_ctl *ctl,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_read_ctrl, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_coeff_read_ctrl, "FW_CS_DSP");
 
 /**
  * cs_dsp_coeff_lock_and_read_ctrl() - Reads the given coefficient control into the given buffer
@@ -1679,7 +1679,7 @@ struct cs_dsp_coeff_ctl *cs_dsp_get_ctl(struct cs_dsp *dsp, const char *name, in
 
 	return rslt;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_get_ctl, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_get_ctl, "FW_CS_DSP");
 
 static void cs_dsp_ctl_fixup_base(struct cs_dsp *dsp,
 				  const struct cs_dsp_alg_region *alg_region)
@@ -1769,7 +1769,7 @@ struct cs_dsp_alg_region *cs_dsp_find_alg_region(struct cs_dsp *dsp,
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_find_alg_region, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_find_alg_region, "FW_CS_DSP");
 
 static struct cs_dsp_alg_region *cs_dsp_create_region(struct cs_dsp *dsp,
 						      int type, __be32 id,
@@ -2404,7 +2404,7 @@ int cs_dsp_adsp1_init(struct cs_dsp *dsp)
 
 	return cs_dsp_common_init(dsp);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_init, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_init, "FW_CS_DSP");
 
 /**
  * cs_dsp_adsp1_power_up() - Load and start the named firmware
@@ -2496,7 +2496,7 @@ int cs_dsp_adsp1_power_up(struct cs_dsp *dsp,
 	mutex_unlock(&dsp->pwr_lock);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_power_up, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_power_up, "FW_CS_DSP");
 
 /**
  * cs_dsp_adsp1_power_down() - Halts the DSP
@@ -2528,7 +2528,7 @@ void cs_dsp_adsp1_power_down(struct cs_dsp *dsp)
 
 	mutex_unlock(&dsp->pwr_lock);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_power_down, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp1_power_down, "FW_CS_DSP");
 
 static int cs_dsp_adsp2v2_enable_core(struct cs_dsp *dsp)
 {
@@ -2680,7 +2680,7 @@ int cs_dsp_set_dspclk(struct cs_dsp *dsp, unsigned int freq)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_set_dspclk, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_set_dspclk, "FW_CS_DSP");
 
 static void cs_dsp_stop_watchdog(struct cs_dsp *dsp)
 {
@@ -2770,7 +2770,7 @@ int cs_dsp_power_up(struct cs_dsp *dsp,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_power_up, "FW_CS_DSP");
 
 /**
  * cs_dsp_power_down() - Powers-down the DSP
@@ -2804,7 +2804,7 @@ void cs_dsp_power_down(struct cs_dsp *dsp)
 
 	cs_dsp_dbg(dsp, "Shutdown complete\n");
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_power_down, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_power_down, "FW_CS_DSP");
 
 static int cs_dsp_adsp2_start_core(struct cs_dsp *dsp)
 {
@@ -2890,7 +2890,7 @@ int cs_dsp_run(struct cs_dsp *dsp)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_run, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_run, "FW_CS_DSP");
 
 /**
  * cs_dsp_stop() - Stops the firmware
@@ -2929,7 +2929,7 @@ void cs_dsp_stop(struct cs_dsp *dsp)
 
 	cs_dsp_dbg(dsp, "Execution stopped\n");
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_stop, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_stop, "FW_CS_DSP");
 
 static int cs_dsp_halo_start_core(struct cs_dsp *dsp)
 {
@@ -2991,7 +2991,7 @@ int cs_dsp_adsp2_init(struct cs_dsp *dsp)
 
 	return cs_dsp_common_init(dsp);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp2_init, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp2_init, "FW_CS_DSP");
 
 /**
  * cs_dsp_halo_init() - Initialise a cs_dsp structure representing a HALO Core DSP
@@ -3008,7 +3008,7 @@ int cs_dsp_halo_init(struct cs_dsp *dsp)
 
 	return cs_dsp_common_init(dsp);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_init, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_init, "FW_CS_DSP");
 
 /**
  * cs_dsp_remove() - Clean a cs_dsp before deletion
@@ -3028,7 +3028,7 @@ void cs_dsp_remove(struct cs_dsp *dsp)
 		cs_dsp_free_ctl_blk(ctl);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_remove, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_remove, "FW_CS_DSP");
 
 /**
  * cs_dsp_read_raw_data_block() - Reads a block of data from DSP memory
@@ -3065,7 +3065,7 @@ int cs_dsp_read_raw_data_block(struct cs_dsp *dsp, int mem_type, unsigned int me
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_read_raw_data_block, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_read_raw_data_block, "FW_CS_DSP");
 
 /**
  * cs_dsp_read_data_word() - Reads a word from DSP memory
@@ -3089,7 +3089,7 @@ int cs_dsp_read_data_word(struct cs_dsp *dsp, int mem_type, unsigned int mem_add
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_read_data_word, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_read_data_word, "FW_CS_DSP");
 
 /**
  * cs_dsp_write_data_word() - Writes a word to DSP memory
@@ -3115,7 +3115,7 @@ int cs_dsp_write_data_word(struct cs_dsp *dsp, int mem_type, unsigned int mem_ad
 
 	return regmap_raw_write(dsp->regmap, reg, &val, sizeof(val));
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_write_data_word, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_write_data_word, "FW_CS_DSP");
 
 /**
  * cs_dsp_remove_padding() - Convert unpacked words to packed bytes
@@ -3139,7 +3139,7 @@ void cs_dsp_remove_padding(u32 *buf, int nwords)
 		*pack_out++ = (u8)(word >> 16);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_remove_padding, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_remove_padding, "FW_CS_DSP");
 
 /**
  * cs_dsp_adsp2_bus_error() - Handle a DSP bus error interrupt
@@ -3209,7 +3209,7 @@ void cs_dsp_adsp2_bus_error(struct cs_dsp *dsp)
 error:
 	mutex_unlock(&dsp->pwr_lock);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp2_bus_error, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_adsp2_bus_error, "FW_CS_DSP");
 
 /**
  * cs_dsp_halo_bus_error() - Handle a DSP bus error interrupt
@@ -3269,7 +3269,7 @@ void cs_dsp_halo_bus_error(struct cs_dsp *dsp)
 exit_unlock:
 	mutex_unlock(&dsp->pwr_lock);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_bus_error, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_bus_error, "FW_CS_DSP");
 
 /**
  * cs_dsp_halo_wdt_expire() - Handle DSP watchdog expiry
@@ -3289,7 +3289,7 @@ void cs_dsp_halo_wdt_expire(struct cs_dsp *dsp)
 
 	mutex_unlock(&dsp->pwr_lock);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_wdt_expire, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_halo_wdt_expire, "FW_CS_DSP");
 
 static const struct cs_dsp_ops cs_dsp_adsp1_ops = {
 	.validate_version = cs_dsp_validate_version,
@@ -3419,7 +3419,7 @@ int cs_dsp_chunk_write(struct cs_dsp_chunk *ch, int nbits, u32 val)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_write, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_write, "FW_CS_DSP");
 
 /**
  * cs_dsp_chunk_flush() - Pad remaining data with zero and commit to chunk
@@ -3438,7 +3438,7 @@ int cs_dsp_chunk_flush(struct cs_dsp_chunk *ch)
 
 	return cs_dsp_chunk_write(ch, CS_DSP_DATA_WORD_BITS - ch->cachebits, 0);
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_flush, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_flush, "FW_CS_DSP");
 
 /**
  * cs_dsp_chunk_read() - Parse data from a DSP memory chunk
@@ -3480,7 +3480,7 @@ int cs_dsp_chunk_read(struct cs_dsp_chunk *ch, int nbits)
 
 	return result;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_read, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_chunk_read, "FW_CS_DSP");
 
 
 struct cs_dsp_wseq_op {
@@ -3605,7 +3605,7 @@ int cs_dsp_wseq_init(struct cs_dsp *dsp, struct cs_dsp_wseq *wseqs, unsigned int
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_init, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_init, "FW_CS_DSP");
 
 static struct cs_dsp_wseq_op *cs_dsp_wseq_find_op(u32 addr, u8 op_code,
 						  struct list_head *wseq_ops)
@@ -3720,7 +3720,7 @@ int cs_dsp_wseq_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_write, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_write, "FW_CS_DSP");
 
 /**
  * cs_dsp_wseq_multi_write() - Add or update multiple entries in a write sequence
@@ -3752,7 +3752,7 @@ int cs_dsp_wseq_multi_write(struct cs_dsp *dsp, struct cs_dsp_wseq *wseq,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, FW_CS_DSP);
+EXPORT_SYMBOL_NS_GPL(cs_dsp_wseq_multi_write, "FW_CS_DSP");
 
 MODULE_DESCRIPTION("Cirrus Logic DSP Support");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
diff --git a/drivers/firmware/efi/efi-pstore.c b/drivers/firmware/efi/efi-pstore.c
index 552c78f5f059..a253b6144945 100644
--- a/drivers/firmware/efi/efi-pstore.c
+++ b/drivers/firmware/efi/efi-pstore.c
@@ -6,7 +6,7 @@
 #include <linux/slab.h>
 #include <linux/ucs2_string.h>
 
-MODULE_IMPORT_NS(EFIVAR);
+MODULE_IMPORT_NS("EFIVAR");
 
 #define DUMP_NAME_LEN 66
 
diff --git a/drivers/firmware/efi/embedded-firmware.c b/drivers/firmware/efi/embedded-firmware.c
index f5be8e22305b..b49a09d7e665 100644
--- a/drivers/firmware/efi/embedded-firmware.c
+++ b/drivers/firmware/efi/embedded-firmware.c
@@ -16,9 +16,9 @@
 
 /* Exported for use by lib/test_firmware.c only */
 LIST_HEAD(efi_embedded_fw_list);
-EXPORT_SYMBOL_NS_GPL(efi_embedded_fw_list, TEST_FIRMWARE);
+EXPORT_SYMBOL_NS_GPL(efi_embedded_fw_list, "TEST_FIRMWARE");
 bool efi_embedded_fw_checked;
-EXPORT_SYMBOL_NS_GPL(efi_embedded_fw_checked, TEST_FIRMWARE);
+EXPORT_SYMBOL_NS_GPL(efi_embedded_fw_checked, "TEST_FIRMWARE");
 
 static const struct dmi_system_id * const embedded_fw_table[] = {
 #ifdef CONFIG_TOUCHSCREEN_DMI
diff --git a/drivers/firmware/efi/vars.c b/drivers/firmware/efi/vars.c
index 4056ba7f3440..3700e9869767 100644
--- a/drivers/firmware/efi/vars.c
+++ b/drivers/firmware/efi/vars.c
@@ -149,7 +149,7 @@ int efivar_lock(void)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(efivar_lock, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_lock, "EFIVAR");
 
 /*
  * efivar_lock() - obtain the efivar lock if it is free
@@ -165,7 +165,7 @@ int efivar_trylock(void)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(efivar_trylock, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_trylock, "EFIVAR");
 
 /*
  * efivar_unlock() - release the efivar lock
@@ -174,7 +174,7 @@ void efivar_unlock(void)
 {
 	up(&efivars_lock);
 }
-EXPORT_SYMBOL_NS_GPL(efivar_unlock, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_unlock, "EFIVAR");
 
 /*
  * efivar_get_variable() - retrieve a variable identified by name/vendor
@@ -186,7 +186,7 @@ efi_status_t efivar_get_variable(efi_char16_t *name, efi_guid_t *vendor,
 {
 	return __efivars->ops->get_variable(name, vendor, attr, size, data);
 }
-EXPORT_SYMBOL_NS_GPL(efivar_get_variable, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_get_variable, "EFIVAR");
 
 /*
  * efivar_get_next_variable() - enumerate the next name/vendor pair
@@ -198,7 +198,7 @@ efi_status_t efivar_get_next_variable(unsigned long *name_size,
 {
 	return __efivars->ops->get_next_variable(name_size, name, vendor);
 }
-EXPORT_SYMBOL_NS_GPL(efivar_get_next_variable, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_get_next_variable, "EFIVAR");
 
 /*
  * efivar_set_variable_locked() - set a variable identified by name/vendor
@@ -230,7 +230,7 @@ efi_status_t efivar_set_variable_locked(efi_char16_t *name, efi_guid_t *vendor,
 
 	return setvar(name, vendor, attr, data_size, data);
 }
-EXPORT_SYMBOL_NS_GPL(efivar_set_variable_locked, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_set_variable_locked, "EFIVAR");
 
 /*
  * efivar_set_variable() - set a variable identified by name/vendor
@@ -252,7 +252,7 @@ efi_status_t efivar_set_variable(efi_char16_t *name, efi_guid_t *vendor,
 	efivar_unlock();
 	return status;
 }
-EXPORT_SYMBOL_NS_GPL(efivar_set_variable, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_set_variable, "EFIVAR");
 
 efi_status_t efivar_query_variable_info(u32 attr,
 					u64 *storage_space,
@@ -264,4 +264,4 @@ efi_status_t efivar_query_variable_info(u32 attr,
 	return __efivars->ops->query_variable_info(attr, storage_space,
 			remaining_space, max_variable_size);
 }
-EXPORT_SYMBOL_NS_GPL(efivar_query_variable_info, EFIVAR);
+EXPORT_SYMBOL_NS_GPL(efivar_query_variable_info, "EFIVAR");
diff --git a/drivers/fpga/intel-m10-bmc-sec-update.c b/drivers/fpga/intel-m10-bmc-sec-update.c
index 7ac9f9f5af12..452a19a2da83 100644
--- a/drivers/fpga/intel-m10-bmc-sec-update.c
+++ b/drivers/fpga/intel-m10-bmc-sec-update.c
@@ -771,4 +771,4 @@ module_platform_driver(intel_m10bmc_sec_driver);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel MAX10 BMC Secure Update");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(INTEL_M10_BMC_CORE);
+MODULE_IMPORT_NS("INTEL_M10_BMC_CORE");
diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 4df9becaf349..cf5a50102d49 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -22,7 +22,7 @@
 
 #include "gpio-i8255.h"
 
-MODULE_IMPORT_NS(I8255);
+MODULE_IMPORT_NS("I8255");
 
 #define DIO48E_EXTENT 16
 #define MAX_NUM_DIO48E max_num_isa_dev(DIO48E_EXTENT)
@@ -339,4 +339,4 @@ module_isa_driver_with_irq(dio48e_driver, num_dio48e, num_irq);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES 104-DIO-48E GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(I8254);
+MODULE_IMPORT_NS("I8254");
diff --git a/drivers/gpio/gpio-104-idio-16.c b/drivers/gpio/gpio-104-idio-16.c
index f03ccd0f534c..ffe7e1cb6b23 100644
--- a/drivers/gpio/gpio-104-idio-16.c
+++ b/drivers/gpio/gpio-104-idio-16.c
@@ -126,4 +126,4 @@ module_isa_driver_with_irq(idio_16_driver, num_idio_16, num_irq);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES 104-IDIO-16 GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(GPIO_IDIO_16);
+MODULE_IMPORT_NS("GPIO_IDIO_16");
diff --git a/drivers/gpio/gpio-elkhartlake.c b/drivers/gpio/gpio-elkhartlake.c
index 887c0fe99d39..95de52d2cc63 100644
--- a/drivers/gpio/gpio-elkhartlake.c
+++ b/drivers/gpio/gpio-elkhartlake.c
@@ -75,4 +75,4 @@ MODULE_AUTHOR("Pandith N <pandith.n@intel.com>");
 MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
 MODULE_DESCRIPTION("Intel Elkhart Lake PSE GPIO driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(GPIO_TANGIER);
+MODULE_IMPORT_NS("GPIO_TANGIER");
diff --git a/drivers/gpio/gpio-gpio-mm.c b/drivers/gpio/gpio-gpio-mm.c
index 43d823a56e59..fb7c510bf2fa 100644
--- a/drivers/gpio/gpio-gpio-mm.c
+++ b/drivers/gpio/gpio-gpio-mm.c
@@ -18,7 +18,7 @@
 
 #include "gpio-i8255.h"
 
-MODULE_IMPORT_NS(I8255);
+MODULE_IMPORT_NS("I8255");
 
 #define GPIOMM_EXTENT 8
 #define MAX_NUM_GPIOMM max_num_isa_dev(GPIOMM_EXTENT)
diff --git a/drivers/gpio/gpio-i8255.c b/drivers/gpio/gpio-i8255.c
index 64ab80fc4a1e..953018bfa2b1 100644
--- a/drivers/gpio/gpio-i8255.c
+++ b/drivers/gpio/gpio-i8255.c
@@ -134,7 +134,7 @@ int devm_i8255_regmap_register(struct device *const dev,
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
 }
-EXPORT_SYMBOL_NS_GPL(devm_i8255_regmap_register, I8255);
+EXPORT_SYMBOL_NS_GPL(devm_i8255_regmap_register, "I8255");
 
 MODULE_AUTHOR("William Breathitt Gray");
 MODULE_DESCRIPTION("Intel 8255 Programmable Peripheral Interface");
diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index dfec9fbfc7a9..6c825a23b651 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -491,4 +491,4 @@ MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-GPIO driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LJCA);
+MODULE_IMPORT_NS("LJCA");
diff --git a/drivers/gpio/gpio-menz127.c b/drivers/gpio/gpio-menz127.c
index a035a9bcb57c..b9b3443800fd 100644
--- a/drivers/gpio/gpio-menz127.c
+++ b/drivers/gpio/gpio-menz127.c
@@ -211,4 +211,4 @@ MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
 MODULE_DESCRIPTION("MEN 16z127 GPIO Controller");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mcb:16z127");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/gpio/gpio-merrifield.c b/drivers/gpio/gpio-merrifield.c
index 421d7e3a6c66..3a8e0aebe683 100644
--- a/drivers/gpio/gpio-merrifield.c
+++ b/drivers/gpio/gpio-merrifield.c
@@ -141,4 +141,4 @@ module_pci_driver(mrfld_gpio_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Merrifield SoC GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(GPIO_TANGIER);
+MODULE_IMPORT_NS("GPIO_TANGIER");
diff --git a/drivers/gpio/gpio-pci-idio-16.c b/drivers/gpio/gpio-pci-idio-16.c
index 44c0a21b1d1d..31db1b7bc245 100644
--- a/drivers/gpio/gpio-pci-idio-16.c
+++ b/drivers/gpio/gpio-pci-idio-16.c
@@ -119,4 +119,4 @@ module_pci_driver(idio_16_driver);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("ACCES PCI-IDIO-16 GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(GPIO_IDIO_16);
+MODULE_IMPORT_NS("GPIO_IDIO_16");
diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index 4b29abafecf6..a415e6d36173 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -459,7 +459,7 @@ int devm_tng_gpio_probe(struct device *dev, struct tng_gpio *gpio)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(devm_tng_gpio_probe, GPIO_TANGIER);
+EXPORT_SYMBOL_NS_GPL(devm_tng_gpio_probe, "GPIO_TANGIER");
 
 static int tng_gpio_suspend(struct device *dev)
 {
diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 51d2475c05c5..f21dbc28cf2c 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -141,7 +141,7 @@ int swnode_gpio_count(const struct fwnode_handle *fwnode, const char *con_id)
 const struct software_node swnode_gpio_undefined = {
 	.name = GPIOLIB_SWNODE_UNDEFINED_NAME,
 };
-EXPORT_SYMBOL_NS_GPL(swnode_gpio_undefined, GPIO_SWNODE);
+EXPORT_SYMBOL_NS_GPL(swnode_gpio_undefined, "GPIO_SWNODE");
 
 static int __init swnode_gpio_init(void)
 {
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 74adb983ab03..d662acc54904 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -61,7 +61,7 @@
 #include "amdgpu_res_cursor.h"
 #include "bif/bif_4_1_d.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 #define AMDGPU_TTM_VRAM_MAX_DW_READ	((size_t)128)
 
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 26d10065d534..1a1680d71486 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -15,7 +15,7 @@
 #include "armada_gem.h"
 #include "armada_ioctlP.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
 {
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 870b90b78bc4..16988d316a6d 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -600,5 +600,5 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 EXPORT_SYMBOL(drm_gem_dma_prime_import_sg_table_vmap);
 
 MODULE_DESCRIPTION("DRM DMA memory-management helpers");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
index 3bdb6ba37ff4..185534f56bab 100644
--- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
+++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
@@ -18,7 +18,7 @@
 
 #include "drm_internal.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 #define AFBC_HEADER_SIZE		16
 #define AFBC_TH_LAYOUT_ALIGNMENT	8
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 53c003983ad1..2a5d19dbe8df 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -22,7 +22,7 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 /**
  * DOC: overview
@@ -778,5 +778,5 @@ drm_gem_shmem_prime_import_sg_table(struct drm_device *dev,
 EXPORT_SYMBOL_GPL(drm_gem_shmem_prime_import_sg_table);
 
 MODULE_DESCRIPTION("DRM SHMEM memory-management helpers");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 0e3f8adf162f..32a8781cfd67 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -40,7 +40,7 @@
 
 #include "drm_internal.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 /**
  * DOC: overview and lifetime rules
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 3524b5811682..0480216ba54a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -10,7 +10,7 @@
 #include "etnaviv_drv.h"
 #include "etnaviv_gem.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 static struct lock_class_key etnaviv_prime_lock_class;
 
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 638ca96830e9..4787fee4696f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -18,7 +18,7 @@
 #include "exynos_drm_drv.h"
 #include "exynos_drm_gem.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 static int exynos_drm_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index 1df74f7aa3dc..9473050ac842 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -16,7 +16,7 @@
 #include "i915_gem_object.h"
 #include "i915_scatterlist.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 I915_SELFTEST_DECLARE(static bool force_different_devices;)
 
diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index ca0fb126b02d..b27ff77bfb50 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -53,8 +53,8 @@
 #include "intel_gvt.h"
 #include "gvt.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
-MODULE_IMPORT_NS(I915_GVT);
+MODULE_IMPORT_NS("DMA_BUF");
+MODULE_IMPORT_NS("I915_GVT");
 
 /* helper macros copied from vfio-pci */
 #define VFIO_PCI_OFFSET_SHIFT   40
diff --git a/drivers/gpu/drm/i915/intel_gvt.c b/drivers/gpu/drm/i915/intel_gvt.c
index 5a01d60e5186..a5383a2bc64b 100644
--- a/drivers/gpu/drm/i915/intel_gvt.c
+++ b/drivers/gpu/drm/i915/intel_gvt.c
@@ -204,7 +204,7 @@ int intel_gvt_set_ops(const struct intel_vgpu_ops *ops)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(intel_gvt_set_ops, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_gvt_set_ops, "I915_GVT");
 
 void intel_gvt_clear_ops(const struct intel_vgpu_ops *ops)
 {
@@ -222,7 +222,7 @@ void intel_gvt_clear_ops(const struct intel_vgpu_ops *ops)
 	intel_gvt_ops = NULL;
 	mutex_unlock(&intel_gvt_mutex);
 }
-EXPORT_SYMBOL_NS_GPL(intel_gvt_clear_ops, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_gvt_clear_ops, "I915_GVT");
 
 /**
  * intel_gvt_init - initialize GVT components
@@ -284,40 +284,40 @@ void intel_gvt_resume(struct drm_i915_private *dev_priv)
  * Exported here so that the exports only get created when GVT support is
  * actually enabled.
  */
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_alloc, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_create_shmem, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_init, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_ggtt_pin_ww, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_pin_map, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_object_set_to_cpu_domain, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(__i915_gem_object_flush_map, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(__i915_gem_object_set_pages, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_gtt_insert, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_prime_export, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_init, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_backoff, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_fini, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_ppgtt_create, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_request_add, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_request_create, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_request_wait, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_reserve_fence, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_unreserve_fence, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_vm_release, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(_i915_vma_move_to_active, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_context_create, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_ring_begin, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_alloc, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_create_shmem, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_init, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_ggtt_pin_ww, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_pin_map, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_object_set_to_cpu_domain, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(__i915_gem_object_flush_map, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(__i915_gem_object_set_pages, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_gtt_insert, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_prime_export, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_init, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_backoff, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_gem_ww_ctx_fini, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_ppgtt_create, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_request_add, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_request_create, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_request_wait, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_reserve_fence, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_unreserve_fence, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_vm_release, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(_i915_vma_move_to_active, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_context_create, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(__intel_context_do_pin, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(__intel_context_do_unpin, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_ring_begin, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_get, "I915_GVT");
 #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
-EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put, "I915_GVT");
 #endif
-EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(shmem_pin_map, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(__px_dma, I915_GVT);
-EXPORT_SYMBOL_NS_GPL(i915_fence_ops, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_runtime_pm_put_unchecked, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_for_reg, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_get, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(intel_uncore_forcewake_put, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(shmem_pin_map, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(shmem_unpin_map, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(__px_dma, "I915_GVT");
+EXPORT_SYMBOL_NS_GPL(i915_fence_ops, "I915_GVT");
diff --git a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
index 955c9a33212a..aa51f366626c 100644
--- a/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+++ b/drivers/gpu/drm/i915/intel_gvt_mmio_table.c
@@ -1308,4 +1308,4 @@ int intel_gvt_iterate_mmio_table(struct intel_gvt_mmio_table_iter *iter)
 err:
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(intel_gvt_iterate_mmio_table, I915_GVT);
+EXPORT_SYMBOL_NS_GPL(intel_gvt_iterate_mmio_table, "I915_GVT");
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 1a0cb7aa9cea..5098bd1d49e8 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1494,5 +1494,5 @@ module_platform_driver(pvr_driver);
 MODULE_AUTHOR("Imagination Technologies Ltd.");
 MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
diff --git a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
index 36f9ee4baad3..30cf1cdc1aa3 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c
@@ -11,7 +11,7 @@
 
 #include "omap_drv.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 /* -----------------------------------------------------------------------------
  * DMABUF Export
diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index f2ccab9c06d9..941a2eb44c57 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -123,4 +123,4 @@ module_i2c_driver(ssd130x_i2c_driver);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(DRM_SSD130X);
+MODULE_IMPORT_NS("DRM_SSD130X");
diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 84bfde31d172..08334be38694 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -192,4 +192,4 @@ module_spi_driver(ssd130x_spi_driver);
 MODULE_DESCRIPTION(DRIVER_DESC);
 MODULE_AUTHOR("Javier Martinez Canillas <javierm@redhat.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DRM_SSD130X);
+MODULE_IMPORT_NS("DRM_SSD130X");
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 6f51bcf774e2..466d83cfb7f0 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -208,7 +208,7 @@ const struct ssd130x_deviceinfo ssd130x_variants[] = {
 		.family_id = SSD133X_FAMILY,
 	}
 };
-EXPORT_SYMBOL_NS_GPL(ssd130x_variants, DRM_SSD130X);
+EXPORT_SYMBOL_NS_GPL(ssd130x_variants, "DRM_SSD130X");
 
 struct ssd130x_crtc_state {
 	struct drm_crtc_state base;
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index b4eb030ea961..b7b05c12b3a5 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -22,7 +22,7 @@
 #include "drm.h"
 #include "gem.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 static unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents)
 {
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 3353e97687d1..806badebc803 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -54,7 +54,7 @@
 #include <linux/module.h>
 #include <linux/hashtable.h>
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 #define VMW_TTM_OBJECT_REF_HT_ORDER 10
 
diff --git a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
index 5f14737c8210..0d36ab864ec0 100644
--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
@@ -18,4 +18,4 @@ kunit_test_suite(xe_mocs_test_suite);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe live kunit tests");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/drivers/gpu/drm/xe/tests/xe_test_mod.c b/drivers/gpu/drm/xe/tests/xe_test_mod.c
index 875f3e6f965e..93081bcf2ab0 100644
--- a/drivers/gpu/drm/xe/tests/xe_test_mod.c
+++ b/drivers/gpu/drm/xe/tests/xe_test_mod.c
@@ -7,4 +7,4 @@
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("xe kunit tests");
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/drivers/gpu/drm/xe/xe_dma_buf.c b/drivers/gpu/drm/xe/xe_dma_buf.c
index 68f309f5e981..c5b95470fa32 100644
--- a/drivers/gpu/drm/xe/xe_dma_buf.c
+++ b/drivers/gpu/drm/xe/xe_dma_buf.c
@@ -20,7 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vm.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 static int xe_dma_buf_attach(struct dma_buf *dmabuf,
 			     struct dma_buf_attachment *attach)
diff --git a/drivers/hid/hid-uclogic-rdesc-test.c b/drivers/hid/hid-uclogic-rdesc-test.c
index d6b18213f45f..066df622b6f2 100644
--- a/drivers/hid/hid-uclogic-rdesc-test.c
+++ b/drivers/hid/hid-uclogic-rdesc-test.c
@@ -9,7 +9,7 @@
 #include <kunit/test.h>
 #include "./hid-uclogic-rdesc.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 struct uclogic_template_case {
 	const char *name;
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 9c35c4d0369d..1298f315668d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1063,7 +1063,7 @@ hwmon_device_register_for_thermal(struct device *dev, const char *name,
 
 	return __hwmon_device_register(dev, name, drvdata, NULL, NULL);
 }
-EXPORT_SYMBOL_NS_GPL(hwmon_device_register_for_thermal, HWMON_THERMAL);
+EXPORT_SYMBOL_NS_GPL(hwmon_device_register_for_thermal, "HWMON_THERMAL");
 
 /**
  * hwmon_device_register - register w/ hwmon
diff --git a/drivers/hwmon/intel-m10-bmc-hwmon.c b/drivers/hwmon/intel-m10-bmc-hwmon.c
index 96397ae6ff18..6f2f9078768e 100644
--- a/drivers/hwmon/intel-m10-bmc-hwmon.c
+++ b/drivers/hwmon/intel-m10-bmc-hwmon.c
@@ -794,4 +794,4 @@ MODULE_DEVICE_TABLE(platform, intel_m10bmc_hwmon_ids);
 MODULE_AUTHOR("Intel Corporation");
 MODULE_DESCRIPTION("Intel MAX 10 BMC hardware monitor");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(INTEL_M10_BMC_CORE);
+MODULE_IMPORT_NS("INTEL_M10_BMC_CORE");
diff --git a/drivers/hwmon/nct6775-i2c.c b/drivers/hwmon/nct6775-i2c.c
index aff69fa50461..ba71d776a291 100644
--- a/drivers/hwmon/nct6775-i2c.c
+++ b/drivers/hwmon/nct6775-i2c.c
@@ -184,4 +184,4 @@ module_i2c_driver(nct6775_i2c_driver);
 MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
 MODULE_DESCRIPTION("I2C driver for NCT6775F and compatible chips");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(HWMON_NCT6775);
+MODULE_IMPORT_NS("HWMON_NCT6775");
diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 096f1daa8f2b..c4a1a4b02259 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1620,7 +1620,7 @@ static void __exit sensors_nct6775_platform_exit(void)
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("Platform driver for NCT6775F and compatible chips");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(HWMON_NCT6775);
+MODULE_IMPORT_NS("HWMON_NCT6775");
 
 module_init(sensors_nct6775_platform_init);
 module_exit(sensors_nct6775_platform_exit);
diff --git a/drivers/hwmon/peci/cputemp.c b/drivers/hwmon/peci/cputemp.c
index 5a682195b98f..c7112dbf008b 100644
--- a/drivers/hwmon/peci/cputemp.c
+++ b/drivers/hwmon/peci/cputemp.c
@@ -607,4 +607,4 @@ MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
 MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
 MODULE_DESCRIPTION("PECI cputemp driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PECI_CPU);
+MODULE_IMPORT_NS("PECI_CPU");
diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index 4a72e9712408..d6762259dd69 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -666,4 +666,4 @@ MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
 MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
 MODULE_DESCRIPTION("PECI dimmtemp driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PECI_CPU);
+MODULE_IMPORT_NS("PECI_CPU");
diff --git a/drivers/hwmon/pmbus/acbel-fsg032.c b/drivers/hwmon/pmbus/acbel-fsg032.c
index e0c55fd8f3a6..9f07fb4abaff 100644
--- a/drivers/hwmon/pmbus/acbel-fsg032.c
+++ b/drivers/hwmon/pmbus/acbel-fsg032.c
@@ -120,4 +120,4 @@ module_i2c_driver(acbel_fsg032_driver);
 MODULE_AUTHOR("Lakshmi Yadlapati");
 MODULE_DESCRIPTION("PMBus driver for AcBel Power System power supplies");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/adm1266.c b/drivers/hwmon/pmbus/adm1266.c
index 2c4d94cc8729..d90f8f80be8e 100644
--- a/drivers/hwmon/pmbus/adm1266.c
+++ b/drivers/hwmon/pmbus/adm1266.c
@@ -509,4 +509,4 @@ module_i2c_driver(adm1266_driver);
 MODULE_AUTHOR("Alexandru Tachici <alexandru.tachici@analog.com>");
 MODULE_DESCRIPTION("PMBus driver for Analog Devices ADM1266");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
index 59ffc08289bd..127593e10a03 100644
--- a/drivers/hwmon/pmbus/adm1275.c
+++ b/drivers/hwmon/pmbus/adm1275.c
@@ -866,4 +866,4 @@ module_i2c_driver(adm1275_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Analog Devices ADM1275 and compatibles");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/adp1050.c b/drivers/hwmon/pmbus/adp1050.c
index 20f22730fc01..ef46c880b168 100644
--- a/drivers/hwmon/pmbus/adp1050.c
+++ b/drivers/hwmon/pmbus/adp1050.c
@@ -53,4 +53,4 @@ module_i2c_driver(adp1050_driver);
 MODULE_AUTHOR("Radu Sabau <radu.sabau@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADP1050 HWMON PMBus Driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/bel-pfe.c b/drivers/hwmon/pmbus/bel-pfe.c
index 7c5f4b10a7c1..ddf9d9a2958c 100644
--- a/drivers/hwmon/pmbus/bel-pfe.c
+++ b/drivers/hwmon/pmbus/bel-pfe.c
@@ -129,4 +129,4 @@ module_i2c_driver(pfe_pmbus_driver);
 MODULE_AUTHOR("Tao Ren <rentao.bupt@gmail.com>");
 MODULE_DESCRIPTION("PMBus driver for BEL PFE Family Power Supplies");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/bpa-rs600.c b/drivers/hwmon/pmbus/bpa-rs600.c
index 0dce26c35556..6c3875ba37a0 100644
--- a/drivers/hwmon/pmbus/bpa-rs600.c
+++ b/drivers/hwmon/pmbus/bpa-rs600.c
@@ -205,4 +205,4 @@ module_i2c_driver(bpa_rs600_driver);
 MODULE_AUTHOR("Chris Packham");
 MODULE_DESCRIPTION("PMBus driver for BluTek BPA-RS600");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
index 4dd3b6686d6a..3850eaea75da 100644
--- a/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
+++ b/drivers/hwmon/pmbus/delta-ahe50dc-fan.c
@@ -127,4 +127,4 @@ module_i2c_driver(ahe50dc_fan_driver);
 MODULE_AUTHOR("Zev Weiss <zev@bewilderbeest.net>");
 MODULE_DESCRIPTION("Driver for Delta AHE-50DC power shelf fan control module");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index 04e0d598a6e5..cc5aac9dfdb3 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -203,4 +203,4 @@ module_i2c_driver(dps920ab_driver);
 MODULE_AUTHOR("Robert Marko <robert.marko@sartura.hr>");
 MODULE_DESCRIPTION("PMBus driver for Delta DPS920AB PSU");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/fsp-3y.c b/drivers/hwmon/pmbus/fsp-3y.c
index 72a7c261ef06..a4dc09e2ef75 100644
--- a/drivers/hwmon/pmbus/fsp-3y.c
+++ b/drivers/hwmon/pmbus/fsp-3y.c
@@ -291,4 +291,4 @@ module_i2c_driver(fsp3y_driver);
 MODULE_AUTHOR("Václav Kubernát");
 MODULE_DESCRIPTION("PMBus driver for FSP/3Y-Power power supplies");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
index 1ba4c5e95820..d05ef7a968a9 100644
--- a/drivers/hwmon/pmbus/ibm-cffps.c
+++ b/drivers/hwmon/pmbus/ibm-cffps.c
@@ -614,4 +614,4 @@ module_i2c_driver(ibm_cffps_driver);
 MODULE_AUTHOR("Eddie James");
 MODULE_DESCRIPTION("PMBus driver for IBM Common Form Factor power supplies");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/inspur-ipsps.c b/drivers/hwmon/pmbus/inspur-ipsps.c
index 3e3cc9a0f116..074e0f164ee1 100644
--- a/drivers/hwmon/pmbus/inspur-ipsps.c
+++ b/drivers/hwmon/pmbus/inspur-ipsps.c
@@ -224,4 +224,4 @@ module_i2c_driver(ipsps_driver);
 MODULE_AUTHOR("John Wang");
 MODULE_DESCRIPTION("PMBus driver for Inspur Power System power supplies");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index 503be59c6c7f..46d8f334d49a 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -145,4 +145,4 @@ module_i2c_driver(ir35221_driver);
 MODULE_AUTHOR("Samuel Mendoza-Jonas <sam@mendozajonas.com");
 MODULE_DESCRIPTION("PMBus driver for IR35221");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ir36021.c b/drivers/hwmon/pmbus/ir36021.c
index 5148c9187c9e..34ce15fc708b 100644
--- a/drivers/hwmon/pmbus/ir36021.c
+++ b/drivers/hwmon/pmbus/ir36021.c
@@ -76,4 +76,4 @@ module_i2c_driver(ir36021_driver);
 MODULE_AUTHOR("Chris Packham <chris.packham@alliedtelesis.co.nz>");
 MODULE_DESCRIPTION("PMBus driver for Infineon IR36021");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ir38064.c b/drivers/hwmon/pmbus/ir38064.c
index d4bcc9c39774..7b4188e8bf48 100644
--- a/drivers/hwmon/pmbus/ir38064.c
+++ b/drivers/hwmon/pmbus/ir38064.c
@@ -87,4 +87,4 @@ module_i2c_driver(ir38064_driver);
 MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon IR38064 and compatible chips");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/irps5401.c b/drivers/hwmon/pmbus/irps5401.c
index f0bdf55c95bf..43674c64841d 100644
--- a/drivers/hwmon/pmbus/irps5401.c
+++ b/drivers/hwmon/pmbus/irps5401.c
@@ -63,4 +63,4 @@ module_i2c_driver(irps5401_driver);
 MODULE_AUTHOR("Robert Hancock");
 MODULE_DESCRIPTION("PMBus driver for Infineon IRPS5401");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
index 7e53fb1d5ea3..ad854d9b57df 100644
--- a/drivers/hwmon/pmbus/isl68137.c
+++ b/drivers/hwmon/pmbus/isl68137.c
@@ -332,4 +332,4 @@ module_i2c_driver(isl68137_driver);
 MODULE_AUTHOR("Maxim Sloyko <maxims@google.com>");
 MODULE_DESCRIPTION("PMBus driver for Renesas digital multiphase voltage regulators");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
index c36c124d1a2d..40b0dda32ea6 100644
--- a/drivers/hwmon/pmbus/lm25066.c
+++ b/drivers/hwmon/pmbus/lm25066.c
@@ -569,4 +569,4 @@ module_i2c_driver(lm25066_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LM25066 and compatible chips");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/lt7182s.c b/drivers/hwmon/pmbus/lt7182s.c
index aebd97af2741..9d6d50f39bd6 100644
--- a/drivers/hwmon/pmbus/lt7182s.c
+++ b/drivers/hwmon/pmbus/lt7182s.c
@@ -192,4 +192,4 @@ module_i2c_driver(lt7182s_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Analog Devices LT7182S");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 73a86f4d6472..9239d29a2323 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -936,4 +936,4 @@ module_i2c_driver(ltc2978_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LTC2978 and compatible chips");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ltc3815.c b/drivers/hwmon/pmbus/ltc3815.c
index f58a8cedb0d7..824c16a75e2c 100644
--- a/drivers/hwmon/pmbus/ltc3815.c
+++ b/drivers/hwmon/pmbus/ltc3815.c
@@ -208,4 +208,4 @@ module_i2c_driver(ltc3815_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for LTC3815");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max15301.c b/drivers/hwmon/pmbus/max15301.c
index f5367a7bc0f5..50dfd477772f 100644
--- a/drivers/hwmon/pmbus/max15301.c
+++ b/drivers/hwmon/pmbus/max15301.c
@@ -97,4 +97,4 @@ module_i2c_driver(max15301_driver);
 MODULE_AUTHOR("Erik Rosen <erik.rosen@metormote.com>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX15301");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max16064.c b/drivers/hwmon/pmbus/max16064.c
index 98e2b5dd5841..eb84915c2a83 100644
--- a/drivers/hwmon/pmbus/max16064.c
+++ b/drivers/hwmon/pmbus/max16064.c
@@ -111,4 +111,4 @@ module_i2c_driver(max16064_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX16064");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
index 3ab219504600..d696e506aafb 100644
--- a/drivers/hwmon/pmbus/max16601.c
+++ b/drivers/hwmon/pmbus/max16601.c
@@ -366,4 +366,4 @@ module_i2c_driver(max16601_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX16601");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index d56ec24764fd..95869d198ecf 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -787,4 +787,4 @@ module_i2c_driver(max20730_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX20710 / MAX20730 / MAX20734 / MAX20743");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max20751.c b/drivers/hwmon/pmbus/max20751.c
index 8f23c1eb559e..ac8c43122133 100644
--- a/drivers/hwmon/pmbus/max20751.c
+++ b/drivers/hwmon/pmbus/max20751.c
@@ -51,4 +51,4 @@ module_i2c_driver(max20751_driver);
 MODULE_AUTHOR("Guenter Roeck <linux@roeck-us.net>");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX20751");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index 09218dba8965..1f94d38a1637 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -549,4 +549,4 @@ module_i2c_driver(max31785_driver);
 MODULE_AUTHOR("Andrew Jeffery <andrew@aj.id.au>");
 MODULE_DESCRIPTION("PMBus driver for the Maxim MAX31785");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
index fe7f6b1b0985..c9dda33831ff 100644
--- a/drivers/hwmon/pmbus/max34440.c
+++ b/drivers/hwmon/pmbus/max34440.c
@@ -529,4 +529,4 @@ module_i2c_driver(max34440_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX34440/MAX34441");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/max8688.c b/drivers/hwmon/pmbus/max8688.c
index 5d5b6aeefa80..b3a2a7492bbf 100644
--- a/drivers/hwmon/pmbus/max8688.c
+++ b/drivers/hwmon/pmbus/max8688.c
@@ -191,4 +191,4 @@ module_i2c_driver(max8688_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for Maxim MAX8688");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp2856.c b/drivers/hwmon/pmbus/mp2856.c
index 41bb86667091..e83c70a3583f 100644
--- a/drivers/hwmon/pmbus/mp2856.c
+++ b/drivers/hwmon/pmbus/mp2856.c
@@ -463,4 +463,4 @@ module_i2c_driver(mp2856_driver);
 MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2856/MP2857 device");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
index 3b45f126b611..772a623ca7d0 100644
--- a/drivers/hwmon/pmbus/mp2888.c
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -404,4 +404,4 @@ module_i2c_driver(mp2888_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2888 device");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp2891.c b/drivers/hwmon/pmbus/mp2891.c
index bb28b15a9103..8416e0599bfa 100644
--- a/drivers/hwmon/pmbus/mp2891.c
+++ b/drivers/hwmon/pmbus/mp2891.c
@@ -597,4 +597,4 @@ module_i2c_driver(mp2891_driver);
 MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2891");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index 280bb12f762c..c31982d85196 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -1101,4 +1101,4 @@ module_i2c_driver(mp2975_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2975 device");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp2993.c b/drivers/hwmon/pmbus/mp2993.c
index 944593e13231..15d2947816ac 100644
--- a/drivers/hwmon/pmbus/mp2993.c
+++ b/drivers/hwmon/pmbus/mp2993.c
@@ -258,4 +258,4 @@ module_i2c_driver(mp2993_driver);
 MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP2993");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp5023.c b/drivers/hwmon/pmbus/mp5023.c
index 21acb7fd9a1a..c466d67e9a8f 100644
--- a/drivers/hwmon/pmbus/mp5023.c
+++ b/drivers/hwmon/pmbus/mp5023.c
@@ -64,4 +64,4 @@ module_i2c_driver(mp5023_driver);
 MODULE_AUTHOR("Howard Chiu <howard.chiu@quantatw.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP5023 HSC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp5920.c b/drivers/hwmon/pmbus/mp5920.c
index f6d7527ade7d..319ae2721bcf 100644
--- a/drivers/hwmon/pmbus/mp5920.c
+++ b/drivers/hwmon/pmbus/mp5920.c
@@ -87,4 +87,4 @@ MODULE_AUTHOR("Tony Ao <tony_ao@wiwynn.com>");
 MODULE_AUTHOR("Alex Vdovydchenko <xzeol@yahoo.com>");
 MODULE_DESCRIPTION("PMBus driver for MP5920 HSC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp5990.c b/drivers/hwmon/pmbus/mp5990.c
index 5d1d5eac89da..4ce381a39480 100644
--- a/drivers/hwmon/pmbus/mp5990.c
+++ b/drivers/hwmon/pmbus/mp5990.c
@@ -176,4 +176,4 @@ module_i2c_driver(mp5990_driver);
 MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
 MODULE_DESCRIPTION("PMBus driver for MP5990 HSC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mp9941.c b/drivers/hwmon/pmbus/mp9941.c
index 543955cfce67..5073b2f6ad12 100644
--- a/drivers/hwmon/pmbus/mp9941.c
+++ b/drivers/hwmon/pmbus/mp9941.c
@@ -316,4 +316,4 @@ module_i2c_driver(mp9941_driver);
 MODULE_AUTHOR("Noah Wang <noahwang.wang@outlook.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MP9941");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mpq7932.c b/drivers/hwmon/pmbus/mpq7932.c
index 2dcb6da853bd..c1e2d0cb2fd0 100644
--- a/drivers/hwmon/pmbus/mpq7932.c
+++ b/drivers/hwmon/pmbus/mpq7932.c
@@ -164,4 +164,4 @@ module_i2c_driver(mpq7932_regulator_driver);
 MODULE_AUTHOR("Saravanan Sekar <saravanan@linumiz.com>");
 MODULE_DESCRIPTION("MPQ7932 PMIC regulator driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 7f87e117b49d..1a7ab1120ca7 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -87,4 +87,4 @@ module_i2c_driver(mpq8785_driver);
 MODULE_AUTHOR("Charles Hsu <ythsu0511@gmail.com>");
 MODULE_DESCRIPTION("PMBus driver for MPS MPQ8785");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/pim4328.c b/drivers/hwmon/pmbus/pim4328.c
index 31d9ae06379a..aa98284bbdd8 100644
--- a/drivers/hwmon/pmbus/pim4328.c
+++ b/drivers/hwmon/pmbus/pim4328.c
@@ -230,4 +230,4 @@ module_i2c_driver(pim4328_driver);
 MODULE_AUTHOR("Erik Rosen <erik.rosen@metormote.com>");
 MODULE_DESCRIPTION("PMBus driver for PIM4006, PIM4328, PIM4820 power interface modules");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/pli1209bc.c b/drivers/hwmon/pmbus/pli1209bc.c
index 178e0cdb7887..569b61dc1a32 100644
--- a/drivers/hwmon/pmbus/pli1209bc.c
+++ b/drivers/hwmon/pmbus/pli1209bc.c
@@ -145,4 +145,4 @@ module_i2c_driver(pli1209bc_driver);
 MODULE_AUTHOR("Marcello Sylvester Bauer <sylv@sylv.io>");
 MODULE_DESCRIPTION("PMBus driver for Vicor PLI1209BC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/pm6764tr.c b/drivers/hwmon/pmbus/pm6764tr.c
index 23f15b608dcf..c96c0aecb920 100644
--- a/drivers/hwmon/pmbus/pm6764tr.c
+++ b/drivers/hwmon/pmbus/pm6764tr.c
@@ -73,4 +73,4 @@ module_i2c_driver(pm6764tr_driver);
 MODULE_AUTHOR("Charles Hsu");
 MODULE_DESCRIPTION("PMBus driver for  ST PM6764TR");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index ec40c5c59954..77cf268e7d2d 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -261,4 +261,4 @@ module_i2c_driver(pmbus_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("Generic PMBus driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ce7fd4ca9d89..462e681c4cac 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -150,7 +150,7 @@ void pmbus_clear_cache(struct i2c_client *client)
 	for (sensor = data->sensors; sensor; sensor = sensor->next)
 		sensor->data = -ENODATA;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_clear_cache, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_cache, "PMBUS");
 
 void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 {
@@ -161,7 +161,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 		if (sensor->reg == reg)
 			sensor->update = update;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_set_update, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 
 /* Some chips need a delay between accesses. */
 static void pmbus_wait(struct i2c_client *client)
@@ -236,7 +236,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_set_page, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_set_page, "PMBUS");
 
 int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 {
@@ -252,7 +252,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_write_byte, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte, "PMBUS");
 
 /*
  * _pmbus_write_byte() is similar to pmbus_write_byte(), but checks if
@@ -287,7 +287,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_word_data, "PMBUS");
 
 
 static int pmbus_write_virt_reg(struct i2c_client *client, int page, int reg,
@@ -393,7 +393,7 @@ int pmbus_update_fan(struct i2c_client *client, int page, int id,
 	return _pmbus_write_word_data(client, page,
 				      pmbus_fan_command_registers[id], command);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_update_fan, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_fan, "PMBUS");
 
 int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 {
@@ -409,7 +409,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_read_word_data, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_word_data, "PMBUS");
 
 static int pmbus_read_virt_reg(struct i2c_client *client, int page, int reg)
 {
@@ -472,7 +472,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_read_byte_data, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_read_byte_data, "PMBUS");
 
 int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 {
@@ -488,7 +488,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_write_byte_data, "PMBUS");
 
 int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 			   u8 mask, u8 value)
@@ -507,7 +507,7 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 
 	return rv;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_update_byte_data, "PMBUS");
 
 static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 				 char *data_buf)
@@ -578,14 +578,14 @@ int pmbus_get_fan_rate_device(struct i2c_client *client, int page, int id,
 {
 	return pmbus_get_fan_rate(client, page, id, mode, false);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_device, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_device, "PMBUS");
 
 int pmbus_get_fan_rate_cached(struct i2c_client *client, int page, int id,
 			      enum pmbus_fan_mode mode)
 {
 	return pmbus_get_fan_rate(client, page, id, mode, true);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_cached, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_fan_rate_cached, "PMBUS");
 
 static void pmbus_clear_fault_page(struct i2c_client *client, int page)
 {
@@ -600,7 +600,7 @@ void pmbus_clear_faults(struct i2c_client *client)
 	for (i = 0; i < data->info->pages; i++)
 		pmbus_clear_fault_page(client, i);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_clear_faults, "PMBUS");
 
 static int pmbus_check_status_cml(struct i2c_client *client)
 {
@@ -655,13 +655,13 @@ bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, _pmbus_read_byte_data, page, reg);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_check_byte_register, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_byte_register, "PMBUS");
 
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg)
 {
 	return pmbus_check_register(client, __pmbus_read_word_data, page, reg);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_check_word_register, "PMBUS");
 
 static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 						      int page, int reg)
@@ -685,7 +685,7 @@ const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client *client)
 
 	return data->info;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_driver_info, "PMBUS");
 
 static int pmbus_get_status(struct i2c_client *client, int page, int reg)
 {
@@ -3219,7 +3219,7 @@ const struct regulator_ops pmbus_regulator_ops = {
 	.set_voltage = pmbus_regulator_set_voltage,
 	.list_voltage = pmbus_regulator_list_voltage,
 };
-EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_regulator_ops, "PMBUS");
 
 static int pmbus_regulator_register(struct pmbus_data *data)
 {
@@ -3735,7 +3735,7 @@ int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_do_probe, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_do_probe, "PMBUS");
 
 struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 {
@@ -3743,7 +3743,7 @@ struct dentry *pmbus_get_debugfs_dir(struct i2c_client *client)
 
 	return data->debugfs;
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_get_debugfs_dir, "PMBUS");
 
 int pmbus_lock_interruptible(struct i2c_client *client)
 {
@@ -3751,7 +3751,7 @@ int pmbus_lock_interruptible(struct i2c_client *client)
 
 	return mutex_lock_interruptible(&data->update_lock);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_lock_interruptible, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_lock_interruptible, "PMBUS");
 
 void pmbus_unlock(struct i2c_client *client)
 {
@@ -3759,7 +3759,7 @@ void pmbus_unlock(struct i2c_client *client)
 
 	mutex_unlock(&data->update_lock);
 }
-EXPORT_SYMBOL_NS_GPL(pmbus_unlock, PMBUS);
+EXPORT_SYMBOL_NS_GPL(pmbus_unlock, "PMBUS");
 
 static int __init pmbus_core_init(void)
 {
diff --git a/drivers/hwmon/pmbus/pxe1610.c b/drivers/hwmon/pmbus/pxe1610.c
index 5ac476d3cdd2..6a4a978eca7e 100644
--- a/drivers/hwmon/pmbus/pxe1610.c
+++ b/drivers/hwmon/pmbus/pxe1610.c
@@ -148,4 +148,4 @@ module_i2c_driver(pxe1610_driver);
 MODULE_AUTHOR("Vijay Khemka <vijaykhemka@fb.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon PXE1610, PXE1110 and PXM1310");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/q54sj108a2.c b/drivers/hwmon/pmbus/q54sj108a2.c
index a235c1cdf4fe..4d7086d83aa3 100644
--- a/drivers/hwmon/pmbus/q54sj108a2.c
+++ b/drivers/hwmon/pmbus/q54sj108a2.c
@@ -421,4 +421,4 @@ module_i2c_driver(q54sj108a2_driver);
 MODULE_AUTHOR("Xiao.Ma <xiao.mx.ma@deltaww.com>");
 MODULE_DESCRIPTION("PMBus driver for Delta Q54SJ108A2 series modules");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/stpddc60.c b/drivers/hwmon/pmbus/stpddc60.c
index 34d0f06f4845..5cb905ed8ae5 100644
--- a/drivers/hwmon/pmbus/stpddc60.c
+++ b/drivers/hwmon/pmbus/stpddc60.c
@@ -246,4 +246,4 @@ module_i2c_driver(stpddc60_driver);
 MODULE_AUTHOR("Erik Rosen <erik.rosen@metormote.com>");
 MODULE_DESCRIPTION("PMBus driver for ST STPDDC60");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/tda38640.c b/drivers/hwmon/pmbus/tda38640.c
index 044d5fbdf9eb..07fe58c24485 100644
--- a/drivers/hwmon/pmbus/tda38640.c
+++ b/drivers/hwmon/pmbus/tda38640.c
@@ -221,4 +221,4 @@ module_i2c_driver(tda38640_driver);
 MODULE_AUTHOR("Patrick Rudolph <patrick.rudolph@9elements.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon TDA38640");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/tps40422.c b/drivers/hwmon/pmbus/tps40422.c
index d99b9850ea36..7c9fedaa068c 100644
--- a/drivers/hwmon/pmbus/tps40422.c
+++ b/drivers/hwmon/pmbus/tps40422.c
@@ -51,4 +51,4 @@ module_i2c_driver(tps40422_driver);
 MODULE_AUTHOR("Zhu Laiwen <richard.zhu@nsn.com>");
 MODULE_DESCRIPTION("PMBus driver for TI TPS40422");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
index 5c9466244d70..63524dff5e75 100644
--- a/drivers/hwmon/pmbus/tps53679.c
+++ b/drivers/hwmon/pmbus/tps53679.c
@@ -308,4 +308,4 @@ module_i2c_driver(tps53679_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
 MODULE_DESCRIPTION("PMBus driver for Texas Instruments TPS53679");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/tps546d24.c b/drivers/hwmon/pmbus/tps546d24.c
index 520ca37269f7..44d7a6df1dbd 100644
--- a/drivers/hwmon/pmbus/tps546d24.c
+++ b/drivers/hwmon/pmbus/tps546d24.c
@@ -68,4 +68,4 @@ module_i2c_driver(tps546d24_driver);
 MODULE_AUTHOR("Duke Du <dukedu83@gmail.com>");
 MODULE_DESCRIPTION("PMBus driver for TI tps546d24");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 5d3d1773bf52..9b0eadc81a2e 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -642,4 +642,4 @@ module_i2c_driver(ucd9000_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for TI UCD90xxx");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/ucd9200.c b/drivers/hwmon/pmbus/ucd9200.c
index 7920d1c06df0..f68adaf4a110 100644
--- a/drivers/hwmon/pmbus/ucd9200.c
+++ b/drivers/hwmon/pmbus/ucd9200.c
@@ -209,4 +209,4 @@ module_i2c_driver(ucd9200_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for TI UCD922x, UCD924x");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
index dd107e83f612..660bbfe16e1e 100644
--- a/drivers/hwmon/pmbus/xdp710.c
+++ b/drivers/hwmon/pmbus/xdp710.c
@@ -128,4 +128,4 @@ module_i2c_driver(xdp710_driver);
 MODULE_AUTHOR("Peter Yin <peter.yin@quantatw.com>");
 MODULE_DESCRIPTION("PMBus driver for XDP710 HSC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/xdpe12284.c b/drivers/hwmon/pmbus/xdpe12284.c
index facb1201aa43..f3aa6339d60d 100644
--- a/drivers/hwmon/pmbus/xdpe12284.c
+++ b/drivers/hwmon/pmbus/xdpe12284.c
@@ -194,4 +194,4 @@ module_i2c_driver(xdpe122_driver);
 MODULE_AUTHOR("Vadim Pasternak <vadimp@mellanox.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon XDPE122 family");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/xdpe152c4.c b/drivers/hwmon/pmbus/xdpe152c4.c
index 7f3b31d4f033..67a3d5fe1daf 100644
--- a/drivers/hwmon/pmbus/xdpe152c4.c
+++ b/drivers/hwmon/pmbus/xdpe152c4.c
@@ -72,4 +72,4 @@ module_i2c_driver(xdpe152_driver);
 MODULE_AUTHOR("Greg Schwendimann <greg.schwendimann@infineon.com>");
 MODULE_DESCRIPTION("PMBus driver for Infineon XDPE152 family");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
index 7920a16203e1..97be69630cfb 100644
--- a/drivers/hwmon/pmbus/zl6100.c
+++ b/drivers/hwmon/pmbus/zl6100.c
@@ -420,4 +420,4 @@ module_i2c_driver(zl6100_driver);
 MODULE_AUTHOR("Guenter Roeck");
 MODULE_DESCRIPTION("PMBus driver for ZL6100 and compatibles");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PMBUS);
+MODULE_IMPORT_NS("PMBUS");
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e8ac9a7bf0b3..e74da80d02a4 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -1076,4 +1076,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(I2C_DW_COMMON);
+MODULE_IMPORT_NS("I2C_DW_COMMON");
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7b2c5d71a7fc..9e9850c9c8a4 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -369,5 +369,5 @@ module_pci_driver(dw_i2c_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(I2C_DW);
-MODULE_IMPORT_NS(I2C_DW_COMMON);
+MODULE_IMPORT_NS("I2C_DW");
+MODULE_IMPORT_NS("I2C_DW_COMMON");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 2d0c7348e491..e1fd56c5701f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -397,5 +397,5 @@ module_exit(dw_i2c_exit_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(I2C_DW);
-MODULE_IMPORT_NS(I2C_DW_COMMON);
+MODULE_IMPORT_NS("I2C_DW");
+MODULE_IMPORT_NS("I2C_DW_COMMON");
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 7035296aa24c..f9347a219a72 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -280,4 +280,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus slave adapter");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(I2C_DW_COMMON);
+MODULE_IMPORT_NS("I2C_DW_COMMON");
diff --git a/drivers/i2c/busses/i2c-ljca.c b/drivers/i2c/busses/i2c-ljca.c
index 1dc516ef0fdd..93274f0c2d72 100644
--- a/drivers/i2c/busses/i2c-ljca.c
+++ b/drivers/i2c/busses/i2c-ljca.c
@@ -340,4 +340,4 @@ MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-I2C driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LJCA);
+MODULE_IMPORT_NS("LJCA");
diff --git a/drivers/i2c/i2c-atr.c b/drivers/i2c/i2c-atr.c
index f21475ae5921..b7c10ced5a43 100644
--- a/drivers/i2c/i2c-atr.c
+++ b/drivers/i2c/i2c-atr.c
@@ -547,7 +547,7 @@ struct i2c_atr *i2c_atr_new(struct i2c_adapter *parent, struct device *dev,
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_new, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_new, "I2C_ATR");
 
 void i2c_atr_delete(struct i2c_atr *atr)
 {
@@ -562,7 +562,7 @@ void i2c_atr_delete(struct i2c_atr *atr)
 	mutex_destroy(&atr->lock);
 	kfree(atr);
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_delete, "I2C_ATR");
 
 int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 			struct device *adapter_parent,
@@ -657,7 +657,7 @@ int i2c_atr_add_adapter(struct i2c_atr *atr, u32 chan_id,
 	kfree(chan);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_add_adapter, "I2C_ATR");
 
 void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 {
@@ -690,19 +690,19 @@ void i2c_atr_del_adapter(struct i2c_atr *atr, u32 chan_id)
 	kfree(chan->orig_addrs);
 	kfree(chan);
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_del_adapter, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_del_adapter, "I2C_ATR");
 
 void i2c_atr_set_driver_data(struct i2c_atr *atr, void *data)
 {
 	atr->priv = data;
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_set_driver_data, "I2C_ATR");
 
 void *i2c_atr_get_driver_data(struct i2c_atr *atr)
 {
 	return atr->priv;
 }
-EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, I2C_ATR);
+EXPORT_SYMBOL_NS_GPL(i2c_atr_get_driver_data, "I2C_ATR");
 
 MODULE_AUTHOR("Luca Ceresoli <luca.ceresoli@bootlin.com>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.c
index d054721859b3..8601b9a8b8e7 100644
--- a/drivers/iio/accel/adis16201.c
+++ b/drivers/iio/accel/adis16201.c
@@ -300,4 +300,4 @@ MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16201 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("spi:adis16201");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/accel/adis16209.c b/drivers/iio/accel/adis16209.c
index 0035e4f4db63..41ffd92f27fd 100644
--- a/drivers/iio/accel/adis16209.c
+++ b/drivers/iio/accel/adis16209.c
@@ -310,4 +310,4 @@ MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16209 Dual-Axis Digital Inclinometer and Accelerometer");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("spi:adis16209");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/accel/adxl313_core.c b/drivers/iio/accel/adxl313_core.c
index 4de0a41bd679..46cca10e776f 100644
--- a/drivers/iio/accel/adxl313_core.c
+++ b/drivers/iio/accel/adxl313_core.c
@@ -32,19 +32,19 @@ const struct regmap_access_table adxl312_readable_regs_table = {
 	.yes_ranges = adxl312_readable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl312_readable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl312_readable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl312_readable_regs_table, "IIO_ADXL313");
 
 const struct regmap_access_table adxl313_readable_regs_table = {
 	.yes_ranges = adxl313_readable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl313_readable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl313_readable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl313_readable_regs_table, "IIO_ADXL313");
 
 const struct regmap_access_table adxl314_readable_regs_table = {
 	.yes_ranges = adxl312_readable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl312_readable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl314_readable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl314_readable_regs_table, "IIO_ADXL313");
 
 static int adxl312_check_id(struct device *dev,
 			    struct adxl313_data *data)
@@ -121,7 +121,7 @@ const struct adxl313_chip_info adxl31x_chip_info[] = {
 		.check_id = &adxl312_check_id,
 	},
 };
-EXPORT_SYMBOL_NS_GPL(adxl31x_chip_info, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl31x_chip_info, "IIO_ADXL313");
 
 static const struct regmap_range adxl312_writable_reg_range[] = {
 	regmap_reg_range(ADXL313_REG_OFS_AXIS(0), ADXL313_REG_OFS_AXIS(2)),
@@ -144,19 +144,19 @@ const struct regmap_access_table adxl312_writable_regs_table = {
 	.yes_ranges = adxl312_writable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl312_writable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl312_writable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl312_writable_regs_table, "IIO_ADXL313");
 
 const struct regmap_access_table adxl313_writable_regs_table = {
 	.yes_ranges = adxl313_writable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl313_writable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl313_writable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl313_writable_regs_table, "IIO_ADXL313");
 
 const struct regmap_access_table adxl314_writable_regs_table = {
 	.yes_ranges = adxl312_writable_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl312_writable_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl314_writable_regs_table, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl314_writable_regs_table, "IIO_ADXL313");
 
 static const int adxl313_odr_freqs[][2] = {
 	[0] = { 6, 250000 },
@@ -417,7 +417,7 @@ int adxl313_core_probe(struct device *dev,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl313_core_probe, IIO_ADXL313);
+EXPORT_SYMBOL_NS_GPL(adxl313_core_probe, "IIO_ADXL313");
 
 MODULE_AUTHOR("Lucas Stankus <lucas.p.stankus@gmail.com>");
 MODULE_DESCRIPTION("ADXL313 3-Axis Digital Accelerometer core driver");
diff --git a/drivers/iio/accel/adxl313_i2c.c b/drivers/iio/accel/adxl313_i2c.c
index a4cf0cf2c5aa..dfa51860cd83 100644
--- a/drivers/iio/accel/adxl313_i2c.c
+++ b/drivers/iio/accel/adxl313_i2c.c
@@ -92,4 +92,4 @@ module_i2c_driver(adxl313_i2c_driver);
 MODULE_AUTHOR("Lucas Stankus <lucas.p.stankus@gmail.com>");
 MODULE_DESCRIPTION("ADXL313 3-Axis Digital Accelerometer I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL313);
+MODULE_IMPORT_NS("IIO_ADXL313");
diff --git a/drivers/iio/accel/adxl313_spi.c b/drivers/iio/accel/adxl313_spi.c
index 6f8d73f6e5a9..ebc5d09f108d 100644
--- a/drivers/iio/accel/adxl313_spi.c
+++ b/drivers/iio/accel/adxl313_spi.c
@@ -119,4 +119,4 @@ module_spi_driver(adxl313_spi_driver);
 MODULE_AUTHOR("Lucas Stankus <lucas.p.stankus@gmail.com>");
 MODULE_DESCRIPTION("ADXL313 3-Axis Digital Accelerometer SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL313);
+MODULE_IMPORT_NS("IIO_ADXL313");
diff --git a/drivers/iio/accel/adxl345_core.c b/drivers/iio/accel/adxl345_core.c
index 006ce66c0aa3..b1efab0f6404 100644
--- a/drivers/iio/accel/adxl345_core.c
+++ b/drivers/iio/accel/adxl345_core.c
@@ -248,7 +248,7 @@ int adxl345_core_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl345_core_probe, IIO_ADXL345);
+EXPORT_SYMBOL_NS_GPL(adxl345_core_probe, "IIO_ADXL345");
 
 MODULE_AUTHOR("Eva Rachel Retuya <eraretuya@gmail.com>");
 MODULE_DESCRIPTION("ADXL345 3-Axis Digital Accelerometer core driver");
diff --git a/drivers/iio/accel/adxl345_i2c.c b/drivers/iio/accel/adxl345_i2c.c
index 4065b8f7c8a8..cb23fb11fcd7 100644
--- a/drivers/iio/accel/adxl345_i2c.c
+++ b/drivers/iio/accel/adxl345_i2c.c
@@ -74,4 +74,4 @@ module_i2c_driver(adxl345_i2c_driver);
 MODULE_AUTHOR("Eva Rachel Retuya <eraretuya@gmail.com>");
 MODULE_DESCRIPTION("ADXL345 3-Axis Digital Accelerometer I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL345);
+MODULE_IMPORT_NS("IIO_ADXL345");
diff --git a/drivers/iio/accel/adxl345_spi.c b/drivers/iio/accel/adxl345_spi.c
index 57e16b441702..968e7b390d4b 100644
--- a/drivers/iio/accel/adxl345_spi.c
+++ b/drivers/iio/accel/adxl345_spi.c
@@ -88,4 +88,4 @@ module_spi_driver(adxl345_spi_driver);
 MODULE_AUTHOR("Eva Rachel Retuya <eraretuya@gmail.com>");
 MODULE_DESCRIPTION("ADXL345 3-Axis Digital Accelerometer SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL345);
+MODULE_IMPORT_NS("IIO_ADXL345");
diff --git a/drivers/iio/accel/adxl355_core.c b/drivers/iio/accel/adxl355_core.c
index eabaefa92f19..a6f897360293 100644
--- a/drivers/iio/accel/adxl355_core.c
+++ b/drivers/iio/accel/adxl355_core.c
@@ -72,7 +72,7 @@ const struct regmap_access_table adxl355_readable_regs_tbl = {
 	.yes_ranges = adxl355_read_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl355_read_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl355_readable_regs_tbl, IIO_ADXL355);
+EXPORT_SYMBOL_NS_GPL(adxl355_readable_regs_tbl, "IIO_ADXL355");
 
 static const struct regmap_range adxl355_write_reg_range[] = {
 	regmap_reg_range(ADXL355_OFFSET_X_H_REG, ADXL355_RESET_REG),
@@ -82,7 +82,7 @@ const struct regmap_access_table adxl355_writeable_regs_tbl = {
 	.yes_ranges = adxl355_write_reg_range,
 	.n_yes_ranges = ARRAY_SIZE(adxl355_write_reg_range),
 };
-EXPORT_SYMBOL_NS_GPL(adxl355_writeable_regs_tbl, IIO_ADXL355);
+EXPORT_SYMBOL_NS_GPL(adxl355_writeable_regs_tbl, "IIO_ADXL355");
 
 const struct adxl355_chip_info adxl35x_chip_info[] = {
 	[ADXL355] = {
@@ -136,7 +136,7 @@ const struct adxl355_chip_info adxl35x_chip_info[] = {
 		},
 	},
 };
-EXPORT_SYMBOL_NS_GPL(adxl35x_chip_info, IIO_ADXL355);
+EXPORT_SYMBOL_NS_GPL(adxl35x_chip_info, "IIO_ADXL355");
 
 enum adxl355_op_mode {
 	ADXL355_MEASUREMENT,
@@ -801,7 +801,7 @@ int adxl355_core_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl355_core_probe, IIO_ADXL355);
+EXPORT_SYMBOL_NS_GPL(adxl355_core_probe, "IIO_ADXL355");
 
 MODULE_AUTHOR("Puranjay Mohan <puranjay12@gmail.com>");
 MODULE_DESCRIPTION("ADXL355 3-Axis Digital Accelerometer core driver");
diff --git a/drivers/iio/accel/adxl355_i2c.c b/drivers/iio/accel/adxl355_i2c.c
index 32398cde9608..1a512c7b792b 100644
--- a/drivers/iio/accel/adxl355_i2c.c
+++ b/drivers/iio/accel/adxl355_i2c.c
@@ -67,4 +67,4 @@ module_i2c_driver(adxl355_i2c_driver);
 MODULE_AUTHOR("Puranjay Mohan <puranjay12@gmail.com>");
 MODULE_DESCRIPTION("ADXL355 3-Axis Digital Accelerometer I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL355);
+MODULE_IMPORT_NS("IIO_ADXL355");
diff --git a/drivers/iio/accel/adxl355_spi.c b/drivers/iio/accel/adxl355_spi.c
index 5153ac815e4b..869e3e57d6f7 100644
--- a/drivers/iio/accel/adxl355_spi.c
+++ b/drivers/iio/accel/adxl355_spi.c
@@ -70,4 +70,4 @@ module_spi_driver(adxl355_spi_driver);
 MODULE_AUTHOR("Puranjay Mohan <puranjay12@gmail.com>");
 MODULE_DESCRIPTION("ADXL355 3-Axis Digital Accelerometer SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADXL355);
+MODULE_IMPORT_NS("IIO_ADXL355");
diff --git a/drivers/iio/accel/adxl367.c b/drivers/iio/accel/adxl367.c
index e790a66d86c7..e977dc8a0a7f 100644
--- a/drivers/iio/accel/adxl367.c
+++ b/drivers/iio/accel/adxl367.c
@@ -1475,7 +1475,7 @@ int adxl367_probe(struct device *dev, const struct adxl367_ops *ops,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl367_probe, IIO_ADXL367);
+EXPORT_SYMBOL_NS_GPL(adxl367_probe, "IIO_ADXL367");
 
 MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL367 3-axis accelerometer driver");
diff --git a/drivers/iio/accel/adxl367_i2c.c b/drivers/iio/accel/adxl367_i2c.c
index deb82a43ec36..80f0b642b9b0 100644
--- a/drivers/iio/accel/adxl367_i2c.c
+++ b/drivers/iio/accel/adxl367_i2c.c
@@ -83,7 +83,7 @@ static struct i2c_driver adxl367_i2c_driver = {
 
 module_i2c_driver(adxl367_i2c_driver);
 
-MODULE_IMPORT_NS(IIO_ADXL367);
+MODULE_IMPORT_NS("IIO_ADXL367");
 MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL367 3-axis accelerometer I2C driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/accel/adxl367_spi.c b/drivers/iio/accel/adxl367_spi.c
index b70117265791..49d7c8fbe8ed 100644
--- a/drivers/iio/accel/adxl367_spi.c
+++ b/drivers/iio/accel/adxl367_spi.c
@@ -160,7 +160,7 @@ static struct spi_driver adxl367_spi_driver = {
 
 module_spi_driver(adxl367_spi_driver);
 
-MODULE_IMPORT_NS(IIO_ADXL367);
+MODULE_IMPORT_NS("IIO_ADXL367");
 MODULE_AUTHOR("Cosmin Tanislav <cosmin.tanislav@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL367 3-axis accelerometer SPI driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/accel/adxl372.c b/drivers/iio/accel/adxl372.c
index ef8dd557877b..e20cad749f3e 100644
--- a/drivers/iio/accel/adxl372.c
+++ b/drivers/iio/accel/adxl372.c
@@ -1176,7 +1176,7 @@ bool adxl372_readable_noinc_reg(struct device *dev, unsigned int reg)
 {
 	return (reg == ADXL372_FIFO_DATA);
 }
-EXPORT_SYMBOL_NS_GPL(adxl372_readable_noinc_reg, IIO_ADXL372);
+EXPORT_SYMBOL_NS_GPL(adxl372_readable_noinc_reg, "IIO_ADXL372");
 
 int adxl372_probe(struct device *dev, struct regmap *regmap,
 		  int irq, const char *name)
@@ -1260,7 +1260,7 @@ int adxl372_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl372_probe, IIO_ADXL372);
+EXPORT_SYMBOL_NS_GPL(adxl372_probe, "IIO_ADXL372");
 
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL372 3-axis accelerometer driver");
diff --git a/drivers/iio/accel/adxl372_i2c.c b/drivers/iio/accel/adxl372_i2c.c
index 3571cfde1c0e..43d5fd921be7 100644
--- a/drivers/iio/accel/adxl372_i2c.c
+++ b/drivers/iio/accel/adxl372_i2c.c
@@ -67,4 +67,4 @@ module_i2c_driver(adxl372_i2c_driver);
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL372 3-axis accelerometer I2C driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADXL372);
+MODULE_IMPORT_NS("IIO_ADXL372");
diff --git a/drivers/iio/accel/adxl372_spi.c b/drivers/iio/accel/adxl372_spi.c
index 787699773f96..1ab1997a55b1 100644
--- a/drivers/iio/accel/adxl372_spi.c
+++ b/drivers/iio/accel/adxl372_spi.c
@@ -58,4 +58,4 @@ module_spi_driver(adxl372_spi_driver);
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL372 3-axis accelerometer SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADXL372);
+MODULE_IMPORT_NS("IIO_ADXL372");
diff --git a/drivers/iio/accel/adxl380.c b/drivers/iio/accel/adxl380.c
index f80527d899be..20263a9255a0 100644
--- a/drivers/iio/accel/adxl380.c
+++ b/drivers/iio/accel/adxl380.c
@@ -194,7 +194,7 @@ const struct adxl380_chip_info adxl380_chip_info = {
 	.temp_offset =  25 * 102 / 10 - 470,
 
 };
-EXPORT_SYMBOL_NS_GPL(adxl380_chip_info, IIO_ADXL380);
+EXPORT_SYMBOL_NS_GPL(adxl380_chip_info, "IIO_ADXL380");
 
 const struct adxl380_chip_info adxl382_chip_info = {
 	.name = "adxl382",
@@ -211,7 +211,7 @@ const struct adxl380_chip_info adxl382_chip_info = {
 	 */
 	.temp_offset =  25 * 102 / 10 - 570,
 };
-EXPORT_SYMBOL_NS_GPL(adxl382_chip_info, IIO_ADXL380);
+EXPORT_SYMBOL_NS_GPL(adxl382_chip_info, "IIO_ADXL380");
 
 static const unsigned int adxl380_th_reg_high_addr[2] = {
 	[ADXL380_ACTIVITY] = ADXL380_THRESH_ACT_H_REG,
@@ -263,7 +263,7 @@ bool adxl380_readable_noinc_reg(struct device *dev, unsigned int reg)
 {
 	return reg == ADXL380_FIFO_DATA;
 }
-EXPORT_SYMBOL_NS_GPL(adxl380_readable_noinc_reg, IIO_ADXL380);
+EXPORT_SYMBOL_NS_GPL(adxl380_readable_noinc_reg, "IIO_ADXL380");
 
 static int adxl380_set_measure_en(struct adxl380_state *st, bool en)
 {
@@ -1897,7 +1897,7 @@ int adxl380_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(adxl380_probe, IIO_ADXL380);
+EXPORT_SYMBOL_NS_GPL(adxl380_probe, "IIO_ADXL380");
 
 MODULE_AUTHOR("Ramona Gradinariu <ramona.gradinariu@analog.com>");
 MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
diff --git a/drivers/iio/accel/adxl380_i2c.c b/drivers/iio/accel/adxl380_i2c.c
index 1dc1e77be815..b4f86f972361 100644
--- a/drivers/iio/accel/adxl380_i2c.c
+++ b/drivers/iio/accel/adxl380_i2c.c
@@ -61,4 +61,4 @@ MODULE_AUTHOR("Ramona Gradinariu <ramona.gradinariu@analog.com>");
 MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL380 3-axis accelerometer I2C driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADXL380);
+MODULE_IMPORT_NS("IIO_ADXL380");
diff --git a/drivers/iio/accel/adxl380_spi.c b/drivers/iio/accel/adxl380_spi.c
index e7b5778cb6cf..6edd0d211ffa 100644
--- a/drivers/iio/accel/adxl380_spi.c
+++ b/drivers/iio/accel/adxl380_spi.c
@@ -63,4 +63,4 @@ MODULE_AUTHOR("Ramona Gradinariu <ramona.gradinariu@analog.com>");
 MODULE_AUTHOR("Antoniu Miclaus <antoniu.miclaus@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADXL380 3-axis accelerometer SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADXL380);
+MODULE_IMPORT_NS("IIO_ADXL380");
diff --git a/drivers/iio/accel/bma400_core.c b/drivers/iio/accel/bma400_core.c
index e4fe36768216..117bf0bfcb22 100644
--- a/drivers/iio/accel/bma400_core.c
+++ b/drivers/iio/accel/bma400_core.c
@@ -194,7 +194,7 @@ const struct regmap_config bma400_regmap_config = {
 	.writeable_reg = bma400_is_writable_reg,
 	.volatile_reg = bma400_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bma400_regmap_config, IIO_BMA400);
+EXPORT_SYMBOL_NS(bma400_regmap_config, "IIO_BMA400");
 
 static const struct iio_mount_matrix *
 bma400_accel_get_mount_matrix(const struct iio_dev *indio_dev,
@@ -1763,7 +1763,7 @@ int bma400_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS(bma400_probe, IIO_BMA400);
+EXPORT_SYMBOL_NS(bma400_probe, "IIO_BMA400");
 
 MODULE_AUTHOR("Dan Robertson <dan@dlrobertson.com>");
 MODULE_AUTHOR("Jagath Jog J <jagathjog1996@gmail.com>");
diff --git a/drivers/iio/accel/bma400_i2c.c b/drivers/iio/accel/bma400_i2c.c
index c1c72f577295..24a390c3ae66 100644
--- a/drivers/iio/accel/bma400_i2c.c
+++ b/drivers/iio/accel/bma400_i2c.c
@@ -53,4 +53,4 @@ module_i2c_driver(bma400_i2c_driver);
 MODULE_AUTHOR("Dan Robertson <dan@dlrobertson.com>");
 MODULE_DESCRIPTION("Bosch BMA400 triaxial acceleration sensor (I2C)");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BMA400);
+MODULE_IMPORT_NS("IIO_BMA400");
diff --git a/drivers/iio/accel/bma400_spi.c b/drivers/iio/accel/bma400_spi.c
index 765d8c4a4c4d..d386f643515b 100644
--- a/drivers/iio/accel/bma400_spi.c
+++ b/drivers/iio/accel/bma400_spi.c
@@ -112,4 +112,4 @@ module_spi_driver(bma400_spi_driver);
 MODULE_AUTHOR("Dan Robertson <dan@dlrobertson.com>");
 MODULE_DESCRIPTION("Bosch BMA400 triaxial acceleration sensor (SPI)");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BMA400);
+MODULE_IMPORT_NS("IIO_BMA400");
diff --git a/drivers/iio/accel/bmc150-accel-core.c b/drivers/iio/accel/bmc150-accel-core.c
index 0f32c1e92b4d..5244bc2f1c2c 100644
--- a/drivers/iio/accel/bmc150-accel-core.c
+++ b/drivers/iio/accel/bmc150-accel-core.c
@@ -203,7 +203,7 @@ const struct regmap_config bmc150_regmap_conf = {
 	.val_bits = 8,
 	.max_register = 0x3f,
 };
-EXPORT_SYMBOL_NS_GPL(bmc150_regmap_conf, IIO_BMC150);
+EXPORT_SYMBOL_NS_GPL(bmc150_regmap_conf, "IIO_BMC150");
 
 static int bmc150_accel_set_mode(struct bmc150_accel_data *data,
 				 enum bmc150_power_modes mode,
@@ -1760,7 +1760,7 @@ int bmc150_accel_core_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(bmc150_accel_core_probe, IIO_BMC150);
+EXPORT_SYMBOL_NS_GPL(bmc150_accel_core_probe, "IIO_BMC150");
 
 void bmc150_accel_core_remove(struct device *dev)
 {
@@ -1783,7 +1783,7 @@ void bmc150_accel_core_remove(struct device *dev)
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators),
 			       data->regulators);
 }
-EXPORT_SYMBOL_NS_GPL(bmc150_accel_core_remove, IIO_BMC150);
+EXPORT_SYMBOL_NS_GPL(bmc150_accel_core_remove, "IIO_BMC150");
 
 #ifdef CONFIG_PM_SLEEP
 static int bmc150_accel_suspend(struct device *dev)
@@ -1858,7 +1858,7 @@ const struct dev_pm_ops bmc150_accel_pm_ops = {
 	SET_RUNTIME_PM_OPS(bmc150_accel_runtime_suspend,
 			   bmc150_accel_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_NS_GPL(bmc150_accel_pm_ops, IIO_BMC150);
+EXPORT_SYMBOL_NS_GPL(bmc150_accel_pm_ops, "IIO_BMC150");
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/accel/bmc150-accel-i2c.c b/drivers/iio/accel/bmc150-accel-i2c.c
index 1c2e40369839..0d4ce6c38931 100644
--- a/drivers/iio/accel/bmc150-accel-i2c.c
+++ b/drivers/iio/accel/bmc150-accel-i2c.c
@@ -291,4 +291,4 @@ module_i2c_driver(bmc150_accel_driver);
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("BMC150 I2C accelerometer driver");
-MODULE_IMPORT_NS(IIO_BMC150);
+MODULE_IMPORT_NS("IIO_BMC150");
diff --git a/drivers/iio/accel/bmc150-accel-spi.c b/drivers/iio/accel/bmc150-accel-spi.c
index a6b9f599eb7b..70b3642656ab 100644
--- a/drivers/iio/accel/bmc150-accel-spi.c
+++ b/drivers/iio/accel/bmc150-accel-spi.c
@@ -81,4 +81,4 @@ module_spi_driver(bmc150_accel_driver);
 MODULE_AUTHOR("Markus Pargmann <mpa@pengutronix.de>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("BMC150 SPI accelerometer driver");
-MODULE_IMPORT_NS(IIO_BMC150);
+MODULE_IMPORT_NS("IIO_BMC150");
diff --git a/drivers/iio/accel/bmi088-accel-core.c b/drivers/iio/accel/bmi088-accel-core.c
index fc1c1613d673..9206fbdbf520 100644
--- a/drivers/iio/accel/bmi088-accel-core.c
+++ b/drivers/iio/accel/bmi088-accel-core.c
@@ -147,7 +147,7 @@ const struct regmap_config bmi088_regmap_conf = {
 	.volatile_table = &bmi088_volatile_table,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS_GPL(bmi088_regmap_conf, IIO_BMI088);
+EXPORT_SYMBOL_NS_GPL(bmi088_regmap_conf, "IIO_BMI088");
 
 static int bmi088_accel_power_up(struct bmi088_accel_data *data)
 {
@@ -587,7 +587,7 @@ int bmi088_accel_core_probe(struct device *dev, struct regmap *regmap,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(bmi088_accel_core_probe, IIO_BMI088);
+EXPORT_SYMBOL_NS_GPL(bmi088_accel_core_probe, "IIO_BMI088");
 
 
 void bmi088_accel_core_remove(struct device *dev)
@@ -601,7 +601,7 @@ void bmi088_accel_core_remove(struct device *dev)
 	pm_runtime_set_suspended(dev);
 	bmi088_accel_power_down(data);
 }
-EXPORT_SYMBOL_NS_GPL(bmi088_accel_core_remove, IIO_BMI088);
+EXPORT_SYMBOL_NS_GPL(bmi088_accel_core_remove, "IIO_BMI088");
 
 static int bmi088_accel_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/iio/accel/bmi088-accel-i2c.c b/drivers/iio/accel/bmi088-accel-i2c.c
index 17e9156bbe89..bd22bd0d3c25 100644
--- a/drivers/iio/accel/bmi088-accel-i2c.c
+++ b/drivers/iio/accel/bmi088-accel-i2c.c
@@ -67,4 +67,4 @@ module_i2c_driver(bmi088_accel_driver);
 MODULE_AUTHOR("Jun Yan <jerrysteve1101@gmail.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("BMI088 accelerometer driver (I2C)");
-MODULE_IMPORT_NS(IIO_BMI088);
+MODULE_IMPORT_NS("IIO_BMI088");
diff --git a/drivers/iio/accel/bmi088-accel-spi.c b/drivers/iio/accel/bmi088-accel-spi.c
index df1adc059aa9..c9d51a74c07f 100644
--- a/drivers/iio/accel/bmi088-accel-spi.c
+++ b/drivers/iio/accel/bmi088-accel-spi.c
@@ -94,4 +94,4 @@ module_spi_driver(bmi088_accel_driver);
 MODULE_AUTHOR("Niek van Agt <niek.van.agt@topicproducts.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("BMI088 accelerometer driver (SPI)");
-MODULE_IMPORT_NS(IIO_BMI088);
+MODULE_IMPORT_NS("IIO_BMI088");
diff --git a/drivers/iio/accel/fxls8962af-core.c b/drivers/iio/accel/fxls8962af-core.c
index acadabec4df7..3b1f7e7d7f56 100644
--- a/drivers/iio/accel/fxls8962af-core.c
+++ b/drivers/iio/accel/fxls8962af-core.c
@@ -179,7 +179,7 @@ const struct regmap_config fxls8962af_i2c_regmap_conf = {
 	.val_bits = 8,
 	.max_register = FXLS8962AF_MAX_REG,
 };
-EXPORT_SYMBOL_NS_GPL(fxls8962af_i2c_regmap_conf, IIO_FXLS8962AF);
+EXPORT_SYMBOL_NS_GPL(fxls8962af_i2c_regmap_conf, "IIO_FXLS8962AF");
 
 const struct regmap_config fxls8962af_spi_regmap_conf = {
 	.reg_bits = 8,
@@ -187,7 +187,7 @@ const struct regmap_config fxls8962af_spi_regmap_conf = {
 	.val_bits = 8,
 	.max_register = FXLS8962AF_MAX_REG,
 };
-EXPORT_SYMBOL_NS_GPL(fxls8962af_spi_regmap_conf, IIO_FXLS8962AF);
+EXPORT_SYMBOL_NS_GPL(fxls8962af_spi_regmap_conf, "IIO_FXLS8962AF");
 
 enum {
 	fxls8962af_idx_x,
@@ -1220,7 +1220,7 @@ int fxls8962af_core_probe(struct device *dev, struct regmap *regmap, int irq)
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(fxls8962af_core_probe, IIO_FXLS8962AF);
+EXPORT_SYMBOL_NS_GPL(fxls8962af_core_probe, "IIO_FXLS8962AF");
 
 static int fxls8962af_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/iio/accel/fxls8962af-i2c.c b/drivers/iio/accel/fxls8962af-i2c.c
index 160124673308..2e1bb43ef2a1 100644
--- a/drivers/iio/accel/fxls8962af-i2c.c
+++ b/drivers/iio/accel/fxls8962af-i2c.c
@@ -55,4 +55,4 @@ module_i2c_driver(fxls8962af_driver);
 MODULE_AUTHOR("Sean Nyekjaer <sean@geanix.com>");
 MODULE_DESCRIPTION("NXP FXLS8962AF/FXLS8964AF accelerometer i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_FXLS8962AF);
+MODULE_IMPORT_NS("IIO_FXLS8962AF");
diff --git a/drivers/iio/accel/fxls8962af-spi.c b/drivers/iio/accel/fxls8962af-spi.c
index a0d192211839..46fc6e002714 100644
--- a/drivers/iio/accel/fxls8962af-spi.c
+++ b/drivers/iio/accel/fxls8962af-spi.c
@@ -55,4 +55,4 @@ module_spi_driver(fxls8962af_driver);
 MODULE_AUTHOR("Sean Nyekjaer <sean@geanix.com>");
 MODULE_DESCRIPTION("NXP FXLS8962AF/FXLS8964AF accelerometer spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_FXLS8962AF);
+MODULE_IMPORT_NS("IIO_FXLS8962AF");
diff --git a/drivers/iio/accel/hid-sensor-accel-3d.c b/drivers/iio/accel/hid-sensor-accel-3d.c
index 9b7a73a4c48a..04f8af68ebef 100644
--- a/drivers/iio/accel/hid-sensor-accel-3d.c
+++ b/drivers/iio/accel/hid-sensor-accel-3d.c
@@ -459,4 +459,4 @@ module_platform_driver(hid_accel_3d_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Accel 3D");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/accel/kionix-kx022a-i2c.c b/drivers/iio/accel/kionix-kx022a-i2c.c
index 8a1d4fc28ddd..b39a43ecadff 100644
--- a/drivers/iio/accel/kionix-kx022a-i2c.c
+++ b/drivers/iio/accel/kionix-kx022a-i2c.c
@@ -65,4 +65,4 @@ module_i2c_driver(kx022a_i2c_driver);
 MODULE_DESCRIPTION("ROHM/Kionix KX022A accelerometer driver");
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_KX022A);
+MODULE_IMPORT_NS("IIO_KX022A");
diff --git a/drivers/iio/accel/kionix-kx022a-spi.c b/drivers/iio/accel/kionix-kx022a-spi.c
index f798b964d0b5..c38a47806a00 100644
--- a/drivers/iio/accel/kionix-kx022a-spi.c
+++ b/drivers/iio/accel/kionix-kx022a-spi.c
@@ -65,4 +65,4 @@ module_spi_driver(kx022a_spi_driver);
 MODULE_DESCRIPTION("ROHM/Kionix kx022A accelerometer driver");
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_KX022A);
+MODULE_IMPORT_NS("IIO_KX022A");
diff --git a/drivers/iio/accel/kionix-kx022a.c b/drivers/iio/accel/kionix-kx022a.c
index 53d59a04ae15..962d63c24f47 100644
--- a/drivers/iio/accel/kionix-kx022a.c
+++ b/drivers/iio/accel/kionix-kx022a.c
@@ -1175,7 +1175,7 @@ const struct kx022a_chip_info kx022a_chip_info = {
 	.xout_l				= KX022A_REG_XOUT_L,
 	.get_fifo_bytes_available	= kx022a_get_fifo_bytes_available,
 };
-EXPORT_SYMBOL_NS_GPL(kx022a_chip_info, IIO_KX022A);
+EXPORT_SYMBOL_NS_GPL(kx022a_chip_info, "IIO_KX022A");
 
 const struct kx022a_chip_info kx132_chip_info = {
 	.name			  = "kx132-1211",
@@ -1201,7 +1201,7 @@ const struct kx022a_chip_info kx132_chip_info = {
 	.xout_l			  = KX132_REG_XOUT_L,
 	.get_fifo_bytes_available = kx132_get_fifo_bytes_available,
 };
-EXPORT_SYMBOL_NS_GPL(kx132_chip_info, IIO_KX022A);
+EXPORT_SYMBOL_NS_GPL(kx132_chip_info, "IIO_KX022A");
 
 /*
  * Despite the naming, KX132ACR-LBZ is not similar to KX132-1211 but it is
@@ -1233,7 +1233,7 @@ const struct kx022a_chip_info kx132acr_chip_info = {
 	.xout_l				= KX022A_REG_XOUT_L,
 	.get_fifo_bytes_available	= kx022a_get_fifo_bytes_available,
 };
-EXPORT_SYMBOL_NS_GPL(kx132acr_chip_info, IIO_KX022A);
+EXPORT_SYMBOL_NS_GPL(kx132acr_chip_info, "IIO_KX022A");
 
 int kx022a_probe_internal(struct device *dev, const struct kx022a_chip_info *chip_info)
 {
@@ -1371,7 +1371,7 @@ int kx022a_probe_internal(struct device *dev, const struct kx022a_chip_info *chi
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(kx022a_probe_internal, IIO_KX022A);
+EXPORT_SYMBOL_NS_GPL(kx022a_probe_internal, "IIO_KX022A");
 
 MODULE_DESCRIPTION("ROHM/Kionix KX022A accelerometer driver");
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
diff --git a/drivers/iio/accel/kxsd9-i2c.c b/drivers/iio/accel/kxsd9-i2c.c
index c4c7e2d4e98a..3857d2edf250 100644
--- a/drivers/iio/accel/kxsd9-i2c.c
+++ b/drivers/iio/accel/kxsd9-i2c.c
@@ -62,4 +62,4 @@ module_i2c_driver(kxsd9_i2c_driver);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("KXSD9 accelerometer I2C interface");
-MODULE_IMPORT_NS(IIO_KXSD9);
+MODULE_IMPORT_NS("IIO_KXSD9");
diff --git a/drivers/iio/accel/kxsd9-spi.c b/drivers/iio/accel/kxsd9-spi.c
index 4414670dfb43..a05f4467d94a 100644
--- a/drivers/iio/accel/kxsd9-spi.c
+++ b/drivers/iio/accel/kxsd9-spi.c
@@ -63,4 +63,4 @@ module_spi_driver(kxsd9_spi_driver);
 MODULE_AUTHOR("Jonathan Cameron <jic23@kernel.org>");
 MODULE_DESCRIPTION("Kionix KXSD9 SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_KXSD9);
+MODULE_IMPORT_NS("IIO_KXSD9");
diff --git a/drivers/iio/accel/kxsd9.c b/drivers/iio/accel/kxsd9.c
index 70dfd6e354db..d586ab1a5a34 100644
--- a/drivers/iio/accel/kxsd9.c
+++ b/drivers/iio/accel/kxsd9.c
@@ -473,7 +473,7 @@ int kxsd9_common_probe(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(kxsd9_common_probe, IIO_KXSD9);
+EXPORT_SYMBOL_NS(kxsd9_common_probe, "IIO_KXSD9");
 
 void kxsd9_common_remove(struct device *dev)
 {
@@ -487,7 +487,7 @@ void kxsd9_common_remove(struct device *dev)
 	pm_runtime_disable(dev);
 	kxsd9_power_down(st);
 }
-EXPORT_SYMBOL_NS(kxsd9_common_remove, IIO_KXSD9);
+EXPORT_SYMBOL_NS(kxsd9_common_remove, "IIO_KXSD9");
 
 static int kxsd9_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/iio/accel/mma7455_core.c b/drivers/iio/accel/mma7455_core.c
index a34195b3215d..fb576a82681c 100644
--- a/drivers/iio/accel/mma7455_core.c
+++ b/drivers/iio/accel/mma7455_core.c
@@ -238,7 +238,7 @@ const struct regmap_config mma7455_core_regmap = {
 	.val_bits = 8,
 	.max_register = MMA7455_REG_TW,
 };
-EXPORT_SYMBOL_NS_GPL(mma7455_core_regmap, IIO_MMA7455);
+EXPORT_SYMBOL_NS_GPL(mma7455_core_regmap, "IIO_MMA7455");
 
 int mma7455_core_probe(struct device *dev, struct regmap *regmap,
 		       const char *name)
@@ -293,7 +293,7 @@ int mma7455_core_probe(struct device *dev, struct regmap *regmap,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(mma7455_core_probe, IIO_MMA7455);
+EXPORT_SYMBOL_NS_GPL(mma7455_core_probe, "IIO_MMA7455");
 
 void mma7455_core_remove(struct device *dev)
 {
@@ -306,7 +306,7 @@ void mma7455_core_remove(struct device *dev)
 	regmap_write(mma7455->regmap, MMA7455_REG_MCTL,
 		     MMA7455_MCTL_MODE_STANDBY);
 }
-EXPORT_SYMBOL_NS_GPL(mma7455_core_remove, IIO_MMA7455);
+EXPORT_SYMBOL_NS_GPL(mma7455_core_remove, "IIO_MMA7455");
 
 MODULE_AUTHOR("Joachim Eastwood <manabian@gmail.com>");
 MODULE_DESCRIPTION("Freescale MMA7455L core accelerometer driver");
diff --git a/drivers/iio/accel/mma7455_i2c.c b/drivers/iio/accel/mma7455_i2c.c
index 36a357c8e9ed..2ff8eb1f9ce9 100644
--- a/drivers/iio/accel/mma7455_i2c.c
+++ b/drivers/iio/accel/mma7455_i2c.c
@@ -59,4 +59,4 @@ module_i2c_driver(mma7455_i2c_driver);
 MODULE_AUTHOR("Joachim Eastwood <manabian@gmail.com>");
 MODULE_DESCRIPTION("Freescale MMA7455L I2C accelerometer driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MMA7455);
+MODULE_IMPORT_NS("IIO_MMA7455");
diff --git a/drivers/iio/accel/mma7455_spi.c b/drivers/iio/accel/mma7455_spi.c
index fcdde2e8a84b..aca02e83f789 100644
--- a/drivers/iio/accel/mma7455_spi.c
+++ b/drivers/iio/accel/mma7455_spi.c
@@ -47,4 +47,4 @@ module_spi_driver(mma7455_spi_driver);
 MODULE_AUTHOR("Joachim Eastwood <manabian@gmail.com>");
 MODULE_DESCRIPTION("Freescale MMA7455L SPI accelerometer driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MMA7455);
+MODULE_IMPORT_NS("IIO_MMA7455");
diff --git a/drivers/iio/accel/mma9551.c b/drivers/iio/accel/mma9551.c
index fa1799b0b0df..39e8ac980e7a 100644
--- a/drivers/iio/accel/mma9551.c
+++ b/drivers/iio/accel/mma9551.c
@@ -618,4 +618,4 @@ MODULE_AUTHOR("Irina Tirdea <irina.tirdea@intel.com>");
 MODULE_AUTHOR("Vlad Dogaru <vlad.dogaru@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MMA9551L motion-sensing platform driver");
-MODULE_IMPORT_NS(IIO_MMA9551);
+MODULE_IMPORT_NS("IIO_MMA9551");
diff --git a/drivers/iio/accel/mma9551_core.c b/drivers/iio/accel/mma9551_core.c
index b898f865fb87..3e7d9b79ed0e 100644
--- a/drivers/iio/accel/mma9551_core.c
+++ b/drivers/iio/accel/mma9551_core.c
@@ -219,7 +219,7 @@ int mma9551_read_config_byte(struct i2c_client *client, u8 app_id,
 	return mma9551_transfer(client, app_id, MMA9551_CMD_READ_CONFIG,
 				reg, NULL, 0, val, 1);
 }
-EXPORT_SYMBOL_NS(mma9551_read_config_byte, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_config_byte, "IIO_MMA9551");
 
 /**
  * mma9551_write_config_byte() - write 1 configuration byte
@@ -244,7 +244,7 @@ int mma9551_write_config_byte(struct i2c_client *client, u8 app_id,
 	return mma9551_transfer(client, app_id, MMA9551_CMD_WRITE_CONFIG, reg,
 				&val, 1, NULL, 0);
 }
-EXPORT_SYMBOL_NS(mma9551_write_config_byte, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_write_config_byte, "IIO_MMA9551");
 
 /**
  * mma9551_read_status_byte() - read 1 status byte
@@ -269,7 +269,7 @@ int mma9551_read_status_byte(struct i2c_client *client, u8 app_id,
 	return mma9551_transfer(client, app_id, MMA9551_CMD_READ_STATUS,
 				reg, NULL, 0, val, 1);
 }
-EXPORT_SYMBOL_NS(mma9551_read_status_byte, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_status_byte, "IIO_MMA9551");
 
 /**
  * mma9551_read_config_word() - read 1 config word
@@ -303,7 +303,7 @@ int mma9551_read_config_word(struct i2c_client *client, u8 app_id,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_read_config_word, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_config_word, "IIO_MMA9551");
 
 /**
  * mma9551_write_config_word() - write 1 config word
@@ -330,7 +330,7 @@ int mma9551_write_config_word(struct i2c_client *client, u8 app_id,
 	return mma9551_transfer(client, app_id, MMA9551_CMD_WRITE_CONFIG, reg,
 				(u8 *)&v, 2, NULL, 0);
 }
-EXPORT_SYMBOL_NS(mma9551_write_config_word, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_write_config_word, "IIO_MMA9551");
 
 /**
  * mma9551_read_status_word() - read 1 status word
@@ -364,7 +364,7 @@ int mma9551_read_status_word(struct i2c_client *client, u8 app_id,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_read_status_word, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_status_word, "IIO_MMA9551");
 
 /**
  * mma9551_read_config_words() - read multiple config words
@@ -403,7 +403,7 @@ int mma9551_read_config_words(struct i2c_client *client, u8 app_id,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_read_config_words, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_config_words, "IIO_MMA9551");
 
 /**
  * mma9551_read_status_words() - read multiple status words
@@ -442,7 +442,7 @@ int mma9551_read_status_words(struct i2c_client *client, u8 app_id,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_read_status_words, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_status_words, "IIO_MMA9551");
 
 /**
  * mma9551_write_config_words() - write multiple config words
@@ -477,7 +477,7 @@ int mma9551_write_config_words(struct i2c_client *client, u8 app_id,
 	return mma9551_transfer(client, app_id, MMA9551_CMD_WRITE_CONFIG,
 				reg, (u8 *)be_buf, len * sizeof(u16), NULL, 0);
 }
-EXPORT_SYMBOL_NS(mma9551_write_config_words, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_write_config_words, "IIO_MMA9551");
 
 /**
  * mma9551_update_config_bits() - update bits in register
@@ -513,7 +513,7 @@ int mma9551_update_config_bits(struct i2c_client *client, u8 app_id,
 
 	return mma9551_write_config_byte(client, app_id, reg, tmp);
 }
-EXPORT_SYMBOL_NS(mma9551_update_config_bits, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_update_config_bits, "IIO_MMA9551");
 
 /**
  * mma9551_gpio_config() - configure gpio
@@ -592,7 +592,7 @@ int mma9551_gpio_config(struct i2c_client *client, enum mma9551_gpio_pin pin,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(mma9551_gpio_config, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_gpio_config, "IIO_MMA9551");
 
 /**
  * mma9551_read_version() - read device version information
@@ -622,7 +622,7 @@ int mma9551_read_version(struct i2c_client *client)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_read_version, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_version, "IIO_MMA9551");
 
 /**
  * mma9551_set_device_state() - sets HW power mode
@@ -652,7 +652,7 @@ int mma9551_set_device_state(struct i2c_client *client, bool enable)
 					  MMA9551_SLEEP_CFG_FLEEN :
 					  MMA9551_SLEEP_CFG_SNCEN);
 }
-EXPORT_SYMBOL_NS(mma9551_set_device_state, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_set_device_state, "IIO_MMA9551");
 
 /**
  * mma9551_set_power_state() - sets runtime PM state
@@ -686,7 +686,7 @@ int mma9551_set_power_state(struct i2c_client *client, bool on)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mma9551_set_power_state, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_set_power_state, "IIO_MMA9551");
 
 /**
  * mma9551_sleep() - sleep
@@ -705,7 +705,7 @@ void mma9551_sleep(int freq)
 	else
 		msleep_interruptible(sleep_val);
 }
-EXPORT_SYMBOL_NS(mma9551_sleep, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_sleep, "IIO_MMA9551");
 
 /**
  * mma9551_read_accel_chan() - read accelerometer channel
@@ -761,7 +761,7 @@ int mma9551_read_accel_chan(struct i2c_client *client,
 	mma9551_set_power_state(client, false);
 	return ret;
 }
-EXPORT_SYMBOL_NS(mma9551_read_accel_chan, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_accel_chan, "IIO_MMA9551");
 
 /**
  * mma9551_read_accel_scale() - read accelerometer scale
@@ -779,7 +779,7 @@ int mma9551_read_accel_scale(int *val, int *val2)
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-EXPORT_SYMBOL_NS(mma9551_read_accel_scale, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_read_accel_scale, "IIO_MMA9551");
 
 /**
  * mma9551_app_reset() - reset application
@@ -798,7 +798,7 @@ int mma9551_app_reset(struct i2c_client *client, u32 app_mask)
 					 MMA9551_RSC_OFFSET(app_mask),
 					 MMA9551_RSC_VAL(app_mask));
 }
-EXPORT_SYMBOL_NS(mma9551_app_reset, IIO_MMA9551);
+EXPORT_SYMBOL_NS(mma9551_app_reset, "IIO_MMA9551");
 
 MODULE_AUTHOR("Irina Tirdea <irina.tirdea@intel.com>");
 MODULE_AUTHOR("Vlad Dogaru <vlad.dogaru@intel.com>");
diff --git a/drivers/iio/accel/mma9553.c b/drivers/iio/accel/mma9553.c
index 86543f34ef17..f53c7791d5f3 100644
--- a/drivers/iio/accel/mma9553.c
+++ b/drivers/iio/accel/mma9553.c
@@ -1256,4 +1256,4 @@ module_i2c_driver(mma9553_driver);
 MODULE_AUTHOR("Irina Tirdea <irina.tirdea@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MMA9553L pedometer platform driver");
-MODULE_IMPORT_NS(IIO_MMA9551);
+MODULE_IMPORT_NS("IIO_MMA9551");
diff --git a/drivers/iio/accel/ssp_accel_sensor.c b/drivers/iio/accel/ssp_accel_sensor.c
index 7ca9d0d543e0..3e572af2ec03 100644
--- a/drivers/iio/accel/ssp_accel_sensor.c
+++ b/drivers/iio/accel/ssp_accel_sensor.c
@@ -141,4 +141,4 @@ module_platform_driver(ssp_accel_driver);
 MODULE_AUTHOR("Karol Wrona <k.wrona@samsung.com>");
 MODULE_DESCRIPTION("Samsung sensorhub accelerometers driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_SSP_SENSORS);
+MODULE_IMPORT_NS("IIO_SSP_SENSORS");
diff --git a/drivers/iio/accel/st_accel_core.c b/drivers/iio/accel/st_accel_core.c
index 0e371efbda70..99cb661fabb2 100644
--- a/drivers/iio/accel/st_accel_core.c
+++ b/drivers/iio/accel/st_accel_core.c
@@ -1490,7 +1490,7 @@ const struct st_sensor_settings *st_accel_get_settings(const char *name)
 
 	return &st_accel_sensors_settings[index];
 }
-EXPORT_SYMBOL_NS(st_accel_get_settings, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_accel_get_settings, "IIO_ST_SENSORS");
 
 int st_accel_common_probe(struct iio_dev *indio_dev)
 {
@@ -1544,9 +1544,9 @@ int st_accel_common_probe(struct iio_dev *indio_dev)
 
 	return devm_iio_device_register(parent, indio_dev);
 }
-EXPORT_SYMBOL_NS(st_accel_common_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_accel_common_probe, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics accelerometers driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/accel/st_accel_i2c.c b/drivers/iio/accel/st_accel_i2c.c
index 329a4d6fb2ec..ab4fdba75a0a 100644
--- a/drivers/iio/accel/st_accel_i2c.c
+++ b/drivers/iio/accel/st_accel_i2c.c
@@ -216,4 +216,4 @@ module_i2c_driver(st_accel_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics accelerometers i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/accel/st_accel_spi.c b/drivers/iio/accel/st_accel_spi.c
index 825adab37105..6146754fe47f 100644
--- a/drivers/iio/accel/st_accel_spi.c
+++ b/drivers/iio/accel/st_accel_spi.c
@@ -184,4 +184,4 @@ module_spi_driver(st_accel_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics accelerometers spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/adc/ad7091r-base.c b/drivers/iio/adc/ad7091r-base.c
index d6876259ad14..8e030c2ec9cb 100644
--- a/drivers/iio/adc/ad7091r-base.c
+++ b/drivers/iio/adc/ad7091r-base.c
@@ -35,7 +35,7 @@ const struct iio_event_spec ad7091r_events[] = {
 		.mask_separate = BIT(IIO_EV_INFO_HYSTERESIS),
 	},
 };
-EXPORT_SYMBOL_NS_GPL(ad7091r_events, IIO_AD7091R);
+EXPORT_SYMBOL_NS_GPL(ad7091r_events, "IIO_AD7091R");
 
 static int ad7091r_set_channel(struct ad7091r_state *st, unsigned int channel)
 {
@@ -369,7 +369,7 @@ int ad7091r_probe(struct device *dev, const struct ad7091r_init_info *init_info,
 
 	return devm_iio_device_register(dev, iio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(ad7091r_probe, IIO_AD7091R);
+EXPORT_SYMBOL_NS_GPL(ad7091r_probe, "IIO_AD7091R");
 
 bool ad7091r_writeable_reg(struct device *dev, unsigned int reg)
 {
@@ -381,7 +381,7 @@ bool ad7091r_writeable_reg(struct device *dev, unsigned int reg)
 		return true;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(ad7091r_writeable_reg, IIO_AD7091R);
+EXPORT_SYMBOL_NS_GPL(ad7091r_writeable_reg, "IIO_AD7091R");
 
 bool ad7091r_volatile_reg(struct device *dev, unsigned int reg)
 {
@@ -393,7 +393,7 @@ bool ad7091r_volatile_reg(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(ad7091r_volatile_reg, IIO_AD7091R);
+EXPORT_SYMBOL_NS_GPL(ad7091r_volatile_reg, "IIO_AD7091R");
 
 MODULE_AUTHOR("Beniamin Bia <beniamin.bia@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7091Rx multi-channel converters");
diff --git a/drivers/iio/adc/ad7091r5.c b/drivers/iio/adc/ad7091r5.c
index 1b59708abf30..b472b9498fd1 100644
--- a/drivers/iio/adc/ad7091r5.c
+++ b/drivers/iio/adc/ad7091r5.c
@@ -135,4 +135,4 @@ module_i2c_driver(ad7091r5_driver);
 MODULE_AUTHOR("Beniamin Bia <beniamin.bia@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7091R5 multi-channel ADC driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD7091R);
+MODULE_IMPORT_NS("IIO_AD7091R");
diff --git a/drivers/iio/adc/ad7091r8.c b/drivers/iio/adc/ad7091r8.c
index c9e014d6a77c..cebade4c2d49 100644
--- a/drivers/iio/adc/ad7091r8.c
+++ b/drivers/iio/adc/ad7091r8.c
@@ -269,4 +269,4 @@ module_spi_driver(ad7091r8_driver);
 MODULE_AUTHOR("Marcelo Schmitt <marcelo.schmitt@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7091R8 ADC driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_AD7091R);
+MODULE_IMPORT_NS("IIO_AD7091R");
diff --git a/drivers/iio/adc/ad7124.c b/drivers/iio/adc/ad7124.c
index b79c48d46ccc..7314fb32bdec 100644
--- a/drivers/iio/adc/ad7124.c
+++ b/drivers/iio/adc/ad7124.c
@@ -1036,4 +1036,4 @@ module_spi_driver(ad71124_driver);
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7124 SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/ad7173.c b/drivers/iio/adc/ad7173.c
index 0702ec71aa29..31b6f0701795 100644
--- a/drivers/iio/adc/ad7173.c
+++ b/drivers/iio/adc/ad7173.c
@@ -1475,7 +1475,7 @@ static struct spi_driver ad7173_driver = {
 };
 module_spi_driver(ad7173_driver);
 
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafo.de>");
 MODULE_AUTHOR("Dumitru Ceclan <dumitru.ceclan@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7173 and similar ADC driver");
diff --git a/drivers/iio/adc/ad7192.c b/drivers/iio/adc/ad7192.c
index 7042ddfdfc03..1593ec6a5944 100644
--- a/drivers/iio/adc/ad7192.c
+++ b/drivers/iio/adc/ad7192.c
@@ -1458,4 +1458,4 @@ module_spi_driver(ad7192_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7192 and similar ADC");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 9b457472d49c..5eb9b2321156 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -60,7 +60,7 @@ int ad7606_reset(struct ad7606_state *st)
 
 	return -ENODEV;
 }
-EXPORT_SYMBOL_NS_GPL(ad7606_reset, IIO_AD7606);
+EXPORT_SYMBOL_NS_GPL(ad7606_reset, "IIO_AD7606");
 
 static int ad7606_reg_access(struct iio_dev *indio_dev,
 			     unsigned int reg,
@@ -642,7 +642,7 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(ad7606_probe, IIO_AD7606);
+EXPORT_SYMBOL_NS_GPL(ad7606_probe, "IIO_AD7606");
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -674,7 +674,7 @@ static int ad7606_resume(struct device *dev)
 }
 
 SIMPLE_DEV_PM_OPS(ad7606_pm_ops, ad7606_suspend, ad7606_resume);
-EXPORT_SYMBOL_NS_GPL(ad7606_pm_ops, IIO_AD7606);
+EXPORT_SYMBOL_NS_GPL(ad7606_pm_ops, "IIO_AD7606");
 
 #endif
 
diff --git a/drivers/iio/adc/ad7606_par.c b/drivers/iio/adc/ad7606_par.c
index 02d8c309304e..4d5afdf19220 100644
--- a/drivers/iio/adc/ad7606_par.c
+++ b/drivers/iio/adc/ad7606_par.c
@@ -143,4 +143,4 @@ module_platform_driver(ad7606_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD7606);
+MODULE_IMPORT_NS("IIO_AD7606");
diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index 62ec12195307..1bb0732fdc80 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -363,4 +363,4 @@ module_spi_driver(ad7606_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7606 ADC");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD7606);
+MODULE_IMPORT_NS("IIO_AD7606");
diff --git a/drivers/iio/adc/ad7780.c b/drivers/iio/adc/ad7780.c
index e9b0c577c9cc..6f720fedab22 100644
--- a/drivers/iio/adc/ad7780.c
+++ b/drivers/iio/adc/ad7780.c
@@ -375,4 +375,4 @@ module_spi_driver(ad7780_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7780 and similar ADCs");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/ad7791.c b/drivers/iio/adc/ad7791.c
index 86effe8501b4..c6feae28166c 100644
--- a/drivers/iio/adc/ad7791.c
+++ b/drivers/iio/adc/ad7791.c
@@ -474,4 +474,4 @@ module_spi_driver(ad7791_driver);
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("Analog Devices AD7787/AD7788/AD7789/AD7790/AD7791 ADC driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/ad7793.c b/drivers/iio/adc/ad7793.c
index abebd519cafa..0b7ce1a6cb7b 100644
--- a/drivers/iio/adc/ad7793.c
+++ b/drivers/iio/adc/ad7793.c
@@ -849,4 +849,4 @@ module_spi_driver(ad7793_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD7793 and similar ADCs");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/ad9467.c b/drivers/iio/adc/ad9467.c
index 05fb7a75531f..d358958ab310 100644
--- a/drivers/iio/adc/ad9467.c
+++ b/drivers/iio/adc/ad9467.c
@@ -1280,4 +1280,4 @@ module_spi_driver(ad9467_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD9467 ADC driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index ea4aabd3960a..a0b58428e769 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -43,7 +43,7 @@ void ad_sd_set_comm(struct ad_sigma_delta *sigma_delta, uint8_t comm)
 	 * to select the channel */
 	sigma_delta->comm = comm & AD_SD_COMM_CHAN_MASK;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_set_comm, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_set_comm, "IIO_AD_SIGMA_DELTA");
 
 /**
  * ad_sd_write_reg() - Write a register
@@ -95,7 +95,7 @@ int ad_sd_write_reg(struct ad_sigma_delta *sigma_delta, unsigned int reg,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_write_reg, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_write_reg, "IIO_AD_SIGMA_DELTA");
 
 static int ad_sd_read_reg_raw(struct ad_sigma_delta *sigma_delta,
 	unsigned int reg, unsigned int size, uint8_t *val)
@@ -172,7 +172,7 @@ int ad_sd_read_reg(struct ad_sigma_delta *sigma_delta,
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_read_reg, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_read_reg, "IIO_AD_SIGMA_DELTA");
 
 /**
  * ad_sd_reset() - Reset the serial interface
@@ -200,7 +200,7 @@ int ad_sd_reset(struct ad_sigma_delta *sigma_delta,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_reset, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_reset, "IIO_AD_SIGMA_DELTA");
 
 int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
 	unsigned int mode, unsigned int channel)
@@ -239,7 +239,7 @@ int ad_sd_calibrate(struct ad_sigma_delta *sigma_delta,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_calibrate, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_calibrate, "IIO_AD_SIGMA_DELTA");
 
 /**
  * ad_sd_calibrate_all() - Performs channel calibration
@@ -263,7 +263,7 @@ int ad_sd_calibrate_all(struct ad_sigma_delta *sigma_delta,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_calibrate_all, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_calibrate_all, "IIO_AD_SIGMA_DELTA");
 
 /**
  * ad_sigma_delta_single_conversion() - Performs a single data conversion
@@ -339,7 +339,7 @@ int ad_sigma_delta_single_conversion(struct iio_dev *indio_dev,
 
 	return IIO_VAL_INT;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sigma_delta_single_conversion, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sigma_delta_single_conversion, "IIO_AD_SIGMA_DELTA");
 
 static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 {
@@ -564,7 +564,7 @@ int ad_sd_validate_trigger(struct iio_dev *indio_dev, struct iio_trigger *trig)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_validate_trigger, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_validate_trigger, "IIO_AD_SIGMA_DELTA");
 
 static int devm_ad_sd_probe_trigger(struct device *dev, struct iio_dev *indio_dev)
 {
@@ -638,7 +638,7 @@ int devm_ad_sd_setup_buffer_and_trigger(struct device *dev, struct iio_dev *indi
 
 	return devm_ad_sd_probe_trigger(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(devm_ad_sd_setup_buffer_and_trigger, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(devm_ad_sd_setup_buffer_and_trigger, "IIO_AD_SIGMA_DELTA");
 
 /**
  * ad_sd_init() - Initializes a ad_sigma_delta struct
@@ -683,7 +683,7 @@ int ad_sd_init(struct ad_sigma_delta *sigma_delta, struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ad_sd_init, IIO_AD_SIGMA_DELTA);
+EXPORT_SYMBOL_NS_GPL(ad_sd_init, "IIO_AD_SIGMA_DELTA");
 
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("Analog Devices Sigma-Delta ADCs");
diff --git a/drivers/iio/adc/adi-axi-adc.c b/drivers/iio/adc/adi-axi-adc.c
index 5c8c87eb36d1..c7357601f0f8 100644
--- a/drivers/iio/adc/adi-axi-adc.c
+++ b/drivers/iio/adc/adi-axi-adc.c
@@ -437,5 +437,5 @@ module_platform_driver(adi_axi_adc_driver);
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices Generic AXI ADC IP core driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_DMAENGINE_BUFFER);
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_DMAENGINE_BUFFER");
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-core.c
index 996f6cbbed3c..99f870a0dff6 100644
--- a/drivers/iio/adc/ltc2497-core.c
+++ b/drivers/iio/adc/ltc2497-core.c
@@ -231,7 +231,7 @@ int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(ltc2497core_probe, LTC2497);
+EXPORT_SYMBOL_NS(ltc2497core_probe, "LTC2497");
 
 void ltc2497core_remove(struct iio_dev *indio_dev)
 {
@@ -243,7 +243,7 @@ void ltc2497core_remove(struct iio_dev *indio_dev)
 
 	regulator_disable(ddata->ref);
 }
-EXPORT_SYMBOL_NS(ltc2497core_remove, LTC2497);
+EXPORT_SYMBOL_NS(ltc2497core_remove, "LTC2497");
 
 MODULE_DESCRIPTION("common code for LTC2496/LTC2497 drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/adc/ltc2497.h b/drivers/iio/adc/ltc2497.h
index 781519b52475..64e81c95a3dd 100644
--- a/drivers/iio/adc/ltc2497.h
+++ b/drivers/iio/adc/ltc2497.h
@@ -23,4 +23,4 @@ struct ltc2497core_driverdata {
 int ltc2497core_probe(struct device *dev, struct iio_dev *indio_dev);
 void ltc2497core_remove(struct iio_dev *indio_dev);
 
-MODULE_IMPORT_NS(LTC2497);
+MODULE_IMPORT_NS("LTC2497");
diff --git a/drivers/iio/adc/max11205.c b/drivers/iio/adc/max11205.c
index 9d8bc0b154dd..6c803df220b6 100644
--- a/drivers/iio/adc/max11205.c
+++ b/drivers/iio/adc/max11205.c
@@ -177,4 +177,4 @@ module_spi_driver(max11205_spi_driver);
 MODULE_AUTHOR("Ramona Bolboaca <ramona.bolboaca@analog.com>");
 MODULE_DESCRIPTION("MAX11205 ADC driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD_SIGMA_DELTA);
+MODULE_IMPORT_NS("IIO_AD_SIGMA_DELTA");
diff --git a/drivers/iio/adc/men_z188_adc.c b/drivers/iio/adc/men_z188_adc.c
index 198c7e68e0cf..cf8a8c0412ec 100644
--- a/drivers/iio/adc/men_z188_adc.c
+++ b/drivers/iio/adc/men_z188_adc.c
@@ -172,4 +172,4 @@ MODULE_AUTHOR("Johannes Thumshirn <johannes.thumshirn@men.de>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("IIO ADC driver for MEN 16z188 ADC Core");
 MODULE_ALIAS("mcb:16z188");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/iio/adc/sd_adc_modulator.c b/drivers/iio/adc/sd_adc_modulator.c
index 654b6a38b650..9f7a75168aac 100644
--- a/drivers/iio/adc/sd_adc_modulator.c
+++ b/drivers/iio/adc/sd_adc_modulator.c
@@ -159,4 +159,4 @@ module_platform_driver(iio_sd_mod_adc);
 MODULE_DESCRIPTION("Basic sigma delta modulator");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/adc/stm32-dfsdm-adc.c b/drivers/iio/adc/stm32-dfsdm-adc.c
index 2037f73426d4..3c2030fab6fd 100644
--- a/drivers/iio/adc/stm32-dfsdm-adc.c
+++ b/drivers/iio/adc/stm32-dfsdm-adc.c
@@ -1897,4 +1897,4 @@ module_platform_driver(stm32_dfsdm_adc_driver);
 MODULE_DESCRIPTION("STM32 sigma delta ADC");
 MODULE_AUTHOR("Arnaud Pouliquen <arnaud.pouliquen@st.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/addac/stx104.c b/drivers/iio/addac/stx104.c
index 6946a65512ca..7bdf2cb94176 100644
--- a/drivers/iio/addac/stx104.c
+++ b/drivers/iio/addac/stx104.c
@@ -520,4 +520,4 @@ module_isa_driver(stx104_driver, num_stx104);
 MODULE_AUTHOR("William Breathitt Gray <vilhelm.gray@gmail.com>");
 MODULE_DESCRIPTION("Apex Embedded Systems STX104 IIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(I8254);
+MODULE_IMPORT_NS("I8254");
diff --git a/drivers/iio/afe/iio-rescale.c b/drivers/iio/afe/iio-rescale.c
index 56e5913ab82d..b6a46036d5ea 100644
--- a/drivers/iio/afe/iio-rescale.c
+++ b/drivers/iio/afe/iio-rescale.c
@@ -107,7 +107,7 @@ int rescale_process_scale(struct rescale *rescale, int scale_type,
 		return -EOPNOTSUPP;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(rescale_process_scale, IIO_RESCALE);
+EXPORT_SYMBOL_NS_GPL(rescale_process_scale, "IIO_RESCALE");
 
 int rescale_process_offset(struct rescale *rescale, int scale_type,
 			   int scale, int scale2, int schan_off,
@@ -141,7 +141,7 @@ int rescale_process_offset(struct rescale *rescale, int scale_type,
 		return -EOPNOTSUPP;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(rescale_process_offset, IIO_RESCALE);
+EXPORT_SYMBOL_NS_GPL(rescale_process_offset, "IIO_RESCALE");
 
 static int rescale_read_raw(struct iio_dev *indio_dev,
 			    struct iio_chan_spec const *chan,
diff --git a/drivers/iio/buffer/industrialio-buffer-dma.c b/drivers/iio/buffer/industrialio-buffer-dma.c
index dbde1443d6ed..7ea784304ffb 100644
--- a/drivers/iio/buffer/industrialio-buffer-dma.c
+++ b/drivers/iio/buffer/industrialio-buffer-dma.c
@@ -248,7 +248,7 @@ void iio_dma_buffer_block_done(struct iio_dma_buffer_block *block)
 	iio_dma_buffer_queue_wake(queue);
 	dma_fence_end_signalling(cookie);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_block_done, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_block_done, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_block_list_abort() - Indicate that a list block has been
@@ -287,7 +287,7 @@ void iio_dma_buffer_block_list_abort(struct iio_dma_buffer_queue *queue,
 	iio_dma_buffer_queue_wake(queue);
 	dma_fence_end_signalling(cookie);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_block_list_abort, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_block_list_abort, "IIO_DMA_BUFFER");
 
 static bool iio_dma_block_reusable(struct iio_dma_buffer_block *block)
 {
@@ -420,7 +420,7 @@ int iio_dma_buffer_request_update(struct iio_buffer *buffer)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_request_update, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_request_update, "IIO_DMA_BUFFER");
 
 static void iio_dma_buffer_fileio_free(struct iio_dma_buffer_queue *queue)
 {
@@ -506,7 +506,7 @@ int iio_dma_buffer_enable(struct iio_buffer *buffer,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_enable, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_enable, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_disable() - Disable DMA buffer
@@ -530,7 +530,7 @@ int iio_dma_buffer_disable(struct iio_buffer *buffer,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_disable, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_disable, "IIO_DMA_BUFFER");
 
 static void iio_dma_buffer_enqueue(struct iio_dma_buffer_queue *queue,
 	struct iio_dma_buffer_block *block)
@@ -636,7 +636,7 @@ int iio_dma_buffer_read(struct iio_buffer *buffer, size_t n,
 {
 	return iio_dma_buffer_io(buffer, n, user_buffer, false);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_read, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_read, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_write() - DMA buffer write callback
@@ -653,7 +653,7 @@ int iio_dma_buffer_write(struct iio_buffer *buffer, size_t n,
 	return iio_dma_buffer_io(buffer, n,
 				 (__force __user char *)user_buffer, true);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_write, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_write, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_usage() - DMA buffer data_available and
@@ -696,7 +696,7 @@ size_t iio_dma_buffer_usage(struct iio_buffer *buf)
 
 	return data_available;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_usage, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_usage, "IIO_DMA_BUFFER");
 
 struct iio_dma_buffer_block *
 iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
@@ -723,7 +723,7 @@ iio_dma_buffer_attach_dmabuf(struct iio_buffer *buffer,
 
 	return block;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_attach_dmabuf, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_attach_dmabuf, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
 				  struct iio_dma_buffer_block *block)
@@ -731,7 +731,7 @@ void iio_dma_buffer_detach_dmabuf(struct iio_buffer *buffer,
 	block->state = IIO_BLOCK_STATE_DEAD;
 	iio_buffer_block_put_atomic(block);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_detach_dmabuf, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_detach_dmabuf, "IIO_DMA_BUFFER");
 
 static int iio_dma_can_enqueue_block(struct iio_dma_buffer_block *block)
 {
@@ -784,7 +784,7 @@ int iio_dma_buffer_enqueue_dmabuf(struct iio_buffer *buffer,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_enqueue_dmabuf, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_enqueue_dmabuf, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 {
@@ -792,7 +792,7 @@ void iio_dma_buffer_lock_queue(struct iio_buffer *buffer)
 
 	mutex_lock(&queue->lock);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_lock_queue, "IIO_DMA_BUFFER");
 
 void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
 {
@@ -800,7 +800,7 @@ void iio_dma_buffer_unlock_queue(struct iio_buffer *buffer)
 
 	mutex_unlock(&queue->lock);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_unlock_queue, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_unlock_queue, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_set_bytes_per_datum() - DMA buffer set_bytes_per_datum callback
@@ -816,7 +816,7 @@ int iio_dma_buffer_set_bytes_per_datum(struct iio_buffer *buffer, size_t bpd)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_set_bytes_per_datum, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_set_bytes_per_datum, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_set_length - DMA buffer set_length callback
@@ -836,7 +836,7 @@ int iio_dma_buffer_set_length(struct iio_buffer *buffer, unsigned int length)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_set_length, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_set_length, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_init() - Initialize DMA buffer queue
@@ -864,7 +864,7 @@ int iio_dma_buffer_init(struct iio_dma_buffer_queue *queue,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_init, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_init, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_exit() - Cleanup DMA buffer queue
@@ -882,7 +882,7 @@ void iio_dma_buffer_exit(struct iio_dma_buffer_queue *queue)
 
 	mutex_unlock(&queue->lock);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_exit, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_exit, "IIO_DMA_BUFFER");
 
 /**
  * iio_dma_buffer_release() - Release final buffer resources
@@ -896,7 +896,7 @@ void iio_dma_buffer_release(struct iio_dma_buffer_queue *queue)
 {
 	mutex_destroy(&queue->lock);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_release, IIO_DMA_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dma_buffer_release, "IIO_DMA_BUFFER");
 
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("DMA buffer for the IIO framework");
diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
index 19af1caf14cd..d2e1529ad8fd 100644
--- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
+++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
@@ -286,7 +286,7 @@ void iio_dmaengine_buffer_free(struct iio_buffer *buffer)
 
 	iio_buffer_put(buffer);
 }
-EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_free, IIO_DMAENGINE_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_free, "IIO_DMAENGINE_BUFFER");
 
 struct iio_buffer *iio_dmaengine_buffer_setup_ext(struct device *dev,
 						  struct iio_dev *indio_dev,
@@ -312,7 +312,7 @@ struct iio_buffer *iio_dmaengine_buffer_setup_ext(struct device *dev,
 
 	return buffer;
 }
-EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_setup_ext, IIO_DMAENGINE_BUFFER);
+EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_setup_ext, "IIO_DMAENGINE_BUFFER");
 
 static void __devm_iio_dmaengine_buffer_free(void *buffer)
 {
@@ -345,9 +345,9 @@ int devm_iio_dmaengine_buffer_setup_ext(struct device *dev,
 	return devm_add_action_or_reset(dev, __devm_iio_dmaengine_buffer_free,
 					buffer);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_dmaengine_buffer_setup_ext, IIO_DMAENGINE_BUFFER);
+EXPORT_SYMBOL_NS_GPL(devm_iio_dmaengine_buffer_setup_ext, "IIO_DMAENGINE_BUFFER");
 
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("DMA buffer for the IIO framework");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_DMA_BUFFER);
+MODULE_IMPORT_NS("IIO_DMA_BUFFER");
diff --git a/drivers/iio/chemical/bme680_core.c b/drivers/iio/chemical/bme680_core.c
index 0b96534c6867..a0a0c0b76cf2 100644
--- a/drivers/iio/chemical/bme680_core.c
+++ b/drivers/iio/chemical/bme680_core.c
@@ -133,7 +133,7 @@ const struct regmap_config bme680_regmap_config = {
 	.volatile_table = &bme680_volatile_table,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS(bme680_regmap_config, IIO_BME680);
+EXPORT_SYMBOL_NS(bme680_regmap_config, "IIO_BME680");
 
 static const struct iio_chan_spec bme680_channels[] = {
 	{
@@ -924,7 +924,7 @@ int bme680_core_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(bme680_core_probe, IIO_BME680);
+EXPORT_SYMBOL_NS_GPL(bme680_core_probe, "IIO_BME680");
 
 MODULE_AUTHOR("Himanshu Jha <himanshujha199640@gmail.com>");
 MODULE_DESCRIPTION("Bosch BME680 Driver");
diff --git a/drivers/iio/chemical/bme680_i2c.c b/drivers/iio/chemical/bme680_i2c.c
index 7c4224d75955..7a949228b4a6 100644
--- a/drivers/iio/chemical/bme680_i2c.c
+++ b/drivers/iio/chemical/bme680_i2c.c
@@ -60,4 +60,4 @@ module_i2c_driver(bme680_i2c_driver);
 MODULE_AUTHOR("Himanshu Jha <himanshujha199640@gmail.com>");
 MODULE_DESCRIPTION("BME680 I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BME680);
+MODULE_IMPORT_NS("IIO_BME680");
diff --git a/drivers/iio/chemical/bme680_spi.c b/drivers/iio/chemical/bme680_spi.c
index 7c54bd17d4b0..3916a51ba68e 100644
--- a/drivers/iio/chemical/bme680_spi.c
+++ b/drivers/iio/chemical/bme680_spi.c
@@ -163,4 +163,4 @@ module_spi_driver(bme680_spi_driver);
 MODULE_AUTHOR("Himanshu Jha <himanshujha199640@gmail.com>");
 MODULE_DESCRIPTION("Bosch BME680 SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BME680);
+MODULE_IMPORT_NS("IIO_BME680");
diff --git a/drivers/iio/chemical/ens160_core.c b/drivers/iio/chemical/ens160_core.c
index c1aa3b498d3b..4a89cd5894d9 100644
--- a/drivers/iio/chemical/ens160_core.c
+++ b/drivers/iio/chemical/ens160_core.c
@@ -360,7 +360,7 @@ int devm_ens160_core_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS(devm_ens160_core_probe, IIO_ENS160);
+EXPORT_SYMBOL_NS(devm_ens160_core_probe, "IIO_ENS160");
 
 MODULE_AUTHOR("Gustavo Silva <gustavograzs@gmail.com>");
 MODULE_DESCRIPTION("ScioSense ENS160 driver");
diff --git a/drivers/iio/chemical/ens160_i2c.c b/drivers/iio/chemical/ens160_i2c.c
index 57a189a4c257..aa0dfe639245 100644
--- a/drivers/iio/chemical/ens160_i2c.c
+++ b/drivers/iio/chemical/ens160_i2c.c
@@ -59,4 +59,4 @@ module_i2c_driver(ens160_i2c_driver);
 MODULE_AUTHOR("Gustavo Silva <gustavograzs@gmail.com>");
 MODULE_DESCRIPTION("ScioSense ENS160 I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ENS160);
+MODULE_IMPORT_NS("IIO_ENS160");
diff --git a/drivers/iio/chemical/ens160_spi.c b/drivers/iio/chemical/ens160_spi.c
index 10e4f5fd0f45..a674c0e1bf4b 100644
--- a/drivers/iio/chemical/ens160_spi.c
+++ b/drivers/iio/chemical/ens160_spi.c
@@ -58,4 +58,4 @@ module_spi_driver(ens160_spi_driver);
 MODULE_AUTHOR("Gustavo Silva <gustavograzs@gmail.com>");
 MODULE_DESCRIPTION("ScioSense ENS160 SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ENS160);
+MODULE_IMPORT_NS("IIO_ENS160");
diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index 7be5a45cf71a..ac3080929f0b 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -747,7 +747,7 @@ int scd30_probe(struct device *dev, int irq, const char *name, void *priv,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS(scd30_probe, IIO_SCD30);
+EXPORT_SYMBOL_NS(scd30_probe, "IIO_SCD30");
 
 MODULE_AUTHOR("Tomasz Duszynski <tomasz.duszynski@octakon.com>");
 MODULE_DESCRIPTION("Sensirion SCD30 carbon dioxide sensor core driver");
diff --git a/drivers/iio/chemical/scd30_i2c.c b/drivers/iio/chemical/scd30_i2c.c
index b31dfaf52df9..436df9c61a71 100644
--- a/drivers/iio/chemical/scd30_i2c.c
+++ b/drivers/iio/chemical/scd30_i2c.c
@@ -137,4 +137,4 @@ module_i2c_driver(scd30_i2c_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tomasz.duszynski@octakon.com>");
 MODULE_DESCRIPTION("Sensirion SCD30 carbon dioxide sensor i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_SCD30);
+MODULE_IMPORT_NS("IIO_SCD30");
diff --git a/drivers/iio/chemical/scd30_serial.c b/drivers/iio/chemical/scd30_serial.c
index 55044f07d5a3..e8b453aae859 100644
--- a/drivers/iio/chemical/scd30_serial.c
+++ b/drivers/iio/chemical/scd30_serial.c
@@ -261,4 +261,4 @@ module_serdev_device_driver(scd30_serdev_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tomasz.duszynski@octakon.com>");
 MODULE_DESCRIPTION("Sensirion SCD30 carbon dioxide sensor serial driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_SCD30);
+MODULE_IMPORT_NS("IIO_SCD30");
diff --git a/drivers/iio/chemical/sps30.c b/drivers/iio/chemical/sps30.c
index 814ce0aad1cc..6f4f2ba2c09d 100644
--- a/drivers/iio/chemical/sps30.c
+++ b/drivers/iio/chemical/sps30.c
@@ -372,7 +372,7 @@ int sps30_probe(struct device *dev, const char *name, void *priv, const struct s
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(sps30_probe, IIO_SPS30);
+EXPORT_SYMBOL_NS_GPL(sps30_probe, "IIO_SPS30");
 
 MODULE_AUTHOR("Tomasz Duszynski <tduszyns@gmail.com>");
 MODULE_DESCRIPTION("Sensirion SPS30 particulate matter sensor driver");
diff --git a/drivers/iio/chemical/sps30_i2c.c b/drivers/iio/chemical/sps30_i2c.c
index 1b21b6bcd0e7..f692c089d17b 100644
--- a/drivers/iio/chemical/sps30_i2c.c
+++ b/drivers/iio/chemical/sps30_i2c.c
@@ -256,4 +256,4 @@ module_i2c_driver(sps30_i2c_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tomasz.duszynski@octakon.com>");
 MODULE_DESCRIPTION("Sensirion SPS30 particulate matter sensor i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_SPS30);
+MODULE_IMPORT_NS("IIO_SPS30");
diff --git a/drivers/iio/chemical/sps30_serial.c b/drivers/iio/chemical/sps30_serial.c
index a6dfbe28c914..008bc88590f3 100644
--- a/drivers/iio/chemical/sps30_serial.c
+++ b/drivers/iio/chemical/sps30_serial.c
@@ -429,4 +429,4 @@ module_serdev_device_driver(sps30_serial_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tomasz.duszynski@octakon.com>");
 MODULE_DESCRIPTION("Sensirion SPS30 particulate matter sensor serial driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_SPS30);
+MODULE_IMPORT_NS("IIO_SPS30");
diff --git a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
index 9b279937a24e..ad1882f608c0 100644
--- a/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-attributes.c
@@ -169,7 +169,7 @@ s32 hid_sensor_read_poll_value(struct hid_sensor_common *st)
 
 	return value;
 }
-EXPORT_SYMBOL_NS(hid_sensor_read_poll_value, IIO_HID_ATTRIBUTES);
+EXPORT_SYMBOL_NS(hid_sensor_read_poll_value, "IIO_HID_ATTRIBUTES");
 
 int hid_sensor_read_samp_freq_value(struct hid_sensor_common *st,
 				int *val1, int *val2)
@@ -196,7 +196,7 @@ int hid_sensor_read_samp_freq_value(struct hid_sensor_common *st,
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-EXPORT_SYMBOL_NS(hid_sensor_read_samp_freq_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_read_samp_freq_value, "IIO_HID");
 
 int hid_sensor_write_samp_freq_value(struct hid_sensor_common *st,
 				int val1, int val2)
@@ -231,7 +231,7 @@ int hid_sensor_write_samp_freq_value(struct hid_sensor_common *st,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_write_samp_freq_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_write_samp_freq_value, "IIO_HID");
 
 int hid_sensor_read_raw_hyst_value(struct hid_sensor_common *st,
 				int *val1, int *val2)
@@ -254,7 +254,7 @@ int hid_sensor_read_raw_hyst_value(struct hid_sensor_common *st,
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-EXPORT_SYMBOL_NS(hid_sensor_read_raw_hyst_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_read_raw_hyst_value, "IIO_HID");
 
 int hid_sensor_read_raw_hyst_rel_value(struct hid_sensor_common *st, int *val1,
 				       int *val2)
@@ -276,7 +276,7 @@ int hid_sensor_read_raw_hyst_rel_value(struct hid_sensor_common *st, int *val1,
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-EXPORT_SYMBOL_NS(hid_sensor_read_raw_hyst_rel_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_read_raw_hyst_rel_value, "IIO_HID");
 
 
 int hid_sensor_write_raw_hyst_value(struct hid_sensor_common *st,
@@ -308,7 +308,7 @@ int hid_sensor_write_raw_hyst_value(struct hid_sensor_common *st,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_write_raw_hyst_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_write_raw_hyst_value, "IIO_HID");
 
 int hid_sensor_write_raw_hyst_rel_value(struct hid_sensor_common *st,
 					int val1, int val2)
@@ -339,7 +339,7 @@ int hid_sensor_write_raw_hyst_rel_value(struct hid_sensor_common *st,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_write_raw_hyst_rel_value, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_write_raw_hyst_rel_value, "IIO_HID");
 
 /*
  * This fuction applies the unit exponent to the scale.
@@ -423,14 +423,14 @@ int hid_sensor_format_scale(u32 usage_id,
 
 	return IIO_VAL_INT_PLUS_NANO;
 }
-EXPORT_SYMBOL_NS(hid_sensor_format_scale, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_format_scale, "IIO_HID");
 
 int64_t hid_sensor_convert_timestamp(struct hid_sensor_common *st,
 				     int64_t raw_value)
 {
 	return st->timestamp_ns_scale * raw_value;
 }
-EXPORT_SYMBOL_NS(hid_sensor_convert_timestamp, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_convert_timestamp, "IIO_HID");
 
 static
 int hid_sensor_get_reporting_interval(struct hid_sensor_hub_device *hsdev,
@@ -477,7 +477,7 @@ int hid_sensor_get_report_latency(struct hid_sensor_common *st)
 
 	return value;
 }
-EXPORT_SYMBOL_NS(hid_sensor_get_report_latency, IIO_HID_ATTRIBUTES);
+EXPORT_SYMBOL_NS(hid_sensor_get_report_latency, "IIO_HID_ATTRIBUTES");
 
 int hid_sensor_set_report_latency(struct hid_sensor_common *st, int latency_ms)
 {
@@ -485,13 +485,13 @@ int hid_sensor_set_report_latency(struct hid_sensor_common *st, int latency_ms)
 				      st->report_latency.index,
 				      sizeof(latency_ms), &latency_ms);
 }
-EXPORT_SYMBOL_NS(hid_sensor_set_report_latency, IIO_HID_ATTRIBUTES);
+EXPORT_SYMBOL_NS(hid_sensor_set_report_latency, "IIO_HID_ATTRIBUTES");
 
 bool hid_sensor_batch_mode_supported(struct hid_sensor_common *st)
 {
 	return st->report_latency.index > 0 && st->report_latency.report_id > 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_batch_mode_supported, IIO_HID_ATTRIBUTES);
+EXPORT_SYMBOL_NS(hid_sensor_batch_mode_supported, "IIO_HID_ATTRIBUTES");
 
 int hid_sensor_parse_common_attributes(struct hid_sensor_hub_device *hsdev,
 					u32 usage_id,
@@ -583,7 +583,7 @@ int hid_sensor_parse_common_attributes(struct hid_sensor_hub_device *hsdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_parse_common_attributes, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_parse_common_attributes, "IIO_HID");
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_DESCRIPTION("HID Sensor common attribute processing");
diff --git a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
index abb09fefc792..48193937275b 100644
--- a/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
+++ b/drivers/iio/common/hid-sensors/hid-sensor-trigger.c
@@ -147,7 +147,7 @@ static int _hid_sensor_power_state(struct hid_sensor_common *st, bool state)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hid_sensor_power_state, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_power_state, "IIO_HID");
 
 int hid_sensor_power_state(struct hid_sensor_common *st, bool state)
 {
@@ -222,7 +222,7 @@ void hid_sensor_remove_trigger(struct iio_dev *indio_dev,
 	iio_trigger_free(attrb->trigger);
 	iio_triggered_buffer_cleanup(indio_dev);
 }
-EXPORT_SYMBOL_NS(hid_sensor_remove_trigger, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_remove_trigger, "IIO_HID");
 
 static const struct iio_trigger_ops hid_sensor_trigger_ops = {
 	.set_trigger_state = &hid_sensor_data_rdy_trigger_set_state,
@@ -289,7 +289,7 @@ int hid_sensor_setup_trigger(struct iio_dev *indio_dev, const char *name,
 	iio_triggered_buffer_cleanup(indio_dev);
 	return ret;
 }
-EXPORT_SYMBOL_NS(hid_sensor_setup_trigger, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_setup_trigger, "IIO_HID");
 
 static int __maybe_unused hid_sensor_suspend(struct device *dev)
 {
@@ -319,9 +319,9 @@ const struct dev_pm_ops hid_sensor_pm_ops = {
 	SET_RUNTIME_PM_OPS(hid_sensor_suspend,
 			   hid_sensor_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_NS(hid_sensor_pm_ops, IIO_HID);
+EXPORT_SYMBOL_NS(hid_sensor_pm_ops, "IIO_HID");
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_DESCRIPTION("HID Sensor trigger processing");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID_ATTRIBUTES);
+MODULE_IMPORT_NS("IIO_HID_ATTRIBUTES");
diff --git a/drivers/iio/common/inv_sensors/inv_sensors_timestamp.c b/drivers/iio/common/inv_sensors/inv_sensors_timestamp.c
index f44458c380d9..eba75007062e 100644
--- a/drivers/iio/common/inv_sensors/inv_sensors_timestamp.c
+++ b/drivers/iio/common/inv_sensors/inv_sensors_timestamp.c
@@ -55,7 +55,7 @@ void inv_sensors_timestamp_init(struct inv_sensors_timestamp *ts,
 	/* use theoretical value for chip period */
 	inv_update_acc(&ts->chip_period, chip->clock_period);
 }
-EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_init, IIO_INV_SENSORS_TIMESTAMP);
+EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_init, "IIO_INV_SENSORS_TIMESTAMP");
 
 int inv_sensors_timestamp_update_odr(struct inv_sensors_timestamp *ts,
 				     uint32_t period, bool fifo)
@@ -72,7 +72,7 @@ int inv_sensors_timestamp_update_odr(struct inv_sensors_timestamp *ts,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_update_odr, IIO_INV_SENSORS_TIMESTAMP);
+EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_update_odr, "IIO_INV_SENSORS_TIMESTAMP");
 
 static bool inv_validate_period(struct inv_sensors_timestamp *ts, uint32_t period)
 {
@@ -162,7 +162,7 @@ void inv_sensors_timestamp_interrupt(struct inv_sensors_timestamp *ts,
 	if (valid)
 		inv_align_timestamp_it(ts);
 }
-EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_interrupt, IIO_INV_SENSORS_TIMESTAMP);
+EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_interrupt, "IIO_INV_SENSORS_TIMESTAMP");
 
 void inv_sensors_timestamp_apply_odr(struct inv_sensors_timestamp *ts,
 				     uint32_t fifo_period, size_t fifo_nb,
@@ -194,7 +194,7 @@ void inv_sensors_timestamp_apply_odr(struct inv_sensors_timestamp *ts,
 		ts->timestamp = ts->it.up - interval;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_apply_odr, IIO_INV_SENSORS_TIMESTAMP);
+EXPORT_SYMBOL_NS_GPL(inv_sensors_timestamp_apply_odr, "IIO_INV_SENSORS_TIMESTAMP");
 
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense sensors timestamp module");
diff --git a/drivers/iio/common/ms_sensors/ms_sensors_i2c.c b/drivers/iio/common/ms_sensors/ms_sensors_i2c.c
index 9c9bc77003c7..588470863681 100644
--- a/drivers/iio/common/ms_sensors/ms_sensors_i2c.c
+++ b/drivers/iio/common/ms_sensors/ms_sensors_i2c.c
@@ -58,7 +58,7 @@ int ms_sensors_reset(void *cli, u8 cmd, unsigned int delay)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_reset, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_reset, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_read_prom_word() - PROM word read function
@@ -84,7 +84,7 @@ int ms_sensors_read_prom_word(void *cli, int cmd, u16 *word)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_read_prom_word, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_read_prom_word, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_convert_and_read() - ADC conversion & read function
@@ -130,7 +130,7 @@ int ms_sensors_convert_and_read(void *cli, u8 conv, u8 rd,
 	dev_err(&client->dev, "Unable to make sensor adc conversion\n");
 	return ret;
 }
-EXPORT_SYMBOL_NS(ms_sensors_convert_and_read, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_convert_and_read, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_crc_valid() - CRC check function
@@ -248,7 +248,7 @@ int ms_sensors_read_serial(struct i2c_client *client, u64 *sn)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_read_serial, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_read_serial, "IIO_MEAS_SPEC_SENSORS");
 
 static int ms_sensors_read_config_reg(struct i2c_client *client,
 				      u8 *config_reg)
@@ -299,7 +299,7 @@ ssize_t ms_sensors_write_resolution(struct ms_ht_dev *dev_data,
 					 MS_SENSORS_CONFIG_REG_WRITE,
 					 config_reg);
 }
-EXPORT_SYMBOL_NS(ms_sensors_write_resolution, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_write_resolution, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_show_battery_low() - Show device battery low indicator
@@ -326,7 +326,7 @@ ssize_t ms_sensors_show_battery_low(struct ms_ht_dev *dev_data,
 
 	return sysfs_emit(buf, "%d\n", (config_reg & 0x40) >> 6);
 }
-EXPORT_SYMBOL_NS(ms_sensors_show_battery_low, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_show_battery_low, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_show_heater() - Show device heater
@@ -353,7 +353,7 @@ ssize_t ms_sensors_show_heater(struct ms_ht_dev *dev_data,
 
 	return sysfs_emit(buf, "%d\n", (config_reg & 0x4) >> 2);
 }
-EXPORT_SYMBOL_NS(ms_sensors_show_heater, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_show_heater, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_write_heater() - Write device heater
@@ -401,7 +401,7 @@ ssize_t ms_sensors_write_heater(struct ms_ht_dev *dev_data,
 
 	return len;
 }
-EXPORT_SYMBOL_NS(ms_sensors_write_heater, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_write_heater, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_ht_read_temperature() - Read temperature
@@ -442,7 +442,7 @@ int ms_sensors_ht_read_temperature(struct ms_ht_dev *dev_data,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_ht_read_temperature, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_ht_read_temperature, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_ht_read_humidity() - Read humidity
@@ -485,7 +485,7 @@ int ms_sensors_ht_read_humidity(struct ms_ht_dev *dev_data,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_ht_read_humidity, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_ht_read_humidity, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_tp_crc4() - Calculate PROM CRC for
@@ -602,7 +602,7 @@ int ms_sensors_tp_read_prom(struct ms_tp_dev *dev_data)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_tp_read_prom, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_tp_read_prom, "IIO_MEAS_SPEC_SENSORS");
 
 /**
  * ms_sensors_read_temp_and_pressure() - read temp and pressure
@@ -688,7 +688,7 @@ int ms_sensors_read_temp_and_pressure(struct ms_tp_dev *dev_data,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms_sensors_read_temp_and_pressure, IIO_MEAS_SPEC_SENSORS);
+EXPORT_SYMBOL_NS(ms_sensors_read_temp_and_pressure, "IIO_MEAS_SPEC_SENSORS");
 
 MODULE_DESCRIPTION("Measurement-Specialties common i2c driver");
 MODULE_AUTHOR("William Markezana <william.markezana@meas-spec.com>");
diff --git a/drivers/iio/common/ssp_sensors/ssp_dev.c b/drivers/iio/common/ssp_sensors/ssp_dev.c
index e64d242145e0..65f8a2b13cfd 100644
--- a/drivers/iio/common/ssp_sensors/ssp_dev.c
+++ b/drivers/iio/common/ssp_sensors/ssp_dev.c
@@ -205,7 +205,7 @@ u32 ssp_get_sensor_delay(struct ssp_data *data, enum ssp_sensor_type type)
 {
 	return data->delay_buf[type];
 }
-EXPORT_SYMBOL_NS(ssp_get_sensor_delay, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_get_sensor_delay, "IIO_SSP_SENSORS");
 
 /**
  * ssp_enable_sensor() - enables data acquisition for sensor
@@ -267,7 +267,7 @@ int ssp_enable_sensor(struct ssp_data *data, enum ssp_sensor_type type,
 derror:
 	return ret;
 }
-EXPORT_SYMBOL_NS(ssp_enable_sensor, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_enable_sensor, "IIO_SSP_SENSORS");
 
 /**
  * ssp_change_delay() - changes data acquisition for sensor
@@ -298,7 +298,7 @@ int ssp_change_delay(struct ssp_data *data, enum ssp_sensor_type type,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ssp_change_delay, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_change_delay, "IIO_SSP_SENSORS");
 
 /**
  * ssp_disable_sensor() - disables sensor
@@ -335,7 +335,7 @@ int ssp_disable_sensor(struct ssp_data *data, enum ssp_sensor_type type)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ssp_disable_sensor, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_disable_sensor, "IIO_SSP_SENSORS");
 
 static irqreturn_t ssp_irq_thread_fn(int irq, void *dev_id)
 {
@@ -478,7 +478,7 @@ void ssp_register_consumer(struct iio_dev *indio_dev, enum ssp_sensor_type type)
 
 	data->sensor_devs[type] = indio_dev;
 }
-EXPORT_SYMBOL_NS(ssp_register_consumer, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_register_consumer, "IIO_SSP_SENSORS");
 
 static int ssp_probe(struct spi_device *spi)
 {
diff --git a/drivers/iio/common/ssp_sensors/ssp_iio.c b/drivers/iio/common/ssp_sensors/ssp_iio.c
index 88b8b56bfa51..caa404edd9d0 100644
--- a/drivers/iio/common/ssp_sensors/ssp_iio.c
+++ b/drivers/iio/common/ssp_sensors/ssp_iio.c
@@ -32,7 +32,7 @@ int ssp_common_buffer_postenable(struct iio_dev *indio_dev)
 	return ssp_enable_sensor(data, spd->type,
 				 ssp_get_sensor_delay(data, spd->type));
 }
-EXPORT_SYMBOL_NS(ssp_common_buffer_postenable, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_common_buffer_postenable, "IIO_SSP_SENSORS");
 
 /**
  * ssp_common_buffer_postdisable() - generic postdisable callback for ssp buffer
@@ -55,7 +55,7 @@ int ssp_common_buffer_postdisable(struct iio_dev *indio_dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(ssp_common_buffer_postdisable, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_common_buffer_postdisable, "IIO_SSP_SENSORS");
 
 /**
  * ssp_common_process_data() - Common process data callback for ssp sensors
@@ -91,9 +91,9 @@ int ssp_common_process_data(struct iio_dev *indio_dev, void *buf,
 	return iio_push_to_buffers_with_timestamp(indio_dev, spd->buffer,
 						  calculated_time);
 }
-EXPORT_SYMBOL_NS(ssp_common_process_data, IIO_SSP_SENSORS);
+EXPORT_SYMBOL_NS(ssp_common_process_data, "IIO_SSP_SENSORS");
 
 MODULE_AUTHOR("Karol Wrona <k.wrona@samsung.com>");
 MODULE_DESCRIPTION("Samsung sensorhub commons");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_SSP_SENSORS);
+MODULE_IMPORT_NS("IIO_SSP_SENSORS");
diff --git a/drivers/iio/common/st_sensors/st_sensors_buffer.c b/drivers/iio/common/st_sensors/st_sensors_buffer.c
index e2f108ca949c..57f087c2216f 100644
--- a/drivers/iio/common/st_sensors/st_sensors_buffer.c
+++ b/drivers/iio/common/st_sensors/st_sensors_buffer.c
@@ -76,4 +76,4 @@ irqreturn_t st_sensors_trigger_handler(int irq, void *p)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(st_sensors_trigger_handler, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_trigger_handler, "IIO_ST_SENSORS");
diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index 1b4287991d00..e4f5a7ff7e74 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -46,7 +46,7 @@ int st_sensors_debugfs_reg_access(struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_debugfs_reg_access, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_debugfs_reg_access, "IIO_ST_SENSORS");
 
 static int st_sensors_match_odr(struct st_sensor_settings *sensor_settings,
 			unsigned int odr, struct st_sensor_odr_avl *odr_out)
@@ -110,7 +110,7 @@ int st_sensors_set_odr(struct iio_dev *indio_dev, unsigned int odr)
 
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_set_odr, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_set_odr, "IIO_ST_SENSORS");
 
 static int st_sensors_match_fs(struct st_sensor_settings *sensor_settings,
 					unsigned int fs, int *index_fs_avl)
@@ -203,7 +203,7 @@ int st_sensors_set_enable(struct iio_dev *indio_dev, bool enable)
 set_enable_error:
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_set_enable, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_set_enable, "IIO_ST_SENSORS");
 
 int st_sensors_set_axis_enable(struct iio_dev *indio_dev, u8 axis_enable)
 {
@@ -217,7 +217,7 @@ int st_sensors_set_axis_enable(struct iio_dev *indio_dev, u8 axis_enable)
 				axis_enable);
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_set_axis_enable, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_set_axis_enable, "IIO_ST_SENSORS");
 
 
 int st_sensors_power_enable(struct iio_dev *indio_dev)
@@ -236,7 +236,7 @@ int st_sensors_power_enable(struct iio_dev *indio_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_power_enable, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_power_enable, "IIO_ST_SENSORS");
 
 static int st_sensors_set_drdy_int_pin(struct iio_dev *indio_dev,
 					struct st_sensors_platform_data *pdata)
@@ -331,7 +331,7 @@ void st_sensors_dev_name_probe(struct device *dev, char *name, int len)
 	/* The name from the match takes precedence if present */
 	strscpy(name, match, len);
 }
-EXPORT_SYMBOL_NS(st_sensors_dev_name_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_dev_name_probe, "IIO_ST_SENSORS");
 
 int st_sensors_init_sensor(struct iio_dev *indio_dev,
 					struct st_sensors_platform_data *pdata)
@@ -418,7 +418,7 @@ int st_sensors_init_sensor(struct iio_dev *indio_dev,
 
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_init_sensor, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_init_sensor, "IIO_ST_SENSORS");
 
 int st_sensors_set_dataready_irq(struct iio_dev *indio_dev, bool enable)
 {
@@ -467,7 +467,7 @@ int st_sensors_set_dataready_irq(struct iio_dev *indio_dev, bool enable)
 st_accel_set_dataready_irq_error:
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_set_dataready_irq, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_set_dataready_irq, "IIO_ST_SENSORS");
 
 int st_sensors_set_fullscale_by_gain(struct iio_dev *indio_dev, int scale)
 {
@@ -490,7 +490,7 @@ int st_sensors_set_fullscale_by_gain(struct iio_dev *indio_dev, int scale)
 st_sensors_match_scale_error:
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_set_fullscale_by_gain, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_set_fullscale_by_gain, "IIO_ST_SENSORS");
 
 static int st_sensors_read_axis_data(struct iio_dev *indio_dev,
 				     struct iio_chan_spec const *ch, int *data)
@@ -555,7 +555,7 @@ int st_sensors_read_info_raw(struct iio_dev *indio_dev,
 
 	return err;
 }
-EXPORT_SYMBOL_NS(st_sensors_read_info_raw, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_read_info_raw, "IIO_ST_SENSORS");
 
 /*
  * st_sensors_get_settings_index() - get index of the sensor settings for a
@@ -582,7 +582,7 @@ int st_sensors_get_settings_index(const char *name,
 
 	return -ENODEV;
 }
-EXPORT_SYMBOL_NS(st_sensors_get_settings_index, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_get_settings_index, "IIO_ST_SENSORS");
 
 /*
  * st_sensors_verify_id() - verify sensor ID (WhoAmI) is matching with the
@@ -614,7 +614,7 @@ int st_sensors_verify_id(struct iio_dev *indio_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_verify_id, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_verify_id, "IIO_ST_SENSORS");
 
 ssize_t st_sensors_sysfs_sampling_frequency_avail(struct device *dev,
 				struct device_attribute *attr, char *buf)
@@ -634,7 +634,7 @@ ssize_t st_sensors_sysfs_sampling_frequency_avail(struct device *dev,
 
 	return len;
 }
-EXPORT_SYMBOL_NS(st_sensors_sysfs_sampling_frequency_avail, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_sysfs_sampling_frequency_avail, "IIO_ST_SENSORS");
 
 ssize_t st_sensors_sysfs_scale_avail(struct device *dev,
 				struct device_attribute *attr, char *buf)
@@ -656,7 +656,7 @@ ssize_t st_sensors_sysfs_scale_avail(struct device *dev,
 
 	return len;
 }
-EXPORT_SYMBOL_NS(st_sensors_sysfs_scale_avail, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_sysfs_scale_avail, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics ST-sensors core");
diff --git a/drivers/iio/common/st_sensors/st_sensors_i2c.c b/drivers/iio/common/st_sensors/st_sensors_i2c.c
index ee95082c7410..7156302fe997 100644
--- a/drivers/iio/common/st_sensors/st_sensors_i2c.c
+++ b/drivers/iio/common/st_sensors/st_sensors_i2c.c
@@ -61,7 +61,7 @@ int st_sensors_i2c_configure(struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_i2c_configure, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_i2c_configure, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics ST-sensors i2c driver");
diff --git a/drivers/iio/common/st_sensors/st_sensors_spi.c b/drivers/iio/common/st_sensors/st_sensors_spi.c
index 63e302c3fbaa..0da27013943d 100644
--- a/drivers/iio/common/st_sensors/st_sensors_spi.c
+++ b/drivers/iio/common/st_sensors/st_sensors_spi.c
@@ -113,7 +113,7 @@ int st_sensors_spi_configure(struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_spi_configure, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_spi_configure, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics ST-sensors spi driver");
diff --git a/drivers/iio/common/st_sensors/st_sensors_trigger.c b/drivers/iio/common/st_sensors/st_sensors_trigger.c
index a0df9250a69f..66c4cd12b0ed 100644
--- a/drivers/iio/common/st_sensors/st_sensors_trigger.c
+++ b/drivers/iio/common/st_sensors/st_sensors_trigger.c
@@ -227,7 +227,7 @@ int st_sensors_allocate_trigger(struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_allocate_trigger, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_allocate_trigger, "IIO_ST_SENSORS");
 
 int st_sensors_validate_device(struct iio_trigger *trig,
 			       struct iio_dev *indio_dev)
@@ -239,4 +239,4 @@ int st_sensors_validate_device(struct iio_trigger *trig,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_sensors_validate_device, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_sensors_validate_device, "IIO_ST_SENSORS");
diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 4763402dbcd6..50d19304bacb 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -665,7 +665,7 @@ int ad5592r_probe(struct device *dev, const char *name,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad5592r_probe, IIO_AD5592R);
+EXPORT_SYMBOL_NS_GPL(ad5592r_probe, "IIO_AD5592R");
 
 void ad5592r_remove(struct device *dev)
 {
@@ -679,7 +679,7 @@ void ad5592r_remove(struct device *dev)
 	if (st->reg)
 		regulator_disable(st->reg);
 }
-EXPORT_SYMBOL_NS_GPL(ad5592r_remove, IIO_AD5592R);
+EXPORT_SYMBOL_NS_GPL(ad5592r_remove, "IIO_AD5592R");
 
 MODULE_AUTHOR("Paul Cercueil <paul.cercueil@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5592R multi-channel converters");
diff --git a/drivers/iio/dac/ad5592r.c b/drivers/iio/dac/ad5592r.c
index 32d950bbb1ca..fd82d8701322 100644
--- a/drivers/iio/dac/ad5592r.c
+++ b/drivers/iio/dac/ad5592r.c
@@ -168,4 +168,4 @@ module_spi_driver(ad5592r_spi_driver);
 MODULE_AUTHOR("Paul Cercueil <paul.cercueil@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5592R multi-channel converters");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD5592R);
+MODULE_IMPORT_NS("IIO_AD5592R");
diff --git a/drivers/iio/dac/ad5593r.c b/drivers/iio/dac/ad5593r.c
index 62e1fbb9e910..ddd13ad821a7 100644
--- a/drivers/iio/dac/ad5593r.c
+++ b/drivers/iio/dac/ad5593r.c
@@ -147,4 +147,4 @@ module_i2c_driver(ad5593r_driver);
 MODULE_AUTHOR("Paul Cercueil <paul.cercueil@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5593R multi-channel converters");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD5592R);
+MODULE_IMPORT_NS("IIO_AD5592R");
diff --git a/drivers/iio/dac/ad5686-spi.c b/drivers/iio/dac/ad5686-spi.c
index 8ba2ea70451a..39b5dad0d6a5 100644
--- a/drivers/iio/dac/ad5686-spi.c
+++ b/drivers/iio/dac/ad5686-spi.c
@@ -135,4 +135,4 @@ module_spi_driver(ad5686_spi_driver);
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5686 and similar multi-channel DACs");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD5686);
+MODULE_IMPORT_NS("IIO_AD5686");
diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
index 57cc0f0eedc6..8dc578b08784 100644
--- a/drivers/iio/dac/ad5686.c
+++ b/drivers/iio/dac/ad5686.c
@@ -543,7 +543,7 @@ int ad5686_probe(struct device *dev,
 		regulator_disable(st->reg);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ad5686_probe, IIO_AD5686);
+EXPORT_SYMBOL_NS_GPL(ad5686_probe, "IIO_AD5686");
 
 void ad5686_remove(struct device *dev)
 {
@@ -554,7 +554,7 @@ void ad5686_remove(struct device *dev)
 	if (!IS_ERR(st->reg))
 		regulator_disable(st->reg);
 }
-EXPORT_SYMBOL_NS_GPL(ad5686_remove, IIO_AD5686);
+EXPORT_SYMBOL_NS_GPL(ad5686_remove, "IIO_AD5686");
 
 MODULE_AUTHOR("Michael Hennerich <michael.hennerich@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5686/85/84 DAC");
diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
index 81541f755a3e..bbcda246c547 100644
--- a/drivers/iio/dac/ad5696-i2c.c
+++ b/drivers/iio/dac/ad5696-i2c.c
@@ -125,4 +125,4 @@ module_i2c_driver(ad5686_i2c_driver);
 MODULE_AUTHOR("Stefan Popa <stefan.popa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD5686 and similar multi-channel DACs");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_AD5686);
+MODULE_IMPORT_NS("IIO_AD5686");
diff --git a/drivers/iio/dac/ad9739a.c b/drivers/iio/dac/ad9739a.c
index 615d1a196db3..b6a65359b0b4 100644
--- a/drivers/iio/dac/ad9739a.c
+++ b/drivers/iio/dac/ad9739a.c
@@ -466,4 +466,4 @@ MODULE_AUTHOR("Dragos Bogdan <dragos.bogdan@analog.com>");
 MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices AD9739 DAC");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 0cb00f3bec04..93cbe4f939de 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -651,5 +651,5 @@ module_platform_driver(axi_dac_driver);
 MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices Generic AXI DAC IP core driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_DMAENGINE_BUFFER);
-MODULE_IMPORT_NS(IIO_BACKEND);
+MODULE_IMPORT_NS("IIO_DMAENGINE_BUFFER");
+MODULE_IMPORT_NS("IIO_BACKEND");
diff --git a/drivers/iio/gyro/adis16136.c b/drivers/iio/gyro/adis16136.c
index da83adc684d0..369c7428e1ef 100644
--- a/drivers/iio/gyro/adis16136.c
+++ b/drivers/iio/gyro/adis16136.c
@@ -583,4 +583,4 @@ module_spi_driver(adis16136_driver);
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("Analog Devices ADIS16133/ADIS16135/ADIS16136 gyroscope driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/gyro/adis16260.c b/drivers/iio/gyro/adis16260.c
index 495b64a27061..c151fbb59ffe 100644
--- a/drivers/iio/gyro/adis16260.c
+++ b/drivers/iio/gyro/adis16260.c
@@ -430,4 +430,4 @@ module_spi_driver(adis16260_driver);
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16260/5 Digital Gyroscope Sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/gyro/fxas21002c_core.c b/drivers/iio/gyro/fxas21002c_core.c
index c28d17ca6f5e..a6259bbb8f91 100644
--- a/drivers/iio/gyro/fxas21002c_core.c
+++ b/drivers/iio/gyro/fxas21002c_core.c
@@ -998,7 +998,7 @@ int fxas21002c_core_probe(struct device *dev, struct regmap *regmap, int irq,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(fxas21002c_core_probe, IIO_FXAS21002C);
+EXPORT_SYMBOL_NS_GPL(fxas21002c_core_probe, "IIO_FXAS21002C");
 
 void fxas21002c_core_remove(struct device *dev)
 {
@@ -1009,7 +1009,7 @@ void fxas21002c_core_remove(struct device *dev)
 	pm_runtime_disable(dev);
 	pm_runtime_set_suspended(dev);
 }
-EXPORT_SYMBOL_NS_GPL(fxas21002c_core_remove, IIO_FXAS21002C);
+EXPORT_SYMBOL_NS_GPL(fxas21002c_core_remove, "IIO_FXAS21002C");
 
 static int fxas21002c_suspend(struct device *dev)
 {
diff --git a/drivers/iio/gyro/fxas21002c_i2c.c b/drivers/iio/gyro/fxas21002c_i2c.c
index b1318a1ea41b..43c6b3079487 100644
--- a/drivers/iio/gyro/fxas21002c_i2c.c
+++ b/drivers/iio/gyro/fxas21002c_i2c.c
@@ -65,4 +65,4 @@ module_i2c_driver(fxas21002c_i2c_driver);
 MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("FXAS21002C I2C Gyro driver");
-MODULE_IMPORT_NS(IIO_FXAS21002C);
+MODULE_IMPORT_NS("IIO_FXAS21002C");
diff --git a/drivers/iio/gyro/fxas21002c_spi.c b/drivers/iio/gyro/fxas21002c_spi.c
index 4f633826547c..d62efe50b697 100644
--- a/drivers/iio/gyro/fxas21002c_spi.c
+++ b/drivers/iio/gyro/fxas21002c_spi.c
@@ -66,4 +66,4 @@ module_spi_driver(fxas21002c_spi_driver);
 MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("FXAS21002C SPI Gyro driver");
-MODULE_IMPORT_NS(IIO_FXAS21002C);
+MODULE_IMPORT_NS("IIO_FXAS21002C");
diff --git a/drivers/iio/gyro/hid-sensor-gyro-3d.c b/drivers/iio/gyro/hid-sensor-gyro-3d.c
index 59a38bf9459b..9fb2bdd6a1f8 100644
--- a/drivers/iio/gyro/hid-sensor-gyro-3d.c
+++ b/drivers/iio/gyro/hid-sensor-gyro-3d.c
@@ -393,4 +393,4 @@ module_platform_driver(hid_gyro_3d_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Gyroscope 3D");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/gyro/ssp_gyro_sensor.c b/drivers/iio/gyro/ssp_gyro_sensor.c
index d332474bc484..d9b41cf8d799 100644
--- a/drivers/iio/gyro/ssp_gyro_sensor.c
+++ b/drivers/iio/gyro/ssp_gyro_sensor.c
@@ -141,4 +141,4 @@ module_platform_driver(ssp_gyro_driver);
 MODULE_AUTHOR("Karol Wrona <k.wrona@samsung.com>");
 MODULE_DESCRIPTION("Samsung sensorhub gyroscopes driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_SSP_SENSORS);
+MODULE_IMPORT_NS("IIO_SSP_SENSORS");
diff --git a/drivers/iio/gyro/st_gyro_core.c b/drivers/iio/gyro/st_gyro_core.c
index eaa35da42b33..7fd82cd707c7 100644
--- a/drivers/iio/gyro/st_gyro_core.c
+++ b/drivers/iio/gyro/st_gyro_core.c
@@ -465,7 +465,7 @@ const struct st_sensor_settings *st_gyro_get_settings(const char *name)
 
 	return &st_gyro_sensors_settings[index];
 }
-EXPORT_SYMBOL_NS(st_gyro_get_settings, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_gyro_get_settings, "IIO_ST_SENSORS");
 
 int st_gyro_common_probe(struct iio_dev *indio_dev)
 {
@@ -511,9 +511,9 @@ int st_gyro_common_probe(struct iio_dev *indio_dev)
 
 	return devm_iio_device_register(parent, indio_dev);
 }
-EXPORT_SYMBOL_NS(st_gyro_common_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_gyro_common_probe, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics gyroscopes driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/gyro/st_gyro_i2c.c b/drivers/iio/gyro/st_gyro_i2c.c
index 5a10a3556ab0..d4b11bdba666 100644
--- a/drivers/iio/gyro/st_gyro_i2c.c
+++ b/drivers/iio/gyro/st_gyro_i2c.c
@@ -119,4 +119,4 @@ module_i2c_driver(st_gyro_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics gyroscopes i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/gyro/st_gyro_spi.c b/drivers/iio/gyro/st_gyro_spi.c
index 22aaabe48e4a..811f712711f5 100644
--- a/drivers/iio/gyro/st_gyro_spi.c
+++ b/drivers/iio/gyro/st_gyro_spi.c
@@ -124,4 +124,4 @@ module_spi_driver(st_gyro_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics gyroscopes spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/humidity/hid-sensor-humidity.c b/drivers/iio/humidity/hid-sensor-humidity.c
index bf6d2636a85e..544a3e2a7534 100644
--- a/drivers/iio/humidity/hid-sensor-humidity.c
+++ b/drivers/iio/humidity/hid-sensor-humidity.c
@@ -294,4 +294,4 @@ module_platform_driver(hid_humidity_platform_driver);
 MODULE_DESCRIPTION("HID Environmental humidity sensor");
 MODULE_AUTHOR("Song Hongyan <hongyan.song@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index 87627d116eff..0be11470730c 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -649,7 +649,7 @@ int hts221_probe(struct device *dev, int irq, const char *name,
 
 	return devm_iio_device_register(hw->dev, iio_dev);
 }
-EXPORT_SYMBOL_NS(hts221_probe, IIO_HTS221);
+EXPORT_SYMBOL_NS(hts221_probe, "IIO_HTS221");
 
 static int hts221_suspend(struct device *dev)
 {
diff --git a/drivers/iio/humidity/hts221_i2c.c b/drivers/iio/humidity/hts221_i2c.c
index 5cb263e0ef5a..87a8e3c8d277 100644
--- a/drivers/iio/humidity/hts221_i2c.c
+++ b/drivers/iio/humidity/hts221_i2c.c
@@ -73,4 +73,4 @@ module_i2c_driver(hts221_driver);
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics hts221 i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_HTS221);
+MODULE_IMPORT_NS("IIO_HTS221");
diff --git a/drivers/iio/humidity/hts221_spi.c b/drivers/iio/humidity/hts221_spi.c
index fc4adb68faf6..00154b9d66b5 100644
--- a/drivers/iio/humidity/hts221_spi.c
+++ b/drivers/iio/humidity/hts221_spi.c
@@ -66,4 +66,4 @@ module_spi_driver(hts221_driver);
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics hts221 spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_HTS221);
+MODULE_IMPORT_NS("IIO_HTS221");
diff --git a/drivers/iio/humidity/htu21.c b/drivers/iio/humidity/htu21.c
index 39e886075299..6402e393edb8 100644
--- a/drivers/iio/humidity/htu21.c
+++ b/drivers/iio/humidity/htu21.c
@@ -258,4 +258,4 @@ MODULE_DESCRIPTION("Measurement-Specialties htu21 temperature and humidity drive
 MODULE_AUTHOR("William Markezana <william.markezana@meas-spec.com>");
 MODULE_AUTHOR("Ludovic Tancerel <ludovic.tancerel@maplehightech.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MEAS_SPEC_SENSORS);
+MODULE_IMPORT_NS("IIO_MEAS_SPEC_SENSORS");
diff --git a/drivers/iio/imu/adis.c b/drivers/iio/imu/adis.c
index 99410733c1ca..494171844812 100644
--- a/drivers/iio/imu/adis.c
+++ b/drivers/iio/imu/adis.c
@@ -115,7 +115,7 @@ int __adis_write_reg(struct adis *adis, unsigned int reg, unsigned int value,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(__adis_write_reg, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(__adis_write_reg, "IIO_ADISLIB");
 
 /**
  * __adis_read_reg() - read N bytes from register (unlocked version)
@@ -206,7 +206,7 @@ int __adis_read_reg(struct adis *adis, unsigned int reg, unsigned int *val,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(__adis_read_reg, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(__adis_read_reg, "IIO_ADISLIB");
 /**
  * __adis_update_bits_base() - ADIS Update bits function - Unlocked version
  * @adis: The adis device
@@ -231,7 +231,7 @@ int __adis_update_bits_base(struct adis *adis, unsigned int reg, const u32 mask,
 
 	return __adis_write_reg(adis, reg, __val, size);
 }
-EXPORT_SYMBOL_NS_GPL(__adis_update_bits_base, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(__adis_update_bits_base, "IIO_ADISLIB");
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -253,7 +253,7 @@ int adis_debugfs_reg_access(struct iio_dev *indio_dev, unsigned int reg,
 
 	return adis_write_reg_16(adis, reg, writeval);
 }
-EXPORT_SYMBOL_NS(adis_debugfs_reg_access, IIO_ADISLIB);
+EXPORT_SYMBOL_NS(adis_debugfs_reg_access, "IIO_ADISLIB");
 
 #endif
 
@@ -294,7 +294,7 @@ int __adis_enable_irq(struct adis *adis, bool enable)
 
 	return __adis_write_reg_16(adis, adis->data->msc_ctrl_reg, msc);
 }
-EXPORT_SYMBOL_NS(__adis_enable_irq, IIO_ADISLIB);
+EXPORT_SYMBOL_NS(__adis_enable_irq, "IIO_ADISLIB");
 
 /**
  * __adis_check_status() - Check the device for error conditions (unlocked)
@@ -326,7 +326,7 @@ int __adis_check_status(struct adis *adis)
 
 	return -EIO;
 }
-EXPORT_SYMBOL_NS_GPL(__adis_check_status, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(__adis_check_status, "IIO_ADISLIB");
 
 /**
  * __adis_reset() - Reset the device (unlocked version)
@@ -350,7 +350,7 @@ int __adis_reset(struct adis *adis)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(__adis_reset, IIO_ADIS_LIB);
+EXPORT_SYMBOL_NS_GPL(__adis_reset, "IIO_ADIS_LIB");
 
 static int adis_self_test(struct adis *adis)
 {
@@ -441,7 +441,7 @@ int __adis_initial_startup(struct adis *adis)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(__adis_initial_startup, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(__adis_initial_startup, "IIO_ADISLIB");
 
 /**
  * adis_single_conversion() - Performs a single sample conversion
@@ -486,7 +486,7 @@ int adis_single_conversion(struct iio_dev *indio_dev,
 
 	return IIO_VAL_INT;
 }
-EXPORT_SYMBOL_NS_GPL(adis_single_conversion, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(adis_single_conversion, "IIO_ADISLIB");
 
 /**
  * adis_init() - Initialize adis device structure
@@ -529,7 +529,7 @@ int adis_init(struct adis *adis, struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(adis_init, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(adis_init, "IIO_ADISLIB");
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
diff --git a/drivers/iio/imu/adis16400.c b/drivers/iio/imu/adis16400.c
index 6484ab8aff55..3086dd536203 100644
--- a/drivers/iio/imu/adis16400.c
+++ b/drivers/iio/imu/adis16400.c
@@ -1228,4 +1228,4 @@ module_spi_driver(adis16400_driver);
 MODULE_AUTHOR("Manuel Stahl <manuel.stahl@iis.fraunhofer.de>");
 MODULE_DESCRIPTION("Analog Devices ADIS16400/5 IMU SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/imu/adis16460.c b/drivers/iio/imu/adis16460.c
index eaa38dd6201f..ecf74046fde1 100644
--- a/drivers/iio/imu/adis16460.c
+++ b/drivers/iio/imu/adis16460.c
@@ -418,4 +418,4 @@ module_spi_driver(adis16460_driver);
 MODULE_AUTHOR("Dragos Bogdan <dragos.bogdan@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16460 IMU driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/imu/adis16475.c b/drivers/iio/imu/adis16475.c
index 88efe728b61b..df8c6cd91169 100644
--- a/drivers/iio/imu/adis16475.c
+++ b/drivers/iio/imu/adis16475.c
@@ -2107,4 +2107,4 @@ module_spi_driver(adis16475_driver);
 MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16475 IMU driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/imu/adis16480.c b/drivers/iio/imu/adis16480.c
index 294181f2fcb3..0a5d13d2240e 100644
--- a/drivers/iio/imu/adis16480.c
+++ b/drivers/iio/imu/adis16480.c
@@ -1794,4 +1794,4 @@ module_spi_driver(adis16480_driver);
 MODULE_AUTHOR("Lars-Peter Clausen <lars@metafoo.de>");
 MODULE_DESCRIPTION("Analog Devices ADIS16480 IMU driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/iio/imu/adis_buffer.c b/drivers/iio/imu/adis_buffer.c
index b7c1cc04492a..fdfc0538734c 100644
--- a/drivers/iio/imu/adis_buffer.c
+++ b/drivers/iio/imu/adis_buffer.c
@@ -124,7 +124,7 @@ int adis_update_scan_mode(struct iio_dev *indio_dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(adis_update_scan_mode, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(adis_update_scan_mode, "IIO_ADISLIB");
 
 static int adis_paging_trigger_handler(struct adis *adis)
 {
@@ -222,4 +222,4 @@ devm_adis_setup_buffer_and_trigger_with_attrs(struct adis *adis, struct iio_dev
 	return devm_add_action_or_reset(&adis->spi->dev, adis_buffer_cleanup,
 					adis);
 }
-EXPORT_SYMBOL_NS_GPL(devm_adis_setup_buffer_and_trigger_with_attrs, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(devm_adis_setup_buffer_and_trigger_with_attrs, "IIO_ADISLIB");
diff --git a/drivers/iio/imu/adis_trigger.c b/drivers/iio/imu/adis_trigger.c
index a8740b043cfe..d76e13cbac68 100644
--- a/drivers/iio/imu/adis_trigger.c
+++ b/drivers/iio/imu/adis_trigger.c
@@ -102,5 +102,5 @@ int devm_adis_probe_trigger(struct adis *adis, struct iio_dev *indio_dev)
 
 	return devm_iio_trigger_register(&adis->spi->dev, adis->trig);
 }
-EXPORT_SYMBOL_NS_GPL(devm_adis_probe_trigger, IIO_ADISLIB);
+EXPORT_SYMBOL_NS_GPL(devm_adis_probe_trigger, "IIO_ADISLIB");
 
diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index 495e8a74ac67..06cdd3d5e090 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -149,7 +149,7 @@ const struct regmap_config bmi160_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 };
-EXPORT_SYMBOL_NS(bmi160_regmap_config, IIO_BMI160);
+EXPORT_SYMBOL_NS(bmi160_regmap_config, "IIO_BMI160");
 
 struct bmi160_regs {
 	u8 data; /* LSB byte register for X-axis */
@@ -638,7 +638,7 @@ int bmi160_enable_irq(struct regmap *regmap, bool enable)
 				     BMI160_DRDY_INT_EN, enable_bit,
 				     BMI160_NORMAL_WRITE_USLEEP);
 }
-EXPORT_SYMBOL_NS(bmi160_enable_irq, IIO_BMI160);
+EXPORT_SYMBOL_NS(bmi160_enable_irq, "IIO_BMI160");
 
 static int bmi160_get_irq(struct fwnode_handle *fwnode, enum bmi160_int_pin *pin)
 {
@@ -897,7 +897,7 @@ int bmi160_core_probe(struct device *dev, struct regmap *regmap,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(bmi160_core_probe, IIO_BMI160);
+EXPORT_SYMBOL_NS_GPL(bmi160_core_probe, "IIO_BMI160");
 
 MODULE_AUTHOR("Daniel Baluta <daniel.baluta@intel.com>");
 MODULE_DESCRIPTION("Bosch BMI160 driver");
diff --git a/drivers/iio/imu/bmi160/bmi160_i2c.c b/drivers/iio/imu/bmi160/bmi160_i2c.c
index 3aa5d748f9b6..214503fa4af5 100644
--- a/drivers/iio/imu/bmi160/bmi160_i2c.c
+++ b/drivers/iio/imu/bmi160/bmi160_i2c.c
@@ -80,4 +80,4 @@ module_i2c_driver(bmi160_i2c_driver);
 MODULE_AUTHOR("Daniel Baluta <daniel.baluta@intel.com>");
 MODULE_DESCRIPTION("BMI160 I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BMI160);
+MODULE_IMPORT_NS("IIO_BMI160");
diff --git a/drivers/iio/imu/bmi160/bmi160_spi.c b/drivers/iio/imu/bmi160/bmi160_spi.c
index 9f40500132f7..8fbaab22db81 100644
--- a/drivers/iio/imu/bmi160/bmi160_spi.c
+++ b/drivers/iio/imu/bmi160/bmi160_spi.c
@@ -68,4 +68,4 @@ module_spi_driver(bmi160_spi_driver);
 MODULE_AUTHOR("Daniel Baluta <daniel.baluta@intel.com");
 MODULE_DESCRIPTION("Bosch BMI160 SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BMI160);
+MODULE_IMPORT_NS("IIO_BMI160");
diff --git a/drivers/iio/imu/bmi323/bmi323_core.c b/drivers/iio/imu/bmi323/bmi323_core.c
index e1f3b0d778be..2807cf57baf0 100644
--- a/drivers/iio/imu/bmi323/bmi323_core.c
+++ b/drivers/iio/imu/bmi323/bmi323_core.c
@@ -2170,7 +2170,7 @@ int bmi323_core_probe(struct device *dev)
 
 	return bmi323_fifo_disable(data);
 }
-EXPORT_SYMBOL_NS_GPL(bmi323_core_probe, IIO_BMI323);
+EXPORT_SYMBOL_NS_GPL(bmi323_core_probe, "IIO_BMI323");
 
 static int bmi323_core_runtime_suspend(struct device *dev)
 {
@@ -2298,7 +2298,7 @@ const struct dev_pm_ops bmi323_core_pm_ops = {
 	RUNTIME_PM_OPS(bmi323_core_runtime_suspend,
 		       bmi323_core_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_NS_GPL(bmi323_core_pm_ops, IIO_BMI323);
+EXPORT_SYMBOL_NS_GPL(bmi323_core_pm_ops, "IIO_BMI323");
 
 MODULE_DESCRIPTION("Bosch BMI323 IMU driver");
 MODULE_AUTHOR("Jagath Jog J <jagathjog1996@gmail.com>");
diff --git a/drivers/iio/imu/bmi323/bmi323_i2c.c b/drivers/iio/imu/bmi323/bmi323_i2c.c
index 0ba5d69d8329..8457fe304db8 100644
--- a/drivers/iio/imu/bmi323/bmi323_i2c.c
+++ b/drivers/iio/imu/bmi323/bmi323_i2c.c
@@ -140,4 +140,4 @@ module_i2c_driver(bmi323_i2c_driver);
 MODULE_DESCRIPTION("Bosch BMI323 IMU driver");
 MODULE_AUTHOR("Jagath Jog J <jagathjog1996@gmail.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BMI323);
+MODULE_IMPORT_NS("IIO_BMI323");
diff --git a/drivers/iio/imu/bmi323/bmi323_spi.c b/drivers/iio/imu/bmi323/bmi323_spi.c
index 9de3ade78d71..fd56ab620750 100644
--- a/drivers/iio/imu/bmi323/bmi323_spi.c
+++ b/drivers/iio/imu/bmi323/bmi323_spi.c
@@ -90,4 +90,4 @@ module_spi_driver(bmi323_spi_driver);
 MODULE_DESCRIPTION("Bosch BMI323 IMU driver");
 MODULE_AUTHOR("Jagath Jog J <jagathjog1996@gmail.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BMI323);
+MODULE_IMPORT_NS("IIO_BMI323");
diff --git a/drivers/iio/imu/bno055/bno055.c b/drivers/iio/imu/bno055/bno055.c
index ea6519b22b2f..0728d38260a1 100644
--- a/drivers/iio/imu/bno055/bno055.c
+++ b/drivers/iio/imu/bno055/bno055.c
@@ -292,7 +292,7 @@ const struct regmap_config bno055_regmap_config = {
 	.readable_reg = bno055_regmap_readable,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS_GPL(bno055_regmap_config, IIO_BNO055);
+EXPORT_SYMBOL_NS_GPL(bno055_regmap_config, "IIO_BNO055");
 
 /* must be called in configuration mode */
 static int bno055_calibration_load(struct bno055_priv *priv, const u8 *data, int len)
@@ -1678,7 +1678,7 @@ int bno055_probe(struct device *dev, struct regmap *regmap,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(bno055_probe, IIO_BNO055);
+EXPORT_SYMBOL_NS_GPL(bno055_probe, "IIO_BNO055");
 
 MODULE_AUTHOR("Andrea Merello <andrea.merello@iit.it>");
 MODULE_DESCRIPTION("Bosch BNO055 driver");
diff --git a/drivers/iio/imu/bno055/bno055_i2c.c b/drivers/iio/imu/bno055/bno055_i2c.c
index cf3dd62a83ba..f49d0905ee33 100644
--- a/drivers/iio/imu/bno055/bno055_i2c.c
+++ b/drivers/iio/imu/bno055/bno055_i2c.c
@@ -53,5 +53,5 @@ module_i2c_driver(bno055_driver);
 
 MODULE_AUTHOR("Andrea Merello");
 MODULE_DESCRIPTION("Bosch BNO055 I2C interface");
-MODULE_IMPORT_NS(IIO_BNO055);
+MODULE_IMPORT_NS("IIO_BNO055");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/imu/bno055/bno055_ser_core.c b/drivers/iio/imu/bno055/bno055_ser_core.c
index da7873bfd348..48669dabb37b 100644
--- a/drivers/iio/imu/bno055/bno055_ser_core.c
+++ b/drivers/iio/imu/bno055/bno055_ser_core.c
@@ -556,5 +556,5 @@ module_serdev_device_driver(bno055_ser_driver);
 
 MODULE_AUTHOR("Andrea Merello <andrea.merello@iit.it>");
 MODULE_DESCRIPTION("Bosch BNO055 serdev interface");
-MODULE_IMPORT_NS(IIO_BNO055);
+MODULE_IMPORT_NS("IIO_BNO055");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
index c3924cc6190e..60f40bb82fdf 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_core.c
@@ -85,7 +85,7 @@ const struct regmap_config inv_icm42600_regmap_config = {
 	.rd_noinc_table = inv_icm42600_regmap_rd_noinc_accesses,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_NS_GPL(inv_icm42600_regmap_config, IIO_ICM42600);
+EXPORT_SYMBOL_NS_GPL(inv_icm42600_regmap_config, "IIO_ICM42600");
 
 struct inv_icm42600_hw {
 	uint8_t whoami;
@@ -773,7 +773,7 @@ int inv_icm42600_core_probe(struct regmap *regmap, int chip, int irq,
 
 	return devm_add_action_or_reset(dev, inv_icm42600_disable_pm, dev);
 }
-EXPORT_SYMBOL_NS_GPL(inv_icm42600_core_probe, IIO_ICM42600);
+EXPORT_SYMBOL_NS_GPL(inv_icm42600_core_probe, "IIO_ICM42600");
 
 /*
  * Suspend saves sensors state and turns everything off.
@@ -896,4 +896,4 @@ EXPORT_NS_GPL_DEV_PM_OPS(inv_icm42600_pm_ops, IIO_ICM42600) = {
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-426xx device driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_INV_SENSORS_TIMESTAMP);
+MODULE_IMPORT_NS("IIO_INV_SENSORS_TIMESTAMP");
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
index ebb31b385881..03145817b50f 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_i2c.c
@@ -111,4 +111,4 @@ module_i2c_driver(inv_icm42600_driver);
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-426xx I2C driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ICM42600);
+MODULE_IMPORT_NS("IIO_ICM42600");
diff --git a/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c b/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
index eae5ff7a3cc1..06ad55261790 100644
--- a/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
+++ b/drivers/iio/imu/inv_icm42600/inv_icm42600_spi.c
@@ -107,4 +107,4 @@ module_spi_driver(inv_icm42600_driver);
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-426xx SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_ICM42600);
+MODULE_IMPORT_NS("IIO_ICM42600");
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
index 14d95f34e981..d1d5f3c55d87 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_core.c
@@ -2082,7 +2082,7 @@ int inv_mpu_core_probe(struct regmap *regmap, int irq, const char *name,
 	inv_mpu6050_set_power_itg(st, false);
 	return result;
 }
-EXPORT_SYMBOL_NS_GPL(inv_mpu_core_probe, IIO_MPU6050);
+EXPORT_SYMBOL_NS_GPL(inv_mpu_core_probe, "IIO_MPU6050");
 
 static int inv_mpu_resume(struct device *dev)
 {
@@ -2233,4 +2233,4 @@ EXPORT_NS_GPL_DEV_PM_OPS(inv_mpu_pmops, IIO_MPU6050) = {
 MODULE_AUTHOR("Invensense Corporation");
 MODULE_DESCRIPTION("Invensense device MPU6050 driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_INV_SENSORS_TIMESTAMP);
+MODULE_IMPORT_NS("IIO_INV_SENSORS_TIMESTAMP");
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
index 0e03137fb3d4..1415ee245a7d 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c
@@ -281,4 +281,4 @@ module_i2c_driver(inv_mpu_driver);
 MODULE_AUTHOR("Invensense Corporation");
 MODULE_DESCRIPTION("Invensense device MPU6050 driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_MPU6050);
+MODULE_IMPORT_NS("IIO_MPU6050");
diff --git a/drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c b/drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c
index 05451ca1580b..917ae35e6f49 100644
--- a/drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c
+++ b/drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c
@@ -168,4 +168,4 @@ module_spi_driver(inv_mpu_driver);
 MODULE_AUTHOR("Adriana Reus <adriana.reus@intel.com>");
 MODULE_DESCRIPTION("Invensense device MPU6000 driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_MPU6050);
+MODULE_IMPORT_NS("IIO_MPU6050");
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
index ed0267929725..fcbe4fda0eb3 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c
@@ -2730,7 +2730,7 @@ int st_lsm6dsx_probe(struct device *dev, int irq, int hw_id,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(st_lsm6dsx_probe, IIO_LSM6DSX);
+EXPORT_SYMBOL_NS(st_lsm6dsx_probe, "IIO_LSM6DSX");
 
 static int st_lsm6dsx_suspend(struct device *dev)
 {
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
index cddf41cc0ca9..25e1de89b6e4 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c
@@ -193,4 +193,4 @@ MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@st.com>");
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_LSM6DSX);
+MODULE_IMPORT_NS("IIO_LSM6DSX");
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
index 3b0c8b19c448..6952d901316f 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i3c.c
@@ -54,4 +54,4 @@ module_i3c_driver(st_lsm6dsx_driver);
 MODULE_AUTHOR("Vitor Soares <vitor.soares@synopsys.com>");
 MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx i3c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_LSM6DSX);
+MODULE_IMPORT_NS("IIO_LSM6DSX");
diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
index c122c8831365..4b4b6d45524f 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c
@@ -181,4 +181,4 @@ MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi@st.com>");
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics st_lsm6dsx spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_LSM6DSX);
+MODULE_IMPORT_NS("IIO_LSM6DSX");
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
index 10c1b2ba7a3d..8f4a67edb335 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c
@@ -88,9 +88,9 @@ int st_lsm9ds0_probe(struct st_lsm9ds0 *lsm9ds0, struct regmap *regmap)
 	/* Setup magnetometer device */
 	return st_lsm9ds0_probe_magn(lsm9ds0, regmap);
 }
-EXPORT_SYMBOL_NS_GPL(st_lsm9ds0_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS_GPL(st_lsm9ds0_probe, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("STMicroelectronics LSM9DS0 IMU core driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
index d03cec3b24fe..0732cfa258c4 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_i2c.c
@@ -91,4 +91,4 @@ module_i2c_driver(st_lsm9ds0_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("STMicroelectronics LSM9DS0 IMU I2C driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
index 69e9135795a3..43ec57c1e604 100644
--- a/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
+++ b/drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c
@@ -83,4 +83,4 @@ module_spi_driver(st_lsm9ds0_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("STMicroelectronics LSM9DS0 IMU SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/industrialio-backend.c b/drivers/iio/industrialio-backend.c
index 20b3b5212da7..18def6519934 100644
--- a/drivers/iio/industrialio-backend.c
+++ b/drivers/iio/industrialio-backend.c
@@ -230,7 +230,7 @@ void iio_backend_debugfs_add(struct iio_backend *back,
 		debugfs_create_file("name", 0400, back_d, back,
 				    &iio_backend_debugfs_name_fops);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_debugfs_add, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_debugfs_add, "IIO_BACKEND");
 
 /**
  * iio_backend_debugfs_print_chan_status - Print channel status
@@ -256,7 +256,7 @@ ssize_t iio_backend_debugfs_print_chan_status(struct iio_backend *back,
 	return iio_backend_op_call(back, debugfs_print_chan_status, chan, buf,
 				   len);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_debugfs_print_chan_status, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_debugfs_print_chan_status, "IIO_BACKEND");
 
 /**
  * iio_backend_chan_enable - Enable a backend channel
@@ -270,7 +270,7 @@ int iio_backend_chan_enable(struct iio_backend *back, unsigned int chan)
 {
 	return iio_backend_op_call(back, chan_enable, chan);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_chan_enable, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_chan_enable, "IIO_BACKEND");
 
 /**
  * iio_backend_chan_disable - Disable a backend channel
@@ -284,7 +284,7 @@ int iio_backend_chan_disable(struct iio_backend *back, unsigned int chan)
 {
 	return iio_backend_op_call(back, chan_disable, chan);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_chan_disable, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_chan_disable, "IIO_BACKEND");
 
 static void __iio_backend_disable(void *back)
 {
@@ -299,7 +299,7 @@ void iio_backend_disable(struct iio_backend *back)
 {
 	__iio_backend_disable(back);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_disable, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_disable, "IIO_BACKEND");
 
 /**
  * iio_backend_enable - Backend enable
@@ -312,7 +312,7 @@ int iio_backend_enable(struct iio_backend *back)
 {
 	return iio_backend_op_call(back, enable);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_enable, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_enable, "IIO_BACKEND");
 
 /**
  * devm_iio_backend_enable - Device managed backend enable
@@ -332,7 +332,7 @@ int devm_iio_backend_enable(struct device *dev, struct iio_backend *back)
 
 	return devm_add_action_or_reset(dev, __iio_backend_disable, back);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_backend_enable, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(devm_iio_backend_enable, "IIO_BACKEND");
 
 /**
  * iio_backend_data_format_set - Configure the channel data format
@@ -354,7 +354,7 @@ int iio_backend_data_format_set(struct iio_backend *back, unsigned int chan,
 
 	return iio_backend_op_call(back, data_format_set, chan, data);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_data_format_set, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_data_format_set, "IIO_BACKEND");
 
 /**
  * iio_backend_data_source_set - Select data source
@@ -376,7 +376,7 @@ int iio_backend_data_source_set(struct iio_backend *back, unsigned int chan,
 
 	return iio_backend_op_call(back, data_source_set, chan, data);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_set, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_data_source_set, "IIO_BACKEND");
 
 /**
  * iio_backend_set_sampling_freq - Set channel sampling rate
@@ -392,7 +392,7 @@ int iio_backend_set_sampling_freq(struct iio_backend *back, unsigned int chan,
 {
 	return iio_backend_op_call(back, set_sample_rate, chan, sample_rate_hz);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_set_sampling_freq, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_set_sampling_freq, "IIO_BACKEND");
 
 /**
  * iio_backend_test_pattern_set - Configure a test pattern
@@ -415,7 +415,7 @@ int iio_backend_test_pattern_set(struct iio_backend *back,
 
 	return iio_backend_op_call(back, test_pattern_set, chan, pattern);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_test_pattern_set, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_test_pattern_set, "IIO_BACKEND");
 
 /**
  * iio_backend_chan_status - Get the channel status
@@ -434,7 +434,7 @@ int iio_backend_chan_status(struct iio_backend *back, unsigned int chan,
 {
 	return iio_backend_op_call(back, chan_status, chan, error);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_chan_status, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_chan_status, "IIO_BACKEND");
 
 /**
  * iio_backend_iodelay_set - Set digital I/O delay
@@ -457,7 +457,7 @@ int iio_backend_iodelay_set(struct iio_backend *back, unsigned int lane,
 {
 	return iio_backend_op_call(back, iodelay_set, lane, taps);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_iodelay_set, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_iodelay_set, "IIO_BACKEND");
 
 /**
  * iio_backend_data_sample_trigger - Control when to sample data
@@ -478,7 +478,7 @@ int iio_backend_data_sample_trigger(struct iio_backend *back,
 
 	return iio_backend_op_call(back, data_sample_trigger, trigger);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_data_sample_trigger, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_data_sample_trigger, "IIO_BACKEND");
 
 static void iio_backend_free_buffer(void *arg)
 {
@@ -523,7 +523,7 @@ int devm_iio_backend_request_buffer(struct device *dev,
 
 	return devm_add_action_or_reset(dev, iio_backend_free_buffer, pair);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_backend_request_buffer, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(devm_iio_backend_request_buffer, "IIO_BACKEND");
 
 /**
  * iio_backend_read_raw - Read a channel attribute from a backend device.
@@ -542,7 +542,7 @@ int iio_backend_read_raw(struct iio_backend *back,
 {
 	return iio_backend_op_call(back, read_raw, chan, val, val2, mask);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_read_raw, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_read_raw, "IIO_BACKEND");
 
 static struct iio_backend *iio_backend_from_indio_dev_parent(const struct device *dev)
 {
@@ -604,7 +604,7 @@ ssize_t iio_backend_ext_info_get(struct iio_dev *indio_dev, uintptr_t private,
 
 	return iio_backend_op_call(back, ext_info_get, private, chan, buf);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_ext_info_get, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_ext_info_get, "IIO_BACKEND");
 
 /**
  * iio_backend_ext_info_set - IIO ext_info write callback
@@ -634,7 +634,7 @@ ssize_t iio_backend_ext_info_set(struct iio_dev *indio_dev, uintptr_t private,
 
 	return iio_backend_op_call(back, ext_info_set, private, chan, buf, len);
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_ext_info_set, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_ext_info_set, "IIO_BACKEND");
 
 /**
  * iio_backend_extend_chan_spec - Extend an IIO channel
@@ -677,7 +677,7 @@ int iio_backend_extend_chan_spec(struct iio_backend *back,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_extend_chan_spec, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_extend_chan_spec, "IIO_BACKEND");
 
 static void iio_backend_release(void *arg)
 {
@@ -775,7 +775,7 @@ struct iio_backend *devm_iio_backend_get(struct device *dev, const char *name)
 {
 	return __devm_iio_backend_fwnode_get(dev, name, dev_fwnode(dev));
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_backend_get, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(devm_iio_backend_get, "IIO_BACKEND");
 
 /**
  * devm_iio_backend_fwnode_get - Device managed backend firmware node get
@@ -794,7 +794,7 @@ struct iio_backend *devm_iio_backend_fwnode_get(struct device *dev,
 {
 	return __devm_iio_backend_fwnode_get(dev, name, fwnode);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_backend_fwnode_get, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(devm_iio_backend_fwnode_get, "IIO_BACKEND");
 
 /**
  * __devm_iio_backend_get_from_fwnode_lookup - Device managed fwnode backend device get
@@ -829,7 +829,7 @@ __devm_iio_backend_get_from_fwnode_lookup(struct device *dev,
 
 	return ERR_PTR(-EPROBE_DEFER);
 }
-EXPORT_SYMBOL_NS_GPL(__devm_iio_backend_get_from_fwnode_lookup, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(__devm_iio_backend_get_from_fwnode_lookup, "IIO_BACKEND");
 
 /**
  * iio_backend_get_priv - Get driver private data
@@ -839,7 +839,7 @@ void *iio_backend_get_priv(const struct iio_backend *back)
 {
 	return back->priv;
 }
-EXPORT_SYMBOL_NS_GPL(iio_backend_get_priv, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(iio_backend_get_priv, "IIO_BACKEND");
 
 static void iio_backend_unregister(void *arg)
 {
@@ -888,7 +888,7 @@ int devm_iio_backend_register(struct device *dev,
 
 	return devm_add_action_or_reset(dev, iio_backend_unregister, back);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_backend_register, IIO_BACKEND);
+EXPORT_SYMBOL_NS_GPL(devm_iio_backend_register, "IIO_BACKEND");
 
 MODULE_AUTHOR("Nuno Sa <nuno.sa@analog.com>");
 MODULE_DESCRIPTION("Framework to handle complex IIO aggregate devices");
diff --git a/drivers/iio/industrialio-buffer.c b/drivers/iio/industrialio-buffer.c
index 8104696cd475..2708f87df719 100644
--- a/drivers/iio/industrialio-buffer.c
+++ b/drivers/iio/industrialio-buffer.c
@@ -36,7 +36,7 @@
 
 #define DMABUF_ENQUEUE_TIMEOUT_MS 5000
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 struct iio_dmabuf_priv {
 	struct list_head entry;
diff --git a/drivers/iio/industrialio-gts-helper.c b/drivers/iio/industrialio-gts-helper.c
index 5f131bc1a01e..71525f80d071 100644
--- a/drivers/iio/industrialio-gts-helper.c
+++ b/drivers/iio/industrialio-gts-helper.c
@@ -134,7 +134,7 @@ int iio_gts_total_gain_to_scale(struct iio_gts *gts, int total_gain,
 
 	return iio_gts_delinearize(tmp, NANO, scale_int, scale_nano);
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_total_gain_to_scale, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_total_gain_to_scale, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_purge_avail_scale_table - free-up the available scale tables
@@ -622,7 +622,7 @@ int devm_iio_init_iio_gts(struct device *dev, int max_scale_int, int max_scale_n
 
 	return devm_iio_gts_build_avail_tables(dev, gts);
 }
-EXPORT_SYMBOL_NS_GPL(devm_iio_init_iio_gts, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(devm_iio_init_iio_gts, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_all_avail_scales - helper for listing all available scales
@@ -645,7 +645,7 @@ int iio_gts_all_avail_scales(struct iio_gts *gts, const int **vals, int *type,
 
 	return IIO_AVAIL_LIST;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_all_avail_scales, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_all_avail_scales, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_avail_scales_for_time - list scales for integration time
@@ -679,7 +679,7 @@ int iio_gts_avail_scales_for_time(struct iio_gts *gts, int time,
 
 	return IIO_AVAIL_LIST;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_avail_scales_for_time, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_avail_scales_for_time, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_avail_times - helper for listing available integration times
@@ -702,7 +702,7 @@ int iio_gts_avail_times(struct iio_gts *gts,  const int **vals, int *type,
 
 	return IIO_AVAIL_LIST;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_avail_times, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_avail_times, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_find_sel_by_gain - find selector corresponding to a HW-gain
@@ -722,7 +722,7 @@ int iio_gts_find_sel_by_gain(struct iio_gts *gts, int gain)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_find_sel_by_gain, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_find_sel_by_gain, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_find_gain_by_sel - find HW-gain corresponding to a selector
@@ -742,7 +742,7 @@ int iio_gts_find_gain_by_sel(struct iio_gts *gts, int sel)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_find_gain_by_sel, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_find_gain_by_sel, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_get_min_gain - find smallest valid HW-gain
@@ -765,7 +765,7 @@ int iio_gts_get_min_gain(struct iio_gts *gts)
 
 	return min;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_get_min_gain, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_get_min_gain, "IIO_GTS_HELPER");
 
 /**
  * iio_find_closest_gain_low - Find the closest lower matching gain
@@ -826,7 +826,7 @@ int iio_find_closest_gain_low(struct iio_gts *gts, int gain, bool *in_range)
 
 	return gts->hwgain_table[best].gain;
 }
-EXPORT_SYMBOL_NS_GPL(iio_find_closest_gain_low, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_find_closest_gain_low, "IIO_GTS_HELPER");
 
 static int iio_gts_get_int_time_gain_multiplier_by_sel(struct iio_gts *gts,
 						       int sel)
@@ -913,7 +913,7 @@ int iio_gts_find_gain_sel_for_scale_using_time(struct iio_gts *gts, int time_sel
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_find_gain_sel_for_scale_using_time, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_find_gain_sel_for_scale_using_time, "IIO_GTS_HELPER");
 
 static int iio_gts_get_total_gain(struct iio_gts *gts, int gain, int time)
 {
@@ -975,7 +975,7 @@ int iio_gts_get_scale(struct iio_gts *gts, int gain, int time, int *scale_int,
 
 	return iio_gts_delinearize(lin_scale, NANO, scale_int, scale_nano);
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_get_scale, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_get_scale, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_find_new_gain_sel_by_old_gain_time - compensate for time change
@@ -1032,7 +1032,7 @@ int iio_gts_find_new_gain_sel_by_old_gain_time(struct iio_gts *gts,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_find_new_gain_sel_by_old_gain_time, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_find_new_gain_sel_by_old_gain_time, "IIO_GTS_HELPER");
 
 /**
  * iio_gts_find_new_gain_by_old_gain_time - compensate for time change
@@ -1084,7 +1084,7 @@ int iio_gts_find_new_gain_by_old_gain_time(struct iio_gts *gts, int old_gain,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iio_gts_find_new_gain_by_old_gain_time, IIO_GTS_HELPER);
+EXPORT_SYMBOL_NS_GPL(iio_gts_find_new_gain_by_old_gain_time, "IIO_GTS_HELPER");
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306.c
index 079e02be1005..e443239623a1 100644
--- a/drivers/iio/light/apds9306.c
+++ b/drivers/iio/light/apds9306.c
@@ -1358,4 +1358,4 @@ module_i2c_driver(apds9306_driver);
 MODULE_AUTHOR("Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>");
 MODULE_DESCRIPTION("APDS9306 Ambient Light Sensor driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_GTS_HELPER);
+MODULE_IMPORT_NS("IIO_GTS_HELPER");
diff --git a/drivers/iio/light/bh1745.c b/drivers/iio/light/bh1745.c
index 2e458e9d5d85..36f1f283a2ae 100644
--- a/drivers/iio/light/bh1745.c
+++ b/drivers/iio/light/bh1745.c
@@ -903,4 +903,4 @@ module_i2c_driver(bh1745_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Mudit Sharma <muditsharma.info@gmail.com>");
 MODULE_DESCRIPTION("BH1745 colour sensor driver");
-MODULE_IMPORT_NS(IIO_GTS_HELPER);
+MODULE_IMPORT_NS("IIO_GTS_HELPER");
diff --git a/drivers/iio/light/hid-sensor-als.c b/drivers/iio/light/hid-sensor-als.c
index 260281194f61..09e9badab15b 100644
--- a/drivers/iio/light/hid-sensor-als.c
+++ b/drivers/iio/light/hid-sensor-als.c
@@ -474,4 +474,4 @@ module_platform_driver(hid_als_platform_driver);
 MODULE_DESCRIPTION("HID Sensor ALS");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/light/hid-sensor-prox.c b/drivers/iio/light/hid-sensor-prox.c
index 26c481d2998c..662b3d5e41b2 100644
--- a/drivers/iio/light/hid-sensor-prox.c
+++ b/drivers/iio/light/hid-sensor-prox.c
@@ -351,4 +351,4 @@ module_platform_driver(hid_prox_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Proximity");
 MODULE_AUTHOR("Archana Patni <archana.patni@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/light/rohm-bu27008.c b/drivers/iio/light/rohm-bu27008.c
index 0f010eff1981..fa35dd32700c 100644
--- a/drivers/iio/light/rohm-bu27008.c
+++ b/drivers/iio/light/rohm-bu27008.c
@@ -1632,4 +1632,4 @@ module_i2c_driver(bu27008_i2c_driver);
 MODULE_DESCRIPTION("ROHM BU27008 and BU27010 colour sensor driver");
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_GTS_HELPER);
+MODULE_IMPORT_NS("IIO_GTS_HELPER");
diff --git a/drivers/iio/light/rohm-bu27034.c b/drivers/iio/light/rohm-bu27034.c
index 76711c3cdf7c..4f591c2278f2 100644
--- a/drivers/iio/light/rohm-bu27034.c
+++ b/drivers/iio/light/rohm-bu27034.c
@@ -1350,4 +1350,4 @@ module_i2c_driver(bu27034_i2c_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("ROHM BU27034 ambient light sensor driver");
-MODULE_IMPORT_NS(IIO_GTS_HELPER);
+MODULE_IMPORT_NS("IIO_GTS_HELPER");
diff --git a/drivers/iio/light/st_uvis25_core.c b/drivers/iio/light/st_uvis25_core.c
index fba3997574bb..412e7847d1ef 100644
--- a/drivers/iio/light/st_uvis25_core.c
+++ b/drivers/iio/light/st_uvis25_core.c
@@ -323,7 +323,7 @@ int st_uvis25_probe(struct device *dev, int irq, struct regmap *regmap)
 
 	return devm_iio_device_register(dev, iio_dev);
 }
-EXPORT_SYMBOL_NS(st_uvis25_probe, IIO_UVIS25);
+EXPORT_SYMBOL_NS(st_uvis25_probe, "IIO_UVIS25");
 
 static int st_uvis25_suspend(struct device *dev)
 {
diff --git a/drivers/iio/light/st_uvis25_i2c.c b/drivers/iio/light/st_uvis25_i2c.c
index 6bc2ddfb77ca..f54282476d11 100644
--- a/drivers/iio/light/st_uvis25_i2c.c
+++ b/drivers/iio/light/st_uvis25_i2c.c
@@ -65,4 +65,4 @@ module_i2c_driver(st_uvis25_driver);
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>");
 MODULE_DESCRIPTION("STMicroelectronics uvis25 i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_UVIS25);
+MODULE_IMPORT_NS("IIO_UVIS25");
diff --git a/drivers/iio/light/st_uvis25_spi.c b/drivers/iio/light/st_uvis25_spi.c
index 86a232320d7d..18edc6a5a4a4 100644
--- a/drivers/iio/light/st_uvis25_spi.c
+++ b/drivers/iio/light/st_uvis25_spi.c
@@ -66,4 +66,4 @@ module_spi_driver(st_uvis25_driver);
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>");
 MODULE_DESCRIPTION("STMicroelectronics uvis25 spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_UVIS25);
+MODULE_IMPORT_NS("IIO_UVIS25");
diff --git a/drivers/iio/magnetometer/bmc150_magn.c b/drivers/iio/magnetometer/bmc150_magn.c
index 06d5a1ef1fbd..4298df1df40a 100644
--- a/drivers/iio/magnetometer/bmc150_magn.c
+++ b/drivers/iio/magnetometer/bmc150_magn.c
@@ -226,7 +226,7 @@ const struct regmap_config bmc150_magn_regmap_config = {
 	.writeable_reg = bmc150_magn_is_writeable_reg,
 	.volatile_reg = bmc150_magn_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bmc150_magn_regmap_config, IIO_BMC150_MAGN);
+EXPORT_SYMBOL_NS(bmc150_magn_regmap_config, "IIO_BMC150_MAGN");
 
 static int bmc150_magn_set_power_mode(struct bmc150_magn_data *data,
 				      enum bmc150_magn_power_modes mode,
@@ -983,7 +983,7 @@ int bmc150_magn_probe(struct device *dev, struct regmap *regmap,
 	bmc150_magn_set_power_mode(data, BMC150_MAGN_POWER_MODE_SUSPEND, true);
 	return ret;
 }
-EXPORT_SYMBOL_NS(bmc150_magn_probe, IIO_BMC150_MAGN);
+EXPORT_SYMBOL_NS(bmc150_magn_probe, "IIO_BMC150_MAGN");
 
 void bmc150_magn_remove(struct device *dev)
 {
@@ -1009,7 +1009,7 @@ void bmc150_magn_remove(struct device *dev)
 
 	regulator_bulk_disable(ARRAY_SIZE(data->regulators), data->regulators);
 }
-EXPORT_SYMBOL_NS(bmc150_magn_remove, IIO_BMC150_MAGN);
+EXPORT_SYMBOL_NS(bmc150_magn_remove, "IIO_BMC150_MAGN");
 
 #ifdef CONFIG_PM
 static int bmc150_magn_runtime_suspend(struct device *dev)
@@ -1077,7 +1077,7 @@ const struct dev_pm_ops bmc150_magn_pm_ops = {
 	SET_RUNTIME_PM_OPS(bmc150_magn_runtime_suspend,
 			   bmc150_magn_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_NS(bmc150_magn_pm_ops, IIO_BMC150_MAGN);
+EXPORT_SYMBOL_NS(bmc150_magn_pm_ops, "IIO_BMC150_MAGN");
 
 MODULE_AUTHOR("Irina Tirdea <irina.tirdea@intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iio/magnetometer/bmc150_magn_i2c.c b/drivers/iio/magnetometer/bmc150_magn_i2c.c
index a28d46d59875..02c279c2964c 100644
--- a/drivers/iio/magnetometer/bmc150_magn_i2c.c
+++ b/drivers/iio/magnetometer/bmc150_magn_i2c.c
@@ -79,4 +79,4 @@ module_i2c_driver(bmc150_magn_driver);
 MODULE_AUTHOR("Daniel Baluta <daniel.baluta@intel.com");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("BMC150 I2C magnetometer driver");
-MODULE_IMPORT_NS(IIO_BMC150_MAGN);
+MODULE_IMPORT_NS("IIO_BMC150_MAGN");
diff --git a/drivers/iio/magnetometer/bmc150_magn_spi.c b/drivers/iio/magnetometer/bmc150_magn_spi.c
index abc75a05c46a..8eda39469d30 100644
--- a/drivers/iio/magnetometer/bmc150_magn_spi.c
+++ b/drivers/iio/magnetometer/bmc150_magn_spi.c
@@ -63,4 +63,4 @@ module_spi_driver(bmc150_magn_spi_driver);
 MODULE_AUTHOR("Daniel Baluta <daniel.baluta@intel.com");
 MODULE_DESCRIPTION("BMC150 magnetometer SPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BMC150_MAGN);
+MODULE_IMPORT_NS("IIO_BMC150_MAGN");
diff --git a/drivers/iio/magnetometer/hid-sensor-magn-3d.c b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
index 5c795a430d09..af7defff4722 100644
--- a/drivers/iio/magnetometer/hid-sensor-magn-3d.c
+++ b/drivers/iio/magnetometer/hid-sensor-magn-3d.c
@@ -581,4 +581,4 @@ module_platform_driver(hid_magn_3d_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Magnetometer 3D");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/magnetometer/hmc5843_core.c b/drivers/iio/magnetometer/hmc5843_core.c
index c5521d61da29..2fc84310e2cc 100644
--- a/drivers/iio/magnetometer/hmc5843_core.c
+++ b/drivers/iio/magnetometer/hmc5843_core.c
@@ -669,7 +669,7 @@ int hmc5843_common_probe(struct device *dev, struct regmap *regmap,
 	hmc5843_set_mode(iio_priv(indio_dev), HMC5843_MODE_SLEEP);
 	return ret;
 }
-EXPORT_SYMBOL_NS(hmc5843_common_probe, IIO_HMC5843);
+EXPORT_SYMBOL_NS(hmc5843_common_probe, "IIO_HMC5843");
 
 void hmc5843_common_remove(struct device *dev)
 {
@@ -681,7 +681,7 @@ void hmc5843_common_remove(struct device *dev)
 	/*  sleep mode to save power */
 	hmc5843_set_mode(iio_priv(indio_dev), HMC5843_MODE_SLEEP);
 }
-EXPORT_SYMBOL_NS(hmc5843_common_remove, IIO_HMC5843);
+EXPORT_SYMBOL_NS(hmc5843_common_remove, "IIO_HMC5843");
 
 MODULE_AUTHOR("Shubhrajyoti Datta <shubhrajyoti@ti.com>");
 MODULE_DESCRIPTION("HMC5843/5883/5883L/5983 core driver");
diff --git a/drivers/iio/magnetometer/hmc5843_i2c.c b/drivers/iio/magnetometer/hmc5843_i2c.c
index bdd2784a9f86..657a309e2bd5 100644
--- a/drivers/iio/magnetometer/hmc5843_i2c.c
+++ b/drivers/iio/magnetometer/hmc5843_i2c.c
@@ -103,4 +103,4 @@ module_i2c_driver(hmc5843_driver);
 MODULE_AUTHOR("Josef Gajdusek <atx@atx.name>");
 MODULE_DESCRIPTION("HMC5843/5883/5883L/5983 i2c driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HMC5843);
+MODULE_IMPORT_NS("IIO_HMC5843");
diff --git a/drivers/iio/magnetometer/hmc5843_spi.c b/drivers/iio/magnetometer/hmc5843_spi.c
index c42d2e2a6a6c..b7fde331069d 100644
--- a/drivers/iio/magnetometer/hmc5843_spi.c
+++ b/drivers/iio/magnetometer/hmc5843_spi.c
@@ -100,4 +100,4 @@ module_spi_driver(hmc5843_driver);
 MODULE_AUTHOR("Josef Gajdusek <atx@atx.name>");
 MODULE_DESCRIPTION("HMC5983 SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HMC5843);
+MODULE_IMPORT_NS("IIO_HMC5843");
diff --git a/drivers/iio/magnetometer/rm3100-core.c b/drivers/iio/magnetometer/rm3100-core.c
index baab918b3825..c99694a77a14 100644
--- a/drivers/iio/magnetometer/rm3100-core.c
+++ b/drivers/iio/magnetometer/rm3100-core.c
@@ -100,7 +100,7 @@ const struct regmap_access_table rm3100_readable_table = {
 	.yes_ranges = rm3100_readable_ranges,
 	.n_yes_ranges = ARRAY_SIZE(rm3100_readable_ranges),
 };
-EXPORT_SYMBOL_NS_GPL(rm3100_readable_table, IIO_RM3100);
+EXPORT_SYMBOL_NS_GPL(rm3100_readable_table, "IIO_RM3100");
 
 static const struct regmap_range rm3100_writable_ranges[] = {
 	regmap_reg_range(RM3100_W_REG_START, RM3100_W_REG_END),
@@ -110,7 +110,7 @@ const struct regmap_access_table rm3100_writable_table = {
 	.yes_ranges = rm3100_writable_ranges,
 	.n_yes_ranges = ARRAY_SIZE(rm3100_writable_ranges),
 };
-EXPORT_SYMBOL_NS_GPL(rm3100_writable_table, IIO_RM3100);
+EXPORT_SYMBOL_NS_GPL(rm3100_writable_table, "IIO_RM3100");
 
 static const struct regmap_range rm3100_volatile_ranges[] = {
 	regmap_reg_range(RM3100_V_REG_START, RM3100_V_REG_END),
@@ -120,7 +120,7 @@ const struct regmap_access_table rm3100_volatile_table = {
 	.yes_ranges = rm3100_volatile_ranges,
 	.n_yes_ranges = ARRAY_SIZE(rm3100_volatile_ranges),
 };
-EXPORT_SYMBOL_NS_GPL(rm3100_volatile_table, IIO_RM3100);
+EXPORT_SYMBOL_NS_GPL(rm3100_volatile_table, "IIO_RM3100");
 
 static irqreturn_t rm3100_thread_fn(int irq, void *d)
 {
@@ -604,7 +604,7 @@ int rm3100_common_probe(struct device *dev, struct regmap *regmap, int irq)
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(rm3100_common_probe, IIO_RM3100);
+EXPORT_SYMBOL_NS_GPL(rm3100_common_probe, "IIO_RM3100");
 
 MODULE_AUTHOR("Song Qiang <songqiang1304521@gmail.com>");
 MODULE_DESCRIPTION("PNI RM3100 3-axis magnetometer i2c driver");
diff --git a/drivers/iio/magnetometer/rm3100-i2c.c b/drivers/iio/magnetometer/rm3100-i2c.c
index ac7276b3798c..a09a271b62c5 100644
--- a/drivers/iio/magnetometer/rm3100-i2c.c
+++ b/drivers/iio/magnetometer/rm3100-i2c.c
@@ -52,4 +52,4 @@ module_i2c_driver(rm3100_driver);
 MODULE_AUTHOR("Song Qiang <songqiang1304521@gmail.com>");
 MODULE_DESCRIPTION("PNI RM3100 3-axis magnetometer i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_RM3100);
+MODULE_IMPORT_NS("IIO_RM3100");
diff --git a/drivers/iio/magnetometer/rm3100-spi.c b/drivers/iio/magnetometer/rm3100-spi.c
index 76dc9b66cd3c..dd6d48043740 100644
--- a/drivers/iio/magnetometer/rm3100-spi.c
+++ b/drivers/iio/magnetometer/rm3100-spi.c
@@ -62,4 +62,4 @@ module_spi_driver(rm3100_driver);
 MODULE_AUTHOR("Song Qiang <songqiang1304521@gmail.com>");
 MODULE_DESCRIPTION("PNI RM3100 3-axis magnetometer spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_RM3100);
+MODULE_IMPORT_NS("IIO_RM3100");
diff --git a/drivers/iio/magnetometer/st_magn_core.c b/drivers/iio/magnetometer/st_magn_core.c
index 6cc0dfd31821..ef348d316c00 100644
--- a/drivers/iio/magnetometer/st_magn_core.c
+++ b/drivers/iio/magnetometer/st_magn_core.c
@@ -601,7 +601,7 @@ const struct st_sensor_settings *st_magn_get_settings(const char *name)
 
 	return &st_magn_sensors_settings[index];
 }
-EXPORT_SYMBOL_NS(st_magn_get_settings, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_magn_get_settings, "IIO_ST_SENSORS");
 
 int st_magn_common_probe(struct iio_dev *indio_dev)
 {
@@ -648,9 +648,9 @@ int st_magn_common_probe(struct iio_dev *indio_dev)
 
 	return devm_iio_device_register(parent, indio_dev);
 }
-EXPORT_SYMBOL_NS(st_magn_common_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_magn_common_probe, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics magnetometers driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/magnetometer/st_magn_i2c.c b/drivers/iio/magnetometer/st_magn_i2c.c
index 950826dd20bf..1672b274768d 100644
--- a/drivers/iio/magnetometer/st_magn_i2c.c
+++ b/drivers/iio/magnetometer/st_magn_i2c.c
@@ -119,4 +119,4 @@ module_i2c_driver(st_magn_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics magnetometers i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/magnetometer/st_magn_spi.c b/drivers/iio/magnetometer/st_magn_spi.c
index f203e1f87eec..fe4d0e63133c 100644
--- a/drivers/iio/magnetometer/st_magn_spi.c
+++ b/drivers/iio/magnetometer/st_magn_spi.c
@@ -111,4 +111,4 @@ module_spi_driver(st_magn_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics magnetometers spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/orientation/hid-sensor-incl-3d.c b/drivers/iio/orientation/hid-sensor-incl-3d.c
index 8943d5c78bc0..7ef9d1218566 100644
--- a/drivers/iio/orientation/hid-sensor-incl-3d.c
+++ b/drivers/iio/orientation/hid-sensor-incl-3d.c
@@ -417,4 +417,4 @@ module_platform_driver(hid_incl_3d_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Inclinometer 3D");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/orientation/hid-sensor-rotation.c b/drivers/iio/orientation/hid-sensor-rotation.c
index 5e8cadd5177a..682c7a81c636 100644
--- a/drivers/iio/orientation/hid-sensor-rotation.c
+++ b/drivers/iio/orientation/hid-sensor-rotation.c
@@ -369,4 +369,4 @@ module_platform_driver(hid_dev_rot_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Device Rotation");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/position/hid-sensor-custom-intel-hinge.c b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
index 76e173850a35..07cb6b595372 100644
--- a/drivers/iio/position/hid-sensor-custom-intel-hinge.c
+++ b/drivers/iio/position/hid-sensor-custom-intel-hinge.c
@@ -376,4 +376,4 @@ module_platform_driver(hid_hinge_platform_driver);
 MODULE_DESCRIPTION("HID Sensor INTEL Hinge");
 MODULE_AUTHOR("Ye Xiang <xiang.ye@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index a8b97b9b0461..425001171e94 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -1102,7 +1102,7 @@ const struct bmp280_chip_info bmp280_chip_info = {
 
 	.trigger_handler = bmp280_trigger_handler,
 };
-EXPORT_SYMBOL_NS(bmp280_chip_info, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp280_chip_info, "IIO_BMP280");
 
 static int bme280_chip_config(struct bmp280_data *data)
 {
@@ -1219,7 +1219,7 @@ const struct bmp280_chip_info bme280_chip_info = {
 
 	.trigger_handler = bme280_trigger_handler,
 };
-EXPORT_SYMBOL_NS(bme280_chip_info, IIO_BMP280);
+EXPORT_SYMBOL_NS(bme280_chip_info, "IIO_BMP280");
 
 /*
  * Helper function to send a command to BMP3XX sensors.
@@ -1696,7 +1696,7 @@ const struct bmp280_chip_info bmp380_chip_info = {
 
 	.trigger_handler = bmp380_trigger_handler,
 };
-EXPORT_SYMBOL_NS(bmp380_chip_info, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp380_chip_info, "IIO_BMP280");
 
 static int bmp580_soft_reset(struct bmp280_data *data)
 {
@@ -2261,7 +2261,7 @@ const struct bmp280_chip_info bmp580_chip_info = {
 
 	.trigger_handler = bmp580_trigger_handler,
 };
-EXPORT_SYMBOL_NS(bmp580_chip_info, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp580_chip_info, "IIO_BMP280");
 
 static int bmp180_wait_for_eoc(struct bmp280_data *data, u8 ctrl_meas)
 {
@@ -2577,7 +2577,7 @@ const struct bmp280_chip_info bmp180_chip_info = {
 
 	.trigger_handler = bmp180_trigger_handler,
 };
-EXPORT_SYMBOL_NS(bmp180_chip_info, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp180_chip_info, "IIO_BMP280");
 
 static irqreturn_t bmp085_eoc_irq(int irq, void *d)
 {
@@ -2814,7 +2814,7 @@ int bmp280_common_probe(struct device *dev,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS(bmp280_common_probe, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp280_common_probe, "IIO_BMP280");
 
 static int bmp280_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/iio/pressure/bmp280-i2c.c b/drivers/iio/pressure/bmp280-i2c.c
index 5c3a63b4327c..8578bc562e8a 100644
--- a/drivers/iio/pressure/bmp280-i2c.c
+++ b/drivers/iio/pressure/bmp280-i2c.c
@@ -62,4 +62,4 @@ module_i2c_driver(bmp280_i2c_driver);
 MODULE_AUTHOR("Vlad Dogaru <vlad.dogaru@intel.com>");
 MODULE_DESCRIPTION("Driver for Bosch Sensortec BMP180/BMP280 pressure and temperature sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_BMP280);
+MODULE_IMPORT_NS("IIO_BMP280");
diff --git a/drivers/iio/pressure/bmp280-regmap.c b/drivers/iio/pressure/bmp280-regmap.c
index d27d68edd906..b6a7b417c8cf 100644
--- a/drivers/iio/pressure/bmp280-regmap.c
+++ b/drivers/iio/pressure/bmp280-regmap.c
@@ -39,7 +39,7 @@ const struct regmap_config bmp180_regmap_config = {
 	.writeable_reg = bmp180_is_writeable_reg,
 	.volatile_reg = bmp180_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bmp180_regmap_config, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp180_regmap_config, "IIO_BMP280");
 
 static bool bme280_is_writeable_reg(struct device *dev, unsigned int reg)
 {
@@ -200,7 +200,7 @@ const struct regmap_config bmp280_regmap_config = {
 	.writeable_reg = bmp280_is_writeable_reg,
 	.volatile_reg = bmp280_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bmp280_regmap_config, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp280_regmap_config, "IIO_BMP280");
 
 const struct regmap_config bme280_regmap_config = {
 	.reg_bits = 8,
@@ -212,7 +212,7 @@ const struct regmap_config bme280_regmap_config = {
 	.writeable_reg = bme280_is_writeable_reg,
 	.volatile_reg = bme280_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bme280_regmap_config, IIO_BMP280);
+EXPORT_SYMBOL_NS(bme280_regmap_config, "IIO_BMP280");
 
 const struct regmap_config bmp380_regmap_config = {
 	.reg_bits = 8,
@@ -224,7 +224,7 @@ const struct regmap_config bmp380_regmap_config = {
 	.writeable_reg = bmp380_is_writeable_reg,
 	.volatile_reg = bmp380_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bmp380_regmap_config, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp380_regmap_config, "IIO_BMP280");
 
 const struct regmap_config bmp580_regmap_config = {
 	.reg_bits = 8,
@@ -236,4 +236,4 @@ const struct regmap_config bmp580_regmap_config = {
 	.writeable_reg = bmp580_is_writeable_reg,
 	.volatile_reg = bmp580_is_volatile_reg,
 };
-EXPORT_SYMBOL_NS(bmp580_regmap_config, IIO_BMP280);
+EXPORT_SYMBOL_NS(bmp580_regmap_config, "IIO_BMP280");
diff --git a/drivers/iio/pressure/bmp280-spi.c b/drivers/iio/pressure/bmp280-spi.c
index d18549d9bb64..c1e3d4e8fba7 100644
--- a/drivers/iio/pressure/bmp280-spi.c
+++ b/drivers/iio/pressure/bmp280-spi.c
@@ -150,4 +150,4 @@ module_spi_driver(bmp280_spi_driver);
 
 MODULE_DESCRIPTION("BMP280 SPI bus driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_BMP280);
+MODULE_IMPORT_NS("IIO_BMP280");
diff --git a/drivers/iio/pressure/hid-sensor-press.c b/drivers/iio/pressure/hid-sensor-press.c
index 956045e2db29..522d296c202c 100644
--- a/drivers/iio/pressure/hid-sensor-press.c
+++ b/drivers/iio/pressure/hid-sensor-press.c
@@ -357,4 +357,4 @@ module_platform_driver(hid_press_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Pressure");
 MODULE_AUTHOR("Archana Patni <archana.patni@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/pressure/hsc030pa.c b/drivers/iio/pressure/hsc030pa.c
index 4e6f10eeabc3..168245818cfe 100644
--- a/drivers/iio/pressure/hsc030pa.c
+++ b/drivers/iio/pressure/hsc030pa.c
@@ -534,7 +534,7 @@ int hsc_common_probe(struct device *dev, hsc_recv_fn recv)
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS(hsc_common_probe, IIO_HONEYWELL_HSC030PA);
+EXPORT_SYMBOL_NS(hsc_common_probe, "IIO_HONEYWELL_HSC030PA");
 
 MODULE_AUTHOR("Petre Rodan <petre.rodan@subdimension.ro>");
 MODULE_DESCRIPTION("Honeywell HSC and SSC pressure sensor core driver");
diff --git a/drivers/iio/pressure/hsc030pa_i2c.c b/drivers/iio/pressure/hsc030pa_i2c.c
index b3fd230e71da..7f2398aa8155 100644
--- a/drivers/iio/pressure/hsc030pa_i2c.c
+++ b/drivers/iio/pressure/hsc030pa_i2c.c
@@ -71,4 +71,4 @@ module_i2c_driver(hsc_i2c_driver);
 MODULE_AUTHOR("Petre Rodan <petre.rodan@subdimension.ro>");
 MODULE_DESCRIPTION("Honeywell HSC and SSC pressure sensor i2c driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HONEYWELL_HSC030PA);
+MODULE_IMPORT_NS("IIO_HONEYWELL_HSC030PA");
diff --git a/drivers/iio/pressure/hsc030pa_spi.c b/drivers/iio/pressure/hsc030pa_spi.c
index 337eecc577d2..60768726e9ad 100644
--- a/drivers/iio/pressure/hsc030pa_spi.c
+++ b/drivers/iio/pressure/hsc030pa_spi.c
@@ -58,4 +58,4 @@ module_spi_driver(hsc_spi_driver);
 MODULE_AUTHOR("Petre Rodan <petre.rodan@subdimension.ro>");
 MODULE_DESCRIPTION("Honeywell HSC and SSC pressure sensor spi driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HONEYWELL_HSC030PA);
+MODULE_IMPORT_NS("IIO_HONEYWELL_HSC030PA");
diff --git a/drivers/iio/pressure/mpl115.c b/drivers/iio/pressure/mpl115.c
index 02ea38c8a3e4..71beb28b7f2c 100644
--- a/drivers/iio/pressure/mpl115.c
+++ b/drivers/iio/pressure/mpl115.c
@@ -225,7 +225,7 @@ int mpl115_probe(struct device *dev, const char *name,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(mpl115_probe, IIO_MPL115);
+EXPORT_SYMBOL_NS_GPL(mpl115_probe, "IIO_MPL115");
 
 static int mpl115_runtime_suspend(struct device *dev)
 {
diff --git a/drivers/iio/pressure/mpl115_i2c.c b/drivers/iio/pressure/mpl115_i2c.c
index 0c51dc02478e..3db9ef4e2770 100644
--- a/drivers/iio/pressure/mpl115_i2c.c
+++ b/drivers/iio/pressure/mpl115_i2c.c
@@ -63,4 +63,4 @@ module_i2c_driver(mpl115_i2c_driver);
 MODULE_AUTHOR("Peter Meerwald <pmeerw@pmeerw.net>");
 MODULE_DESCRIPTION("Freescale MPL115A2 pressure/temperature driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_MPL115);
+MODULE_IMPORT_NS("IIO_MPL115");
diff --git a/drivers/iio/pressure/mpl115_spi.c b/drivers/iio/pressure/mpl115_spi.c
index 58d218fd90dc..888cfa666238 100644
--- a/drivers/iio/pressure/mpl115_spi.c
+++ b/drivers/iio/pressure/mpl115_spi.c
@@ -102,4 +102,4 @@ module_spi_driver(mpl115_spi_driver);
 MODULE_AUTHOR("Akinobu Mita <akinobu.mita@gmail.com>");
 MODULE_DESCRIPTION("Freescale MPL115A1 pressure/temperature driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_MPL115);
+MODULE_IMPORT_NS("IIO_MPL115");
diff --git a/drivers/iio/pressure/mprls0025pa.c b/drivers/iio/pressure/mprls0025pa.c
index 3b6145348c2e..2336f2760eae 100644
--- a/drivers/iio/pressure/mprls0025pa.c
+++ b/drivers/iio/pressure/mprls0025pa.c
@@ -448,7 +448,7 @@ int mpr_common_probe(struct device *dev, const struct mpr_ops *ops, int irq)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mpr_common_probe, IIO_HONEYWELL_MPRLS0025PA);
+EXPORT_SYMBOL_NS(mpr_common_probe, "IIO_HONEYWELL_MPRLS0025PA");
 
 MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
 MODULE_DESCRIPTION("Honeywell MPR pressure sensor core driver");
diff --git a/drivers/iio/pressure/mprls0025pa_i2c.c b/drivers/iio/pressure/mprls0025pa_i2c.c
index 7a5c5aa2b456..48b23a4256ce 100644
--- a/drivers/iio/pressure/mprls0025pa_i2c.c
+++ b/drivers/iio/pressure/mprls0025pa_i2c.c
@@ -97,4 +97,4 @@ module_i2c_driver(mpr_i2c_driver);
 MODULE_AUTHOR("Andreas Klinger <ak@it-klinger.de>");
 MODULE_DESCRIPTION("Honeywell MPR pressure sensor i2c driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HONEYWELL_MPRLS0025PA);
+MODULE_IMPORT_NS("IIO_HONEYWELL_MPRLS0025PA");
diff --git a/drivers/iio/pressure/mprls0025pa_spi.c b/drivers/iio/pressure/mprls0025pa_spi.c
index 3aed14cd95c5..09f724c76d70 100644
--- a/drivers/iio/pressure/mprls0025pa_spi.c
+++ b/drivers/iio/pressure/mprls0025pa_spi.c
@@ -89,4 +89,4 @@ module_spi_driver(mpr_spi_driver);
 MODULE_AUTHOR("Petre Rodan <petre.rodan@subdimension.ro>");
 MODULE_DESCRIPTION("Honeywell MPR pressure sensor spi driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HONEYWELL_MPRLS0025PA);
+MODULE_IMPORT_NS("IIO_HONEYWELL_MPRLS0025PA");
diff --git a/drivers/iio/pressure/ms5611_core.c b/drivers/iio/pressure/ms5611_core.c
index 2fc706f9d8ae..056c8271c49d 100644
--- a/drivers/iio/pressure/ms5611_core.c
+++ b/drivers/iio/pressure/ms5611_core.c
@@ -449,7 +449,7 @@ int ms5611_probe(struct iio_dev *indio_dev, struct device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(ms5611_probe, IIO_MS5611);
+EXPORT_SYMBOL_NS(ms5611_probe, "IIO_MS5611");
 
 MODULE_AUTHOR("Tomasz Duszynski <tduszyns@gmail.com>");
 MODULE_DESCRIPTION("MS5611 core driver");
diff --git a/drivers/iio/pressure/ms5611_i2c.c b/drivers/iio/pressure/ms5611_i2c.c
index 7e2cb8b6afa2..1c041b9085fb 100644
--- a/drivers/iio/pressure/ms5611_i2c.c
+++ b/drivers/iio/pressure/ms5611_i2c.c
@@ -132,4 +132,4 @@ module_i2c_driver(ms5611_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tduszyns@gmail.com>");
 MODULE_DESCRIPTION("MS5611 i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MS5611);
+MODULE_IMPORT_NS("IIO_MS5611");
diff --git a/drivers/iio/pressure/ms5611_spi.c b/drivers/iio/pressure/ms5611_spi.c
index 87181963a3e3..b5a91e885793 100644
--- a/drivers/iio/pressure/ms5611_spi.c
+++ b/drivers/iio/pressure/ms5611_spi.c
@@ -134,4 +134,4 @@ module_spi_driver(ms5611_driver);
 MODULE_AUTHOR("Tomasz Duszynski <tduszyns@gmail.com>");
 MODULE_DESCRIPTION("MS5611 spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MS5611);
+MODULE_IMPORT_NS("IIO_MS5611");
diff --git a/drivers/iio/pressure/ms5637.c b/drivers/iio/pressure/ms5637.c
index ac30d76285d1..a1767a17fdce 100644
--- a/drivers/iio/pressure/ms5637.c
+++ b/drivers/iio/pressure/ms5637.c
@@ -248,4 +248,4 @@ MODULE_DESCRIPTION("Measurement-Specialties ms5637 temperature & pressure driver
 MODULE_AUTHOR("William Markezana <william.markezana@meas-spec.com>");
 MODULE_AUTHOR("Ludovic Tancerel <ludovic.tancerel@maplehightech.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MEAS_SPEC_SENSORS);
+MODULE_IMPORT_NS("IIO_MEAS_SPEC_SENSORS");
diff --git a/drivers/iio/pressure/st_pressure_core.c b/drivers/iio/pressure/st_pressure_core.c
index 597bf268ea51..b70d1cee82f3 100644
--- a/drivers/iio/pressure/st_pressure_core.c
+++ b/drivers/iio/pressure/st_pressure_core.c
@@ -738,7 +738,7 @@ const struct st_sensor_settings *st_press_get_settings(const char *name)
 
 	return &st_press_sensors_settings[index];
 }
-EXPORT_SYMBOL_NS(st_press_get_settings, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_press_get_settings, "IIO_ST_SENSORS");
 
 int st_press_common_probe(struct iio_dev *indio_dev)
 {
@@ -790,9 +790,9 @@ int st_press_common_probe(struct iio_dev *indio_dev)
 
 	return devm_iio_device_register(parent, indio_dev);
 }
-EXPORT_SYMBOL_NS(st_press_common_probe, IIO_ST_SENSORS);
+EXPORT_SYMBOL_NS(st_press_common_probe, "IIO_ST_SENSORS");
 
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics pressures driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/pressure/st_pressure_i2c.c b/drivers/iio/pressure/st_pressure_i2c.c
index 389523d6ae32..b7b66ddc3a73 100644
--- a/drivers/iio/pressure/st_pressure_i2c.c
+++ b/drivers/iio/pressure/st_pressure_i2c.c
@@ -121,4 +121,4 @@ module_i2c_driver(st_press_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics pressures i2c driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/pressure/st_pressure_spi.c b/drivers/iio/pressure/st_pressure_spi.c
index 25cca5ad7c55..1a4bd1a0f787 100644
--- a/drivers/iio/pressure/st_pressure_spi.c
+++ b/drivers/iio/pressure/st_pressure_spi.c
@@ -123,4 +123,4 @@ module_spi_driver(st_press_driver);
 MODULE_AUTHOR("Denis Ciocca <denis.ciocca@st.com>");
 MODULE_DESCRIPTION("STMicroelectronics pressures spi driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ST_SENSORS);
+MODULE_IMPORT_NS("IIO_ST_SENSORS");
diff --git a/drivers/iio/pressure/zpa2326.c b/drivers/iio/pressure/zpa2326.c
index 950f8dee2b26..2adea84f5b4d 100644
--- a/drivers/iio/pressure/zpa2326.c
+++ b/drivers/iio/pressure/zpa2326.c
@@ -162,7 +162,7 @@ bool zpa2326_isreg_writeable(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_writeable, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_writeable, "IIO_ZPA2326");
 
 bool zpa2326_isreg_readable(struct device *dev, unsigned int reg)
 {
@@ -191,7 +191,7 @@ bool zpa2326_isreg_readable(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_readable, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_readable, "IIO_ZPA2326");
 
 bool zpa2326_isreg_precious(struct device *dev, unsigned int reg)
 {
@@ -204,7 +204,7 @@ bool zpa2326_isreg_precious(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_precious, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_isreg_precious, "IIO_ZPA2326");
 
 /**
  * zpa2326_enable_device() - Enable device, i.e. get out of low power mode.
@@ -649,7 +649,7 @@ const struct dev_pm_ops zpa2326_pm_ops = {
 	SET_RUNTIME_PM_OPS(zpa2326_runtime_suspend, zpa2326_runtime_resume,
 			   NULL)
 };
-EXPORT_SYMBOL_NS_GPL(zpa2326_pm_ops, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_pm_ops, "IIO_ZPA2326");
 
 /**
  * zpa2326_resume() - Request the PM layer to power supply the device.
@@ -1698,7 +1698,7 @@ int zpa2326_probe(struct device *parent,
 
 	return err;
 }
-EXPORT_SYMBOL_NS_GPL(zpa2326_probe, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_probe, "IIO_ZPA2326");
 
 void zpa2326_remove(const struct device *parent)
 {
@@ -1709,7 +1709,7 @@ void zpa2326_remove(const struct device *parent)
 	zpa2326_sleep(indio_dev);
 	zpa2326_power_off(indio_dev, iio_priv(indio_dev));
 }
-EXPORT_SYMBOL_NS_GPL(zpa2326_remove, IIO_ZPA2326);
+EXPORT_SYMBOL_NS_GPL(zpa2326_remove, "IIO_ZPA2326");
 
 MODULE_AUTHOR("Gregor Boirie <gregor.boirie@parrot.com>");
 MODULE_DESCRIPTION("Core driver for Murata ZPA2326 pressure sensor");
diff --git a/drivers/iio/pressure/zpa2326_i2c.c b/drivers/iio/pressure/zpa2326_i2c.c
index 4833e525c393..49a239ebdabf 100644
--- a/drivers/iio/pressure/zpa2326_i2c.c
+++ b/drivers/iio/pressure/zpa2326_i2c.c
@@ -85,4 +85,4 @@ module_i2c_driver(zpa2326_i2c_driver);
 MODULE_AUTHOR("Gregor Boirie <gregor.boirie@parrot.com>");
 MODULE_DESCRIPTION("I2C driver for Murata ZPA2326 pressure sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ZPA2326);
+MODULE_IMPORT_NS("IIO_ZPA2326");
diff --git a/drivers/iio/pressure/zpa2326_spi.c b/drivers/iio/pressure/zpa2326_spi.c
index 9c1bcb82d360..317270fa1c43 100644
--- a/drivers/iio/pressure/zpa2326_spi.c
+++ b/drivers/iio/pressure/zpa2326_spi.c
@@ -89,4 +89,4 @@ module_spi_driver(zpa2326_spi_driver);
 MODULE_AUTHOR("Gregor Boirie <gregor.boirie@parrot.com>");
 MODULE_DESCRIPTION("SPI driver for Murata ZPA2326 pressure sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_ZPA2326);
+MODULE_IMPORT_NS("IIO_ZPA2326");
diff --git a/drivers/iio/proximity/sx9310.c b/drivers/iio/proximity/sx9310.c
index 427c9343d6d1..0d7f0518d4fb 100644
--- a/drivers/iio/proximity/sx9310.c
+++ b/drivers/iio/proximity/sx9310.c
@@ -1029,4 +1029,4 @@ MODULE_AUTHOR("Gwendal Grignou <gwendal@chromium.org>");
 MODULE_AUTHOR("Daniel Campello <campello@chromium.org>");
 MODULE_DESCRIPTION("Driver for Semtech SX9310/SX9311 proximity sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SEMTECH_PROX);
+MODULE_IMPORT_NS("SEMTECH_PROX");
diff --git a/drivers/iio/proximity/sx9324.c b/drivers/iio/proximity/sx9324.c
index 629f83c37d59..a901cb4eec60 100644
--- a/drivers/iio/proximity/sx9324.c
+++ b/drivers/iio/proximity/sx9324.c
@@ -1135,4 +1135,4 @@ module_i2c_driver(sx9324_driver);
 MODULE_AUTHOR("Gwendal Grignou <gwendal@chromium.org>");
 MODULE_DESCRIPTION("Driver for Semtech SX9324 proximity sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SEMTECH_PROX);
+MODULE_IMPORT_NS("SEMTECH_PROX");
diff --git a/drivers/iio/proximity/sx9360.c b/drivers/iio/proximity/sx9360.c
index 2b90bf45a201..faf7c7b66a98 100644
--- a/drivers/iio/proximity/sx9360.c
+++ b/drivers/iio/proximity/sx9360.c
@@ -866,4 +866,4 @@ module_i2c_driver(sx9360_driver);
 MODULE_AUTHOR("Gwendal Grignou <gwendal@chromium.org>");
 MODULE_DESCRIPTION("Driver for Semtech SX9360 proximity sensor");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SEMTECH_PROX);
+MODULE_IMPORT_NS("SEMTECH_PROX");
diff --git a/drivers/iio/proximity/sx_common.c b/drivers/iio/proximity/sx_common.c
index 71aa6dced7d3..7025b281a351 100644
--- a/drivers/iio/proximity/sx_common.c
+++ b/drivers/iio/proximity/sx_common.c
@@ -53,7 +53,7 @@ const struct iio_event_spec sx_common_events[3] = {
 				 BIT(IIO_EV_INFO_VALUE),
 	},
 };
-EXPORT_SYMBOL_NS_GPL(sx_common_events, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_events, "SEMTECH_PROX");
 
 static irqreturn_t sx_common_irq_handler(int irq, void *private)
 {
@@ -233,7 +233,7 @@ int sx_common_read_proximity(struct sx_common_data *data,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(sx_common_read_proximity, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_read_proximity, "SEMTECH_PROX");
 
 /**
  * sx_common_read_event_config() - Configure event setting.
@@ -253,7 +253,7 @@ int sx_common_read_event_config(struct iio_dev *indio_dev,
 
 	return !!(data->chan_event & BIT(chan->channel));
 }
-EXPORT_SYMBOL_NS_GPL(sx_common_read_event_config, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_read_event_config, "SEMTECH_PROX");
 
 /**
  * sx_common_write_event_config() - Configure event setting.
@@ -303,7 +303,7 @@ int sx_common_write_event_config(struct iio_dev *indio_dev,
 	mutex_unlock(&data->mutex);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(sx_common_write_event_config, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_write_event_config, "SEMTECH_PROX");
 
 static int sx_common_set_trigger_state(struct iio_trigger *trig, bool state)
 {
@@ -440,7 +440,7 @@ void sx_common_get_raw_register_config(struct device *dev,
 	reg_def->def = raw;
 #endif
 }
-EXPORT_SYMBOL_NS_GPL(sx_common_get_raw_register_config, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_get_raw_register_config, "SEMTECH_PROX");
 
 #define SX_COMMON_SOFT_RESET				0xde
 
@@ -563,7 +563,7 @@ int sx_common_probe(struct i2c_client *client,
 
 	return devm_iio_device_register(dev, indio_dev);
 }
-EXPORT_SYMBOL_NS_GPL(sx_common_probe, SEMTECH_PROX);
+EXPORT_SYMBOL_NS_GPL(sx_common_probe, "SEMTECH_PROX");
 
 MODULE_AUTHOR("Gwendal Grignou <gwendal@chromium.org>");
 MODULE_DESCRIPTION("Common functions and structures for Semtech sensor");
diff --git a/drivers/iio/temperature/hid-sensor-temperature.c b/drivers/iio/temperature/hid-sensor-temperature.c
index 0143fd478933..731ddfa61d72 100644
--- a/drivers/iio/temperature/hid-sensor-temperature.c
+++ b/drivers/iio/temperature/hid-sensor-temperature.c
@@ -290,4 +290,4 @@ module_platform_driver(hid_temperature_platform_driver);
 MODULE_DESCRIPTION("HID Environmental temperature sensor");
 MODULE_AUTHOR("Song Hongyan <hongyan.song@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 9213761c5d18..cfaa16f46a3f 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -232,4 +232,4 @@ MODULE_DESCRIPTION("Measurement-Specialties tsys01 temperature driver");
 MODULE_AUTHOR("William Markezana <william.markezana@meas-spec.com>");
 MODULE_AUTHOR("Ludovic Tancerel <ludovic.tancerel@maplehightech.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MEAS_SPEC_SENSORS);
+MODULE_IMPORT_NS("IIO_MEAS_SPEC_SENSORS");
diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
index 2b4959d6e467..ef34b3c58f26 100644
--- a/drivers/iio/temperature/tsys02d.c
+++ b/drivers/iio/temperature/tsys02d.c
@@ -187,4 +187,4 @@ MODULE_DESCRIPTION("Measurement-Specialties tsys02d temperature driver");
 MODULE_AUTHOR("William Markezana <william.markezana@meas-spec.com>");
 MODULE_AUTHOR("Ludovic Tancerel <ludovic.tancerel@maplehightech.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_MEAS_SPEC_SENSORS);
+MODULE_IMPORT_NS("IIO_MEAS_SPEC_SENSORS");
diff --git a/drivers/iio/test/iio-test-gts.c b/drivers/iio/test/iio-test-gts.c
index 5f16a7b5e6d4..1eceec9d477f 100644
--- a/drivers/iio/test/iio-test-gts.c
+++ b/drivers/iio/test/iio-test-gts.c
@@ -512,4 +512,4 @@ kunit_test_suite(iio_gts_test_suite);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Matti Vaittinen <mazziesaccount@gmail.com>");
 MODULE_DESCRIPTION("Test IIO light sensor gain-time-scale helpers");
-MODULE_IMPORT_NS(IIO_GTS_HELPER);
+MODULE_IMPORT_NS("IIO_GTS_HELPER");
diff --git a/drivers/iio/test/iio-test-rescale.c b/drivers/iio/test/iio-test-rescale.c
index 31ee55a6faed..cbf13337ed1f 100644
--- a/drivers/iio/test/iio-test-rescale.c
+++ b/drivers/iio/test/iio-test-rescale.c
@@ -712,4 +712,4 @@ kunit_test_suite(iio_rescale_test_suite);
 MODULE_AUTHOR("Liam Beguin <liambeguin@gmail.com>");
 MODULE_DESCRIPTION("Test IIO rescale conversion functions");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(IIO_RESCALE);
+MODULE_IMPORT_NS("IIO_RESCALE");
diff --git a/drivers/infiniband/core/umem_dmabuf.c b/drivers/infiniband/core/umem_dmabuf.c
index 9fcd37761264..0ec2e4120cc9 100644
--- a/drivers/infiniband/core/umem_dmabuf.c
+++ b/drivers/infiniband/core/umem_dmabuf.c
@@ -10,7 +10,7 @@
 
 #include "uverbs.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 int ib_umem_dmabuf_map_pages(struct ib_umem_dmabuf *umem_dmabuf)
 {
diff --git a/drivers/infiniband/hw/mana/device.c b/drivers/infiniband/hw/mana/device.c
index 7ac01918ef7c..3416a85f8738 100644
--- a/drivers/infiniband/hw/mana/device.c
+++ b/drivers/infiniband/hw/mana/device.c
@@ -9,7 +9,7 @@
 
 MODULE_DESCRIPTION("Microsoft Azure Network Adapter IB driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(NET_MANA);
+MODULE_IMPORT_NS("NET_MANA");
 
 static const struct ib_device_ops mana_ib_dev_ops = {
 	.owner = THIS_MODULE,
diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
index 84baa021370a..d2671bfd3798 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
@@ -607,6 +607,6 @@ static struct kunit_suite arm_smmu_v3_test_module = {
 };
 kunit_test_suites(&arm_smmu_v3_test_module);
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 MODULE_DESCRIPTION("KUnit tests for arm-smmu-v3 driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c5..5a3ec8d07337 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2238,7 +2238,7 @@ int iommu_group_replace_domain(struct iommu_group *group,
 	mutex_unlock(&group->mutex);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iommu_group_replace_domain, IOMMUFD_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(iommu_group_replace_domain, "IOMMUFD_INTERNAL");
 
 static int __iommu_device_set_domain(struct iommu_group *group,
 				     struct device *dev,
@@ -3493,7 +3493,7 @@ iommu_attach_handle_get(struct iommu_group *group, ioasid_t pasid, unsigned int
 
 	return handle;
 }
-EXPORT_SYMBOL_NS_GPL(iommu_attach_handle_get, IOMMUFD_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(iommu_attach_handle_get, "IOMMUFD_INTERNAL");
 
 /**
  * iommu_attach_group_handle - Attach an IOMMU domain to an IOMMU group
@@ -3533,7 +3533,7 @@ int iommu_attach_group_handle(struct iommu_domain *domain,
 	mutex_unlock(&group->mutex);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iommu_attach_group_handle, IOMMUFD_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(iommu_attach_group_handle, "IOMMUFD_INTERNAL");
 
 /**
  * iommu_detach_group_handle - Detach an IOMMU domain from an IOMMU group
@@ -3551,7 +3551,7 @@ void iommu_detach_group_handle(struct iommu_domain *domain,
 	xa_erase(&group->pasid_array, IOMMU_NO_PASID);
 	mutex_unlock(&group->mutex);
 }
-EXPORT_SYMBOL_NS_GPL(iommu_detach_group_handle, IOMMUFD_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(iommu_detach_group_handle, "IOMMUFD_INTERNAL");
 
 /**
  * iommu_replace_group_handle - replace the domain that a group is attached to
@@ -3597,4 +3597,4 @@ int iommu_replace_group_handle(struct iommu_group *group,
 	mutex_unlock(&group->mutex);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iommu_replace_group_handle, IOMMUFD_INTERNAL);
+EXPORT_SYMBOL_NS_GPL(iommu_replace_group_handle, "IOMMUFD_INTERNAL");
diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
index 5fd3dd420290..dfd0898fb6c1 100644
--- a/drivers/iommu/iommufd/device.c
+++ b/drivers/iommu/iommufd/device.c
@@ -233,7 +233,7 @@ struct iommufd_device *iommufd_device_bind(struct iommufd_ctx *ictx,
 	iommufd_put_group(igroup);
 	return ERR_PTR(rc);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_bind, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_bind, "IOMMUFD");
 
 /**
  * iommufd_ctx_has_group - True if any device within the group is bound
@@ -264,7 +264,7 @@ bool iommufd_ctx_has_group(struct iommufd_ctx *ictx, struct iommu_group *group)
 	xa_unlock(&ictx->objects);
 	return false;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_ctx_has_group, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_has_group, "IOMMUFD");
 
 /**
  * iommufd_device_unbind - Undo iommufd_device_bind()
@@ -279,19 +279,19 @@ void iommufd_device_unbind(struct iommufd_device *idev)
 {
 	iommufd_object_destroy_user(idev->ictx, &idev->obj);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_unbind, "IOMMUFD");
 
 struct iommufd_ctx *iommufd_device_to_ictx(struct iommufd_device *idev)
 {
 	return idev->ictx;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_ictx, "IOMMUFD");
 
 u32 iommufd_device_to_id(struct iommufd_device *idev)
 {
 	return idev->obj.id;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_to_id, "IOMMUFD");
 
 static int iommufd_group_setup_msi(struct iommufd_group *igroup,
 				   struct iommufd_hwpt_paging *hwpt_paging)
@@ -692,7 +692,7 @@ int iommufd_device_attach(struct iommufd_device *idev, u32 *pt_id)
 	refcount_inc(&idev->obj.users);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_attach, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_attach, "IOMMUFD");
 
 /**
  * iommufd_device_replace - Change the device's iommu_domain
@@ -714,7 +714,7 @@ int iommufd_device_replace(struct iommufd_device *idev, u32 *pt_id)
 	return iommufd_device_change_pt(idev, pt_id,
 					&iommufd_device_do_replace);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_replace, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_replace, "IOMMUFD");
 
 /**
  * iommufd_device_detach - Disconnect a device to an iommu_domain
@@ -731,7 +731,7 @@ void iommufd_device_detach(struct iommufd_device *idev)
 	iommufd_hw_pagetable_put(idev->ictx, hwpt);
 	refcount_dec(&idev->obj.users);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_device_detach, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_device_detach, "IOMMUFD");
 
 /*
  * On success, it will refcount_inc() at a valid new_ioas and refcount_dec() at
@@ -853,7 +853,7 @@ iommufd_access_create(struct iommufd_ctx *ictx,
 	mutex_init(&access->ioas_lock);
 	return access;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_create, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_create, "IOMMUFD");
 
 /**
  * iommufd_access_destroy - Destroy an iommufd_access
@@ -865,7 +865,7 @@ void iommufd_access_destroy(struct iommufd_access *access)
 {
 	iommufd_object_destroy_user(access->ictx, &access->obj);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_destroy, "IOMMUFD");
 
 void iommufd_access_detach(struct iommufd_access *access)
 {
@@ -877,7 +877,7 @@ void iommufd_access_detach(struct iommufd_access *access)
 	WARN_ON(iommufd_access_change_ioas(access, NULL));
 	mutex_unlock(&access->ioas_lock);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_detach, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_detach, "IOMMUFD");
 
 int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
 {
@@ -893,7 +893,7 @@ int iommufd_access_attach(struct iommufd_access *access, u32 ioas_id)
 	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_attach, "IOMMUFD");
 
 int iommufd_access_replace(struct iommufd_access *access, u32 ioas_id)
 {
@@ -908,7 +908,7 @@ int iommufd_access_replace(struct iommufd_access *access, u32 ioas_id)
 	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_replace, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_replace, "IOMMUFD");
 
 /**
  * iommufd_access_notify_unmap - Notify users of an iopt to stop using it
@@ -991,7 +991,7 @@ void iommufd_access_unpin_pages(struct iommufd_access *access,
 	up_read(&iopt->iova_rwsem);
 	mutex_unlock(&access->ioas_lock);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_unpin_pages, "IOMMUFD");
 
 static bool iopt_area_contig_is_aligned(struct iopt_area_contig_iter *iter)
 {
@@ -1106,7 +1106,7 @@ int iommufd_access_pin_pages(struct iommufd_access *access, unsigned long iova,
 	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_pin_pages, "IOMMUFD");
 
 /**
  * iommufd_access_rw - Read or write data under the iova
@@ -1170,7 +1170,7 @@ int iommufd_access_rw(struct iommufd_access *access, unsigned long iova,
 	mutex_unlock(&access->ioas_lock);
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_access_rw, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_access_rw, "IOMMUFD");
 
 int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
 {
diff --git a/drivers/iommu/iommufd/iova_bitmap.c b/drivers/iommu/iommufd/iova_bitmap.c
index d90b9e253412..ab665cf38ef4 100644
--- a/drivers/iommu/iommufd/iova_bitmap.c
+++ b/drivers/iommu/iommufd/iova_bitmap.c
@@ -272,7 +272,7 @@ struct iova_bitmap *iova_bitmap_alloc(unsigned long iova, size_t length,
 	iova_bitmap_free(bitmap);
 	return ERR_PTR(rc);
 }
-EXPORT_SYMBOL_NS_GPL(iova_bitmap_alloc, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iova_bitmap_alloc, "IOMMUFD");
 
 /**
  * iova_bitmap_free() - Frees an IOVA bitmap object
@@ -294,7 +294,7 @@ void iova_bitmap_free(struct iova_bitmap *bitmap)
 
 	kfree(bitmap);
 }
-EXPORT_SYMBOL_NS_GPL(iova_bitmap_free, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iova_bitmap_free, "IOMMUFD");
 
 /*
  * Returns the remaining bitmap indexes from mapped_total_index to process for
@@ -387,7 +387,7 @@ int iova_bitmap_for_each(struct iova_bitmap *bitmap, void *opaque,
 {
 	return fn(bitmap, bitmap->iova, bitmap->length, opaque);
 }
-EXPORT_SYMBOL_NS_GPL(iova_bitmap_for_each, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iova_bitmap_for_each, "IOMMUFD");
 
 /**
  * iova_bitmap_set() - Records an IOVA range in bitmap
@@ -445,4 +445,4 @@ void iova_bitmap_set(struct iova_bitmap *bitmap,
 		cur_bit += nbits;
 	} while (cur_bit <= last_bit);
 }
-EXPORT_SYMBOL_NS_GPL(iova_bitmap_set, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iova_bitmap_set, "IOMMUFD");
diff --git a/drivers/iommu/iommufd/main.c b/drivers/iommu/iommufd/main.c
index b5f5d27ee963..1dc20ef93162 100644
--- a/drivers/iommu/iommufd/main.c
+++ b/drivers/iommu/iommufd/main.c
@@ -442,7 +442,7 @@ void iommufd_ctx_get(struct iommufd_ctx *ictx)
 {
 	get_file(ictx->file);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_ctx_get, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_get, "IOMMUFD");
 
 /**
  * iommufd_ctx_from_file - Acquires a reference to the iommufd context
@@ -462,7 +462,7 @@ struct iommufd_ctx *iommufd_ctx_from_file(struct file *file)
 	iommufd_ctx_get(ictx);
 	return ictx;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_file, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_file, "IOMMUFD");
 
 /**
  * iommufd_ctx_from_fd - Acquires a reference to the iommufd context
@@ -486,7 +486,7 @@ struct iommufd_ctx *iommufd_ctx_from_fd(int fd)
 	/* fget is the same as iommufd_ctx_get() */
 	return file->private_data;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_fd, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_from_fd, "IOMMUFD");
 
 /**
  * iommufd_ctx_put - Put back a reference
@@ -496,7 +496,7 @@ void iommufd_ctx_put(struct iommufd_ctx *ictx)
 {
 	fput(ictx->file);
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_ctx_put, IOMMUFD);
+EXPORT_SYMBOL_NS_GPL(iommufd_ctx_put, "IOMMUFD");
 
 static const struct iommufd_object_ops iommufd_object_ops[] = {
 	[IOMMUFD_OBJ_ACCESS] = {
@@ -584,7 +584,7 @@ module_exit(iommufd_exit);
 MODULE_ALIAS_MISCDEV(VFIO_MINOR);
 MODULE_ALIAS("devname:vfio/vfio");
 #endif
-MODULE_IMPORT_NS(IOMMUFD_INTERNAL);
-MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS("IOMMUFD_INTERNAL");
+MODULE_IMPORT_NS("IOMMUFD");
 MODULE_DESCRIPTION("I/O Address Space Management for passthrough devices");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iommu/iommufd/vfio_compat.c b/drivers/iommu/iommufd/vfio_compat.c
index a3ad5f0b6c59..c7838d6b7f2b 100644
--- a/drivers/iommu/iommufd/vfio_compat.c
+++ b/drivers/iommu/iommufd/vfio_compat.c
@@ -44,7 +44,7 @@ int iommufd_vfio_compat_ioas_get_id(struct iommufd_ctx *ictx, u32 *out_ioas_id)
 	iommufd_put_object(ictx, &ioas->obj);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_get_id, IOMMUFD_VFIO);
+EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_get_id, "IOMMUFD_VFIO");
 
 /**
  * iommufd_vfio_compat_set_no_iommu - Called when a no-iommu device is attached
@@ -66,7 +66,7 @@ int iommufd_vfio_compat_set_no_iommu(struct iommufd_ctx *ictx)
 	xa_unlock(&ictx->objects);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_set_no_iommu, IOMMUFD_VFIO);
+EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_set_no_iommu, "IOMMUFD_VFIO");
 
 /**
  * iommufd_vfio_compat_ioas_create - Ensure the compat IOAS is created
@@ -118,7 +118,7 @@ int iommufd_vfio_compat_ioas_create(struct iommufd_ctx *ictx)
 	iommufd_object_abort(ictx, &ioas->obj);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_create, IOMMUFD_VFIO);
+EXPORT_SYMBOL_NS_GPL(iommufd_vfio_compat_ioas_create, "IOMMUFD_VFIO");
 
 int iommufd_vfio_ioas(struct iommufd_ucmd *ucmd)
 {
diff --git a/drivers/leds/flash/leds-ktd2692.c b/drivers/leds/flash/leds-ktd2692.c
index 16a01a200c0b..14e8d93fcaee 100644
--- a/drivers/leds/flash/leds-ktd2692.c
+++ b/drivers/leds/flash/leds-ktd2692.c
@@ -348,7 +348,7 @@ static struct platform_driver ktd2692_driver = {
 
 module_platform_driver(ktd2692_driver);
 
-MODULE_IMPORT_NS(EXPRESSWIRE);
+MODULE_IMPORT_NS("EXPRESSWIRE");
 MODULE_AUTHOR("Ingi Kim <ingi2.kim@samsung.com>");
 MODULE_DESCRIPTION("Kinetic KTD2692 LED driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/leds/leds-expresswire.c b/drivers/leds/leds-expresswire.c
index e4937a8e0f44..bb69be228a6d 100644
--- a/drivers/leds/leds-expresswire.c
+++ b/drivers/leds/leds-expresswire.c
@@ -18,7 +18,7 @@ void expresswire_power_off(struct expresswire_common_props *props)
 	gpiod_set_value_cansleep(props->ctrl_gpio, 0);
 	usleep_range(props->timing.poweroff_us, props->timing.poweroff_us * 2);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_power_off, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_power_off, "EXPRESSWIRE");
 
 void expresswire_enable(struct expresswire_common_props *props)
 {
@@ -28,14 +28,14 @@ void expresswire_enable(struct expresswire_common_props *props)
 	udelay(props->timing.detect_us);
 	gpiod_set_value(props->ctrl_gpio, 1);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_enable, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_enable, "EXPRESSWIRE");
 
 void expresswire_start(struct expresswire_common_props *props)
 {
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.data_start_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_start, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_start, "EXPRESSWIRE");
 
 void expresswire_end(struct expresswire_common_props *props)
 {
@@ -44,7 +44,7 @@ void expresswire_end(struct expresswire_common_props *props)
 	gpiod_set_value(props->ctrl_gpio, 1);
 	udelay(props->timing.end_of_data_high_us);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_end, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_end, "EXPRESSWIRE");
 
 void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 {
@@ -60,7 +60,7 @@ void expresswire_set_bit(struct expresswire_common_props *props, bool bit)
 		udelay(props->timing.short_bitset_us);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_set_bit, "EXPRESSWIRE");
 
 void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
 {
@@ -69,4 +69,4 @@ void expresswire_write_u8(struct expresswire_common_props *props, u8 val)
 		expresswire_set_bit(props, val & BIT(i));
 	expresswire_end(props);
 }
-EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, EXPRESSWIRE);
+EXPORT_SYMBOL_NS_GPL(expresswire_write_u8, "EXPRESSWIRE");
diff --git a/drivers/mcb/mcb-core.c b/drivers/mcb/mcb-core.c
index 91bbd948ee93..9b8c40a6459a 100644
--- a/drivers/mcb/mcb-core.c
+++ b/drivers/mcb/mcb-core.c
@@ -191,7 +191,7 @@ int __mcb_register_driver(struct mcb_driver *drv, struct module *owner,
 
 	return driver_register(&drv->driver);
 }
-EXPORT_SYMBOL_NS_GPL(__mcb_register_driver, MCB);
+EXPORT_SYMBOL_NS_GPL(__mcb_register_driver, "MCB");
 
 /**
  * mcb_unregister_driver() - Unregister a @mcb_driver from the system
@@ -203,7 +203,7 @@ void mcb_unregister_driver(struct mcb_driver *drv)
 {
 	driver_unregister(&drv->driver);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_unregister_driver, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_unregister_driver, "MCB");
 
 static void mcb_release_dev(struct device *dev)
 {
@@ -250,7 +250,7 @@ int mcb_device_register(struct mcb_bus *bus, struct mcb_device *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(mcb_device_register, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_device_register, "MCB");
 
 static void mcb_free_bus(struct device *dev)
 {
@@ -303,7 +303,7 @@ struct mcb_bus *mcb_alloc_bus(struct device *carrier)
 	put_device(&bus->dev);
 	return ERR_PTR(rc);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_alloc_bus, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_alloc_bus, "MCB");
 
 static int __mcb_devices_unregister(struct device *dev, void *data)
 {
@@ -325,7 +325,7 @@ void mcb_release_bus(struct mcb_bus *bus)
 {
 	mcb_devices_unregister(bus);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_release_bus, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_release_bus, "MCB");
 
 /**
  * mcb_bus_get() - Increment refcnt
@@ -340,7 +340,7 @@ struct mcb_bus *mcb_bus_get(struct mcb_bus *bus)
 
 	return bus;
 }
-EXPORT_SYMBOL_NS_GPL(mcb_bus_get, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_bus_get, "MCB");
 
 /**
  * mcb_bus_put() - Decrement refcnt
@@ -353,7 +353,7 @@ void mcb_bus_put(struct mcb_bus *bus)
 	if (bus)
 		put_device(&bus->dev);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_bus_put, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_bus_put, "MCB");
 
 /**
  * mcb_alloc_dev() - Allocate a device
@@ -373,7 +373,7 @@ struct mcb_device *mcb_alloc_dev(struct mcb_bus *bus)
 
 	return dev;
 }
-EXPORT_SYMBOL_NS_GPL(mcb_alloc_dev, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_alloc_dev, "MCB");
 
 /**
  * mcb_free_dev() - Free @mcb_device
@@ -385,7 +385,7 @@ void mcb_free_dev(struct mcb_device *dev)
 {
 	kfree(dev);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_free_dev, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_free_dev, "MCB");
 
 static int __mcb_bus_add_devices(struct device *dev, void *data)
 {
@@ -410,7 +410,7 @@ void mcb_bus_add_devices(const struct mcb_bus *bus)
 {
 	bus_for_each_dev(bus->dev.bus, NULL, NULL, __mcb_bus_add_devices);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_bus_add_devices, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_bus_add_devices, "MCB");
 
 /**
  * mcb_get_resource() - get a resource for a mcb device
@@ -426,7 +426,7 @@ struct resource *mcb_get_resource(struct mcb_device *dev, unsigned int type)
 	else
 		return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(mcb_get_resource, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_get_resource, "MCB");
 
 /**
  * mcb_request_mem() - Request memory
@@ -452,7 +452,7 @@ struct resource *mcb_request_mem(struct mcb_device *dev, const char *name)
 
 	return mem;
 }
-EXPORT_SYMBOL_NS_GPL(mcb_request_mem, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_request_mem, "MCB");
 
 /**
  * mcb_release_mem() - Release memory requested by device
@@ -467,7 +467,7 @@ void mcb_release_mem(struct resource *mem)
 	size = resource_size(mem);
 	release_mem_region(mem->start, size);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_release_mem, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_release_mem, "MCB");
 
 static int __mcb_get_irq(struct mcb_device *dev)
 {
@@ -493,7 +493,7 @@ int mcb_get_irq(struct mcb_device *dev)
 
 	return __mcb_get_irq(dev);
 }
-EXPORT_SYMBOL_NS_GPL(mcb_get_irq, MCB);
+EXPORT_SYMBOL_NS_GPL(mcb_get_irq, "MCB");
 
 static int mcb_init(void)
 {
diff --git a/drivers/mcb/mcb-lpc.c b/drivers/mcb/mcb-lpc.c
index 2bec2086ee17..c5a1b15dc06e 100644
--- a/drivers/mcb/mcb-lpc.c
+++ b/drivers/mcb/mcb-lpc.c
@@ -184,4 +184,4 @@ module_exit(mcb_lpc_exit);
 MODULE_AUTHOR("Andreas Werner <andreas.werner@men.de>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MCB over LPC support");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/mcb/mcb-parse.c b/drivers/mcb/mcb-parse.c
index a5f8ab9a0910..02a680c73979 100644
--- a/drivers/mcb/mcb-parse.c
+++ b/drivers/mcb/mcb-parse.c
@@ -251,4 +251,4 @@ int chameleon_parse_cells(struct mcb_bus *bus, phys_addr_t mapbase,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(chameleon_parse_cells, MCB);
+EXPORT_SYMBOL_NS_GPL(chameleon_parse_cells, "MCB");
diff --git a/drivers/mcb/mcb-pci.c b/drivers/mcb/mcb-pci.c
index 3b634ea318c7..f1353da6ef4f 100644
--- a/drivers/mcb/mcb-pci.c
+++ b/drivers/mcb/mcb-pci.c
@@ -154,4 +154,4 @@ module_pci_driver(mcb_pci_driver);
 MODULE_AUTHOR("Johannes Thumshirn <johannes.thumshirn@men.de>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("MCB over PCI support");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/media/common/videobuf2/videobuf2-core.c b/drivers/media/common/videobuf2/videobuf2-core.c
index 29a8d876e6c2..94a139d79a0a 100644
--- a/drivers/media/common/videobuf2/videobuf2-core.c
+++ b/drivers/media/common/videobuf2/videobuf2-core.c
@@ -3303,4 +3303,4 @@ EXPORT_SYMBOL_GPL(vb2_thread_stop);
 MODULE_DESCRIPTION("Media buffer core framework");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>, Marek Szyprowski");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index bb0b7fa67b53..a13ec569c82f 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -862,4 +862,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_contig_set_max_seg_size);
 MODULE_DESCRIPTION("DMA-contig memory handling routines for videobuf2");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-sg.c b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
index 6975a71d740f..c6ddf2357c58 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-sg.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-sg.c
@@ -676,4 +676,4 @@ EXPORT_SYMBOL_GPL(vb2_dma_sg_memops);
 MODULE_DESCRIPTION("dma scatter/gather memory handling routines for videobuf2");
 MODULE_AUTHOR("Andrzej Pietrasiewicz");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/common/videobuf2/videobuf2-vmalloc.c b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
index 7d953706f3f8..3f777068cd34 100644
--- a/drivers/media/common/videobuf2/videobuf2-vmalloc.c
+++ b/drivers/media/common/videobuf2/videobuf2-vmalloc.c
@@ -442,4 +442,4 @@ EXPORT_SYMBOL_GPL(vb2_vmalloc_memops);
 MODULE_DESCRIPTION("vmalloc memory handling routines for videobuf2");
 MODULE_AUTHOR("Pawel Osciak <pawel@osciak.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 8eed4a200fd8..79bddfee2e2e 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -904,4 +904,4 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Texas Instruments DS90UB913 FPD-Link III Serializer Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
-MODULE_IMPORT_NS(I2C_ATR);
+MODULE_IMPORT_NS("I2C_ATR");
diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 16f88db14981..bbf5a7e84891 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1428,4 +1428,4 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Texas Instruments FPD-Link III/IV CSI-2 Serializers Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
-MODULE_IMPORT_NS(I2C_ATR);
+MODULE_IMPORT_NS("I2C_ATR");
diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ffe5f25f8647..3c4efd56a86f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -4055,4 +4055,4 @@ MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Texas Instruments FPD-Link III/IV Deserializers Driver");
 MODULE_AUTHOR("Luca Ceresoli <luca@lucaceresoli.net>");
 MODULE_AUTHOR("Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>");
-MODULE_IMPORT_NS(I2C_ATR);
+MODULE_IMPORT_NS("I2C_ATR");
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index a0e9a71580b5..1bf249f446a9 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -323,7 +323,7 @@ int ipu_bridge_parse_ssdb(struct acpi_device *adev, struct ipu_sensor *sensor)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, INTEL_IPU_BRIDGE);
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_parse_ssdb, "INTEL_IPU_BRIDGE");
 
 static void ipu_bridge_create_fwnode_properties(
 	struct ipu_sensor *sensor,
@@ -631,7 +631,7 @@ int ipu_bridge_instantiate_vcm(struct device *sensor)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu_bridge_instantiate_vcm, INTEL_IPU_BRIDGE);
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_instantiate_vcm, "INTEL_IPU_BRIDGE");
 
 static int ipu_bridge_instantiate_ivsc(struct ipu_sensor *sensor)
 {
@@ -882,7 +882,7 @@ int ipu_bridge_init(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ipu_bridge_init, INTEL_IPU_BRIDGE);
+EXPORT_SYMBOL_NS_GPL(ipu_bridge_init, "INTEL_IPU_BRIDGE");
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU Sensors Bridge driver");
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
index 81ec8630453b..f65f91a55a3e 100644
--- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
+++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
@@ -2002,4 +2002,4 @@ MODULE_AUTHOR("Yuning Pu");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("IPU3 CIO2 driver");
-MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-buttress.c b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
index e47f84c30e10..28be0f0cfa58 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-buttress.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-buttress.c
@@ -517,7 +517,7 @@ bool ipu6_buttress_auth_done(struct ipu6_device *isp)
 
 	return val == BUTTRESS_SECURITY_CTL_AUTH_DONE;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_auth_done, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_auth_done, "INTEL_IPU6");
 
 int ipu6_buttress_reset_authentication(struct ipu6_device *isp)
 {
@@ -602,7 +602,7 @@ int ipu6_buttress_map_fw_image(struct ipu6_bus_device *sys,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_map_fw_image, "INTEL_IPU6");
 
 void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
 				  struct sg_table *sgt)
@@ -610,7 +610,7 @@ void ipu6_buttress_unmap_fw_image(struct ipu6_bus_device *sys,
 	dma_unmap_sgtable(&sys->auxdev.dev, sgt, DMA_TO_DEVICE, 0);
 	sg_free_table(sgt);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_unmap_fw_image, "INTEL_IPU6");
 
 int ipu6_buttress_authenticate(struct ipu6_device *isp)
 {
@@ -775,7 +775,7 @@ int ipu6_buttress_start_tsc_sync(struct ipu6_device *isp)
 
 	return -ETIMEDOUT;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_start_tsc_sync, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_start_tsc_sync, "INTEL_IPU6");
 
 void ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
 {
@@ -797,7 +797,7 @@ void ipu6_buttress_tsc_read(struct ipu6_device *isp, u64 *val)
 	}
 	local_irq_restore(flags);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_read, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_read, "INTEL_IPU6");
 
 u64 ipu6_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu6_device *isp)
 {
@@ -812,7 +812,7 @@ u64 ipu6_buttress_tsc_ticks_to_ns(u64 ticks, const struct ipu6_device *isp)
 	 */
 	return div_u64(ns, isp->buttress.ref_clk);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_ticks_to_ns, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_buttress_tsc_ticks_to_ns, "INTEL_IPU6");
 
 void ipu6_buttress_restore(struct ipu6_device *isp)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6-cpd.c b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
index 715b21ab4b8e..1dd47f961ae7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-cpd.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-cpd.c
@@ -216,14 +216,14 @@ int ipu6_cpd_create_pkg_dir(struct ipu6_bus_device *adev, const void *src)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_cpd_create_pkg_dir, "INTEL_IPU6");
 
 void ipu6_cpd_free_pkg_dir(struct ipu6_bus_device *adev)
 {
 	dma_free_attrs(&adev->auxdev.dev, adev->pkg_dir_size, adev->pkg_dir,
 		       adev->pkg_dir_dma_addr, 0);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_cpd_free_pkg_dir, "INTEL_IPU6");
 
 static int ipu6_cpd_validate_cpd(struct ipu6_device *isp, const void *cpd,
 				 unsigned long cpd_size,
diff --git a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
index 0b33fe9e703d..50fa658d6136 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-fw-com.c
@@ -261,7 +261,7 @@ void *ipu6_fw_com_prepare(struct ipu6_fw_com_cfg *cfg,
 
 	return ctx;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_prepare, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_prepare, "INTEL_IPU6");
 
 int ipu6_fw_com_open(struct ipu6_fw_com_context *ctx)
 {
@@ -289,7 +289,7 @@ int ipu6_fw_com_open(struct ipu6_fw_com_context *ctx)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_open, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_open, "INTEL_IPU6");
 
 int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx)
 {
@@ -307,7 +307,7 @@ int ipu6_fw_com_close(struct ipu6_fw_com_context *ctx)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_close, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_close, "INTEL_IPU6");
 
 int ipu6_fw_com_release(struct ipu6_fw_com_context *ctx, unsigned int force)
 {
@@ -320,7 +320,7 @@ int ipu6_fw_com_release(struct ipu6_fw_com_context *ctx, unsigned int force)
 	kfree(ctx);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_release, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_release, "INTEL_IPU6");
 
 bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx)
 {
@@ -332,7 +332,7 @@ bool ipu6_fw_com_ready(struct ipu6_fw_com_context *ctx)
 
 	return state == SYSCOM_STATE_READY;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_ready, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_fw_com_ready, "INTEL_IPU6");
 
 void *ipu6_send_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 {
@@ -360,7 +360,7 @@ void *ipu6_send_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 
 	return (void *)(q->host_address + index * q->token_size);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_send_get_token, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_send_get_token, "INTEL_IPU6");
 
 void ipu6_send_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 {
@@ -373,7 +373,7 @@ void ipu6_send_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 
 	writel(wr, q_dmem + FW_COM_WR_REG);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_send_put_token, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_send_put_token, "INTEL_IPU6");
 
 void *ipu6_recv_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 {
@@ -397,7 +397,7 @@ void *ipu6_recv_get_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 
 	return (void *)(q->host_address + rd * q->token_size);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_recv_get_token, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_recv_get_token, "INTEL_IPU6");
 
 void ipu6_recv_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 {
@@ -410,4 +410,4 @@ void ipu6_recv_put_token(struct ipu6_fw_com_context *ctx, int q_nbr)
 
 	writel(rd, q_dmem + FW_COM_RD_REG);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_recv_put_token, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_recv_put_token, "INTEL_IPU6");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
index c4aff2e2009b..65e5f5ed4e7a 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
@@ -1378,5 +1378,5 @@ MODULE_AUTHOR("Yunliang Ding <yunliang.ding@intel.com>");
 MODULE_AUTHOR("Hongju Wang <hongju.wang@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel IPU6 input system driver");
-MODULE_IMPORT_NS(INTEL_IPU6);
-MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_IMPORT_NS("INTEL_IPU6");
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
diff --git a/drivers/media/pci/intel/ipu6/ipu6-mmu.c b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
index c3a20507d6db..4c6ab9159060 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-mmu.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-mmu.c
@@ -513,7 +513,7 @@ int ipu6_mmu_hw_init(struct ipu6_mmu *mmu)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_init, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_init, "INTEL_IPU6");
 
 static struct ipu6_mmu_info *ipu6_mmu_alloc(struct ipu6_device *isp)
 {
@@ -577,7 +577,7 @@ void ipu6_mmu_hw_cleanup(struct ipu6_mmu *mmu)
 	mmu->ready = false;
 	spin_unlock_irqrestore(&mmu->ready_lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_cleanup, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_mmu_hw_cleanup, "INTEL_IPU6");
 
 static struct ipu6_dma_mapping *alloc_dma_mapping(struct ipu6_device *isp)
 {
diff --git a/drivers/media/pci/intel/ipu6/ipu6.c b/drivers/media/pci/intel/ipu6/ipu6.c
index 7fb707d35309..f4daf60cf677 100644
--- a/drivers/media/pci/intel/ipu6/ipu6.c
+++ b/drivers/media/pci/intel/ipu6/ipu6.c
@@ -280,7 +280,7 @@ void ipu6_configure_spc(struct ipu6_device *isp,
 		ipu6_pkg_dir_configure_spc(isp, hw_variant, pkg_dir_idx, base,
 					   pkg_dir, pkg_dir_dma_addr);
 }
-EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, INTEL_IPU6);
+EXPORT_SYMBOL_NS_GPL(ipu6_configure_spc, "INTEL_IPU6");
 
 #define IPU6_ISYS_CSI2_NPORTS		4
 #define IPU6SE_ISYS_CSI2_NPORTS		4
@@ -836,7 +836,7 @@ static struct pci_driver ipu6_pci_driver = {
 
 module_pci_driver(ipu6_pci_driver);
 
-MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
 MODULE_AUTHOR("Sakari Ailus <sakari.ailus@linux.intel.com>");
 MODULE_AUTHOR("Tianshu Qiu <tian.shu.qiu@intel.com>");
 MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");
diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c b/drivers/media/pci/intel/ivsc/mei_csi.c
index 2a9c12c975ca..6a893c4547b2 100644
--- a/drivers/media/pci/intel/ivsc/mei_csi.c
+++ b/drivers/media/pci/intel/ivsc/mei_csi.c
@@ -808,7 +808,7 @@ static struct mei_cl_driver mei_csi_driver = {
 
 module_mei_cl_driver(mei_csi_driver);
 
-MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
 MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Device driver for IVSC CSI");
diff --git a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
index 1c5b94989aec..b34244ea14dd 100644
--- a/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
+++ b/drivers/media/platform/nvidia/tegra-vde/dmabuf-cache.c
@@ -16,7 +16,7 @@
 
 #include "vde.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 struct tegra_vde_cache_entry {
 	enum dma_data_direction dma_dir;
diff --git a/drivers/mfd/cs40l50-core.c b/drivers/mfd/cs40l50-core.c
index 26e7a769eb14..4859a33777a0 100644
--- a/drivers/mfd/cs40l50-core.c
+++ b/drivers/mfd/cs40l50-core.c
@@ -567,4 +567,4 @@ EXPORT_GPL_DEV_PM_OPS(cs40l50_pm_ops) = {
 MODULE_DESCRIPTION("CS40L50 Advanced Haptic Driver");
 MODULE_AUTHOR("James Ogletree, Cirrus Logic Inc. <james.ogletree@cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(FW_CS_DSP);
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index c9e4ea76149a..f0ad4002652d 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -92,7 +92,7 @@ static struct i2c_driver cs42l43_i2c_driver = {
 };
 module_i2c_driver(cs42l43_i2c_driver);
 
-MODULE_IMPORT_NS(MFD_CS42L43);
+MODULE_IMPORT_NS("MFD_CS42L43");
 
 MODULE_DESCRIPTION("CS42L43 I2C Driver");
 MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 65f7b1d78248..3938d48039c4 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -215,7 +215,7 @@ static struct sdw_driver cs42l43_sdw_driver = {
 };
 module_sdw_driver(cs42l43_sdw_driver);
 
-MODULE_IMPORT_NS(MFD_CS42L43);
+MODULE_IMPORT_NS("MFD_CS42L43");
 
 MODULE_DESCRIPTION("CS42L43 SoundWire Driver");
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index ae8fd37afb75..2ab3ff9e9021 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -264,7 +264,7 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
 	{ CS42L43_ASRC_MASK,				0x0000000F },
 	{ CS42L43_HPOUT_MASK,				0x00000003 },
 };
-EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");
 
 bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 {
@@ -392,7 +392,7 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_readable_register, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_readable_register, "MFD_CS42L43");
 
 bool cs42l43_precious_register(struct device *dev, unsigned int reg)
 {
@@ -407,7 +407,7 @@ bool cs42l43_precious_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_precious_register, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_precious_register, "MFD_CS42L43");
 
 bool cs42l43_volatile_register(struct device *dev, unsigned int reg)
 {
@@ -435,7 +435,7 @@ bool cs42l43_volatile_register(struct device *dev, unsigned int reg)
 		return cs42l43_precious_register(dev, reg);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_volatile_register, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_volatile_register, "MFD_CS42L43");
 
 #define CS42L43_IRQ_OFFSET(reg) ((CS42L43_##reg##_INT) - CS42L43_DECIM_INT)
 
@@ -1097,13 +1097,13 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_dev_probe, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_dev_probe, "MFD_CS42L43");
 
 void cs42l43_dev_remove(struct cs42l43 *cs42l43)
 {
 	cs42l43_power_down(cs42l43);
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, MFD_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, "MFD_CS42L43");
 
 static int cs42l43_suspend(struct device *dev)
 {
diff --git a/drivers/mfd/intel-lpss-acpi.c b/drivers/mfd/intel-lpss-acpi.c
index 2a83f8678f1d..93c098870d92 100644
--- a/drivers/mfd/intel-lpss-acpi.c
+++ b/drivers/mfd/intel-lpss-acpi.c
@@ -222,4 +222,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel LPSS ACPI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(INTEL_LPSS);
+MODULE_IMPORT_NS("INTEL_LPSS");
diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index 1d8cdc4d5819..1a5b8b13f8d0 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -653,4 +653,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel LPSS PCI driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(INTEL_LPSS);
+MODULE_IMPORT_NS("INTEL_LPSS");
diff --git a/drivers/mfd/intel-lpss.c b/drivers/mfd/intel-lpss.c
index 2a9018112dfc..3ba05ebb9035 100644
--- a/drivers/mfd/intel-lpss.c
+++ b/drivers/mfd/intel-lpss.c
@@ -464,7 +464,7 @@ int intel_lpss_probe(struct device *dev,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(intel_lpss_probe, INTEL_LPSS);
+EXPORT_SYMBOL_NS_GPL(intel_lpss_probe, "INTEL_LPSS");
 
 void intel_lpss_remove(struct device *dev)
 {
@@ -476,7 +476,7 @@ void intel_lpss_remove(struct device *dev)
 	intel_lpss_unregister_clock(lpss);
 	ida_free(&intel_lpss_devid_ida, lpss->devid);
 }
-EXPORT_SYMBOL_NS_GPL(intel_lpss_remove, INTEL_LPSS);
+EXPORT_SYMBOL_NS_GPL(intel_lpss_remove, "INTEL_LPSS");
 
 static int resume_lpss_device(struct device *dev, void *data)
 {
diff --git a/drivers/mfd/intel-m10-bmc-core.c b/drivers/mfd/intel-m10-bmc-core.c
index 8ad5b3821584..e930161bf65e 100644
--- a/drivers/mfd/intel-m10-bmc-core.c
+++ b/drivers/mfd/intel-m10-bmc-core.c
@@ -22,7 +22,7 @@ void m10bmc_fw_state_set(struct intel_m10bmc *m10bmc, enum m10bmc_fw_state new_s
 	m10bmc->bmcfw_state = new_state;
 	up_write(&m10bmc->bmcfw_lock);
 }
-EXPORT_SYMBOL_NS_GPL(m10bmc_fw_state_set, INTEL_M10_BMC_CORE);
+EXPORT_SYMBOL_NS_GPL(m10bmc_fw_state_set, "INTEL_M10_BMC_CORE");
 
 /*
  * For some Intel FPGA devices, the BMC firmware is not available to service
@@ -75,7 +75,7 @@ int m10bmc_sys_read(struct intel_m10bmc *m10bmc, unsigned int offset, unsigned i
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(m10bmc_sys_read, INTEL_M10_BMC_CORE);
+EXPORT_SYMBOL_NS_GPL(m10bmc_sys_read, "INTEL_M10_BMC_CORE");
 
 int m10bmc_sys_update_bits(struct intel_m10bmc *m10bmc, unsigned int offset,
 			   unsigned int msk, unsigned int val)
@@ -95,7 +95,7 @@ int m10bmc_sys_update_bits(struct intel_m10bmc *m10bmc, unsigned int offset,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(m10bmc_sys_update_bits, INTEL_M10_BMC_CORE);
+EXPORT_SYMBOL_NS_GPL(m10bmc_sys_update_bits, "INTEL_M10_BMC_CORE");
 
 static ssize_t bmc_version_show(struct device *dev,
 				struct device_attribute *attr, char *buf)
@@ -183,7 +183,7 @@ const struct attribute_group *m10bmc_dev_groups[] = {
 	&m10bmc_group,
 	NULL,
 };
-EXPORT_SYMBOL_NS_GPL(m10bmc_dev_groups, INTEL_M10_BMC_CORE);
+EXPORT_SYMBOL_NS_GPL(m10bmc_dev_groups, "INTEL_M10_BMC_CORE");
 
 int m10bmc_dev_init(struct intel_m10bmc *m10bmc, const struct intel_m10bmc_platform_info *info)
 {
@@ -201,7 +201,7 @@ int m10bmc_dev_init(struct intel_m10bmc *m10bmc, const struct intel_m10bmc_platf
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(m10bmc_dev_init, INTEL_M10_BMC_CORE);
+EXPORT_SYMBOL_NS_GPL(m10bmc_dev_init, "INTEL_M10_BMC_CORE");
 
 MODULE_DESCRIPTION("Intel MAX 10 BMC core driver");
 MODULE_AUTHOR("Intel Corporation");
diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index 4fa9d380c62b..d213c6ec04ba 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -454,4 +454,4 @@ module_dfl_driver(m10bmc_pmci_driver);
 MODULE_DESCRIPTION("MAX10 BMC PMCI-based interface");
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(INTEL_M10_BMC_CORE);
+MODULE_IMPORT_NS("INTEL_M10_BMC_CORE");
diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
index 36f631ef7a67..cfa620f0c70e 100644
--- a/drivers/mfd/intel-m10-bmc-spi.c
+++ b/drivers/mfd/intel-m10-bmc-spi.c
@@ -181,4 +181,4 @@ MODULE_DESCRIPTION("Intel MAX 10 BMC SPI bus interface");
 MODULE_AUTHOR("Intel Corporation");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("spi:intel-m10-bmc");
-MODULE_IMPORT_NS(INTEL_M10_BMC_CORE);
+MODULE_IMPORT_NS("INTEL_M10_BMC_CORE");
diff --git a/drivers/mfd/ocelot-core.c b/drivers/mfd/ocelot-core.c
index 9cccf54fc9c8..41aff2708854 100644
--- a/drivers/mfd/ocelot-core.c
+++ b/drivers/mfd/ocelot-core.c
@@ -113,7 +113,7 @@ int ocelot_chip_reset(struct device *dev)
 	return readx_poll_timeout(ocelot_gcb_chip_rst_status, ddata, val, !val,
 				  VSC7512_GCB_RST_SLEEP_US, VSC7512_GCB_RST_TIMEOUT_US);
 }
-EXPORT_SYMBOL_NS(ocelot_chip_reset, MFD_OCELOT);
+EXPORT_SYMBOL_NS(ocelot_chip_reset, "MFD_OCELOT");
 
 static const struct resource vsc7512_miim0_resources[] = {
 	DEFINE_RES_REG_NAMED(VSC7512_MIIM0_RES_START, VSC7512_MIIM_RES_SIZE, "gcb_miim0"),
@@ -226,9 +226,9 @@ int ocelot_core_init(struct device *dev)
 
 	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, vsc7512_devs, ndevs, NULL, 0, NULL);
 }
-EXPORT_SYMBOL_NS(ocelot_core_init, MFD_OCELOT);
+EXPORT_SYMBOL_NS(ocelot_core_init, "MFD_OCELOT");
 
 MODULE_DESCRIPTION("Externally Controlled Ocelot Chip Driver");
 MODULE_AUTHOR("Colin Foster <colin.foster@in-advantage.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(MFD_OCELOT_SPI);
+MODULE_IMPORT_NS("MFD_OCELOT_SPI");
diff --git a/drivers/mfd/ocelot-spi.c b/drivers/mfd/ocelot-spi.c
index b015c8683f1b..1fed9878c323 100644
--- a/drivers/mfd/ocelot-spi.c
+++ b/drivers/mfd/ocelot-spi.c
@@ -193,7 +193,7 @@ struct regmap *ocelot_spi_init_regmap(struct device *dev, const struct resource
 
 	return devm_regmap_init(dev, &ocelot_spi_regmap_bus, dev, &regmap_config);
 }
-EXPORT_SYMBOL_NS(ocelot_spi_init_regmap, MFD_OCELOT_SPI);
+EXPORT_SYMBOL_NS(ocelot_spi_init_regmap, "MFD_OCELOT_SPI");
 
 static int ocelot_spi_probe(struct spi_device *spi)
 {
@@ -295,4 +295,4 @@ module_spi_driver(ocelot_spi_driver);
 MODULE_DESCRIPTION("SPI Controlled Ocelot Chip Driver");
 MODULE_AUTHOR("Colin Foster <colin.foster@in-advantage.com>");
 MODULE_LICENSE("Dual MIT/GPL");
-MODULE_IMPORT_NS(MFD_OCELOT);
+MODULE_IMPORT_NS("MFD_OCELOT");
diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 74181b8c386b..b9dc10c71104 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2505,4 +2505,4 @@ module_exit(fastrpc_exit);
 
 MODULE_DESCRIPTION("Qualcomm FastRPC");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/misc/mei/platform-vsc.c b/drivers/misc/mei/platform-vsc.c
index 20a11b299bcd..ac878761b856 100644
--- a/drivers/misc/mei/platform-vsc.c
+++ b/drivers/misc/mei/platform-vsc.c
@@ -451,4 +451,4 @@ MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
 MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_DESCRIPTION("Intel Visual Sensing Controller Interface");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(VSC_TP);
+MODULE_IMPORT_NS("VSC_TP");
diff --git a/drivers/misc/mei/vsc-fw-loader.c b/drivers/misc/mei/vsc-fw-loader.c
index 9f129bc641f6..a02cdba11d2c 100644
--- a/drivers/misc/mei/vsc-fw-loader.c
+++ b/drivers/misc/mei/vsc-fw-loader.c
@@ -767,4 +767,4 @@ int vsc_tp_init(struct vsc_tp *tp, struct device *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_init, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_init, "VSC_TP");
diff --git a/drivers/misc/mei/vsc-tp.c b/drivers/misc/mei/vsc-tp.c
index 1618cca9a731..1de9a6082c35 100644
--- a/drivers/misc/mei/vsc-tp.c
+++ b/drivers/misc/mei/vsc-tp.c
@@ -299,7 +299,7 @@ int vsc_tp_xfer(struct vsc_tp *tp, u8 cmd, const void *obuf, size_t olen,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_xfer, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_xfer, "VSC_TP");
 
 /**
  * vsc_tp_rom_xfer - transfer data to rom code
@@ -367,7 +367,7 @@ void vsc_tp_reset(struct vsc_tp *tp)
 
 	enable_irq(tp->spi->irq);
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_reset, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_reset, "VSC_TP");
 
 /**
  * vsc_tp_need_read - check if device has data to sent
@@ -385,7 +385,7 @@ bool vsc_tp_need_read(struct vsc_tp *tp)
 
 	return true;
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_need_read, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_need_read, "VSC_TP");
 
 /**
  * vsc_tp_register_event_cb - register a callback function to receive event
@@ -402,7 +402,7 @@ int vsc_tp_register_event_cb(struct vsc_tp *tp, vsc_tp_event_cb_t event_cb,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_register_event_cb, "VSC_TP");
 
 /**
  * vsc_tp_request_irq - request irq for vsc_tp device
@@ -423,7 +423,7 @@ int vsc_tp_request_irq(struct vsc_tp *tp)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_request_irq, "VSC_TP");
 
 /**
  * vsc_tp_free_irq - free irq for vsc_tp device
@@ -433,7 +433,7 @@ void vsc_tp_free_irq(struct vsc_tp *tp)
 {
 	free_irq(tp->spi->irq, tp);
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_free_irq, "VSC_TP");
 
 /**
  * vsc_tp_intr_synchronize - synchronize vsc_tp interrupt
@@ -443,7 +443,7 @@ void vsc_tp_intr_synchronize(struct vsc_tp *tp)
 {
 	synchronize_irq(tp->spi->irq);
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_synchronize, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_synchronize, "VSC_TP");
 
 /**
  * vsc_tp_intr_enable - enable vsc_tp interrupt
@@ -453,7 +453,7 @@ void vsc_tp_intr_enable(struct vsc_tp *tp)
 {
 	enable_irq(tp->spi->irq);
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_enable, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_enable, "VSC_TP");
 
 /**
  * vsc_tp_intr_disable - disable vsc_tp interrupt
@@ -463,7 +463,7 @@ void vsc_tp_intr_disable(struct vsc_tp *tp)
 {
 	disable_irq(tp->spi->irq);
 }
-EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_disable, VSC_TP);
+EXPORT_SYMBOL_NS_GPL(vsc_tp_intr_disable, "VSC_TP");
 
 static int vsc_tp_match_any(struct acpi_device *adev, void *data)
 {
diff --git a/drivers/net/dsa/ocelot/ocelot_ext.c b/drivers/net/dsa/ocelot/ocelot_ext.c
index 5632a7248cd4..c3535787f0ec 100644
--- a/drivers/net/dsa/ocelot/ocelot_ext.c
+++ b/drivers/net/dsa/ocelot/ocelot_ext.c
@@ -109,4 +109,4 @@ module_platform_driver(ocelot_ext_switch_driver);
 
 MODULE_DESCRIPTION("External Ocelot Switch driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(MFD_OCELOT);
+MODULE_IMPORT_NS("MFD_OCELOT");
diff --git a/drivers/net/dsa/realtek/realtek-mdio.c b/drivers/net/dsa/realtek/realtek-mdio.c
index 04b758e5a680..e6fed3ca64e8 100644
--- a/drivers/net/dsa/realtek/realtek-mdio.c
+++ b/drivers/net/dsa/realtek/realtek-mdio.c
@@ -140,7 +140,7 @@ int realtek_mdio_probe(struct mdio_device *mdiodev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(realtek_mdio_probe, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_mdio_probe, "REALTEK_DSA");
 
 /**
  * realtek_mdio_remove() - Remove the driver of an MDIO-connected switch
@@ -163,7 +163,7 @@ void realtek_mdio_remove(struct mdio_device *mdiodev)
 
 	rtl83xx_remove(priv);
 }
-EXPORT_SYMBOL_NS_GPL(realtek_mdio_remove, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_mdio_remove, "REALTEK_DSA");
 
 /**
  * realtek_mdio_shutdown() - Shutdown the driver of a MDIO-connected switch
@@ -184,4 +184,4 @@ void realtek_mdio_shutdown(struct mdio_device *mdiodev)
 
 	rtl83xx_shutdown(priv);
 }
-EXPORT_SYMBOL_NS_GPL(realtek_mdio_shutdown, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_mdio_shutdown, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/realtek-smi.c b/drivers/net/dsa/realtek/realtek-smi.c
index 88590ae95a75..66531a4174f9 100644
--- a/drivers/net/dsa/realtek/realtek-smi.c
+++ b/drivers/net/dsa/realtek/realtek-smi.c
@@ -361,7 +361,7 @@ int realtek_smi_probe(struct platform_device *pdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(realtek_smi_probe, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_smi_probe, "REALTEK_DSA");
 
 /**
  * realtek_smi_remove() - Remove the driver of a SMI-connected switch
@@ -384,7 +384,7 @@ void realtek_smi_remove(struct platform_device *pdev)
 
 	rtl83xx_remove(priv);
 }
-EXPORT_SYMBOL_NS_GPL(realtek_smi_remove, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_smi_remove, "REALTEK_DSA");
 
 /**
  * realtek_smi_shutdown() - Shutdown the driver of a SMI-connected switch
@@ -405,4 +405,4 @@ void realtek_smi_shutdown(struct platform_device *pdev)
 
 	rtl83xx_shutdown(priv);
 }
-EXPORT_SYMBOL_NS_GPL(realtek_smi_shutdown, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(realtek_smi_shutdown, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl8365mb.c b/drivers/net/dsa/realtek/rtl8365mb.c
index ad7044b295ec..4ddbffad1df6 100644
--- a/drivers/net/dsa/realtek/rtl8365mb.c
+++ b/drivers/net/dsa/realtek/rtl8365mb.c
@@ -2206,4 +2206,4 @@ module_exit(rtl8365mb_exit);
 MODULE_AUTHOR("Alvin Šipraga <alsi@bang-olufsen.dk>");
 MODULE_DESCRIPTION("Driver for RTL8365MB-VC ethernet switch");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(REALTEK_DSA);
+MODULE_IMPORT_NS("REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl8366-core.c b/drivers/net/dsa/realtek/rtl8366-core.c
index 7c6520ba3a26..047feeed96a2 100644
--- a/drivers/net/dsa/realtek/rtl8366-core.c
+++ b/drivers/net/dsa/realtek/rtl8366-core.c
@@ -34,7 +34,7 @@ int rtl8366_mc_is_used(struct realtek_priv *priv, int mc_index, int *used)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_mc_is_used, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_mc_is_used, "REALTEK_DSA");
 
 /**
  * rtl8366_obtain_mc() - retrieve or allocate a VLAN member configuration
@@ -187,7 +187,7 @@ int rtl8366_set_vlan(struct realtek_priv *priv, int vid, u32 member,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_set_vlan, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_set_vlan, "REALTEK_DSA");
 
 int rtl8366_set_pvid(struct realtek_priv *priv, unsigned int port,
 		     unsigned int vid)
@@ -217,7 +217,7 @@ int rtl8366_set_pvid(struct realtek_priv *priv, unsigned int port,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_set_pvid, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_set_pvid, "REALTEK_DSA");
 
 int rtl8366_enable_vlan4k(struct realtek_priv *priv, bool enable)
 {
@@ -243,7 +243,7 @@ int rtl8366_enable_vlan4k(struct realtek_priv *priv, bool enable)
 	priv->vlan4k_enabled = enable;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_enable_vlan4k, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_enable_vlan4k, "REALTEK_DSA");
 
 int rtl8366_enable_vlan(struct realtek_priv *priv, bool enable)
 {
@@ -265,7 +265,7 @@ int rtl8366_enable_vlan(struct realtek_priv *priv, bool enable)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_enable_vlan, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_enable_vlan, "REALTEK_DSA");
 
 int rtl8366_reset_vlan(struct realtek_priv *priv)
 {
@@ -290,7 +290,7 @@ int rtl8366_reset_vlan(struct realtek_priv *priv)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_reset_vlan, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_reset_vlan, "REALTEK_DSA");
 
 int rtl8366_vlan_add(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan,
@@ -345,7 +345,7 @@ int rtl8366_vlan_add(struct dsa_switch *ds, int port,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_vlan_add, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_vlan_add, "REALTEK_DSA");
 
 int rtl8366_vlan_del(struct dsa_switch *ds, int port,
 		     const struct switchdev_obj_port_vlan *vlan)
@@ -389,7 +389,7 @@ int rtl8366_vlan_del(struct dsa_switch *ds, int port,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_vlan_del, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_vlan_del, "REALTEK_DSA");
 
 void rtl8366_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 			 uint8_t *data)
@@ -403,7 +403,7 @@ void rtl8366_get_strings(struct dsa_switch *ds, int port, u32 stringset,
 	for (i = 0; i < priv->num_mib_counters; i++)
 		ethtool_puts(&data, priv->mib_counters[i].name);
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_get_strings, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_get_strings, "REALTEK_DSA");
 
 int rtl8366_get_sset_count(struct dsa_switch *ds, int port, int sset)
 {
@@ -417,7 +417,7 @@ int rtl8366_get_sset_count(struct dsa_switch *ds, int port, int sset)
 
 	return priv->num_mib_counters;
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_get_sset_count, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_get_sset_count, "REALTEK_DSA");
 
 void rtl8366_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
 {
@@ -441,4 +441,4 @@ void rtl8366_get_ethtool_stats(struct dsa_switch *ds, int port, uint64_t *data)
 		data[i] = mibvalue;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(rtl8366_get_ethtool_stats, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl8366_get_ethtool_stats, "REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl8366rb.c b/drivers/net/dsa/realtek/rtl8366rb.c
index c7a8cd060587..ea8e4a0bccf5 100644
--- a/drivers/net/dsa/realtek/rtl8366rb.c
+++ b/drivers/net/dsa/realtek/rtl8366rb.c
@@ -2144,4 +2144,4 @@ module_exit(rtl8366rb_exit);
 MODULE_AUTHOR("Linus Walleij <linus.walleij@linaro.org>");
 MODULE_DESCRIPTION("Driver for RTL8366RB ethernet switch");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(REALTEK_DSA);
+MODULE_IMPORT_NS("REALTEK_DSA");
diff --git a/drivers/net/dsa/realtek/rtl83xx.c b/drivers/net/dsa/realtek/rtl83xx.c
index 3c5018d5e1f9..2b9bd4462714 100644
--- a/drivers/net/dsa/realtek/rtl83xx.c
+++ b/drivers/net/dsa/realtek/rtl83xx.c
@@ -25,7 +25,7 @@ void rtl83xx_lock(void *ctx)
 
 	mutex_lock(&priv->map_lock);
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_lock, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_lock, "REALTEK_DSA");
 
 /**
  * rtl83xx_unlock() - Unlocks the mutex used by regmaps
@@ -42,7 +42,7 @@ void rtl83xx_unlock(void *ctx)
 
 	mutex_unlock(&priv->map_lock);
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_unlock, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_unlock, "REALTEK_DSA");
 
 static int rtl83xx_user_mdio_read(struct mii_bus *bus, int addr, int regnum)
 {
@@ -109,7 +109,7 @@ int rtl83xx_setup_user_mdio(struct dsa_switch *ds)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_setup_user_mdio, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_setup_user_mdio, "REALTEK_DSA");
 
 /**
  * rtl83xx_probe() - probe a Realtek switch
@@ -208,7 +208,7 @@ rtl83xx_probe(struct device *dev,
 
 	return priv;
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_probe, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_probe, "REALTEK_DSA");
 
 /**
  * rtl83xx_register_switch() - detects and register a switch
@@ -245,7 +245,7 @@ int rtl83xx_register_switch(struct realtek_priv *priv)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_register_switch, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_register_switch, "REALTEK_DSA");
 
 /**
  * rtl83xx_unregister_switch() - unregister a switch
@@ -262,7 +262,7 @@ void rtl83xx_unregister_switch(struct realtek_priv *priv)
 
 	dsa_unregister_switch(ds);
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_unregister_switch, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_unregister_switch, "REALTEK_DSA");
 
 /**
  * rtl83xx_shutdown() - shutdown a switch
@@ -283,7 +283,7 @@ void rtl83xx_shutdown(struct realtek_priv *priv)
 
 	dev_set_drvdata(priv->dev, NULL);
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_shutdown, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_shutdown, "REALTEK_DSA");
 
 /**
  * rtl83xx_remove() - Cleanup a realtek switch driver
@@ -297,7 +297,7 @@ EXPORT_SYMBOL_NS_GPL(rtl83xx_shutdown, REALTEK_DSA);
 void rtl83xx_remove(struct realtek_priv *priv)
 {
 }
-EXPORT_SYMBOL_NS_GPL(rtl83xx_remove, REALTEK_DSA);
+EXPORT_SYMBOL_NS_GPL(rtl83xx_remove, "REALTEK_DSA");
 
 void rtl83xx_reset_assert(struct realtek_priv *priv)
 {
diff --git a/drivers/net/ethernet/intel/i40e/i40e_main.c b/drivers/net/ethernet/intel/i40e/i40e_main.c
index 25295ae370b2..dfa6682f44b6 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_main.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_main.c
@@ -99,7 +99,7 @@ module_param(debug, uint, 0);
 MODULE_PARM_DESC(debug, "Debug level (0=none,...,16=all), Debug mask (0x8XXXXXXX)");
 
 MODULE_DESCRIPTION("Intel(R) Ethernet Connection XL710 Network Driver");
-MODULE_IMPORT_NS(LIBIE);
+MODULE_IMPORT_NS("LIBIE");
 MODULE_LICENSE("GPL v2");
 
 static struct workqueue_struct *i40e_wq;
diff --git a/drivers/net/ethernet/intel/iavf/iavf_main.c b/drivers/net/ethernet/intel/iavf/iavf_main.c
index f782402cd789..847ed073eca9 100644
--- a/drivers/net/ethernet/intel/iavf/iavf_main.c
+++ b/drivers/net/ethernet/intel/iavf/iavf_main.c
@@ -46,8 +46,8 @@ MODULE_DEVICE_TABLE(pci, iavf_pci_tbl);
 
 MODULE_ALIAS("i40evf");
 MODULE_DESCRIPTION("Intel(R) Ethernet Adaptive Virtual Function Network Driver");
-MODULE_IMPORT_NS(LIBETH);
-MODULE_IMPORT_NS(LIBIE);
+MODULE_IMPORT_NS("LIBETH");
+MODULE_IMPORT_NS("LIBIE");
 MODULE_LICENSE("GPL v2");
 
 static const struct net_device_ops iavf_netdev_ops;
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index b1e7727b8677..e9f8948f05d3 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -37,7 +37,7 @@ static const char ice_copyright[] = "Copyright (c) 2018, Intel Corporation.";
 #define ICE_DDP_PKG_FILE	ICE_DDP_PKG_PATH "ice.pkg"
 
 MODULE_DESCRIPTION(DRV_SUMMARY);
-MODULE_IMPORT_NS(LIBIE);
+MODULE_IMPORT_NS("LIBIE");
 MODULE_LICENSE("GPL v2");
 MODULE_FIRMWARE(ICE_DDP_PKG_FILE);
 
diff --git a/drivers/net/ethernet/intel/idpf/idpf_main.c b/drivers/net/ethernet/intel/idpf/idpf_main.c
index db476b3314c8..f71d3182580b 100644
--- a/drivers/net/ethernet/intel/idpf/idpf_main.c
+++ b/drivers/net/ethernet/intel/idpf/idpf_main.c
@@ -8,7 +8,7 @@
 #define DRV_SUMMARY	"Intel(R) Infrastructure Data Path Function Linux Driver"
 
 MODULE_DESCRIPTION(DRV_SUMMARY);
-MODULE_IMPORT_NS(LIBETH);
+MODULE_IMPORT_NS("LIBETH");
 MODULE_LICENSE("GPL");
 
 /**
diff --git a/drivers/net/ethernet/intel/libeth/rx.c b/drivers/net/ethernet/intel/libeth/rx.c
index f20926669318..66d1d23b8ad2 100644
--- a/drivers/net/ethernet/intel/libeth/rx.c
+++ b/drivers/net/ethernet/intel/libeth/rx.c
@@ -186,7 +186,7 @@ int libeth_rx_fq_create(struct libeth_fq *fq, struct napi_struct *napi)
 
 	return -ENOMEM;
 }
-EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_create, LIBETH);
+EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_create, "LIBETH");
 
 /**
  * libeth_rx_fq_destroy - destroy a &page_pool created by libeth
@@ -197,7 +197,7 @@ void libeth_rx_fq_destroy(struct libeth_fq *fq)
 	kvfree(fq->fqes);
 	page_pool_destroy(fq->pp);
 }
-EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_destroy, LIBETH);
+EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_destroy, "LIBETH");
 
 /**
  * libeth_rx_recycle_slow - recycle a libeth page from the NAPI context
@@ -209,7 +209,7 @@ void libeth_rx_recycle_slow(struct page *page)
 {
 	page_pool_recycle_direct(page->pp, page);
 }
-EXPORT_SYMBOL_NS_GPL(libeth_rx_recycle_slow, LIBETH);
+EXPORT_SYMBOL_NS_GPL(libeth_rx_recycle_slow, "LIBETH");
 
 /* Converting abstract packet type numbers into a software structure with
  * the packet parameters to do O(1) lookup on Rx.
@@ -251,7 +251,7 @@ void libeth_rx_pt_gen_hash_type(struct libeth_rx_pt *pt)
 	pt->hash_type |= libeth_rx_pt_xdp_iprot[pt->inner_prot];
 	pt->hash_type |= libeth_rx_pt_xdp_pl[pt->payload_layer];
 }
-EXPORT_SYMBOL_NS_GPL(libeth_rx_pt_gen_hash_type, LIBETH);
+EXPORT_SYMBOL_NS_GPL(libeth_rx_pt_gen_hash_type, "LIBETH");
 
 /* Module */
 
diff --git a/drivers/net/ethernet/intel/libie/rx.c b/drivers/net/ethernet/intel/libie/rx.c
index aceb8d8813c4..66a9825fe11f 100644
--- a/drivers/net/ethernet/intel/libie/rx.c
+++ b/drivers/net/ethernet/intel/libie/rx.c
@@ -116,8 +116,8 @@ const struct libeth_rx_pt libie_rx_pt_lut[LIBIE_RX_PT_NUM] = {
 	LIBIE_RX_PT_IP(4),
 	LIBIE_RX_PT_IP(6),
 };
-EXPORT_SYMBOL_NS_GPL(libie_rx_pt_lut, LIBIE);
+EXPORT_SYMBOL_NS_GPL(libie_rx_pt_lut, "LIBIE");
 
 MODULE_DESCRIPTION("Intel(R) Ethernet common library");
-MODULE_IMPORT_NS(LIBETH);
+MODULE_IMPORT_NS("LIBETH");
 MODULE_LICENSE("GPL");
diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
index ca4ed58f1206..e6a2afd5cf79 100644
--- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
+++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
@@ -174,7 +174,7 @@ int mana_gd_send_request(struct gdma_context *gc, u32 req_len, const void *req,
 
 	return mana_hwc_send_request(hwc, req_len, req, resp_len, resp);
 }
-EXPORT_SYMBOL_NS(mana_gd_send_request, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_send_request, "NET_MANA");
 
 int mana_gd_alloc_memory(struct gdma_context *gc, unsigned int length,
 			 struct gdma_mem_info *gmi)
@@ -713,7 +713,7 @@ int mana_gd_destroy_dma_region(struct gdma_context *gc, u64 dma_region_handle)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mana_gd_destroy_dma_region, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_destroy_dma_region, "NET_MANA");
 
 static int mana_gd_create_dma_region(struct gdma_dev *gd,
 				     struct gdma_mem_info *gmi)
@@ -817,7 +817,7 @@ int mana_gd_create_mana_eq(struct gdma_dev *gd,
 	kfree(queue);
 	return err;
 }
-EXPORT_SYMBOL_NS(mana_gd_create_mana_eq, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_create_mana_eq, "NET_MANA");
 
 int mana_gd_create_mana_wq_cq(struct gdma_dev *gd,
 			      const struct gdma_queue_spec *spec,
@@ -894,7 +894,7 @@ void mana_gd_destroy_queue(struct gdma_context *gc, struct gdma_queue *queue)
 	mana_gd_free_memory(gmi);
 	kfree(queue);
 }
-EXPORT_SYMBOL_NS(mana_gd_destroy_queue, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_destroy_queue, "NET_MANA");
 
 int mana_gd_verify_vf_version(struct pci_dev *pdev)
 {
@@ -971,7 +971,7 @@ int mana_gd_register_device(struct gdma_dev *gd)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mana_gd_register_device, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_register_device, "NET_MANA");
 
 int mana_gd_deregister_device(struct gdma_dev *gd)
 {
@@ -1002,7 +1002,7 @@ int mana_gd_deregister_device(struct gdma_dev *gd)
 
 	return err;
 }
-EXPORT_SYMBOL_NS(mana_gd_deregister_device, NET_MANA);
+EXPORT_SYMBOL_NS(mana_gd_deregister_device, "NET_MANA");
 
 u32 mana_gd_wq_avail_space(struct gdma_queue *wq)
 {
diff --git a/drivers/net/ethernet/microsoft/mana/mana_en.c b/drivers/net/ethernet/microsoft/mana/mana_en.c
index c47266d1c7c2..7f8b77f5813e 100644
--- a/drivers/net/ethernet/microsoft/mana/mana_en.c
+++ b/drivers/net/ethernet/microsoft/mana/mana_en.c
@@ -997,7 +997,7 @@ void mana_uncfg_vport(struct mana_port_context *apc)
 	WARN_ON(apc->vport_use_count < 0);
 	mutex_unlock(&apc->vport_mutex);
 }
-EXPORT_SYMBOL_NS(mana_uncfg_vport, NET_MANA);
+EXPORT_SYMBOL_NS(mana_uncfg_vport, "NET_MANA");
 
 int mana_cfg_vport(struct mana_port_context *apc, u32 protection_dom_id,
 		   u32 doorbell_pg_id)
@@ -1067,7 +1067,7 @@ int mana_cfg_vport(struct mana_port_context *apc, u32 protection_dom_id,
 
 	return err;
 }
-EXPORT_SYMBOL_NS(mana_cfg_vport, NET_MANA);
+EXPORT_SYMBOL_NS(mana_cfg_vport, "NET_MANA");
 
 static int mana_cfg_vport_steering(struct mana_port_context *apc,
 				   enum TRI_STATE rx,
@@ -1189,7 +1189,7 @@ int mana_create_wq_obj(struct mana_port_context *apc,
 out:
 	return err;
 }
-EXPORT_SYMBOL_NS(mana_create_wq_obj, NET_MANA);
+EXPORT_SYMBOL_NS(mana_create_wq_obj, "NET_MANA");
 
 void mana_destroy_wq_obj(struct mana_port_context *apc, u32 wq_type,
 			 mana_handle_t wq_obj)
@@ -1217,7 +1217,7 @@ void mana_destroy_wq_obj(struct mana_port_context *apc, u32 wq_type,
 		netdev_err(ndev, "Failed to destroy WQ object: %d, 0x%x\n", err,
 			   resp.hdr.status);
 }
-EXPORT_SYMBOL_NS(mana_destroy_wq_obj, NET_MANA);
+EXPORT_SYMBOL_NS(mana_destroy_wq_obj, "NET_MANA");
 
 static void mana_destroy_eq(struct mana_context *ac)
 {
@@ -3044,4 +3044,4 @@ struct net_device *mana_get_primary_netdev_rcu(struct mana_context *ac, u32 port
 
 	return ndev;
 }
-EXPORT_SYMBOL_NS(mana_get_primary_netdev_rcu, NET_MANA);
+EXPORT_SYMBOL_NS(mana_get_primary_netdev_rcu, "NET_MANA");
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c
index 4f0c1e1a8e60..1e1c79b18c5b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bca/module.c
@@ -22,7 +22,7 @@ static void __exit brcmf_bca_exit(void)
 
 MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Broadcom AP chipsets");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(BRCMFMAC);
+MODULE_IMPORT_NS("BRCMFMAC");
 
 module_init(brcmf_bca_init);
 module_exit(brcmf_bca_exit);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
index 39226b9c0fa8..d53839f855d7 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
@@ -14,7 +14,7 @@
 #include "fweh.h"
 
 #if IS_MODULE(CONFIG_BRCMFMAC)
-#define BRCMF_EXPORT_SYMBOL_GPL(__sym)	EXPORT_SYMBOL_NS_GPL(__sym, BRCMFMAC)
+#define BRCMF_EXPORT_SYMBOL_GPL(__sym)	EXPORT_SYMBOL_NS_GPL(__sym, "BRCMFMAC")
 #else
 #define BRCMF_EXPORT_SYMBOL_GPL(__sym)
 #endif
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c
index 90d06cda03a2..ce5fcfd42a7e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/module.c
@@ -22,7 +22,7 @@ static void __exit brcmf_cyw_exit(void)
 
 MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Cypress/Infineon chipsets");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(BRCMFMAC);
+MODULE_IMPORT_NS("BRCMFMAC");
 
 module_init(brcmf_cyw_init);
 module_exit(brcmf_cyw_exit);
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c
index b66135e3cff4..cfe01ca63ba6 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/wcc/module.c
@@ -22,7 +22,7 @@ static void __exit brcmf_wcc_exit(void)
 
 MODULE_DESCRIPTION("Broadcom FullMAC WLAN driver plugin for Broadcom mobility chipsets");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(BRCMFMAC);
+MODULE_IMPORT_NS("BRCMFMAC");
 
 module_init(brcmf_wcc_init);
 module_exit(brcmf_wcc_exit);
diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index e0b14be25b02..769b75c3fa5b 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -48,7 +48,7 @@
 #define DRV_DESCRIPTION	"Intel(R) Wireless WiFi Link AGN driver for Linux"
 MODULE_DESCRIPTION(DRV_DESCRIPTION);
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IWLWIFI);
+MODULE_IMPORT_NS("IWLWIFI");
 
 /* Please keep this array *SORTED* by hex value.
  * Access is done through binary search.
diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-drv.h b/drivers/net/wireless/intel/iwlwifi/iwl-drv.h
index 6a1d31892417..854957bdf79d 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-drv.h
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-drv.h
@@ -85,7 +85,7 @@ void iwl_drv_stop(struct iwl_drv *drv);
  * everything is built-in, then we can avoid that.
  */
 #ifdef CONFIG_IWLWIFI_OPMODE_MODULAR
-#define IWL_EXPORT_SYMBOL(sym)	EXPORT_SYMBOL_NS_GPL(sym, IWLWIFI)
+#define IWL_EXPORT_SYMBOL(sym)	EXPORT_SYMBOL_NS_GPL(sym, "IWLWIFI")
 #else
 #define IWL_EXPORT_SYMBOL(sym)
 #endif
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
index 4dd4a9d5c71f..6c20e99393a4 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/ops.c
@@ -34,7 +34,7 @@
 #define DRV_DESCRIPTION	"The new Intel(R) wireless AGN driver for Linux"
 MODULE_DESCRIPTION(DRV_DESCRIPTION);
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IWLWIFI);
+MODULE_IMPORT_NS("IWLWIFI");
 
 static const struct iwl_op_mode_ops iwl_mvm_ops;
 static const struct iwl_op_mode_ops iwl_mvm_ops_mq;
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c b/drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c
index 47b8e7b64ead..1dc57e022191 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tests/links.c
@@ -8,7 +8,7 @@
 #include "../mvm.h"
 #include <kunit/test.h>
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static struct wiphy wiphy = {
 	.mtx = __MUTEX_INITIALIZER(wiphy.mtx),
diff --git a/drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c b/drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c
index d3b6a57c3ebe..7a3275199ace 100644
--- a/drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c
+++ b/drivers/net/wireless/intel/iwlwifi/mvm/tests/scan.c
@@ -8,7 +8,7 @@
 #include "../mvm.h"
 #include <kunit/test.h>
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static const struct acs_average_db_case {
 	const char *desc;
diff --git a/drivers/net/wireless/intel/iwlwifi/tests/devinfo.c b/drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
index 7361b6d0cdb8..d0bda23c628a 100644
--- a/drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
+++ b/drivers/net/wireless/intel/iwlwifi/tests/devinfo.c
@@ -9,7 +9,7 @@
 #include "iwl-drv.h"
 #include "iwl-config.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static void iwl_pci_print_dev_info(const char *pfx, const struct iwl_dev_info *di)
 {
diff --git a/drivers/nvdimm/region_devs.c b/drivers/nvdimm/region_devs.c
index 9e4f7ff024a0..37417ce5ec7b 100644
--- a/drivers/nvdimm/region_devs.c
+++ b/drivers/nvdimm/region_devs.c
@@ -1270,4 +1270,4 @@ int nd_region_conflict(struct nd_region *nd_region, resource_size_t start,
 	return device_for_each_child(&nvdimm_bus->dev, &ctx, region_conflict);
 }
 
-MODULE_IMPORT_NS(DEVMEM);
+MODULE_IMPORT_NS("DEVMEM");
diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index b149b638453f..4f514b44f5e5 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -700,7 +700,7 @@ void nvme_put_ns(struct nvme_ns *ns)
 {
 	kref_put(&ns->kref, nvme_free_ns);
 }
-EXPORT_SYMBOL_NS_GPL(nvme_put_ns, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_put_ns, "NVME_TARGET_PASSTHRU");
 
 static inline void nvme_clear_nvme_request(struct request *req)
 {
@@ -1121,7 +1121,7 @@ int nvme_execute_rq(struct request *rq, bool at_head)
 		return nvme_req(rq)->status;
 	return blk_status_to_errno(status);
 }
-EXPORT_SYMBOL_NS_GPL(nvme_execute_rq, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_execute_rq, "NVME_TARGET_PASSTHRU");
 
 /*
  * Returns 0 on success.  If the result is negative, it's a Linux error code;
@@ -1201,7 +1201,7 @@ u32 nvme_command_effects(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u8 opcode)
 
 	return effects;
 }
-EXPORT_SYMBOL_NS_GPL(nvme_command_effects, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_command_effects, "NVME_TARGET_PASSTHRU");
 
 u32 nvme_passthru_start(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u8 opcode)
 {
@@ -1221,7 +1221,7 @@ u32 nvme_passthru_start(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u8 opcode)
 	}
 	return effects;
 }
-EXPORT_SYMBOL_NS_GPL(nvme_passthru_start, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_passthru_start, "NVME_TARGET_PASSTHRU");
 
 void nvme_passthru_end(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u32 effects,
 		       struct nvme_command *cmd, int status)
@@ -1266,7 +1266,7 @@ void nvme_passthru_end(struct nvme_ctrl *ctrl, struct nvme_ns *ns, u32 effects,
 		break;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(nvme_passthru_end, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_passthru_end, "NVME_TARGET_PASSTHRU");
 
 /*
  * Recommended frequency for KATO commands per NVMe 1.4 section 7.12.1:
@@ -3808,7 +3808,7 @@ struct nvme_ns *nvme_find_get_ns(struct nvme_ctrl *ctrl, unsigned nsid)
 	srcu_read_unlock(&ctrl->srcu, srcu_idx);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(nvme_find_get_ns, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_find_get_ns, "NVME_TARGET_PASSTHRU");
 
 /*
  * Add the namespace to the controller list while keeping the list ordered.
@@ -5001,7 +5001,7 @@ struct nvme_ctrl *nvme_ctrl_from_file(struct file *file)
 		return NULL;
 	return file->private_data;
 }
-EXPORT_SYMBOL_NS_GPL(nvme_ctrl_from_file, NVME_TARGET_PASSTHRU);
+EXPORT_SYMBOL_NS_GPL(nvme_ctrl_from_file, "NVME_TARGET_PASSTHRU");
 
 /*
  * Check we didn't inadvertently grow the command structure sizes:
diff --git a/drivers/nvme/target/passthru.c b/drivers/nvme/target/passthru.c
index 0f9b280c438d..30b21936b0c6 100644
--- a/drivers/nvme/target/passthru.c
+++ b/drivers/nvme/target/passthru.c
@@ -13,7 +13,7 @@
 #include "../host/nvme.h"
 #include "nvmet.h"
 
-MODULE_IMPORT_NS(NVME_TARGET_PASSTHRU);
+MODULE_IMPORT_NS("NVME_TARGET_PASSTHRU");
 
 /*
  * xarray to maintain one passthru subsystem per nvme controller.
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 13b8586924ea..070bcee45cc9 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -230,7 +230,7 @@ int pcie_aer_is_native(struct pci_dev *dev)
 
 	return pcie_ports_native || host->native_aer;
 }
-EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, CXL);
+EXPORT_SYMBOL_NS_GPL(pcie_aer_is_native, "CXL");
 
 static int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
@@ -801,7 +801,7 @@ void pci_print_aer(struct pci_dev *dev, int aer_severity,
 	trace_aer_event(dev_name(&dev->dev), (status & ~mask),
 			aer_severity, tlp_header_valid, &aer->header_log);
 }
-EXPORT_SYMBOL_NS_GPL(pci_print_aer, CXL);
+EXPORT_SYMBOL_NS_GPL(pci_print_aer, "CXL");
 
 /**
  * add_error_device - list device to be handled
diff --git a/drivers/peci/controller/peci-aspeed.c b/drivers/peci/controller/peci-aspeed.c
index b93eb6f43b98..ad3a7d71ed4c 100644
--- a/drivers/peci/controller/peci-aspeed.c
+++ b/drivers/peci/controller/peci-aspeed.c
@@ -597,4 +597,4 @@ MODULE_AUTHOR("Ryan Chen <ryan_chen@aspeedtech.com>");
 MODULE_AUTHOR("Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>");
 MODULE_DESCRIPTION("ASPEED PECI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PECI);
+MODULE_IMPORT_NS("PECI");
diff --git a/drivers/peci/controller/peci-npcm.c b/drivers/peci/controller/peci-npcm.c
index ec613d35c796..a6e2b3b2a966 100644
--- a/drivers/peci/controller/peci-npcm.c
+++ b/drivers/peci/controller/peci-npcm.c
@@ -295,4 +295,4 @@ module_platform_driver(npcm_peci_driver);
 MODULE_AUTHOR("Tomer Maimon <tomer.maimon@nuvoton.com>");
 MODULE_DESCRIPTION("NPCM PECI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PECI);
+MODULE_IMPORT_NS("PECI");
diff --git a/drivers/peci/core.c b/drivers/peci/core.c
index 25e46579dd9c..936c1fadefe5 100644
--- a/drivers/peci/core.c
+++ b/drivers/peci/core.c
@@ -158,7 +158,7 @@ struct peci_controller *devm_peci_controller_add(struct device *dev,
 
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, PECI);
+EXPORT_SYMBOL_NS_GPL(devm_peci_controller_add, "PECI");
 
 static const struct peci_device_id *
 peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *device)
diff --git a/drivers/peci/cpu.c b/drivers/peci/cpu.c
index 152bbd8e717a..2dac8ba82787 100644
--- a/drivers/peci/cpu.c
+++ b/drivers/peci/cpu.c
@@ -32,7 +32,7 @@ int peci_temp_read(struct peci_device *device, s16 *temp_raw)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(peci_temp_read, PECI_CPU);
+EXPORT_SYMBOL_NS_GPL(peci_temp_read, "PECI_CPU");
 
 /**
  * peci_pcs_read() - read PCS register
@@ -64,7 +64,7 @@ int peci_pcs_read(struct peci_device *device, u8 index, u16 param, u32 *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(peci_pcs_read, PECI_CPU);
+EXPORT_SYMBOL_NS_GPL(peci_pcs_read, "PECI_CPU");
 
 /**
  * peci_pci_local_read() - read 32-bit memory location using raw address
@@ -99,7 +99,7 @@ int peci_pci_local_read(struct peci_device *device, u8 bus, u8 dev, u8 func,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(peci_pci_local_read, PECI_CPU);
+EXPORT_SYMBOL_NS_GPL(peci_pci_local_read, "PECI_CPU");
 
 /**
  * peci_ep_pci_local_read() - read 32-bit memory location using raw address
@@ -135,7 +135,7 @@ int peci_ep_pci_local_read(struct peci_device *device, u8 seg,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(peci_ep_pci_local_read, PECI_CPU);
+EXPORT_SYMBOL_NS_GPL(peci_ep_pci_local_read, "PECI_CPU");
 
 /**
  * peci_mmio_read() - read 32-bit memory location using 64-bit bar offset address
@@ -172,7 +172,7 @@ int peci_mmio_read(struct peci_device *device, u8 bar, u8 seg,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(peci_mmio_read, PECI_CPU);
+EXPORT_SYMBOL_NS_GPL(peci_mmio_read, "PECI_CPU");
 
 static const char * const peci_adev_types[] = {
 	"cputemp",
@@ -337,4 +337,4 @@ module_peci_driver(peci_cpu_driver);
 MODULE_AUTHOR("Iwona Winiarska <iwona.winiarska@intel.com>");
 MODULE_DESCRIPTION("PECI CPU driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(PECI);
+MODULE_IMPORT_NS("PECI");
diff --git a/drivers/peci/device.c b/drivers/peci/device.c
index 37ca7dd61807..416635029f55 100644
--- a/drivers/peci/device.c
+++ b/drivers/peci/device.c
@@ -230,13 +230,13 @@ int __peci_driver_register(struct peci_driver *driver, struct module *owner,
 
 	return driver_register(&driver->driver);
 }
-EXPORT_SYMBOL_NS_GPL(__peci_driver_register, PECI);
+EXPORT_SYMBOL_NS_GPL(__peci_driver_register, "PECI");
 
 void peci_driver_unregister(struct peci_driver *driver)
 {
 	driver_unregister(&driver->driver);
 }
-EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_driver_unregister, "PECI");
 
 static void peci_device_release(struct device *dev)
 {
diff --git a/drivers/peci/request.c b/drivers/peci/request.c
index 87eefe66743f..e6327af45fc7 100644
--- a/drivers/peci/request.c
+++ b/drivers/peci/request.c
@@ -128,7 +128,7 @@ int peci_request_status(struct peci_request *req)
 
 	return -EIO;
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_status, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_status, "PECI");
 
 static int peci_request_xfer(struct peci_request *req)
 {
@@ -213,7 +213,7 @@ struct peci_request *peci_request_alloc(struct peci_device *device, u8 tx_len, u
 
 	return req;
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_alloc, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_alloc, "PECI");
 
 /**
  * peci_request_free() - free peci_request
@@ -223,7 +223,7 @@ void peci_request_free(struct peci_request *req)
 {
 	kfree(req);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_free, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_free, "PECI");
 
 struct peci_request *peci_xfer_get_dib(struct peci_device *device)
 {
@@ -244,7 +244,7 @@ struct peci_request *peci_xfer_get_dib(struct peci_device *device)
 
 	return req;
 }
-EXPORT_SYMBOL_NS_GPL(peci_xfer_get_dib, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_xfer_get_dib, "PECI");
 
 struct peci_request *peci_xfer_get_temp(struct peci_device *device)
 {
@@ -265,7 +265,7 @@ struct peci_request *peci_xfer_get_temp(struct peci_device *device)
 
 	return req;
 }
-EXPORT_SYMBOL_NS_GPL(peci_xfer_get_temp, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_xfer_get_temp, "PECI");
 
 static struct peci_request *
 __pkg_cfg_read(struct peci_device *device, u8 index, u16 param, u8 len)
@@ -397,44 +397,44 @@ u8 peci_request_data_readb(struct peci_request *req)
 {
 	return req->rx.buf[1];
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readb, "PECI");
 
 u16 peci_request_data_readw(struct peci_request *req)
 {
 	return get_unaligned_le16(&req->rx.buf[1]);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readw, "PECI");
 
 u32 peci_request_data_readl(struct peci_request *req)
 {
 	return get_unaligned_le32(&req->rx.buf[1]);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readl, "PECI");
 
 u64 peci_request_data_readq(struct peci_request *req)
 {
 	return get_unaligned_le64(&req->rx.buf[1]);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_data_readq, "PECI");
 
 u64 peci_request_dib_read(struct peci_request *req)
 {
 	return get_unaligned_le64(&req->rx.buf[0]);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_dib_read, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_dib_read, "PECI");
 
 s16 peci_request_temp_read(struct peci_request *req)
 {
 	return get_unaligned_le16(&req->rx.buf[0]);
 }
-EXPORT_SYMBOL_NS_GPL(peci_request_temp_read, PECI);
+EXPORT_SYMBOL_NS_GPL(peci_request_temp_read, "PECI");
 
 #define __read_pkg_config(x, type) \
 struct peci_request *peci_xfer_pkg_cfg_##x(struct peci_device *device, u8 index, u16 param) \
 { \
 	return __pkg_cfg_read(device, index, param, sizeof(type)); \
 } \
-EXPORT_SYMBOL_NS_GPL(peci_xfer_pkg_cfg_##x, PECI)
+EXPORT_SYMBOL_NS_GPL(peci_xfer_pkg_cfg_##x, "PECI")
 
 __read_pkg_config(readb, u8);
 __read_pkg_config(readw, u16);
@@ -447,7 +447,7 @@ peci_xfer_pci_cfg_local_##x(struct peci_device *device, u8 bus, u8 dev, u8 func,
 { \
 	return __pci_cfg_local_read(device, bus, dev, func, reg, sizeof(type)); \
 } \
-EXPORT_SYMBOL_NS_GPL(peci_xfer_pci_cfg_local_##x, PECI)
+EXPORT_SYMBOL_NS_GPL(peci_xfer_pci_cfg_local_##x, "PECI")
 
 __read_pci_config_local(readb, u8);
 __read_pci_config_local(readw, u16);
@@ -459,7 +459,7 @@ peci_xfer_ep_pci_cfg_##x(struct peci_device *device, u8 seg, u8 bus, u8 dev, u8
 { \
 	return __ep_pci_cfg_read(device, msg_type, seg, bus, dev, func, reg, sizeof(type)); \
 } \
-EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_pci_cfg_##x, PECI)
+EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_pci_cfg_##x, "PECI")
 
 __read_ep_pci_config(local_readb, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u8);
 __read_ep_pci_config(local_readw, PECI_ENDPTCFG_TYPE_LOCAL_PCI, u16);
@@ -476,7 +476,7 @@ struct peci_request *peci_xfer_ep_mmio##y##_##x(struct peci_device *device, u8 b
 			      offset, PECI_RDENDPTCFG_MMIO_WR_LEN_BASE + sizeof(type1), \
 			      sizeof(type2)); \
 } \
-EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_mmio##y##_##x, PECI)
+EXPORT_SYMBOL_NS_GPL(peci_xfer_ep_mmio##y##_##x, "PECI")
 
 __read_ep_mmio(readl, 32, PECI_ENDPTCFG_ADDR_TYPE_MMIO_D, u32, u32);
 __read_ep_mmio(readl, 64, PECI_ENDPTCFG_ADDR_TYPE_MMIO_Q, u64, u32);
diff --git a/drivers/perf/cxl_pmu.c b/drivers/perf/cxl_pmu.c
index 43d68b69e630..c436e5321946 100644
--- a/drivers/perf/cxl_pmu.c
+++ b/drivers/perf/cxl_pmu.c
@@ -974,7 +974,7 @@ static __exit void cxl_pmu_exit(void)
 
 MODULE_DESCRIPTION("CXL Performance Monitor Driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
 module_init(cxl_pmu_init);
 module_exit(cxl_pmu_exit);
 MODULE_ALIAS_CXL(CXL_DEVICE_PMU);
diff --git a/drivers/pinctrl/intel/pinctrl-alderlake.c b/drivers/pinctrl/intel/pinctrl-alderlake.c
index 7d9948e5f422..108eac205aa9 100644
--- a/drivers/pinctrl/intel/pinctrl-alderlake.c
+++ b/drivers/pinctrl/intel/pinctrl-alderlake.c
@@ -747,4 +747,4 @@ module_platform_driver(adl_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Alder Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 4533c4d0a9e7..7340dc20349c 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1723,4 +1723,4 @@ static int __init byt_gpio_init(void)
 }
 subsys_initcall(byt_gpio_init);
 
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-broxton.c b/drivers/pinctrl/intel/pinctrl-broxton.c
index d99541676630..140b29956340 100644
--- a/drivers/pinctrl/intel/pinctrl-broxton.c
+++ b/drivers/pinctrl/intel/pinctrl-broxton.c
@@ -1026,4 +1026,4 @@ module_exit(bxt_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Broxton SoC pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-cannonlake.c b/drivers/pinctrl/intel/pinctrl-cannonlake.c
index 1aa09f950be1..14a5d339385d 100644
--- a/drivers/pinctrl/intel/pinctrl-cannonlake.c
+++ b/drivers/pinctrl/intel/pinctrl-cannonlake.c
@@ -838,4 +838,4 @@ module_platform_driver(cnl_pinctrl_driver);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cannon Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-cedarfork.c b/drivers/pinctrl/intel/pinctrl-cedarfork.c
index 48af8930dd1f..2ce97abeb0e4 100644
--- a/drivers/pinctrl/intel/pinctrl-cedarfork.c
+++ b/drivers/pinctrl/intel/pinctrl-cedarfork.c
@@ -350,4 +350,4 @@ module_exit(cdf_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cedar Fork PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 067b0d344f0e..ec20c3612182 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1815,4 +1815,4 @@ module_exit(chv_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Cherryview/Braswell pinctrl driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-denverton.c b/drivers/pinctrl/intel/pinctrl-denverton.c
index 666507f54f27..fef44c663be6 100644
--- a/drivers/pinctrl/intel/pinctrl-denverton.c
+++ b/drivers/pinctrl/intel/pinctrl-denverton.c
@@ -287,4 +287,4 @@ module_exit(dnv_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Denverton SoC pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-elkhartlake.c b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
index 1678634ebc06..80fbe76cf257 100644
--- a/drivers/pinctrl/intel/pinctrl-elkhartlake.c
+++ b/drivers/pinctrl/intel/pinctrl-elkhartlake.c
@@ -499,4 +499,4 @@ module_platform_driver(ehl_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Elkhart Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-emmitsburg.c b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
index e4798d32492c..9d8a32aca177 100644
--- a/drivers/pinctrl/intel/pinctrl-emmitsburg.c
+++ b/drivers/pinctrl/intel/pinctrl-emmitsburg.c
@@ -372,4 +372,4 @@ module_platform_driver(ebg_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Emmitsburg PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-geminilake.c b/drivers/pinctrl/intel/pinctrl-geminilake.c
index 6dcf0ac2059f..8dcac4fe8493 100644
--- a/drivers/pinctrl/intel/pinctrl-geminilake.c
+++ b/drivers/pinctrl/intel/pinctrl-geminilake.c
@@ -472,4 +472,4 @@ module_exit(glk_pinctrl_exit);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Gemini Lake SoC pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-icelake.c b/drivers/pinctrl/intel/pinctrl-icelake.c
index fe3042de891a..7e028c61ed0f 100644
--- a/drivers/pinctrl/intel/pinctrl-icelake.c
+++ b/drivers/pinctrl/intel/pinctrl-icelake.c
@@ -690,4 +690,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Ice Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-intel-platform.c b/drivers/pinctrl/intel/pinctrl-intel-platform.c
index 016a9f62eecc..dd5dbede0f59 100644
--- a/drivers/pinctrl/intel/pinctrl-intel-platform.c
+++ b/drivers/pinctrl/intel/pinctrl-intel-platform.c
@@ -221,4 +221,4 @@ module_platform_driver(intel_platform_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-intel.c b/drivers/pinctrl/intel/pinctrl-intel.c
index 928607a21d36..6b937a31e7ce 100644
--- a/drivers/pinctrl/intel/pinctrl-intel.c
+++ b/drivers/pinctrl/intel/pinctrl-intel.c
@@ -146,7 +146,7 @@ const struct intel_community *intel_get_community(const struct intel_pinctrl *pc
 	dev_warn(pctrl->dev, "failed to find community for pin %u\n", pin);
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_community, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_community, "PINCTRL_INTEL");
 
 static const struct intel_padgroup *
 intel_community_get_padgroup(const struct intel_community *community,
@@ -303,7 +303,7 @@ int intel_get_groups_count(struct pinctrl_dev *pctldev)
 
 	return pctrl->soc->ngroups;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_groups_count, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_groups_count, "PINCTRL_INTEL");
 
 const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group)
 {
@@ -311,7 +311,7 @@ const char *intel_get_group_name(struct pinctrl_dev *pctldev, unsigned int group
 
 	return pctrl->soc->groups[group].grp.name;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_group_name, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_group_name, "PINCTRL_INTEL");
 
 int intel_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 			 const unsigned int **pins, unsigned int *npins)
@@ -322,7 +322,7 @@ int intel_get_group_pins(struct pinctrl_dev *pctldev, unsigned int group,
 	*npins = pctrl->soc->groups[group].grp.npins;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_group_pins, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_group_pins, "PINCTRL_INTEL");
 
 static void intel_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 			       unsigned int pin)
@@ -388,7 +388,7 @@ int intel_get_functions_count(struct pinctrl_dev *pctldev)
 
 	return pctrl->soc->nfunctions;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_functions_count, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_functions_count, "PINCTRL_INTEL");
 
 const char *intel_get_function_name(struct pinctrl_dev *pctldev, unsigned int function)
 {
@@ -396,7 +396,7 @@ const char *intel_get_function_name(struct pinctrl_dev *pctldev, unsigned int fu
 
 	return pctrl->soc->functions[function].func.name;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_function_name, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_function_name, "PINCTRL_INTEL");
 
 int intel_get_function_groups(struct pinctrl_dev *pctldev, unsigned int function,
 			      const char * const **groups, unsigned int * const ngroups)
@@ -407,7 +407,7 @@ int intel_get_function_groups(struct pinctrl_dev *pctldev, unsigned int function
 	*ngroups = pctrl->soc->functions[function].func.ngroups;
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(intel_get_function_groups, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_get_function_groups, "PINCTRL_INTEL");
 
 static int intel_pinmux_set_mux(struct pinctrl_dev *pctldev,
 				unsigned int function, unsigned int group)
@@ -1664,7 +1664,7 @@ int intel_pinctrl_probe(struct platform_device *pdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe, "PINCTRL_INTEL");
 
 int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 {
@@ -1676,7 +1676,7 @@ int intel_pinctrl_probe_by_hid(struct platform_device *pdev)
 
 	return intel_pinctrl_probe(pdev, data);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_hid, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_hid, "PINCTRL_INTEL");
 
 int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
 {
@@ -1688,7 +1688,7 @@ int intel_pinctrl_probe_by_uid(struct platform_device *pdev)
 
 	return intel_pinctrl_probe(pdev, data);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_uid, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_pinctrl_probe_by_uid, "PINCTRL_INTEL");
 
 const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_device *pdev)
 {
@@ -1719,7 +1719,7 @@ const struct intel_pinctrl_soc_data *intel_pinctrl_get_soc_data(struct platform_
 
 	return data ?: ERR_PTR(-ENODATA);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, PINCTRL_INTEL);
+EXPORT_SYMBOL_NS_GPL(intel_pinctrl_get_soc_data, "PINCTRL_INTEL");
 
 static bool __intel_gpio_is_direct_irq(u32 value)
 {
diff --git a/drivers/pinctrl/intel/pinctrl-jasperlake.c b/drivers/pinctrl/intel/pinctrl-jasperlake.c
index 3525480428ea..aef0e7f92154 100644
--- a/drivers/pinctrl/intel/pinctrl-jasperlake.c
+++ b/drivers/pinctrl/intel/pinctrl-jasperlake.c
@@ -340,4 +340,4 @@ module_platform_driver(jsl_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Jasper Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-lakefield.c b/drivers/pinctrl/intel/pinctrl-lakefield.c
index adef85db82ca..60281f421608 100644
--- a/drivers/pinctrl/intel/pinctrl-lakefield.c
+++ b/drivers/pinctrl/intel/pinctrl-lakefield.c
@@ -361,4 +361,4 @@ module_platform_driver(lkf_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Lakefield PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-lewisburg.c b/drivers/pinctrl/intel/pinctrl-lewisburg.c
index a304d30ea9ed..9fe651370f32 100644
--- a/drivers/pinctrl/intel/pinctrl-lewisburg.c
+++ b/drivers/pinctrl/intel/pinctrl-lewisburg.c
@@ -321,4 +321,4 @@ module_platform_driver(lbg_pinctrl_driver);
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Lewisburg pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index bcce97f3b897..cc5ede17c383 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -859,4 +859,4 @@ MODULE_AUTHOR("Andy Shevchenko (Intel)");
 MODULE_DESCRIPTION("Intel Lynxpoint pinctrl driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:lp_gpio");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-merrifield.c b/drivers/pinctrl/intel/pinctrl-merrifield.c
index 1a556f5822b6..2f4d73dda41d 100644
--- a/drivers/pinctrl/intel/pinctrl-merrifield.c
+++ b/drivers/pinctrl/intel/pinctrl-merrifield.c
@@ -380,4 +380,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Merrifield SoC pinctrl driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:pinctrl-merrifield");
-MODULE_IMPORT_NS(PINCTRL_TANGIER);
+MODULE_IMPORT_NS("PINCTRL_TANGIER");
diff --git a/drivers/pinctrl/intel/pinctrl-meteorlake.c b/drivers/pinctrl/intel/pinctrl-meteorlake.c
index 885fa3b0d6d9..f564376ce437 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorlake.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorlake.c
@@ -604,4 +604,4 @@ module_platform_driver(mtl_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Meteor Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-meteorpoint.c b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
index 77e97775a60b..ab46ac5f3b15 100644
--- a/drivers/pinctrl/intel/pinctrl-meteorpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-meteorpoint.c
@@ -462,4 +462,4 @@ module_platform_driver(mtp_pinctrl_driver);
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Meteor Point PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-moorefield.c b/drivers/pinctrl/intel/pinctrl-moorefield.c
index 7b995fbf5c84..6a79207e6b2a 100644
--- a/drivers/pinctrl/intel/pinctrl-moorefield.c
+++ b/drivers/pinctrl/intel/pinctrl-moorefield.c
@@ -341,4 +341,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Moorefield SoC pinctrl driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:pinctrl-moorefield");
-MODULE_IMPORT_NS(PINCTRL_TANGIER);
+MODULE_IMPORT_NS("PINCTRL_TANGIER");
diff --git a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
index 55df9d2cfb1b..a7a5fa65fd9d 100644
--- a/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
+++ b/drivers/pinctrl/intel/pinctrl-sunrisepoint.c
@@ -605,4 +605,4 @@ MODULE_AUTHOR("Mathias Nyman <mathias.nyman@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Sunrisepoint PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/pinctrl/intel/pinctrl-tangier.c b/drivers/pinctrl/intel/pinctrl-tangier.c
index 2cb0b4758269..d3baf0f4eea0 100644
--- a/drivers/pinctrl/intel/pinctrl-tangier.c
+++ b/drivers/pinctrl/intel/pinctrl-tangier.c
@@ -579,7 +579,7 @@ int devm_tng_pinctrl_probe(struct platform_device *pdev)
 
 	return tng_pinctrl_probe(pdev, data);
 }
-EXPORT_SYMBOL_NS_GPL(devm_tng_pinctrl_probe, PINCTRL_TANGIER);
+EXPORT_SYMBOL_NS_GPL(devm_tng_pinctrl_probe, "PINCTRL_TANGIER");
 
 MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
diff --git a/drivers/pinctrl/intel/pinctrl-tigerlake.c b/drivers/pinctrl/intel/pinctrl-tigerlake.c
index 80cd7a06fe5a..c43576e10273 100644
--- a/drivers/pinctrl/intel/pinctrl-tigerlake.c
+++ b/drivers/pinctrl/intel/pinctrl-tigerlake.c
@@ -758,4 +758,4 @@ MODULE_AUTHOR("Andy Shevchenko <andriy.shevchenko@linux.intel.com>");
 MODULE_AUTHOR("Mika Westerberg <mika.westerberg@linux.intel.com>");
 MODULE_DESCRIPTION("Intel Tiger Lake PCH pinctrl/GPIO driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PINCTRL_INTEL);
+MODULE_IMPORT_NS("PINCTRL_INTEL");
diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index c908f52ed717..a75f49476be2 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1826,19 +1826,19 @@ int ideapad_laptop_register_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_register(&ideapad_laptop_chain_head, nb);
 }
-EXPORT_SYMBOL_NS_GPL(ideapad_laptop_register_notifier, IDEAPAD_LAPTOP);
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_register_notifier, "IDEAPAD_LAPTOP");
 
 int ideapad_laptop_unregister_notifier(struct notifier_block *nb)
 {
 	return blocking_notifier_chain_unregister(&ideapad_laptop_chain_head, nb);
 }
-EXPORT_SYMBOL_NS_GPL(ideapad_laptop_unregister_notifier, IDEAPAD_LAPTOP);
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_unregister_notifier, "IDEAPAD_LAPTOP");
 
 void ideapad_laptop_call_notifier(unsigned long action, void *data)
 {
 	blocking_notifier_call_chain(&ideapad_laptop_chain_head, action, data);
 }
-EXPORT_SYMBOL_NS_GPL(ideapad_laptop_call_notifier, IDEAPAD_LAPTOP);
+EXPORT_SYMBOL_NS_GPL(ideapad_laptop_call_notifier, "IDEAPAD_LAPTOP");
 
 static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
 {
diff --git a/drivers/platform/x86/intel/intel_plr_tpmi.c b/drivers/platform/x86/intel/intel_plr_tpmi.c
index 69ace6a629bc..691d43c3592c 100644
--- a/drivers/platform/x86/intel/intel_plr_tpmi.c
+++ b/drivers/platform/x86/intel/intel_plr_tpmi.c
@@ -348,7 +348,7 @@ static struct auxiliary_driver intel_plr_aux_driver = {
 };
 module_auxiliary_driver(intel_plr_aux_driver);
 
-MODULE_IMPORT_NS(INTEL_TPMI);
-MODULE_IMPORT_NS(INTEL_TPMI_POWER_DOMAIN);
+MODULE_IMPORT_NS("INTEL_TPMI");
+MODULE_IMPORT_NS("INTEL_TPMI_POWER_DOMAIN");
 MODULE_DESCRIPTION("Intel TPMI PLR Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index 8504154b649f..50ebfd586d3f 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -324,5 +324,5 @@ int pmc_core_ssram_init(struct pmc_dev *pmcdev, int func)
 
 	return ret;
 }
-MODULE_IMPORT_NS(INTEL_VSEC);
-MODULE_IMPORT_NS(INTEL_PMT_TELEMETRY);
+MODULE_IMPORT_NS("INTEL_VSEC");
+MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index c04bb7f97a4d..789812d9db74 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -33,7 +33,7 @@ bool intel_pmt_is_early_client_hw(struct device *dev)
 	 */
 	return !!(ivdev->quirks & VSEC_QUIRK_EARLY_HW);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pmt_is_early_client_hw, INTEL_PMT);
+EXPORT_SYMBOL_NS_GPL(intel_pmt_is_early_client_hw, "INTEL_PMT");
 
 static inline int
 pmt_memcpy64_fromio(void *to, const u64 __iomem *from, size_t count)
@@ -72,7 +72,7 @@ int pmt_telem_read_mmio(struct pci_dev *pdev, struct pmt_callbacks *cb, u32 guid
 
 	return count;
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, "INTEL_PMT");
 
 /*
  * sysfs
@@ -357,7 +357,7 @@ int intel_pmt_dev_create(struct intel_pmt_entry *entry, struct intel_pmt_namespa
 
 	return intel_pmt_dev_register(entry, ns, dev);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_create, INTEL_PMT);
+EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_create, "INTEL_PMT");
 
 void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 			   struct intel_pmt_namespace *ns)
@@ -373,7 +373,7 @@ void intel_pmt_dev_destroy(struct intel_pmt_entry *entry,
 	device_unregister(dev);
 	xa_erase(ns->xa, entry->devid);
 }
-EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_destroy, INTEL_PMT);
+EXPORT_SYMBOL_NS_GPL(intel_pmt_dev_destroy, "INTEL_PMT");
 
 static int __init pmt_class_init(void)
 {
diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index 9079d5dffc03..6a9eb3c4b313 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -328,4 +328,4 @@ module_exit(pmt_crashlog_exit);
 MODULE_AUTHOR("Alexander Duyck <alexander.h.duyck@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PMT Crashlog driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(INTEL_PMT);
+MODULE_IMPORT_NS("INTEL_PMT");
diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
index c9feac859e57..6cb5452ee606 100644
--- a/drivers/platform/x86/intel/pmt/telemetry.c
+++ b/drivers/platform/x86/intel/pmt/telemetry.c
@@ -153,7 +153,7 @@ unsigned long pmt_telem_get_next_endpoint(unsigned long start)
 
 	return found_idx == start ? 0 : found_idx;
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_get_next_endpoint, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_get_next_endpoint, "INTEL_PMT_TELEMETRY");
 
 struct telem_endpoint *pmt_telem_register_endpoint(int devid)
 {
@@ -172,13 +172,13 @@ struct telem_endpoint *pmt_telem_register_endpoint(int devid)
 
 	return entry->ep;
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_register_endpoint, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_register_endpoint, "INTEL_PMT_TELEMETRY");
 
 void pmt_telem_unregister_endpoint(struct telem_endpoint *ep)
 {
 	kref_put(&ep->kref, pmt_telem_ep_release);
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_unregister_endpoint, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_unregister_endpoint, "INTEL_PMT_TELEMETRY");
 
 int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
 {
@@ -204,7 +204,7 @@ int pmt_telem_get_endpoint_info(int devid, struct telem_endpoint_info *info)
 	return err;
 
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_get_endpoint_info, "INTEL_PMT_TELEMETRY");
 
 int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 {
@@ -224,7 +224,7 @@ int pmt_telem_read(struct telem_endpoint *ep, u32 id, u64 *data, u32 count)
 
 	return ep->present ? 0 : -EPIPE;
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_read, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read, "INTEL_PMT_TELEMETRY");
 
 int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
 {
@@ -243,7 +243,7 @@ int pmt_telem_read32(struct telem_endpoint *ep, u32 id, u32 *data, u32 count)
 
 	return ep->present ? 0 : -EPIPE;
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_read32, "INTEL_PMT_TELEMETRY");
 
 struct telem_endpoint *
 pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
@@ -268,7 +268,7 @@ pmt_telem_find_and_register_endpoint(struct pci_dev *pcidev, u32 guid, u16 pos)
 
 	return ERR_PTR(-ENXIO);
 }
-EXPORT_SYMBOL_NS_GPL(pmt_telem_find_and_register_endpoint, INTEL_PMT_TELEMETRY);
+EXPORT_SYMBOL_NS_GPL(pmt_telem_find_and_register_endpoint, "INTEL_PMT_TELEMETRY");
 
 static void pmt_telem_remove(struct auxiliary_device *auxdev)
 {
@@ -347,4 +347,4 @@ module_exit(pmt_telem_exit);
 MODULE_AUTHOR("David E. Box <david.e.box@linux.intel.com>");
 MODULE_DESCRIPTION("Intel PMT Telemetry driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(INTEL_PMT);
+MODULE_IMPORT_NS("INTEL_PMT");
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
index 17972191538a..bcf0a5cbc68d 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi.c
@@ -67,6 +67,6 @@ static struct auxiliary_driver intel_sst_aux_driver = {
 
 module_auxiliary_driver(intel_sst_aux_driver);
 
-MODULE_IMPORT_NS(INTEL_TPMI_SST);
+MODULE_IMPORT_NS("INTEL_TPMI_SST");
 MODULE_DESCRIPTION("Intel TPMI SST Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
index 404582307109..9978cdd19851 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c
@@ -1593,7 +1593,7 @@ int tpmi_sst_dev_add(struct auxiliary_device *auxdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_add, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_add, "INTEL_TPMI_SST");
 
 void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 {
@@ -1614,7 +1614,7 @@ void tpmi_sst_dev_remove(struct auxiliary_device *auxdev)
 	}
 	mutex_unlock(&isst_tpmi_dev_lock);
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_remove, "INTEL_TPMI_SST");
 
 void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 {
@@ -1642,7 +1642,7 @@ void tpmi_sst_dev_suspend(struct auxiliary_device *auxdev)
 						    power_domain_info->sst_header.pp_offset +
 						    SST_PP_CONTROL_OFFSET);
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_suspend, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_suspend, "INTEL_TPMI_SST");
 
 void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 {
@@ -1669,7 +1669,7 @@ void tpmi_sst_dev_resume(struct auxiliary_device *auxdev)
 	writeq(power_domain_info->saved_pp_control, power_domain_info->sst_base +
 				power_domain_info->sst_header.pp_offset + SST_PP_CONTROL_OFFSET);
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_resume, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_dev_resume, "INTEL_TPMI_SST");
 
 #define ISST_TPMI_API_VERSION	0x03
 
@@ -1709,7 +1709,7 @@ int tpmi_sst_init(void)
 	mutex_unlock(&isst_tpmi_dev_lock);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_init, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_init, "INTEL_TPMI_SST");
 
 void tpmi_sst_exit(void)
 {
@@ -1723,10 +1723,10 @@ void tpmi_sst_exit(void)
 	}
 	mutex_unlock(&isst_tpmi_dev_lock);
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_sst_exit, INTEL_TPMI_SST);
+EXPORT_SYMBOL_NS_GPL(tpmi_sst_exit, "INTEL_TPMI_SST");
 
-MODULE_IMPORT_NS(INTEL_TPMI);
-MODULE_IMPORT_NS(INTEL_TPMI_POWER_DOMAIN);
+MODULE_IMPORT_NS("INTEL_TPMI");
+MODULE_IMPORT_NS("INTEL_TPMI_POWER_DOMAIN");
 
 MODULE_DESCRIPTION("ISST TPMI interface module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
index 486ddc9b3592..42cb309ecb62 100644
--- a/drivers/platform/x86/intel/tpmi.c
+++ b/drivers/platform/x86/intel/tpmi.c
@@ -193,7 +193,7 @@ struct intel_tpmi_plat_info *tpmi_get_platform_data(struct auxiliary_device *aux
 
 	return vsec_dev->priv_data;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_platform_data, INTEL_TPMI);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_platform_data, "INTEL_TPMI");
 
 int tpmi_get_resource_count(struct auxiliary_device *auxdev)
 {
@@ -204,7 +204,7 @@ int tpmi_get_resource_count(struct auxiliary_device *auxdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_resource_count, INTEL_TPMI);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_resource_count, "INTEL_TPMI");
 
 struct resource *tpmi_get_resource_at_index(struct auxiliary_device *auxdev, int index)
 {
@@ -215,7 +215,7 @@ struct resource *tpmi_get_resource_at_index(struct auxiliary_device *auxdev, int
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_resource_at_index, INTEL_TPMI);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_resource_at_index, "INTEL_TPMI");
 
 /* TPMI Control Interface */
 
@@ -354,7 +354,7 @@ int tpmi_get_feature_status(struct auxiliary_device *auxdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_feature_status, INTEL_TPMI);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_feature_status, "INTEL_TPMI");
 
 struct dentry *tpmi_get_debugfs_dir(struct auxiliary_device *auxdev)
 {
@@ -363,7 +363,7 @@ struct dentry *tpmi_get_debugfs_dir(struct auxiliary_device *auxdev)
 
 	return tpmi_info->dbgfs_dir;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_debugfs_dir, INTEL_TPMI);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_debugfs_dir, "INTEL_TPMI");
 
 static int tpmi_pfs_dbg_show(struct seq_file *s, void *unused)
 {
@@ -852,6 +852,6 @@ static struct auxiliary_driver tpmi_aux_driver = {
 
 module_auxiliary_driver(tpmi_aux_driver);
 
-MODULE_IMPORT_NS(INTEL_VSEC);
+MODULE_IMPORT_NS("INTEL_VSEC");
 MODULE_DESCRIPTION("Intel TPMI enumeration module");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 0609a8320f7e..603e7ded06a9 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -110,7 +110,7 @@ int tpmi_get_linux_cpu_number(int package_id, int domain_id, int punit_core_id)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_linux_cpu_number, INTEL_TPMI_POWER_DOMAIN);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_linux_cpu_number, "INTEL_TPMI_POWER_DOMAIN");
 
 int tpmi_get_punit_core_number(int cpu_no)
 {
@@ -119,7 +119,7 @@ int tpmi_get_punit_core_number(int cpu_no)
 
 	return per_cpu(tpmi_cpu_info, cpu_no).punit_core_id;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_punit_core_number, INTEL_TPMI_POWER_DOMAIN);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_punit_core_number, "INTEL_TPMI_POWER_DOMAIN");
 
 int tpmi_get_power_domain_id(int cpu_no)
 {
@@ -128,7 +128,7 @@ int tpmi_get_power_domain_id(int cpu_no)
 
 	return per_cpu(tpmi_cpu_info, cpu_no).punit_domain_id;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_id, INTEL_TPMI_POWER_DOMAIN);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_id, "INTEL_TPMI_POWER_DOMAIN");
 
 cpumask_t *tpmi_get_power_domain_mask(int cpu_no)
 {
@@ -149,7 +149,7 @@ cpumask_t *tpmi_get_power_domain_mask(int cpu_no)
 
 	return mask;
 }
-EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask, INTEL_TPMI_POWER_DOMAIN);
+EXPORT_SYMBOL_NS_GPL(tpmi_get_power_domain_mask, "INTEL_TPMI_POWER_DOMAIN");
 
 static int tpmi_get_logical_id(unsigned int cpu, struct tpmi_cpu_info *info)
 {
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index e22b683a7a43..4e2c6a2d7e6e 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -257,7 +257,7 @@ int uncore_freq_add_entry(struct uncore_data *data, int cpu)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(uncore_freq_add_entry, INTEL_UNCORE_FREQUENCY);
+EXPORT_SYMBOL_NS_GPL(uncore_freq_add_entry, "INTEL_UNCORE_FREQUENCY");
 
 void uncore_freq_remove_die_entry(struct uncore_data *data)
 {
@@ -270,7 +270,7 @@ void uncore_freq_remove_die_entry(struct uncore_data *data)
 
 	mutex_unlock(&uncore_lock);
 }
-EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, INTEL_UNCORE_FREQUENCY);
+EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, "INTEL_UNCORE_FREQUENCY");
 
 int uncore_freq_common_init(int (*read)(struct uncore_data *data, unsigned int *value,
 					enum uncore_index index),
@@ -297,7 +297,7 @@ int uncore_freq_common_init(int (*read)(struct uncore_data *data, unsigned int *
 
 	return uncore_root_kobj ? 0 : -ENOMEM;
 }
-EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init, INTEL_UNCORE_FREQUENCY);
+EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init, "INTEL_UNCORE_FREQUENCY");
 
 void uncore_freq_common_exit(void)
 {
@@ -309,7 +309,7 @@ void uncore_freq_common_exit(void)
 	}
 	mutex_unlock(&uncore_lock);
 }
-EXPORT_SYMBOL_NS_GPL(uncore_freq_common_exit, INTEL_UNCORE_FREQUENCY);
+EXPORT_SYMBOL_NS_GPL(uncore_freq_common_exit, "INTEL_UNCORE_FREQUENCY");
 
 
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
index 0591053813a2..4aa6c227ec82 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
@@ -629,7 +629,7 @@ static struct auxiliary_driver intel_uncore_aux_driver = {
 
 module_auxiliary_driver(intel_uncore_aux_driver);
 
-MODULE_IMPORT_NS(INTEL_TPMI);
-MODULE_IMPORT_NS(INTEL_UNCORE_FREQUENCY);
+MODULE_IMPORT_NS("INTEL_TPMI");
+MODULE_IMPORT_NS("INTEL_UNCORE_FREQUENCY");
 MODULE_DESCRIPTION("Intel TPMI UFS Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index a450b8a6bcec..40bbf8e45fa4 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -316,6 +316,6 @@ static void __exit intel_uncore_exit(void)
 }
 module_exit(intel_uncore_exit)
 
-MODULE_IMPORT_NS(INTEL_UNCORE_FREQUENCY);
+MODULE_IMPORT_NS("INTEL_UNCORE_FREQUENCY");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Uncore Frequency Limits Driver");
diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 7b5cc9993974..1490d54f8b61 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -143,7 +143,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
 	return devm_add_action_or_reset(parent, intel_vsec_remove_aux,
 				       auxdev);
 }
-EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, INTEL_VSEC);
+EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
 
 static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
 			      struct intel_vsec_platform_info *info)
@@ -346,7 +346,7 @@ void intel_vsec_register(struct pci_dev *pdev,
 
 	intel_vsec_walk_header(pdev, info);
 }
-EXPORT_SYMBOL_NS_GPL(intel_vsec_register, INTEL_VSEC);
+EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
 
 static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
index bd9f95404c7c..470d53e3c9d2 100644
--- a/drivers/platform/x86/lenovo-ymc.c
+++ b/drivers/platform/x86/lenovo-ymc.c
@@ -162,4 +162,4 @@ module_wmi_driver(lenovo_ymc_driver);
 MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
 MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IDEAPAD_LAPTOP);
+MODULE_IMPORT_NS("IDEAPAD_LAPTOP");
diff --git a/drivers/powercap/idle_inject.c b/drivers/powercap/idle_inject.c
index bafc59904ed3..04c212953ded 100644
--- a/drivers/powercap/idle_inject.c
+++ b/drivers/powercap/idle_inject.c
@@ -179,7 +179,7 @@ void idle_inject_set_duration(struct idle_inject_device *ii_dev,
 	if (!run_duration_us)
 		pr_debug("CPU is forced to 100 percent idle\n");
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_set_duration, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_set_duration, "IDLE_INJECT");
 
 /**
  * idle_inject_get_duration - idle and run duration retrieval helper
@@ -194,7 +194,7 @@ void idle_inject_get_duration(struct idle_inject_device *ii_dev,
 	*run_duration_us = READ_ONCE(ii_dev->run_duration_us);
 	*idle_duration_us = READ_ONCE(ii_dev->idle_duration_us);
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_get_duration, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_get_duration, "IDLE_INJECT");
 
 /**
  * idle_inject_set_latency - set the maximum latency allowed
@@ -206,7 +206,7 @@ void idle_inject_set_latency(struct idle_inject_device *ii_dev,
 {
 	WRITE_ONCE(ii_dev->latency_us, latency_us);
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_set_latency, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_set_latency, "IDLE_INJECT");
 
 /**
  * idle_inject_start - start idle injections
@@ -238,7 +238,7 @@ int idle_inject_start(struct idle_inject_device *ii_dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_start, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_start, "IDLE_INJECT");
 
 /**
  * idle_inject_stop - stops idle injections
@@ -285,7 +285,7 @@ void idle_inject_stop(struct idle_inject_device *ii_dev)
 
 	cpu_hotplug_enable();
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_stop, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_stop, "IDLE_INJECT");
 
 /**
  * idle_inject_setup - prepare the current task for idle injection
@@ -367,7 +367,7 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, "IDLE_INJECT");
 
 /**
  * idle_inject_register - initialize idle injection on a set of CPUs
@@ -384,7 +384,7 @@ struct idle_inject_device *idle_inject_register(struct cpumask *cpumask)
 {
 	return idle_inject_register_full(cpumask, NULL);
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_register, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_register, "IDLE_INJECT");
 
 /**
  * idle_inject_unregister - unregister idle injection control device
@@ -405,7 +405,7 @@ void idle_inject_unregister(struct idle_inject_device *ii_dev)
 
 	kfree(ii_dev);
 }
-EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, IDLE_INJECT);
+EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, "IDLE_INJECT");
 
 static struct smp_hotplug_thread idle_inject_threads = {
 	.store = &idle_inject_thread.tsk,
diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_rapl_tpmi.c
index 645fd1dc51a9..af2368f4db10 100644
--- a/drivers/powercap/intel_rapl_tpmi.c
+++ b/drivers/powercap/intel_rapl_tpmi.c
@@ -347,7 +347,7 @@ static struct auxiliary_driver intel_rapl_tpmi_driver = {
 
 module_auxiliary_driver(intel_rapl_tpmi_driver)
 
-MODULE_IMPORT_NS(INTEL_TPMI);
+MODULE_IMPORT_NS("INTEL_TPMI");
 
 MODULE_DESCRIPTION("Intel RAPL TPMI Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/pwm/pwm-dwc.h b/drivers/pwm/pwm-dwc.h
index c6e2df5a6122..1562594e7f85 100644
--- a/drivers/pwm/pwm-dwc.h
+++ b/drivers/pwm/pwm-dwc.h
@@ -9,7 +9,7 @@
  * Author: Raymond Tan <raymond.tan@intel.com>
  */
 
-MODULE_IMPORT_NS(dwc_pwm);
+MODULE_IMPORT_NS("dwc_pwm");
 
 #define DWC_TIM_LD_CNT(n)	((n) * 0x14)
 #define DWC_TIM_LD_CNT2(n)	(((n) * 4) + 0xb0)
diff --git a/drivers/pwm/pwm-lpss-pci.c b/drivers/pwm/pwm-lpss-pci.c
index f7ece2809e6b..ddc2a4ca90fd 100644
--- a/drivers/pwm/pwm-lpss-pci.c
+++ b/drivers/pwm/pwm-lpss-pci.c
@@ -70,4 +70,4 @@ module_pci_driver(pwm_lpss_driver_pci);
 
 MODULE_DESCRIPTION("PWM PCI driver for Intel LPSS");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PWM_LPSS);
+MODULE_IMPORT_NS("PWM_LPSS");
diff --git a/drivers/pwm/pwm-lpss-platform.c b/drivers/pwm/pwm-lpss-platform.c
index 5130238a4567..653ec9d0c8bf 100644
--- a/drivers/pwm/pwm-lpss-platform.c
+++ b/drivers/pwm/pwm-lpss-platform.c
@@ -78,5 +78,5 @@ module_platform_driver(pwm_lpss_driver_platform);
 
 MODULE_DESCRIPTION("PWM platform driver for Intel LPSS");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(PWM_LPSS);
+MODULE_IMPORT_NS("PWM_LPSS");
 MODULE_ALIAS("platform:pwm-lpss");
diff --git a/drivers/reset/reset-mpfs.c b/drivers/reset/reset-mpfs.c
index 710f9c1676f9..574e59db83a4 100644
--- a/drivers/reset/reset-mpfs.c
+++ b/drivers/reset/reset-mpfs.c
@@ -212,7 +212,7 @@ int mpfs_reset_controller_register(struct device *clk_dev, void __iomem *base)
 
 	return devm_add_action_or_reset(clk_dev, mpfs_reset_unregister_adev, adev);
 }
-EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, MCHP_CLK_MPFS);
+EXPORT_SYMBOL_NS_GPL(mpfs_reset_controller_register, "MCHP_CLK_MPFS");
 
 static const struct auxiliary_device_id mpfs_reset_ids[] = {
 	{
@@ -231,4 +231,4 @@ module_auxiliary_driver(mpfs_reset_driver);
 
 MODULE_DESCRIPTION("Microchip PolarFire SoC Reset Driver");
 MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
-MODULE_IMPORT_NS(MCHP_CLK_MPFS);
+MODULE_IMPORT_NS("MCHP_CLK_MPFS");
diff --git a/drivers/rtc/rtc-hid-sensor-time.c b/drivers/rtc/rtc-hid-sensor-time.c
index b81cea505ee9..ff16bac44658 100644
--- a/drivers/rtc/rtc-hid-sensor-time.c
+++ b/drivers/rtc/rtc-hid-sensor-time.c
@@ -326,4 +326,4 @@ module_platform_driver(hid_time_platform_driver);
 MODULE_DESCRIPTION("HID Sensor Time");
 MODULE_AUTHOR("Alexander Holler <holler@ahsoftware.de>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(IIO_HID);
+MODULE_IMPORT_NS("IIO_HID");
diff --git a/drivers/soundwire/amd_init.c b/drivers/soundwire/amd_init.c
index db040f435059..8b38202becb2 100644
--- a/drivers/soundwire/amd_init.c
+++ b/drivers/soundwire/amd_init.c
@@ -172,7 +172,7 @@ int sdw_amd_probe(struct sdw_amd_res *res, struct sdw_amd_ctx **sdw_ctx)
 
 	return sdw_amd_startup(*sdw_ctx);
 }
-EXPORT_SYMBOL_NS(sdw_amd_probe, SOUNDWIRE_AMD_INIT);
+EXPORT_SYMBOL_NS(sdw_amd_probe, "SOUNDWIRE_AMD_INIT");
 
 void sdw_amd_exit(struct sdw_amd_ctx *ctx)
 {
@@ -180,7 +180,7 @@ void sdw_amd_exit(struct sdw_amd_ctx *ctx)
 	kfree(ctx->ids);
 	kfree(ctx);
 }
-EXPORT_SYMBOL_NS(sdw_amd_exit, SOUNDWIRE_AMD_INIT);
+EXPORT_SYMBOL_NS(sdw_amd_exit, "SOUNDWIRE_AMD_INIT");
 
 int sdw_amd_get_slave_info(struct sdw_amd_ctx *ctx)
 {
@@ -223,7 +223,7 @@ int sdw_amd_get_slave_info(struct sdw_amd_ctx *ctx)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(sdw_amd_get_slave_info, SOUNDWIRE_AMD_INIT);
+EXPORT_SYMBOL_NS(sdw_amd_get_slave_info, "SOUNDWIRE_AMD_INIT");
 
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_DESCRIPTION("AMD SoundWire Init Library");
diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 421da0f86fad..9db78f3d7615 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -1111,4 +1111,4 @@ const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops = {
 	.sync_go = intel_shim_sync_go,
 	.sync_check_cmdsync_unlocked = intel_check_cmdsync_unlocked,
 };
-EXPORT_SYMBOL_NS(sdw_intel_cnl_hw_ops, SOUNDWIRE_INTEL);
+EXPORT_SYMBOL_NS(sdw_intel_cnl_hw_ops, "SOUNDWIRE_INTEL");
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 4f3dd70d6a1a..6b4be26f7748 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -747,6 +747,6 @@ const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
 
 	.program_sdi = intel_program_sdi,
 };
-EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
+EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, "SOUNDWIRE_INTEL");
 
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index a09134b97cd6..198c671e04eb 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -149,7 +149,7 @@ irqreturn_t sdw_intel_thread(int irq, void *dev_id)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(sdw_intel_thread, SOUNDWIRE_INTEL_INIT);
+EXPORT_SYMBOL_NS(sdw_intel_thread, "SOUNDWIRE_INTEL_INIT");
 
 static struct sdw_intel_ctx
 *sdw_intel_probe_controller(struct sdw_intel_res *res)
@@ -335,7 +335,7 @@ struct sdw_intel_ctx
 {
 	return sdw_intel_probe_controller(res);
 }
-EXPORT_SYMBOL_NS(sdw_intel_probe, SOUNDWIRE_INTEL_INIT);
+EXPORT_SYMBOL_NS(sdw_intel_probe, "SOUNDWIRE_INTEL_INIT");
 
 /**
  * sdw_intel_startup() - SoundWire Intel startup
@@ -348,7 +348,7 @@ int sdw_intel_startup(struct sdw_intel_ctx *ctx)
 {
 	return sdw_intel_startup_controller(ctx);
 }
-EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
+EXPORT_SYMBOL_NS(sdw_intel_startup, "SOUNDWIRE_INTEL_INIT");
 /**
  * sdw_intel_exit() - SoundWire Intel exit
  * @ctx: SoundWire context allocated in the probe
@@ -375,7 +375,7 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 	kfree(ctx->ldev);
 	kfree(ctx);
 }
-EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
+EXPORT_SYMBOL_NS(sdw_intel_exit, "SOUNDWIRE_INTEL_INIT");
 
 void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
 {
@@ -398,7 +398,7 @@ void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx)
 		intel_link_process_wakeen_event(&ldev->auxdev);
 	}
 }
-EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, SOUNDWIRE_INTEL_INIT);
+EXPORT_SYMBOL_NS(sdw_intel_process_wakeen_event, "SOUNDWIRE_INTEL_INIT");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Intel Soundwire Init Library");
diff --git a/drivers/spi/spi-cs42l43.c b/drivers/spi/spi-cs42l43.c
index 5b8ed65f8094..cd060efe2e0e 100644
--- a/drivers/spi/spi-cs42l43.c
+++ b/drivers/spi/spi-cs42l43.c
@@ -426,7 +426,7 @@ static struct platform_driver cs42l43_spi_driver = {
 };
 module_platform_driver(cs42l43_spi_driver);
 
-MODULE_IMPORT_NS(GPIO_SWNODE);
+MODULE_IMPORT_NS("GPIO_SWNODE");
 MODULE_DESCRIPTION("CS42L43 SPI Driver");
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
 MODULE_AUTHOR("Maciej Strozek <mstrozek@opensource.cirrus.com>");
diff --git a/drivers/spi/spi-dw-bt1.c b/drivers/spi/spi-dw-bt1.c
index 4577e8096cd9..098d9e841442 100644
--- a/drivers/spi/spi-dw-bt1.c
+++ b/drivers/spi/spi-dw-bt1.c
@@ -328,4 +328,4 @@ module_platform_driver(dw_spi_bt1_driver);
 MODULE_AUTHOR("Serge Semin <Sergey.Semin@baikalelectronics.ru>");
 MODULE_DESCRIPTION("Baikal-T1 System Boot SPI Controller driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SPI_DW_CORE);
+MODULE_IMPORT_NS("SPI_DW_CORE");
diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 431788dd848c..ea517af9435f 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -104,7 +104,7 @@ void dw_spi_set_cs(struct spi_device *spi, bool enable)
 	else
 		dw_writel(dws, DW_SPI_SER, 0);
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_set_cs, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_set_cs, "SPI_DW_CORE");
 
 /* Return the max entries we can fill into tx fifo */
 static inline u32 dw_spi_tx_max(struct dw_spi *dws)
@@ -208,7 +208,7 @@ int dw_spi_check_status(struct dw_spi *dws, bool raw)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_check_status, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_check_status, "SPI_DW_CORE");
 
 static irqreturn_t dw_spi_transfer_handler(struct dw_spi *dws)
 {
@@ -351,7 +351,7 @@ void dw_spi_update_config(struct dw_spi *dws, struct spi_device *spi,
 		dws->cur_rx_sample_dly = chip->rx_sample_dly;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_update_config, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_update_config, "SPI_DW_CORE");
 
 static void dw_spi_irq_setup(struct dw_spi *dws)
 {
@@ -982,7 +982,7 @@ int dw_spi_add_host(struct device *dev, struct dw_spi *dws)
 	spi_controller_put(host);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_add_host, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_add_host, "SPI_DW_CORE");
 
 void dw_spi_remove_host(struct dw_spi *dws)
 {
@@ -997,7 +997,7 @@ void dw_spi_remove_host(struct dw_spi *dws)
 
 	free_irq(dws->irq, dws->host);
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_remove_host, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_remove_host, "SPI_DW_CORE");
 
 int dw_spi_suspend_host(struct dw_spi *dws)
 {
@@ -1010,14 +1010,14 @@ int dw_spi_suspend_host(struct dw_spi *dws)
 	dw_spi_shutdown_chip(dws);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_suspend_host, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_suspend_host, "SPI_DW_CORE");
 
 int dw_spi_resume_host(struct dw_spi *dws)
 {
 	dw_spi_hw_init(&dws->host->dev, dws);
 	return spi_controller_resume(dws->host);
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_resume_host, "SPI_DW_CORE");
 
 MODULE_AUTHOR("Feng Tang <feng.tang@intel.com>");
 MODULE_DESCRIPTION("Driver for DesignWare SPI controller core");
diff --git a/drivers/spi/spi-dw-dma.c b/drivers/spi/spi-dw-dma.c
index f4c209e5f52b..b5bed02b7e50 100644
--- a/drivers/spi/spi-dw-dma.c
+++ b/drivers/spi/spi-dw-dma.c
@@ -693,7 +693,7 @@ void dw_spi_dma_setup_mfld(struct dw_spi *dws)
 {
 	dws->dma_ops = &dw_spi_dma_mfld_ops;
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_dma_setup_mfld, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_dma_setup_mfld, "SPI_DW_CORE");
 
 static const struct dw_spi_dma_ops dw_spi_dma_generic_ops = {
 	.dma_init	= dw_spi_dma_init_generic,
@@ -708,4 +708,4 @@ void dw_spi_dma_setup_generic(struct dw_spi *dws)
 {
 	dws->dma_ops = &dw_spi_dma_generic_ops;
 }
-EXPORT_SYMBOL_NS_GPL(dw_spi_dma_setup_generic, SPI_DW_CORE);
+EXPORT_SYMBOL_NS_GPL(dw_spi_dma_setup_generic, "SPI_DW_CORE");
diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
index 819907e332c4..d822feacd723 100644
--- a/drivers/spi/spi-dw-mmio.c
+++ b/drivers/spi/spi-dw-mmio.c
@@ -445,4 +445,4 @@ module_platform_driver(dw_spi_mmio_driver);
 MODULE_AUTHOR("Jean-Hugues Deschenes <jean-hugues.deschenes@octasic.com>");
 MODULE_DESCRIPTION("Memory-mapped I/O interface driver for DW SPI Core");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SPI_DW_CORE);
+MODULE_IMPORT_NS("SPI_DW_CORE");
diff --git a/drivers/spi/spi-dw-pci.c b/drivers/spi/spi-dw-pci.c
index 7c8279d13f31..637dab706a38 100644
--- a/drivers/spi/spi-dw-pci.c
+++ b/drivers/spi/spi-dw-pci.c
@@ -212,4 +212,4 @@ module_pci_driver(dw_spi_pci_driver);
 MODULE_AUTHOR("Feng Tang <feng.tang@intel.com>");
 MODULE_DESCRIPTION("PCI interface driver for DW SPI Core");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SPI_DW_CORE);
+MODULE_IMPORT_NS("SPI_DW_CORE");
diff --git a/drivers/spi/spi-ljca.c b/drivers/spi/spi-ljca.c
index 1cc1422ddba0..2cab79ad2b98 100644
--- a/drivers/spi/spi-ljca.c
+++ b/drivers/spi/spi-ljca.c
@@ -294,4 +294,4 @@ MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
 MODULE_AUTHOR("Lixu Zhang <lixu.zhang@intel.com>");
 MODULE_DESCRIPTION("Intel La Jolla Cove Adapter USB-SPI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(LJCA);
+MODULE_IMPORT_NS("LJCA");
diff --git a/drivers/spi/spi-loongson-core.c b/drivers/spi/spi-loongson-core.c
index f97800b6fd65..4fec226456d1 100644
--- a/drivers/spi/spi-loongson-core.c
+++ b/drivers/spi/spi-loongson-core.c
@@ -227,7 +227,7 @@ int loongson_spi_init_controller(struct device *dev, void __iomem *regs)
 
 	return devm_spi_register_controller(dev, controller);
 }
-EXPORT_SYMBOL_NS_GPL(loongson_spi_init_controller, SPI_LOONGSON_CORE);
+EXPORT_SYMBOL_NS_GPL(loongson_spi_init_controller, "SPI_LOONGSON_CORE");
 
 static int __maybe_unused loongson_spi_suspend(struct device *dev)
 {
@@ -273,7 +273,7 @@ const struct dev_pm_ops loongson_spi_dev_pm_ops = {
 	.suspend = loongson_spi_suspend,
 	.resume = loongson_spi_resume,
 };
-EXPORT_SYMBOL_NS_GPL(loongson_spi_dev_pm_ops, SPI_LOONGSON_CORE);
+EXPORT_SYMBOL_NS_GPL(loongson_spi_dev_pm_ops, "SPI_LOONGSON_CORE");
 
 MODULE_DESCRIPTION("Loongson SPI core driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi-loongson-pci.c b/drivers/spi/spi-loongson-pci.c
index 134cda0c13a5..6e7ddc1190c2 100644
--- a/drivers/spi/spi-loongson-pci.c
+++ b/drivers/spi/spi-loongson-pci.c
@@ -52,4 +52,4 @@ module_pci_driver(loongson_spi_pci_driver);
 
 MODULE_DESCRIPTION("Loongson spi pci driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SPI_LOONGSON_CORE);
+MODULE_IMPORT_NS("SPI_LOONGSON_CORE");
diff --git a/drivers/spi/spi-loongson-plat.c b/drivers/spi/spi-loongson-plat.c
index c066e5f5891e..64a7270f9a64 100644
--- a/drivers/spi/spi-loongson-plat.c
+++ b/drivers/spi/spi-loongson-plat.c
@@ -44,4 +44,4 @@ module_platform_driver(loongson_spi_plat_driver);
 
 MODULE_DESCRIPTION("Loongson spi platform driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SPI_LOONGSON_CORE);
+MODULE_IMPORT_NS("SPI_LOONGSON_CORE");
diff --git a/drivers/spi/spi-pxa2xx-pci.c b/drivers/spi/spi-pxa2xx-pci.c
index cc8dcf782399..4abb31179560 100644
--- a/drivers/spi/spi-pxa2xx-pci.c
+++ b/drivers/spi/spi-pxa2xx-pci.c
@@ -348,5 +348,5 @@ module_pci_driver(pxa2xx_spi_pci_driver);
 
 MODULE_DESCRIPTION("CE4100/LPSS PCI-SPI glue code for PXA's driver");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SPI_PXA2xx);
+MODULE_IMPORT_NS("SPI_PXA2xx");
 MODULE_AUTHOR("Sebastian Andrzej Siewior <bigeasy@linutronix.de>");
diff --git a/drivers/spi/spi-pxa2xx-platform.c b/drivers/spi/spi-pxa2xx-platform.c
index 595af9fa4e0f..9066db75fef8 100644
--- a/drivers/spi/spi-pxa2xx-platform.c
+++ b/drivers/spi/spi-pxa2xx-platform.c
@@ -225,6 +225,6 @@ module_exit(pxa2xx_spi_exit);
 MODULE_AUTHOR("Stephen Street");
 MODULE_DESCRIPTION("PXA2xx SSP SPI Controller platform driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SPI_PXA2xx);
+MODULE_IMPORT_NS("SPI_PXA2xx");
 MODULE_ALIAS("platform:pxa2xx-spi");
 MODULE_SOFTDEP("pre: dw_dmac");
diff --git a/drivers/spi/spi-pxa2xx.c b/drivers/spi/spi-pxa2xx.c
index bf1f34b0ffc8..903d76145272 100644
--- a/drivers/spi/spi-pxa2xx.c
+++ b/drivers/spi/spi-pxa2xx.c
@@ -1468,7 +1468,7 @@ int pxa2xx_spi_probe(struct device *dev, struct ssp_device *ssp,
 
 	return status;
 }
-EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_probe, SPI_PXA2xx);
+EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_probe, "SPI_PXA2xx");
 
 void pxa2xx_spi_remove(struct device *dev)
 {
@@ -1488,7 +1488,7 @@ void pxa2xx_spi_remove(struct device *dev)
 	/* Release IRQ */
 	free_irq(ssp->irq, drv_data);
 }
-EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_remove, SPI_PXA2xx);
+EXPORT_SYMBOL_NS_GPL(pxa2xx_spi_remove, "SPI_PXA2xx");
 
 static int pxa2xx_spi_suspend(struct device *dev)
 {
diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index c0e4c9266b5f..c1c73308800c 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -312,4 +312,4 @@ MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("spi:adis16203");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/staging/iio/accel/adis16240.c b/drivers/staging/iio/accel/adis16240.c
index 337492785f04..3be3eaf5d9d4 100644
--- a/drivers/staging/iio/accel/adis16240.c
+++ b/drivers/staging/iio/accel/adis16240.c
@@ -440,4 +440,4 @@ MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices Programmable Impact Sensor and Recorder");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("spi:adis16240");
-MODULE_IMPORT_NS(IIO_ADISLIB);
+MODULE_IMPORT_NS("IIO_ADISLIB");
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index c9984f1557b0..82cf21497407 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1493,4 +1493,4 @@ MODULE_AUTHOR("Wen Wang <wen.w.wang@intel.com>");
 MODULE_AUTHOR("Xiaolin Zhang <xiaolin.zhang@intel.com>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Intel ATOM Platform ISP Driver");
-MODULE_IMPORT_NS(INTEL_IPU_BRIDGE);
+MODULE_IMPORT_NS("INTEL_IPU_BRIDGE");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
index 7c46dd6bee73..c868d8b7bd1c 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device.c
@@ -454,8 +454,8 @@ void proc_thermal_mmio_remove(struct pci_dev *pdev, struct proc_thermal_device *
 }
 EXPORT_SYMBOL_GPL(proc_thermal_mmio_remove);
 
-MODULE_IMPORT_NS(INTEL_TCC);
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INTEL_TCC");
+MODULE_IMPORT_NS("INT340X_THERMAL");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_DESCRIPTION("Processor Thermal Reporting Device Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
index ba5d36d36fc4..145d471546d5 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_device_pci.c
@@ -510,7 +510,7 @@ static struct pci_driver proc_thermal_pci_driver = {
 
 module_pci_driver(proc_thermal_pci_driver);
 
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INT340X_THERMAL");
 
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_DESCRIPTION("Processor Thermal Reporting Device Driver");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c
index af2ec0beb7a1..b1d531ef440f 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_mbox.c
@@ -94,7 +94,7 @@ int processor_thermal_send_mbox_read_cmd(struct pci_dev *pdev, u16 id, u64 *resp
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(processor_thermal_send_mbox_read_cmd, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(processor_thermal_send_mbox_read_cmd, "INT340X_THERMAL");
 
 int processor_thermal_send_mbox_write_cmd(struct pci_dev *pdev, u16 id, u32 data)
 {
@@ -106,7 +106,7 @@ int processor_thermal_send_mbox_write_cmd(struct pci_dev *pdev, u16 id, u32 data
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(processor_thermal_send_mbox_write_cmd, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(processor_thermal_send_mbox_write_cmd, "INT340X_THERMAL");
 
 #define MBOX_CAMARILLO_RD_INTR_CONFIG	0x1E
 #define MBOX_CAMARILLO_WR_INTR_CONFIG	0x1F
@@ -153,7 +153,7 @@ int processor_thermal_mbox_interrupt_config(struct pci_dev *pdev, bool enable,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(processor_thermal_mbox_interrupt_config, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(processor_thermal_mbox_interrupt_config, "INT340X_THERMAL");
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Processor Thermal Mail Box Interface");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c
index d6b787ca2741..25cdbb6d91a6 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_power_floor.c
@@ -42,7 +42,7 @@ int proc_thermal_read_power_floor_status(struct proc_thermal_device *proc_priv)
 	status = readq(proc_priv->mmio_base + SOC_WT_RES_INT_STATUS_OFFSET);
 	return (status & SOC_POWER_FLOOR_STATUS) >> SOC_POWER_FLOOR_SHIFT;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_read_power_floor_status, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_read_power_floor_status, "INT340X_THERMAL");
 
 static bool enable_state;
 static DEFINE_MUTEX(pf_lock);
@@ -69,13 +69,13 @@ int proc_thermal_power_floor_set_state(struct proc_thermal_device *proc_priv, bo
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_set_state, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_set_state, "INT340X_THERMAL");
 
 bool proc_thermal_power_floor_get_state(struct proc_thermal_device *proc_priv)
 {
 	return enable_state;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_get_state, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_get_state, "INT340X_THERMAL");
 
 /**
  * proc_thermal_check_power_floor_intr() - Check power floor interrupt.
@@ -94,7 +94,7 @@ bool proc_thermal_check_power_floor_intr(struct proc_thermal_device *proc_priv)
 	int_status = readq(proc_priv->mmio_base + SOC_WT_RES_INT_STATUS_OFFSET);
 	return !!(int_status & SOC_POWER_FLOOR_INT_ACTIVE);
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_check_power_floor_intr, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_check_power_floor_intr, "INT340X_THERMAL");
 
 /**
  * proc_thermal_power_floor_intr_callback() - Process power floor notification
@@ -120,8 +120,8 @@ void proc_thermal_power_floor_intr_callback(struct pci_dev *pdev,
 
 	sysfs_notify(&pdev->dev.kobj, "power_limits", "power_floor_status");
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_intr_callback, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_power_floor_intr_callback, "INT340X_THERMAL");
 
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INT340X_THERMAL");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Processor Thermal power floor notification Interface");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
index 0e2dc1426282..dad63f2d5f90 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_rfim.c
@@ -9,7 +9,7 @@
 #include <linux/pci.h>
 #include "processor_thermal_device.h"
 
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INT340X_THERMAL");
 
 struct mmio_reg {
 	int read_only;
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c
index e947d84f4977..68e8391af8f4 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_hint.c
@@ -204,7 +204,7 @@ bool proc_thermal_check_wt_intr(struct proc_thermal_device *proc_priv)
 
 	return false;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_check_wt_intr, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_check_wt_intr, "INT340X_THERMAL");
 
 /* Callback to notify user space */
 void proc_thermal_wt_intr_callback(struct pci_dev *pdev, struct proc_thermal_device *proc_priv)
@@ -217,7 +217,7 @@ void proc_thermal_wt_intr_callback(struct pci_dev *pdev, struct proc_thermal_dev
 
 	sysfs_notify(&pdev->dev.kobj, "workload_hint", "workload_type_index");
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_intr_callback, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_intr_callback, "INT340X_THERMAL");
 
 static bool workload_hint_created;
 
@@ -233,7 +233,7 @@ int proc_thermal_wt_hint_add(struct pci_dev *pdev, struct proc_thermal_device *p
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_hint_add, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_hint_add, "INT340X_THERMAL");
 
 void proc_thermal_wt_hint_remove(struct pci_dev *pdev)
 {
@@ -249,8 +249,8 @@ void proc_thermal_wt_hint_remove(struct pci_dev *pdev)
 
 	workload_hint_created = false;
 }
-EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_hint_remove, INT340X_THERMAL);
+EXPORT_SYMBOL_NS_GPL(proc_thermal_wt_hint_remove, "INT340X_THERMAL");
 
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INT340X_THERMAL");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Processor Thermal Work Load type hint Interface");
diff --git a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
index f298e7442662..b95810f4a011 100644
--- a/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
+++ b/drivers/thermal/intel/int340x_thermal/processor_thermal_wt_req.c
@@ -132,6 +132,6 @@ void proc_thermal_wt_req_remove(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(proc_thermal_wt_req_remove);
 
-MODULE_IMPORT_NS(INT340X_THERMAL);
+MODULE_IMPORT_NS("INT340X_THERMAL");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Processor Thermal Work Load type request Interface");
diff --git a/drivers/thermal/intel/intel_powerclamp.c b/drivers/thermal/intel/intel_powerclamp.c
index 4ba649370aa1..96a24df79686 100644
--- a/drivers/thermal/intel/intel_powerclamp.c
+++ b/drivers/thermal/intel/intel_powerclamp.c
@@ -809,7 +809,7 @@ static void __exit powerclamp_exit(void)
 }
 module_exit(powerclamp_exit);
 
-MODULE_IMPORT_NS(IDLE_INJECT);
+MODULE_IMPORT_NS("IDLE_INJECT");
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Arjan van de Ven <arjan@linux.intel.com>");
diff --git a/drivers/thermal/intel/intel_soc_dts_iosf.c b/drivers/thermal/intel/intel_soc_dts_iosf.c
index 43a29551ba17..ea87439fe7a9 100644
--- a/drivers/thermal/intel/intel_soc_dts_iosf.c
+++ b/drivers/thermal/intel/intel_soc_dts_iosf.c
@@ -388,6 +388,6 @@ void intel_soc_dts_iosf_exit(struct intel_soc_dts_sensors *sensors)
 }
 EXPORT_SYMBOL_GPL(intel_soc_dts_iosf_exit);
 
-MODULE_IMPORT_NS(INTEL_TCC);
+MODULE_IMPORT_NS("INTEL_TCC");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("SoC DTS driver using side band interface");
diff --git a/drivers/thermal/intel/intel_tcc.c b/drivers/thermal/intel/intel_tcc.c
index c86654f28aa5..817421508d5c 100644
--- a/drivers/thermal/intel/intel_tcc.c
+++ b/drivers/thermal/intel/intel_tcc.c
@@ -150,7 +150,7 @@ u32 intel_tcc_get_offset_mask(void)
 {
 	return intel_tcc_temp_masks.tcc_offset;
 }
-EXPORT_SYMBOL_NS(intel_tcc_get_offset_mask, INTEL_TCC);
+EXPORT_SYMBOL_NS(intel_tcc_get_offset_mask, "INTEL_TCC");
 
 /**
  * get_temp_mask() - Returns the model-specific bitmask for temperature
@@ -195,7 +195,7 @@ int intel_tcc_get_tjmax(int cpu)
 
 	return val ? val : -ENODATA;
 }
-EXPORT_SYMBOL_NS_GPL(intel_tcc_get_tjmax, INTEL_TCC);
+EXPORT_SYMBOL_NS_GPL(intel_tcc_get_tjmax, "INTEL_TCC");
 
 /**
  * intel_tcc_get_offset() - returns the TCC Offset value to Tjmax
@@ -220,7 +220,7 @@ int intel_tcc_get_offset(int cpu)
 
 	return (low >> 24) & intel_tcc_temp_masks.tcc_offset;
 }
-EXPORT_SYMBOL_NS_GPL(intel_tcc_get_offset, INTEL_TCC);
+EXPORT_SYMBOL_NS_GPL(intel_tcc_get_offset, "INTEL_TCC");
 
 /**
  * intel_tcc_set_offset() - set the TCC offset value to Tjmax
@@ -263,7 +263,7 @@ int intel_tcc_set_offset(int cpu, int offset)
 	else
 		return wrmsr_safe_on_cpu(cpu, MSR_IA32_TEMPERATURE_TARGET, low, high);
 }
-EXPORT_SYMBOL_NS_GPL(intel_tcc_set_offset, INTEL_TCC);
+EXPORT_SYMBOL_NS_GPL(intel_tcc_set_offset, "INTEL_TCC");
 
 /**
  * intel_tcc_get_temp() - returns the current temperature
@@ -303,4 +303,4 @@ int intel_tcc_get_temp(int cpu, int *temp, bool pkg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(intel_tcc_get_temp, INTEL_TCC);
+EXPORT_SYMBOL_NS_GPL(intel_tcc_get_temp, "INTEL_TCC");
diff --git a/drivers/thermal/intel/intel_tcc_cooling.c b/drivers/thermal/intel/intel_tcc_cooling.c
index 17110ffa80bb..9ff0ebdde0ef 100644
--- a/drivers/thermal/intel/intel_tcc_cooling.c
+++ b/drivers/thermal/intel/intel_tcc_cooling.c
@@ -118,7 +118,7 @@ static void __exit tcc_cooling_exit(void)
 
 module_exit(tcc_cooling_exit)
 
-MODULE_IMPORT_NS(INTEL_TCC);
+MODULE_IMPORT_NS("INTEL_TCC");
 MODULE_DESCRIPTION("TCC offset cooling device Driver");
 MODULE_AUTHOR("Zhang Rui <rui.zhang@intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/intel/x86_pkg_temp_thermal.c b/drivers/thermal/intel/x86_pkg_temp_thermal.c
index 65b33b56a9be..496abf8e55e0 100644
--- a/drivers/thermal/intel/x86_pkg_temp_thermal.c
+++ b/drivers/thermal/intel/x86_pkg_temp_thermal.c
@@ -524,7 +524,7 @@ static void __exit pkg_temp_thermal_exit(void)
 }
 module_exit(pkg_temp_thermal_exit)
 
-MODULE_IMPORT_NS(INTEL_TCC);
+MODULE_IMPORT_NS("INTEL_TCC");
 MODULE_DESCRIPTION("X86 PKG TEMP Thermal Driver");
 MODULE_AUTHOR("Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index f0e504fd866a..bc84d2fdaeb9 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -287,4 +287,4 @@ int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device
 }
 EXPORT_SYMBOL_GPL(devm_thermal_add_hwmon_sysfs);
 
-MODULE_IMPORT_NS(HWMON_THERMAL);
+MODULE_IMPORT_NS("HWMON_THERMAL");
diff --git a/drivers/tty/serial/8250/8250_exar.c b/drivers/tty/serial/8250/8250_exar.c
index b7a75db15249..70dfa0476abe 100644
--- a/drivers/tty/serial/8250/8250_exar.c
+++ b/drivers/tty/serial/8250/8250_exar.c
@@ -1786,7 +1786,7 @@ static struct pci_driver exar_pci_driver = {
 };
 module_pci_driver(exar_pci_driver);
 
-MODULE_IMPORT_NS(SERIAL_8250_PCI);
+MODULE_IMPORT_NS("SERIAL_8250_PCI");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Exar Serial Driver");
 MODULE_AUTHOR("Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>");
diff --git a/drivers/tty/serial/8250/8250_men_mcb.c b/drivers/tty/serial/8250/8250_men_mcb.c
index dc9e093b1cb3..a78ef35c8187 100644
--- a/drivers/tty/serial/8250/8250_men_mcb.c
+++ b/drivers/tty/serial/8250/8250_men_mcb.c
@@ -271,4 +271,4 @@ MODULE_AUTHOR("Michael Moese <michael.moese@men.de");
 MODULE_ALIAS("mcb:16z125");
 MODULE_ALIAS("mcb:16z025");
 MODULE_ALIAS("mcb:16z057");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/tty/serial/8250/8250_pci.c b/drivers/tty/serial/8250/8250_pci.c
index 6709b6a5f301..76bb823b7b11 100644
--- a/drivers/tty/serial/8250/8250_pci.c
+++ b/drivers/tty/serial/8250/8250_pci.c
@@ -6140,4 +6140,4 @@ module_pci_driver(serial_pci_driver);
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Generic 8250/16x50 PCI serial probe module");
 MODULE_DEVICE_TABLE(pci, serial_pci_tbl);
-MODULE_IMPORT_NS(SERIAL_8250_PCI);
+MODULE_IMPORT_NS("SERIAL_8250_PCI");
diff --git a/drivers/tty/serial/8250/8250_pci1xxxx.c b/drivers/tty/serial/8250/8250_pci1xxxx.c
index d3930bf32fe4..838f181f929b 100644
--- a/drivers/tty/serial/8250/8250_pci1xxxx.c
+++ b/drivers/tty/serial/8250/8250_pci1xxxx.c
@@ -812,7 +812,7 @@ module_pci_driver(pci1xxxx_pci_driver);
 
 static_assert((ARRAY_SIZE(logical_to_physical_port_idx) == PCI_SUBDEVICE_ID_EFAR_PCI1XXXX_1p3 + 1));
 
-MODULE_IMPORT_NS(SERIAL_8250_PCI);
+MODULE_IMPORT_NS("SERIAL_8250_PCI");
 MODULE_DESCRIPTION("Microchip Technology Inc. PCIe to UART module");
 MODULE_AUTHOR("Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>");
 MODULE_AUTHOR("Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>");
diff --git a/drivers/tty/serial/8250/8250_pcilib.c b/drivers/tty/serial/8250/8250_pcilib.c
index ea906d721b2c..246cba3c6738 100644
--- a/drivers/tty/serial/8250/8250_pcilib.c
+++ b/drivers/tty/serial/8250/8250_pcilib.c
@@ -36,6 +36,6 @@ int serial8250_pci_setup_port(struct pci_dev *dev, struct uart_8250_port *port,
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(serial8250_pci_setup_port, SERIAL_8250_PCI);
+EXPORT_SYMBOL_NS_GPL(serial8250_pci_setup_port, "SERIAL_8250_PCI");
 MODULE_DESCRIPTION("8250 PCI library");
 MODULE_LICENSE("GPL");
diff --git a/drivers/tty/serial/men_z135_uart.c b/drivers/tty/serial/men_z135_uart.c
index 4bff422bb1bc..9cc15449b673 100644
--- a/drivers/tty/serial/men_z135_uart.c
+++ b/drivers/tty/serial/men_z135_uart.c
@@ -920,4 +920,4 @@ MODULE_AUTHOR("Johannes Thumshirn <johannes.thumshirn@men.de>");
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("MEN 16z135 High Speed UART");
 MODULE_ALIAS("mcb:16z135");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/tty/serial/sc16is7xx_i2c.c b/drivers/tty/serial/sc16is7xx_i2c.c
index 3ed47c306d85..cd7de9e057b8 100644
--- a/drivers/tty/serial/sc16is7xx_i2c.c
+++ b/drivers/tty/serial/sc16is7xx_i2c.c
@@ -64,4 +64,4 @@ module_i2c_driver(sc16is7xx_i2c_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SC16IS7xx I2C interface driver");
-MODULE_IMPORT_NS(SERIAL_NXP_SC16IS7XX);
+MODULE_IMPORT_NS("SERIAL_NXP_SC16IS7XX");
diff --git a/drivers/tty/serial/sc16is7xx_spi.c b/drivers/tty/serial/sc16is7xx_spi.c
index 73df36f8a7fd..20d736b657b1 100644
--- a/drivers/tty/serial/sc16is7xx_spi.c
+++ b/drivers/tty/serial/sc16is7xx_spi.c
@@ -87,4 +87,4 @@ module_spi_driver(sc16is7xx_spi_driver);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SC16IS7xx SPI interface driver");
-MODULE_IMPORT_NS(SERIAL_NXP_SC16IS7XX);
+MODULE_IMPORT_NS("SERIAL_NXP_SC16IS7XX");
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2920f8000bbd..8f3ad9cf4a17 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -49,7 +49,7 @@
 
 #define DMABUF_ENQUEUE_TIMEOUT_MS 5000
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 /* Reference counter handling */
 static void ffs_data_get(struct ffs_data *ffs);
diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 65fc9319d5e7..620f8f0febb8 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -661,5 +661,5 @@ module_pci_driver(xhci_renesas_pci_driver);
 
 MODULE_DESCRIPTION("Renesas xHCI PCI Host Controller Driver");
 MODULE_FIRMWARE(RENESAS_FW_NAME);
-MODULE_IMPORT_NS(xhci);
+MODULE_IMPORT_NS("xhci");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index cb07cee9ed0c..13804a48a25c 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -656,7 +656,7 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pm_runtime_put_noidle(&dev->dev);
 	return retval;
 }
-EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, xhci);
+EXPORT_SYMBOL_NS_GPL(xhci_pci_common_probe, "xhci");
 
 static const struct pci_device_id pci_ids_reject[] = {
 	/* handled by xhci-pci-renesas */
@@ -700,7 +700,7 @@ void xhci_pci_remove(struct pci_dev *dev)
 	if (set_power_d3)
 		pci_set_power_state(dev, PCI_D3hot);
 }
-EXPORT_SYMBOL_NS_GPL(xhci_pci_remove, xhci);
+EXPORT_SYMBOL_NS_GPL(xhci_pci_remove, "xhci");
 
 /*
  * In some Intel xHCI controllers, in order to get D3 working,
diff --git a/drivers/usb/misc/usb-ljca.c b/drivers/usb/misc/usb-ljca.c
index 01ceafc4ab78..38398a30d970 100644
--- a/drivers/usb/misc/usb-ljca.c
+++ b/drivers/usb/misc/usb-ljca.c
@@ -372,7 +372,7 @@ int ljca_transfer(struct ljca_client *client, u8 cmd, const u8 *obuf,
 			 obuf, obuf_len, ibuf, ibuf_len, true,
 			 LJCA_WRITE_ACK_TIMEOUT_MS);
 }
-EXPORT_SYMBOL_NS_GPL(ljca_transfer, LJCA);
+EXPORT_SYMBOL_NS_GPL(ljca_transfer, "LJCA");
 
 int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const u8 *obuf,
 			u8 obuf_len)
@@ -380,7 +380,7 @@ int ljca_transfer_noack(struct ljca_client *client, u8 cmd, const u8 *obuf,
 	return ljca_send(client->adapter, client->type, cmd, obuf,
 			 obuf_len, NULL, 0, false, LJCA_WRITE_ACK_TIMEOUT_MS);
 }
-EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, LJCA);
+EXPORT_SYMBOL_NS_GPL(ljca_transfer_noack, "LJCA");
 
 int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t event_cb,
 			   void *context)
@@ -404,7 +404,7 @@ int ljca_register_event_cb(struct ljca_client *client, ljca_event_cb_t event_cb,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, LJCA);
+EXPORT_SYMBOL_NS_GPL(ljca_register_event_cb, "LJCA");
 
 void ljca_unregister_event_cb(struct ljca_client *client)
 {
@@ -417,7 +417,7 @@ void ljca_unregister_event_cb(struct ljca_client *client)
 
 	spin_unlock_irqrestore(&client->event_cb_lock, flags);
 }
-EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, LJCA);
+EXPORT_SYMBOL_NS_GPL(ljca_unregister_event_cb, "LJCA");
 
 static int ljca_match_device_ids(struct acpi_device *adev, void *data)
 {
diff --git a/drivers/usb/storage/alauda.c b/drivers/usb/storage/alauda.c
index a9d3c58ce7d9..6263c4e61678 100644
--- a/drivers/usb/storage/alauda.c
+++ b/drivers/usb/storage/alauda.c
@@ -36,7 +36,7 @@
 MODULE_DESCRIPTION("Driver for Alauda-based card readers");
 MODULE_AUTHOR("Daniel Drake <dsd@gentoo.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 /*
  * Status bytes
diff --git a/drivers/usb/storage/cypress_atacb.c b/drivers/usb/storage/cypress_atacb.c
index 30dfd0082474..2fce5f95be51 100644
--- a/drivers/usb/storage/cypress_atacb.c
+++ b/drivers/usb/storage/cypress_atacb.c
@@ -22,7 +22,7 @@
 MODULE_DESCRIPTION("SAT support for Cypress USB/ATA bridges with ATACB");
 MODULE_AUTHOR("Matthieu Castet <castet.matthieu@free.fr>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 /*
  * The table of devices
diff --git a/drivers/usb/storage/datafab.c b/drivers/usb/storage/datafab.c
index 3ea5601d16b8..bbfa2398b170 100644
--- a/drivers/usb/storage/datafab.c
+++ b/drivers/usb/storage/datafab.c
@@ -54,7 +54,7 @@
 MODULE_DESCRIPTION("Driver for Datafab USB Compact Flash reader");
 MODULE_AUTHOR("Jimmie Mayfield <mayfield+datafab@sackheads.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 struct datafab_info {
 	unsigned long   sectors;	/* total sector count */
diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
index a4bfbecbf16c..1e0e778542ec 100644
--- a/drivers/usb/storage/ene_ub6250.c
+++ b/drivers/usb/storage/ene_ub6250.c
@@ -26,7 +26,7 @@
 
 MODULE_DESCRIPTION("Driver for ENE UB6250 reader");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 MODULE_FIRMWARE(SD_INIT1_FIRMWARE);
 MODULE_FIRMWARE(SD_INIT2_FIRMWARE);
 MODULE_FIRMWARE(SD_RW_FIRMWARE);
diff --git a/drivers/usb/storage/freecom.c b/drivers/usb/storage/freecom.c
index cab27ba7a32a..a075620907b4 100644
--- a/drivers/usb/storage/freecom.c
+++ b/drivers/usb/storage/freecom.c
@@ -29,7 +29,7 @@
 MODULE_DESCRIPTION("Driver for Freecom USB/IDE adaptor");
 MODULE_AUTHOR("David Brown <usb-storage@davidb.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 #ifdef CONFIG_USB_STORAGE_DEBUG
 static void pdump(struct us_data *us, void *ibuffer, int length);
diff --git a/drivers/usb/storage/isd200.c b/drivers/usb/storage/isd200.c
index f2254eb3c0d7..a1669c35bad5 100644
--- a/drivers/usb/storage/isd200.c
+++ b/drivers/usb/storage/isd200.c
@@ -53,7 +53,7 @@
 MODULE_DESCRIPTION("Driver for In-System Design, Inc. ISD200 ASIC");
 MODULE_AUTHOR("Björn Stenberg <bjorn@haxx.se>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 static int isd200_Initialization(struct us_data *us);
 
diff --git a/drivers/usb/storage/jumpshot.c b/drivers/usb/storage/jumpshot.c
index 0e71a8f33c2b..39ca84d68591 100644
--- a/drivers/usb/storage/jumpshot.c
+++ b/drivers/usb/storage/jumpshot.c
@@ -51,7 +51,7 @@
 MODULE_DESCRIPTION("Driver for Lexar \"Jumpshot\" Compact Flash reader");
 MODULE_AUTHOR("Jimmie Mayfield <mayfield+usb@sackheads.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 /*
  * The table of devices
diff --git a/drivers/usb/storage/karma.c b/drivers/usb/storage/karma.c
index d6a5e54f2ca8..341d6839548a 100644
--- a/drivers/usb/storage/karma.c
+++ b/drivers/usb/storage/karma.c
@@ -23,7 +23,7 @@
 MODULE_DESCRIPTION("Driver for Rio Karma");
 MODULE_AUTHOR("Bob Copeland <me@bobcopeland.com>, Keith Bennett <keith@mcs.st-and.ac.uk>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 #define RIO_PREFIX "RIOP\x00"
 #define RIO_PREFIX_LEN 5
diff --git a/drivers/usb/storage/onetouch.c b/drivers/usb/storage/onetouch.c
index f97cf6cadb8e..5a8a1ffda0ec 100644
--- a/drivers/usb/storage/onetouch.c
+++ b/drivers/usb/storage/onetouch.c
@@ -25,7 +25,7 @@
 MODULE_DESCRIPTION("Maxtor USB OneTouch hard drive button driver");
 MODULE_AUTHOR("Nick Sillik <n.sillik@temple.edu>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 #define ONETOUCH_PKT_LEN        0x02
 #define ONETOUCH_BUTTON         KEY_PROG1
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 0c423916d7bf..3ea04aae8952 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -35,7 +35,7 @@
 MODULE_DESCRIPTION("Driver for Realtek USB Card Reader");
 MODULE_AUTHOR("wwang <wei_wang@realsil.com.cn>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 static int auto_delink_en = 1;
 module_param(auto_delink_en, int, S_IRUGO | S_IWUSR);
diff --git a/drivers/usb/storage/sddr09.c b/drivers/usb/storage/sddr09.c
index 03d1b9c69ea1..34d86a3c3439 100644
--- a/drivers/usb/storage/sddr09.c
+++ b/drivers/usb/storage/sddr09.c
@@ -47,7 +47,7 @@
 MODULE_DESCRIPTION("Driver for SanDisk SDDR-09 SmartMedia reader");
 MODULE_AUTHOR("Andries Brouwer <aeb@cwi.nl>, Robert Baruch <autophile@starband.net>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 static int usb_stor_sddr09_dpcm_init(struct us_data *us);
 static int sddr09_transport(struct scsi_cmnd *srb, struct us_data *us);
diff --git a/drivers/usb/storage/sddr55.c b/drivers/usb/storage/sddr55.c
index b8227478a7ad..516ccb65a6b1 100644
--- a/drivers/usb/storage/sddr55.c
+++ b/drivers/usb/storage/sddr55.c
@@ -29,7 +29,7 @@
 MODULE_DESCRIPTION("Driver for SanDisk SDDR-55 SmartMedia reader");
 MODULE_AUTHOR("Simon Munton");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 /*
  * The table of devices
diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
index e7c224b7c464..087c706bb315 100644
--- a/drivers/usb/storage/shuttle_usbat.c
+++ b/drivers/usb/storage/shuttle_usbat.c
@@ -48,7 +48,7 @@
 MODULE_DESCRIPTION("Driver for SCM Microsystems (a.k.a. Shuttle) USB-ATAPI cable");
 MODULE_AUTHOR("Daniel Drake <dsd@gentoo.org>, Robert Baruch <autophile@starband.net>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 
 /* Supported device types */
 #define USBAT_DEV_HP8200	0x01
diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
index 03043d567fa1..f9ad90ce7af4 100644
--- a/drivers/usb/storage/uas.c
+++ b/drivers/usb/storage/uas.c
@@ -1289,6 +1289,6 @@ module_exit(uas_exit);
 
 MODULE_DESCRIPTION("USB Attached SCSI driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(USB_STORAGE);
+MODULE_IMPORT_NS("USB_STORAGE");
 MODULE_AUTHOR(
 	"Hans de Goede <hdegoede@redhat.com>, Matthew Wilcox and Sarah Sharp");
diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index 67465fad5b4b..5dd5f5ad7686 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -347,4 +347,4 @@ module_driver(vfio_cdx_driver, cdx_driver_register, cdx_driver_unregister);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("VFIO for CDX devices - User Level meta-driver");
-MODULE_IMPORT_NS(CDX_BUS);
+MODULE_IMPORT_NS("CDX_BUS");
diff --git a/drivers/vfio/iommufd.c b/drivers/vfio/iommufd.c
index 82eba6966fa5..516294fd901b 100644
--- a/drivers/vfio/iommufd.c
+++ b/drivers/vfio/iommufd.c
@@ -7,8 +7,8 @@
 
 #include "vfio.h"
 
-MODULE_IMPORT_NS(IOMMUFD);
-MODULE_IMPORT_NS(IOMMUFD_VFIO);
+MODULE_IMPORT_NS("IOMMUFD");
+MODULE_IMPORT_NS("IOMMUFD_VFIO");
 
 bool vfio_iommufd_device_has_compat_ioas(struct vfio_device *vdev,
 					 struct iommufd_ctx *ictx)
diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index 242c23eef452..b1ca70ce7038 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -1447,7 +1447,7 @@ static struct pci_driver mlx5vf_pci_driver = {
 
 module_pci_driver(mlx5vf_pci_driver);
 
-MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS("IOMMUFD");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Max Gurtovoy <mgurtovoy@nvidia.com>");
 MODULE_AUTHOR("Yishai Hadas <yishaih@nvidia.com>");
diff --git a/drivers/vfio/pci/pds/pci_drv.c b/drivers/vfio/pci/pds/pci_drv.c
index 16e93b11ab1b..4923f1823126 100644
--- a/drivers/vfio/pci/pds/pci_drv.c
+++ b/drivers/vfio/pci/pds/pci_drv.c
@@ -187,7 +187,7 @@ static struct pci_driver pds_vfio_pci_driver = {
 
 module_pci_driver(pds_vfio_pci_driver);
 
-MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS("IOMMUFD");
 MODULE_DESCRIPTION(PDS_VFIO_DRV_DESCRIPTION);
 MODULE_AUTHOR("Brett Creeley <brett.creeley@amd.com>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/vfio/pci/qat/main.c b/drivers/vfio/pci/qat/main.c
index be3644ced17b..dfee5ddff8f3 100644
--- a/drivers/vfio/pci/qat/main.c
+++ b/drivers/vfio/pci/qat/main.c
@@ -697,4 +697,4 @@ module_pci_driver(qat_vf_vfio_pci_driver);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Xin Zeng <xin.zeng@intel.com>");
 MODULE_DESCRIPTION("QAT VFIO PCI - VFIO PCI driver with live migration support for Intel(R) QAT GEN4 device family");
-MODULE_IMPORT_NS(CRYPTO_QAT);
+MODULE_IMPORT_NS("CRYPTO_QAT");
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a5a62d9d963f..1fd261efc582 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1751,7 +1751,7 @@ static void __exit vfio_cleanup(void)
 module_init(vfio_init);
 module_exit(vfio_cleanup);
 
-MODULE_IMPORT_NS(IOMMUFD);
+MODULE_IMPORT_NS("IOMMUFD");
 MODULE_VERSION(DRIVER_VERSION);
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR(DRIVER_AUTHOR);
diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
index d295c2766025..0489b0615ceb 100644
--- a/drivers/video/backlight/ktd2801-backlight.c
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -122,7 +122,7 @@ static struct platform_driver ktd2801_backlight_driver = {
 };
 module_platform_driver(ktd2801_backlight_driver);
 
-MODULE_IMPORT_NS(EXPRESSWIRE);
+MODULE_IMPORT_NS("EXPRESSWIRE");
 MODULE_AUTHOR("Duje Mihanović <duje.mihanovic@skole.hr>");
 MODULE_DESCRIPTION("Kinetic KTD2801 Backlight Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/virtio/virtio_dma_buf.c b/drivers/virtio/virtio_dma_buf.c
index 3034a2f605c8..3fe1d03b0645 100644
--- a/drivers/virtio/virtio_dma_buf.c
+++ b/drivers/virtio/virtio_dma_buf.c
@@ -87,4 +87,4 @@ EXPORT_SYMBOL(virtio_dma_buf_get_uuid);
 
 MODULE_DESCRIPTION("dma-bufs for virtio exported objects");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
diff --git a/drivers/watchdog/menz69_wdt.c b/drivers/watchdog/menz69_wdt.c
index 0508a65acfa6..6e5e4e5c0b56 100644
--- a/drivers/watchdog/menz69_wdt.c
+++ b/drivers/watchdog/menz69_wdt.c
@@ -164,4 +164,4 @@ MODULE_AUTHOR("Johannes Thumshirn <jth@kernel.org>");
 MODULE_DESCRIPTION("Watchdog driver for the MEN z069 IP-Core");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("mcb:16z069");
-MODULE_IMPORT_NS(MCB);
+MODULE_IMPORT_NS("MCB");
diff --git a/drivers/xen/gntdev-dmabuf.c b/drivers/xen/gntdev-dmabuf.c
index 42adc2c1e06b..5453d86324f6 100644
--- a/drivers/xen/gntdev-dmabuf.c
+++ b/drivers/xen/gntdev-dmabuf.c
@@ -23,7 +23,7 @@
 #include "gntdev-common.h"
 #include "gntdev-dmabuf.h"
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 
 struct gntdev_dmabuf {
 	struct gntdev_dmabuf_priv *priv;
diff --git a/fs/efivarfs/vars.c b/fs/efivarfs/vars.c
index 3cc89bb624f0..f7d43c847ee9 100644
--- a/fs/efivarfs/vars.c
+++ b/fs/efivarfs/vars.c
@@ -22,7 +22,7 @@
 
 #include "internal.h"
 
-MODULE_IMPORT_NS(EFIVAR);
+MODULE_IMPORT_NS("EFIVAR");
 
 static bool
 validate_device_path(efi_char16_t *var_name, int match, u8 *buffer,
diff --git a/include/kunit/visibility.h b/include/kunit/visibility.h
index efff77b58dd6..7c34c8ffcf3b 100644
--- a/include/kunit/visibility.h
+++ b/include/kunit/visibility.h
@@ -20,12 +20,11 @@
     /**
      * EXPORT_SYMBOL_IF_KUNIT(symbol) - Exports symbol into
      * EXPORTED_FOR_KUNIT_TESTING namespace only if CONFIG_KUNIT is
-     * enabled. Must use MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING)
+     * enabled. Must use MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING")
      * in test file in order to use symbols.
      * @symbol: the symbol identifier to export
      */
-    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, \
-	    EXPORTED_FOR_KUNIT_TESTING)
+    #define EXPORT_SYMBOL_IF_KUNIT(symbol) EXPORT_SYMBOL_NS(symbol, "EXPORTED_FOR_KUNIT_TESTING")
 #else
     #define VISIBLE_IF_KUNIT static
     #define EXPORT_SYMBOL_IF_KUNIT(symbol)
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d5ee84c468b..d26e467ae9e4 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -40,7 +40,7 @@ struct irq_domain_ops;
 #include <asm/acpi.h>
 
 #ifdef CONFIG_ACPI_TABLE_LIB
-#define EXPORT_SYMBOL_ACPI_LIB(x) EXPORT_SYMBOL_NS_GPL(x, ACPI)
+#define EXPORT_SYMBOL_ACPI_LIB(x) EXPORT_SYMBOL_NS_GPL(x, "ACPI")
 #define __init_or_acpilib
 #define __initdata_or_acpilib
 #else
diff --git a/include/linux/export.h b/include/linux/export.h
index 0bbd02fd351d..f5f3950a1e42 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -67,7 +67,7 @@
 
 #define EXPORT_SYMBOL(sym)		_EXPORT_SYMBOL(sym, "")
 #define EXPORT_SYMBOL_GPL(sym)		_EXPORT_SYMBOL(sym, "GPL")
-#define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", __stringify(ns))
-#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", __stringify(ns))
+#define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
+#define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
 #endif /* _LINUX_EXPORT_H */
diff --git a/include/linux/fw_table.h b/include/linux/fw_table.h
index 3ff4c277296f..9bd605b87c4c 100644
--- a/include/linux/fw_table.h
+++ b/include/linux/fw_table.h
@@ -54,7 +54,7 @@ int cdat_table_parse(enum acpi_cdat_type type,
 #define EXPORT_SYMBOL_FWTBL_LIB(x) EXPORT_SYMBOL_ACPI_LIB(x)
 #define __init_or_fwtbl_lib __init_or_acpilib
 #else
-#define EXPORT_SYMBOL_FWTBL_LIB(x) EXPORT_SYMBOL_NS_GPL(x, CXL)
+#define EXPORT_SYMBOL_FWTBL_LIB(x) EXPORT_SYMBOL_NS_GPL(x, "CXL")
 #define __init_or_fwtbl_lib
 #endif
 
diff --git a/include/linux/module.h b/include/linux/module.h
index 88ecc5e9f523..dcb872510947 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -296,7 +296,7 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
  * files require multiple MODULE_FIRMWARE() specifiers */
 #define MODULE_FIRMWARE(_firmware) MODULE_INFO(firmware, _firmware)
 
-#define MODULE_IMPORT_NS(ns)	MODULE_INFO(import_ns, __stringify(ns))
+#define MODULE_IMPORT_NS(ns)	MODULE_INFO(import_ns, ns)
 
 struct notifier_block;
 
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 97b0e23363c8..e7f0260f15ad 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -385,7 +385,7 @@ const struct dev_pm_ops name = { \
 #ifdef CONFIG_PM
 #define _EXPORT_DEV_PM_OPS(name, license, ns)		_EXPORT_PM_OPS(name, license, ns)
 #define EXPORT_PM_FN_GPL(name)				EXPORT_SYMBOL_GPL(name)
-#define EXPORT_PM_FN_NS_GPL(name, ns)			EXPORT_SYMBOL_NS_GPL(name, ns)
+#define EXPORT_PM_FN_NS_GPL(name, ns)			EXPORT_SYMBOL_NS_GPL(name, "ns")
 #else
 #define _EXPORT_DEV_PM_OPS(name, license, ns)		_DISCARD_PM_OPS(name, license, ns)
 #define EXPORT_PM_FN_GPL(name)
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 8acd60b53f58..0681eb3d74fd 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -8,7 +8,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
 
-MODULE_IMPORT_NS(PWM);
+MODULE_IMPORT_NS("PWM");
 
 struct pwm_chip;
 
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42..7b329057997a 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -349,7 +349,7 @@ config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 	help
 	  Symbols exported with EXPORT_SYMBOL_NS*() are considered exported in
 	  a namespace. A module that makes use of a symbol exported with such a
-	  namespace is required to import the namespace via MODULE_IMPORT_NS().
+	  namespace is required to import the namespace via MODULE_IMPORT_NS("").
 	  There is no technical reason to enforce correct namespace imports,
 	  but it creates consistency between symbols defining namespaces and
 	  users importing namespaces they make use of. This option relaxes this
diff --git a/kernel/resource.c b/kernel/resource.c
index 4101016e8b20..c062bfad1a82 100644
--- a/kernel/resource.c
+++ b/kernel/resource.c
@@ -986,7 +986,7 @@ void insert_resource_expand_to_fit(struct resource *root, struct resource *new)
  * to use this interface. The former are built-in and only the latter,
  * CXL, is a module.
  */
-EXPORT_SYMBOL_NS_GPL(insert_resource_expand_to_fit, CXL);
+EXPORT_SYMBOL_NS_GPL(insert_resource_expand_to_fit, "CXL");
 
 /**
  * remove_resource - Remove a resource in the resource tree
diff --git a/lib/kunit/user_alloc.c b/lib/kunit/user_alloc.c
index ae935df09a5e..46951be018be 100644
--- a/lib/kunit/user_alloc.c
+++ b/lib/kunit/user_alloc.c
@@ -114,4 +114,4 @@ unsigned long kunit_vm_mmap(struct kunit *test, struct file *file,
 }
 EXPORT_SYMBOL_GPL(kunit_vm_mmap);
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
diff --git a/lib/test_firmware.c b/lib/test_firmware.c
index bcb32cbff188..211222e63328 100644
--- a/lib/test_firmware.c
+++ b/lib/test_firmware.c
@@ -27,7 +27,7 @@
 #include <linux/vmalloc.h>
 #include <linux/efi_embedded_fw.h>
 
-MODULE_IMPORT_NS(TEST_FIRMWARE);
+MODULE_IMPORT_NS("TEST_FIRMWARE");
 
 #define TEST_FIRMWARE_NAME	"test-firmware.bin"
 #define TEST_FIRMWARE_NUM_REQS	4
diff --git a/net/handshake/handshake-test.c b/net/handshake/handshake-test.c
index 34fd1d9b2db8..55442b2f518a 100644
--- a/net/handshake/handshake-test.c
+++ b/net/handshake/handshake-test.c
@@ -17,7 +17,7 @@
 #include <uapi/linux/handshake.h>
 #include "handshake.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static int test_accept_func(struct handshake_req *req, struct genl_info *info,
 			    int fd)
diff --git a/net/mac80211/tests/elems.c b/net/mac80211/tests/elems.c
index a413ba29f759..a53c55a879a8 100644
--- a/net/mac80211/tests/elems.c
+++ b/net/mac80211/tests/elems.c
@@ -7,7 +7,7 @@
 #include <kunit/test.h>
 #include "../ieee80211_i.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static void mle_defrag(struct kunit *test)
 {
diff --git a/net/mac80211/tests/mfp.c b/net/mac80211/tests/mfp.c
index a8dc1601da60..58e675e0ed91 100644
--- a/net/mac80211/tests/mfp.c
+++ b/net/mac80211/tests/mfp.c
@@ -9,7 +9,7 @@
 #include "../ieee80211_i.h"
 #include "../sta_info.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static const struct mfp_test_case {
 	const char *desc;
diff --git a/net/mac80211/tests/tpe.c b/net/mac80211/tests/tpe.c
index dd63303a2985..c73b6c66bd5a 100644
--- a/net/mac80211/tests/tpe.c
+++ b/net/mac80211/tests/tpe.c
@@ -7,7 +7,7 @@
 #include <kunit/test.h>
 #include "../ieee80211_i.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static struct ieee80211_channel chan6g_1 = {
 	.band = NL80211_BAND_6GHZ,
diff --git a/net/sunrpc/auth_gss/gss_krb5_test.c b/net/sunrpc/auth_gss/gss_krb5_test.c
index 85625e3f3814..a5bff02cd7ba 100644
--- a/net/sunrpc/auth_gss/gss_krb5_test.c
+++ b/net/sunrpc/auth_gss/gss_krb5_test.c
@@ -17,7 +17,7 @@
 
 #include "gss_krb5_internal.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 struct gss_krb5_test_param {
 	const char			*desc;
diff --git a/net/wireless/tests/chan.c b/net/wireless/tests/chan.c
index 74bbee25085f..7b97b731993c 100644
--- a/net/wireless/tests/chan.c
+++ b/net/wireless/tests/chan.c
@@ -7,7 +7,7 @@
 #include <net/cfg80211.h>
 #include <kunit/test.h>
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 static struct ieee80211_channel chan_6ghz_1 = {
 	.band = NL80211_BAND_6GHZ,
diff --git a/net/wireless/tests/scan.c b/net/wireless/tests/scan.c
index 9f458be71659..e12f620b5f42 100644
--- a/net/wireless/tests/scan.c
+++ b/net/wireless/tests/scan.c
@@ -14,7 +14,7 @@
 /* mac80211 helpers for element building */
 #include "../../mac80211/ieee80211_i.h"
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 struct test_elem {
 	u8 id;
diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 836456837997..18623ba666e3 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1469,6 +1469,6 @@ static void __exit mbochs_dev_exit(void)
 	class_unregister(&mbochs_class);
 }
 
-MODULE_IMPORT_NS(DMA_BUF);
+MODULE_IMPORT_NS("DMA_BUF");
 module_init(mbochs_dev_init)
 module_exit(mbochs_dev_exit)
diff --git a/scripts/coccinelle/misc/add_namespace.cocci b/scripts/coccinelle/misc/add_namespace.cocci
index cbf1614163cb..d66c4e3cd946 100644
--- a/scripts/coccinelle/misc/add_namespace.cocci
+++ b/scripts/coccinelle/misc/add_namespace.cocci
@@ -13,7 +13,7 @@ virtual report
 declarer name MODULE_IMPORT_NS;
 identifier virtual.ns;
 @@
-MODULE_IMPORT_NS(ns);
+MODULE_IMPORT_NS("ns");
 
 // Add missing imports, but only adjacent to a MODULE_LICENSE statement.
 // That ensures we are adding it only to the main module source file.
@@ -23,7 +23,7 @@ expression license;
 identifier virtual.ns;
 @@
 MODULE_LICENSE(license);
-+ MODULE_IMPORT_NS(ns);
++ MODULE_IMPORT_NS("ns");
 
 // Dummy rule for report mode that would otherwise be empty and make spatch
 // fail ("No rules apply.")
diff --git a/security/apparmor/policy_unpack_test.c b/security/apparmor/policy_unpack_test.c
index c64733d6c98f..97badf8011f4 100644
--- a/security/apparmor/policy_unpack_test.c
+++ b/security/apparmor/policy_unpack_test.c
@@ -44,7 +44,7 @@
 #define TEST_ARRAY_BUF_OFFSET \
 	(TEST_NAMED_ARRAY_BUF_OFFSET + 3 + strlen(TEST_ARRAY_NAME) + 1)
 
-MODULE_IMPORT_NS(EXPORTED_FOR_KUNIT_TESTING);
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
 
 struct policy_unpack_fixture {
 	struct aa_ext *e;
diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 9f849e05ce79..f564ec7af194 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -801,4 +801,4 @@ EXPORT_SYMBOL_GPL(snd_intel_acpi_dsp_driver_probe);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel DSP config driver");
-MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
+MODULE_IMPORT_NS("SND_INTEL_SOUNDWIRE_ACPI");
diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index ed530e0dd4dd..49d3e0e30073 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -198,7 +198,7 @@ int sdw_intel_acpi_scan(acpi_handle *parent_handle,
 
 	return sdw_intel_scan_controller(info);
 }
-EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, SND_INTEL_SOUNDWIRE_ACPI);
+EXPORT_SYMBOL_NS(sdw_intel_acpi_scan, "SND_INTEL_SOUNDWIRE_ACPI");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Intel Soundwire ACPI helpers");
diff --git a/sound/pci/hda/cirrus_scodec.c b/sound/pci/hda/cirrus_scodec.c
index 8de3bc7448fa..3c670207ba30 100644
--- a/sound/pci/hda/cirrus_scodec.c
+++ b/sound/pci/hda/cirrus_scodec.c
@@ -66,7 +66,7 @@ int cirrus_scodec_get_speaker_id(struct device *dev, int amp_index,
 
 	return speaker_id;
 }
-EXPORT_SYMBOL_NS_GPL(cirrus_scodec_get_speaker_id, SND_HDA_CIRRUS_SCODEC);
+EXPORT_SYMBOL_NS_GPL(cirrus_scodec_get_speaker_id, "SND_HDA_CIRRUS_SCODEC");
 
 MODULE_DESCRIPTION("HDA Cirrus side-codec library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
diff --git a/sound/pci/hda/cirrus_scodec_test.c b/sound/pci/hda/cirrus_scodec_test.c
index e925ebe21ccb..f5d6241daee4 100644
--- a/sound/pci/hda/cirrus_scodec_test.c
+++ b/sound/pci/hda/cirrus_scodec_test.c
@@ -365,7 +365,7 @@ static struct kunit_suite cirrus_scodec_test_suite = {
 
 kunit_test_suite(cirrus_scodec_test_suite);
 
-MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
+MODULE_IMPORT_NS("SND_HDA_CIRRUS_SCODEC");
 MODULE_DESCRIPTION("KUnit test for the Cirrus side-codec library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index d68bf7591d90..5dc021976c79 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -2019,7 +2019,7 @@ int cs35l41_hda_probe(struct device *dev, const char *device_name, int id, int i
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l41_hda_probe, SND_HDA_SCODEC_CS35L41);
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_probe, "SND_HDA_SCODEC_CS35L41");
 
 void cs35l41_hda_remove(struct device *dev)
 {
@@ -2044,7 +2044,7 @@ void cs35l41_hda_remove(struct device *dev)
 	gpiod_put(cs35l41->cs_gpio);
 	kfree(cs35l41->acpi_subsystem_id);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, SND_HDA_SCODEC_CS35L41);
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_remove, "SND_HDA_SCODEC_CS35L41");
 
 const struct dev_pm_ops cs35l41_hda_pm_ops = {
 	RUNTIME_PM_OPS(cs35l41_runtime_suspend, cs35l41_runtime_resume,
@@ -2052,11 +2052,11 @@ const struct dev_pm_ops cs35l41_hda_pm_ops = {
 	.prepare = cs35l41_system_suspend_prep,
 	SYSTEM_SLEEP_PM_OPS(cs35l41_system_suspend, cs35l41_system_resume)
 };
-EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, SND_HDA_SCODEC_CS35L41);
+EXPORT_SYMBOL_NS_GPL(cs35l41_hda_pm_ops, "SND_HDA_SCODEC_CS35L41");
 
 MODULE_DESCRIPTION("CS35L41 HDA Driver");
-MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
-MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_IMPORT_NS("SND_HDA_CS_DSP_CONTROLS");
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Lucas Tanure, Cirrus Logic Inc, <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(FW_CS_DSP);
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/pci/hda/cs35l41_hda_i2c.c b/sound/pci/hda/cs35l41_hda_i2c.c
index bb84740c8520..e77495413c21 100644
--- a/sound/pci/hda/cs35l41_hda_i2c.c
+++ b/sound/pci/hda/cs35l41_hda_i2c.c
@@ -64,6 +64,6 @@ static struct i2c_driver cs35l41_i2c_driver = {
 module_i2c_driver(cs35l41_i2c_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
-MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L41);
+MODULE_IMPORT_NS("SND_HDA_SCODEC_CS35L41");
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l41_hda_spi.c b/sound/pci/hda/cs35l41_hda_spi.c
index f8c356ad0d34..2acbaf8467a0 100644
--- a/sound/pci/hda/cs35l41_hda_spi.c
+++ b/sound/pci/hda/cs35l41_hda_spi.c
@@ -59,6 +59,6 @@ static struct spi_driver cs35l41_spi_driver = {
 module_spi_driver(cs35l41_spi_driver);
 
 MODULE_DESCRIPTION("HDA CS35L41 driver");
-MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L41);
+MODULE_IMPORT_NS("SND_HDA_SCODEC_CS35L41");
 MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l56_hda.c b/sound/pci/hda/cs35l56_hda.c
index e3ac0e23ae32..d96266c8cb38 100644
--- a/sound/pci/hda/cs35l56_hda.c
+++ b/sound/pci/hda/cs35l56_hda.c
@@ -1094,7 +1094,7 @@ int cs35l56_hda_common_probe(struct cs35l56_hda *cs35l56, int hid, int id)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_hda_common_probe, SND_HDA_SCODEC_CS35L56);
+EXPORT_SYMBOL_NS_GPL(cs35l56_hda_common_probe, "SND_HDA_SCODEC_CS35L56");
 
 void cs35l56_hda_remove(struct device *dev)
 {
@@ -1113,7 +1113,7 @@ void cs35l56_hda_remove(struct device *dev)
 
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_hda_remove, SND_HDA_SCODEC_CS35L56);
+EXPORT_SYMBOL_NS_GPL(cs35l56_hda_remove, "SND_HDA_SCODEC_CS35L56");
 
 const struct dev_pm_ops cs35l56_hda_pm_ops = {
 	RUNTIME_PM_OPS(cs35l56_hda_runtime_suspend, cs35l56_hda_runtime_resume, NULL)
@@ -1123,14 +1123,14 @@ const struct dev_pm_ops cs35l56_hda_pm_ops = {
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_hda_system_suspend_no_irq,
 				  cs35l56_hda_system_resume_no_irq)
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, SND_HDA_SCODEC_CS35L56);
+EXPORT_SYMBOL_NS_GPL(cs35l56_hda_pm_ops, "SND_HDA_SCODEC_CS35L56");
 
 MODULE_DESCRIPTION("CS35L56 HDA Driver");
-MODULE_IMPORT_NS(FW_CS_DSP);
-MODULE_IMPORT_NS(SND_HDA_CIRRUS_SCODEC);
-MODULE_IMPORT_NS(SND_HDA_CS_DSP_CONTROLS);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
-MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_IMPORT_NS("FW_CS_DSP");
+MODULE_IMPORT_NS("SND_HDA_CIRRUS_SCODEC");
+MODULE_IMPORT_NS("SND_HDA_CS_DSP_CONTROLS");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 40f2f97944d5..c7b836613149 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -77,8 +77,8 @@ static struct i2c_driver cs35l56_hda_i2c_driver = {
 module_i2c_driver(cs35l56_hda_i2c_driver);
 
 MODULE_DESCRIPTION("HDA CS35L56 I2C driver");
-MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L56);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS("SND_HDA_SCODEC_CS35L56");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/cs35l56_hda_spi.c b/sound/pci/hda/cs35l56_hda_spi.c
index 7f02155fe61e..d4ee5bb7c486 100644
--- a/sound/pci/hda/cs35l56_hda_spi.c
+++ b/sound/pci/hda/cs35l56_hda_spi.c
@@ -77,8 +77,8 @@ static struct spi_driver cs35l56_hda_spi_driver = {
 module_spi_driver(cs35l56_hda_spi_driver);
 
 MODULE_DESCRIPTION("HDA CS35L56 SPI driver");
-MODULE_IMPORT_NS(SND_HDA_SCODEC_CS35L56);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS("SND_HDA_SCODEC_CS35L56");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/pci/hda/hda_component.c b/sound/pci/hda/hda_component.c
index 2d6b7b0b355d..71860e2d6377 100644
--- a/sound/pci/hda/hda_component.c
+++ b/sound/pci/hda/hda_component.c
@@ -29,7 +29,7 @@ void hda_component_acpi_device_notify(struct hda_component_parent *parent,
 	}
 	mutex_unlock(&parent->mutex);
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_acpi_device_notify, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_acpi_device_notify, "SND_HDA_SCODEC_COMPONENT");
 
 int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
 						  struct hda_component_parent *parent,
@@ -64,7 +64,7 @@ int hda_component_manager_bind_acpi_notifications(struct hda_codec *cdc,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind_acpi_notifications, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind_acpi_notifications, "SND_HDA_SCODEC_COMPONENT");
 
 void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
 						     struct hda_component_parent *parent,
@@ -81,7 +81,7 @@ void hda_component_manager_unbind_acpi_notifications(struct hda_codec *cdc,
 	if (ret < 0)
 		codec_warn(cdc, "Failed to uninstall notify handler: %d\n", ret);
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_unbind_acpi_notifications, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_unbind_acpi_notifications, "SND_HDA_SCODEC_COMPONENT");
 #endif /* ifdef CONFIG_ACPI */
 
 void hda_component_manager_playback_hook(struct hda_component_parent *parent, int action)
@@ -107,7 +107,7 @@ void hda_component_manager_playback_hook(struct hda_component_parent *parent, in
 	}
 	mutex_unlock(&parent->mutex);
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_playback_hook, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_playback_hook, "SND_HDA_SCODEC_COMPONENT");
 
 struct hda_scodec_match {
 	const char *bus;
@@ -149,7 +149,7 @@ int hda_component_manager_bind(struct hda_codec *cdc,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_bind, "SND_HDA_SCODEC_COMPONENT");
 
 int hda_component_manager_init(struct hda_codec *cdc,
 			       struct hda_component_parent *parent, int count,
@@ -189,7 +189,7 @@ int hda_component_manager_init(struct hda_codec *cdc,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_init, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_init, "SND_HDA_SCODEC_COMPONENT");
 
 void hda_component_manager_free(struct hda_component_parent *parent,
 				const struct component_master_ops *ops)
@@ -205,7 +205,7 @@ void hda_component_manager_free(struct hda_component_parent *parent,
 
 	parent->codec = NULL;
 }
-EXPORT_SYMBOL_NS_GPL(hda_component_manager_free, SND_HDA_SCODEC_COMPONENT);
+EXPORT_SYMBOL_NS_GPL(hda_component_manager_free, "SND_HDA_SCODEC_COMPONENT");
 
 MODULE_DESCRIPTION("HD Audio component binding library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
diff --git a/sound/pci/hda/hda_cs_dsp_ctl.c b/sound/pci/hda/hda_cs_dsp_ctl.c
index deb74c247082..18fa6e7edb49 100644
--- a/sound/pci/hda/hda_cs_dsp_ctl.c
+++ b/sound/pci/hda/hda_cs_dsp_ctl.c
@@ -34,7 +34,7 @@ const char * const hda_cs_dsp_fw_ids[HDA_CS_DSP_NUM_FW] = {
 	[HDA_CS_DSP_FW_SPK_DIAG] = "spk-diag",
 	[HDA_CS_DSP_FW_MISC] =     "misc",
 };
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_fw_ids, SND_HDA_CS_DSP_CONTROLS);
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_fw_ids, "SND_HDA_CS_DSP_CONTROLS");
 
 static int hda_cs_dsp_coeff_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
 {
@@ -200,7 +200,7 @@ void hda_cs_dsp_add_controls(struct cs_dsp *dsp, const struct hda_cs_dsp_ctl_inf
 		hda_cs_dsp_control_add(cs_ctl, info);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_add_controls, SND_HDA_CS_DSP_CONTROLS);
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_add_controls, "SND_HDA_CS_DSP_CONTROLS");
 
 void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 {
@@ -210,7 +210,7 @@ void hda_cs_dsp_control_remove(struct cs_dsp_coeff_ctl *cs_ctl)
 	if (ctl)
 		snd_ctl_remove(ctl->card, ctl->kctl);
 }
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, SND_HDA_CS_DSP_CONTROLS);
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_control_remove, "SND_HDA_CS_DSP_CONTROLS");
 
 int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 			 unsigned int alg, const void *buf, size_t len)
@@ -227,7 +227,7 @@ int hda_cs_dsp_write_ctl(struct cs_dsp *dsp, const char *name, int type,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, SND_HDA_CS_DSP_CONTROLS);
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_write_ctl, "SND_HDA_CS_DSP_CONTROLS");
 
 int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 			unsigned int alg, void *buf, size_t len)
@@ -241,9 +241,9 @@ int hda_cs_dsp_read_ctl(struct cs_dsp *dsp, const char *name, int type,
 	return ret;
 
 }
-EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, SND_HDA_CS_DSP_CONTROLS);
+EXPORT_SYMBOL_NS_GPL(hda_cs_dsp_read_ctl, "SND_HDA_CS_DSP_CONTROLS");
 
 MODULE_DESCRIPTION("CS_DSP ALSA Control HDA Library");
 MODULE_AUTHOR("Stefan Binding, <sbinding@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(FW_CS_DSP);
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 571fa8a6c9e1..86bb67869efc 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -13339,7 +13339,7 @@ MODULE_DEVICE_TABLE(hdaudio, snd_hda_id_realtek);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Realtek HD-audio codec");
-MODULE_IMPORT_NS(SND_HDA_SCODEC_COMPONENT);
+MODULE_IMPORT_NS("SND_HDA_SCODEC_COMPONENT");
 
 static struct hda_codec_driver realtek_driver = {
 	.id = snd_hda_id_realtek,
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 370d847517f9..036715311703 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -977,4 +977,4 @@ module_i2c_driver(tas2781_hda_i2c_driver);
 MODULE_DESCRIPTION("TAS2781 HDA Driver");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_TAS2781_FMWLIB);
+MODULE_IMPORT_NS("SND_SOC_TAS2781_FMWLIB");
diff --git a/sound/soc/amd/acp/acp-i2s.c b/sound/soc/amd/acp/acp-i2s.c
index 56ce9e4b6acc..484227de62b5 100644
--- a/sound/soc/amd/acp/acp-i2s.c
+++ b/sound/soc/amd/acp/acp-i2s.c
@@ -694,7 +694,7 @@ const struct snd_soc_dai_ops asoc_acp_cpu_dai_ops = {
 	.set_fmt	= acp_i2s_set_fmt,
 	.set_tdm_slot	= acp_i2s_set_tdm_slot,
 };
-EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(asoc_acp_cpu_dai_ops, "SND_SOC_ACP_COMMON");
 
 MODULE_DESCRIPTION("AMD ACP Audio I2S controller");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index be01b178172e..a52d299fd2bc 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -31,7 +31,7 @@ void acp_enable_interrupts(struct acp_dev_data *adata)
 	ext_intr_ctrl |= ACP_ERROR_MASK;
 	writel(ext_intr_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, rsrc->irqp_used));
 }
-EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_enable_interrupts, "SND_SOC_ACP_COMMON");
 
 void acp_disable_interrupts(struct acp_dev_data *adata)
 {
@@ -40,7 +40,7 @@ void acp_disable_interrupts(struct acp_dev_data *adata)
 	writel(ACP_EXT_INTR_STAT_CLEAR_MASK, ACP_EXTERNAL_INTR_STAT(adata, rsrc->irqp_used));
 	writel(0x00, ACP_EXTERNAL_INTR_ENB(adata));
 }
-EXPORT_SYMBOL_NS_GPL(acp_disable_interrupts, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_disable_interrupts, "SND_SOC_ACP_COMMON");
 
 static void set_acp_pdm_ring_buffer(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
@@ -97,7 +97,7 @@ void restore_acp_pdm_params(struct snd_pcm_substream *substream,
 	writel(ext_int_ctrl, ACP_EXTERNAL_INTR_CNTL(adata, 0));
 	set_acp_pdm_clk(substream, dai);
 }
-EXPORT_SYMBOL_NS_GPL(restore_acp_pdm_params, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(restore_acp_pdm_params, "SND_SOC_ACP_COMMON");
 
 static int set_acp_i2s_dma_fifo(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
@@ -248,7 +248,7 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 	}
 	return set_acp_i2s_dma_fifo(substream, dai);
 }
-EXPORT_SYMBOL_NS_GPL(restore_acp_i2s_params, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(restore_acp_i2s_params, "SND_SOC_ACP_COMMON");
 
 static int acp_power_on(struct acp_chip_info *chip)
 {
@@ -326,7 +326,7 @@ int acp_init(struct acp_chip_info *chip)
 		writel(0, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_init, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_init, "SND_SOC_ACP_COMMON");
 
 int acp_deinit(struct acp_chip_info *chip)
 {
@@ -343,7 +343,7 @@ int acp_deinit(struct acp_chip_info *chip)
 		writel(0x01, chip->base + ACP_ZSC_DSP_CTRL);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_deinit, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_deinit, "SND_SOC_ACP_COMMON");
 
 int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
 {
@@ -351,7 +351,7 @@ int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
 	pci_write_config_dword(dev, 0x64, data);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(smn_write, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(smn_write, "SND_SOC_ACP_COMMON");
 
 int smn_read(struct pci_dev *dev, u32 smn_addr)
 {
@@ -361,7 +361,7 @@ int smn_read(struct pci_dev *dev, u32 smn_addr)
 	pci_read_config_dword(dev, 0x64, &data);
 	return data;
 }
-EXPORT_SYMBOL_NS_GPL(smn_read, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(smn_read, "SND_SOC_ACP_COMMON");
 
 static void check_acp3x_config(struct acp_chip_info *chip)
 {
@@ -479,7 +479,7 @@ void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip)
 		}
 	}
 }
-EXPORT_SYMBOL_NS_GPL(check_acp_config, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(check_acp_config, "SND_SOC_ACP_COMMON");
 
 MODULE_DESCRIPTION("AMD ACP legacy common features");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/acp/acp-legacy-mach.c b/sound/soc/amd/acp/acp-legacy-mach.c
index d104f7e8fdcd..cb73f4b7bcc5 100644
--- a/sound/soc/amd/acp/acp-legacy-mach.c
+++ b/sound/soc/amd/acp/acp-legacy-mach.c
@@ -240,6 +240,6 @@ static struct platform_driver acp_asoc_audio = {
 
 module_platform_driver(acp_asoc_audio);
 
-MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
+MODULE_IMPORT_NS("SND_SOC_AMD_MACH");
 MODULE_DESCRIPTION("ACP chrome audio support");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index e9ff4815c12c..dbf4693f0cd2 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -1585,7 +1585,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_sofdsp_dai_links_create, SND_SOC_AMD_MACH);
+EXPORT_SYMBOL_NS_GPL(acp_sofdsp_dai_links_create, "SND_SOC_AMD_MACH");
 
 int acp_legacy_dai_links_create(struct snd_soc_card *card)
 {
@@ -1783,7 +1783,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_legacy_dai_links_create, SND_SOC_AMD_MACH);
+EXPORT_SYMBOL_NS_GPL(acp_legacy_dai_links_create, "SND_SOC_AMD_MACH");
 
 MODULE_DESCRIPTION("AMD ACP Common Machine driver");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index f7450a5bd103..df9826417226 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -255,5 +255,5 @@ module_pci_driver(snd_amd_acp_pci_driver);
 
 MODULE_DESCRIPTION("AMD ACP common PCI support");
 MODULE_LICENSE("Dual BSD/GPL");
-MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_ACP_COMMON");
 MODULE_ALIAS(DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-pdm.c b/sound/soc/amd/acp/acp-pdm.c
index 22dd8988d005..06d76e156060 100644
--- a/sound/soc/amd/acp/acp-pdm.c
+++ b/sound/soc/amd/acp/acp-pdm.c
@@ -181,7 +181,7 @@ const struct snd_soc_dai_ops acp_dmic_dai_ops = {
 	.startup	= acp_dmic_dai_startup,
 	.shutdown	= acp_dmic_dai_shutdown,
 };
-EXPORT_SYMBOL_NS_GPL(acp_dmic_dai_ops, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_dmic_dai_ops, "SND_SOC_ACP_COMMON");
 
 MODULE_DESCRIPTION("AMD ACP Audio PDM controller");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 3a7a467b7063..4935950766d4 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -132,7 +132,7 @@ int acp_machine_select(struct acp_dev_data *adata)
 		dev_warn(adata->dev, "Unable to register Machine device\n");
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_machine_select, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_machine_select, "SND_SOC_ACP_COMMON");
 
 static irqreturn_t i2s_irq_handler(int irq, void *data)
 {
@@ -193,7 +193,7 @@ void config_pte_for_stream(struct acp_dev_data *adata, struct acp_stream *stream
 
 	writel(0x01, adata->acp_base + ACPAXI2AXI_ATU_CTRL);
 }
-EXPORT_SYMBOL_NS_GPL(config_pte_for_stream, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(config_pte_for_stream, "SND_SOC_ACP_COMMON");
 
 void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int size)
 {
@@ -252,7 +252,7 @@ void config_acp_dma(struct acp_dev_data *adata, struct acp_stream *stream, int s
 		addr += PAGE_SIZE;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(config_acp_dma, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(config_acp_dma, "SND_SOC_ACP_COMMON");
 
 static int acp_dma_open(struct snd_soc_component *component, struct snd_pcm_substream *substream)
 {
@@ -416,7 +416,7 @@ int acp_platform_register(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_platform_register, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_platform_register, "SND_SOC_ACP_COMMON");
 
 int acp_platform_unregister(struct device *dev)
 {
@@ -426,7 +426,7 @@ int acp_platform_unregister(struct device *dev)
 		platform_device_unregister(adata->mach_dev);
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(acp_platform_unregister, SND_SOC_ACP_COMMON);
+EXPORT_SYMBOL_NS_GPL(acp_platform_unregister, "SND_SOC_ACP_COMMON");
 
 MODULE_DESCRIPTION("AMD ACP PCM Driver");
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index 396434a45eea..8940ff684830 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -305,6 +305,6 @@ static struct platform_driver rembrandt_driver = {
 module_platform_driver(rembrandt_driver);
 
 MODULE_DESCRIPTION("AMD ACP Rembrandt Driver");
-MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_ACP_COMMON");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index 5e3f730aa6bf..a676a81974f8 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -254,6 +254,6 @@ static struct platform_driver renoir_driver = {
 module_platform_driver(renoir_driver);
 
 MODULE_DESCRIPTION("AMD ACP Renoir Driver");
-MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_ACP_COMMON");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 306854fb08e3..e6e4a065bb21 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -501,4 +501,4 @@ module_platform_driver(sof_sdw_driver);
 MODULE_DESCRIPTION("ASoC AMD SoundWire Generic Machine driver");
 MODULE_AUTHOR("Vijendar Mukunda <Vijendar.Mukunda@amd.com");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
+MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
diff --git a/sound/soc/amd/acp/acp-sof-mach.c b/sound/soc/amd/acp/acp-sof-mach.c
index f36750167fa2..71c1174caee6 100644
--- a/sound/soc/amd/acp/acp-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sof-mach.c
@@ -171,6 +171,6 @@ static struct platform_driver acp_asoc_audio = {
 
 module_platform_driver(acp_asoc_audio);
 
-MODULE_IMPORT_NS(SND_SOC_AMD_MACH);
+MODULE_IMPORT_NS("SND_SOC_AMD_MACH");
 MODULE_DESCRIPTION("ACP SOF Machine Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f325c374f228..4d56157578c1 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -314,6 +314,6 @@ static struct platform_driver acp63_driver = {
 module_platform_driver(acp63_driver);
 
 MODULE_DESCRIPTION("AMD ACP acp63 Driver");
-MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_ACP_COMMON");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 68d2590e1a4e..a9b904d7ef09 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -288,6 +288,6 @@ static struct platform_driver acp70_driver = {
 module_platform_driver(acp70_driver);
 
 MODULE_DESCRIPTION("AMD ACP ACP70 Driver");
-MODULE_IMPORT_NS(SND_SOC_ACP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_ACP_COMMON");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("platform:" DRV_NAME);
diff --git a/sound/soc/amd/acp/amd-sdw-acpi.c b/sound/soc/amd/acp/amd-sdw-acpi.c
index babd841d3296..238b584887ee 100644
--- a/sound/soc/amd/acp/amd-sdw-acpi.c
+++ b/sound/soc/amd/acp/amd-sdw-acpi.c
@@ -56,7 +56,7 @@ int amd_sdw_scan_controller(struct sdw_amd_acpi_info *info)
 	info->link_mask = sdw_bitmap;
 	return 0;
 }
-EXPORT_SYMBOL_NS(amd_sdw_scan_controller, SND_AMD_SOUNDWIRE_ACPI);
+EXPORT_SYMBOL_NS(amd_sdw_scan_controller, "SND_AMD_SOUNDWIRE_ACPI");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("AMD SoundWire ACPI helpers");
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index c72d666d51bd..62cd08ac9e12 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -751,6 +751,6 @@ module_pci_driver(ps_acp63_driver);
 MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
 MODULE_AUTHOR("Syed.SabaKareem@amd.com");
 MODULE_DESCRIPTION("AMD ACP Pink Sardine PCI driver");
-MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
-MODULE_IMPORT_NS(SND_AMD_SOUNDWIRE_ACPI);
+MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
+MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/codecs/cs-amp-lib-test.c b/sound/soc/codecs/cs-amp-lib-test.c
index a6e8348a1bd5..45626f99a417 100644
--- a/sound/soc/codecs/cs-amp-lib-test.c
+++ b/sound/soc/codecs/cs-amp-lib-test.c
@@ -756,7 +756,7 @@ static struct kunit_suite cs_amp_lib_test_suite = {
 
 kunit_test_suite(cs_amp_lib_test_suite);
 
-MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_DESCRIPTION("KUnit test for Cirrus Logic amplifier library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 51b128c80671..c677868c5d5f 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -97,7 +97,7 @@ int cs_amp_write_cal_coeffs(struct cs_dsp *dsp,
 	else
 		return -ENODEV;
 }
-EXPORT_SYMBOL_NS_GPL(cs_amp_write_cal_coeffs, SND_SOC_CS_AMP_LIB);
+EXPORT_SYMBOL_NS_GPL(cs_amp_write_cal_coeffs, "SND_SOC_CS_AMP_LIB");
 
 static efi_status_t cs_amp_get_efi_variable(efi_char16_t *name,
 					    efi_guid_t *guid,
@@ -270,7 +270,7 @@ int cs_amp_get_efi_calibration_data(struct device *dev, u64 target_uid, int amp_
 	else
 		return -ENOENT;
 }
-EXPORT_SYMBOL_NS_GPL(cs_amp_get_efi_calibration_data, SND_SOC_CS_AMP_LIB);
+EXPORT_SYMBOL_NS_GPL(cs_amp_get_efi_calibration_data, "SND_SOC_CS_AMP_LIB");
 
 static const struct cs_amp_test_hooks cs_amp_test_hook_ptrs = {
 	.get_efi_variable = cs_amp_get_efi_variable,
@@ -279,9 +279,9 @@ static const struct cs_amp_test_hooks cs_amp_test_hook_ptrs = {
 
 const struct cs_amp_test_hooks * const cs_amp_test_hooks =
 	PTR_IF(IS_ENABLED(CONFIG_SND_SOC_CS_AMP_LIB_TEST), &cs_amp_test_hook_ptrs);
-EXPORT_SYMBOL_NS_GPL(cs_amp_test_hooks, SND_SOC_CS_AMP_LIB);
+EXPORT_SYMBOL_NS_GPL(cs_amp_test_hooks, "SND_SOC_CS_AMP_LIB");
 
 MODULE_DESCRIPTION("Cirrus Logic amplifier library");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(FW_CS_DSP);
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index f5fc42dcc8c7..a09aa3b92ae1 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -73,4 +73,4 @@ module_i2c_driver(cs35l45_i2c_driver);
 MODULE_DESCRIPTION("I2C CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS35L45);
+MODULE_IMPORT_NS("SND_SOC_CS35L45");
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index 39e203a5f060..5f91472c3fd2 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -75,4 +75,4 @@ module_spi_driver(cs35l45_spi_driver);
 MODULE_DESCRIPTION("SPI CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS35L45);
+MODULE_IMPORT_NS("SND_SOC_CS35L45");
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 405dab137b3b..d2ecc7b3f619 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -38,7 +38,7 @@ int cs35l45_apply_patch(struct cs35l45_private *cs35l45)
 	return regmap_register_patch(cs35l45->regmap, cs35l45_patch,
 				     ARRAY_SIZE(cs35l45_patch));
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, "SND_SOC_CS35L45");
 
 static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_BLOCK_ENABLES,		0x00003323 },
@@ -260,7 +260,7 @@ const struct regmap_config cs35l45_i2c_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, "SND_SOC_CS35L45");
 
 const struct regmap_config cs35l45_spi_regmap = {
 	.reg_bits = 32,
@@ -276,7 +276,7 @@ const struct regmap_config cs35l45_spi_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, "SND_SOC_CS35L45");
 
 static const struct {
 	u8 cfg_id;
@@ -329,4 +329,4 @@ int cs35l45_get_clk_freq_id(unsigned int freq)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, "SND_SOC_CS35L45");
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index fa1d9d9151f9..432a19f4de2b 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -1486,7 +1486,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_probe, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_probe, "SND_SOC_CS35L45");
 
 void cs35l45_remove(struct cs35l45_private *cs35l45)
 {
@@ -1501,7 +1501,7 @@ void cs35l45_remove(struct cs35l45_private *cs35l45)
 	/* VDD_BATT must be the last to power-off */
 	regulator_disable(cs35l45->vdd_batt);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l45_remove, SND_SOC_CS35L45);
+EXPORT_SYMBOL_NS_GPL(cs35l45_remove, "SND_SOC_CS35L45");
 
 EXPORT_GPL_DEV_PM_OPS(cs35l45_pm_ops) = {
 	RUNTIME_PM_OPS(cs35l45_runtime_suspend, cs35l45_runtime_resume, NULL)
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 2bd2ff75cd50..8a518df1e16e 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -84,8 +84,8 @@ static struct i2c_driver cs35l56_i2c_driver = {
 module_i2c_driver(cs35l56_i2c_driver);
 
 MODULE_DESCRIPTION("ASoC CS35L56 I2C driver");
-MODULE_IMPORT_NS(SND_SOC_CS35L56_CORE);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS("SND_SOC_CS35L56_CORE");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 7c9a17fe2195..3f91cb3f9ae7 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -582,8 +582,8 @@ static struct sdw_driver cs35l56_sdw_driver = {
 module_sdw_driver(cs35l56_sdw_driver);
 
 MODULE_DESCRIPTION("ASoC CS35L56 SoundWire driver");
-MODULE_IMPORT_NS(SND_SOC_CS35L56_CORE);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS("SND_SOC_CS35L56_CORE");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index e45e9ae01bc6..e0ed4fc11155 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -49,7 +49,7 @@ int cs35l56_set_patch(struct cs35l56_base *cs35l56_base)
 	return regmap_register_patch(cs35l56_base->regmap, cs35l56_patch,
 				     ARRAY_SIZE(cs35l56_patch));
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_set_patch, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_default cs35l56_reg_defaults[] = {
 	/* no defaults for OTP_MEM - first read populates cache */
@@ -241,7 +241,7 @@ int cs35l56_mbox_send(struct cs35l56_base *cs35l56_base, unsigned int command)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_mbox_send, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_mbox_send, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base)
 {
@@ -261,7 +261,7 @@ int cs35l56_firmware_shutdown(struct cs35l56_base *cs35l56_base)
 			val, ret);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_firmware_shutdown, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_firmware_shutdown, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 {
@@ -287,21 +287,21 @@ int cs35l56_wait_for_firmware_boot(struct cs35l56_base *cs35l56_base)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_wait_for_firmware_boot, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_wait_for_firmware_boot, "SND_SOC_CS35L56_SHARED");
 
 void cs35l56_wait_control_port_ready(void)
 {
 	/* Wait for control port to be ready (datasheet tIRS). */
 	usleep_range(CS35L56_CONTROL_PORT_READY_US, 2 * CS35L56_CONTROL_PORT_READY_US);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_wait_control_port_ready, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_wait_control_port_ready, "SND_SOC_CS35L56_SHARED");
 
 void cs35l56_wait_min_reset_pulse(void)
 {
 	/* Satisfy minimum reset pulse width spec */
 	usleep_range(CS35L56_RESET_PULSE_MIN_US, 2 * CS35L56_RESET_PULSE_MIN_US);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_wait_min_reset_pulse, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_wait_min_reset_pulse, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP1_HALO_STATE, 0),
@@ -327,7 +327,7 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 
 	/* Leave in cache-only. This will be revoked when the chip has rebooted. */
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
 {
@@ -346,7 +346,7 @@ int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq_request, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_irq_request, "SND_SOC_CS35L56_SHARED");
 
 irqreturn_t cs35l56_irq(int irq, void *data)
 {
@@ -413,7 +413,7 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 {
@@ -444,7 +444,7 @@ int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_is_fw_reload_needed, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_is_fw_reload_needed, "SND_SOC_CS35L56_SHARED");
 
 static const struct reg_sequence cs35l56_hibernate_seq[] = {
 	/* This must be the last register access */
@@ -513,7 +513,7 @@ int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_suspend_common, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_suspend_common, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 {
@@ -565,7 +565,7 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, "SND_SOC_CS35L56_SHARED");
 
 static const struct cs_dsp_region cs35l56_dsp1_regions[] = {
 	{ .type = WMFW_HALO_PM_PACKED,	.base = CS35L56_DSP1_PMEM_0 },
@@ -588,7 +588,7 @@ void cs35l56_init_cs_dsp(struct cs35l56_base *cs35l56_base, struct cs_dsp *cs_ds
 	cs_dsp->num_mems = ARRAY_SIZE(cs35l56_dsp1_regions);
 	cs_dsp->no_core_startstop = true;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_init_cs_dsp, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_init_cs_dsp, "SND_SOC_CS35L56_SHARED");
 
 struct cs35l56_pte {
 	u8 x;
@@ -634,7 +634,7 @@ const struct cirrus_amp_cal_controls cs35l56_calibration_controls = {
 	.status =	"CAL_STATUS",
 	.checksum =	"CAL_CHECKSUM",
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_calibration_controls, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_calibration_controls, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
 {
@@ -664,7 +664,7 @@ int cs35l56_get_calibration(struct cs35l56_base *cs35l56_base)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_get_calibration, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_get_calibration, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 			     bool *fw_missing, unsigned int *fw_version)
@@ -688,7 +688,7 @@ int cs35l56_read_prot_status(struct cs35l56_base *cs35l56_base,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_read_prot_status, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_read_prot_status, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 {
@@ -774,7 +774,7 @@ int cs35l56_hw_init(struct cs35l56_base *cs35l56_base)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_hw_init, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_hw_init, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base)
 {
@@ -816,7 +816,7 @@ int cs35l56_get_speaker_id(struct cs35l56_base *cs35l56_base)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_get_speaker_id, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_get_speaker_id, "SND_SOC_CS35L56_SHARED");
 
 static const u32 cs35l56_bclk_valid_for_pll_freq_table[] = {
 	[0x0C] = 128000,
@@ -865,7 +865,7 @@ int cs35l56_get_bclk_freq_id(unsigned int freq)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_get_bclk_freq_id, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_get_bclk_freq_id, "SND_SOC_CS35L56_SHARED");
 
 static const char * const cs35l56_supplies[/* auto-sized */] = {
 	"VDD_P",
@@ -881,7 +881,7 @@ void cs35l56_fill_supply_names(struct regulator_bulk_data *data)
 	for (i = 0; i < ARRAY_SIZE(cs35l56_supplies); i++)
 		data[i].supply = cs35l56_supplies[i];
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_fill_supply_names, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_fill_supply_names, "SND_SOC_CS35L56_SHARED");
 
 const char * const cs35l56_tx_input_texts[] = {
 	"None", "ASP1RX1", "ASP1RX2", "VMON", "IMON", "ERRVOL", "CLASSH",
@@ -889,7 +889,7 @@ const char * const cs35l56_tx_input_texts[] = {
 	"DSP1TX5", "DSP1TX6", "DSP1TX7", "DSP1TX8", "TEMPMON",
 	"INTERPOLATOR", "SDW1RX1", "SDW1RX2",
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_tx_input_texts, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_tx_input_texts, "SND_SOC_CS35L56_SHARED");
 
 const unsigned int cs35l56_tx_input_values[] = {
 	CS35L56_INPUT_SRC_NONE,
@@ -914,7 +914,7 @@ const unsigned int cs35l56_tx_input_values[] = {
 	CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL1,
 	CS35L56_INPUT_SRC_SWIRE_DP1_CHANNEL2,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_tx_input_values, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_tx_input_values, "SND_SOC_CS35L56_SHARED");
 
 const struct regmap_config cs35l56_regmap_i2c = {
 	.reg_bits = 32,
@@ -930,7 +930,7 @@ const struct regmap_config cs35l56_regmap_i2c = {
 	.precious_reg = cs35l56_precious_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_i2c, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_i2c, "SND_SOC_CS35L56_SHARED");
 
 const struct regmap_config cs35l56_regmap_spi = {
 	.reg_bits = 32,
@@ -947,7 +947,7 @@ const struct regmap_config cs35l56_regmap_spi = {
 	.precious_reg = cs35l56_precious_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_spi, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_spi, "SND_SOC_CS35L56_SHARED");
 
 const struct regmap_config cs35l56_regmap_sdw = {
 	.reg_bits = 32,
@@ -963,10 +963,10 @@ const struct regmap_config cs35l56_regmap_sdw = {
 	.precious_reg = cs35l56_precious_reg,
 	.cache_type = REGCACHE_MAPLE,
 };
-EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, SND_SOC_CS35L56_SHARED);
+EXPORT_SYMBOL_NS_GPL(cs35l56_regmap_sdw, "SND_SOC_CS35L56_SHARED");
 
 MODULE_DESCRIPTION("ASoC CS35L56 Shared");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
diff --git a/sound/soc/codecs/cs35l56-spi.c b/sound/soc/codecs/cs35l56-spi.c
index b07b798b0b45..c101134e8532 100644
--- a/sound/soc/codecs/cs35l56-spi.c
+++ b/sound/soc/codecs/cs35l56-spi.c
@@ -82,8 +82,8 @@ static struct spi_driver cs35l56_spi_driver = {
 module_spi_driver(cs35l56_spi_driver);
 
 MODULE_DESCRIPTION("ASoC CS35L56 SPI driver");
-MODULE_IMPORT_NS(SND_SOC_CS35L56_CORE);
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
+MODULE_IMPORT_NS("SND_SOC_CS35L56_CORE");
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 757ade6373ed..ae045c88c48d 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1341,7 +1341,7 @@ int cs35l56_common_probe(struct cs35l56_private *cs35l56)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, SND_SOC_CS35L56_CORE);
+EXPORT_SYMBOL_NS_GPL(cs35l56_common_probe, "SND_SOC_CS35L56_CORE");
 
 int cs35l56_init(struct cs35l56_private *cs35l56)
 {
@@ -1422,7 +1422,7 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_init, SND_SOC_CS35L56_CORE);
+EXPORT_SYMBOL_NS_GPL(cs35l56_init, "SND_SOC_CS35L56_CORE");
 
 void cs35l56_remove(struct cs35l56_private *cs35l56)
 {
@@ -1447,7 +1447,7 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 	gpiod_set_value_cansleep(cs35l56->base.reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs35l56->supplies), cs35l56->supplies);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_remove, SND_SOC_CS35L56_CORE);
+EXPORT_SYMBOL_NS_GPL(cs35l56_remove, "SND_SOC_CS35L56_CORE");
 
 #if IS_ENABLED(CONFIG_SND_SOC_CS35L56_I2C) || IS_ENABLED(CONFIG_SND_SOC_CS35L56_SPI)
 EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
@@ -1459,8 +1459,8 @@ EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
 #endif
 
 MODULE_DESCRIPTION("ASoC CS35L56 driver");
-MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
-MODULE_IMPORT_NS(SND_SOC_CS_AMP_LIB);
+MODULE_IMPORT_NS("SND_SOC_CS35L56_SHARED");
+MODULE_IMPORT_NS("SND_SOC_CS_AMP_LIB");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_AUTHOR("Simon Trimmer <simont@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs42l42-i2c.c b/sound/soc/codecs/cs42l42-i2c.c
index 8d10f9328e02..8a1d5c7a61d7 100644
--- a/sound/soc/codecs/cs42l42-i2c.c
+++ b/sound/soc/codecs/cs42l42-i2c.c
@@ -101,4 +101,4 @@ module_i2c_driver(cs42l42_i2c_driver);
 MODULE_DESCRIPTION("ASoC CS42L42 I2C driver");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS42L42_CORE);
+MODULE_IMPORT_NS("SND_SOC_CS42L42_CORE");
diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index 29891c1f6bec..ae1401b250a3 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -622,4 +622,4 @@ module_sdw_driver(cs42l42_sdw_driver);
 MODULE_DESCRIPTION("ASoC CS42L42 SoundWire driver");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS42L42_CORE);
+MODULE_IMPORT_NS("SND_SOC_CS42L42_CORE");
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 6400ac875e6f..501c951cc327 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -329,7 +329,7 @@ bool cs42l42_readable_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_readable_register, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_readable_register, "SND_SOC_CS42L42_CORE");
 
 bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 {
@@ -363,7 +363,7 @@ bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_volatile_register, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_volatile_register, "SND_SOC_CS42L42_CORE");
 
 const struct regmap_range_cfg cs42l42_page_range = {
 	.name = "Pages",
@@ -375,7 +375,7 @@ const struct regmap_range_cfg cs42l42_page_range = {
 	.window_start = 0,
 	.window_len = 256,
 };
-EXPORT_SYMBOL_NS_GPL(cs42l42_page_range, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_page_range, "SND_SOC_CS42L42_CORE");
 
 const struct regmap_config cs42l42_regmap = {
 	.reg_bits = 8,
@@ -395,7 +395,7 @@ const struct regmap_config cs42l42_regmap = {
 	.use_single_read = true,
 	.use_single_write = true,
 };
-EXPORT_SYMBOL_NS_GPL(cs42l42_regmap, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_regmap, "SND_SOC_CS42L42_CORE");
 
 static DECLARE_TLV_DB_SCALE(adc_tlv, -9700, 100, true);
 static DECLARE_TLV_DB_SCALE(mixer_tlv, -6300, 100, true);
@@ -596,7 +596,7 @@ const struct snd_soc_component_driver cs42l42_soc_component = {
 	.num_controls		= ARRAY_SIZE(cs42l42_snd_controls),
 	.endianness		= 1,
 };
-EXPORT_SYMBOL_NS_GPL(cs42l42_soc_component, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_soc_component, "SND_SOC_CS42L42_CORE");
 
 /* Switch to SCLK. Atomic delay after the write to allow the switch to complete. */
 static const struct reg_sequence cs42l42_to_sclk_seq[] = {
@@ -748,7 +748,7 @@ int cs42l42_pll_config(struct snd_soc_component *component, unsigned int clk,
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_pll_config, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_pll_config, "SND_SOC_CS42L42_CORE");
 
 void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample_rate)
 {
@@ -782,7 +782,7 @@ void cs42l42_src_config(struct snd_soc_component *component, unsigned int sample
 				      CS42L42_CLK_OASRC_SEL_MASK,
 				      fs << CS42L42_CLK_OASRC_SEL_SHIFT);
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_src_config, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_src_config, "SND_SOC_CS42L42_CORE");
 
 static int cs42l42_asp_config(struct snd_soc_component *component,
 			      unsigned int sclk, unsigned int sample_rate)
@@ -1116,7 +1116,7 @@ int cs42l42_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_mute_stream, "SND_SOC_CS42L42_CORE");
 
 #define CS42L42_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE |\
@@ -1151,7 +1151,7 @@ struct snd_soc_dai_driver cs42l42_dai = {
 		.symmetric_sample_bits = 1,
 		.ops = &cs42l42_ops,
 };
-EXPORT_SYMBOL_NS_GPL(cs42l42_dai, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_dai, "SND_SOC_CS42L42_CORE");
 
 static void cs42l42_manual_hs_type_detect(struct cs42l42_private *cs42l42)
 {
@@ -1780,7 +1780,7 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
 static void cs42l42_set_interrupt_masks(struct cs42l42_private *cs42l42)
 {
@@ -2211,7 +2211,7 @@ int cs42l42_suspend(struct device *dev)
 	return 0;
 
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_suspend, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_suspend, "SND_SOC_CS42L42_CORE");
 
 int cs42l42_resume(struct device *dev)
 {
@@ -2242,7 +2242,7 @@ int cs42l42_resume(struct device *dev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_resume, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_resume, "SND_SOC_CS42L42_CORE");
 
 void cs42l42_resume_restore(struct device *dev)
 {
@@ -2261,7 +2261,7 @@ void cs42l42_resume_restore(struct device *dev)
 
 	dev_dbg(dev, "System resumed\n");
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_resume_restore, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_resume_restore, "SND_SOC_CS42L42_CORE");
 
 static int __maybe_unused cs42l42_i2c_resume(struct device *dev)
 {
@@ -2370,7 +2370,7 @@ int cs42l42_common_probe(struct cs42l42_private *cs42l42,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_common_probe, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_common_probe, "SND_SOC_CS42L42_CORE");
 
 int cs42l42_init(struct cs42l42_private *cs42l42)
 {
@@ -2464,7 +2464,7 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 				cs42l42->supplies);
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_init, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_init, "SND_SOC_CS42L42_CORE");
 
 void cs42l42_common_remove(struct cs42l42_private *cs42l42)
 {
@@ -2484,7 +2484,7 @@ void cs42l42_common_remove(struct cs42l42_private *cs42l42)
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
 	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
 }
-EXPORT_SYMBOL_NS_GPL(cs42l42_common_remove, SND_SOC_CS42L42_CORE);
+EXPORT_SYMBOL_NS_GPL(cs42l42_common_remove, "SND_SOC_CS42L42_CORE");
 
 MODULE_DESCRIPTION("ASoC CS42L42 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
diff --git a/sound/soc/codecs/cs42l43-sdw.c b/sound/soc/codecs/cs42l43-sdw.c
index 60c00c05da05..336e88a7a987 100644
--- a/sound/soc/codecs/cs42l43-sdw.c
+++ b/sound/soc/codecs/cs42l43-sdw.c
@@ -42,7 +42,7 @@ int cs42l43_sdw_add_peripheral(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_add_peripheral, SND_SOC_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_add_peripheral, "SND_SOC_CS42L43");
 
 int cs42l43_sdw_remove_peripheral(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
@@ -56,7 +56,7 @@ int cs42l43_sdw_remove_peripheral(struct snd_pcm_substream *substream,
 
 	return sdw_stream_remove_slave(sdw, sdw_stream);
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_remove_peripheral, SND_SOC_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_remove_peripheral, "SND_SOC_CS42L43");
 
 int cs42l43_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream, int direction)
 {
@@ -64,7 +64,7 @@ int cs42l43_sdw_set_stream(struct snd_soc_dai *dai, void *sdw_stream, int direct
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_set_stream, SND_SOC_CS42L43);
+EXPORT_SYMBOL_NS_GPL(cs42l43_sdw_set_stream, "SND_SOC_CS42L43");
 
 MODULE_DESCRIPTION("CS42L43 CODEC SoundWire Driver");
 MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index d0098b4558b5..22890d391493 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2466,7 +2466,7 @@ static struct platform_driver cs42l43_codec_driver = {
 };
 module_platform_driver(cs42l43_codec_driver);
 
-MODULE_IMPORT_NS(SND_SOC_CS42L43);
+MODULE_IMPORT_NS("SND_SOC_CS42L43");
 
 MODULE_DESCRIPTION("CS42L43 CODEC Driver");
 MODULE_AUTHOR("Charles Keepax <ckeepax@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/cs42l83-i2c.c b/sound/soc/codecs/cs42l83-i2c.c
index f482b6a4f5c3..42c3e1efdc08 100644
--- a/sound/soc/codecs/cs42l83-i2c.c
+++ b/sound/soc/codecs/cs42l83-i2c.c
@@ -237,4 +237,4 @@ module_i2c_driver(cs42l83_i2c_driver);
 MODULE_DESCRIPTION("ASoC CS42L83 I2C driver");
 MODULE_AUTHOR("Martin Povišer <povik+lin@cutebit.org>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_CS42L42_CORE);
+MODULE_IMPORT_NS("SND_SOC_CS42L42_CORE");
diff --git a/sound/soc/codecs/cs530x-i2c.c b/sound/soc/codecs/cs530x-i2c.c
index 56659bf735db..22b1a4d6b61c 100644
--- a/sound/soc/codecs/cs530x-i2c.c
+++ b/sound/soc/codecs/cs530x-i2c.c
@@ -67,6 +67,6 @@ static struct i2c_driver cs530x_i2c_driver = {
 module_i2c_driver(cs530x_i2c_driver);
 
 MODULE_DESCRIPTION("I2C CS530X driver");
-MODULE_IMPORT_NS(SND_SOC_CS530X);
+MODULE_IMPORT_NS("SND_SOC_CS530X");
 MODULE_AUTHOR("Paul Handrigan, Cirrus Logic Inc, <paulha@opensource.cirrus.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index da52afe56c3c..252e66c8449e 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -821,7 +821,7 @@ const struct regmap_config cs530x_regmap = {
 	.reg_defaults = cs530x_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(cs530x_reg_defaults),
 };
-EXPORT_SYMBOL_NS_GPL(cs530x_regmap, SND_SOC_CS530X);
+EXPORT_SYMBOL_NS_GPL(cs530x_regmap, "SND_SOC_CS530X");
 
 static int cs530x_check_device_id(struct cs530x_priv *cs530x)
 {
@@ -964,7 +964,7 @@ int cs530x_probe(struct cs530x_priv *cs530x)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(cs530x_probe, SND_SOC_CS530X);
+EXPORT_SYMBOL_NS_GPL(cs530x_probe, "SND_SOC_CS530X");
 
 MODULE_DESCRIPTION("CS530X CODEC Driver");
 MODULE_AUTHOR("Paul Handrigan <paulha@opensource.cirrus.com>");
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index ae360c97fe1e..feccc9656974 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -374,7 +374,7 @@ int tasdevice_rca_parser(void *context, const struct firmware *fmw)
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_rca_parser, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_rca_parser, "SND_SOC_TAS2781_FMWLIB");
 
 /* fixed m68k compiling issue: mapping table can save code field */
 static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
@@ -862,7 +862,7 @@ void tasdevice_select_cfg_blk(void *pContext, int conf_no,
 				__func__, length, blk_data[j]->block_size);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_select_cfg_blk, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_select_cfg_blk, "SND_SOC_TAS2781_FMWLIB");
 
 static int tasdevice_load_block_kernel(
 	struct tasdevice_priv *tasdevice, struct tasdev_blk *block)
@@ -1943,7 +1943,7 @@ int tas2781_load_calibration(void *context, char *file_name,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tas2781_load_calibration, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tas2781_load_calibration, "SND_SOC_TAS2781_FMWLIB");
 
 static int tasdevice_dspfw_ready(const struct firmware *fmw,
 	void *context)
@@ -2050,7 +2050,7 @@ int tasdevice_dsp_parser(void *context)
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_dsp_parser, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_dsp_parser, "SND_SOC_TAS2781_FMWLIB");
 
 static void tas2781_clear_calfirmware(struct tasdevice_fw *tas_fmw)
 {
@@ -2103,7 +2103,7 @@ void tasdevice_calbin_remove(void *context)
 		tasdev->cali_data_fmw = NULL;
 	}
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_calbin_remove, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_calbin_remove, "SND_SOC_TAS2781_FMWLIB");
 
 void tasdevice_config_info_remove(void *context)
 {
@@ -2130,7 +2130,7 @@ void tasdevice_config_info_remove(void *context)
 	}
 	kfree(ci);
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_config_info_remove, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_config_info_remove, "SND_SOC_TAS2781_FMWLIB");
 
 static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
 	struct tasdevice_data *dev_data)
@@ -2310,8 +2310,7 @@ int tasdevice_select_tuningprm_cfg(void *context, int prm_no,
 out:
 	return prog_status;
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg,
-	SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_select_tuningprm_cfg, "SND_SOC_TAS2781_FMWLIB");
 
 int tasdevice_prmg_load(void *context, int prm_no)
 {
@@ -2356,7 +2355,7 @@ int tasdevice_prmg_load(void *context, int prm_no)
 out:
 	return prog_status;
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_load, SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_load, "SND_SOC_TAS2781_FMWLIB");
 
 void tasdevice_tuning_switch(void *context, int state)
 {
@@ -2392,8 +2391,7 @@ void tasdevice_tuning_switch(void *context, int state)
 			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch,
-	SND_SOC_TAS2781_FMWLIB);
+EXPORT_SYMBOL_NS_GPL(tasdevice_tuning_switch, "SND_SOC_TAS2781_FMWLIB");
 
 MODULE_DESCRIPTION("Texas Firmware Support");
 MODULE_AUTHOR("Shenghao Ding, TI, <shenghao-ding@ti.com>");
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 12d093437ba9..e4e3b1c57858 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1765,4 +1765,4 @@ MODULE_AUTHOR("Shenghao Ding <shenghao-ding@ti.com>");
 MODULE_AUTHOR("Kevin Lu <kevin-lu@ti.com>");
 MODULE_DESCRIPTION("ASoC TAS2781 Driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_TAS2781_FMWLIB);
+MODULE_IMPORT_NS("SND_SOC_TAS2781_FMWLIB");
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index e69283195f36..91c8697c29c3 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -2098,4 +2098,4 @@ static const struct cs_dsp_client_ops wm_adsp2_client_ops = {
 
 MODULE_DESCRIPTION("Cirrus Logic ASoC DSP Support");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(FW_CS_DSP);
+MODULE_IMPORT_NS("FW_CS_DSP");
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 90d93e667bd9..75b54c3b7f63 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -315,4 +315,4 @@ module_platform_driver(snd_ehl_rt5660_driver);
 MODULE_DESCRIPTION("ASoC Intel(R) Elkhartlake + rt5660 Machine driver");
 MODULE_AUTHOR("libin.yang@intel.com");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_HDA_DSP_COMMON");
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index fda5a92b0006..86e541a2c204 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -83,7 +83,7 @@ int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
 
 	return err;
 }
-EXPORT_SYMBOL_NS(hda_dsp_hdmi_build_controls, SND_SOC_INTEL_HDA_DSP_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_hdmi_build_controls, "SND_SOC_INTEL_HDA_DSP_COMMON");
 
 #endif
 
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 9edd6d985cf1..22668bac74a1 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -164,4 +164,4 @@ MODULE_DESCRIPTION("SKL/KBL/BXT/APL HDA Generic Machine driver");
 MODULE_AUTHOR("Rakesh Ughreja <rakesh.a.ughreja@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:skl_hda_dsp_generic");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index 24f716e42d6a..8901debffc21 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -35,7 +35,7 @@ int sof_intel_board_card_late_probe(struct snd_soc_card *card)
 
 	return hda_dsp_hdmi_build_controls(card, ctx->hdmi.hdmi_comp);
 }
-EXPORT_SYMBOL_NS(sof_intel_board_card_late_probe, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(sof_intel_board_card_late_probe, "SND_SOC_INTEL_SOF_BOARD_HELPERS");
 
 /*
  * DMIC DAI Link
@@ -738,7 +738,7 @@ int sof_intel_board_set_dai_link(struct device *dev, struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(sof_intel_board_set_dai_link, "SND_SOC_INTEL_SOF_BOARD_HELPERS");
 
 struct sof_card_private *
 sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
@@ -781,10 +781,10 @@ sof_intel_board_get_ctx(struct device *dev, unsigned long board_quirk)
 
 	return ctx;
 }
-EXPORT_SYMBOL_NS(sof_intel_board_get_ctx, SND_SOC_INTEL_SOF_BOARD_HELPERS);
+EXPORT_SYMBOL_NS(sof_intel_board_get_ctx, "SND_SOC_INTEL_SOF_BOARD_HELPERS");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Machine Driver Board Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
+MODULE_IMPORT_NS("SND_SOC_INTEL_HDA_DSP_COMMON");
+MODULE_IMPORT_NS("SND_SOC_ACPI_INTEL_MATCH");
diff --git a/sound/soc/intel/boards/sof_cirrus_common.c b/sound/soc/intel/boards/sof_cirrus_common.c
index e71e09124b34..8db7695b9747 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.c
+++ b/sound/soc/intel/boards/sof_cirrus_common.c
@@ -193,14 +193,14 @@ void cs35l41_set_dai_link(struct snd_soc_dai_link *link)
 	link->init = cs35l41_init;
 	link->ops = &cs35l41_ops;
 }
-EXPORT_SYMBOL_NS(cs35l41_set_dai_link, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+EXPORT_SYMBOL_NS(cs35l41_set_dai_link, "SND_SOC_INTEL_SOF_CIRRUS_COMMON");
 
 void cs35l41_set_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = cs35l41_codec_conf;
 	card->num_configs = ARRAY_SIZE(cs35l41_codec_conf);
 }
-EXPORT_SYMBOL_NS(cs35l41_set_codec_conf, SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+EXPORT_SYMBOL_NS(cs35l41_set_codec_conf, "SND_SOC_INTEL_SOF_CIRRUS_COMMON");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Cirrus Logic helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_cs42l42.c b/sound/soc/intel/boards/sof_cs42l42.c
index f4fee2ee0d63..455c5bc8c634 100644
--- a/sound/soc/intel/boards/sof_cs42l42.c
+++ b/sound/soc/intel/boards/sof_cs42l42.c
@@ -303,5 +303,5 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver for CS42L42");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_MAXIM_COMMON");
diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index fa1f7d2d8278..9b7082b239c1 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -487,5 +487,5 @@ MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver for Dialog codec");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_MAXIM_COMMON");
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index fc998fe4b196..814bdf7de4e3 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -845,4 +845,4 @@ module_platform_driver(sof_es8336_driver);
 
 MODULE_DESCRIPTION("ASoC Intel(R) SOF + ES8336 Machine driver");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_HDA_DSP_COMMON");
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index fcc3b95e57a4..c98a67ae5e66 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -283,14 +283,14 @@ void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 	link->init = max_98373_spk_codec_init;
 	link->ops = &max_98373_ops;
 }
-EXPORT_SYMBOL_NS(max_98373_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98373_dai_link, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 void max_98373_set_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = max_98373_codec_conf;
 	card->num_configs = ARRAY_SIZE(max_98373_codec_conf);
 }
-EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98373_set_codec_conf, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 /*
  * Maxim MAX98390
@@ -506,7 +506,7 @@ void max_98390_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 	link->init = max_98390_init;
 	link->ops = &max_98390_ops;
 }
-EXPORT_SYMBOL_NS(max_98390_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98390_dai_link, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
 {
@@ -529,7 +529,7 @@ void max_98390_set_codec_conf(struct device *dev, struct snd_soc_card *card)
 		break;
 	}
 }
-EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98390_set_codec_conf, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 /*
  * Maxim MAX98357A/MAX98360A
@@ -596,7 +596,7 @@ void max_98357a_dai_link(struct snd_soc_dai_link *link)
 	link->num_codecs = ARRAY_SIZE(max_98357a_components);
 	link->init = max_98357a_init;
 }
-EXPORT_SYMBOL_NS(max_98357a_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98357a_dai_link, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 void max_98360a_dai_link(struct snd_soc_dai_link *link)
 {
@@ -604,7 +604,7 @@ void max_98360a_dai_link(struct snd_soc_dai_link *link)
 	link->num_codecs = ARRAY_SIZE(max_98360a_components);
 	link->init = max_98357a_init;
 }
-EXPORT_SYMBOL_NS(max_98360a_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+EXPORT_SYMBOL_NS(max_98360a_dai_link, "SND_SOC_INTEL_SOF_MAXIM_COMMON");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Maxim helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_nau8825.c b/sound/soc/intel/boards/sof_nau8825.c
index bfe17acbc161..72ce32e2cd57 100644
--- a/sound/soc/intel/boards/sof_nau8825.c
+++ b/sound/soc/intel/boards/sof_nau8825.c
@@ -339,7 +339,7 @@ MODULE_AUTHOR("David Lin <ctlin0@nuvoton.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_NUVOTON_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_MAXIM_COMMON");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_NUVOTON_COMMON");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_REALTEK_COMMON");
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.c b/sound/soc/intel/boards/sof_nuvoton_common.c
index 549a412f5d53..ed41cb6f7fa5 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.c
+++ b/sound/soc/intel/boards/sof_nuvoton_common.c
@@ -67,7 +67,7 @@ void nau8318_set_dai_link(struct snd_soc_dai_link *link)
 	link->num_codecs = ARRAY_SIZE(nau8318_components);
 	link->init = nau8318_init;
 }
-EXPORT_SYMBOL_NS(nau8318_set_dai_link, SND_SOC_INTEL_SOF_NUVOTON_COMMON);
+EXPORT_SYMBOL_NS(nau8318_set_dai_link, "SND_SOC_INTEL_SOF_NUVOTON_COMMON");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Nuvoton helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index 8d237f67bd06..118af6fb11bf 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -441,4 +441,4 @@ MODULE_DESCRIPTION("ASoC Intel(R) SOF + PCM512x Machine driver");
 MODULE_AUTHOR("Pierre-Louis Bossart");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_pcm512x");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_HDA_DSP_COMMON");
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index f52e25083905..600707d403b9 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -276,7 +276,7 @@ void sof_rt1011_dai_link(struct device *dev, struct snd_soc_dai_link *link)
 	link->init = rt1011_init;
 	link->ops = &rt1011_ops;
 }
-EXPORT_SYMBOL_NS(sof_rt1011_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1011_dai_link, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card)
 {
@@ -306,7 +306,7 @@ void sof_rt1011_codec_conf(struct device *dev, struct snd_soc_card *card)
 	}
 
 }
-EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1011_codec_conf, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 /*
  * rt1015:  i2c mode driver for ALC1015 and ALC1015Q
@@ -374,12 +374,12 @@ void sof_rt1015p_dai_link(struct snd_soc_dai_link *link)
 	link->init = rt1015p_init;
 	link->ops = &rt1015p_ops;
 }
-EXPORT_SYMBOL_NS(sof_rt1015p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1015p_dai_link, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 void sof_rt1015p_codec_conf(struct snd_soc_card *card)
 {
 }
-EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1015p_codec_conf, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 /*
  * RT1015 audio amplifier
@@ -523,7 +523,7 @@ void sof_rt1015_codec_conf(struct snd_soc_card *card)
 	card->codec_conf = rt1015_amp_conf;
 	card->num_configs = ARRAY_SIZE(rt1015_amp_conf);
 }
-EXPORT_SYMBOL_NS(sof_rt1015_codec_conf, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1015_codec_conf, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 void sof_rt1015_dai_link(struct snd_soc_dai_link *link)
 {
@@ -532,7 +532,7 @@ void sof_rt1015_dai_link(struct snd_soc_dai_link *link)
 	link->init = speaker_codec_init_lr;
 	link->ops = &rt1015_ops;
 }
-EXPORT_SYMBOL_NS(sof_rt1015_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1015_dai_link, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 /*
  * RT1308 audio amplifier
@@ -628,7 +628,7 @@ void sof_rt1308_dai_link(struct snd_soc_dai_link *link)
 	link->init = rt1308_init;
 	link->ops = &rt1308_ops;
 }
-EXPORT_SYMBOL_NS(sof_rt1308_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1308_dai_link, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 /*
  * 2-amp Configuration for RT1019
@@ -681,7 +681,7 @@ void sof_rt1019p_dai_link(struct snd_soc_dai_link *link)
 	link->num_codecs = ARRAY_SIZE(rt1019p_components);
 	link->init = rt1019p_init;
 }
-EXPORT_SYMBOL_NS(sof_rt1019p_dai_link, SND_SOC_INTEL_SOF_REALTEK_COMMON);
+EXPORT_SYMBOL_NS(sof_rt1019p_dai_link, "SND_SOC_INTEL_SOF_REALTEK_COMMON");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Realtek helpers");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index bc581fea0e3a..2b20c8521d68 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -898,6 +898,6 @@ MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_MAXIM_COMMON");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_REALTEK_COMMON");
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 35d707d3ae9c..6190cdbc84ed 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1212,5 +1212,5 @@ MODULE_AUTHOR("Bard Liao <yung-chuan.liao@linux.intel.com>");
 MODULE_AUTHOR("Rander Wang <rander.wang@linux.intel.com>");
 MODULE_AUTHOR("Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>");
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SDW_UTILS);
+MODULE_IMPORT_NS("SND_SOC_INTEL_HDA_DSP_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SDW_UTILS");
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 6ff8895a294a..48ee5353bdf1 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -234,6 +234,6 @@ MODULE_DESCRIPTION("ASoC Intel(R) SOF Amplifier Machine driver");
 MODULE_AUTHOR("Balamurugan C <balamurugan.c@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_BOARD_HELPERS);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_REALTEK_COMMON);
-MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_CIRRUS_COMMON);
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_BOARD_HELPERS");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_REALTEK_COMMON");
+MODULE_IMPORT_NS("SND_SOC_INTEL_SOF_CIRRUS_COMMON");
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index de7a3f7f47f1..f56f4bfa5187 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -90,7 +90,7 @@ snd_soc_acpi_intel_detect_codec_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, SND_SOC_ACPI_INTEL_MATCH);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_codec_type, "SND_SOC_ACPI_INTEL_MATCH");
 
 enum snd_soc_acpi_intel_codec
 snd_soc_acpi_intel_detect_amp_type(struct device *dev)
@@ -107,7 +107,7 @@ snd_soc_acpi_intel_detect_amp_type(struct device *dev)
 
 	return CODEC_NONE;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, SND_SOC_ACPI_INTEL_MATCH);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_detect_amp_type, "SND_SOC_ACPI_INTEL_MATCH");
 
 const char *
 snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
@@ -129,7 +129,7 @@ snd_soc_acpi_intel_get_codec_name(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, SND_SOC_ACPI_INTEL_MATCH);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_name, "SND_SOC_ACPI_INTEL_MATCH");
 
 const char *
 snd_soc_acpi_intel_get_codec_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type)
@@ -145,7 +145,7 @@ snd_soc_acpi_intel_get_codec_tplg_suffix(enum snd_soc_acpi_intel_codec codec_typ
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_tplg_suffix, SND_SOC_ACPI_INTEL_MATCH);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_codec_tplg_suffix, "SND_SOC_ACPI_INTEL_MATCH");
 
 const char *
 snd_soc_acpi_intel_get_amp_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type)
@@ -161,7 +161,7 @@ snd_soc_acpi_intel_get_amp_tplg_suffix(enum snd_soc_acpi_intel_codec codec_type)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_amp_tplg_suffix, SND_SOC_ACPI_INTEL_MATCH);
+EXPORT_SYMBOL_NS(snd_soc_acpi_intel_get_amp_tplg_suffix, "SND_SOC_ACPI_INTEL_MATCH");
 
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
diff --git a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
index fcc3ef685af7..246e5c2e0af5 100644
--- a/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
+++ b/sound/soc/sdw_utils/soc_sdw_bridge_cs35l56.c
@@ -112,7 +112,7 @@ int asoc_sdw_bridge_cs35l56_count_sidecar(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_count_sidecar, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_count_sidecar, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 					struct snd_soc_dai_link **dai_links,
@@ -134,7 +134,7 @@ int asoc_sdw_bridge_cs35l56_add_sidecar(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_add_sidecar, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_add_sidecar, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
 				     struct snd_soc_dai_link *dai_links,
@@ -148,4 +148,4 @@ int asoc_sdw_bridge_cs35l56_spk_init(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_spk_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_bridge_cs35l56_spk_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l42.c b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
index 78a6cb059ac0..f37c1793991a 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l42.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l42.c
@@ -88,4 +88,4 @@ int asoc_sdw_cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs42l42_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l42_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_cs42l43.c b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
index adb1c008e871..668c9d28a1c1 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs42l43.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs42l43.c
@@ -100,7 +100,7 @@ int asoc_sdw_cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_hs_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -124,7 +124,7 @@ int asoc_sdw_cs42l43_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 			      struct snd_soc_dai_link *dai_links,
@@ -139,7 +139,7 @@ int asoc_sdw_cs42l43_spk_init(struct snd_soc_card *card,
 
 	return asoc_sdw_bridge_cs35l56_spk_init(card, dai_links, info, playback);
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_spk_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
@@ -158,4 +158,4 @@ int asoc_sdw_cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_dmic_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs42l43_dmic_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_cs_amp.c b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
index 58b059b68016..a0bb626c5cb8 100644
--- a/sound/soc/sdw_utils/soc_sdw_cs_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_cs_amp.c
@@ -46,7 +46,7 @@ int asoc_sdw_cs_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs_spk_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
@@ -61,4 +61,4 @@ int asoc_sdw_cs_amp_init(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_cs_amp_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_cs_amp_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_dmic.c b/sound/soc/sdw_utils/soc_sdw_dmic.c
index fc2aae985084..0d8fce7234a7 100644
--- a/sound/soc/sdw_utils/soc_sdw_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_dmic.c
@@ -42,4 +42,4 @@ int asoc_sdw_dmic_init(struct snd_soc_pcm_runtime *rtd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_dmic_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_dmic_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_maxim.c b/sound/soc/sdw_utils/soc_sdw_maxim.c
index cdcd8df37e1d..5df8d9cae60c 100644
--- a/sound/soc/sdw_utils/soc_sdw_maxim.c
+++ b/sound/soc/sdw_utils/soc_sdw_maxim.c
@@ -43,7 +43,7 @@ int asoc_sdw_maxim_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_maxim_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_maxim_spk_rtd_init, "SND_SOC_SDW_UTILS");
 
 static int asoc_sdw_mx8373_enable_spk_pin(struct snd_pcm_substream *substream, bool enable)
 {
@@ -145,4 +145,4 @@ int asoc_sdw_maxim_init(struct snd_soc_card *card,
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_maxim_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_maxim_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt5682.c b/sound/soc/sdw_utils/soc_sdw_rt5682.c
index 80b4caa92667..8c86254cbaf6 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt5682.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt5682.c
@@ -88,4 +88,4 @@ int asoc_sdw_rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt5682_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt5682_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt700.c b/sound/soc/sdw_utils/soc_sdw_rt700.c
index 4dbeeeca3434..e6468e4ac6e7 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt700.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt700.c
@@ -85,4 +85,4 @@ int asoc_sdw_rt700_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt700_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt700_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt711.c b/sound/soc/sdw_utils/soc_sdw_rt711.c
index 38b4126dd45f..4aa93fdefef6 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt711.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt711.c
@@ -112,7 +112,7 @@ int asoc_sdw_rt711_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt711_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -126,7 +126,7 @@ int asoc_sdw_rt711_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt711_exit, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_exit, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt711_init(struct snd_soc_card *card,
 			struct snd_soc_dai_link *dai_links,
@@ -157,4 +157,4 @@ int asoc_sdw_rt711_init(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt711_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt711_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
index 5127210b9a03..40ec660cf103 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt712_sdca.c
@@ -45,4 +45,4 @@ int asoc_sdw_rt712_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt712_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt712_spk_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c b/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
index 6a402172289f..c52c947f9c5b 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt722_sdca.c
@@ -38,4 +38,4 @@ int asoc_sdw_rt722_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt722_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt722_spk_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_amp.c b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
index 6951dfb56526..0538c252ba69 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_amp.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_amp.c
@@ -210,7 +210,7 @@ int asoc_sdw_rt_amp_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_spk_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_spk_rtd_init, "SND_SOC_SDW_UTILS");
 
 static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
@@ -248,7 +248,7 @@ static int rt1308_i2s_hw_params(struct snd_pcm_substream *substream,
 const struct snd_soc_ops soc_sdw_rt1308_i2s_ops = {
 	.hw_params = rt1308_i2s_hw_params,
 };
-EXPORT_SYMBOL_NS(soc_sdw_rt1308_i2s_ops, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(soc_sdw_rt1308_i2s_ops, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -266,7 +266,7 @@ int asoc_sdw_rt_amp_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_exit, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_exit, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 			 struct snd_soc_dai_link *dai_links,
@@ -309,4 +309,4 @@ int asoc_sdw_rt_amp_init(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_amp_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
index 7f24806d809d..46d917a99c51 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_dmic.c
@@ -40,4 +40,4 @@ int asoc_sdw_rt_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_da
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_dmic_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_dmic_rtd_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
index 3e6211dc1599..1969f1ef8569 100644
--- a/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_rt_sdca_jack_common.c
@@ -162,7 +162,7 @@ int asoc_sdw_rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_s
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_rtd_init, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link)
 {
@@ -180,7 +180,7 @@ int asoc_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_lin
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_exit, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_exit, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			       struct snd_soc_dai_link *dai_links,
@@ -211,4 +211,4 @@ int asoc_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rt_sdca_jack_init, "SND_SOC_SDW_UTILS");
diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index a6070f822eb9..6e6b25f51601 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -563,13 +563,13 @@ struct asoc_sdw_codec_info codec_info_list[] = {
 		.dai_num = 1,
 	},
 };
-EXPORT_SYMBOL_NS(codec_info_list, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(codec_info_list, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_get_codec_info_list_count(void)
 {
 	return ARRAY_SIZE(codec_info_list);
 };
-EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_get_codec_info_list_count, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 {
@@ -590,7 +590,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_part(const u64 adr)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_part, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_part, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
 {
@@ -605,7 +605,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_acpi(const u8 *acpi_id)
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_acpi, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_acpi, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name, int *dai_index)
 {
@@ -622,7 +622,7 @@ struct asoc_sdw_codec_info *asoc_sdw_find_codec_info_dai(const char *dai_name, i
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_dai, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_find_codec_info_dai, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -686,14 +686,14 @@ int asoc_sdw_rtd_init(struct snd_soc_pcm_runtime *rtd)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_rtd_init, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_rtd_init, "SND_SOC_SDW_UTILS");
 
 /* these wrappers are only needed to avoid typecast compilation errors */
 int asoc_sdw_startup(struct snd_pcm_substream *substream)
 {
 	return sdw_startup_stream(substream);
 }
-EXPORT_SYMBOL_NS(asoc_sdw_startup, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_startup, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_prepare(struct snd_pcm_substream *substream)
 {
@@ -712,7 +712,7 @@ int asoc_sdw_prepare(struct snd_pcm_substream *substream)
 
 	return sdw_prepare_stream(sdw_stream);
 }
-EXPORT_SYMBOL_NS(asoc_sdw_prepare, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_prepare, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 {
@@ -752,7 +752,7 @@ int asoc_sdw_trigger(struct snd_pcm_substream *substream, int cmd)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_trigger, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_trigger, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 		       struct snd_pcm_hw_params *params)
@@ -795,7 +795,7 @@ int asoc_sdw_hw_params(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_hw_params, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_hw_params, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_hw_free(struct snd_pcm_substream *substream)
 {
@@ -814,13 +814,13 @@ int asoc_sdw_hw_free(struct snd_pcm_substream *substream)
 
 	return sdw_deprepare_stream(sdw_stream);
 }
-EXPORT_SYMBOL_NS(asoc_sdw_hw_free, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_hw_free, "SND_SOC_SDW_UTILS");
 
 void asoc_sdw_shutdown(struct snd_pcm_substream *substream)
 {
 	sdw_shutdown_stream(substream);
 }
-EXPORT_SYMBOL_NS(asoc_sdw_shutdown, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_shutdown, "SND_SOC_SDW_UTILS");
 
 static bool asoc_sdw_is_unique_device(const struct snd_soc_acpi_link_adr *adr_link,
 				      unsigned int sdw_version,
@@ -881,7 +881,7 @@ const char *asoc_sdw_get_codec_name(struct device *dev,
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_get_codec_name, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_get_codec_name, "SND_SOC_SDW_UTILS");
 
 /* helper to get the link that the codec DAI is used */
 struct snd_soc_dai_link *asoc_sdw_mc_find_codec_dai_used(struct snd_soc_card *card,
@@ -900,7 +900,7 @@ struct snd_soc_dai_link *asoc_sdw_mc_find_codec_dai_used(struct snd_soc_card *ca
 	}
 	return NULL;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_mc_find_codec_dai_used, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_mc_find_codec_dai_used, "SND_SOC_SDW_UTILS");
 
 void asoc_sdw_mc_dailink_exit_loop(struct snd_soc_card *card)
 {
@@ -933,7 +933,7 @@ void asoc_sdw_mc_dailink_exit_loop(struct snd_soc_card *card)
 		}
 	}
 }
-EXPORT_SYMBOL_NS(asoc_sdw_mc_dailink_exit_loop, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_mc_dailink_exit_loop, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_card_late_probe(struct snd_soc_card *card)
 {
@@ -949,7 +949,7 @@ int asoc_sdw_card_late_probe(struct snd_soc_card *card)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_card_late_probe, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_card_late_probe, "SND_SOC_SDW_UTILS");
 
 void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 			    int *be_id, char *name, int playback, int capture,
@@ -974,7 +974,7 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_init_dai_link, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_init_dai_link, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *dai_links,
 				  int *be_id, char *name, int playback, int capture,
@@ -1003,7 +1003,7 @@ int asoc_sdw_init_simple_dai_link(struct device *dev, struct snd_soc_dai_link *d
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_init_simple_dai_link, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *num_ends)
 {
@@ -1024,7 +1024,7 @@ int asoc_sdw_count_sdw_endpoints(struct snd_soc_card *card, int *num_devs, int *
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_count_sdw_endpoints, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_count_sdw_endpoints, "SND_SOC_SDW_UTILS");
 
 struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks,
 					       const struct snd_soc_acpi_endpoint *new)
@@ -1042,7 +1042,7 @@ struct asoc_sdw_dailink *asoc_sdw_find_dailink(struct asoc_sdw_dailink *dailinks
 
 	return dailinks;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_find_dailink, "SND_SOC_SDW_UTILS");
 
 int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 				 struct asoc_sdw_dailink *soc_dais,
@@ -1164,7 +1164,7 @@ int asoc_sdw_parse_sdw_endpoints(struct snd_soc_card *card,
 
 	return num_dais;
 }
-EXPORT_SYMBOL_NS(asoc_sdw_parse_sdw_endpoints, SND_SOC_SDW_UTILS);
+EXPORT_SYMBOL_NS(asoc_sdw_parse_sdw_endpoints, "SND_SOC_SDW_UTILS");
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SoundWire ASoC helpers");
diff --git a/sound/soc/sof/amd/acp-common.c b/sound/soc/sof/amd/acp-common.c
index dbcaac84cb73..0dc0b5ce084d 100644
--- a/sound/soc/sof/amd/acp-common.c
+++ b/sound/soc/sof/amd/acp-common.c
@@ -259,10 +259,10 @@ const struct snd_sof_dsp_ops sof_acp_common_ops = {
 	.register_ipc_clients = acp_probes_register,
 	.unregister_ipc_clients = acp_probes_unregister,
 };
-EXPORT_SYMBOL_NS(sof_acp_common_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_acp_common_ops, "SND_SOC_SOF_AMD_COMMON");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("ACP SOF COMMON Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index b44b1b1adb6e..5f371d9263f3 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -19,13 +19,13 @@ void acp_mailbox_write(struct snd_sof_dev *sdev, u32 offset, void *message, size
 {
 	memcpy_to_scratch(sdev, offset, message, bytes);
 }
-EXPORT_SYMBOL_NS(acp_mailbox_write, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_mailbox_write, "SND_SOC_SOF_AMD_COMMON");
 
 void acp_mailbox_read(struct snd_sof_dev *sdev, u32 offset, void *message, size_t bytes)
 {
 	memcpy_from_scratch(sdev, offset, message, bytes);
 }
-EXPORT_SYMBOL_NS(acp_mailbox_read, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_mailbox_read, "SND_SOC_SOF_AMD_COMMON");
 
 static void acpbus_trigger_host_to_dsp_swintr(struct acp_dev_data *adata)
 {
@@ -91,7 +91,7 @@ int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_ipc_send_msg, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_ipc_send_msg, "SND_SOC_SOF_AMD_COMMON");
 
 static void acp_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 {
@@ -235,7 +235,7 @@ irqreturn_t acp_sof_ipc_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(acp_sof_ipc_irq_thread, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_ipc_irq_thread, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sps,
 			 void *p, size_t sz)
@@ -261,7 +261,7 @@ int acp_sof_ipc_msg_data(struct snd_sof_dev *sdev, struct snd_sof_pcm_stream *sp
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_ipc_msg_data, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_sof_pcm_stream *sps,
@@ -282,7 +282,7 @@ int acp_set_stream_data_offset(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_set_stream_data_offset, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_set_stream_data_offset, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
@@ -290,12 +290,12 @@ int acp_sof_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 
 	return desc->sram_pte_offset;
 }
-EXPORT_SYMBOL_NS(acp_sof_ipc_get_mailbox_offset, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_ipc_get_mailbox_offset, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_ipc_get_window_offset, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_ipc_get_window_offset, "SND_SOC_SOF_AMD_COMMON");
 
 MODULE_DESCRIPTION("AMD ACP sof-ipc driver");
diff --git a/sound/soc/sof/amd/acp-loader.c b/sound/soc/sof/amd/acp-loader.c
index 077af9e2af8d..ea105227227d 100644
--- a/sound/soc/sof/amd/acp-loader.c
+++ b/sound/soc/sof/amd/acp-loader.c
@@ -44,7 +44,7 @@ int acp_dsp_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_ty
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_dsp_block_read, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_block_read, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 			u32 offset, void *src, size_t size)
@@ -106,13 +106,13 @@ int acp_dsp_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_t
 	memcpy(dest, src, size);
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_dsp_block_write, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_block_write, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 {
 	return type;
 }
-EXPORT_SYMBOL_NS(acp_get_bar_index, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_get_bar_index, "SND_SOC_SOF_AMD_COMMON");
 
 static void configure_pte_for_fw_loading(int type, int num_pages, struct acp_dev_data *adata)
 {
@@ -244,7 +244,7 @@ int acp_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 	}
 	return ret;
 }
-EXPORT_SYMBOL_NS(acp_dsp_pre_fw_run, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_pre_fw_run, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_dsp_run(struct snd_sof_dev *sdev)
 {
@@ -264,7 +264,7 @@ int acp_sof_dsp_run(struct snd_sof_dev *sdev)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_dsp_run, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_dsp_run, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_load_signed_firmware(struct snd_sof_dev *sdev)
 {
@@ -317,4 +317,4 @@ int acp_sof_load_signed_firmware(struct snd_sof_dev *sdev)
 				      adata->fw_dbin->size);
 	return ret;
 }
-EXPORT_SYMBOL_NS(acp_sof_load_signed_firmware, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_load_signed_firmware, "SND_SOC_SOF_AMD_COMMON");
diff --git a/sound/soc/sof/amd/acp-pcm.c b/sound/soc/sof/amd/acp-pcm.c
index cee0b1154874..2802684f26de 100644
--- a/sound/soc/sof/amd/acp-pcm.c
+++ b/sound/soc/sof/amd/acp-pcm.c
@@ -52,7 +52,7 @@ int acp_pcm_hw_params(struct snd_sof_dev *sdev, struct snd_pcm_substream *substr
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_pcm_hw_params, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_pcm_hw_params, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_pcm_open(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
 {
@@ -67,7 +67,7 @@ int acp_pcm_open(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_pcm_open, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_pcm_open, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_pcm_close(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
 {
@@ -84,7 +84,7 @@ int acp_pcm_close(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
 
 	return acp_dsp_stream_put(sdev, stream);
 }
-EXPORT_SYMBOL_NS(acp_pcm_close, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_pcm_close, "SND_SOC_SOF_AMD_COMMON");
 
 snd_pcm_uframes_t acp_pcm_pointer(struct snd_sof_dev *sdev,
 				  struct snd_pcm_substream *substream)
@@ -117,4 +117,4 @@ snd_pcm_uframes_t acp_pcm_pointer(struct snd_sof_dev *sdev,
 
 	return pos;
 }
-EXPORT_SYMBOL_NS(acp_pcm_pointer, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_pcm_pointer, "SND_SOC_SOF_AMD_COMMON");
diff --git a/sound/soc/sof/amd/acp-probes.c b/sound/soc/sof/amd/acp-probes.c
index 778cf1a8b610..0d0f8ec4aed8 100644
--- a/sound/soc/sof/amd/acp-probes.c
+++ b/sound/soc/sof/amd/acp-probes.c
@@ -135,13 +135,13 @@ int acp_probes_register(struct snd_sof_dev *sdev)
 	return sof_client_dev_register(sdev, "acp-probes", 0, &acp_probes_ops,
 				       sizeof(acp_probes_ops));
 }
-EXPORT_SYMBOL_NS(acp_probes_register, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_probes_register, "SND_SOC_SOF_AMD_COMMON");
 
 void acp_probes_unregister(struct snd_sof_dev *sdev)
 {
 	sof_client_dev_unregister(sdev, "acp-probes", 0);
 }
-EXPORT_SYMBOL_NS(acp_probes_unregister, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_probes_unregister, "SND_SOC_SOF_AMD_COMMON");
 
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
 
diff --git a/sound/soc/sof/amd/acp-stream.c b/sound/soc/sof/amd/acp-stream.c
index 6f40ef7ba85e..9212a3137cfd 100644
--- a/sound/soc/sof/amd/acp-stream.c
+++ b/sound/soc/sof/amd/acp-stream.c
@@ -150,7 +150,7 @@ struct acp_dsp_stream *acp_dsp_stream_get(struct snd_sof_dev *sdev, int tag)
 	dev_err(sdev->dev, "stream %d active or no inactive stream\n", tag);
 	return NULL;
 }
-EXPORT_SYMBOL_NS(acp_dsp_stream_get, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_stream_get, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_dsp_stream_put(struct snd_sof_dev *sdev,
 		       struct acp_dsp_stream *acp_stream)
@@ -170,7 +170,7 @@ int acp_dsp_stream_put(struct snd_sof_dev *sdev,
 	dev_err(sdev->dev, "Cannot find active stream tag %d\n", acp_stream->stream_tag);
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS(acp_dsp_stream_put, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_stream_put, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_dsp_stream_init(struct snd_sof_dev *sdev)
 {
@@ -184,4 +184,4 @@ int acp_dsp_stream_init(struct snd_sof_dev *sdev)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_dsp_stream_init, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_dsp_stream_init, "SND_SOC_SOF_AMD_COMMON");
diff --git a/sound/soc/sof/amd/acp-trace.c b/sound/soc/sof/amd/acp-trace.c
index c9482b27cbe3..0bd1f5990e8c 100644
--- a/sound/soc/sof/amd/acp-trace.c
+++ b/sound/soc/sof/amd/acp-trace.c
@@ -32,7 +32,7 @@ int acp_sof_trace_release(struct snd_sof_dev *sdev)
 	adata->dtrace_stream = NULL;
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_trace_release, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_trace_release, "SND_SOC_SOF_AMD_COMMON");
 
 int acp_sof_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params)
@@ -61,4 +61,4 @@ int acp_sof_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(acp_sof_trace_init, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(acp_sof_trace_init, "SND_SOC_SOF_AMD_COMMON");
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index de3001f5b9bb..626a04b0f349 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -625,7 +625,7 @@ int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(amd_sof_acp_suspend, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(amd_sof_acp_suspend, "SND_SOC_SOF_AMD_COMMON");
 
 int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 {
@@ -644,7 +644,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 		return acp_dsp_reset(sdev);
 	}
 }
-EXPORT_SYMBOL_NS(amd_sof_acp_resume, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(amd_sof_acp_resume, "SND_SOC_SOF_AMD_COMMON");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_AMD_SOUNDWIRE)
 static int acp_sof_scan_sdw_devices(struct snd_sof_dev *sdev, u64 addr)
@@ -843,7 +843,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	platform_device_unregister(adata->dmic_dev);
 	return ret;
 }
-EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(amd_sof_acp_probe, "SND_SOC_SOF_AMD_COMMON");
 
 void amd_sof_acp_remove(struct snd_sof_dev *sdev)
 {
@@ -863,9 +863,9 @@ void amd_sof_acp_remove(struct snd_sof_dev *sdev)
 
 	acp_reset(sdev);
 }
-EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(amd_sof_acp_remove, "SND_SOC_SOF_AMD_COMMON");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("AMD ACP sof driver");
-MODULE_IMPORT_NS(SOUNDWIRE_AMD_INIT);
-MODULE_IMPORT_NS(SND_AMD_SOUNDWIRE_ACPI);
+MODULE_IMPORT_NS("SOUNDWIRE_AMD_INIT");
+MODULE_IMPORT_NS("SND_AMD_SOUNDWIRE_ACPI");
diff --git a/sound/soc/sof/amd/acp63.c b/sound/soc/sof/amd/acp63.c
index 9e6eb4bfc805..a686620b1358 100644
--- a/sound/soc/sof/amd/acp63.c
+++ b/sound/soc/sof/amd/acp63.c
@@ -128,7 +128,7 @@ static struct snd_soc_dai_driver acp63_sof_dai[] = {
 
 /* Phoenix ops */
 struct snd_sof_dsp_ops sof_acp63_ops;
-EXPORT_SYMBOL_NS(sof_acp63_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_acp63_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_acp63_ops_init(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/amd/acp70.c b/sound/soc/sof/amd/acp70.c
index 7d1842f42c90..8314ac4008da 100644
--- a/sound/soc/sof/amd/acp70.c
+++ b/sound/soc/sof/amd/acp70.c
@@ -128,7 +128,7 @@ static struct snd_soc_dai_driver acp70_sof_dai[] = {
 
 /* Phoenix ops */
 struct snd_sof_dsp_ops sof_acp70_ops;
-EXPORT_SYMBOL_NS(sof_acp70_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_acp70_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_acp70_ops_init(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/amd/pci-acp63.c b/sound/soc/sof/amd/pci-acp63.c
index b54ed61b79ed..ffe7c755d655 100644
--- a/sound/soc/sof/amd/pci-acp63.c
+++ b/sound/soc/sof/amd/pci-acp63.c
@@ -112,5 +112,5 @@ module_pci_driver(snd_sof_pci_amd_acp63_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("ACP63 SOF Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/amd/pci-acp70.c b/sound/soc/sof/amd/pci-acp70.c
index a5d8b6a95a22..3647ec992e95 100644
--- a/sound/soc/sof/amd/pci-acp70.c
+++ b/sound/soc/sof/amd/pci-acp70.c
@@ -108,5 +108,5 @@ module_pci_driver(snd_sof_pci_amd_acp70_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("ACP70 SOF Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index c45256bf4fda..cbb4d5282664 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -101,5 +101,5 @@ module_pci_driver(snd_sof_pci_amd_rmb_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("REMBRANDT SOF Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 386a0f1e7ee0..b7d558cb1fd7 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -105,5 +105,5 @@ module_pci_driver(snd_sof_pci_amd_rn_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("RENOIR SOF Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index cb845f81795e..53f64d6bc91b 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -100,5 +100,5 @@ module_pci_driver(snd_sof_pci_amd_vgh_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("VANGOGH SOF Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_AMD_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/amd/rembrandt.c b/sound/soc/sof/amd/rembrandt.c
index 076f2f05a95c..86ef59743fc8 100644
--- a/sound/soc/sof/amd/rembrandt.c
+++ b/sound/soc/sof/amd/rembrandt.c
@@ -128,7 +128,7 @@ static struct snd_soc_dai_driver rembrandt_sof_dai[] = {
 
 /* Rembrandt ops */
 struct snd_sof_dsp_ops sof_rembrandt_ops;
-EXPORT_SYMBOL_NS(sof_rembrandt_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_rembrandt_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_rembrandt_ops_init(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index aa2d24dac6f5..b3b4639abf50 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -103,7 +103,7 @@ static struct snd_soc_dai_driver renoir_sof_dai[] = {
 
 /* Renoir ops */
 struct snd_sof_dsp_ops sof_renoir_ops;
-EXPORT_SYMBOL_NS(sof_renoir_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_renoir_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_renoir_ops_init(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/amd/vangogh.c b/sound/soc/sof/amd/vangogh.c
index 61372958c09d..8e2672106ac6 100644
--- a/sound/soc/sof/amd/vangogh.c
+++ b/sound/soc/sof/amd/vangogh.c
@@ -138,7 +138,7 @@ static struct snd_soc_dai_driver vangogh_sof_dai[] = {
 
 /* Vangogh ops */
 struct snd_sof_dsp_ops sof_vangogh_ops;
-EXPORT_SYMBOL_NS(sof_vangogh_ops, SND_SOC_SOF_AMD_COMMON);
+EXPORT_SYMBOL_NS(sof_vangogh_ops, "SND_SOC_SOF_AMD_COMMON");
 
 int sof_vangogh_ops_init(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 83fe0401baf8..e30b3046e410 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -772,4 +772,4 @@ MODULE_AUTHOR("Liam Girdwood");
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("Sound Open Firmware (SOF) Core");
 MODULE_ALIAS("platform:sof-audio");
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index f09ee0dea2cc..0b85b29d1067 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -669,4 +669,4 @@ module_platform_driver(snd_sof_of_imx8_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for IMX8 platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 01d3ad3314f3..ff42743efa79 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -516,4 +516,4 @@ module_platform_driver(snd_sof_of_imx8m_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for IMX8M platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index e5eee1c9f6da..6965791ab6ef 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -518,4 +518,4 @@ module_platform_driver(snd_sof_of_imx8ulp_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for IMX8ULP platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index 3505ac3a1b14..30e981c558c6 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -94,7 +94,7 @@ void atom_dump(struct snd_sof_dev *sdev, u32 flags)
 		(imrd & SHIM_IMRD_DONE) ? "yes" : "no", imrd);
 
 }
-EXPORT_SYMBOL_NS(atom_dump, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_dump, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 /*
  * IPC Doorbell IRQ handler and thread.
@@ -131,7 +131,7 @@ irqreturn_t atom_irq_handler(int irq, void *context)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(atom_irq_handler, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_irq_handler, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 irqreturn_t atom_irq_thread(int irq, void *context)
 {
@@ -176,7 +176,7 @@ irqreturn_t atom_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(atom_irq_thread, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_irq_thread, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 int atom_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
@@ -191,19 +191,19 @@ int atom_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(atom_send_msg, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_send_msg, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 int atom_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MBOX_OFFSET;
 }
-EXPORT_SYMBOL_NS(atom_get_mailbox_offset, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_get_mailbox_offset, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 int atom_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return MBOX_OFFSET;
 }
-EXPORT_SYMBOL_NS(atom_get_window_offset, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_get_window_offset, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 static void atom_host_done(struct snd_sof_dev *sdev)
 {
@@ -248,7 +248,7 @@ int atom_run(struct snd_sof_dev *sdev)
 	/* return init core mask */
 	return 1;
 }
-EXPORT_SYMBOL_NS(atom_run, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_run, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 int atom_reset(struct snd_sof_dev *sdev)
 {
@@ -267,7 +267,7 @@ int atom_reset(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(atom_reset, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_reset, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
 				   const char *sof_tplg_filename,
@@ -330,7 +330,7 @@ struct snd_soc_acpi_mach *atom_machine_select(struct snd_sof_dev *sdev)
 
 	return mach;
 }
-EXPORT_SYMBOL_NS(atom_machine_select, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_machine_select, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 /* Atom DAIs */
 struct snd_soc_dai_driver atom_dai[] = {
@@ -401,7 +401,7 @@ struct snd_soc_dai_driver atom_dai[] = {
 	},
 },
 };
-EXPORT_SYMBOL_NS(atom_dai, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_dai, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 void atom_set_mach_params(struct snd_soc_acpi_mach *mach,
 			  struct snd_sof_dev *sdev)
@@ -415,7 +415,7 @@ void atom_set_mach_params(struct snd_soc_acpi_mach *mach,
 	mach_params->num_dai_drivers = desc->ops->num_drv;
 	mach_params->dai_drivers = desc->ops->drv;
 }
-EXPORT_SYMBOL_NS(atom_set_mach_params, SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+EXPORT_SYMBOL_NS(atom_set_mach_params, "SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Atom platforms");
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 322ff118f0f6..c4d92f3508b6 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -695,6 +695,6 @@ module_platform_driver(snd_sof_acpi_intel_bdw_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Broadwell platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_SOC_SOF_ACPI_DEV");
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index f531710cf94e..536d4c89d2f0 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -476,7 +476,7 @@ module_platform_driver(snd_sof_acpi_intel_byt_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Baytrail/Cherrytrail");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_SOC_SOF_ACPI_DEV);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_SOC_SOF_ACPI_DEV");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 6a8c7a108ef0..385e5339f0a4 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -110,7 +110,7 @@ irqreturn_t cnl_ipc4_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(cnl_ipc4_irq_thread, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc4_irq_thread, "SND_SOC_SOF_INTEL_CNL");
 
 irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 {
@@ -203,7 +203,7 @@ irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(cnl_ipc_irq_thread, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc_irq_thread, "SND_SOC_SOF_INTEL_CNL");
 
 static void cnl_ipc_host_done(struct snd_sof_dev *sdev)
 {
@@ -286,7 +286,7 @@ int cnl_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(cnl_ipc4_send_msg, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc4_send_msg, "SND_SOC_SOF_INTEL_CNL");
 
 int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
@@ -334,7 +334,7 @@ int cnl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(cnl_ipc_send_msg, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc_send_msg, "SND_SOC_SOF_INTEL_CNL");
 
 void cnl_ipc_dump(struct snd_sof_dev *sdev)
 {
@@ -355,7 +355,7 @@ void cnl_ipc_dump(struct snd_sof_dev *sdev)
 		"error: host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
 		hipcida, hipctdr, hipcctl);
 }
-EXPORT_SYMBOL_NS(cnl_ipc_dump, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc_dump, "SND_SOC_SOF_INTEL_CNL");
 
 void cnl_ipc4_dump(struct snd_sof_dev *sdev)
 {
@@ -377,11 +377,11 @@ void cnl_ipc4_dump(struct snd_sof_dev *sdev)
 		"Host IPC initiator: %#x|%#x|%#x, target: %#x|%#x|%#x, ctl: %#x\n",
 		hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl);
 }
-EXPORT_SYMBOL_NS(cnl_ipc4_dump, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(cnl_ipc4_dump, "SND_SOC_SOF_INTEL_CNL");
 
 /* cannonlake ops */
 struct snd_sof_dsp_ops sof_cnl_ops;
-EXPORT_SYMBOL_NS(sof_cnl_ops, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(sof_cnl_ops, "SND_SOC_SOF_INTEL_CNL");
 
 int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 {
@@ -450,7 +450,7 @@ int sof_cnl_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 };
-EXPORT_SYMBOL_NS(sof_cnl_ops_init, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(sof_cnl_ops_init, "SND_SOC_SOF_INTEL_CNL");
 
 const struct sof_intel_dsp_desc cnl_chip_info = {
 	/* Cannonlake */
@@ -516,4 +516,4 @@ const struct sof_intel_dsp_desc jsl_chip_info = {
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_2_0,
 };
-EXPORT_SYMBOL_NS(jsl_chip_info, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(jsl_chip_info, "SND_SOC_SOF_INTEL_CNL");
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 1989147aa6a4..b1be03011d7e 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -99,7 +99,7 @@ void sof_hda_bus_init(struct snd_sof_dev *sdev, struct device *dev)
 	spin_lock_init(&bus->reg_lock);
 #endif /* CONFIG_SND_SOC_SOF_HDA_LINK */
 }
-EXPORT_SYMBOL_NS(sof_hda_bus_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_hda_bus_init, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void sof_hda_bus_exit(struct snd_sof_dev *sdev)
 {
@@ -109,4 +109,4 @@ void sof_hda_bus_exit(struct snd_sof_dev *sdev)
 	snd_hdac_ext_bus_exit(bus);
 #endif
 }
-EXPORT_SYMBOL_NS(sof_hda_bus_exit, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_hda_bus_exit, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index dc46888faa0d..568f3dfe822f 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -101,7 +101,7 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 
 	snd_hdac_chip_updatew(bus, WAKEEN, mask & STATESTS_INT_MASK, val);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_jack_wake_enable, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 /* check jack status after resuming from suspend mode */
 void hda_codec_jack_check(struct snd_sof_dev *sdev)
@@ -121,7 +121,7 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 		if (codec->jacktbl.used)
 			pm_request_resume(&codec->core.dev);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_jack_check, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 #if IS_ENABLED(CONFIG_SND_HDA_GENERIC)
 #define is_generic_config(bus) \
@@ -237,7 +237,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 		}
 	}
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_probe_bus, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_check_for_state_change(struct snd_sof_dev *sdev)
 {
@@ -250,7 +250,7 @@ void hda_codec_check_for_state_change(struct snd_sof_dev *sdev)
 		snd_hdac_chip_writew(bus, STATESTS, codec_mask);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_check_for_state_change, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_check_for_state_change, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_detect_mask(struct snd_sof_dev *sdev)
 {
@@ -275,7 +275,7 @@ void hda_codec_detect_mask(struct snd_sof_dev *sdev)
 			bus->codec_mask);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_detect_mask, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_detect_mask, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_init_cmd_io(struct snd_sof_dev *sdev)
 {
@@ -288,7 +288,7 @@ void hda_codec_init_cmd_io(struct snd_sof_dev *sdev)
 	/* initialize the codec command I/O */
 	snd_hdac_bus_init_cmd_io(bus);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_init_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_init_cmd_io, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev)
 {
@@ -302,7 +302,7 @@ void hda_codec_resume_cmd_io(struct snd_sof_dev *sdev)
 	if (bus->cmd_dma_state)
 		snd_hdac_bus_init_cmd_io(bus);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_resume_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_resume_cmd_io, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
 {
@@ -315,7 +315,7 @@ void hda_codec_stop_cmd_io(struct snd_sof_dev *sdev)
 	/* initialize the codec command I/O */
 	snd_hdac_bus_stop_cmd_io(bus);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_stop_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_stop_cmd_io, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev)
 {
@@ -330,7 +330,7 @@ void hda_codec_suspend_cmd_io(struct snd_sof_dev *sdev)
 		snd_hdac_bus_stop_cmd_io(bus);
 
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_suspend_cmd_io, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_suspend_cmd_io, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 {
@@ -343,7 +343,7 @@ void hda_codec_rirb_status_clear(struct snd_sof_dev *sdev)
 	/* clear rirb status */
 	snd_hdac_chip_writeb(bus, RIRBSTS, RIRB_INT_MASK);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_rirb_status_clear, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_rirb_status_clear, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
 {
@@ -354,7 +354,7 @@ void hda_codec_set_codec_wakeup(struct snd_sof_dev *sdev, bool status)
 
 	snd_hdac_set_codec_wakeup(bus, status);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_set_codec_wakeup, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev)
 {
@@ -381,7 +381,7 @@ bool hda_codec_check_rirb_status(struct snd_sof_dev *sdev)
 	}
 	return active;
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_check_rirb_status, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_check_rirb_status, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 void hda_codec_device_remove(struct snd_sof_dev *sdev)
 {
@@ -394,7 +394,7 @@ void hda_codec_device_remove(struct snd_sof_dev *sdev)
 	/* codec removal, invoke bus_device_remove */
 	snd_hdac_ext_bus_device_remove(bus);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_device_remove, SND_SOC_SOF_HDA_AUDIO_CODEC);
+EXPORT_SYMBOL_NS_GPL(hda_codec_device_remove, "SND_SOC_SOF_HDA_AUDIO_CODEC");
 
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
@@ -413,7 +413,7 @@ void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
 	}
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_i915_display_power, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_display_power, "SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
 
 int hda_codec_i915_init(struct snd_sof_dev *sdev)
 {
@@ -434,7 +434,7 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_i915_init, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_init, "SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
 
 int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 {
@@ -452,7 +452,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 
 	return snd_hdac_i915_exit(bus);
 }
-EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+EXPORT_SYMBOL_NS_GPL(hda_codec_i915_exit, "SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
 
 #endif
 
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index 5fc28039a8e8..746b426b1329 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -105,4 +105,4 @@ const struct snd_sof_dsp_ops sof_hda_common_ops = {
 
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 };
-EXPORT_SYMBOL_NS(sof_hda_common_ops, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(sof_hda_common_ops, "SND_SOC_SOF_INTEL_HDA_GENERIC");
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index b9a02750ce61..4f34fd919a00 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -128,7 +128,7 @@ int hda_dsp_ctrl_get_caps(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ctrl_get_caps, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_get_caps, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ctrl_ppcap_enable(struct snd_sof_dev *sdev, bool enable)
 {
@@ -137,7 +137,7 @@ void hda_dsp_ctrl_ppcap_enable(struct snd_sof_dev *sdev, bool enable)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_GPROCEN, val);
 }
-EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_enable, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
@@ -146,7 +146,7 @@ void hda_dsp_ctrl_ppcap_int_enable(struct snd_sof_dev *sdev, bool enable)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
 				SOF_HDA_PPCTL_PIE, val);
 }
-EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_int_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_ppcap_int_enable, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ctrl_misc_clock_gating(struct snd_sof_dev *sdev, bool enable)
 {
@@ -181,7 +181,7 @@ int hda_dsp_ctrl_clock_power_gating(struct snd_sof_dev *sdev, bool enable)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ctrl_clock_power_gating, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_clock_power_gating, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 {
@@ -266,7 +266,7 @@ int hda_dsp_ctrl_init_chip(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ctrl_init_chip, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ctrl_init_chip, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 {
@@ -329,6 +329,6 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev)
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF helpers for HDaudio platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_AUDIO_CODEC");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index ac505c7ad342..d65d63c25872 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -54,7 +54,7 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dai_config, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dai_config, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_LINK)
 
@@ -574,7 +574,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(sdw_hda_dai_hw_params, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sdw_hda_dai_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 			struct snd_soc_dai *cpu_dai,
@@ -603,14 +603,14 @@ int sdw_hda_dai_hw_free(struct snd_pcm_substream *substream,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(sdw_hda_dai_hw_free, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sdw_hda_dai_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int sdw_hda_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			struct snd_soc_dai *cpu_dai)
 {
 	return hda_dai_trigger(substream, cmd, cpu_dai);
 }
-EXPORT_SYMBOL_NS(sdw_hda_dai_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sdw_hda_dai_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static int hda_dai_suspend(struct hdac_bus *bus)
 {
@@ -725,7 +725,7 @@ void hda_set_dai_drv_ops(struct snd_sof_dev *sdev, struct snd_sof_dsp_ops *ops)
 		ipc4_data->nhlt = intel_nhlt_init(sdev->dev);
 	}
 }
-EXPORT_SYMBOL_NS(hda_set_dai_drv_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_set_dai_drv_ops, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_ops_free(struct snd_sof_dev *sdev)
 {
@@ -739,7 +739,7 @@ void hda_ops_free(struct snd_sof_dev *sdev)
 		sdev->private = NULL;
 	}
 }
-EXPORT_SYMBOL_NS(hda_ops_free, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ops_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /*
  * common dai driver for skl+ platforms.
@@ -891,7 +891,7 @@ struct snd_soc_dai_driver skl_dai[] = {
 },
 #endif
 };
-EXPORT_SYMBOL_NS(skl_dai, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(skl_dai, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_dais_suspend(struct snd_sof_dev *sdev)
 {
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4c88522d4048..14e8740392ce 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -90,7 +90,7 @@ u32 hda_get_interface_mask(struct snd_sof_dev *sdev)
 
 	return interface_mask[sdev->dspless_mode_selected];
 }
-EXPORT_SYMBOL_NS(hda_get_interface_mask, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_get_interface_mask, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
 {
@@ -120,7 +120,7 @@ bool hda_is_chain_dma_supported(struct snd_sof_dev *sdev, u32 dai_type)
 		return false;
 	}
 }
-EXPORT_SYMBOL_NS(hda_is_chain_dma_supported, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_is_chain_dma_supported, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /*
  * DSP Core control.
@@ -216,7 +216,7 @@ int hda_dsp_core_stall_reset(struct snd_sof_dev *sdev, unsigned int core_mask)
 	/* set reset state */
 	return hda_dsp_core_reset_enter(sdev, core_mask);
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_stall_reset, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_stall_reset, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
@@ -242,7 +242,7 @@ bool hda_dsp_core_is_enabled(struct snd_sof_dev *sdev, unsigned int core_mask)
 
 	return is_enable;
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_is_enabled, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_is_enabled, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
@@ -270,7 +270,7 @@ int hda_dsp_core_run(struct snd_sof_dev *sdev, unsigned int core_mask)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_run, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_run, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /*
  * Power Management.
@@ -322,7 +322,7 @@ int hda_dsp_core_power_up(struct snd_sof_dev *sdev, unsigned int core_mask)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_power_up, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_power_up, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static int hda_dsp_core_power_down(struct snd_sof_dev *sdev, unsigned int core_mask)
 {
@@ -370,7 +370,7 @@ int hda_dsp_enable_core(struct snd_sof_dev *sdev, unsigned int core_mask)
 
 	return hda_dsp_core_run(sdev, core_mask);
 }
-EXPORT_SYMBOL_NS(hda_dsp_enable_core, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_enable_core, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 				  unsigned int core_mask)
@@ -411,7 +411,7 @@ int hda_dsp_core_reset_power_down(struct snd_sof_dev *sdev,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_reset_power_down, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_reset_power_down, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev)
 {
@@ -430,7 +430,7 @@ void hda_dsp_ipc_int_enable(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
 				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_int_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_int_enable, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 {
@@ -448,7 +448,7 @@ void hda_dsp_ipc_int_disable(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
 			HDA_DSP_REG_HIPCCTL_BUSY | HDA_DSP_REG_HIPCCTL_DONE, 0);
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_int_disable, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_int_disable, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static int hda_dsp_wait_d0i3c_done(struct snd_sof_dev *sdev)
 {
@@ -732,7 +732,7 @@ int hda_dsp_set_power_state_ipc3(struct snd_sof_dev *sdev,
 
 	return hda_dsp_set_power_state(sdev, target_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_set_power_state_ipc3, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_set_power_state_ipc3, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_set_power_state_ipc4(struct snd_sof_dev *sdev,
 				 const struct sof_dsp_power_state *target_state)
@@ -744,7 +744,7 @@ int hda_dsp_set_power_state_ipc4(struct snd_sof_dev *sdev,
 
 	return hda_dsp_set_power_state(sdev, target_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_set_power_state_ipc4, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_set_power_state_ipc4, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /*
  * Audio DSP states may transform as below:-
@@ -953,7 +953,7 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_resume, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_resume, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 {
@@ -969,7 +969,7 @@ int hda_dsp_runtime_resume(struct snd_sof_dev *sdev)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_runtime_resume, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_runtime_resume, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 {
@@ -983,7 +983,7 @@ int hda_dsp_runtime_idle(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_runtime_idle, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_runtime_idle, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 {
@@ -1005,7 +1005,7 @@ int hda_dsp_runtime_suspend(struct snd_sof_dev *sdev)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_runtime_suspend, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_runtime_suspend, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 {
@@ -1066,7 +1066,7 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev, u32 target_state)
 
 	return snd_sof_dsp_set_power_state(sdev, &target_dsp_state);
 }
-EXPORT_SYMBOL_NS(hda_dsp_suspend, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_suspend, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static unsigned int hda_dsp_check_for_dma_streams(struct snd_sof_dev *sdev)
 {
@@ -1139,14 +1139,14 @@ int hda_dsp_shutdown_dma_flush(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_shutdown_dma_flush, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_shutdown_dma_flush, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_shutdown(struct snd_sof_dev *sdev)
 {
 	sdev->system_suspend_target = SOF_SUSPEND_S3;
 	return snd_sof_suspend(sdev->dev);
 }
-EXPORT_SYMBOL_NS(hda_dsp_shutdown, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_shutdown, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 {
@@ -1159,7 +1159,7 @@ int hda_dsp_set_hw_params_upon_resume(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_set_hw_params_upon_resume, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_set_hw_params_upon_resume, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_d0i3_work(struct work_struct *work)
 {
@@ -1186,7 +1186,7 @@ void hda_dsp_d0i3_work(struct work_struct *work)
 				    "error: failed to set DSP state %d substate %d\n",
 				    target_state.state, target_state.substate);
 }
-EXPORT_SYMBOL_NS(hda_dsp_d0i3_work, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_d0i3_work, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 {
@@ -1227,7 +1227,7 @@ int hda_dsp_core_get(struct snd_sof_dev *sdev, int core)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_core_get, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_core_get, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE)
 void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
@@ -1243,7 +1243,7 @@ void hda_common_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
 				HDA_DSP_REG_ADSPIC2_SNDW,
 				enable ? HDA_DSP_REG_ADSPIC2_SNDW : 0);
 }
-EXPORT_SYMBOL_NS(hda_common_enable_sdw_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_common_enable_sdw_irq, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 {
@@ -1257,7 +1257,7 @@ void hda_sdw_int_enable(struct snd_sof_dev *sdev, bool enable)
 	if (chip && chip->enable_sdw_irq)
 		chip->enable_sdw_irq(sdev, enable);
 }
-EXPORT_SYMBOL_NS(hda_sdw_int_enable, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_int_enable, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
 {
@@ -1281,7 +1281,7 @@ int hda_sdw_check_lcount_common(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_sdw_check_lcount_common, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_check_lcount_common, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev)
 {
@@ -1307,7 +1307,7 @@ int hda_sdw_check_lcount_ext(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_sdw_check_lcount_ext, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_check_lcount_ext, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 {
@@ -1319,7 +1319,7 @@ int hda_sdw_check_lcount(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_sdw_check_lcount, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_check_lcount, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 {
@@ -1333,7 +1333,7 @@ void hda_sdw_process_wakeen(struct snd_sof_dev *sdev)
 	if (chip && chip->sdw_process_wakeen)
 		chip->sdw_process_wakeen(sdev);
 }
-EXPORT_SYMBOL_NS(hda_sdw_process_wakeen, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #endif
 
@@ -1344,7 +1344,7 @@ int hda_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_disable_interrupts, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_disable_interrupts, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static const struct hda_dsp_msg_code hda_dsp_rom_fw_error_texts[] = {
 	{HDA_DSP_ROM_CSE_ERROR, "error: cse error"},
@@ -1555,7 +1555,7 @@ void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level)
 		dev_printk(level, sdev->dev, "error code: %#x (%s)\n", error_code,
 			   error_text);
 }
-EXPORT_SYMBOL_NS(hda_dsp_get_state, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_get_state, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static void hda_dsp_get_registers(struct snd_sof_dev *sdev,
 				  struct sof_ipc_dsp_oops_xtensa *xoops,
@@ -1628,4 +1628,4 @@ void hda_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 		hda_dsp_dump_ext_rom_status(sdev, level, flags);
 	}
 }
-EXPORT_SYMBOL_NS(hda_dsp_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_dump, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 9feaaa2d166a..f3fbf43a70c2 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -72,7 +72,7 @@ int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_send_msg, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_send_msg, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static inline bool hda_dsp_ipc4_pm_msg(u32 primary)
 {
@@ -99,7 +99,7 @@ void hda_dsp_ipc4_schedule_d0i3_work(struct sof_intel_hda_dev *hdev,
 	mod_delayed_work(system_wq, &hdev->d0i3_work,
 			 msecs_to_jiffies(SOF_HDA_D0I3_WORK_DELAY_MS));
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc4_schedule_d0i3_work, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc4_schedule_d0i3_work, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
@@ -126,7 +126,7 @@ int hda_dsp_ipc4_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc4_send_msg, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc4_send_msg, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 {
@@ -162,7 +162,7 @@ void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
 		snd_sof_ipc_get_reply(sdev);
 	}
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_get_reply, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_get_reply, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 {
@@ -245,7 +245,7 @@ irqreturn_t hda_dsp_ipc4_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc4_irq_thread, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc4_irq_thread, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /* IPC handler thread */
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
@@ -358,7 +358,7 @@ irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_irq_thread, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_irq_thread, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /* Check if an IPC IRQ occurred */
 bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
@@ -392,19 +392,19 @@ bool hda_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_check_ipc_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_check_ipc_irq, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return HDA_DSP_MBOX_UPLINK_OFFSET;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_get_mailbox_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_get_mailbox_offset, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return SRAM_WINDOW_OFFSET(id);
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc_get_window_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc_get_window_offset, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_sof_pcm_stream *sps,
@@ -430,7 +430,7 @@ int hda_ipc_msg_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_ipc_msg_data, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc_msg_data, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 			       struct snd_sof_pcm_stream *sps,
@@ -455,7 +455,7 @@ int hda_set_stream_data_offset(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_set_stream_data_offset, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_set_stream_data_offset, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_ipc4_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
@@ -469,7 +469,7 @@ void hda_ipc4_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 	else
 		hda_dsp_dump_ext_rom_status(sdev, level, flags);
 }
-EXPORT_SYMBOL_NS(hda_ipc4_dsp_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc4_dsp_dump, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
 {
@@ -481,7 +481,7 @@ bool hda_check_ipc_irq(struct snd_sof_dev *sdev)
 
 	return false;
 }
-EXPORT_SYMBOL_NS(hda_check_ipc_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_check_ipc_irq, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 {
@@ -502,7 +502,7 @@ void hda_ipc_irq_dump(struct snd_sof_dev *sdev)
 		intsts, intctl, rirbsts);
 	dev_err(sdev->dev, "dsp irq ppsts 0x%8.8x adspis 0x%8.8x\n", ppsts, adspis);
 }
-EXPORT_SYMBOL_NS(hda_ipc_irq_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc_irq_dump, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_ipc_dump(struct snd_sof_dev *sdev)
 {
@@ -522,7 +522,7 @@ void hda_ipc_dump(struct snd_sof_dev *sdev)
 	dev_err(sdev->dev, "host status 0x%8.8x dsp status 0x%8.8x mask 0x%8.8x\n",
 		hipcie, hipct, hipcctl);
 }
-EXPORT_SYMBOL_NS(hda_ipc_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc_dump, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_ipc4_dump(struct snd_sof_dev *sdev)
 {
@@ -541,7 +541,7 @@ void hda_ipc4_dump(struct snd_sof_dev *sdev)
 	dev_err(sdev->dev, "Host IPC initiator: %#x|%#x, target: %#x|%#x, ctl: %#x\n",
 		hipci, hipcie, hipct, hipcte, hipcctl);
 }
-EXPORT_SYMBOL_NS(hda_ipc4_dump, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc4_dump, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 bool hda_ipc4_tx_is_busy(struct snd_sof_dev *sdev)
 {
@@ -553,4 +553,4 @@ bool hda_ipc4_tx_is_busy(struct snd_sof_dev *sdev)
 
 	return !!(val & chip->ipc_req_mask);
 }
-EXPORT_SYMBOL_NS(hda_ipc4_tx_is_busy, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_ipc4_tx_is_busy, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 9d8ebb7c6a10..e91b6f9f5c28 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -95,7 +95,7 @@ struct hdac_ext_stream *hda_cl_prepare(struct device *dev, unsigned int format,
 	hda_dsp_stream_put(sdev, direction, hstream->stream_tag);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_NS(hda_cl_prepare, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_cl_prepare, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /*
  * first boot sequence has some extra steps.
@@ -219,7 +219,7 @@ int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	kfree(dump_msg);
 	return ret;
 }
-EXPORT_SYMBOL_NS(cl_dsp_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(cl_dsp_init, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int cmd)
 {
@@ -252,7 +252,7 @@ int hda_cl_trigger(struct device *dev, struct hdac_ext_stream *hext_stream, int
 		return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 	}
 }
-EXPORT_SYMBOL_NS(hda_cl_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_cl_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 		   struct hdac_ext_stream *hext_stream)
@@ -286,7 +286,7 @@ int hda_cl_cleanup(struct device *dev, struct snd_dma_buffer *dmab,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_cl_cleanup, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_cl_cleanup, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #define HDA_CL_DMA_IOC_TIMEOUT_MS 500
 
@@ -381,7 +381,7 @@ int hda_dsp_cl_boot_firmware_iccmax(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_cl_boot_firmware_iccmax, SND_SOC_SOF_INTEL_CNL);
+EXPORT_SYMBOL_NS(hda_dsp_cl_boot_firmware_iccmax, "SND_SOC_SOF_INTEL_CNL");
 
 static int hda_dsp_boot_imr(struct snd_sof_dev *sdev)
 {
@@ -535,7 +535,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_cl_boot_firmware, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_cl_boot_firmware, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 			      struct sof_ipc4_fw_library *fw_lib, bool reload)
@@ -639,7 +639,7 @@ int hda_dsp_ipc4_load_library(struct snd_sof_dev *sdev,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ipc4_load_library, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ipc4_load_library, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 					 const struct sof_ext_man_elem_header *hdr)
@@ -678,4 +678,4 @@ int hda_dsp_ext_man_get_cavs_config_data(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_ext_man_get_cavs_config_data, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_ext_man_get_cavs_config_data, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index 9a3559c78b62..251576e7294a 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -434,7 +434,7 @@ int hda_bus_ml_init(struct hdac_bus *bus)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_init, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_init, "SND_SOC_SOF_HDA_MLINK");
 
 void hda_bus_ml_free(struct hdac_bus *bus)
 {
@@ -452,7 +452,7 @@ void hda_bus_ml_free(struct hdac_bus *bus)
 		kfree(h2link);
 	}
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_free, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_free, "SND_SOC_SOF_HDA_MLINK");
 
 static struct hdac_ext2_link *
 find_ext2_link(struct hdac_bus *bus, bool alt, int elid)
@@ -479,7 +479,7 @@ int hdac_bus_eml_get_count(struct hdac_bus *bus, bool alt, int elid)
 
 	return h2link->slcount;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_get_count, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_count, "SND_SOC_SOF_HDA_MLINK");
 
 void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
@@ -501,7 +501,7 @@ void hdac_bus_eml_enable_interrupt(struct hdac_bus *bus, bool alt, int elid, boo
 
 	mutex_unlock(&h2link->eml_lock);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_enable_interrupt, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_enable_interrupt, "SND_SOC_SOF_HDA_MLINK");
 
 bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid)
 {
@@ -519,7 +519,7 @@ bool hdac_bus_eml_check_interrupt(struct hdac_bus *bus, bool alt, int elid)
 
 	return hdaml_link_check_interrupt(hlink->ml_addr + AZX_REG_ML_LCTL);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_check_interrupt, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_check_interrupt, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_set_syncprd_unlocked(struct hdac_bus *bus, bool alt, int elid, u32 syncprd)
 {
@@ -539,13 +539,13 @@ int hdac_bus_eml_set_syncprd_unlocked(struct hdac_bus *bus, bool alt, int elid,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_set_syncprd_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_set_syncprd_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_set_syncprd_unlocked(struct hdac_bus *bus, u32 syncprd)
 {
 	return hdac_bus_eml_set_syncprd_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, syncprd);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_syncprd_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_syncprd_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid)
 {
@@ -563,13 +563,13 @@ int hdac_bus_eml_wait_syncpu_unlocked(struct hdac_bus *bus, bool alt, int elid)
 
 	return hdaml_link_wait_syncpu(hlink->ml_addr + AZX_REG_ML_LSYNC);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_wait_syncpu_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_wait_syncpu_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_wait_syncpu_unlocked(struct hdac_bus *bus)
 {
 	return hdac_bus_eml_wait_syncpu_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_wait_syncpu_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_wait_syncpu_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 void hdac_bus_eml_sync_arm_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
@@ -587,13 +587,13 @@ void hdac_bus_eml_sync_arm_unlocked(struct hdac_bus *bus, bool alt, int elid, in
 
 	hdaml_link_sync_arm(hlink->ml_addr + AZX_REG_ML_LSYNC, sublink);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sync_arm_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sync_arm_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 void hdac_bus_eml_sdw_sync_arm_unlocked(struct hdac_bus *bus, int sublink)
 {
 	hdac_bus_eml_sync_arm_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_arm_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_arm_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid)
 {
@@ -613,13 +613,13 @@ int hdac_bus_eml_sync_go_unlocked(struct hdac_bus *bus, bool alt, int elid)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sync_go_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sync_go_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_sync_go_unlocked(struct hdac_bus *bus)
 {
 	return hdac_bus_eml_sync_go_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_go_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_sync_go_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 bool hdac_bus_eml_check_cmdsync_unlocked(struct hdac_bus *bus, bool alt, int elid)
 {
@@ -642,13 +642,13 @@ bool hdac_bus_eml_check_cmdsync_unlocked(struct hdac_bus *bus, bool alt, int eli
 	return hdaml_link_check_cmdsync(hlink->ml_addr + AZX_REG_ML_LSYNC,
 					cmdsync_mask);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_check_cmdsync_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_check_cmdsync_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 bool hdac_bus_eml_sdw_check_cmdsync_unlocked(struct hdac_bus *bus)
 {
 	return hdac_bus_eml_check_cmdsync_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_check_cmdsync_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_check_cmdsync_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 static int hdac_bus_eml_power_up_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 				      bool eml_lock)
@@ -690,13 +690,13 @@ int hdac_bus_eml_power_up(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
 	return hdac_bus_eml_power_up_base(bus, alt, elid, sublink, true);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_power_up, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_up, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_power_up_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
 	return hdac_bus_eml_power_up_base(bus, alt, elid, sublink, false);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_power_up_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_up_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 static int hdac_bus_eml_power_down_base(struct hdac_bus *bus, bool alt, int elid, int sublink,
 					bool eml_lock)
@@ -737,25 +737,25 @@ int hdac_bus_eml_power_down(struct hdac_bus *bus, bool alt, int elid, int sublin
 {
 	return hdac_bus_eml_power_down_base(bus, alt, elid, sublink, true);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_power_down, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_down, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_power_down_unlocked(struct hdac_bus *bus, bool alt, int elid, int sublink)
 {
 	return hdac_bus_eml_power_down_base(bus, alt, elid, sublink, false);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_power_down_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_power_up_unlocked(struct hdac_bus *bus, int sublink)
 {
 	return hdac_bus_eml_power_up_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_up_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_up_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_power_down_unlocked(struct hdac_bus *bus, int sublink)
 {
 	return hdac_bus_eml_power_down_unlocked(bus, true, AZX_REG_ML_LEPTR_ID_SDW, sublink);
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_power_down_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_get_lsdiid_unlocked(struct hdac_bus *bus, int sublink, u16 *lsdiid)
 {
@@ -771,7 +771,7 @@ int hdac_bus_eml_sdw_get_lsdiid_unlocked(struct hdac_bus *bus, int sublink, u16
 	*lsdiid = hdaml_link_get_lsdiid(hlink->ml_addr + AZX_REG_ML_LSDIID_OFFSET(sublink));
 
 	return 0;
-} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_lsdiid_unlocked, SND_SOC_SOF_HDA_MLINK);
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_lsdiid_unlocked, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
 {
@@ -791,7 +791,7 @@ int hdac_bus_eml_sdw_set_lsdiid(struct hdac_bus *bus, int sublink, int dev_num)
 	mutex_unlock(&h2link->eml_lock);
 
 	return 0;
-} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_lsdiid, SND_SOC_SOF_HDA_MLINK);
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_set_lsdiid, "SND_SOC_SOF_HDA_MLINK");
 
 /*
  * the 'y' parameter comes from the PCMSyCM hardware register naming. 'y' refers to the
@@ -835,7 +835,7 @@ int hdac_bus_eml_sdw_map_stream_ch(struct hdac_bus *bus, int sublink, int y,
 		sublink, channel_mask, stream_id, dir, val);
 
 	return 0;
-} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_map_stream_ch, SND_SOC_SOF_HDA_MLINK);
+} EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_map_stream_ch, "SND_SOC_SOF_HDA_MLINK");
 
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
@@ -848,7 +848,7 @@ void hda_bus_ml_put_all(struct hdac_bus *bus)
 			snd_hdac_ext_bus_link_put(bus, hlink);
 	}
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_put_all, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_put_all, "SND_SOC_SOF_HDA_MLINK");
 
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 {
@@ -858,7 +858,7 @@ void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 	list_for_each_entry(hlink, &bus->hlink_list, list)
 		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_reset_losidv, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_reset_losidv, "SND_SOC_SOF_HDA_MLINK");
 
 int hda_bus_ml_resume(struct hdac_bus *bus)
 {
@@ -877,7 +877,7 @@ int hda_bus_ml_resume(struct hdac_bus *bus)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_resume, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_resume, "SND_SOC_SOF_HDA_MLINK");
 
 int hda_bus_ml_suspend(struct hdac_bus *bus)
 {
@@ -895,7 +895,7 @@ int hda_bus_ml_suspend(struct hdac_bus *bus)
 	}
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hda_bus_ml_suspend, "SND_SOC_SOF_HDA_MLINK");
 
 struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid)
 {
@@ -907,7 +907,7 @@ struct mutex *hdac_bus_eml_get_mutex(struct hdac_bus *bus, bool alt, int elid)
 
 	return &h2link->eml_lock;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_get_mutex, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_get_mutex, "SND_SOC_SOF_HDA_MLINK");
 
 struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus)
 {
@@ -919,7 +919,7 @@ struct hdac_ext_link *hdac_bus_eml_ssp_get_hlink(struct hdac_bus *bus)
 
 	return &h2link->hext_link;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_ssp_get_hlink, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_ssp_get_hlink, "SND_SOC_SOF_HDA_MLINK");
 
 struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus)
 {
@@ -931,7 +931,7 @@ struct hdac_ext_link *hdac_bus_eml_dmic_get_hlink(struct hdac_bus *bus)
 
 	return &h2link->hext_link;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_dmic_get_hlink, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_dmic_get_hlink, "SND_SOC_SOF_HDA_MLINK");
 
 struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus)
 {
@@ -943,7 +943,7 @@ struct hdac_ext_link *hdac_bus_eml_sdw_get_hlink(struct hdac_bus *bus)
 
 	return &h2link->hext_link;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_hlink, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_sdw_get_hlink, "SND_SOC_SOF_HDA_MLINK");
 
 int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool enable)
 {
@@ -967,7 +967,7 @@ int hdac_bus_eml_enable_offload(struct hdac_bus *bus, bool alt, int elid, bool e
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, SND_SOC_SOF_HDA_MLINK);
+EXPORT_SYMBOL_NS(hdac_bus_eml_enable_offload, "SND_SOC_SOF_HDA_MLINK");
 
 #endif
 
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index f6e24edd7adb..5b5e484f9acf 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -142,7 +142,7 @@ int hda_dsp_pcm_hw_params(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_hw_params, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_hw_params, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /* update SPIB register with appl position */
 int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substream)
@@ -165,7 +165,7 @@ int hda_dsp_pcm_ack(struct snd_sof_dev *sdev, struct snd_pcm_substream *substrea
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_ack, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_ack, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream, int cmd)
@@ -175,7 +175,7 @@ int hda_dsp_pcm_trigger(struct snd_sof_dev *sdev,
 
 	return hda_dsp_stream_trigger(sdev, hext_stream, cmd);
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 				      struct snd_pcm_substream *substream)
@@ -207,7 +207,7 @@ snd_pcm_uframes_t hda_dsp_pcm_pointer(struct snd_sof_dev *sdev,
 	trace_sof_intel_hda_dsp_pcm(sdev, hstream, substream, pos);
 	return pos;
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_pointer, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_pointer, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream)
@@ -302,7 +302,7 @@ int hda_dsp_pcm_open(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_open, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_open, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 		      struct snd_pcm_substream *substream)
@@ -322,4 +322,4 @@ int hda_dsp_pcm_close(struct snd_sof_dev *sdev,
 	substream->runtime->private_data = NULL;
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_pcm_close, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_pcm_close, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index 3e33101f0521..c645346c2c84 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -139,12 +139,12 @@ int hda_probes_register(struct snd_sof_dev *sdev)
 	return sof_client_dev_register(sdev, "hda-probes", 0, &hda_probes_ops,
 				       sizeof(hda_probes_ops));
 }
-EXPORT_SYMBOL_NS(hda_probes_register, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_probes_register, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_probes_unregister(struct snd_sof_dev *sdev)
 {
 	sof_client_dev_unregister(sdev, "hda-probes", 0);
 }
-EXPORT_SYMBOL_NS(hda_probes_unregister, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_probes_unregister, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 3ac63ce67ab1..95eca9658837 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -27,7 +27,7 @@
 int sof_hda_position_quirk = SOF_HDA_POSITION_QUIRK_USE_DPIB_REGISTERS;
 module_param_named(position_quirk, sof_hda_position_quirk, int, 0444);
 MODULE_PARM_DESC(position_quirk, "SOF HDaudio position quirk");
-EXPORT_SYMBOL_NS(sof_hda_position_quirk, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_hda_position_quirk, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #define HDA_LTRP_GB_VALUE_US	95
 
@@ -712,7 +712,7 @@ int hda_dsp_stream_hw_free(struct snd_sof_dev *sdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_stream_hw_free, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_stream_hw_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 {
@@ -735,7 +735,7 @@ bool hda_dsp_check_stream_irq(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_check_stream_irq, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_check_stream_irq, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 static void
 hda_dsp_compr_bytes_transferred(struct hdac_stream *hstream, int direction)
@@ -832,7 +832,7 @@ irqreturn_t hda_dsp_stream_threaded_handler(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(hda_dsp_stream_threaded_handler, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_stream_threaded_handler, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 {
@@ -970,7 +970,7 @@ int hda_dsp_stream_init(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(hda_dsp_stream_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_stream_init, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 {
@@ -1000,7 +1000,7 @@ void hda_dsp_stream_free(struct snd_sof_dev *sdev)
 		devm_kfree(sdev->dev, hda_stream);
 	}
 }
-EXPORT_SYMBOL_NS(hda_dsp_stream_free, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_stream_free, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 					      int direction, bool can_sleep)
@@ -1087,7 +1087,7 @@ snd_pcm_uframes_t hda_dsp_stream_get_position(struct hdac_stream *hstream,
 
 	return pos;
 }
-EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_stream_get_position, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 #define merge_u64(u32_u, u32_l) (((u64)(u32_u) << 32) | (u32_l))
 
@@ -1127,7 +1127,7 @@ u64 hda_dsp_get_stream_llp(struct snd_sof_dev *sdev,
 
 	return merge_u64(llp_u, llp_l);
 }
-EXPORT_SYMBOL_NS(hda_dsp_get_stream_llp, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_get_stream_llp, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 /**
  * hda_dsp_get_stream_ldp - Retrieve the LDP (Linear DMA Position) of the stream
@@ -1159,4 +1159,4 @@ u64 hda_dsp_get_stream_ldp(struct snd_sof_dev *sdev,
 
 	return ((u64)ldp_u << 32) | ldp_l;
 }
-EXPORT_SYMBOL_NS(hda_dsp_get_stream_ldp, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_get_stream_ldp, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index 351eb2eb184b..5da8188ffcfe 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -68,7 +68,7 @@ int hda_dsp_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_trace_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_trace_init, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_trace_release(struct snd_sof_dev *sdev)
 {
@@ -87,7 +87,7 @@ int hda_dsp_trace_release(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "DMA trace stream is not opened!\n");
 	return -ENODEV;
 }
-EXPORT_SYMBOL_NS(hda_dsp_trace_release, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_trace_release, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd)
 {
@@ -95,4 +95,4 @@ int hda_dsp_trace_trigger(struct snd_sof_dev *sdev, int cmd)
 
 	return hda_dsp_stream_trigger(sdev, hda->dtrace_stream, cmd);
 }
-EXPORT_SYMBOL_NS(hda_dsp_trace_trigger, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(hda_dsp_trace_trigger, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 70fc08c8fc99..1ad167914349 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -238,7 +238,7 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 
 	return sdw_intel_startup(hdev->sdw);
 }
-EXPORT_SYMBOL_NS(hda_sdw_startup, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_sdw_startup, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 static int hda_sdw_exit(struct snd_sof_dev *sdev)
 {
@@ -280,7 +280,7 @@ bool hda_common_check_sdw_irq(struct snd_sof_dev *sdev)
 out:
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_common_check_sdw_irq, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_common_check_sdw_irq, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 static bool hda_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
 {
@@ -314,7 +314,7 @@ bool hda_sdw_check_wakeen_irq_common(struct snd_sof_dev *sdev)
 
 	return false;
 }
-EXPORT_SYMBOL_NS(hda_sdw_check_wakeen_irq_common, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_sdw_check_wakeen_irq_common, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 static bool hda_sdw_check_wakeen_irq(struct snd_sof_dev *sdev)
 {
@@ -345,7 +345,7 @@ void hda_sdw_process_wakeen_common(struct snd_sof_dev *sdev)
 
 	sdw_intel_process_wakeen_event(hdev->sdw);
 }
-EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_sdw_process_wakeen_common, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 #else /* IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) */
 static inline int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
@@ -418,7 +418,7 @@ int hda_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	/* re-enable clock gating and power gating */
 	return hda_dsp_ctrl_clock_power_gating(sdev, true);
 }
-EXPORT_SYMBOL_NS(hda_dsp_post_fw_run, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_dsp_post_fw_run, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 /*
  * Debug
@@ -739,7 +739,7 @@ int hda_dsp_probe_early(struct snd_sof_dev *sdev)
 err:
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_probe_early, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_dsp_probe_early, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 int hda_dsp_probe(struct snd_sof_dev *sdev)
 {
@@ -896,7 +896,7 @@ int hda_dsp_probe(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(hda_dsp_probe, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_dsp_probe, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 void hda_dsp_remove(struct snd_sof_dev *sdev)
 {
@@ -950,7 +950,7 @@ void hda_dsp_remove(struct snd_sof_dev *sdev)
 	if (!sdev->dspless_mode_selected)
 		iounmap(sdev->bar[HDA_DSP_BAR]);
 }
-EXPORT_SYMBOL_NS(hda_dsp_remove, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_dsp_remove, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 void hda_dsp_remove_late(struct snd_sof_dev *sdev)
 {
@@ -966,7 +966,7 @@ int hda_power_down_dsp(struct snd_sof_dev *sdev)
 
 	return hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
 }
-EXPORT_SYMBOL_NS(hda_power_down_dsp, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_power_down_dsp, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 static void hda_generic_machine_select(struct snd_sof_dev *sdev,
@@ -1464,7 +1464,7 @@ int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	return sof_pci_probe(pci, pci_id);
 }
-EXPORT_SYMBOL_NS(hda_pci_intel_probe, SND_SOC_SOF_INTEL_HDA_GENERIC);
+EXPORT_SYMBOL_NS(hda_pci_intel_probe, "SND_SOC_SOF_INTEL_HDA_GENERIC");
 
 int hda_register_clients(struct snd_sof_dev *sdev)
 {
@@ -1478,13 +1478,13 @@ void hda_unregister_clients(struct snd_sof_dev *sdev)
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for HDaudio platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
-MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
-MODULE_IMPORT_NS(SOUNDWIRE_INTEL);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_ACPI_INTEL_MATCH);
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_AUDIO_CODEC");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_AUDIO_CODEC_I915");
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_INTEL_SOUNDWIRE_ACPI");
+MODULE_IMPORT_NS("SOUNDWIRE_INTEL_INIT");
+MODULE_IMPORT_NS("SOUNDWIRE_INTEL");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_ACPI_INTEL_MATCH");
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index 3d5a1f8b17e5..dceff819cb75 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -22,7 +22,7 @@
 
 /* LunarLake ops */
 struct snd_sof_dsp_ops sof_lnl_ops;
-EXPORT_SYMBOL_NS(sof_lnl_ops, SND_SOC_SOF_INTEL_LNL);
+EXPORT_SYMBOL_NS(sof_lnl_ops, "SND_SOC_SOF_INTEL_LNL");
 
 static const struct snd_sof_debugfs_map lnl_dsp_debugfs[] = {
 	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
@@ -182,7 +182,7 @@ int sof_lnl_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 };
-EXPORT_SYMBOL_NS(sof_lnl_ops_init, SND_SOC_SOF_INTEL_LNL);
+EXPORT_SYMBOL_NS(sof_lnl_ops_init, "SND_SOC_SOF_INTEL_LNL");
 
 /* Check if an SDW IRQ occurred */
 static bool lnl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
@@ -271,4 +271,4 @@ const struct sof_intel_dsp_desc ptl_chip_info = {
 	.disable_interrupts = lnl_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_ACE_3_0,
 };
-EXPORT_SYMBOL_NS(ptl_chip_info, SND_SOC_SOF_INTEL_LNL);
+EXPORT_SYMBOL_NS(ptl_chip_info, "SND_SOC_SOF_INTEL_LNL");
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index 2b9d22ccf345..d07c68f431ba 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -77,7 +77,7 @@ bool mtl_dsp_check_ipc_irq(struct snd_sof_dev *sdev)
 
 	return false;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_check_ipc_irq, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_check_ipc_irq, "SND_SOC_SOF_INTEL_MTL");
 
 /* Check if an SDW IRQ occurred */
 static bool mtl_dsp_check_sdw_irq(struct snd_sof_dev *sdev)
@@ -121,7 +121,7 @@ int mtl_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_ipc_send_msg, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_ipc_send_msg, "SND_SOC_SOF_INTEL_MTL");
 
 void mtl_enable_ipc_interrupts(struct snd_sof_dev *sdev)
 {
@@ -149,7 +149,7 @@ void mtl_disable_ipc_interrupts(struct snd_sof_dev *sdev)
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, chip->ipc_ctl,
 				MTL_DSP_REG_HFIPCXCTL_BUSY | MTL_DSP_REG_HFIPCXCTL_DONE, 0);
 }
-EXPORT_SYMBOL_NS(mtl_disable_ipc_interrupts, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_disable_ipc_interrupts, "SND_SOC_SOF_INTEL_MTL");
 
 static void mtl_enable_sdw_irq(struct snd_sof_dev *sdev, bool enable)
 {
@@ -234,7 +234,7 @@ int mtl_enable_interrupts(struct snd_sof_dev *sdev, bool enable)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(mtl_enable_interrupts, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_enable_interrupts, "SND_SOC_SOF_INTEL_MTL");
 
 /* pre fw run operations */
 int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
@@ -297,7 +297,7 @@ int mtl_dsp_pre_fw_run(struct snd_sof_dev *sdev)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_pre_fw_run, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_pre_fw_run, "SND_SOC_SOF_INTEL_MTL");
 
 int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 {
@@ -324,7 +324,7 @@ int mtl_dsp_post_fw_run(struct snd_sof_dev *sdev)
 	hda_sdw_int_enable(sdev, true);
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_post_fw_run, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_post_fw_run, "SND_SOC_SOF_INTEL_MTL");
 
 void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
@@ -342,7 +342,7 @@ void mtl_dsp_dump(struct snd_sof_dev *sdev, u32 flags)
 
 	sof_ipc4_intel_dump_telemetry_state(sdev, flags);
 }
-EXPORT_SYMBOL_NS(mtl_dsp_dump, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_dump, "SND_SOC_SOF_INTEL_MTL");
 
 static bool mtl_dsp_primary_core_is_enabled(struct snd_sof_dev *sdev)
 {
@@ -453,7 +453,7 @@ int mtl_power_down_dsp(struct snd_sof_dev *sdev)
 					     (dsphfdsscs & cpa) == 0, HDA_DSP_REG_POLL_INTERVAL_US,
 					     HDA_DSP_RESET_TIMEOUT_US);
 }
-EXPORT_SYMBOL_NS(mtl_power_down_dsp, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_power_down_dsp, "SND_SOC_SOF_INTEL_MTL");
 
 int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 {
@@ -556,7 +556,7 @@ int mtl_dsp_cl_init(struct snd_sof_dev *sdev, int stream_tag, bool imr_boot)
 	kfree(dump_msg);
 	return ret;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_cl_init, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_cl_init, "SND_SOC_SOF_INTEL_MTL");
 
 irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 {
@@ -640,19 +640,19 @@ irqreturn_t mtl_ipc_irq_thread(int irq, void *context)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS(mtl_ipc_irq_thread, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_ipc_irq_thread, "SND_SOC_SOF_INTEL_MTL");
 
 int mtl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
 	return MTL_DSP_MBOX_UPLINK_OFFSET;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_mailbox_offset, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_mailbox_offset, "SND_SOC_SOF_INTEL_MTL");
 
 int mtl_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
 	return MTL_SRAM_WINDOW_OFFSET(id);
 }
-EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_window_offset, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_ipc_get_window_offset, "SND_SOC_SOF_INTEL_MTL");
 
 void mtl_ipc_dump(struct snd_sof_dev *sdev)
 {
@@ -670,7 +670,7 @@ void mtl_ipc_dump(struct snd_sof_dev *sdev)
 		"Host IPC initiator: %#x|%#x|%#x, target: %#x|%#x|%#x, ctl: %#x\n",
 		hipcidr, hipcidd, hipcida, hipctdr, hipctdd, hipctda, hipcctl);
 }
-EXPORT_SYMBOL_NS(mtl_ipc_dump, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_ipc_dump, "SND_SOC_SOF_INTEL_MTL");
 
 static int mtl_dsp_disable_interrupts(struct snd_sof_dev *sdev)
 {
@@ -691,7 +691,7 @@ int mtl_dsp_core_get(struct snd_sof_dev *sdev, int core)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_core_get, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_core_get, "SND_SOC_SOF_INTEL_MTL");
 
 int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 {
@@ -709,7 +709,7 @@ int mtl_dsp_core_put(struct snd_sof_dev *sdev, int core)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS(mtl_dsp_core_put, SND_SOC_SOF_INTEL_MTL);
+EXPORT_SYMBOL_NS(mtl_dsp_core_put, "SND_SOC_SOF_INTEL_MTL");
 
 /* Meteorlake ops */
 struct snd_sof_dsp_ops sof_mtl_ops;
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index f006dcf5458a..94ab3c61e3f7 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -106,6 +106,6 @@ module_pci_driver(snd_sof_pci_intel_apl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for ApolloLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index a8406342f08b..739c352c3860 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -144,6 +144,6 @@ module_pci_driver(snd_sof_pci_intel_cnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for CannonLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index 25effca50d9f..8545ab95eac8 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -109,7 +109,7 @@ module_pci_driver(snd_sof_pci_intel_icl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for IceLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_CNL");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 602c574064eb..8d4d74ac4398 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -71,8 +71,8 @@ module_pci_driver(snd_sof_pci_intel_lnl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for LunarLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_MTL);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index 8cb0333c033e..71f711cf8599 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -134,6 +134,6 @@ module_pci_driver(snd_sof_pci_intel_mtl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for MeteorLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-ptl.c b/sound/soc/sof/intel/pci-ptl.c
index 69195b5e7b1a..0aacdfac9fb4 100644
--- a/sound/soc/sof/intel/pci-ptl.c
+++ b/sound/soc/sof/intel/pci-ptl.c
@@ -69,9 +69,9 @@ module_pci_driver(snd_sof_pci_intel_ptl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for PantherLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_LNL);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_MTL);
-MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_LNL");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_MTL");
+MODULE_IMPORT_NS("SND_SOC_SOF_HDA_MLINK");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 8ca0231d7e4f..bd9daae51e4c 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -90,6 +90,6 @@ module_pci_driver(snd_sof_pci_intel_skl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for SkyLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index 01db2e720b44..f76a7197f6ca 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -318,7 +318,7 @@ module_pci_driver(snd_sof_pci_intel_tgl_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for TigerLake platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_GENERIC);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HDA_COMMON);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_CNL);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_GENERIC");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HDA_COMMON");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_CNL");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index 1375c393827e..b585ac4a85c2 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -245,7 +245,7 @@ module_pci_driver(snd_sof_pci_intel_tng_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for Tangier platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_HIFI_EP_IPC);
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
-MODULE_IMPORT_NS(SND_SOC_SOF_INTEL_ATOM_HIFI_EP);
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_HIFI_EP_IPC");
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_SOC_SOF_PCI_DEV");
+MODULE_IMPORT_NS("SND_SOC_SOF_INTEL_ATOM_HIFI_EP");
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 9a002811e9ff..0696bce65e33 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -50,7 +50,7 @@ static int skl_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 
 /* skylake ops */
 struct snd_sof_dsp_ops sof_skl_ops;
-EXPORT_SYMBOL_NS(sof_skl_ops, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_skl_ops, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 int sof_skl_ops_init(struct snd_sof_dev *sdev)
 {
@@ -96,7 +96,7 @@ int sof_skl_ops_init(struct snd_sof_dev *sdev)
 
 	return 0;
 };
-EXPORT_SYMBOL_NS(sof_skl_ops_init, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_skl_ops_init, "SND_SOC_SOF_INTEL_HDA_COMMON");
 
 const struct sof_intel_dsp_desc skl_chip_info = {
 	.cores_num = 2,
@@ -114,4 +114,4 @@ const struct sof_intel_dsp_desc skl_chip_info = {
 	.disable_interrupts = hda_dsp_disable_interrupts,
 	.hw_ip_version = SOF_INTEL_CAVS_1_5,
 };
-EXPORT_SYMBOL_NS(skl_chip_info, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(skl_chip_info, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/intel/telemetry.c b/sound/soc/sof/intel/telemetry.c
index 2d2f96548310..dcaaf03599db 100644
--- a/sound/soc/sof/intel/telemetry.c
+++ b/sound/soc/sof/intel/telemetry.c
@@ -93,4 +93,4 @@ void sof_ipc4_intel_dump_telemetry_state(struct snd_sof_dev *sdev, u32 flags)
 free_telemetry_data:
 	kfree(telemetry_data);
 }
-EXPORT_SYMBOL_NS(sof_ipc4_intel_dump_telemetry_state, SND_SOC_SOF_INTEL_HDA_COMMON);
+EXPORT_SYMBOL_NS(sof_ipc4_intel_dump_telemetry_state, "SND_SOC_SOF_INTEL_HDA_COMMON");
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 9466f7d2e535..9955dfa520ae 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -668,5 +668,5 @@ module_platform_driver(snd_sof_of_mt8186_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for MT8186/MT8188 platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_SOC_SOF_MTK_COMMON");
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 5b4423ed8023..6032b566c679 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -624,5 +624,5 @@ module_platform_driver(snd_sof_of_mt8195_driver);
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for MTL 8195 platforms");
-MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
-MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
+MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
+MODULE_IMPORT_NS("SND_SOC_SOF_MTK_COMMON");
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index b196b2b74c26..0632005955bd 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -41,7 +41,7 @@ const struct dev_pm_ops sof_acpi_pm = {
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
 			   snd_sof_runtime_idle)
 };
-EXPORT_SYMBOL_NS(sof_acpi_pm, SND_SOC_SOF_ACPI_DEV);
+EXPORT_SYMBOL_NS(sof_acpi_pm, "SND_SOC_SOF_ACPI_DEV");
 
 static void sof_acpi_probe_complete(struct device *dev)
 {
@@ -85,7 +85,7 @@ int sof_acpi_probe(struct platform_device *pdev, const struct sof_dev_desc *desc
 	/* call sof helper for DSP hardware probe */
 	return snd_sof_device_probe(dev, sof_pdata);
 }
-EXPORT_SYMBOL_NS(sof_acpi_probe, SND_SOC_SOF_ACPI_DEV);
+EXPORT_SYMBOL_NS(sof_acpi_probe, "SND_SOC_SOF_ACPI_DEV");
 
 void sof_acpi_remove(struct platform_device *pdev)
 {
@@ -97,7 +97,7 @@ void sof_acpi_remove(struct platform_device *pdev)
 	/* call sof helper for DSP hardware remove */
 	snd_sof_device_remove(dev);
 }
-EXPORT_SYMBOL_NS(sof_acpi_remove, SND_SOC_SOF_ACPI_DEV);
+EXPORT_SYMBOL_NS(sof_acpi_remove, "SND_SOC_SOF_ACPI_DEV");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for ACPI platforms");
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index e7d2001140e8..b35c98896968 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -396,4 +396,4 @@ module_auxiliary_driver(sof_ipc_flood_client_drv);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SOF IPC Flood Test Client Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index d3f541069b24..8b28c3dc920c 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -159,4 +159,4 @@ module_auxiliary_driver(sof_msg_inject_client_drv);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SOF IPC Kernel Injector Client Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index d0f8beb9d000..ba7ca1c5027f 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -337,4 +337,4 @@ module_auxiliary_driver(sof_msg_inject_client_drv);
 
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SOF IPC Message Injector Client Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index ccc7d38ddc38..aff9ce980429 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -542,4 +542,4 @@ module_auxiliary_driver(sof_probes_client_drv);
 
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("SOF Probes Client Driver");
-MODULE_IMPORT_NS(SND_SOC_SOF_CLIENT);
+MODULE_IMPORT_NS("SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 5d6005a88e79..4c7951338c66 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -259,7 +259,7 @@ int sof_client_dev_register(struct snd_sof_dev *sdev, const char *name, u32 id,
 
 	return ret;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_dev_register, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_dev_register, "SND_SOC_SOF_CLIENT");
 
 void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 id)
 {
@@ -282,7 +282,7 @@ void sof_client_dev_unregister(struct snd_sof_dev *sdev, const char *name, u32 i
 
 	mutex_unlock(&sdev->ipc_client_mutex);
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, "SND_SOC_SOF_CLIENT");
 
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes)
@@ -301,7 +301,7 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, "SND_SOC_SOF_CLIENT");
 
 int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *msg_buf)
 {
@@ -320,7 +320,7 @@ int sof_client_ipc_rx_message(struct sof_client_dev *cdev, void *ipc_msg, void *
 
 	return -EOPNOTSUPP;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_ipc_rx_message, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc_rx_message, "SND_SOC_SOF_CLIENT");
 
 int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 				bool set)
@@ -339,7 +339,7 @@ int sof_client_ipc_set_get_data(struct sof_client_dev *cdev, void *ipc_msg,
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc_set_get_data, "SND_SOC_SOF_CLIENT");
 
 #ifdef CONFIG_SND_SOC_SOF_IPC4
 struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c, const guid_t *uuid)
@@ -352,7 +352,7 @@ struct sof_ipc4_fw_module *sof_client_ipc4_find_module(struct sof_client_dev *c,
 
 	return NULL;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_module, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_ipc4_find_module, "SND_SOC_SOF_CLIENT");
 #endif
 
 int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
@@ -376,7 +376,7 @@ int sof_suspend_clients(struct snd_sof_dev *sdev, pm_message_t state)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sof_suspend_clients, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_suspend_clients, "SND_SOC_SOF_CLIENT");
 
 int sof_resume_clients(struct snd_sof_dev *sdev)
 {
@@ -399,20 +399,20 @@ int sof_resume_clients(struct snd_sof_dev *sdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sof_resume_clients, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_resume_clients, "SND_SOC_SOF_CLIENT");
 
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev)
 {
 	return cdev->sdev->debugfs_root;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_debugfs_root, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_debugfs_root, "SND_SOC_SOF_CLIENT");
 
 /* DMA buffer allocation in client drivers must use the core SOF device */
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev)
 {
 	return cdev->sdev->dev;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_dma_dev, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_dma_dev, "SND_SOC_SOF_CLIENT");
 
 const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev *cdev)
 {
@@ -420,7 +420,7 @@ const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev
 
 	return &sdev->fw_ready.version;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_version, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_version, "SND_SOC_SOF_CLIENT");
 
 size_t sof_client_get_ipc_max_payload_size(struct sof_client_dev *cdev)
 {
@@ -428,7 +428,7 @@ size_t sof_client_get_ipc_max_payload_size(struct sof_client_dev *cdev)
 
 	return sdev->ipc->max_payload_size;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_max_payload_size, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_max_payload_size, "SND_SOC_SOF_CLIENT");
 
 enum sof_ipc_type sof_client_get_ipc_type(struct sof_client_dev *cdev)
 {
@@ -436,7 +436,7 @@ enum sof_ipc_type sof_client_get_ipc_type(struct sof_client_dev *cdev)
 
 	return sdev->pdata->ipc_type;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_type, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_type, "SND_SOC_SOF_CLIENT");
 
 /* module refcount management of SOF core */
 int sof_client_core_module_get(struct sof_client_dev *cdev)
@@ -448,7 +448,7 @@ int sof_client_core_module_get(struct sof_client_dev *cdev)
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_core_module_get, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_core_module_get, "SND_SOC_SOF_CLIENT");
 
 void sof_client_core_module_put(struct sof_client_dev *cdev)
 {
@@ -456,7 +456,7 @@ void sof_client_core_module_put(struct sof_client_dev *cdev)
 
 	module_put(sdev->dev->driver->owner);
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_core_module_put, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_core_module_put, "SND_SOC_SOF_CLIENT");
 
 /* IPC event handling */
 void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf)
@@ -525,7 +525,7 @@ int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_register_ipc_rx_handler, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_register_ipc_rx_handler, "SND_SOC_SOF_CLIENT");
 
 void sof_client_unregister_ipc_rx_handler(struct sof_client_dev *cdev,
 					  u32 ipc_msg_type)
@@ -545,7 +545,7 @@ void sof_client_unregister_ipc_rx_handler(struct sof_client_dev *cdev,
 
 	mutex_unlock(&sdev->client_event_handler_mutex);
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_unregister_ipc_rx_handler, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_unregister_ipc_rx_handler, "SND_SOC_SOF_CLIENT");
 
 /*DSP state notification and query */
 void sof_client_fw_state_dispatcher(struct snd_sof_dev *sdev)
@@ -583,7 +583,7 @@ int sof_client_register_fw_state_handler(struct sof_client_dev *cdev,
 
 	return 0;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_register_fw_state_handler, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_register_fw_state_handler, "SND_SOC_SOF_CLIENT");
 
 void sof_client_unregister_fw_state_handler(struct sof_client_dev *cdev)
 {
@@ -602,7 +602,7 @@ void sof_client_unregister_fw_state_handler(struct sof_client_dev *cdev)
 
 	mutex_unlock(&sdev->client_event_handler_mutex);
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_unregister_fw_state_handler, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_unregister_fw_state_handler, "SND_SOC_SOF_CLIENT");
 
 enum sof_fw_state sof_client_get_fw_state(struct sof_client_dev *cdev)
 {
@@ -610,4 +610,4 @@ enum sof_fw_state sof_client_get_fw_state(struct sof_client_dev *cdev)
 
 	return sdev->fw_state;
 }
-EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_state, SND_SOC_SOF_CLIENT);
+EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_state, "SND_SOC_SOF_CLIENT");
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 38f2187da5de..c1a8c3ca082a 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -162,7 +162,7 @@ const struct dev_pm_ops sof_pci_pm = {
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
 			   snd_sof_runtime_idle)
 };
-EXPORT_SYMBOL_NS(sof_pci_pm, SND_SOC_SOF_PCI_DEV);
+EXPORT_SYMBOL_NS(sof_pci_pm, "SND_SOC_SOF_PCI_DEV");
 
 static void sof_pci_probe_complete(struct device *dev)
 {
@@ -280,7 +280,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	return ret;
 }
-EXPORT_SYMBOL_NS(sof_pci_probe, SND_SOC_SOF_PCI_DEV);
+EXPORT_SYMBOL_NS(sof_pci_probe, "SND_SOC_SOF_PCI_DEV");
 
 void sof_pci_remove(struct pci_dev *pci)
 {
@@ -295,13 +295,13 @@ void sof_pci_remove(struct pci_dev *pci)
 	/* release pci regions and disable device */
 	pci_release_regions(pci);
 }
-EXPORT_SYMBOL_NS(sof_pci_remove, SND_SOC_SOF_PCI_DEV);
+EXPORT_SYMBOL_NS(sof_pci_remove, "SND_SOC_SOF_PCI_DEV");
 
 void sof_pci_shutdown(struct pci_dev *pci)
 {
 	snd_sof_device_shutdown(&pci->dev);
 }
-EXPORT_SYMBOL_NS(sof_pci_shutdown, SND_SOC_SOF_PCI_DEV);
+EXPORT_SYMBOL_NS(sof_pci_shutdown, "SND_SOC_SOF_PCI_DEV");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF support for PCI platforms");
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index 3cf8c84beff9..50623e65fe1a 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -149,7 +149,7 @@ const struct dsp_arch_ops sof_xtensa_arch_ops = {
 	.dsp_oops = xtensa_dsp_oops,
 	.dsp_stack = xtensa_stack,
 };
-EXPORT_SYMBOL_NS(sof_xtensa_arch_ops, SND_SOC_SOF_XTENSA);
+EXPORT_SYMBOL_NS(sof_xtensa_arch_ops, "SND_SOC_SOF_XTENSA");
 
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_DESCRIPTION("SOF Xtensa DSP support");
diff --git a/tools/testing/cxl/cxl_core_exports.c b/tools/testing/cxl/cxl_core_exports.c
index 077e6883921d..f088792a8925 100644
--- a/tools/testing/cxl/cxl_core_exports.c
+++ b/tools/testing/cxl/cxl_core_exports.c
@@ -4,4 +4,4 @@
 #include "cxl.h"
 
 /* Exporting of cxl_core symbols that are only used by cxl_test */
-EXPORT_SYMBOL_NS_GPL(cxl_num_decoders_committed, CXL);
+EXPORT_SYMBOL_NS_GPL(cxl_num_decoders_committed, "CXL");
diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
index 050725afa45d..d0337c11f9ee 100644
--- a/tools/testing/cxl/test/cxl.c
+++ b/tools/testing/cxl/test/cxl.c
@@ -1531,5 +1531,5 @@ MODULE_PARM_DESC(interleave_arithmetic, "Modulo:0, XOR:1");
 module_init(cxl_test_init);
 module_exit(cxl_test_exit);
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(ACPI);
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("ACPI");
+MODULE_IMPORT_NS("CXL");
diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
index 71916e0e1546..347c1e7b37bd 100644
--- a/tools/testing/cxl/test/mem.c
+++ b/tools/testing/cxl/test/mem.c
@@ -1679,4 +1679,4 @@ static struct platform_driver cxl_mock_mem_driver = {
 
 module_platform_driver(cxl_mock_mem_driver);
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("CXL");
diff --git a/tools/testing/cxl/test/mock.c b/tools/testing/cxl/test/mock.c
index f4ce96cc11d4..450c7566c33f 100644
--- a/tools/testing/cxl/test/mock.c
+++ b/tools/testing/cxl/test/mock.c
@@ -76,7 +76,7 @@ int __wrap_acpi_table_parse_cedt(enum acpi_cedt_type id,
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_acpi_table_parse_cedt, ACPI);
+EXPORT_SYMBOL_NS_GPL(__wrap_acpi_table_parse_cedt, "ACPI");
 
 acpi_status __wrap_acpi_evaluate_integer(acpi_handle handle,
 					 acpi_string pathname,
@@ -147,7 +147,7 @@ struct cxl_hdm *__wrap_devm_cxl_setup_hdm(struct cxl_port *port,
 
 	return cxlhdm;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_setup_hdm, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_setup_hdm, "CXL");
 
 int __wrap_devm_cxl_add_passthrough_decoder(struct cxl_port *port)
 {
@@ -162,7 +162,7 @@ int __wrap_devm_cxl_add_passthrough_decoder(struct cxl_port *port)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_add_passthrough_decoder, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_add_passthrough_decoder, "CXL");
 
 int __wrap_devm_cxl_enumerate_decoders(struct cxl_hdm *cxlhdm,
 				       struct cxl_endpoint_dvsec_info *info)
@@ -179,7 +179,7 @@ int __wrap_devm_cxl_enumerate_decoders(struct cxl_hdm *cxlhdm,
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_enumerate_decoders, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_enumerate_decoders, "CXL");
 
 int __wrap_devm_cxl_port_enumerate_dports(struct cxl_port *port)
 {
@@ -194,7 +194,7 @@ int __wrap_devm_cxl_port_enumerate_dports(struct cxl_port *port)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_port_enumerate_dports, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_port_enumerate_dports, "CXL");
 
 int __wrap_cxl_await_media_ready(struct cxl_dev_state *cxlds)
 {
@@ -209,7 +209,7 @@ int __wrap_cxl_await_media_ready(struct cxl_dev_state *cxlds)
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_await_media_ready, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_await_media_ready, "CXL");
 
 int __wrap_cxl_hdm_decode_init(struct cxl_dev_state *cxlds,
 			       struct cxl_hdm *cxlhdm,
@@ -226,7 +226,7 @@ int __wrap_cxl_hdm_decode_init(struct cxl_dev_state *cxlds,
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_hdm_decode_init, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_hdm_decode_init, "CXL");
 
 int __wrap_cxl_dvsec_rr_decode(struct device *dev, struct cxl_port *port,
 			       struct cxl_endpoint_dvsec_info *info)
@@ -242,7 +242,7 @@ int __wrap_cxl_dvsec_rr_decode(struct device *dev, struct cxl_port *port,
 
 	return rc;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_dvsec_rr_decode, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_dvsec_rr_decode, "CXL");
 
 struct cxl_dport *__wrap_devm_cxl_add_rch_dport(struct cxl_port *port,
 						struct device *dport_dev,
@@ -266,7 +266,7 @@ struct cxl_dport *__wrap_devm_cxl_add_rch_dport(struct cxl_port *port,
 
 	return dport;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_add_rch_dport, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_devm_cxl_add_rch_dport, "CXL");
 
 resource_size_t __wrap_cxl_rcd_component_reg_phys(struct device *dev,
 						  struct cxl_dport *dport)
@@ -283,7 +283,7 @@ resource_size_t __wrap_cxl_rcd_component_reg_phys(struct device *dev,
 
 	return component_reg_phys;
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_rcd_component_reg_phys, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_rcd_component_reg_phys, "CXL");
 
 void __wrap_cxl_endpoint_parse_cdat(struct cxl_port *port)
 {
@@ -297,7 +297,7 @@ void __wrap_cxl_endpoint_parse_cdat(struct cxl_port *port)
 		cxl_endpoint_parse_cdat(port);
 	put_cxl_mock_ops(index);
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_endpoint_parse_cdat, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_endpoint_parse_cdat, "CXL");
 
 void __wrap_cxl_dport_init_ras_reporting(struct cxl_dport *dport, struct device *host)
 {
@@ -309,8 +309,8 @@ void __wrap_cxl_dport_init_ras_reporting(struct cxl_dport *dport, struct device
 
 	put_cxl_mock_ops(index);
 }
-EXPORT_SYMBOL_NS_GPL(__wrap_cxl_dport_init_ras_reporting, CXL);
+EXPORT_SYMBOL_NS_GPL(__wrap_cxl_dport_init_ras_reporting, "CXL");
 
 MODULE_LICENSE("GPL v2");
-MODULE_IMPORT_NS(ACPI);
-MODULE_IMPORT_NS(CXL);
+MODULE_IMPORT_NS("ACPI");
+MODULE_IMPORT_NS("CXL");

