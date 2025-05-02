Return-Path: <linux-kbuild+bounces-6898-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B79AA7C7A
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 00:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA0785A3D5A
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C51A21FF38;
	Fri,  2 May 2025 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDqh/s/n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36C20B81D;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226460; cv=none; b=Fbz/2VKsFS2fH0UqpDjKGGD5TSoXiENE/sw3XdsNJHvTIKv5sNV3kCzyaeuNrqJlJZWT2xbFtA+wHcwXas1EcGPazEqDP5qDEWLMiy5oSppzoMSBm95xsT0whfvWThjE5cddwavk9E8Pw9bAfcTPkUn7UQ0hVhmGaAYclPbqta8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226460; c=relaxed/simple;
	bh=DfqvdRUqMtoPlZKLyvJpYf94EQda+fM9+VWU2/V8MOI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hNNNnIzw2LVcXYYwRRT3l98ctovxjNBujUCe7BfCGJAmnzmQk3YFkNOC9e6YCYekWxIwUyx1I8NxvFGdsB1VxCMkMuc6lkHK+628DNkin8wokqeMACk4iV5HZYf5RZ13UGdC+5fPZsduYPdKaeihJIyaqvcbAZ9+r2L6kiw01wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDqh/s/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B870EC4CEE4;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746226459;
	bh=DfqvdRUqMtoPlZKLyvJpYf94EQda+fM9+VWU2/V8MOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NDqh/s/npud+DxyezNo2V3cx/EXrexw/NGPCMFNHfnLgFP2OqinV903Hwwj6IynEC
	 3YAJsctoGZOPsxtOnkB1v5YE+jMS1btQXiMdWcuaQaerLLnCm7Am6TwiFqFeL90mHq
	 g6D/+Fi7r+qqHUyl5TgTfUX5prdgtcPwMoSiLNL3qkgfchhEblwLZ1TNOHlFrGumOi
	 n3VxtZwwbu4S0oInkhlv9N2MJrTlYeIEDBjCqDwT3BBDCPqjL33G3PUd2fykBO8Qf/
	 yGFRxBGD62CysC3IElFiDPqcCyAnSfl2GiwTu9lrmoWLOy+E1RdZTvozjkcACeo6kM
	 Gj8/tJiaPFP+w==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kbuild@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: [PATCH v2 2/3] randstruct: Force full rebuild when seed changes
Date: Fri,  2 May 2025 15:54:14 -0700
Message-Id: <20250502225416.708936-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502224512.it.706-kees@kernel.org>
References: <20250502224512.it.706-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3831; i=kees@kernel.org; h=from:subject; bh=DfqvdRUqMtoPlZKLyvJpYf94EQda+fM9+VWU2/V8MOI=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmivuI9R04dk2ibbdtp1zKpQ7LSSvR1fcOVTCGHVTVSs 7hClrh2lLIwiHExyIopsgTZuce5eLxtD3efqwgzh5UJZAgDF6cATGR1LsM//UwLUVHWmxW3D1qc Fs1VWStoVtv7Oe1YqM/m400zpl4NYvgf5HireJpv0ySRbQE3u5vW5VX9ulEkyZo3597GFA2nrdc 5AA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

While the randstruct GCC plugin was being rebuilt if the randstruct
seed changed, Clangs build did not notice the change. Include the hash
header directly so that it becomes a universal build dependency and full
rebuilds will happen if it changes.

Since we cannot use "-include ..." as the randstruct flags are removed
via "filter-out" (which would cause all instances of "-include" to be
removed), use the existing -DRANDSTRUCT to control the header inclusion
via include/linux/compiler-version.h. Universally add a -I for the
scripts/basic directory, where header exists. The UM build requires that
the -I be explicitly added.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Petr Pavlu <petr.pavlu@suse.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: <linux-kbuild@vger.kernel.org>
---
 Makefile                         |  1 +
 arch/um/Makefile                 |  1 +
 include/linux/compiler-version.h |  3 +++
 include/linux/vermagic.h         |  1 -
 scripts/basic/Makefile           | 11 ++++++-----
 5 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 5aa9ee52a765..cef652227843 100644
--- a/Makefile
+++ b/Makefile
@@ -567,6 +567,7 @@ LINUXINCLUDE    := \
 		-I$(objtree)/arch/$(SRCARCH)/include/generated \
 		-I$(srctree)/include \
 		-I$(objtree)/include \
+		-I$(objtree)/scripts/basic \
 		$(USERINCLUDE)
 
 KBUILD_AFLAGS   := -D__ASSEMBLY__ -fno-PIE
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 8cc0f22ebefa..38f6024e75d7 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -73,6 +73,7 @@ USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ \
 		-I$(objtree)/scripts/gcc-plugins \
+		-I$(objtree)/scripts/basic \
 		-include $(srctree)/include/linux/compiler-version.h \
 		-include $(srctree)/include/linux/kconfig.h
 
diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 08943df04ebb..05d555320a0f 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -16,3 +16,6 @@
 #ifdef GCC_PLUGINS_ENABLED
 #include "gcc-plugins-deps.h"
 #endif
+#ifdef RANDSTRUCT
+#include "randstruct_hash.h"
+#endif
diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 939ceabcaf06..335c360d4f9b 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -33,7 +33,6 @@
 #define MODULE_VERMAGIC_MODVERSIONS ""
 #endif
 #ifdef RANDSTRUCT
-#include <generated/randstruct_hash.h>
 #define MODULE_RANDSTRUCT "RANDSTRUCT_" RANDSTRUCT_HASHED_SEED
 #else
 #define MODULE_RANDSTRUCT
diff --git a/scripts/basic/Makefile b/scripts/basic/Makefile
index dd289a6725ac..31637ce4dc5c 100644
--- a/scripts/basic/Makefile
+++ b/scripts/basic/Makefile
@@ -8,9 +8,10 @@ hostprogs-always-y	+= fixdep
 # before running a Clang kernel build.
 gen-randstruct-seed	:= $(srctree)/scripts/gen-randstruct-seed.sh
 quiet_cmd_create_randstruct_seed = GENSEED $@
-cmd_create_randstruct_seed = \
-	$(CONFIG_SHELL) $(gen-randstruct-seed) \
-		$@ $(objtree)/include/generated/randstruct_hash.h
-$(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
+      cmd_create_randstruct_seed = $(CONFIG_SHELL) $(gen-randstruct-seed) \
+		$(obj)/randstruct.seed $(obj)/randstruct_hash.h
+
+$(obj)/randstruct_hash.h $(obj)/randstruct.seed: $(gen-randstruct-seed) FORCE
 	$(call if_changed,create_randstruct_seed)
-always-$(CONFIG_RANDSTRUCT) += randstruct.seed
+
+always-$(CONFIG_RANDSTRUCT) += randstruct.seed randstruct_hash.h
-- 
2.34.1


