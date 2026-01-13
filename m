Return-Path: <linux-kbuild+bounces-10539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D793D170C4
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 08:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F060A308E4D7
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Jan 2026 07:36:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDBD313554;
	Tue, 13 Jan 2026 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="HiBTSDsG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E683C350A29;
	Tue, 13 Jan 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768289778; cv=none; b=JTp1NMWutWUD3RI270ttQVcW20vapS92SI6Oi9VzI+zVL4lsyiDWDhcBlMGEokhfmGru+CbKlGHih4GVg8niYkg4IsnTcNQQdi9kKT3WyLEhOx02twbmgQbBSvvkOtWf/1SlFsVvecp17SJdWyUuLJImnObRfWqpCC6pGuISORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768289778; c=relaxed/simple;
	bh=Z/KpXmg2acLr6HY276d2km3DUkXuG6WTvI3ls6E5+UM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KHYnIjKTRKw82N/KhgPbOKhyAhKlJmivaS3FRL2J7U2W1+FBAmoUPzGUGXwULNI/aoHIFqZ42rt0UyN8gOx2A29ehhn78HKyuaRCt0HhLqy947NvpxUosbaCAkUDHQD5lC9Fd71nhdzxLM2BeUPKI3yRLjRJhGp2AnXpY8tOWhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=HiBTSDsG; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768289401;
	bh=Z/KpXmg2acLr6HY276d2km3DUkXuG6WTvI3ls6E5+UM=;
	h=From:Date:Subject:To:Cc:From;
	b=HiBTSDsG4tYdLOhwWifV/krOuWGbDApgYRNjFxuB2C8yZzzuSZ8UseZ7BeZW82ggd
	 QpYQ1FYDke/Uu81zpWXZPo9f3WFvp9VmFcRsXzBaGzziVyJ7uN5t9n+s2Ptqpg8uIY
	 HnK8epg4qvggH+4iZW2h0/3lwxRwwpLp7ut0wUaY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 08:29:58 +0100
Subject: [PATCH] kbuild: Drop superfluous compiler option checks
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-kbuild-cc-option-v1-1-011314a0f7f1@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WMTQqDMBBGrxJm3QEzOKbkKsVFTMY2VNQmKgXx7
 g110UWX7/t5O2RJUTJYtUOSLeY4jQX0RYF/uPEuGENhoIqaSmuNz26NQ0DvcZqXMkbDRMbVzNw
 3UG5zkj6+v8pbe3KS11rMyxn+xFb9aYdSoSYkMYZrCuzC1W4a2uP4AFO8dHKsAAAA
X-Change-ID: 20260111-kbuild-cc-option-75227a4555f6
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768289400; l=4526;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Z/KpXmg2acLr6HY276d2km3DUkXuG6WTvI3ls6E5+UM=;
 b=q4JS4Tlt1EoEvIDK+J1fJlpKoFWdE+x5GpHavmUusypSYb2aT3vAdEEFUxi0pGsAENNNRbLSy
 qDvazjqmt1pCoYrodvyEyneGva98srfosNzQR4vuEZye568T4ahMggj
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Many of the compiler option checks are not necessary anymore with the
current supported versions of compilers.

Remove them.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Makefile              |  2 +-
 scripts/Makefile.warn | 23 ++++++++++-------------
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/Makefile b/Makefile
index e404e4767944..232ea447ce5c 100644
--- a/Makefile
+++ b/Makefile
@@ -1102,7 +1102,7 @@ KBUILD_CFLAGS += -fno-builtin-wcslen
 
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_CPPFLAGS += -fmacro-prefix-map=$(srcroot)/=
 endif
 
 # include additional Makefiles when needed
diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
index 68e6fafcb80c..df2f63df6506 100644
--- a/scripts/Makefile.warn
+++ b/scripts/Makefile.warn
@@ -16,7 +16,7 @@ KBUILD_CFLAGS += -Werror=return-type
 KBUILD_CFLAGS += -Werror=strict-prototypes
 KBUILD_CFLAGS += -Wno-format-security
 KBUILD_CFLAGS += -Wno-trigraphs
