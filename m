Return-Path: <linux-kbuild+bounces-7100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C97AB6287
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 07:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33C811884868
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 May 2025 05:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCA91E5716;
	Wed, 14 May 2025 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U2EY8j/a"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930CE101DE;
	Wed, 14 May 2025 05:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747201602; cv=none; b=aChZS3o4PCsc8MYZ3R3GsI7bcOAbvP1P/Z+vVtAECYRIbQjsuqBh+yeUDWbE4JZaiZUfn5ui8SJuKk/KRPF0ws54kpYjK4Tv1gFVbpXSOTNHxltqfMTS93t3a7E5iMUEqt6l/EnRCfQM6cWgx7PTKU6Y8OfVXryfek2u14pNInw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747201602; c=relaxed/simple;
	bh=Qtt2l3MpQEO0rnXc/D0BJQ8VZXVj0i27W9KXpRamOr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gb9DYSMG9YOPh+paFPPwRVvN/lqLBNovCXL1F79Ei/75nIg7V/4ikthKVcvIqEHSL+3O8I52wi0RTa5W8MnbzZJQFK42QKfzLujDCxyUxUtOQrSm1R1fnXQ/0SJInRuAcmJN9jJQVzXehdLwGhPSvZZ3JSGEH45BsHmPnsny3Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U2EY8j/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1457C4CEEB;
	Wed, 14 May 2025 05:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747201602;
	bh=Qtt2l3MpQEO0rnXc/D0BJQ8VZXVj0i27W9KXpRamOr4=;
	h=From:To:Cc:Subject:Date:From;
	b=U2EY8j/afd8yVzA/D8keFSaYNtw+rNJ/kMez3t/UUTOk6LEh+L0k49yNpp7CejQ8s
	 hS2ko53ZmOQ82ks8hkHt1SSs0Q25x10dhVOe4vM1yBZQf0NcGruRgbADJ7x+h6qKM7
	 tuc0+NYvgkRk3t5Ye0hPt5NAuGx9XFnXvhvWiqqBf4USna7sDWorJD6+fR9hRyA1M2
	 +xrNN48WvSfXPLm8qpfch7NeQEfZB08wP8wz8lW/ps7akzmrlEepBfpnpfQ0fUm/vI
	 Ia/vtcL6kQZr8IbEaIuTBtxMWO1Jdl5h+L2D7hyDgRUcpWiDg0Yd2HiiivVJusjCYm
	 /j20uXQ3ApJHw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: [PATCH] kbuild: move kbuild syntax processing to scripts/Makefile.build
Date: Wed, 14 May 2025 14:46:33 +0900
Message-ID: <20250514054635.93577-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

scripts/Makefile.lib is included by the following Makefiles:

  scripts/Makefile.build
  scripts/Makefile.modfinal
  scripts/Makefile.package
  scripts/Makefile.vmlinux
  scripts/Makefile.vmlinux_o

However, the last four do not need to process Kbuild syntax such as
obj-*, lib-*, subdir-*, etc.

Move the relevant code to scripts/Makefile.build.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 84 ++++++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.lib   | 84 ------------------------------------------
 2 files changed, 84 insertions(+), 84 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 13dcd86e74ca..8d8252229895 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -37,6 +37,90 @@ include $(srctree)/scripts/Makefile.compiler
 include $(kbuild-file)
 include $(srctree)/scripts/Makefile.lib
 
