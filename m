Return-Path: <linux-kbuild+bounces-7351-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE05ACBAEB
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 20:13:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 141901645D3
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 18:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96EE214EC60;
	Mon,  2 Jun 2025 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YfSTEG0N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A493EAF9;
	Mon,  2 Jun 2025 18:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887982; cv=none; b=MA/7xkwK12vbBcbf8hMz3a6tYW3m6qO5yP29mCUJA96hEKJNgvwZVXrDZPymd6nzr8Cx2ki5hbUL0YUXYgipKOkkj+oAYA0jeI2BomXKCVmkLxrh1t/UhGUyFpxpi0k+m8DZisVLko85JmzGsUwf6TlFODXdprCKlv35ghND1xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887982; c=relaxed/simple;
	bh=RJ6rpSrXvLz6wxOJiN/tjv+raRLD1U4SGsl5aeK5i88=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fD9LkDfWldKjIBK9XS9QnmwdV2Kgk9Ys+lcpH2NZ9s675Zdmj8W1UcG336qjFkoLzfgX+7I9JJN3jqfB6+/UzF4PobvxLcFHBSVcRxYzD0rS649NwhTZJ0ohjkzoEa98v/+BcMjdgkq9X3QbBVSR1QdUMlKK9m+hCsmA4pPeBZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfSTEG0N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF336C4CEEB;
	Mon,  2 Jun 2025 18:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887982;
	bh=RJ6rpSrXvLz6wxOJiN/tjv+raRLD1U4SGsl5aeK5i88=;
	h=From:To:Cc:Subject:Date:From;
	b=YfSTEG0NwLNuaU45TiJIyjBBoZat5sHcaoWzPUjSgGlk89/55C9lUqHLagCZ+fiyD
	 aBDAfI9FVYv6zpYeht+0xcIcDb7PC7nltnWBtVq3R+zj7u/nZiFGLsQMqy/FgZ7lnn
	 DqWgrzAJjBHa5Dafhqvrpa6JRh/FJuFZPZmA3duH5NFgEMoFo3o1wTW19uG3zjPudM
	 Kg8V0qPjtr2xMb5eMa5R/9i5UDE79bSofeDPGJa45iMcZIOh17JTYT/aJmXxItEpEq
	 WKShleM+BK8zgVY/nyzG+J+y596WI2hetOFJzDiMkr64sibg20EFr9eQ+c5/ifWk2c
	 aPTirCAocqI7w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: set y instead of 1 to KBUILD_{BUILTIN,MODULES}
Date: Tue,  3 Jun 2025 03:12:53 +0900
Message-ID: <20250602181256.529033-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KBUILD_BUILTIN is set to 1 unless you are building only modules.

KBUILT_MODULES is set to 1 when you are building only modules
(a typical use case is "make modules").

It is more useful to set them to 'y' instead, so we can do
something like:

    always-$(KBUILD_BUILTIN) += vmlinux.lds

This works equivalently to:

    extra-y                  += vmlinux.lds

This allows us to deprecate extra-y. extra-y and always-y are quite
similar, and we do not need both.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst |  8 ++++++--
 Makefile                           | 16 ++++++++--------
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 3b9a8bc671e2..264b83182509 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -273,8 +273,8 @@ It is good practice to use a ``CONFIG_`` variable when assigning directory
 names. This allows kbuild to totally skip the directory if the
 corresponding ``CONFIG_`` option is neither "y" nor "m".
 
-Non-builtin vmlinux targets - extra-y
--------------------------------------
+Non-builtin vmlinux targets - extra-y (DEPRECATED)
+--------------------------------------------------
 
 extra-y specifies targets which are needed for building vmlinux,
 but not combined into built-in.a.
@@ -291,6 +291,10 @@ Example::
   # arch/x86/kernel/Makefile
   extra-y	+= vmlinux.lds
 
+extra-y is now deprecated because this is equivalent to:
+
+  always-$(KBUILD_BUILTIN) += vmlinux.lds
+
 $(extra-y) should only contain targets needed for vmlinux.
 
 Kbuild skips extra-y when vmlinux is apparently not a final goal.
diff --git a/Makefile b/Makefile
index 7a52be3a4b80..72e75a0caa32 100644
--- a/Makefile
+++ b/Makefile
@@ -749,7 +749,7 @@ targets :=
 # Normally, just do built-in.
 
 KBUILD_MODULES :=
-KBUILD_BUILTIN := 1
+KBUILD_BUILTIN := y
 
 # If we have only "make modules", don't compile built-in objects.
 ifeq ($(MAKECMDGOALS),modules)
@@ -761,11 +761,11 @@ endif
 # Just "make" or "make all" shall build modules as well
 
 ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)
-  KBUILD_MODULES := 1
+  KBUILD_MODULES := y
 endif
 
 ifeq ($(MAKECMDGOALS),)
-  KBUILD_MODULES := 1
+  KBUILD_MODULES := y
 endif
 
 export KBUILD_MODULES KBUILD_BUILTIN
@@ -1193,7 +1193,7 @@ export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 ifdef CONFIG_TRIM_UNUSED_KSYMS
 # For the kernel to actually contain only the needed exported symbols,
 # we have to build modules as well to determine what those symbols are.
-KBUILD_MODULES := 1
+KBUILD_MODULES := y
 endif
 
 PHONY += vmlinux_a
@@ -1529,7 +1529,7 @@ all: modules
 # the built-in objects during the descend as well, in order to
 # make sure the checksums are up to date before we record them.
 ifdef CONFIG_MODVERSIONS
-  KBUILD_BUILTIN := 1
+  KBUILD_BUILTIN := y
 endif
 
 # Build modules
@@ -1538,7 +1538,7 @@ endif
 # *.ko are usually independent of vmlinux, but CONFIG_DEBUG_INFO_BTF_MODULES
 # is an exception.
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
-KBUILD_BUILTIN := 1
+KBUILD_BUILTIN := y
 modules: vmlinux
 endif
 
@@ -1855,7 +1855,7 @@ filechk_kernel.release = echo $(KERNELRELEASE)
 
 # We are always building only modules.
 KBUILD_BUILTIN :=
-KBUILD_MODULES := 1
+KBUILD_MODULES := y
 
 build-dir := .
 
@@ -1983,7 +1983,7 @@ endif
 
 single-goals := $(addprefix $(build-dir)/, $(single-no-ko))
 
-KBUILD_MODULES := 1
+KBUILD_MODULES := y
 
 endif
 
-- 
2.43.0


