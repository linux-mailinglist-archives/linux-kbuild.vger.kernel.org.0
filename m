Return-Path: <linux-kbuild+bounces-6486-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 242D5A7DA01
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 11:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9E016CDC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 09:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 037A9230BCA;
	Mon,  7 Apr 2025 09:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHsw47fa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C405B14A82;
	Mon,  7 Apr 2025 09:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744018892; cv=none; b=mpwzzg6qrXOdRJE6NE1TaHiw+YuRthdxuJ/i48pr1RUTtl7aH2GHSTKRSibZQzBYgKPiek2DwXTM18S+deOKqFyubKgYOxrNzAtQCbiIqnP8YiZ+ixbNfuJTuQY6eXCiDvchKpzUySNfHvhs1ryN7ekOTHTYGnXastA1sTKdnyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744018892; c=relaxed/simple;
	bh=LADWl+fVBw+ZhNd73tyJyeOs41U/nX6r/rG0GxLjseE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oCd5lWxP/kZ1FOGiPXfdJOaUh/1lIu4+PKnbxn7TFc6WELgzqxRtpMn4iF7SV63V0foJJv6YocWfK9sxVkezxjgUXv/0ffR32XlOXDs5uaHAtCuM8/HT/1ukACOqybGvMa4SR0TBewNzbu686QHc1NxQvkhN1cdX1R1wjJvX26c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHsw47fa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83C23C4CEDD;
	Mon,  7 Apr 2025 09:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744018892;
	bh=LADWl+fVBw+ZhNd73tyJyeOs41U/nX6r/rG0GxLjseE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XHsw47fa1vykt54xSk2kKBeoNqvHMWT4hSYd+mem0KHkTAtdDPRPviOIjH7TmXyIn
	 cGitmtAXfD1pge+FopBslumR8GbdAy0390VqmZNyN2zCjT22l0M2lSPgofYkvpaH5m
	 sQaZ5V9UHeTmZxGI9F+uB7zCE96/uwsd34Cr1oJj7WWPUUup49+nNeShQIAvbcFR5P
	 J2zAJ8sSYmVLIcqTe3Og+D5lEhYXiFMrsyLge5oyYIRaT+/dr77QL5vaNTzY4Aw0bE
	 GrA0fRws1IGUPIbtS3GyRIIwkxMQGB6qp1vyyxMJWa4AboI3lT1RQ91UIJQ+TRbCHA
	 yIy7kbl+9ZXlw==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 1/4] kbuild: require gcc-8 and binutils-2.30
Date: Mon,  7 Apr 2025 11:41:13 +0200
Message-Id: <20250407094116.1339199-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>
References: <20250407094116.1339199-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Commit a3e8fe814ad1 ("x86/build: Raise the minimum GCC version to 8.1")
raised the minimum compiler version as enforced by Kbuild to gcc-8.1
and clang-15 for x86.

This is actually the same gcc version that has been discussed as the
minimum for all architectures several times in the past, with little
objection. A previous concern was the kernel for SLE15-SP7 needing to
be built with gcc-7. As this ended up still using linux-6.4 and there
is no plan for an SP8, this is no longer a problem.

Change it for all architectures and adjust the documentation accordingly.
A few version checks can be removed in the process.  The binutils
version 2.30 is the lowest version used in combination with gcc-8 on
common distros, so use that as the corresponding minimum.

Link: https://lore.kernel.org/lkml/20240925150059.3955569-32-ardb+git@google.com/
Link: https://lore.kernel.org/lkml/871q7yxrgv.wl-tiwai@suse.de/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/admin-guide/README.rst          |  2 +-
 Documentation/kbuild/makefiles.rst            |  4 +-
 Documentation/process/changes.rst             |  4 +-
 .../translations/it_IT/process/changes.rst    |  4 +-
 .../translations/zh_CN/admin-guide/README.rst |  2 +-
 arch/um/Makefile                              |  4 +-
 include/linux/unroll.h                        |  4 +-
 kernel/gcov/gcc_4_7.c                         |  4 --
 lib/test_fortify/Makefile                     |  5 +--
 scripts/Makefile.compiler                     |  2 +-
 scripts/gcc-plugins/gcc-common.h              | 45 -------------------
 scripts/min-tool-version.sh                   |  6 +--
 12 files changed, 14 insertions(+), 72 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 70b02f30013a..05301f03b717 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -259,7 +259,7 @@ Configuring the kernel
 Compiling the kernel
 --------------------
 
