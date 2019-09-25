Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB79BD8CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2019 09:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2442502AbfIYHKk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Sep 2019 03:10:40 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:22256 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442475AbfIYHKj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Sep 2019 03:10:39 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x8P7AXL1030367;
        Wed, 25 Sep 2019 16:10:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x8P7AXL1030367
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569395434;
        bh=RPBLJhcII5PA1lzM/5iitkgrGECZzhGu7zJvG1eo1vg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HLW0S7BiIiU/TAz4BVOeJZHk5wbVjxu3ohdBEdrqUa2AoBpac2CtiLhX84+N/Skby
         /rPP573wPAaD8buZWdbCt/k7lqkUiiV+nwi56RPO+ApCYYcQEh73vQLAUpIlJoGFAa
         KFiOcvbWgN60kcB9Xdt9TKvp1st8//cyLAEJOSqs0PkqcIsyc8b/0iHiF3DemA2C5x
         NvWoGiAhRNTVOuTpeATSNa0zuS3NBuOFXXt5DybSxD0idXgTimqFW3oQKlVA6nBuRf
         eLW4ArmJeUdZheInknZ02m1B94FWalk5amsgrv/lnXdw4oRSXu6syAI8szbgF7fiY0
         9aQ/JmPvTD2oA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/3] kbuild: detect missing header include guard
Date:   Wed, 25 Sep 2019 16:10:31 +0900
Message-Id: <20190925071032.18354-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190925071032.18354-1-yamada.masahiro@socionext.com>
References: <20190925071032.18354-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Our convention is to surround the whole of the header content with an
include guard. This avoids the same header being parsed over again
when it is included multiple times.

The header-test-y syntax allows the comprehensive sanity checks of
headers. This commit adds another check; if include guard is missing,
the header will fail to build due to redefinition of something.

More headers must be excluded from the test-coverage for now.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---

 include/Kbuild         | 26 ++++++++++++++++++++++++++
 scripts/Makefile.build |  3 ++-
 usr/include/Makefile   |  3 +++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/Kbuild b/include/Kbuild
index ffba79483cc5..4c49b9ae4b4d 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -133,6 +133,7 @@ header-test-			+= linux/cyclades.h
 header-test-			+= linux/dcookies.h
 header-test-			+= linux/delayacct.h
 header-test-			+= linux/delayed_call.h
+header-test-			+= linux/device_cgroup.h
 header-test-			+= linux/device-mapper.h
 header-test-			+= linux/devpts_fs.h
 header-test-			+= linux/dio.h
@@ -146,12 +147,15 @@ header-test-			+= linux/dma/sprd-dma.h
 header-test-			+= linux/dns_resolver.h
 header-test-			+= linux/drbd_genl.h
 header-test-			+= linux/drbd_genl_api.h
+header-test-			+= linux/dsa/lan9303.h
+header-test-			+= linux/dtlk.h
 header-test-			+= linux/dw_apb_timer.h
 header-test-			+= linux/dynamic_debug.h
 header-test-			+= linux/dynamic_queue_limits.h
 header-test-			+= linux/ecryptfs.h
 header-test-			+= linux/edma.h
 header-test-			+= linux/eeprom_93cx6.h
+header-test-			+= linux/eeprom_93xx46.h
 header-test-			+= linux/efs_vh.h
 header-test-			+= linux/elevator.h
 header-test-			+= linux/elfcore-compat.h
@@ -169,6 +173,7 @@ header-test-			+= linux/firmware/trusted_foundations.h
 header-test-			+= linux/firmware/xlnx-zynqmp.h
 header-test-			+= linux/fixp-arith.h
 header-test-			+= linux/flat.h
+header-test-			+= linux/fs_pin.h
 header-test-			+= linux/fs_types.h
 header-test-			+= linux/fs_uart_pd.h
 header-test-			+= linux/fsi-occ.h
@@ -189,6 +194,7 @@ header-test-			+= linux/gpio/aspeed.h
 header-test-			+= linux/gpio/gpio-reg.h
 header-test-			+= linux/hid-debug.h
 header-test-			+= linux/hiddev.h
+header-test-			+= linux/hil_mlc.h
 header-test-			+= linux/hippidevice.h
 header-test-			+= linux/hmm.h
 header-test-			+= linux/hp_sdc.h
@@ -237,6 +243,7 @@ header-test-			+= linux/input/bu21013.h
 header-test-			+= linux/input/cma3000.h
 header-test-			+= linux/input/kxtj9.h
 header-test-			+= linux/input/lm8333.h
+header-test-			+= linux/input/navpoint.h
 header-test-			+= linux/input/sparse-keymap.h
 header-test-			+= linux/input/touchscreen.h
 header-test-			+= linux/input/tps6507x-ts.h
