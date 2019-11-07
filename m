Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 303CBF31F1
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2019 16:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfKGPFM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 7 Nov 2019 10:05:12 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:62497 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfKGPFM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Nov 2019 10:05:12 -0500
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id xA7F4wlE029099;
        Fri, 8 Nov 2019 00:04:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com xA7F4wlE029099
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573139098;
        bh=HRymCPGkNeC4eTV9sFwnVIKdoxUkVCWDkRb7kEv3o5w=;
        h=From:To:Cc:Subject:Date:From;
        b=lX2tdaFaju5UtHtxbYB3zO3rGcIbylNcRMmHIpT7z0QjbHxvwq1cVNMP+4wXZ+XRa
         9ukbyx/5dwKC5aPZcYaXnCAUvt1FKhYY08LG6swmvTXdWfczZBP4xCa0G4aslAkfjF
         Iy3+cwGn7IO3dhkpadV9gGzdOZX5Mw7xck9Wqj/WsHGzvTa597742Gcxmt3tY5Xq81
         Ccff8F4DGTuic2Eg2mZLzTsBKyeH60wSMFM4itfc3dUIxJWa4Q8LGXNxNAFKqYFNdD
         OJbXC5JSb2DjNn/aN/DDyuoqDWTIHYNzUTT3odDal4QTOXL7SAb2JXvS6T7H11FNMh
         BozE15JHljlXQ==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: update compile-test header list for v5.5-rc1
Date:   Fri,  8 Nov 2019 00:04:52 +0900
Message-Id: <20191107150452.2682-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 707816c8b050 ("netfilter: remove deprecation warnings from
uapi headers."), you can compile linux/netfilter_ipv4/ipt_LOG.h and
linux/netfilter_ipv6/ip6t_LOG.h without warnings.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 usr/include/Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/usr/include/Makefile b/usr/include/Makefile
index 57b20f7b6729..3e1adab089a4 100644
--- a/usr/include/Makefile
+++ b/usr/include/Makefile
@@ -26,8 +26,6 @@ header-test- += drm/vmwgfx_drm.h
 header-test- += linux/am437x-vpfe.h
 header-test- += linux/android/binder.h
 header-test- += linux/android/binderfs.h
-header-test-$(CONFIG_CPU_BIG_ENDIAN) += linux/byteorder/big_endian.h
-header-test-$(CONFIG_CPU_LITTLE_ENDIAN) += linux/byteorder/little_endian.h
 header-test- += linux/coda.h
 header-test- += linux/elfcore.h
 header-test- += linux/errqueue.h
@@ -36,8 +34,6 @@ header-test- += linux/hdlc/ioctl.h
 header-test- += linux/ivtv.h
 header-test- += linux/kexec.h
 header-test- += linux/matroxfb.h
-header-test- += linux/netfilter_ipv4/ipt_LOG.h
-header-test- += linux/netfilter_ipv6/ip6t_LOG.h
 header-test- += linux/nfc.h
 header-test- += linux/omap3isp.h
 header-test- += linux/omapfb.h
-- 
2.17.1

