Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4182647E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 16:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731013AbgIJOSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 10:18:39 -0400
Received: from condef-05.nifty.com ([202.248.20.70]:33543 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730890AbgIJOK2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 10:10:28 -0400
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-05.nifty.com with ESMTP id 08ADtFcv031606;
        Thu, 10 Sep 2020 22:55:15 +0900
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 08ADpSIv001308;
        Thu, 10 Sep 2020 22:51:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 08ADpSIv001308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599745889;
        bh=JHjawyNi+2UsmyXrYxyqMJXMi2+rCaAViXhyNLVuK8M=;
        h=From:To:Cc:Subject:Date:From;
        b=buyXflRaxjagpRHTL+9r/eT3QLgJLolWsUxnbjtXoDxjXWHVtUDCUi/5rTnV79Q5S
         nULaajOuWCSJI3UtGUxIj3U8dZLZDsrJ0+ze+ED/FJXW+xt3ppN745E2vIs/CBKEKE
         Oj61MLp+NUjjmvwkq5qHBzRP2F1gRnZv2qUgBIrAJkIUh+kg6d1p4fURxH9O4AC1nW
         0+U0LHAF+8BgK8pkYpXrK5J0WWewIRwz55IN5QdNntD0Oh2JzqAq+wkIjWzaln1li0
         2FvyHn/jDYwz47/UeJFtzUdUB25T0PvbTemNV53NpFvM23ty3AEwG37txOgD3awkDR
         7cJBpo5TiyYUA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ingo Molnar <mingo@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] kbuild: remove cc-option test of -fno-strict-overflow
Date:   Thu, 10 Sep 2020 22:51:17 +0900
Message-Id: <20200910135120.3527468-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.

Here is the godbolt:
https://godbolt.org/z/odq8h9

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                          | 2 +-
 arch/arm64/kernel/vdso32/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 4b5a305e30d2..059b36f2ea53 100644
--- a/Makefile
+++ b/Makefile
@@ -922,7 +922,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
 KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
 
 # disable invalid "can't wrap" optimizations for signed / pointers
-KBUILD_CFLAGS	+= $(call cc-option,-fno-strict-overflow)
+KBUILD_CFLAGS	+= -fno-strict-overflow
 
 # clang sets -fmerge-all-constants by default as optimization, but this
 # is non-conforming behavior for C and in fact breaks the kernel, so we
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index d6adb4677c25..dfffd55175a3 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -90,7 +90,7 @@ VDSO_CFLAGS  += -O2
 # Some useful compiler-dependent flags from top-level Makefile
 VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
-VDSO_CFLAGS += $(call cc32-option,-fno-strict-overflow)
+VDSO_CFLAGS += -fno-strict-overflow
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
 VDSO_CFLAGS += $(call cc32-option,-Werror=date-time)
 VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
-- 
2.25.1

