Return-Path: <linux-kbuild+bounces-6286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AA2A6C874
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 10:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED6FA189FD89
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Mar 2025 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADD91BD01F;
	Sat, 22 Mar 2025 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="X66se4FO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C504194080;
	Sat, 22 Mar 2025 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742634225; cv=none; b=EwepRj9qkbhkzRtqEX3hI0hS5Qi2pSSapj329fHFjJvGe/TnjNXxLN06Umtyoqb46U+xkzP+tIZYzBqaVVyP/4tg0IULFBBONzXY+AHE9tkrYgYu+RHz5cnxBr8XgYxT4sJKkJClflGfjUpNCGmBnbBwpjR8W4bW1KL6s6StBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742634225; c=relaxed/simple;
	bh=bsI0XC6yZ+fRlOjsKHtAGIs+6HvxTp+zi1L92GfUnqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=i9AG3k4BjeuEkgo4J4YPCvMKP2B0M3gzhM+2thPMyq+sdOFDBrgITlFJXeOvC1fh8b1jSkJozZDFGeSA7HrfrOYO2v7i/ZlToAXtdbuGZTsgobDUBHlPRzEZbtXcQvCn0ygXVS9BtVgXu5E4TBi0pcEgDMzK3xMypWN5XaV1vxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=X66se4FO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1742634220;
	bh=bsI0XC6yZ+fRlOjsKHtAGIs+6HvxTp+zi1L92GfUnqI=;
	h=From:Date:Subject:To:Cc:From;
	b=X66se4FOCejD2rdihIPGxopfsyuDMsN54qRWIG3j7AHqOASsAQDYphld84dRhLSXg
	 1bTLzgOgeEMpF8n62kbj1C0ZUsYJZ8Fbmgx64QqF3cqHRKl6vDijSvqIGCQHFHz/lb
	 9e0ItTAm2Tw/04Wn1FzwX9rk8S3XF6zGue7NPOsE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 22 Mar 2025 10:03:16 +0100
Subject: [PATCH] kbuild, x86: drop unnecessary prefix map configuration
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250322-asm-prefix-map-v1-1-ffe92c80b4d4@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIANN83mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMj3cTiXN2CotS0zArd3MQCXQMjizQDE5MUC/MkYyWgJogU2MDo2Np
 aAKDXc69gAAAA
X-Change-ID: 20250322-asm-prefix-map-028f044d87b3
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, Ben Hutchings <ben@decadent.org.uk>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742634220; l=2534;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=bsI0XC6yZ+fRlOjsKHtAGIs+6HvxTp+zi1L92GfUnqI=;
 b=IiogChuEhKvaTzh4V/KlrrNYiPBXGVn8RWfZ6c89EPOjeX3ffrEiX1uUXM+/Y/RHiOonsakgd
 RipZyr+vel1CP/7kBbQuaIALro317n/NPHwwUfHiKeGidB7zf/MmBak
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The toplevel Makefile already provides -ffile-prefix-map as part of
KBUILD_CPPFLAGS. In contrast to the KBUILD_CFLAGS and KBUILD_AFLAGS
variables, KBUILD_CPPFLAGS is not redefined in the architecture specific
Makefiles. Therefore the toplevel KBUILD_CPPFLAGS do apply just fine, to
both C and ASM sources.

The custom configuration was necessary when it was added in
commit 9e2276fa6eb3 ("arch/x86/boot: Use prefix map to avoid embedded paths")
but has since become unnecessary in
commit a716bd743210 ("kbuild: use -fmacro-prefix-map for .S sources")

Drop the now unnecessary custom prefix map configuration.

Link: https://lore.kernel.org/lkml/d250e864d6d81cc02e2599f710872f72d58a3c29.camel@decadent.org.uk/
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Intended to go through the kbuild tree.

It would have been nice to have this before
"kbuild: make all file references relative to source root",
but I guess it's really not worth a rebase and the complexity.
---
 arch/x86/boot/Makefile            | 1 -
 arch/x86/boot/compressed/Makefile | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
index f500f82864aae80deb74faa3df9a8b6333d6c4ca..75e7a76deee1541ffed05953eb0574f14fe193a9 100644
--- a/arch/x86/boot/Makefile
+++ b/arch/x86/boot/Makefile
@@ -54,7 +54,6 @@ targets += cpustr.h
 
 KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
 KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
-KBUILD_CFLAGS	+= $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS	+= $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
 
diff --git a/arch/x86/boot/compressed/Makefile b/arch/x86/boot/compressed/Makefile
index ad324978b2e5b1b6f8be82647769c99db8257ac7..4d3f714ad8717db2235a707269d26565a9671187 100644
--- a/arch/x86/boot/compressed/Makefile
+++ b/arch/x86/boot/compressed/Makefile
@@ -38,7 +38,6 @@ KBUILD_CFLAGS += -fno-stack-protector
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += -Wno-pointer-sign
-KBUILD_CFLAGS += $(call cc-option,-ffile-prefix-map=$(srctree)/=)
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
 KBUILD_CFLAGS += -D__DISABLE_EXPORTS
 # Disable relocation relaxation in case the link is not PIE.

---
base-commit: 1a78774bb35068bb143d2299da3f8a0b87807cdb
change-id: 20250322-asm-prefix-map-028f044d87b3

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