- - Make sure you have at least gcc 5.1 available.
+ - Make sure you have at least gcc 8.1 available.
    For more information, refer to :ref:`Documentation/process/changes.rst <changes>`.
 
  - Do a ``make`` to create a compressed kernel image. It is also possible to do
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 3b9a8bc671e2..38cc656fac20 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -625,10 +625,10 @@ gcc-min-version
 
   Example::
 
-    cflags-$(call gcc-min-version, 70100) := -foo
+    cflags-$(call gcc-min-version, 110100) := -foo
 
   In this example, cflags-y will be assigned the value -foo if $(CC) is gcc and
-  $(CONFIG_GCC_VERSION) is >= 7.1.
+  $(CONFIG_GCC_VERSION) is >= 11.1.
 
 clang-min-version
   clang-min-version tests if the value of $(CONFIG_CLANG_VERSION) is greater
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index d564362773b5..41b1431f5a6b 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -29,13 +29,13 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
-GNU C                  5.1              gcc --version
+GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  13.0.1           clang --version
 Rust (optional)        1.78.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
-binutils               2.25             ld -v
+binutils               2.30             ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
 pahole                 1.16             pahole --version
diff --git a/Documentation/translations/it_IT/process/changes.rst b/Documentation/translations/it_IT/process/changes.rst
index c7d05e2fff15..2e203fbd1785 100644
--- a/Documentation/translations/it_IT/process/changes.rst
+++ b/Documentation/translations/it_IT/process/changes.rst
@@ -32,13 +32,13 @@ PC Card, per esempio, probabilmente non dovreste preoccuparvi di pcmciautils.
 ====================== =================  ========================================
         Programma       Versione minima       Comando per verificare la versione
 ====================== =================  ========================================
-GNU C                  5.1                gcc --version
+GNU C                  8.1                gcc --version
 Clang/LLVM (optional)  13.0.0             clang --version
 Rust (opzionale)       1.78.0             rustc --version
 bindgen (opzionale)    0.65.1             bindgen --version
 GNU make               4.0                make --version
 bash                   4.2                bash --version
-binutils               2.25               ld -v
+binutils               2.30               ld -v
 flex                   2.5.35             flex --version
 bison                  2.0                bison --version
 pahole                 1.16               pahole --version
diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index 1bdafdc4c8e2..82e628b77efd 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -224,7 +224,7 @@ Linux内核6.x版本 <http://kernel.org/>
 编译内核
 ---------
 
- - 确保您至少有gcc 5.1可用。
+ - 确保您至少有gcc 8.1可用。
    有关更多信息，请参阅 :ref:`Documentation/process/changes.rst <changes>` 。
 
  - 执行 ``make`` 来创建压缩内核映像。如果您安装了lilo以适配内核makefile，
diff --git a/arch/um/Makefile b/arch/um/Makefile
index 1d36a613aad8..599c167890ff 100644
--- a/arch/um/Makefile
+++ b/arch/um/Makefile
@@ -118,9 +118,7 @@ archprepare:
 	$(Q)$(MAKE) $(build)=$(HOST_DIR)/um include/generated/user_constants.h
 
 LINK-$(CONFIG_LD_SCRIPT_STATIC) += -static
-ifdef CONFIG_LD_SCRIPT_DYN
-LINK-$(call gcc-min-version, 60100)$(CONFIG_CC_IS_CLANG) += -no-pie
-endif
+LINK-$(CONFIG_LD_SCRIPT_DYN) += -no-pie
 LINK-$(CONFIG_LD_SCRIPT_DYN_RPATH) += -Wl,-rpath,/lib
 
 CFLAGS_NO_HARDENING := $(call cc-option, -fno-PIC,) $(call cc-option, -fno-pic,) \
diff --git a/include/linux/unroll.h b/include/linux/unroll.h
index 863fb69f6a7e..186b71de740f 100644
--- a/include/linux/unroll.h
+++ b/include/linux/unroll.h
@@ -11,10 +11,8 @@
 
 #ifdef CONFIG_CC_IS_CLANG
 #define __pick_unrolled(x, y)		_Pragma(#x)
-#elif CONFIG_GCC_VERSION >= 80000
-#define __pick_unrolled(x, y)		_Pragma(#y)
 #else
