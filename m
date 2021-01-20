Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC902FCB0D
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 07:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728246AbhATG0d (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 01:26:33 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:28149 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729013AbhATGTt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 01:19:49 -0500
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net [126.26.94.251]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 10K6IZ7o028054;
        Wed, 20 Jan 2021 15:18:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 10K6IZ7o028054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611123515;
        bh=btZ7U+eLyQSL4kovQk7ohob7u4EsRf+CqAEY6fgfEyg=;
        h=From:To:Cc:Subject:Date:From;
        b=m6WNqX/itgBYLDj/10juNKlrjvZ0QMdVuF6wp/7rg/9xj268AgSUIXabe6bDMu2jQ
         CwkVHbkQ8cmu/wX8EhbCZlz2Euqm+JPFrOFeYpvGI5kfdPG0wv7oLNQb8oGk8Ybpa4
         gtkE+8mu6t0Ysmv/Dn5Xcrfm6MfmAHBRmyGBJ29LmMqodI2F8Uf+uPb7LC500Lt698
         fwCTb0fSMCNS1udUXA0hz+nLtXBnS49bGx1j9+EpAinYzL2VpxcKX+DNADI5YOTQa/
         Ud6D2fMrY9nwb1lZlXMhAeb8j6tW7vBtnVIl0t6KXTttN0kYMEwlUWm9i/5KlH3RLm
         X1fvqY+dY7zHQ==
X-Nifty-SrcIP: [126.26.94.251]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove deprecated syntax EXTRA_*FLAGS, always, hostprogs-*
Date:   Wed, 20 Jan 2021 15:18:32 +0900
Message-Id: <20210120061832.3010926-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The backward compatibility has been kept for a while. There is no user
in upstream. Out-of-tree users must be converted to new ones.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.clean |  3 ---
 scripts/Makefile.lib   | 17 -----------------
 2 files changed, 20 deletions(-)

diff --git a/scripts/Makefile.clean b/scripts/Makefile.clean
index d9e0ceace6a6..22a8172bce1f 100644
--- a/scripts/Makefile.clean
+++ b/scripts/Makefile.clean
@@ -34,9 +34,6 @@ __clean-files	:= \
 	$(hostprogs-always-y) $(hostprogs-always-m) $(hostprogs-always-) \
 	$(userprogs-always-y) $(userprogs-always-m) $(userprogs-always-)
 
-# deprecated
-__clean-files	+= $(always) $(hostprogs-y) $(hostprogs-m) $(hostprogs-)
-
 __clean-files   := $(filter-out $(no-clean-files), $(__clean-files))
 
 # clean-files is given relative to the current directory, unless it
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index e10b675165cd..b8e587a17dcc 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -1,21 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-# Backward compatibility
-asflags-y  += $(EXTRA_AFLAGS)
-ccflags-y  += $(EXTRA_CFLAGS)
-cppflags-y += $(EXTRA_CPPFLAGS)
-ldflags-y  += $(EXTRA_LDFLAGS)
-ifneq ($(always),)
-$(warning 'always' is deprecated. Please use 'always-y' instead)
-always-y   += $(always)
-endif
-ifneq ($(hostprogs-y),)
-$(warning 'hostprogs-y' is deprecated. Please use 'hostprogs' instead)
-hostprogs  += $(hostprogs-y)
-endif
-ifneq ($(hostprogs-m),)
-$(warning 'hostprogs-m' is deprecated. Please use 'hostprogs' instead)
-hostprogs  += $(hostprogs-m)
-endif
 
 # flags that take effect in current and sub directories
 KBUILD_AFLAGS += $(subdir-asflags-y)
-- 
2.27.0

