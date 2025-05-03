Return-Path: <linux-kbuild+bounces-6915-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE59AA81F8
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 20:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2191F3B2125
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 May 2025 18:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E46D27E1C7;
	Sat,  3 May 2025 18:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/5UvviY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E54E1624E9;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746297987; cv=none; b=LUjjTFRMGXGF7k9tKC5r6eluXz2Cv0/8uVOKD1MLw2nzSEfR0k9iYUmgFot3fDAooqa9wGQylgxlEXb5BQqi5VqrId8IdHyD5LIN3lsHjzqzuDLoJbBfVUxLfVTJvbHPtdb09qNpwkzO9Sx77Q04MMe6BSQYtsGmoQIPxC3cTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746297987; c=relaxed/simple;
	bh=vcmcNB9M/mnVV0u1TxfACvPzuwlKwH4U0CbHSsTxvvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LTV9uPovcfUVpx0R0fNBn8a6AZnVPuNXlr4YIg0hS/I0w6ORPbyxAbFMS2pAL95YpjjFEqLtOSNtfnMeBMWPeHQZ2/ee+EbiZcRiAcdF0QKyqQLYRXvjs4acVJfrDdSHkIS0zDc6FjeXokPKVeQ95Q1wuF+YSXES2Blq3+whyiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/5UvviY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80319C4AF0B;
	Sat,  3 May 2025 18:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746297986;
	bh=vcmcNB9M/mnVV0u1TxfACvPzuwlKwH4U0CbHSsTxvvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=E/5UvviYXd4M/OBy3fCYKWszd1r5TVBDxzzXa7gIW6vO6mFVvSMi54bi4L3Uwhs1g
	 PLzjB05PAVxHMjRVuzOHqmdYVq4m5w7qJrugDaGHCthgNxITLShvMcjsSNJrNG5tIn
	 Tsvbg55gZqviiFr4CixWjxeEH65ktOuo79s19KniMgtvIG6c8rA5JDn6aFdQ4RACmX
	 3hxFSp7SDdxrhq28NWPPIatdxubInTKge/hEATyNT0ghtVG173sO6TSKjDKuq+6SSa
	 rfiX9QESpHzV8mIM/SdJ4UoN2CFpw5tA4fIHuzXcdey1KFJlUcwgkMHGYwmpzQ0fF7
	 a21e4Ah5ghrUA==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Justin Stitt <justinstitt@google.com>,
	Marco Elver <elver@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/3] gcc-plugins: Force full rebuild when plugins change
Date: Sat,  3 May 2025 11:46:18 -0700
Message-Id: <20250503184623.2572355-1-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250503184001.make.594-kees@kernel.org>
References: <20250503184001.make.594-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4099; i=kees@kernel.org; h=from:subject; bh=vcmcNB9M/mnVV0u1TxfACvPzuwlKwH4U0CbHSsTxvvI=; b=owGbwMvMwCVmps19z/KJym7G02pJDBliyftYMz0PPeCzUN3AeedYZIn/ro+vFtTaZi1jryxji P75JD6uo5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCI9nQx/eAXnbl5/btvnlRlX neQ7dc5/2MPWInTRLi1CKTM3dB1fOyPDsRulL/9NuPHAXNpf6bDhB6OrK7VcI7jMZ5xn+2H9ye0 kLwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

There was no dependency between the plugins changing and the rest of the
kernel being built. This could cause strange behaviors as instrumentation
could vary between targets depending on when they were built.

Generate a new header file, gcc-plugins.h, any time the GCC plugins
change. Include the header file in compiler-version.h when its associated
feature name, GCC_PLUGINS, is defined. This will be picked up by fixdep
and force rebuilds where needed.

Add a generic "touch" kbuild command, which will be used again in
a following patch. Add a "normalize_path" string helper to make the
"TOUCH" output less ugly.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: <linux-hardening@vger.kernel.org>
Cc: <linux-kbuild@vger.kernel.org>
---
 include/linux/compiler-version.h |  4 ++++
 scripts/Makefile.gcc-plugins     |  2 +-
 scripts/Makefile.lib             | 18 ++++++++++++++++++
 scripts/gcc-plugins/Makefile     |  4 ++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/compiler-version.h b/include/linux/compiler-version.h
index 573fa85b6c0c..74ea11563ce3 100644
--- a/include/linux/compiler-version.h
+++ b/include/linux/compiler-version.h
@@ -12,3 +12,7 @@
  * and add dependency on include/config/CC_VERSION_TEXT, which is touched
  * by Kconfig when the version string from the compiler changes.
  */
+
+#ifdef GCC_PLUGINS
+#include <generated/gcc-plugins.h>
+#endif
diff --git a/scripts/Makefile.gcc-plugins b/scripts/Makefile.gcc-plugins
index 5b8a8378ca8a..e50dc931be49 100644
--- a/scripts/Makefile.gcc-plugins
+++ b/scripts/Makefile.gcc-plugins
@@ -38,7 +38,7 @@ export DISABLE_STACKLEAK_PLUGIN
 
 # All the plugin CFLAGS are collected here in case a build target needs to
 # filter them out of the KBUILD_CFLAGS.
-GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y))
+GCC_PLUGINS_CFLAGS := $(strip $(addprefix -fplugin=$(objtree)/scripts/gcc-plugins/, $(gcc-plugin-y)) $(gcc-plugin-cflags-y)) -DGCC_PLUGINS
 export GCC_PLUGINS_CFLAGS
 
 # Add the flags to the build!
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bdd..6fc2a82ee3bb 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -296,6 +296,19 @@ $(foreach m, $1, \
 	$(addprefix $(obj)/, $(call suffix-search, $(patsubst $(obj)/%,%,$m), $2, $3))))
 endef
 
+# Remove ".." and "." from a path, without using "realpath"
+# Usage:
+#   $(call normalize_path,path/to/../file)
+define normalize_path
+$(strip $(eval elements :=) \
+$(foreach elem,$(subst /, ,$1), \
+	$(if $(filter-out .,$(elem)), \
+	     $(if $(filter ..,$(elem)), \
+		  $(eval elements := $(wordlist 2,$(words $(elements)),x $(elements))), \
+		  $(eval elements := $(elements) $(elem))))) \
+$(subst $(space),/,$(elements)))
+endef
+
 # Build commands
 # ===========================================================================
 # These are shared by some Makefile.* files.
@@ -343,6 +356,11 @@ quiet_cmd_copy = COPY    $@
 $(obj)/%: $(src)/%_shipped
 	$(call cmd,copy)
 
+# Touch a file
+# ===========================================================================
+quiet_cmd_touch = TOUCH   $(call normalize_path,$@)
+      cmd_touch = touch $@
+
 # Commands useful for building a boot image
 # ===========================================================================
 #
diff --git a/scripts/gcc-plugins/Makefile b/scripts/gcc-plugins/Makefile
index 320afd3cf8e8..05b14aba41ef 100644
--- a/scripts/gcc-plugins/Makefile
+++ b/scripts/gcc-plugins/Makefile
@@ -66,3 +66,7 @@ quiet_cmd_plugin_cxx_o_c = HOSTCXX $@
 
 $(plugin-objs): $(obj)/%.o: $(src)/%.c FORCE
 	$(call if_changed_dep,plugin_cxx_o_c)
+
+$(obj)/../../include/generated/gcc-plugins.h: $(plugin-single) $(plugin-multi) FORCE
+	$(call if_changed,touch)
+always-y += ../../include/generated/gcc-plugins.h
-- 
2.34.1