-#define __pick_unrolled(x, y)		/* not supported */
+#define __pick_unrolled(x, y)		_Pragma(#y)
 #endif
 
 /**
diff --git a/kernel/gcov/gcc_4_7.c b/kernel/gcov/gcc_4_7.c
index fd75b4a484d7..a08cc076f332 100644
--- a/kernel/gcov/gcc_4_7.c
+++ b/kernel/gcov/gcc_4_7.c
@@ -22,10 +22,6 @@
 #define GCOV_COUNTERS			9
 #elif (__GNUC__ >= 10)
 #define GCOV_COUNTERS			8
-#elif (__GNUC__ >= 7)
-#define GCOV_COUNTERS			9
-#elif (__GNUC__ > 5) || (__GNUC__ == 5 && __GNUC_MINOR__ >= 1)
-#define GCOV_COUNTERS			10
 #else
 #define GCOV_COUNTERS			9
 #endif
diff --git a/lib/test_fortify/Makefile b/lib/test_fortify/Makefile
index 1c3f82ad8bb2..399cae880e1d 100644
--- a/lib/test_fortify/Makefile
+++ b/lib/test_fortify/Makefile
@@ -18,10 +18,7 @@ quiet_cmd_gen_fortify_log = CAT     $@
 $(obj)/test_fortify.log: $(addprefix $(obj)/, $(logs)) FORCE
 	$(call if_changed,gen_fortify_log)
 
-# GCC<=7 does not always produce *.d files.
-# Run the tests only for GCC>=8 or Clang.
-always-$(call gcc-min-version, 80000) += test_fortify.log
-always-$(CONFIG_CC_IS_CLANG)          += test_fortify.log
+always-y += test_fortify.log
 
 # Some architectures define __NO_FORTIFY if __SANITIZE_ADDRESS__ is undefined.
 # Pass CFLAGS_KASAN to avoid warnings.
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 8956587b8547..d74fad494b5b 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -60,7 +60,7 @@ cc-option-yn = $(if $(call cc-option,$1),y,n)
 cc-disable-warning = $(if $(call cc-option,-W$(strip $1)),-Wno-$(strip $1))
 
 # gcc-min-version
-# Usage: cflags-$(call gcc-min-version, 70100) += -foo
+# Usage: cflags-$(call gcc-min-version, 110100) += -foo
 gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
 
 # clang-min-version
diff --git a/scripts/gcc-plugins/gcc-common.h b/scripts/gcc-plugins/gcc-common.h
index 3222c1070444..3fdaf1c4b258 100644
--- a/scripts/gcc-plugins/gcc-common.h
+++ b/scripts/gcc-plugins/gcc-common.h
@@ -3,11 +3,7 @@
 #define GCC_COMMON_H_INCLUDED
 
 #include "bversion.h"
-#if BUILDING_GCC_VERSION >= 6000
 #include "gcc-plugin.h"
-#else
-#include "plugin.h"
-#endif
 #include "plugin-version.h"
 #include "config.h"
 #include "system.h"
@@ -39,9 +35,7 @@
 
 #include "hash-map.h"
 
-#if BUILDING_GCC_VERSION >= 7000
 #include "memmodel.h"
-#endif
 #include "emit-rtl.h"
 #include "debug.h"
 #include "target.h"
@@ -74,9 +68,7 @@
 #include "context.h"
 #include "tree-ssa-alias.h"
 #include "tree-ssa.h"
-#if BUILDING_GCC_VERSION >= 7000
 #include "tree-vrp.h"
-#endif
 #include "tree-ssanames.h"
 #include "print-tree.h"
 #include "tree-eh.h"
@@ -149,16 +141,6 @@ static inline opt_pass *get_pass_for_id(int id)
 	return g->get_passes()->get_pass_for_id(id);
 }
 
-#if BUILDING_GCC_VERSION < 6000
-/* gimple related */
-template <>
-template <>
-inline bool is_a_helper<const gassign *>::test(const_gimple gs)
-{
-	return gs->code == GIMPLE_ASSIGN;
-}
-#endif
-
 #define TODO_verify_ssa TODO_verify_il
 #define TODO_verify_flow TODO_verify_il
 #define TODO_verify_stmts TODO_verify_il
@@ -181,7 +163,6 @@ static inline const char *get_decl_section_name(const_tree decl)
 #define varpool_get_node(decl) varpool_node::get(decl)
 #define dump_varpool_node(file, node) (node)->dump(file)
 