-KBUILD_CFLAGS += $(call cc-option, -Wno-frame-address)
+KBUILD_CFLAGS += -Wno-frame-address
 KBUILD_CFLAGS += $(call cc-option, -Wno-address-of-packed-member)
 KBUILD_CFLAGS += -Wmissing-declarations
 KBUILD_CFLAGS += -Wmissing-prototypes
@@ -72,7 +72,7 @@ KBUILD_CFLAGS += -Wno-pointer-sign
 # In order to make sure new function cast mismatches are not introduced
 # in the kernel (to avoid tripping CFI checking), the kernel should be
 # globally built with -Wcast-function-type.
-KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
+KBUILD_CFLAGS += -Wcast-function-type
 
 # Currently, disable -Wstringop-overflow for GCC 11, globally.
 KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
@@ -99,7 +99,7 @@ KBUILD_CFLAGS += $(KBUILD_CFLAGS-y) $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 KBUILD_CFLAGS += -Werror=date-time
 
 # enforce correct pointer usage
-KBUILD_CFLAGS += $(call cc-option,-Werror=incompatible-pointer-types)
+KBUILD_CFLAGS += -Werror=incompatible-pointer-types
 
 # Require designated initializers for all marked structures
 KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
@@ -116,7 +116,7 @@ ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 
 KBUILD_CFLAGS += -Wmissing-format-attribute
 KBUILD_CFLAGS += -Wmissing-include-dirs
-KBUILD_CFLAGS += $(call cc-option, -Wunused-const-variable)
+KBUILD_CFLAGS += -Wunused-const-variable
 
 KBUILD_CPPFLAGS += -Wundef
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN1
@@ -125,12 +125,12 @@ else
 
 # Some diagnostics enabled by default are noisy.
 # Suppress them by using -Wno... except for W=1.
-KBUILD_CFLAGS += $(call cc-option, -Wno-unused-but-set-variable)
-KBUILD_CFLAGS += $(call cc-option, -Wno-unused-const-variable)
+KBUILD_CFLAGS += -Wno-unused-but-set-variable
+KBUILD_CFLAGS += -Wno-unused-const-variable
 KBUILD_CFLAGS += $(call cc-option, -Wno-packed-not-aligned)
 KBUILD_CFLAGS += $(call cc-option, -Wno-format-overflow)
 ifdef CONFIG_CC_IS_GCC
-KBUILD_CFLAGS += $(call cc-option, -Wno-format-truncation)
+KBUILD_CFLAGS += -Wno-format-truncation
 endif
 KBUILD_CFLAGS += $(call cc-option, -Wno-stringop-truncation)
 
@@ -145,14 +145,11 @@ KBUILD_CFLAGS += -Wno-format
 # problematic.
 KBUILD_CFLAGS += -Wformat-extra-args -Wformat-invalid-specifier
 KBUILD_CFLAGS += -Wformat-zero-length -Wnonnull
-# Requires clang-12+.
-ifeq ($(call clang-min-version, 120000),y)
 KBUILD_CFLAGS += -Wformat-insufficient-args
 endif
-endif
-KBUILD_CFLAGS += $(call cc-option, -Wno-pointer-to-enum-cast)
+KBUILD_CFLAGS += -Wno-pointer-to-enum-cast
 KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
-KBUILD_CFLAGS += $(call cc-option, -Wno-unaligned-access)
+KBUILD_CFLAGS += -Wno-unaligned-access
 KBUILD_CFLAGS += -Wno-enum-compare-conditional
 endif
 
@@ -166,7 +163,7 @@ ifneq ($(findstring 2, $(KBUILD_EXTRA_WARN)),)
 KBUILD_CFLAGS += -Wdisabled-optimization
 KBUILD_CFLAGS += -Wshadow
 KBUILD_CFLAGS += $(call cc-option, -Wlogical-op)
-KBUILD_CFLAGS += $(call cc-option, -Wunused-macros)
+KBUILD_CFLAGS += -Wunused-macros
 
 KBUILD_CPPFLAGS += -DKBUILD_EXTRA_WARN2
 

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260111-kbuild-cc-option-75227a4555f6
prerequisite-change-id: 20260111-kbuild-clang-12-2e77542d5ad8:v1

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


