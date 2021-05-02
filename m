Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41D33370E61
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 May 2021 20:10:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232421AbhEBSLT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 May 2021 14:11:19 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:37452 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbhEBSLT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 May 2021 14:11:19 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 142I9wPj004068;
        Mon, 3 May 2021 03:09:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 142I9wPj004068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619978999;
        bh=Tpd8otkWti2fb4EYKsLJTORWJfsQTHA3eXq5RcGzaPQ=;
        h=From:To:Cc:Subject:Date:From;
        b=Uvv5k3XSD/pDhCAkaB29eLuVCOYTbsSaG+qngvWNf5EUw0CLkbf993o1rjx3N/zHR
         HmhpC2qqTU7ou6MguvfFJSsY+yb0jutIlIf/+5MQ7Rk9p84znptunYwGW3IgtXE2oq
         gSbhVbO+MzV2hJ8AEvtwvZLp5BkBu/DUswhS4q84vethln3W4EyvWhGLMaxqq8e3yM
         K3ctQ2/Gzpm59UjWiFqkUuxU+FyA1II3tg/hm3gsh7MzR0zYqZRBy5bPgGwmBes4an
         3AKMPv2ayqfoXslI2zGXU7FokUlyM6TiFMzD5t5rXjokxCxr9hdh1/yy9f7VWEv8uO
         K1edETBVp3MSg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: parameterize the .o part of suffix-search
Date:   Mon,  3 May 2021 03:09:55 +0900
Message-Id: <20210502180957.3419490-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The suffix-search macro hard-codes the suffix, '.o'.

Make it a parameter so that the multi-search and real-search macros
can be reused for foo-dtbs syntax introduced by commit 15d16d6dadf6
("kbuild: Add generic rule to apply fdtoverlay").

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.lib | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 64daf37e874b..88b446ed6532 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -44,19 +44,22 @@ else
 obj-y		:= $(filter-out %/, $(obj-y))
 endif
 
-# Expand $(foo-objs) $(foo-y) by calling $(call suffix-search,foo.o,-objs -y)
-suffix-search = $(strip $(foreach s, $2, $($(1:.o=$s))))
+# Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
+suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
+# List composite targets that are constructed by combining other targets
+multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $m)))
+# List primitive targets that are compiled from source files
+real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call suffix-search, $m, $2, $3), $m))
+
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
-multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $m)))
-multi-obj-y := $(call multi-search,$(obj-y),-objs -y)
-multi-obj-m := $(call multi-search,$(obj-m),-objs -y -m)
+multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
+multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
-real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2 -), $(call suffix-search, $m, $2), $m))
-real-obj-y := $(call real-search, $(obj-y),-objs -y)
-real-obj-m := $(call real-search, $(obj-m),-objs -y -m)
+real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
+real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
 
 always-y += $(always-m)
 
-- 
2.27.0

