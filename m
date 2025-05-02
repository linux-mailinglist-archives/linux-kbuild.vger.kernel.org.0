Return-Path: <linux-kbuild+bounces-6876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E2AA74DA
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FBAE464017
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A90F2561D6;
	Fri,  2 May 2025 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CTTHQzKJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F32623A562;
	Fri,  2 May 2025 14:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746195909; cv=none; b=hRCzvs7pka8R1NZ8XxPsQc1i6JdIUKEz2hHSsKjcyEzRhPnLH8MnAkooRGL7499y+I6tR+mza7h/y16/xt7UbVd9EZ9Lf3dywGint7rL9vZkAA1z/ZzJKd+o82+qBcamZHROUfsSmGf34k/OsxRErL/6NfkLsEh2PqNYvXEaLlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746195909; c=relaxed/simple;
	bh=32/4+qmrGM/xnIFFxa4eHYZW/9RkizeOtr7qMjIWSHk=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=rUGmziZ9Lclw9XQJMqaHkCNdCBG9KPQuL/F/04kI+JYfwqGuEChlru+xPeqRd8nY+rfHStg4CiNFrSncWepqJ+FaZ7sI4l1WPcakWHos11jm8KGNgfavdQ2GlYA8/8RXRWU28Mv6Pbgx8kR4cZn7TcNHPXOTpiM8NQoh3HvjTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CTTHQzKJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=WUExRaEQQnsPbw/eE+wP4SXVeUzVT4DYtJ6VYKm6RJk=; b=CTTHQzKJDVw6WuXZTThKx+OeIO
	eYjbrEQz2JDcu8DFhxMoFGger3VPyg7yimLDQFdspR1RcJD3T0/0NVHn+Jyh5+wMzW0ZqzyLXE4/3
	yr2/y1fQ5ilUCDjD8cCZu9V1J293H7ZXpAWOscv3Mn9i7nQvM8SDwknMlaf86Dg7xU1H7nabjBR24
	uy/A7J1wpxMD1bNkTIW9WLGkvPEIAGY0RBC46h9PQZP863sduzYxqydV2O4qCR7F55LSK3KHFrnWy
	Pi3pCJBrHUmFsEpAkihVG27mAOYsgzPpW2e+lCkPBvGymms6D36yWoD+fEuyt8VWSKc+GTs+s6OUp
	S/OR9ewg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uArK2-0000000EzDq-0NeD;
	Fri, 02 May 2025 14:25:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 037DD3001AE; Fri,  2 May 2025 16:24:59 +0200 (CEST)
Message-ID: <20250502141844.369838967@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 02 May 2025 16:12:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org,
 hpa@zytor.com,
 petr.pavlu@suse.com,
 samitolvanen@google.com,
 da.gomez@samsung.com,
 masahiroy@kernel.org,
 nathan@kernel.org,
 nicolas@fjasle.eu,
 linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org,
 linux-kbuild@vger.kernel.org,
 hch@infradead.org,
 gregkh@linuxfoundation.org,
 roypat@amazon.co.uk,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH v3 5/5] module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper
References: <20250502141204.500293812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Helper macro to more easily limit the export of a symbol to a given
list of modules.

Eg:

  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm");

will limit the use of said function to kvm.ko, any other module trying
to use this symbol will refure to load (and get modpost build
failures).

Requested-by: Masahiro Yamada <masahiroy@kernel.org>
Requested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 Documentation/core-api/symbol-namespaces.rst |   22 ++++++++++++++++++++++
 include/linux/export.h                       |   12 ++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

--- a/Documentation/core-api/symbol-namespaces.rst
+++ b/Documentation/core-api/symbol-namespaces.rst
@@ -28,6 +28,9 @@ kernel. As of today, modules that make u
 are required to import the namespace. Otherwise the kernel will, depending on
 its configuration, reject loading the module or warn about a missing import.
 
+Additionally, it is possible to put symbols into a module namespace, strictly
+limiting which modules are allowed to use these symbols.
+
 2. How to define Symbol Namespaces
 ==================================
 
@@ -83,6 +86,22 @@ A second option to define the default na
 within the corresponding compilation unit before the #include for
 <linux/export.h>. Typically it's placed before the first #include statement.
 
+2.3 Using the EXPORT_SYMBOL_GPL_FOR_MODULES() macro
+===================================================
+
+Symbols exported using this macro are put into a module namespace. This
+namespace cannot be imported.
+
+The macro takes a comma separated list of module names, allowing only those
+modules to access this symbol. Simple tail-globs are supported.
+
+For example:
+
+  EXPORT_SYMBOL_GPL_FOR_MODULES(preempt_notifier_inc, "kvm,kvm-*")
+
+will limit usage of this symbol to modules whoes name matches the given
+patterns.
+
 3. How to use Symbols exported in Namespaces
 ============================================
 
@@ -154,3 +173,6 @@ Again, ``make nsdeps`` will eventually a
 You can also run nsdeps for external module builds. A typical usage is::
 
 	$ make -C <path_to_kernel_src> M=$PWD nsdeps
+
+Note: it will happily generate an import statement for the module namespace;
+which will not work and generates build and runtime failures.
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -24,11 +24,17 @@
 	.long sym
 #endif
 
-#define ___EXPORT_SYMBOL(sym, license, ns)		\
+/*
+ * LLVM integrated assembler cam merge adjacent string literals (like
+ * C and GNU-as) passed to '.ascii', but not to '.asciz' and chokes on:
+ *
+ *   .asciz "MODULE_" "kvm" ;
+ */
+#define ___EXPORT_SYMBOL(sym, license, ns...)		\
 	.section ".export_symbol","a"		ASM_NL	\
 	__export_symbol_##sym:			ASM_NL	\
 		.asciz license			ASM_NL	\
-		.asciz ns			ASM_NL	\
+		.ascii ns "\0"			ASM_NL	\
 		__EXPORT_SYMBOL_REF(sym)	ASM_NL	\
 	.previous
 
@@ -85,4 +91,6 @@
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
+#define EXPORT_SYMBOL_GPL_FOR_MODULES(sym, mods) __EXPORT_SYMBOL(sym, "GPL", "module:" mods)
+
 #endif /* _LINUX_EXPORT_H */



