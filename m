Return-Path: <linux-kbuild+bounces-6897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76032AA7C79
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 00:54:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1B2F4A17A6
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 22:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A93721CFEF;
	Fri,  2 May 2025 22:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssm7w/5O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2526EB79;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746226460; cv=none; b=Cl0C1Fc/yNv77o5+WKvyhvB+ZkIGtiglpibvZbmyZIrPdgIBIkIC9XWDhFlo60FzGu8rW1YRPAZ5mA5BpzZOyB/tX4BuYN7NDlNi9IAGm0fq0pz2MH85ttkrjy1XcS3CXt3/oyMGQsodHbWQlIe4SGBhRfwGohs4yfH6NFkC/xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746226460; c=relaxed/simple;
	bh=p3LCBG41fA+N9OOg7h+A3NTLbRHrJjxplvYJ9i2fjRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D/jQ2i9VO2sAV+mTr8bQpn8VfLPpVkCMbuF7qeCEWSt5Ry9JD7DksQdnM1TMqKHJqxupsX9/JBWR0gbC/CooIMPS1LFII1Qza6uNb1yiw+pKCuzWN+yHhpN7yhlT27+Nykmk5chEgQ5NDtSWtCyeJrIvVTMkTc6Z07dKnV2IaaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssm7w/5O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6EC5C4AF0C;
	Fri,  2 May 2025 22:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746226459;
	bh=p3LCBG41fA+N9OOg7h+A3NTLbRHrJjxplvYJ9i2fjRY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ssm7w/5OZHMhxTzwMP4B4UgKSyqDS49B4LzQoeqpM6gq8fFj67ZCjSc9HH7u9EGhG
	 D5p6tcYMU1FvQqDasRC4ueS8g3cJQLabkV4DBDMSf01s2i9Hqb+fvrMZz/vhZiCjbl
	 q59u9hK4c9qNtDCDZ/PpSnmg/qgPvpx/tJl0NjdeXCX7d1aZedvHwOSQpBvN8Ot1RM
	 MZhVSvW4V7VSJzDtAz9K89UvV2KYeqFIRjRnRE7Wm5dT3nPJxX49BpoHcA+33YS0tT
	 zEUc00UOuVESsiTC5v26JvoMPHZwyD+mRB4CfW5ctFR+Wkhez7Dx3Pynf+GjMni1S1
	 fSpRGPEgXylIg==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-um@lists.infradead.org
Subject: [PATCH v2 1/3] gcc-plugins: Force full rebuild when plugins change
Date: Fri,  2 May 2025 15:54:13 -0700
Message-Id: <20250502225416.708936-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250502224512.it.706-kees@kernel.org>
References: <20250502224512.it.706-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3599; i=kees@kernel.org; h=from:subject; bh=p3LCBG41fA+N9OOg7h+A3NTLbRHrJjxplvYJ9i2fjRY=; b=owGbwMvMwCVmps19z/KJym7G02pJDBmivmJ2fLZvdZtuL3ln0FN9zyeba4Wj2k17D3nRxQXrd vdMr2PqKGVhEONikBVTZAmyc49z8XjbHu4+VxFmDisTyBAGLk4BmEjGNEaG31vtb+Y+u61978cH qSv9Qt/MA2r2XlX+dImj81RrVk9POMP/KOPbz/fsmLXErj3kugvzgqC892Eblgc1Mnx9/1GLbac cJwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

There was no dependency between the plugins changing and the rest of the
kernel being built. Enforce this by including a synthetic header file
when using plugins, that is regenerated any time the plugins are built.

This cannot be included via '-include ...' because Makefiles use the
"filter-out" string function, which removes individual words. Removing
all instances of "-include" from the CFLAGS will cause a lot of
problems. :)

Instead, use -I to include the gcc-plugins directory, and depend on the
new -DGCC_PLUGINS_ENABLED flag to include the generated header file via
include/linux/compiler-version.h, which is already being used to control
full rebuilds. The UM build requires that the -I be explicitly added.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: <linux-hardening@vger.kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
---
 arch/um/Makefile                 | 1 +
 include/linux/compiler-version.h | 4 ++++
 scripts/Makefile.gcc-plugins     | 2 +-
 scripts/gcc-plugins/Makefile     | 8 ++++++++
 4 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/um/Makefile b/arch/um/Makefile
index 1d36a613aad8..8cc0f22ebefa 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -72,6 +72,7 @@ USER_CFLAGS = $(patsubst $(KERNEL_DEFINES),,$(patsubst -I%,,$(KBUILD_CFLAGS))) \
 		$(ARCH_INCLUDE) $(MODE_INCLUDE) $(filter -I%,$(CFLAGS)) \
 		-D_FILE_OFFSET_BITS=64 -idirafter $(srctree)/include \
 		-idirafter $(objtree)/include -D__KERNEL__ -D__UM_HOST__ \
+		-I$(objtree)/scripts/gcc-plugins \
 		-include $(srctree)/include/linux/compiler-version.h \
 		-include $(srctree)/include/linux/kconfig.h
 
diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 573fa85b6c0c..08943df04ebb 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -12,3 +12,7 @@
  * and add dependency on include/config/CC_VERSION_TEXT, which is touched
  * by Kconfig when the version string from the compiler changes.
  */
+
+#ifdef GCC_PLUGINS_ENABLED
+#include "gcc-plugins-deps.h"
+#endif
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 5b8a8378ca8a..468bb8faa9d1 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
 
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
+GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -I$(objtree)/scripts/gcc-plugins -DGCC_PLUGINS_ENABLED
 export GCC_PLUGINS_CFLAGS
 
 # Add the flags to the build!
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 320afd3cf8e8..24671d39ec90 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -66,3 +66,11 @@ quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
 
 $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,plugin_cxx_o_c)
+
+quiet_cmd_gcc_plugins_updated = UPDATE  $@
+      cmd_gcc_plugins_updated = echo '/* $^ */' > $(obj)/gcc-plugins-deps.h
+
+$(obj)/gcc-plugins-deps.h: $(plugin-single) $(plugin-multi) FORCE
+	$(call if_changed,gcc_plugins_updated)
+
+always-y += gcc-plugins-deps.h
-- 
2.34.1


