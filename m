Return-Path: <linux-kbuild+bounces-132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD707F5ABE
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 10:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FE7A1C2083C
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Nov 2023 09:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBF81D551;
	Thu, 23 Nov 2023 09:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUimwDIM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7241C6A8
	for <linux-kbuild@vger.kernel.org>; Thu, 23 Nov 2023 09:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4651AC433C8;
	Thu, 23 Nov 2023 09:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700730353;
	bh=+S0QOs7zuWZpTFZyFLS6YyVha4vuoTNTbVeQoPbXayw=;
	h=From:To:Cc:Subject:Date:From;
	b=nUimwDIM3kEWMXTLYyaNe/kIGqot2BYZsI6KSDQeNRxirqfA1rFhNYqJ7/Fmef+eU
	 kk6/GvIJ7HWifHJcEhO/IhcUFO2+mBVDGtNDdF3OncQo2D1rqscuvZ8plDM8zGzHsb
	 KPsLyNlk3yys5ww6DinYnQ7z7BfL3cFC7uI4avn0qt2bNt3Xj+vCbP7HW2tv2K8w6V
	 IFhFtv/HUJZsZ05KrRkh0eyOsan/yxlmfsZ+h8I+Uizih29sD3f87bZo3FLH0kAY06
	 eEu9rpBFvx3SDe13u1U10KRm8YlvDKx9DgKBLcaTaQdynfq61QpVuNQ4r4DWyU3zXY
	 Me8WYYTdxn8Gg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kbuild: support W=c and W=e shorthands for Kconfig
Date: Thu, 23 Nov 2023 18:05:40 +0900
Message-Id: <20231123090540.485309-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KCONFIG_WARN_UNKNOWN_SYMBOLS=1 and KCONFIG_WERROR=1 are descriptive
and suitable in scripting, but it is tedious to type them from the
command line.

Associate them with KBUILD_EXTRA_WARN (and the W= shorthand).

Support a new letter 'c' for KBUILD_EXTRA_WARN to enable extra checks
in Kconfig. You can still manage compiler warnings (W=1) and Kconfig
warnings (W=c) independently.

Reuse the letter 'e' to turn Kconfig warnings into errors.

As usual, you can combine multiple letters in KCONFIG_EXTRA_WARN.

  $ KCONFIG_WARN_UNKNOWN_SYMBOLS=1 KCONFIG_WERROR=1 make defconfig

can be shortened to:

  $ KBUILD_EXTRA_WARN=ce make defconfig

or, even shorter:

  $ make W=ce defconfig

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile                   | 10 ++++++++++
 scripts/Makefile.extrawarn |  9 ---------
 scripts/kconfig/Makefile   |  8 ++++++++
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index f128a1a1b1a0..91947f722b77 100644
--- a/Makefile
+++ b/Makefile
@@ -155,6 +155,15 @@ endif
 
 export KBUILD_EXTMOD
 
+# backward compatibility
+KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
+
+ifeq ("$(origin W)", "command line")
+  KBUILD_EXTRA_WARN := $(W)
+endif
+
+export KBUILD_EXTRA_WARN
+
 # Kbuild will save output files in the current working directory.
 # This does not need to match to the root of the kernel source tree.
 #
@@ -1659,6 +1668,7 @@ help:
 	@echo  '		1: warnings which may be relevant and do not occur too often'
 	@echo  '		2: warnings which occur quite often but may still be relevant'
 	@echo  '		3: more obscure warnings, can most likely be ignored'
+	@echo  '		c: extra checks in the configuration stage (Kconfig)'
 	@echo  '		e: warnings are being treated as errors'
 	@echo  '		Multiple levels can be combined with W=12 or W=123'
 	@$(if $(dtstree), \
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 2fe6f2828d37..3f94915fab37 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -80,15 +80,6 @@ KBUILD_CFLAGS += $(call cc-option,-Werror=designated-init)
 # Warn if there is an enum types mismatch
 KBUILD_CFLAGS += $(call cc-option,-Wenum-conversion)
 
-# backward compatibility
-KBUILD_EXTRA_WARN ?= $(KBUILD_ENABLE_EXTRA_GCC_CHECKS)
-
-ifeq ("$(origin W)", "command line")
-  KBUILD_EXTRA_WARN := $(W)
-endif
-
-export KBUILD_EXTRA_WARN
-
 #
 # W=1 - warnings which may be relevant and do not occur too often
 #
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 4eee155121a8..322c061b464d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -27,6 +27,14 @@ KCONFIG_DEFCONFIG_LIST += \
 endif
 KCONFIG_DEFCONFIG_LIST += arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)
 
+ifneq ($(findstring c, $(KBUILD_EXTRA_WARN)),)
+export KCONFIG_WARN_UNKNOWN_SYMBOLS=1
+endif
+
+ifneq ($(findstring e, $(KBUILD_EXTRA_WARN)),)
+export KCONFIG_WERROR=1
+endif
+
 # We need this, in case the user has it in its environment
 unexport CONFIG_
 
-- 
2.40.1