+# flags that take effect in current and sub directories
+KBUILD_AFLAGS += $(subdir-asflags-y)
+KBUILD_CFLAGS += $(subdir-ccflags-y)
+KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
+
+# Figure out what we need to build from the various variables
+# ===========================================================================
+
+# When an object is listed to be built compiled-in and modular,
+# only build the compiled-in version
+obj-m := $(filter-out $(obj-y),$(obj-m))
+
+# Libraries are always collected in one lib file.
+# Filter out objects already built-in
+lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
+
+# Subdirectories we need to descend into
+subdir-ym := $(sort $(subdir-y) $(subdir-m) \
+			$(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
+
+# Handle objects in subdirs:
+# - If we encounter foo/ in $(obj-y), replace it by foo/built-in.a and
+#   foo/modules.order
+# - If we encounter foo/ in $(obj-m), replace it by foo/modules.order
+#
+# Generate modules.order to determine modorder. Unfortunately, we don't have
+# information about ordering between -y and -m subdirs. Just put -y's first.
+
+ifdef need-modorder
+obj-m := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m))
+else
+obj-m := $(filter-out %/, $(obj-m))
+endif
+
+ifdef need-builtin
+obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
+else
+obj-y		:= $(filter-out %/, $(obj-y))
+endif
+
+# Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
+suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
+# List composite targets that are constructed by combining other targets
+multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $m)))
+# List primitive targets that are compiled from source files
+real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call suffix-search, $m, $2, $3), $m))
+
+# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
+multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
+multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
+multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
+
+# Replace multi-part objects by their individual parts,
+# including built-in.a from subdirectories
+real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
+real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
+
+always-y += $(always-m)
+
+# hostprogs-always-y += foo
+# ... is a shorthand for
+# hostprogs += foo
+# always-y  += foo
+hostprogs += $(hostprogs-always-y) $(hostprogs-always-m)
+always-y += $(hostprogs-always-y) $(hostprogs-always-m)
+
+# userprogs-always-y is likewise.
+userprogs += $(userprogs-always-y) $(userprogs-always-m)
+always-y += $(userprogs-always-y) $(userprogs-always-m)
+
+# Add subdir path
+
+ifneq ($(obj),.)
+extra-y		:= $(addprefix $(obj)/, $(extra-y))
+always-y	:= $(addprefix $(obj)/, $(always-y))
+targets		:= $(addprefix $(obj)/, $(targets))
+obj-m		:= $(addprefix $(obj)/, $(obj-m))
+lib-y		:= $(addprefix $(obj)/, $(lib-y))
+real-obj-y	:= $(addprefix $(obj)/, $(real-obj-y))
+real-obj-m	:= $(addprefix $(obj)/, $(real-obj-m))
+multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
+subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
+endif
+
 ifndef obj
 $(warning kbuild: Makefile.build is included improperly)
 endif
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bdd..2d3a8470cf39 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -1,89 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-# flags that take effect in current and sub directories
-KBUILD_AFLAGS += $(subdir-asflags-y)
-KBUILD_CFLAGS += $(subdir-ccflags-y)
-KBUILD_RUSTFLAGS += $(subdir-rustflags-y)
-
-# Figure out what we need to build from the various variables
-# ===========================================================================
-
-# When an object is listed to be built compiled-in and modular,
-# only build the compiled-in version
-obj-m := $(filter-out $(obj-y),$(obj-m))
-
-# Libraries are always collected in one lib file.
-# Filter out objects already built-in
-lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
-
-# Subdirectories we need to descend into
-subdir-ym := $(sort $(subdir-y) $(subdir-m) \
-			$(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
-
-# Handle objects in subdirs:
-# - If we encounter foo/ in $(obj-y), replace it by foo/built-in.a and
-#   foo/modules.order
-# - If we encounter foo/ in $(obj-m), replace it by foo/modules.order
-#
-# Generate modules.order to determine modorder. Unfortunately, we don't have
-# information about ordering between -y and -m subdirs. Just put -y's first.
-
-ifdef need-modorder
-obj-m := $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m))
-else
-obj-m := $(filter-out %/, $(obj-m))
-endif
-
-ifdef need-builtin
-obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
-else
-obj-y		:= $(filter-out %/, $(obj-y))
-endif
-
-# Expand $(foo-objs) $(foo-y) etc. by replacing their individuals
-suffix-search = $(strip $(foreach s, $3, $($(1:%$(strip $2)=%$s))))
-# List composite targets that are constructed by combining other targets
-multi-search = $(sort $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $m)))
-# List primitive targets that are compiled from source files
-real-search = $(foreach m, $1, $(if $(call suffix-search, $m, $2, $3 -), $(call suffix-search, $m, $2, $3), $m))
-
-# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
-multi-obj-y := $(call multi-search, $(obj-y), .o, -objs -y)
-multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
-multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
-
-# Replace multi-part objects by their individual parts,
-# including built-in.a from subdirectories
-real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
-real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
-
-always-y += $(always-m)
-
-# hostprogs-always-y += foo
-# ... is a shorthand for
-# hostprogs += foo
-# always-y  += foo
-hostprogs += $(hostprogs-always-y) $(hostprogs-always-m)
-always-y += $(hostprogs-always-y) $(hostprogs-always-m)
-
-# userprogs-always-y is likewise.
-userprogs += $(userprogs-always-y) $(userprogs-always-m)
-always-y += $(userprogs-always-y) $(userprogs-always-m)
-
-# Add subdir path
-
-ifneq ($(obj),.)
-extra-y		:= $(addprefix $(obj)/,$(extra-y))
-always-y	:= $(addprefix $(obj)/,$(always-y))
-targets		:= $(addprefix $(obj)/,$(targets))
-obj-m		:= $(addprefix $(obj)/,$(obj-m))
-lib-y		:= $(addprefix $(obj)/,$(lib-y))
-real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
-real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
-multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
-subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
-endif
-
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
 modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
-- 
2.43.0


