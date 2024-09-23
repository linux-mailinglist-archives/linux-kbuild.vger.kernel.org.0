Return-Path: <linux-kbuild+bounces-3663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DD897E6FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 09:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4C6E3B21179
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Sep 2024 07:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4433B6F2F2;
	Mon, 23 Sep 2024 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTPTb9+j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134D147772;
	Mon, 23 Sep 2024 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727078239; cv=none; b=VCUg8lsoO1WCzDkEnAPYACidQE5gaqE7dMNsEKPIc9s3STFCk5FeTpmjEs//zBLEgioz1UCFWn4T3Kk/a2qRlTzbXQP3jhSC3pvLmXohW4dP+vfI+GCVqMnyAntsO/WJwfMq+cbe8vmBBMYFHTOCljl0gaELpI2lOFrvC0Kqt3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727078239; c=relaxed/simple;
	bh=TWkMdFBTmQmqmpC+xZ/pwB45UvOXbJoKSGnpNu/GFSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IML/M4b/EyCEgSVnOITXYnHFFlvUM0upEEvwaovlolRV9DDd8SHN4DrhAuNxU8oIUXCi+sEQOEhxXqPtejsQF+T5EcWxBDe3NcGwPUMYFWVd5Ck6TPshvFvPl68WJlEhsasu0Nf3N5bZ/q7lwdah3yoHdNAGsO35OkzjcIydPQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTPTb9+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41952C4CECE;
	Mon, 23 Sep 2024 07:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727078238;
	bh=TWkMdFBTmQmqmpC+xZ/pwB45UvOXbJoKSGnpNu/GFSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YTPTb9+jxBilMY8haTRI1bORDb8Vh7bjneQOb1eNaKcr5uHJyV75WZtqhwX/Q98Xr
	 jz8r5Ys+2gIJMjFPFeMl9pGMkqEIcSQtMOvIxiJVbXAEEJSmlXkd/utqFoO+8+B+B3
	 BIOBnVVRKPYxS+ctVP7ZnHFDqZrrhAaoBE8Olndp84ZMyaD1NdZft66XZn5dyAPWZc
	 BXuOBYUX2BEjx+xd+bkU4jST8PrUZqG5jmglLdSfqzY9rZNGjPUygD33afhGyv2Ejp
	 JsSUBBY6iQX9ISTkI2ZF8sXUlB2OzHt6dC6MXwvi5OrPs7RARbRqiL4S4KSXADEVGJ
	 o9N6hW+VTtRew==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brendan Higgins <brendanhiggins@google.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Saravana Kannan <saravanak@google.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 2/2] kbuild: add generic support for built-in boot DTBs
Date: Mon, 23 Sep 2024 16:56:03 +0900
Message-ID: <20240923075704.3567313-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240923075704.3567313-1-masahiroy@kernel.org>
References: <20240923075704.3567313-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some architectures embed boot DTBs in vmlinux. A potential issue for
these architectures is a race condition during parallel builds because
Kbuild descends into arch/*/boot/dts/ twice.

One build thread is initiated by the 'dtbs' target, which is a
prerequisite of the 'all' target in the top-level Makefile:

  ifdef CONFIG_OF_EARLY_FLATTREE
  all: dtbs
  endif

For architectures that support the built-in boot dtb, arch/*/boot/dts/
is visited also during the ordinary directory traversal in order to
build obj-y objects that wrap DTBs.

Since these build threads are unaware of each other, they can run
simultaneously during parallel builds.

This commit introduces a generic build rule to scripts/Makefile.vmlinux
to support embedded boot DTBs in a race-free way. Architectures that
want to use this rule need to select CONFIG_GENERIC_BUILTIN_DTB.