@@ -327,6 +334,7 @@ header-test-			+= linux/mfd/lpc_ich.h
 header-test-			+= linux/mfd/max77693.h
 header-test-			+= linux/mfd/max8998-private.h
 header-test-			+= linux/mfd/menelaus.h
+header-test-			+= linux/mfd/motorola-cpcap.h
 header-test-			+= linux/mfd/mt6397/core.h
 header-test-			+= linux/mfd/palmas.h
 header-test-			+= linux/mfd/pcf50633/backlight.h
@@ -448,6 +456,7 @@ header-test-			+= linux/platform_data/ads7828.h
 header-test-			+= linux/platform_data/apds990x.h
 header-test-			+= linux/platform_data/arm-ux500-pm.h
 header-test-			+= linux/platform_data/asoc-s3c.h
+header-test-			+= linux/platform_data/asoc-s3c24xx_simtec.h
 header-test-			+= linux/platform_data/at91_adc.h
 header-test-			+= linux/platform_data/ata-pxa.h
 header-test-			+= linux/platform_data/atmel.h
@@ -479,14 +488,17 @@ header-test-			+= linux/platform_data/i2c-imx.h
 header-test-			+= linux/platform_data/i2c-mux-reg.h
 header-test-			+= linux/platform_data/i2c-ocores.h
 header-test-			+= linux/platform_data/i2c-xiic.h
+header-test-			+= linux/platform_data/ina2xx.h
 header-test-			+= linux/platform_data/intel-spi.h
 header-test-			+= linux/platform_data/invensense_mpu6050.h
+header-test-			+= linux/platform_data/iommu-omap.h
 header-test-			+= linux/platform_data/irda-pxaficp.h
 header-test-			+= linux/platform_data/irda-sa11x0.h
 header-test-			+= linux/platform_data/itco_wdt.h
 header-test-			+= linux/platform_data/jz4740/jz4740_nand.h
 header-test-			+= linux/platform_data/keyboard-pxa930_rotary.h
 header-test-			+= linux/platform_data/keypad-omap.h
+header-test-			+= linux/platform_data/leds-lm355x.h
 header-test-			+= linux/platform_data/leds-lp55xx.h
 header-test-			+= linux/platform_data/leds-omap.h
 header-test-			+= linux/platform_data/lp855x.h
@@ -497,6 +509,7 @@ header-test-			+= linux/platform_data/max732x.h
 header-test-			+= linux/platform_data/mcs.h
 header-test-			+= linux/platform_data/mdio-bcm-unimac.h
 header-test-			+= linux/platform_data/mdio-gpio.h
+header-test-			+= linux/platform_data/media/mmp-camera.h
 header-test-			+= linux/platform_data/media/si4713.h
 header-test-			+= linux/platform_data/mlxreg.h
 header-test-			+= linux/platform_data/mmc-omap.h
@@ -584,6 +597,7 @@ header-test-			+= linux/qed/storage_common.h
 header-test-			+= linux/qed/tcp_common.h
 header-test-			+= linux/qnx6_fs.h
 header-test-			+= linux/quicklist.h
+header-test-			+= linux/raid_class.h
 header-test-			+= linux/ramfs.h
 header-test-			+= linux/range.h
 header-test-			+= linux/rcu_node_tree.h
@@ -613,6 +627,7 @@ header-test-			+= linux/sched/deadline.h
 header-test-			+= linux/sched/smt.h
 header-test-			+= linux/sched/sysctl.h
 header-test-			+= linux/sched_clock.h
+header-test-			+= linux/scmi_protocol.h
 header-test-			+= linux/scpi_protocol.h
 header-test-			+= linux/scx200_gpio.h
 header-test-			+= linux/seccomp.h
@@ -621,6 +636,7 @@ header-test-			+= linux/seg6_iptunnel.h
 header-test-			+= linux/selection.h
 header-test-			+= linux/set_memory.h
 header-test-			+= linux/shrinker.h
+header-test-			+= linux/siox.h
 header-test-			+= linux/sirfsoc_dma.h
 header-test-			+= linux/skb_array.h
 header-test-			+= linux/slab_def.h
@@ -660,6 +676,7 @@ header-test-			+= linux/spi/sh_msiof.h
 header-test-			+= linux/spi/spi-fsl-dspi.h
 header-test-			+= linux/spi/spi_bitbang.h
 header-test-			+= linux/spi/spi_gpio.h
+header-test-			+= linux/spi/tle62x0.h
 header-test-			+= linux/spi/xilinx_spi.h
 header-test-			+= linux/spinlock_api_smp.h
 header-test-			+= linux/spinlock_api_up.h
@@ -677,6 +694,7 @@ header-test-			+= linux/stackdepot.h
 header-test-			+= linux/stmp3xxx_rtc_wdt.h
 header-test-			+= linux/string_helpers.h
 header-test-			+= linux/sungem_phy.h
