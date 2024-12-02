Return-Path: <linux-kbuild+bounces-4926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453B9E0695
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 16:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA368284B22
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2024 15:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3D8209F31;
	Mon,  2 Dec 2024 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sJnm9gen"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414F52040A7;
	Mon,  2 Dec 2024 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733152297; cv=none; b=lVVTWCVrsihHo1VP3X4L0TLRK0izVbN3V0UL8UkZfDUX8Jhr8CwNlRclm8ifh2j3k97Ad7P2VHT4z46645WaQMiK7rpDQcYPjsU8RSlMbRC/LAS/OzoQJpne3RXtgph7IX6fVm5Fc/O5o99ssW76iH3+zmiLOEQOHmviH62N0pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733152297; c=relaxed/simple;
	bh=XhHU543T1F3w14Rm03rZzs+C84JVQ8YZfAkynEfLBx8=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=Fum0A0ujlSPMDS0ve6ocgVZAgayFuKpizowsl93750mY1pYcAx942OA7WoF4pjq8wTNoCQGdR6Vamncz+vSjDo+1Ych5syKS961DUNBkJFrrGeevBz5FhsoshLgdqlSb59lwGFAmile1Pb1K0pmQudC22hxJRK8y4sygF1qcS3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sJnm9gen; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=6N0qDSelpM+yvXc7hsTj7XyqDv+BJKuq3m0opDDR0WI=; b=sJnm9genTuMS+qdJXmTcHhqpMk
	0QCvDJz71FSGYaavs78RRfugwdz/0jzKFEY7oHfIDpjOAmnyeRZIXOERbNlAD5hj/Wc1a3OzZq8fH
	vkFh8KpePxNfFP18TsMJm7KOj7MJ5g6u3LcGiZ2S8ftGl6tKNXki5jl6zE6Oaqh959E26K/frjOeN
	idRCOoiJvi/Y7cKLh/0Xu9VlCoFLkPZmHu8ImOrU/q/vLZO1EztapC4RMpyVrmWILtkvfQK6ZKp5L
	A59hr6aM07FaCMVpHG2CU1G0RodyIo2JKhD78kEKeJ4id9fENm4+4w4X66Sie7IliSE/VXCSTNMAa
	7GkwlEUA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tI859-00000008CQ5-3q67;
	Mon, 02 Dec 2024 15:11:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id D4AFF300ABE; Mon,  2 Dec 2024 16:11:27 +0100 (CET)
Message-ID: <20241202150810.713959190@infradead.org>
User-Agent: quilt/0.66
Date: Mon, 02 Dec 2024 15:59:53 +0100
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
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [PATCH -v2 7/7] module: Provide EXPORT_SYMBOL_GPL_FOR() helper
References: <20241202145946.108093528@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8


Requested-by: Masahiro Yamada <masahiroy@kernel.org>
Requested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/export.h |   26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -24,11 +24,23 @@
 	.long sym
 #endif
 
-#define ___EXPORT_SYMBOL(sym, license, ns)		\
+/*
+ * LLVM intregrated assembler refuses to merge adjacent string literals (like
+ * C and GNU-as) and chokes on:
+ *
+ *   .asciz "MODULE_" "kvm" ;
+ *
+ * As would be generated when using EXPORT_SYMBOL_GPL_FOR(foo, "kvm"), use
+ * varargs to assemble it like so:
+ *
+ *   .ascii "MODULE_", "kvm", "\0" ;
+ *
+ */
+#define ___EXPORT_SYMBOL(sym, license, ns...)		\
 	.section ".export_symbol","a"		ASM_NL	\
 	__export_symbol_##sym:			ASM_NL	\
 		.asciz license			ASM_NL	\
-		.asciz ns			ASM_NL	\
+		.ascii ns, "\0"			ASM_NL	\
 		__EXPORT_SYMBOL_REF(sym)	ASM_NL	\
 	.previous
 
@@ -39,20 +51,20 @@
  * be reused in other execution contexts such as the UEFI stub or the
  * decompressor.
  */
-#define __EXPORT_SYMBOL(sym, license, ns)
+#define __EXPORT_SYMBOL(sym, license, ns...)
 
 #elif defined(__GENKSYMS__)
 
-#define __EXPORT_SYMBOL(sym, license, ns)	__GENKSYMS_EXPORT_SYMBOL(sym)
+#define __EXPORT_SYMBOL(sym, license, ns...)	__GENKSYMS_EXPORT_SYMBOL(sym)
 
 #elif defined(__ASSEMBLY__)
 
-#define __EXPORT_SYMBOL(sym, license, ns) \
+#define __EXPORT_SYMBOL(sym, license, ns...) \
 	___EXPORT_SYMBOL(sym, license, ns)
 
 #else
 
-#define __EXPORT_SYMBOL(sym, license, ns)			\
+#define __EXPORT_SYMBOL(sym, license, ns...)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
@@ -70,4 +82,6 @@
 #define EXPORT_SYMBOL_NS(sym, ns)	__EXPORT_SYMBOL(sym, "", ns)
 #define EXPORT_SYMBOL_NS_GPL(sym, ns)	__EXPORT_SYMBOL(sym, "GPL", ns)
 
+#define EXPORT_SYMBOL_GPL_FOR(sym, mods) __EXPORT_SYMBOL(sym, "GPL", "MODULE_", mods)
+
 #endif /* _LINUX_EXPORT_H */



