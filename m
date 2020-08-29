Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE1EF2564CD
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Aug 2020 07:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgH2FQ1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 29 Aug 2020 01:16:27 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:34619 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbgH2FQ0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 29 Aug 2020 01:16:26 -0400
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 07T5FRBA012582;
        Sat, 29 Aug 2020 14:15:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 07T5FRBA012582
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598678131;
        bh=UpWzyGtnastAPoHDlH8oDyzAcCCJ1dW9lC89fSAz9Xg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uhLs3MZAZ1Rv6AE0eYXFmWt9YQpnmXP5sIwXfCx6W8cnVeCNxwtxPMVZKEkBTyQPx
         Oa64x2VbzFBPkJ5i4B0Z9Sv21sNTSHgpZ9ih4v+TbxZYGjxjVjRFB2yZGRHi7KR3cb
         HkwyRsJEI3tWByjEX7Ms4EVoaoruUvS5nSGRKupkAOzR2pql88kBYiaiySyUDdKrng
         eJH27ywaBIZlZv/08YzjufdiElmwHa8qFPSpTomgkyNmWeGsBDgZdEXlULOkxylml7
         eQp+2Cw2gv82PkkTbOX1MRcEKXeZn6FbBVMkC5Ow071z0+tTnQeQK6IiKM2JlOAgKs
         dKWYkDi5qBeqQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        linux-ia64@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ia64: remove generated/nr-irqs.h generation to fix build warning
Date:   Sat, 29 Aug 2020 14:15:24 +0900
Message-Id: <20200829051524.706585-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200829051524.706585-1-masahiroy@kernel.org>
References: <20200829051524.706585-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Randy reports the following warning when building ARCH=ia64 with
CONFIG_IA64_PALINFO=m:

../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.

This message is actually false-positive, and you can get palinfo.ko
correctly built. It is emitted in the archprepare stage, where Kbuild
descends into arch/ia64/kernel to generate include/generated/nr-irqs.h
instead of any kind of kernel objects.

arch/ia64/kernel/nr-irqs.c was introduced by commit 213060a4d699
("[IA64] pvops: paravirtualize NR_IRQS") to pre-calculate:

   NR_IRQS = max(IA64_NATIVE_NR_IRQS, XEN_NR_IRQS, FOO_NR_IRQS...)

Since commit d52eefb47d4e ("ia64/xen: Remove Xen support for ia64"), this
union contains just one field, making NR_IRQS and IA64_NATIVE_NR_IRQS
always match.

So, the following hard-coding now works:

  #define NR_IRQS                IA64_NATIVE_NR_IRQS

If you need to re-introduce NR_IRQS = max(...) gimmick in the future,
please try to implement it in asm-offsets.c instead of a separate file.
It will be possible because the header inclusion has been consolidated
to make asm-offsets.c independent of <asm/irqs.h>.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/ia64/Makefile          |  6 ------
 arch/ia64/include/asm/irq.h |  4 +++-
 arch/ia64/kernel/Makefile   |  5 -----
 arch/ia64/kernel/nr-irqs.c  | 22 ----------------------
 4 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 arch/ia64/kernel/nr-irqs.c

diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 2876a7df1b0a..3d54d411fcc4 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -87,9 +87,3 @@ define archhelp
   echo '  install	- Install compressed kernel image'
   echo '* unwcheck	- Check vmlinux for invalid unwind info'
 endef
-
-archprepare: make_nr_irqs_h
-PHONY += make_nr_irqs_h
-
-make_nr_irqs_h:
-	$(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h
diff --git a/arch/ia64/include/asm/irq.h b/arch/ia64/include/asm/irq.h
index 5acf52e90872..0eccf33dfe8b 100644
--- a/arch/ia64/include/asm/irq.h
+++ b/arch/ia64/include/asm/irq.h
@@ -14,7 +14,9 @@
 
 #include <linux/types.h>
 #include <linux/cpumask.h>
-#include <generated/nr-irqs.h>
+#include <asm/native/irq.h>
+
+#define NR_IRQS		IA64_NATIVE_NR_IRQS
 
 static __inline__ int
 irq_canonicalize (int irq)
diff --git a/arch/ia64/kernel/Makefile b/arch/ia64/kernel/Makefile
index 1a8df6669eee..7c9354ee4b3e 100644
--- a/arch/ia64/kernel/Makefile
+++ b/arch/ia64/kernel/Makefile
@@ -48,8 +48,3 @@ CFLAGS_traps.o  += -mfixed-range=f2-f5,f16-f31
 
 # The gate DSO image is built using a special linker script.
 include $(src)/Makefile.gate
-
-include/generated/nr-irqs.h: arch/$(SRCARCH)/kernel/nr-irqs.s FORCE
-	$(call filechk,offsets,__ASM_NR_IRQS_H__)
-
-targets += nr-irqs.s
diff --git a/arch/ia64/kernel/nr-irqs.c b/arch/ia64/kernel/nr-irqs.c
deleted file mode 100644
index f2633b22d3be..000000000000
--- a/arch/ia64/kernel/nr-irqs.c
+++ /dev/null
@@ -1,22 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * calculate
- * NR_IRQS = max(IA64_NATIVE_NR_IRQS, XEN_NR_IRQS, FOO_NR_IRQS...)
- * depending on config.
- * This must be calculated before processing asm-offset.c.
- */
-
-#define ASM_OFFSETS_C 1
-
-#include <linux/kbuild.h>
-#include <linux/threads.h>
-#include <asm/native/irq.h>
-
-void foo(void)
-{
-	union paravirt_nr_irqs_max {
-		char ia64_native_nr_irqs[IA64_NATIVE_NR_IRQS];
-	};
-
-	DEFINE(NR_IRQS, sizeof (union paravirt_nr_irqs_max));
-}
-- 
2.25.1