After the migration, Makefiles under arch/*/boot/dts/ will be visited
only once to build only *.dtb files.

This change also aims to unify the CONFIG options used for built-in DTBs
support. Currently, different architectures use different CONFIG options
for the same purposes.

With this commit, the CONFIG options will be unified as follows:

 - CONFIG_GENERIC_BUILTIN_DTB

   This enables the generic rule for built-in boot DTBs. This will be
   renamed to CONFIG_BUILTIN_DTB after all architectures migrate to the
   generic rule.

 - CONFIG_BUILTIN_DTB_NAME

   This specifies the path to the embedded DTB.
   (relative to arch/*/boot/dts/)

 - CONFIG_BUILTIN_DTB_ALL

   If this is enabled, all DTB files compiled under arch/*/boot/dts/ are
   embedded into vmlinux. Only used by MIPS.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Makefile                 |  7 ++++++-
 drivers/of/Kconfig       |  6 ++++++
 scripts/Makefile.vmlinux | 44 ++++++++++++++++++++++++++++++++++++++++
 scripts/link-vmlinux.sh  |  4 ++++
 4 files changed, 60 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0d3d45a88a71..35b8392d2bef 100644
--- a/Makefile
+++ b/Makefile
@@ -1413,6 +1413,10 @@ ifdef CONFIG_OF_EARLY_FLATTREE
 all: dtbs
 endif
 
+ifdef CONFIG_GENERIC_BUILTIN_DTB
+vmlinux: dtbs
+endif
+
 endif
 
 PHONY += scripts_dtc
@@ -1480,7 +1484,8 @@ CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       modules.builtin.ranges vmlinux.o.map \
 	       compile_commands.json rust/test \
-	       rust-project.json .vmlinux.objs .vmlinux.export.c
+	       rust-project.json .vmlinux.objs .vmlinux.export.c \
+               .builtin-dtbs-list .builtin-dtb.S
 
 # Directories & files removed with 'make mrproper'
 MRPROPER_FILES += include/config include/generated          \
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index dd726c7056bf..5142e7d7fef8 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -2,6 +2,12 @@
 config DTC
 	bool
 
+config GENERIC_BUILTIN_DTB
+	bool
+
+config BUILTIN_DTB_ALL
+	bool
+
 menuconfig OF
 	bool "Device Tree and Open Firmware support"
 	help
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 1284f05555b9..9ef0480ed755 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -17,6 +17,50 @@ quiet_cmd_cc_o_c = CC      $@
 %.o: %.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
+quiet_cmd_as_o_S = AS      $@
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $<
+
+%.o: %.S FORCE
+	$(call if_changed_dep,as_o_S)
+
+# Built-in dtb
+# ---------------------------------------------------------------------------
+
+quiet_cmd_wrap_dtbs = WRAP    $@
+      cmd_wrap_dtbs = {							\
+	echo '\#include <asm-generic/vmlinux.lds.h>';			\
+	echo '.section .dtb.init.rodata,"a"';				\
+	while read dtb; do						\
+		symbase=__dtb_$$(basename -s .dtb "$${dtb}" | tr - _);	\
+		echo '.balign STRUCT_ALIGNMENT';			\
+		echo ".global $${symbase}_begin";			\
+		echo "$${symbase}_begin:";				\
+		echo '.incbin "'$$dtb'" ';				\
+		echo ".global $${symbase}_end";				\
+		echo "$${symbase}_end:";				\
+	done < $<;							\
+	} > $@
+
+.builtin-dtbs.S: .builtin-dtbs-list FORCE
+	$(call if_changed,wrap_dtbs)
+
+quiet_cmd_gen_dtbs_list = GEN     $@
+      cmd_gen_dtbs_list = \
+	$(if $(CONFIG_BUILTIN_DTB_NAME), echo "arch/$(SRCARCH)/boot/dts/$(CONFIG_BUILTIN_DTB_NAME).dtb",:) > $@
+
+.builtin-dtbs-list: arch/$(SRCARCH)/boot/dts/dtbs-list FORCE
+	$(call if_changed,$(if $(CONFIG_BUILTIN_DTB_ALL),copy,gen_dtbs_list))
+
+targets += .builtin-dtbs-list
+
+ifdef CONFIG_GENERIC_BUILTIN_DTB
+targets += .builtin-dtbs.S .builtin-dtbs.o
+vmlinux: .builtin-dtbs.o
+endif
+
+# vmlinux
+# ---------------------------------------------------------------------------
+
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
 vmlinux: .vmlinux.export.o
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index c27b4e969f20..bd196944e350 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -68,6 +68,10 @@ vmlinux_link()
 		libs="${KBUILD_VMLINUX_LIBS}"
 	fi
 
+	if is_enabled CONFIG_GENERIC_BUILTIN_DTB; then
+		objs="${objs} .builtin-dtbs.o"
+	fi
+
 	if is_enabled CONFIG_MODULES; then
 		objs="${objs} .vmlinux.export.o"
 	fi
-- 
2.43.0


