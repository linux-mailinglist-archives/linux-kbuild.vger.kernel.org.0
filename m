Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB19265291
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 23:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgIJVUN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 17:20:13 -0400
Received: from condef-02.nifty.com ([202.248.20.67]:45876 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731136AbgIJO0J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 10:26:09 -0400
Received: from conuserg-10.nifty.com ([10.126.8.73])by condef-02.nifty.com with ESMTP id 08ADtFZO023217;
        Thu, 10 Sep 2020 22:55:15 +0900
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 08ADpSJ0001308;
        Thu, 10 Sep 2020 22:51:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 08ADpSJ0001308
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599745893;
        bh=K01RYjZ9wy1tuci78KttomtfIouE9FTDhkSr4QzxpNo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1OH9UBl3mJpDIo0SH3Q8bILjszIxHdnVNj6Za9phRQiubjlbRAFg0W4DpIhREkpfY
         IzcvFpjVKKtz83ChLHqV5HavmKP3HuDNxXrlFawgFJVBCsn1jUQdfbiY4fON3vFkRB
         n7JQj++2onXAhbaUjzwcrT9Z2g022EgyV76pJ12+JwE8YsDGuJqA7xC5eBJMvQfg0k
         u8Tbx7HcDmKf8KxpAWs1rEIU9S8UorSqDOOGdCFBZAeQTG5ZdJUcbiJVUMDcYDHKy6
         ttp/K1VP/fUSA8NSW2NRyi5xldWaoRUxztJ+067BgCmzvWoDpskFgfy0y3McjFqte4
         gbl5M7iRalKfA==
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
Subject: [PATCH 4/4] kbuild: remove cc-option test of -Werror=date-time
Date:   Thu, 10 Sep 2020 22:51:20 +0900
Message-Id: <20200910135120.3527468-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910135120.3527468-1-masahiroy@kernel.org>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.

Here is the godbolt:
https://godbolt.org/z/xvjcMa

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                          | 2 +-
 arch/arm64/kernel/vdso32/Makefile | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 5102c89d3167..1d7c58684fda 100644
--- a/Makefile
+++ b/Makefile
@@ -940,7 +940,7 @@ KBUILD_CFLAGS  += -fno-stack-check
 KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
 
 # Prohibit date/time macros, which would make the build non-deterministic
-KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
+KBUILD_CFLAGS   += -Werror=date-time
 
 # enforce correct pointer usage
 KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index dfffd55175a3..1feb4f8e556e 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -92,7 +92,7 @@ VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
 VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
 VDSO_CFLAGS += -fno-strict-overflow
 VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
-VDSO_CFLAGS += $(call cc32-option,-Werror=date-time)
+VDSO_CFLAGS += -Werror=date-time
 VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
 
 # The 32-bit compiler does not provide 128-bit integers, which are used in
-- 
2.25.1

