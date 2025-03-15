Return-Path: <linux-kbuild+bounces-6175-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734CA62D65
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 14:20:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDD8F1781CA
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 Mar 2025 13:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08E411DC9BE;
	Sat, 15 Mar 2025 13:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JNEWAJLP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD49B188012;
	Sat, 15 Mar 2025 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742044828; cv=none; b=g6Sx1h0xxpAViDKD1jEY4mJxxh9YKxaIK0c/APOZGpg/nXvBVFWZgIvLDIUz5ySPPCSUS/JbWTCVKXflkdp92c40+9kF7kXO5CDo90JBXxIOE9Cv1pW6VM/i2SLwvFhGylUJkTPJg6qcmaOIfwYhlK2xLWAdU5nZbfI3wRioosE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742044828; c=relaxed/simple;
	bh=5aAd5kxEgpNv9jP73xNPFCtdSg1gvVxKex9LF+vIYYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YWYYhct9xrUNsL6SAxEk7mlYb0PldU4BoFbiUkSOmHPX4WmuJSQtEKyhyyYYlKK/K4TW8XWJO8vzcumWeWU6GtVHEA3Gg1CoQkCxkiE341UdI12NgzM/NOaMjDjKt1n6+68/W+j8vpq8ygRt2NzI2ADi3ArIGXLn8WfaNUQpLZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JNEWAJLP; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1742044815;
	bh=5aAd5kxEgpNv9jP73xNPFCtdSg1gvVxKex9LF+vIYYw=;
	h=From:Date:Subject:To:Cc:From;
	b=JNEWAJLPlUzVtGxCp29wNfCDRhMalaQWu+6aecq00TgXZ+l9MhyLECCR2qrjWiqVa
	 DT+Q0B3YDmcLwbR8QBqnoE0ZJ4NAvHasZcfwt0x5/ugfaem+JflYOacAxfcbKQU7LQ
	 /65g5Nb3YksnKV+IHn638Ayf8ue6tronYP8KLjHw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 15 Mar 2025 14:20:14 +0100
Subject: [PATCH v2] kbuild: make all file references relative to source
 root
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250315-kbuild-prefix-map-v2-1-00e1983b2a23@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAI1+1WcC/22NwQ6CMBBEf4Xs2TWlgKAn/8NwqGWxG7WQLqCG8
 O9WjDePbybzZgahwCRwSGYINLFw5yPoTQLWGX8h5CYyaKULlaUar+eRbw32gVp+4t30WBgqd1a
 rPZUG4u5brc5THdmxDF14rRdT+kl/tuyPbUpRYVZZMlWeV7Zojw9iEbFudFtPA9TLsrwBhu/yR
 bcAAAA=
X-Change-ID: 20250312-kbuild-prefix-map-5ae76c209e7a
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Ben Hutchings <ben@decadent.org.uk>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742044815; l=4983;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5aAd5kxEgpNv9jP73xNPFCtdSg1gvVxKex9LF+vIYYw=;
 b=poDRjIhb/G41s9ptBZZyGL7Io6BzUYTI2xwX2fLZnHNV98APDZltVsyMujL4CeZ8EJU1iSOvX
 Nb9yOhd8/OuB9OPa5cbcmpvkynmaPdMCqqVeeIyaLcQSBUSdPf0geKK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-fmacro-prefix-map only affects __FILE__ and __BASE_FILE__.
Other references, for example in debug information, are not affected.
This makes handling of file references in the compiler outputs harder to
use and creates problems for reproducible builds.

Switch to -ffile-prefix map which affects all references.

Also drop the documentation section advising manual specification of
-fdebug-prefix-map for reproducible builds, as it is not necessary
anymore.

Suggested-by: Ben Hutchings <ben@decadent.org.uk>
Link: https://lore.kernel.org/lkml/c49cc967294f9a3a4a34f69b6a8727a6d3959ed8.camel@decadent.org.uk/
Acked-by: Borislav Petkov (AMD) <bp@alien8.de> # arch/x86/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Pick up Ack from Borislav
- Merge all changes into single patch
- Also drop link to KCFLAGS from docs
- Link to v1: https://lore.kernel.org/r/20250313-kbuild-prefix-map-v1-0-38cea8448c5f@weissschuh.net
---
 Documentation/kbuild/reproducible-builds.rst | 17 -----------------
 Makefile                                     |  2 +-
 arch/x86/boot/Makefile                       |  2 +-
 arch/x86/boot/compressed/Makefile            |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
index f2dcc39044e66ddd165646e0b51ccb0209aca7dd..a7762486c93fcd3eba08b836bed622a41e829e41 100644
--- a/Documentation/kbuild/reproducible-builds.rst
+++ b/Documentation/kbuild/reproducible-builds.rst
@@ -46,21 +46,6 @@ The kernel embeds the building user and host names in
 `KBUILD_BUILD_USER and KBUILD_BUILD_HOST`_ variables.  If you are
 building from a git commit, you could use its committer address.
 
-Absolute filenames
-------------------
-
-When the kernel is built out-of-tree, debug information may include
-absolute filenames for the source files.  This must be overridden by
-including the ``-fdebug-prefix-map`` option in the `KCFLAGS`_ variable.
-
-Depending on the compiler used, the ``__FILE__`` macro may also expand
-to an absolute filename in an out-of-tree build.  Kbuild automatically
-uses the ``-fmacro-prefix-map`` option to prevent this, if it is
-supported.
-
-The Reproducible Builds web site has more information about these
-`prefix-map options`_.
-
 Generated files in source packages
 ----------------------------------
 
@@ -131,7 +116,5 @@ See ``scripts/setlocalversion`` for details.
 
 .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
 .. _KBUILD_BUILD_USER and KBUILD_BUILD_HOST: kbuild.html#kbuild-build-user-kbuild-build-host
-.. _KCFLAGS: kbuild.html#kcflags
-.. _prefix-map options: https://reproducible-builds.org/docs/build-path/
 .. _Reproducible Builds project: https://reproducible-builds.org/
 .. _SOURCE_DATE_EPOCH: https://reproducible-builds.org/docs/source-date-epoch/
diff --git a/Makefile b/Makefile
index 5c333682dc9142b1aacfe454a5c77f5923554b7d..4f920187cee658ae4d1b807fca365f6994274828 100644
--- a/Makefile
+++ b/Makefile
@@ -1067,7 +1067,7 @@ endif
 
 # change __FILE__ to the relative path to the source directory
 ifdef building_out_of_srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-ffile-prefix-map=$(srcroot)/=)
 KBUILD_RUSTFLAGS += --remap-path-prefix=$(srcroot)/=
 endif
 
diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index 9cc0ff6e9067d574488a35573eff4d0f8449e398..f500f82864aae80deb74faa3df9a8b6333d6c4ca 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -54,7 +54,7 @@ targets += cpustr.h
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
-KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS	+= $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index 5edee7a9786c67e13c295473751b82387bcbd67e..ad324978b2e5b1b6f8be82647769c99db8257ac7 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -38,7 +38,7 @@ KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += -Wno-pointer-sign
-KBUILD_CFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CFLAGS += $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.

---
base-commit: a57512d6cd88eba04cdc1fb83832c00d248bd0d1
change-id: 20250312-kbuild-prefix-map-5ae76c209e7a

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


