Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136A91B5607
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Apr 2020 09:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbgDWHk4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Apr 2020 03:40:56 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:31968 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbgDWHkk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Apr 2020 03:40:40 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 03N7dV9X000368;
        Thu, 23 Apr 2020 16:39:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 03N7dV9X000368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587627584;
        bh=IJ47QMDJ2p1WpT//uXZ9PGqmJ2o4lEX/9JvZFrqoJcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GMapKvhvYs93mGJOYEgVx8fHRRWoSYDTa8VqMlHhDQZPh68juTrwreDLN1IkRkZP/
         G1R8k7uj531IyiXkgaFLX8L1RGWKn9vAZZN5FG518KbT81/wouRCI7wXEPbWLWGjLU
         X27Zr9DIxHkETOdFmqLkzGwSrRTWSnkK+1y//rdBs5jAdRSV/wOubfONQya1HCjYjQ
         1+onh9kBCKoVXXyXmkGX1EfoFYRuGSdCzAtWYobu5Jbj5ZVw78waTbmbbkhglfk1xQ
         a878xIsAH4dC6qJaABNHQAJpTftDmvBKhq0k1BBTtjFMNTMPgvqs4h+yL9AjzPjruc
         nKOeMmfrccfaw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     bpf@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Christian Brauner <christian@brauner.io>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 12/16] samples: pidfd: build sample program for target architecture
Date:   Thu, 23 Apr 2020 16:39:25 +0900
Message-Id: <20200423073929.127521-13-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200423073929.127521-1-masahiroy@kernel.org>
References: <20200423073929.127521-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This userspace program includes UAPI headers exported to usr/include/.
'make headers' always works for the target architecture (i.e. the same
architecture as the kernel), so the sample program must be built for
the target as well. Kbuild now supports the 'userprogs' syntax to
describe it cleanly.

I also guarded the CONFIG option by 'depends on CC_CAN_LINK' because
$(CC) may not necessarily provide libc.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 samples/Kconfig        | 2 +-
 samples/pidfd/Makefile | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/samples/Kconfig b/samples/Kconfig
index b8beb6fd75b4..b8113555aa6c 100644
--- a/samples/Kconfig
+++ b/samples/Kconfig
@@ -122,7 +122,7 @@ config SAMPLE_HIDRAW
 
 config SAMPLE_PIDFD
 	bool "pidfd sample"
-	depends on HEADERS_INSTALL
+	depends on CC_CAN_LINK && HEADERS_INSTALL
 
 config SAMPLE_SECCOMP
 	bool "Build seccomp sample code"
diff --git a/samples/pidfd/Makefile b/samples/pidfd/Makefile
index ee2979849d92..0191902647ca 100644
--- a/samples/pidfd/Makefile
+++ b/samples/pidfd/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-hostprogs := pidfd-metadata
-always-y := $(hostprogs)
-HOSTCFLAGS_pidfd-metadata.o += -I$(objtree)/usr/include
-all: pidfd-metadata
+usertprogs := pidfd-metadata
+always-y := $(userprogs)
+
+user-ccflags += -I usr/include
-- 
2.25.1

