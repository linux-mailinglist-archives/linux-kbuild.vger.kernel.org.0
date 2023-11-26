Return-Path: <linux-kbuild+bounces-168-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FD67F91BB
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 08:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8A2EB20D15
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Nov 2023 07:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B87646B1;
	Sun, 26 Nov 2023 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8eJqj2q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA582F41;
	Sun, 26 Nov 2023 07:19:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 383C9C433C7;
	Sun, 26 Nov 2023 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700983164;
	bh=8gd0dMckeTvfrJbqiPZ2qHzROw5OCFMp48suO82vyAs=;
	h=From:To:Cc:Subject:Date:From;
	b=l8eJqj2qVxYSd0kyCthbRdsjJWwv8BkOprPhHQWVhjZE77suqM6bLD/BiLU/E1itB
	 nACkUvUzYVBu3EyM6bJxFONeF6hruY82B1HyUWGAqbzqn5EaniAbbi53yeV58r0imt
	 zT8dHSlB/WuMWZB8tEJRbgv06wvUmqrw/n6IMOcbv0EFj4KG/VELuhXNdO3LOvOoRM
	 gdEalE+TZ+Hb+Mx2qjdTAU2T1C9ZblxQTHsNWYLM6r0sHpHh3kbiz/wTHdnDO6ixYb
	 K9QP7W9tZsUkVb6Fgs4bujgAZiZhIiS/CsPQkrcKnTWsgJE3wKIeomXu98uMlhSZYy
	 FGRtjHj4xOqww==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>,
	linux-modules@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] init: move THIS_MODULE from <linux/export.h> to <linux/init.h>
Date: Sun, 26 Nov 2023 16:19:14 +0900
Message-Id: <20231126071914.932241-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit f50169324df4 ("module.h: split out the EXPORT_SYMBOL into
export.h") appropriately separated EXPORT_SYMBOL into <linux/export.h>
because modules and EXPORT_SYMBOL are orthogonal; modules are symbol
consumers, while EXPORT_SYMBOL are used by symbol providers, which
may not be necessarily a module.

However, that commit also relocated THIS_MODULE. As explained in the
commit description, the intention was to define THIS_MODULE in a
lightweight header, but I do not believe <linux/export.h> was the
suitable location because EXPORT_SYMBOL and THIS_MODULE are unrelated.

Move it to another lightweight header, <linux/init.h>. The reason for
choosing <linux/init.h> is to make <linux/moduleparam.h> self-contained
without relying on <linux/linkage.h> incorrectly including
<linux/export.h>.

With this adjustment, the role of <linux/export.h> becomes clearer as
it only defines EXPORT_SYMBOL.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/export.h | 18 ------------------
 include/linux/init.h   |  7 +++++++
 2 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/include/linux/export.h b/include/linux/export.h
index 9911508a9604..0bbd02fd351d 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -6,15 +6,6 @@
 #include <linux/linkage.h>
 #include <linux/stringify.h>
 
-/*
- * Export symbols from the kernel to modules.  Forked from module.h
- * to reduce the amount of pointless cruft we feed to gcc when only
- * exporting a simple symbol or two.
- *
- * Try not to add #includes here.  It slows compilation and makes kernel
- * hackers place grumpy comments in header files.
- */
-
 /*
  * This comment block is used by fixdep. Please do not remove.
  *
@@ -23,15 +14,6 @@
  * side effect of the *.o build rule.
  */
 
-#ifndef __ASSEMBLY__
-#ifdef MODULE
-extern struct module __this_module;
-#define THIS_MODULE (&__this_module)
-#else
-#define THIS_MODULE ((struct module *)0)
-#endif
-#endif /* __ASSEMBLY__ */
-
 #ifdef CONFIG_64BIT
 #define __EXPORT_SYMBOL_REF(sym)			\
 	.balign 8				ASM_NL	\
diff --git a/include/linux/init.h b/include/linux/init.h
index 01b52c9c7526..3fa3f6241350 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -179,6 +179,13 @@ extern void (*late_time_init)(void);
 
 extern bool initcall_debug;
 
+#ifdef MODULE
+extern struct module __this_module;
+#define THIS_MODULE (&__this_module)
+#else
+#define THIS_MODULE ((struct module *)0)
+#endif
+
 #endif
   
 #ifndef MODULE
-- 
2.40.1


