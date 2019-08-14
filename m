Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 449828D79E
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Aug 2019 18:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfHNQGl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Aug 2019 12:06:41 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:30683 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfHNQGl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 12:06:41 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x7EG6O95024737;
        Thu, 15 Aug 2019 01:06:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x7EG6O95024737
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565798785;
        bh=rf9kuGp6W/jro4+SBAqrAWFWGdTd8x7Ckw78NH6Qbgg=;
        h=From:To:Cc:Subject:Date:From;
        b=Sh+axHMyON88uMlgsINIKa9xT9nD4poc53ea59vma/orQWYeiNvvBzREB/kG2SHKp
         X5t5pr9LztrLIWFA7NzFM7xipAnoO1bM6+I5f8ED9MGOog0gIn4wB97EA3d6oERjTs
         Rn3riSqvn1MovLTgXuSJ2iqsy1jxj5IcHIsHvehbw22jiTxsn3zafMkmGNRsxyMsPb
         30QY1BeNvlab3DJ7WBCUaRFQo8kssSYhvprxIfRhpn5irjrrOjCokAq/oxiVPcKoui
         r9fyr7V1PUj76Hs6gCQNN2LSswUshGpo0aul1Cmp/heVsGDPkuvOjb3YQUQOw09+nO
         7ysdkliI4D/Yg==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: move KBUILD_LDS, KBUILD_VMLINUX_{OBJS,LIBS} to makefiles.rst
Date:   Thu, 15 Aug 2019 01:06:21 +0900
Message-Id: <20190814160623.24802-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

These three variables are not intended to be tweaked by users.
Move them from kbuild.rst to makefiles.rst.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I will apply to linux-kbuild this
to avoid conflicts.


 Documentation/kbuild/kbuild.rst    | 14 --------------
 Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index 61b2181ed3ea..62f9d86c082c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -258,17 +258,3 @@ KBUILD_BUILD_USER, KBUILD_BUILD_HOST
 These two variables allow to override the user@host string displayed during
 boot and in /proc/version. The default value is the output of the commands
 whoami and host, respectively.
-
-KBUILD_LDS
-----------
-The linker script with full path. Assigned by the top-level Makefile.
-
-KBUILD_VMLINUX_OBJS
--------------------
-All object files for vmlinux. They are linked to vmlinux in the same
-order as listed in KBUILD_VMLINUX_OBJS.
-
-KBUILD_VMLINUX_LIBS
--------------------
-All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and KBUILD_VMLINUX_LIBS
-together specify all the object files used to link vmlinux.
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index f4f0f7ffde2b..d3448d2c8017 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -995,6 +995,20 @@ When kbuild executes, the following steps are followed (roughly):
 	top-level Makefile has set any other flags. This provides a
 	means for an architecture to override the defaults.
 
+    KBUILD_LDS
+
+	The linker script with full path. Assigned by the top-level Makefile.
+
+    KBUILD_VMLINUX_OBJS
+
+	All object files for vmlinux. They are linked to vmlinux in the same
+	order as listed in KBUILD_VMLINUX_OBJS.
+
+    KBUILD_VMLINUX_LIBS
+
+	All .a "lib" files for vmlinux. KBUILD_VMLINUX_OBJS and
+	KBUILD_VMLINUX_LIBS together specify all the object files used to
+	link vmlinux.
 
 6.2 Add prerequisites to archheaders
 ------------------------------------
-- 
2.17.1

