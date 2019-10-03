Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 478D7C96BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 04:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfJCChY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Oct 2019 22:37:24 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:53302 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbfJCChY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Oct 2019 22:37:24 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x932aVWg021578;
        Thu, 3 Oct 2019 11:36:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x932aVWg021578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570070192;
        bh=LP0Xhzi9qR0mSHkbibcTK1g5jYagA5pJi1SkU63VT2o=;
        h=From:To:Cc:Subject:Date:From;
        b=rTKfKaN9GTJhMkdu60OPQQahUz+dR52OCXatwL1Ce27MtOKPPuo8MKXmXoFdGIt7f
         34uizYl/Oi3YgeHKAmxUYYbAUe66vg1qo2ItPKYWIsg55RzV8W5xBUYXaJ5wIqhPp5
         Ps0+UzbDFDI43iYUWugk8Y+YOQGtTfYokWZkmdp+vPfqOLNQpV5YsWWx8p3kmv+tsw
         fgVwzyP9UoznjLV3rdDsQQ/zpMUzDHI44Oxwda47osKeOsJareKvH/FVJsxnJNyDFo
         NTMKhdQT4yb0ePoNkbt0y/Gnb8CrKugemudlYD+DUvxllSVC8mM4CVmt047mnyxUEl
         at5SncHoB9G5w==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: update compile-test header list for v5.4-rc2
Date:   Thu,  3 Oct 2019 11:36:29 +0900
Message-Id: <20191003023629.13175-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 6dc280ebeed2 ("coda: remove uapi/linux/coda_psdev.h") removed
a header in question. Some more build errors were fixed. Add more
headers into the test coverage.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - remove linux/coda_psdev.h as well

 usr/include/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index c9449aaf438d..57b20f7b6729 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -29,13 +29,11 @@ header-test- += linux/android/binderfs.h
 header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
 header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
 header-test- += linux/coda.h
-header-test- += linux/coda_psdev.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
 header-test- += linux/fsmap.h
 header-test- += linux/hdlc/ioctl.h
 header-test- += linux/ivtv.h
-header-test- += linux/jffs2.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
 header-test- += linux/netfilter_ipv4/ipt_LOG.h
@@ -55,20 +53,12 @@ header-test- += linux/v4l2-mediabus.h
 header-test- += linux/v4l2-subdev.h
 header-test- += linux/videodev2.h
 header-test- += linux/vm_sockets.h
-header-test- += scsi/scsi_bsg_fc.h
-header-test- += scsi/scsi_netlink.h
-header-test- += scsi/scsi_netlink_fc.h
 header-test- += sound/asequencer.h
 header-test- += sound/asoc.h
 header-test- += sound/asound.h
 header-test- += sound/compress_offload.h
 header-test- += sound/emu10k1.h
 header-test- += sound/sfnt_info.h
-header-test- += sound/sof/eq.h
-header-test- += sound/sof/fw.h
-header-test- += sound/sof/header.h
-header-test- += sound/sof/manifest.h
-header-test- += sound/sof/trace.h
 header-test- += xen/evtchn.h
 header-test- += xen/gntdev.h
 header-test- += xen/privcmd.h
-- 
2.17.1

