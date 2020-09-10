Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D604265355
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgIJVca (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:32:30 -0400
Received: from condef-10.nifty.com ([202.248.20.75]:24393 "EHLO
        condef-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730964AbgIJNvG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 09:51:06 -0400
Received: from conuserg-09.nifty.com ([10.126.8.72])by condef-10.nifty.com with ESMTP id 08ADllps001772;
        Thu, 10 Sep 2020 22:47:48 +0900
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 08ADiY4V001894;
        Thu, 10 Sep 2020 22:44:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 08ADiY4V001894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599745476;
        bh=QXPqbgb/jFPOd/TSdAMnz6TSWN+Q2fIoPVXFknMy17s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bN2HusAT+ylvtNVf5Yh5sV8NGF8kQVhpVu1+Nkf3esQm92facLGiiItFCHpXazMRJ
         MfK6FmxRfAOe7UoAOZnFLxVBtZzVj75B3z7+LY+t6vH5ICk+DOxEoLCs2FHcRPHq0O
         1dX4i0AgJRkZUiGdVrB2WBbzQbsfoYuCnk886vAPxeUbVr05wZjVBgz26Xh4IhRABJ
         A7OcCPZfCJO4+FBwe5E8cQznTPsNo0DwVhmBE3jkovF4Wxfv9ywSPIol1WaeXwRsRU
         GEtW1CX18vItsYfbuMGBqECbqXjcfqMPylE+SKUOGdTv60DN6byauDzZPWuQyRY0Vy
         vXT6Rnc3GFVpg==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: move CFLAGS_{KASAN,UBSAN,KCSAN} exports to relevant Makefiles
Date:   Thu, 10 Sep 2020 22:44:29 +0900
Message-Id: <20200910134429.3525408-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910134429.3525408-1-masahiroy@kernel.org>
References: <20200910134429.3525408-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Move CFLAGS_KASAN*, CFLAGS_UBSAN, CFLAGS_KCSAN to Makefile.kasan,
Makefile.ubsan, Makefile.kcsan, respectively.

This commit also avoids the same -fsanitize=* flags being added to
CFLAGS_UBSAN multiple times.

Prior to this commit, the ubsan flags were appended by the '+='
operator, without any initialization. Some build targets such as
'make bindeb-pkg' recurses to the top Makefile, and ended up with
adding the same flags to CFLAGS_UBSAN twice.

Clear CFLAGS_UBSAN with ':=' to make it a simply expanded variable.
This is better than a recursively expanded variable, which evaluates
$(call cc-option, ...) multiple times before Kbuild starts descending
to subdirectories.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile               | 1 -
 scripts/Makefile.kasan | 2 ++
 scripts/Makefile.kcsan | 2 +-
 scripts/Makefile.ubsan | 3 +++
 4 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index ec2330ce0fc5..4b5a305e30d2 100644
--- a/Makefile
+++ b/Makefile
@@ -517,7 +517,6 @@ export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
 export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE CFLAGS_UBSAN CFLAGS_KCSAN
 export KBUILD_AFLAGS AFLAGS_KERNEL AFLAGS_MODULE
 export KBUILD_AFLAGS_MODULE KBUILD_CFLAGS_MODULE KBUILD_LDFLAGS_MODULE
 export KBUILD_AFLAGS_KERNEL KBUILD_CFLAGS_KERNEL
diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 1532f1a41a8f..1e000cc2e7b4 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -47,3 +47,5 @@ CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
 		$(instrumentation_flags)
 
 endif # CONFIG_KASAN_SW_TAGS
+
+export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
diff --git a/scripts/Makefile.kcsan b/scripts/Makefile.kcsan
index c50f27b3ac56..cec50d74e0d0 100644
--- a/scripts/Makefile.kcsan
+++ b/scripts/Makefile.kcsan
@@ -9,7 +9,7 @@ endif
 
 # Keep most options here optional, to allow enabling more compilers if absence
 # of some options does not break KCSAN nor causes false positive reports.
-CFLAGS_KCSAN := -fsanitize=thread \
+export CFLAGS_KCSAN := -fsanitize=thread \
 	$(call cc-option,$(call cc-param,tsan-instrument-func-entry-exit=0) -fno-optimize-sibling-calls) \
 	$(call cc-option,$(call cc-param,tsan-instrument-read-before-write=1)) \
 	$(call cc-param,tsan-distinguish-volatile=1)
diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
index 27348029b2b8..c661484ee01f 100644
--- a/scripts/Makefile.ubsan
+++ b/scripts/Makefile.ubsan
@@ -1,4 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
+
+export CFLAGS_UBSAN :=
+
 ifdef CONFIG_UBSAN_ALIGNMENT
       CFLAGS_UBSAN += $(call cc-option, -fsanitize=alignment)
 endif
-- 
2.25.1

