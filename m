Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 832B36B6A0
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 08:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfGQG3n (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 02:29:43 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:32864 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfGQG3n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 02:29:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x6H6TEhF019338;
        Wed, 17 Jul 2019 15:29:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x6H6TEhF019338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563344955;
        bh=KcHQBUXdsKArHIJm3xcxgFJariXFB0ZgqeLvjtXjwps=;
        h=From:To:Cc:Subject:Date:From;
        b=FRemP7Mf5jJVbRUlIyN9Sv5IOxqT7BOM2WGsoQ7QGl0JiBhti7F9vSC/ajjR3ozfH
         FIofFSkkp5e3q91Mrkukv2c/FkM1at5YqLwhNd0XjB/Cpfn5p8rSgwT9bW5823hO8w
         EnhQXegunluc+SZh1LvoD6oOef1RHgaGrHMCXNJ8x2T+j4XjyGfqYh6hWla/1ZO7xq
         4oENZnhRy0dYVqumiHmNHf6Q2flA3ZLfpr12AV1NHienqpIolaX229VU39YTuD3U4t
         sdQhDHsyKpk8nU/aI8DfSobdURI46ymYMnysA4Xy15ONDzZrGSm/hZxZtbcfhxE0g+
         ue6ZZ60ajE+jw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: update compile-test headers for v5.3-rc1
Date:   Wed, 17 Jul 2019 15:29:13 +0900
Message-Id: <20190717062913.11437-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

- Some headers graduated from the blacklist

- hyperv_timer.h joined the header-test when CONFIG_X86=y

- nf_tables*.h joined the header-test when CONFIG_NF_TABLES is
  enabled.

- The entry for nf_tables_offload.h was added to fix build error for
  the combination of CONFIG_NF_TABLES=n and CONFIG_KERNEL_HEADER_TEST=y.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Remove rdma_counter.h from the exclude list

 include/Kbuild       | 13 +++++--------
 usr/include/Makefile |  8 --------
 2 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/include/Kbuild b/include/Kbuild
index 7e9f1acb9dd5..8c71f906d322 100644
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
@@ -949,7 +947,6 @@ header-test-			+= pcmcia/ds.h
 header-test-			+= rdma/ib.h
 header-test-			+= rdma/iw_portmap.h
 header-test-			+= rdma/opa_port_info.h
-header-test-			+= rdma/rdma_counter.h
 header-test-			+= rdma/rdmavt_cq.h
 header-test-			+= rdma/restrack.h
 header-test-			+= rdma/signature.h
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

