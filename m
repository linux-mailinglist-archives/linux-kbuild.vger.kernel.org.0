Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50CD66A9A7
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 15:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387445AbfGPNas (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 09:30:48 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:45278 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728004AbfGPNas (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 09:30:48 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x6GDTm1T024692;
        Tue, 16 Jul 2019 22:29:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x6GDTm1T024692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563283797;
        bh=zHgV4u7LzggfP9NW2eZEPpjwg78NW8hpybrVmWWB2N4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ATRKUMGl8fnjGL4qrSXkkXRV3FGRx/viUThasPrpFi7GywloEV6QuswGRt+aeQ3hN
         dJXcbK6NFL0zSlNZmWRYe7Ap2FXPK/6it7SaLZ30aLIxqndWMO2PWXg0Liwn9QJq42
         vyaHjO4ybYjJApzRtsNOAV5k/ZN9Q8ISVcNYsux8/4ewKYtqQl6AH+82lbmMtEfoBJ
         zhw9qaskM1V6jSDA2x+pOT+FI5ORcE0ATFhbxRbqP1rVwK42ixPaGFNP+4qtnuOyFo
         0X7nMUmHefmrK5shCcsd2OdGnqDgp+PXEjZmaDP+ugLpTCs/luwOIM9bquF6Q5LibM
         pxxWmvmpT0cMQ==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: update header compile-test list for v5.3-rc1
Date:   Tue, 16 Jul 2019 22:29:46 +0900
Message-Id: <20190716132946.1057-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190716132946.1057-1-yamada.masahiro@socionext.com>
References: <20190716132946.1057-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some headers graduated from the blacklist.

Let hyperv_timer.h join the header-test when CONFIG_X86=y.

Add CONFIG guards to nf_tables*.h because they can be compiled
when CONFIG_NF_TABLES is enabled.

Add a new entry for nf_tables_offload.h to fix the build error for the
combination of CONFIG_NF_TABLES=n and CONFIG_KERNEL_HEADER_TEST=y.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 include/Kbuild       | 12 +++++-------
 usr/include/Makefile |  8 --------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/include/Kbuild b/include/Kbuild
index 7e9f1acb9dd5..4aa62237897c 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -31,7 +31,7 @@ header-test-			+= acpi/platform/acintel.h
 header-test-			+= acpi/platform/aclinux.h
 header-test-			+= acpi/platform/aclinuxex.h
 header-test-			+= acpi/processor.h
-header-test-			+= clocksource/hyperv_timer.h
+header-test-$(CONFIG_X86)	+= clocksource/hyperv_timer.h
 header-test-			+= clocksource/timer-sp804.h
 header-test-			+= crypto/cast_common.h
 header-test-			+= crypto/internal/cryptouser.h
@@ -454,9 +454,6 @@ header-test-			+= linux/phy/omap_control_phy.h
 header-test-			+= linux/phy/tegra/xusb.h
 header-test-			+= linux/phy/ulpi_phy.h
 header-test-			+= linux/phy_fixed.h
-header-test-			+= linux/pinctrl/pinconf-generic.h
-header-test-			+= linux/pinctrl/pinconf.h
-header-test-			+= linux/pinctrl/pinctrl.h
 header-test-			+= linux/pipe_fs_i.h
 header-test-			+= linux/pktcdvd.h
 header-test-			+= linux/pl320-ipc.h
@@ -905,10 +902,11 @@ header-test-			+= net/netfilter/nf_nat_redirect.h
 header-test-			+= net/netfilter/nf_queue.h
 header-test-			+= net/netfilter/nf_reject.h
 header-test-			+= net/netfilter/nf_synproxy.h
-header-test-			+= net/netfilter/nf_tables.h
-header-test-			+= net/netfilter/nf_tables_core.h
-header-test-			+= net/netfilter/nf_tables_ipv4.h
+header-test-$(CONFIG_NF_TABLES)	+= net/netfilter/nf_tables.h
+header-test-$(CONFIG_NF_TABLES)	+= net/netfilter/nf_tables_core.h
+header-test-$(CONFIG_NF_TABLES)	+= net/netfilter/nf_tables_ipv4.h
 header-test-			+= net/netfilter/nf_tables_ipv6.h
+header-test-$(CONFIG_NF_TABLES)	+= net/netfilter/nf_tables_offload.h
 header-test-			+= net/netfilter/nft_fib.h
 header-test-			+= net/netfilter/nft_meta.h
 header-test-			+= net/netfilter/nft_reject.h
diff --git a/usr/include/Makefile b/usr/include/Makefile
index cd8daa20d487..aa316d99e035 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -30,8 +30,6 @@ header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
 header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
 header-test- += linux/coda.h
 header-test- += linux/coda_psdev.h
-header-test- += linux/dvb/audio.h
-header-test- += linux/dvb/osd.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
@@ -44,7 +42,6 @@ header-test- += linux/netfilter_bridge/ebtables.h
 header-test- += linux/netfilter_ipv4/ipt_LOG.h
 header-test- += linux/netfilter_ipv6/ip6t_LOG.h
 header-test- += linux/nfc.h
-header-test- += linux/nilfs2_ondisk.h
 header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
 header-test- += linux/patchkey.h
@@ -59,9 +56,6 @@ header-test- += linux/v4l2-mediabus.h
 header-test- += linux/v4l2-subdev.h
 header-test- += linux/videodev2.h
 header-test- += linux/vm_sockets.h
-header-test- += misc/ocxl.h
-header-test- += mtd/mtd-abi.h
-header-test- += mtd/mtd-user.h
 header-test- += scsi/scsi_bsg_fc.h
 header-test- += scsi/scsi_netlink.h
 header-test- += scsi/scsi_netlink_fc.h
@@ -108,7 +102,6 @@ header-test- += linux/bpf_perf_event.h
 endif
 
 ifeq ($(SRCARCH),s390)
-header-test- += asm/runtime_instr.h
 header-test- += asm/zcrypt.h
 endif
 
@@ -116,7 +109,6 @@ ifeq ($(SRCARCH),sparc)
 header-test- += asm/stat.h
 header-test- += asm/uctx.h
 header-test- += asm/fbio.h
-header-test- += asm/openpromio.h
 endif
 
 # asm-generic/*.h is used by asm/*.h, and should not be included directly
-- 
2.17.1