+header-test-			+= linux/sunrpc/gss_krb5.h
 header-test-			+= linux/sunrpc/msg_prot.h
 header-test-			+= linux/sunrpc/rpc_pipe_fs.h
 header-test-			+= linux/sunrpc/xprtmultipath.h
@@ -741,6 +759,7 @@ header-test-			+= linux/vmw_vmci_api.h
 header-test-			+= linux/vmw_vmci_defs.h
 header-test-			+= linux/vringh.h
 header-test-			+= linux/vt_buffer.h
+header-test-			+= linux/yam.h
 header-test-			+= linux/zorro.h
 header-test-			+= linux/zpool.h
 header-test-			+= math-emu/double.h
@@ -930,6 +949,7 @@ header-test-			+= soc/tegra/bpmp-abi.h
 header-test-			+= soc/tegra/common.h
 header-test-			+= soc/tegra/flowctrl.h
 header-test-			+= soc/tegra/fuse.h
+header-test-			+= soc/tegra/ivc.h
 header-test-			+= soc/tegra/mc.h
 header-test-			+= sound/ac97/compat.h
 header-test-			+= sound/aci.h
@@ -1008,6 +1028,7 @@ header-test-			+= sound/wm8996.h
 header-test-			+= sound/wm9081.h
 header-test-			+= sound/wm9090.h
 header-test-			+= target/iscsi/iscsi_target_stat.h
+header-test-			+= target/iscsi/iscsi_transport.h
 header-test-			+= trace/bpf_probe.h
 header-test-			+= trace/events/9p.h
 header-test-			+= trace/events/afs.h
@@ -1058,8 +1079,10 @@ header-test-			+= trace/perf.h
 header-test-			+= trace/trace_events.h
 header-test-			+= uapi/drm/vmwgfx_drm.h
 header-test-			+= uapi/linux/a.out.h
+header-test-			+= uapi/linux/chio.h
 header-test-			+= uapi/linux/coda.h
 header-test-			+= uapi/linux/coda_psdev.h
+header-test-			+= uapi/linux/coff.h
 header-test-			+= uapi/linux/errqueue.h
 header-test-			+= uapi/linux/eventpoll.h
 header-test-			+= uapi/linux/hdlc/ioctl.h
@@ -1071,6 +1094,7 @@ header-test-			+= uapi/linux/mic_common.h
 header-test-			+= uapi/linux/mman.h
 header-test-			+= uapi/linux/nilfs2_ondisk.h
 header-test-			+= uapi/linux/patchkey.h
+header-test-			+= uapi/linux/pg.h
 header-test-			+= uapi/linux/ptrace.h
 header-test-			+= uapi/linux/scc.h
 header-test-			+= uapi/linux/seg6_iptunnel.h
@@ -1091,12 +1115,14 @@ header-test-			+= vdso/vsyscall.h
 header-test-			+= video/broadsheetfb.h
 header-test-			+= video/cvisionppc.h
 header-test-			+= video/gbe.h
+header-test-			+= video/ili9320.h
 header-test-			+= video/kyro.h
 header-test-			+= video/maxinefb.h
 header-test-			+= video/metronomefb.h
 header-test-			+= video/neomagic.h
 header-test-			+= video/of_display_timing.h
 header-test-			+= video/omapvrfb.h
+header-test-			+= video/platform_lcd.h
 header-test-			+= video/s1d13xxxfb.h
 header-test-			+= video/sstfb.h
 header-test-			+= video/tgafb.h
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f72aba64d611..052cb418eb5f 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -286,8 +286,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # header test (header-test-y, header-test-m target)
 # ---------------------------------------------------------------------------
 
+# include the header twice to catch missing header include guard.
 quiet_cmd_cc_s_h = CC      $@
-      cmd_cc_s_h = $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $<
+      cmd_cc_s_h = $(CC) $(c_flags) -S -o $@ -x c /dev/null -include $< -include $<
 
 $(obj)/%.h.s: $(src)/%.h FORCE
 	$(call if_changed_dep,cc_s_h)
diff --git a/usr/include/Makefile b/usr/include/Makefile
index 4ef9946775ee..944eb8097702 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -28,8 +28,10 @@ header-test- += linux/android/binder.h
 header-test- += linux/android/binderfs.h
 header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
 header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
+header-test- += linux/chio.h
 header-test- += linux/coda.h
 header-test- += linux/coda_psdev.h
+header-test- += linux/coff.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
@@ -44,6 +46,7 @@ header-test- += linux/nfc.h
 header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
 header-test- += linux/patchkey.h
+header-test- += linux/pg.h
 header-test- += linux/phonet.h
 header-test- += linux/reiserfs_xattr.h
 header-test- += linux/scc.h
-- 
2.17.1