-#if BUILDING_GCC_VERSION >= 8000
 #define cgraph_create_edge(caller, callee, call_stmt, count, freq) \
 	(caller)->create_edge((callee), (call_stmt), (count))
 
@@ -189,15 +170,6 @@ static inline const char *get_decl_section_name(const_tree decl)
 		old_call_stmt, call_stmt, count, freq, reason)	\
 	(caller)->create_edge_including_clones((callee),	\
 		(old_call_stmt), (call_stmt), (count), (reason))
-#else
-#define cgraph_create_edge(caller, callee, call_stmt, count, freq) \
-	(caller)->create_edge((callee), (call_stmt), (count), (freq))
-
-#define cgraph_create_edge_including_clones(caller, callee,	\
-		old_call_stmt, call_stmt, count, freq, reason)	\
-	(caller)->create_edge_including_clones((callee),	\
-		(old_call_stmt), (call_stmt), (count), (freq), (reason))
-#endif
 
 typedef struct cgraph_node *cgraph_node_ptr;
 typedef struct cgraph_edge *cgraph_edge_p;
@@ -293,14 +265,12 @@ static inline void cgraph_call_edge_duplication_hooks(cgraph_edge *cs1, cgraph_e
 	symtab->call_edge_duplication_hooks(cs1, cs2);
 }
 
-#if BUILDING_GCC_VERSION >= 6000
 typedef gimple *gimple_ptr;
 typedef const gimple *const_gimple_ptr;
 #define gimple gimple_ptr
 #define const_gimple const_gimple_ptr
 #undef CONST_CAST_GIMPLE
 #define CONST_CAST_GIMPLE(X) CONST_CAST(gimple, (X))
-#endif
 
 /* gimple related */
 static inline gimple gimple_build_assign_with_ops(enum tree_code subcode, tree lhs, tree op1, tree op2 MEM_STAT_DECL)
@@ -400,15 +370,7 @@ static inline void ipa_remove_stmt_references(symtab_node *referring_node, gimpl
 	referring_node->remove_stmt_references(stmt);
 }
 
-#if BUILDING_GCC_VERSION < 6000
-#define get_inner_reference(exp, pbitsize, pbitpos, poffset, pmode, punsignedp, preversep, pvolatilep, keep_aligning)	\
-	get_inner_reference(exp, pbitsize, pbitpos, poffset, pmode, punsignedp, pvolatilep, keep_aligning)
-#define gen_rtx_set(ARG0, ARG1) gen_rtx_SET(VOIDmode, (ARG0), (ARG1))
-#endif
-
-#if BUILDING_GCC_VERSION >= 6000
 #define gen_rtx_set(ARG0, ARG1) gen_rtx_SET((ARG0), (ARG1))
-#endif
 
 #ifdef __cplusplus
 static inline void debug_tree(const_tree t)
@@ -425,15 +387,8 @@ static inline void debug_gimple_stmt(const_gimple s)
 #define debug_gimple_stmt(s) debug_gimple_stmt(CONST_CAST_GIMPLE(s))
 #endif
 
-#if BUILDING_GCC_VERSION >= 7000
 #define get_inner_reference(exp, pbitsize, pbitpos, poffset, pmode, punsignedp, preversep, pvolatilep, keep_aligning)	\
 	get_inner_reference(exp, pbitsize, pbitpos, poffset, pmode, punsignedp, preversep, pvolatilep)
-#endif
-
-#if BUILDING_GCC_VERSION < 7000
-#define SET_DECL_ALIGN(decl, align)	DECL_ALIGN(decl) = (align)
-#define SET_DECL_MODE(decl, mode)	DECL_MODE(decl) = (mode)
-#endif
 
 #if BUILDING_GCC_VERSION >= 14000
 #define last_stmt(x)			last_nondebug_stmt(x)
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 787868183b84..0d223b4a9445 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -14,15 +14,13 @@ fi
 
 case "$1" in
 binutils)
-	echo 2.25.0
+	echo 2.30.0
 	;;
 gcc)
 	if [ "$ARCH" = parisc64 ]; then
 		echo 12.0.0
-	elif [ "$SRCARCH" = x86 ]; then
-		echo 8.1.0
 	else
-		echo 5.1.0
+		echo 8.1.0
 	fi
 	;;
 llvm)
-- 
2.39.5


