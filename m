Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C65BB18250B
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 23:38:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729997AbgCKWij (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 18:38:39 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:26360 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729881AbgCKWij (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 18:38:39 -0400
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 02BMbYqf019805;
        Thu, 12 Mar 2020 07:37:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 02BMbYqf019805
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583966255;
        bh=tiAHJid7/WA3U3683+xwU6rGIWKb4aM8B2wj4c+paIQ=;
        h=From:To:Cc:Subject:Date:From;
        b=MV/GMLbmCnGT0J0XdohjNCc2KP58qmnj+qvhKNL/fsrbcvMC3bDunxeqpcOOSGB8o
         VbnlRGNVZq/4ekRn0VrO25hw3SeikvzgF4LyU555iQJQARlhH/4CJ+K3ktLCLeWAZh
         DvuWDq1y84t2/htCFsT276osv+/7n3tzeMhNFoQ2/WowYBRwz+rh7Oj5GxqtcRdkXM
         glOUVtqjY6M1oG7sHZBcwkHNEbx76LVuBZXdzqA2t9HguwSHrbxrkL2eGLCOFmz4kg
         eJAPbpJ31cLQw2R2QwAUfWSeMK1Fy8XyU80HYst1ZavOuRrXfS+8ujd9GrA8AkyjuU
         KsFGU67GeGA3w==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     sparclinux@vger.kernel.org,
        "David S . Miller" <davem@davemloft.net>,
        clang-built-linux@googlegroups.com,
        Al Viro <viro@zeniv.linux.org.uk>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Ilie Halip <ilie.halip@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] sparc: revive __HAVE_ARCH_STRLEN for 32bit sparc
Date:   Thu, 12 Mar 2020 07:37:24 +0900
Message-Id: <20200311223725.27662-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Prior to commit 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h"),
__HAVE_ARCH_STRLEN was defined in both of string_32.h and string_64.h

It did not unify __HAVE_ARCH_STRLEN, but deleted it from string_32.h

This issue was reported by the kbuild test robot in the trial of
forcible linking of $(lib-y) to vmlinux.

Fixes: 70a6fcf3283a ("[sparc] unify 32bit and 64bit string.h")
Reported-by: kbuild test robot <lkp@intel.com>
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - Insert a new patch to avoid sparc32 build error

 arch/sparc/include/asm/string.h    | 4 ++++
 arch/sparc/include/asm/string_64.h | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/sparc/include/asm/string.h b/arch/sparc/include/asm/string.h
index 3d9cd082716b..001a17baf2d5 100644
--- a/arch/sparc/include/asm/string.h
+++ b/arch/sparc/include/asm/string.h
@@ -37,6 +37,10 @@ void *memmove(void *, const void *, __kernel_size_t);
 #define __HAVE_ARCH_MEMCMP
 int memcmp(const void *,const void *,__kernel_size_t);
 
+/* Now the str*() stuff... */
+#define __HAVE_ARCH_STRLEN
+__kernel_size_t strlen(const char *);
+
 #define __HAVE_ARCH_STRNCMP
 int strncmp(const char *, const char *, __kernel_size_t);
 
diff --git a/arch/sparc/include/asm/string_64.h b/arch/sparc/include/asm/string_64.h
index ee9ba67321bd..d5c563058a5b 100644
--- a/arch/sparc/include/asm/string_64.h
+++ b/arch/sparc/include/asm/string_64.h
@@ -12,8 +12,4 @@
 
 #include <asm/asi.h>
 
-/* Now the str*() stuff... */
-#define __HAVE_ARCH_STRLEN
-__kernel_size_t strlen(const char *);
-
 #endif /* !(__SPARC64_STRING_H__) */
-- 
2.17.1

