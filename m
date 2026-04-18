Return-Path: <linux-kbuild+bounces-12823-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +CBBLbnO4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12823-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCB541F5C4
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D91563008D1A
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:22:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7952C175A9A;
	Sat, 18 Apr 2026 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="WwT4SgUL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4102BD11;
	Sat, 18 Apr 2026 00:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471730; cv=none; b=hmb9TYauMXsE1W6lF5VdxN+Xa0kqO4k0HSNTB+eD5xcpMFyehLpoFetE/tOHJG1Ro+AWlPXaBtB8UCkD+5s7LnWU/XVEAOS4ygvpqsNd3d7YEGvdlD8w8DqFNA5EtwersY2dCA3ZK7bEKuD/uSfBp0h+jHazJUbMxh6gYQpltsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471730; c=relaxed/simple;
	bh=npHHaUavQUu+5hbQZDK8LnOaSPX4ZFn/zd/Hv5lHONg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SeX1vXrOKFopjZfzP7klKDrKqQX6EqZAY7aRuc84NFiqx15wCH/SSERvuBeL72/cThEEYKvZLhMwPC+eg+Dh3PQcklKunXqx7nlLBKCWFTQuY7zkboAHrs2fF6AG5MnY14brH0M0shtACEaAYiFntPmzWAAAR69nrCG/SYlACkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=WwT4SgUL; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471728; x=1808007728;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TTkUALGYKvsk1b2Hk9SZtUE4HMTVW3bXK4jxNJAWPIM=;
  b=WwT4SgULRkYU9DNfw5/Z3NKL2MlRRmxbCm5aygwRqrG+h0iKuwgwZMrx
   R9/UE0nxEl21qW3IEYtR4aiLvKDgShTIeyhKJvRD7rO3XEwY0ItnLiVri
   YtX5EgBHm1TaxTmEdnUIjdns/1iilA2eRQyMPQYdD9EOf/sfIzgdwAASD
   9WFUUziNQRgzvliOIp9SM0Dju2EvnVAXHD5zdaA3sE56aah0D/DsWI1kZ
   YbxrEkkKmTzKK/cbjETGYJNIGQNNjbnlDCiLNBrC4HWKv7Hu8fDTGpUb/
   w6EDNoqrHZnGMCsTgnZeKt1fIlI1KIEEbuuncTXy9t1DOYLGuwADs+kKu
   A==;
X-CSE-ConnectionGUID: ykE7ZGJEQ9yzkVs1cOXsdw==
X-CSE-MsgGUID: dNQLCaalReCGZsHl+LAOGQ==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17612780"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:22:08 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.111:19247]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.2:2525] with esmtp (Farcaster)
 id c8645947-8802-4d35-a54e-02f2baa7e855; Sat, 18 Apr 2026 00:22:08 +0000 (UTC)
X-Farcaster-Flow-ID: c8645947-8802-4d35-a54e-02f2baa7e855
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:07 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:06 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 06/19] crypto: add pluggable interface for module symbols referenced by the main kernel
Date: Sat, 18 Apr 2026 00:20:14 +0000
Message-ID: <20260418002032.2877-7-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.66 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12823-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gen-fips140-fn-redirect.sh:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	SURBL_MULTI_FAIL(0.00)[link-vmlinux.sh:query timed out];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4CCB541F5C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The main kernel and modules interact through exported
symbols (EXPORT_SYMBOL). When built-in cryptographic
algorithms are moved into a standalone kernel module
(fips140.ko), the crypto functions and variables must be
exported from the module so the main kernel can use them.
However, the existing module symbol resolution is one-way:
it supports symbols defined in the main kernel and
referenced by modules, but not the reverse — symbols
defined in a module but referenced by the main kernel.
Since the linker requires all symbol addresses to be
resolved at link time, moving crypto symbols out of
vmlinux would break compilation.

To address this, introduce a pluggable interface that
places address placeholders at all crypto usage points in
the main kernel. These placeholders are initially set to
NULL during compilation to satisfy the linker. At runtime,
once fips140.ko is loaded, the placeholders are updated to
the correct addresses before their first use.

Two types of address placeholders are used. For function
symbols (the majority), a trampoline (naked function)
tail-jumps through a function pointer marked
__ro_after_init to prevent modification after kernel init.
This is implemented as DEFINE_CRYPTO_FN_REDIRECT(). For
variable symbols (a smaller number), a pointer of the
corresponding data type serves as the placeholder. This is
implemented as DECLARE_CRYPTO_VAR() for declarations and
DEFINE_CRYPTO_VAR_STUB() for definitions. These wrappers
are compiled differently for the main kernel and for the
crypto module source code — acting as the "outlet" and the
"plug" respectively — using the -DFIPS_MODULE compilation
flag.

To apply these placeholders to a crypto symbol, the main
kernel must be directed to use the placeholder instead of
the original address. Since all crypto users include the
corresponding header files, the headers are a natural place
to perform this redirection.

For exported variable symbols (a small number, ~10), the
declaration in the header file is replaced with the
DECLARE_CRYPTO_VAR() wrapper, and the placeholder
definition DEFINE_CRYPTO_VAR_STUB() is added to a
dedicated file fips140-var-redirect.c (applied in later
patches). The wrapper takes the Kconfig symbol as a
parameter so that when a crypto algorithm is already built
as a module, the original declaration remains unchanged.

For exported function symbols (the majority, ~hundreds),
the key design goal is that no kernel source tree
modification is needed at all. Instead of manually
modifying header files, the redirection is fully automated
during the build process. The exported symbol list is
extracted from fips140.o into .fips140.exported, then
gen-fips140-fn-redirect.sh auto-generates
DEFINE_CRYPTO_FN_REDIRECT() calls for each symbol.
link-vmlinux.sh adds --wrap=<sym> linker flags so all
references in vmlinux are redirected to __wrap_<sym>
trampolines. EXPORT_SYMBOL in the FIPS module emits
__crypto_fn_keys entries that map each
__fips140_fn_ptr_<sym> to the real function address. As a
result, no header files or call sites need to be touched
to redirect any crypto function.

At module load time, do_crypto_var() and do_crypto_fn() in
kernel/module/main.c walk the __crypto_var_keys and
__crypto_fn_keys sections respectively, writing the real
addresses into the placeholders.

The pluggable interface idea originates from Vegard Nossum
<vegard.nossum@oracle.com>. This implementation
additionally provides automated conversion of crypto
functions to pluggable redirects without massive kernel
source tree changes, avoids duplicate crypto code in the
main kernel, supports variable symbol redirection, does
not interfere with cryptos already configured as modules,
and adapts to arbitrary .config choices.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                                  | 31 +++++++-
 crypto/fips140/Makefile                   |  5 +-
 crypto/fips140/fips140-fn-redirect.c      | 10 +++
 crypto/fips140/gen-fips140-fn-redirect.sh | 28 +++++++
 include/asm-generic/vmlinux.lds.h         |  2 +
 include/crypto/fips140-fn-redirect.h      | 63 ++++++++++++++++
 include/crypto/fips140-redirect.h         | 92 +++++++++++++++++++++++
 include/linux/export.h                    | 22 ++++++
 kernel/module/main.c                      | 45 ++++++++++-
 scripts/link-vmlinux.sh                   | 12 +++
 10 files changed, 305 insertions(+), 5 deletions(-)
 create mode 100644 crypto/fips140/fips140-fn-redirect.c
 create mode 100755 crypto/fips140/gen-fips140-fn-redirect.sh
 create mode 100644 include/crypto/fips140-fn-redirect.h
 create mode 100644 include/crypto/fips140-redirect.h

diff --git a/Makefile b/Makefile
index 45218f2b7f51f..feacb5bd6235a 100644
--- a/Makefile
+++ b/Makefile
@@ -1302,11 +1302,38 @@ endif
 quiet_cmd_ar_vmlinux.a = AR      $@
       cmd_ar_vmlinux.a = \
 	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS) $(fips140-fn-redirect-obj); \
 	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+
+# Generate exported symbol list from fips140.o (no vmlinux.o dependency)
+quiet_cmd_gen_fips140_exported = 
+      cmd_gen_fips140_exported = $(NM) $< 2>/dev/null | \
+		sed -n 's/.*__export_symbol_//p' | sort | \
+		awk '{print "0x00000000\t" $$1 "\tcrypto/fips140/fips140\tEXPORT_SYMBOL_GPL\t"}' > $@
+
+crypto/fips140/.fips140.exported: crypto/fips140/fips140.o FORCE
+	$(call if_changed,gen_fips140_exported)
+
+# Generate fn-redirect header from exported symbol list
+quiet_cmd_gen_fips140_fn_redirect =  
+      cmd_gen_fips140_fn_redirect = $(CONFIG_SHELL) $(srctree)/crypto/fips140/gen-fips140-fn-redirect.sh \
+		crypto/fips140/.fips140.exported $@
+
+crypto/fips140/.fips140-fn-redirect.h: crypto/fips140/.fips140.exported
+	$(call cmd,gen_fips140_fn_redirect)
+
+crypto/fips140/fips140-fn-redirect.o: crypto/fips140/.fips140-fn-redirect.h $(srctree)/crypto/fips140/fips140-fn-redirect.c
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.build obj=crypto/fips140 $@
+
+fips140-fn-redirect-obj := crypto/fips140/fips140-fn-redirect.o
+
+targets += crypto/fips140/.fips140.exported crypto/fips140/.fips140-fn-redirect.h
+endif
+
 targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+vmlinux.a: $(KBUILD_VMLINUX_OBJS) $(fips140-fn-redirect-obj) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_vmlinux.a)
 
 PHONY += vmlinux_o
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index 3b4a74ccf41ec..6a3dcc224e828 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -2,4 +2,7 @@
 crypto-objs-y += \
 	fips140-module.o 
 
-clean-files:= .fips140.order .fips140.symvers
\ No newline at end of file
+CFLAGS_fips140-fn-redirect.o += -I$(obj)
+CFLAGS_fips140-module.o += -DFIPS140_CORE
+
+clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported
\ No newline at end of file
diff --git a/crypto/fips140/fips140-fn-redirect.c b/crypto/fips140/fips140-fn-redirect.c
new file mode 100644
index 0000000000000..c8f5d971736da
--- /dev/null
+++ b/crypto/fips140/fips140-fn-redirect.c
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/kernel.h>
+#include <crypto/fips140-fn-redirect.h>
+#include ".fips140-fn-redirect.h"
+
+void __fips140_fn_not_redirected(void)
+{
+	panic("FIPS140: redirected function called before fips140.ko loaded!\n");
+}
+ 
\ No newline at end of file
diff --git a/crypto/fips140/gen-fips140-fn-redirect.sh b/crypto/fips140/gen-fips140-fn-redirect.sh
new file mode 100755
index 0000000000000..9218f553c0155
--- /dev/null
+++ b/crypto/fips140/gen-fips140-fn-redirect.sh
@@ -0,0 +1,28 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# Generate DEFINE_CRYPTO_FN_REDIRECT() calls for all exported symbols
+#
+# Usage: gen-fips140-fn-redirect.sh <.fips140.exported> <output.h>
+
+EXPORTED="$1"
+OUTPUT="$2"
+
+if [ ! -f "$EXPORTED" ]; then
+	echo "/* exported symbol list not found, empty redirect list */" > "$OUTPUT"
+	exit 0
+fi
+
+TMPFILE="${OUTPUT}.tmp"
+
+{
+	echo "/* SPDX-License-Identifier: GPL-2.0 */"
+	echo "/* Auto-generated by gen-fips140-fn-redirect.sh — do not edit */"
+	echo ""
+	awk '{print "DEFINE_CRYPTO_FN_REDIRECT(" $2 ")"}' "$EXPORTED"
+} > "$TMPFILE"
+
+if [ -f "$OUTPUT" ] && cmp -s "$TMPFILE" "$OUTPUT"; then
+	rm -f "$TMPFILE"
+else
+	mv "$TMPFILE" "$OUTPUT"
+fi
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 60c8c22fd3e44..a209ffb962e68 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -717,6 +717,8 @@
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
 	*(.init.rodata .init.rodata.*)					\
+	BOUNDED_SECTION(__crypto_var_keys)				\
+	BOUNDED_SECTION(__crypto_fn_keys)				\
 	FTRACE_EVENTS()							\
 	TRACE_SYSCALLS()						\
 	KPROBE_BLACKLIST()						\
diff --git a/include/crypto/fips140-fn-redirect.h b/include/crypto/fips140-fn-redirect.h
new file mode 100644
index 0000000000000..b4d62c762a320
--- /dev/null
+++ b/include/crypto/fips140-fn-redirect.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _CRYPTO_FIPS140_FN_REDIRECT_H
+#define _CRYPTO_FIPS140_FN_REDIRECT_H
+
+/*
+ * Function redirect macro for --wrap symbols.
+ *
+ * Each __wrap_<sym> is a naked function that tail-jumps through
+ * __fips140_fn_ptr_<sym>. The pointer is populated by fips140.ko
+ * at module load time (during early init) via do_crypto_fn().
+ *
+ * Before population, points to __fips140_fn_not_redirected (panic).
+ *
+ * The function pointer is marked __ro_after_init so that it is
+ * writable during early init when fips140.ko loads, but becomes
+ * read-only after mark_rodata_ro() runs. This prevents any later
+ * modification of the redirect targets.
+ */
+
+#include <linux/linkage.h>
+#include <linux/export.h>
+#include <linux/cache.h>
+
+extern void __fips140_fn_not_redirected(void);
+
+#ifdef CONFIG_X86_64
+
+#define DEFINE_CRYPTO_FN_REDIRECT(sym)						\
+	void *__fips140_fn_ptr_##sym __ro_after_init = (void *)__fips140_fn_not_redirected; \
+	EXPORT_SYMBOL_GPL(__fips140_fn_ptr_##sym);				\
+	void __wrap_##sym(void);					\
+	__attribute__((naked)) void __wrap_##sym(void)			\
+	{								\
+		asm volatile(						\
+			"movq __fips140_fn_ptr_" #sym "(%%rip), %%rax\n\t"	\
+			"jmp __x86_indirect_thunk_rax\n\t"		\
+			::: "rax", "memory"				\
+		);							\
+		__builtin_unreachable();					\
+	}
+
+#elif defined(CONFIG_ARM64)
+
+#define DEFINE_CRYPTO_FN_REDIRECT(sym)						\
+	void *__fips140_fn_ptr_##sym __ro_after_init = (void *)__fips140_fn_not_redirected; \
+	EXPORT_SYMBOL_GPL(__fips140_fn_ptr_##sym);				\
+	void __wrap_##sym(void);					\
+	__attribute__((naked)) void __wrap_##sym(void)			\
+	{								\
+		asm volatile(						\
+			"adrp x16, __fips140_fn_ptr_" #sym "\n\t"		\
+			"ldr  x16, [x16, :lo12:__fips140_fn_ptr_" #sym "]\n\t" \
+			"br   x16\n\t"					\
+			::: "x16", "memory"				\
+		);							\
+		__builtin_unreachable();					\
+	}
+
+#else
+#error "FIPS140 function redirect trampolines not implemented for this architecture"
+#endif
+
+#endif /* _CRYPTO_FIPS140_FN_REDIRECT_H */
diff --git a/include/crypto/fips140-redirect.h b/include/crypto/fips140-redirect.h
new file mode 100644
index 0000000000000..6bdada618eaf9
--- /dev/null
+++ b/include/crypto/fips140-redirect.h
@@ -0,0 +1,92 @@
+#ifndef _CRYPTO_FIPS140_REDIRECT_H
+#define _CRYPTO_FIPS140_REDIRECT_H
+
+#define CRYPTO_VAR_NAME(name) __crypto_##name##_ptr
+
+#define __CAT(a,b) a##b
+#define _CAT(a,b)  __CAT(a,b)
+
+#define __IF_1(...) __VA_ARGS__
+#define __IF_0(...)
+#define __IFNOT_1(...)
+#define __IFNOT_0(...) __VA_ARGS__
+
+/* Emit __VA_ARGS__ only if cfg is built into vmlinux (=y) */
+#define IF_BUILTIN(cfg, ...)     _CAT(__IF_,    IS_BUILTIN(cfg))(__VA_ARGS__)
+/* Emit __VA_ARGS__ only if cfg is NOT built in (i.e., =m or unset) */
+#define IF_NOT_BUILTIN(cfg, ...) _CAT(__IFNOT_, IS_BUILTIN(cfg))(__VA_ARGS__)
+
+#if !defined(CONFIG_CRYPTO_FIPS140_EXTMOD)
+
+/*
+ * These are the definitions that get used when no standalone FIPS module
+ * is used: we simply forward everything to normal variable declaration.
+ */
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...) \
+	extern var_type name __VA_ARGS__;
+#else
+
+struct crypto_fn_key {
+	void **ptr;
+	void *func;
+};
+
+struct crypto_var_key {
+	void **ptr;
+	void *var;
+};
+
+#ifndef FIPS_MODULE
+
+/*
+ * These are the definitions that get used for vmlinux and in-tree
+ * kernel modules.
+ *
+ * In this case, all references to the kernel crypto API functions will
+ * be replaced by wrappers that perform a call using the kernel's static_call
+ * functionality.
+ */
+
+/*
+ *  - If cfg is built-in (=y): declare the address placeholder
+ *  - Else (cfg =m or unset): only declare the original <name>().
+ */
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...) \
+	IF_BUILTIN(cfg, \
+		extern void *CRYPTO_VAR_NAME(name); \
+	) \
+	IF_NOT_BUILTIN(cfg, \
+		extern var_type name __VA_ARGS__; \
+	)
+
+#define DEFINE_CRYPTO_VAR_STUB(name) \
+	void* CRYPTO_VAR_NAME(name) = NULL;\
+	EXPORT_SYMBOL(CRYPTO_VAR_NAME(name));
+	
+#else /* defined(FIPS_MODULE) */
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...)               \
+	IF_BUILTIN(cfg,                                             \
+		extern var_type name __VA_ARGS__;                   \
+		extern void *CRYPTO_VAR_NAME(name);                  \
+	)                                                            \
+	IF_NOT_BUILTIN(cfg,                                          \
+		extern var_type name __VA_ARGS__;                   \
+	)
+
+#define DEFINE_CRYPTO_VAR_STUB(name) \
+	static struct crypto_var_key __crypto_##name##_var_key \
+		__used \
+		__section("__crypto_var_keys") \
+		__aligned(__alignof__(struct crypto_var_key)) = \
+	{ \
+		.ptr = &CRYPTO_VAR_NAME(name), \
+		.var = (void*)&name, \
+	};
+
+#endif /* defined(FIPS_MODULE) */
+#endif /* defined(CONFIG_CRYPTO_FIPS140_EXTMOD) */
+
+#endif /* !_CRYPTO_FIPS140_REDIRECT_H */
diff --git a/include/linux/export.h b/include/linux/export.h
index a686fd0ba4065..106898db8f559 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -72,11 +72,33 @@
 #define __GENDWARFKSYMS_EXPORT(sym)
 #endif
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+struct _crypto_fn_key {
+	void **ptr;
+	void *func;
+};
+#define __CRYPTO_FN_KEY(sym)					\
+	extern void *__fips140_fn_ptr_##sym;			\
+	static struct _crypto_fn_key __##sym##_fn_key		\
+		__used						\
+		__section("__crypto_fn_keys")			\
+		__aligned(__alignof__(struct _crypto_fn_key)) = {	\
+		.ptr = (void **)&__fips140_fn_ptr_##sym,		\
+		.func = (void *)&sym,				\
+	};
+#define __EXPORT_SYMBOL(sym, license, ns)			\
+	extern typeof(sym) sym;					\
+	__ADDRESSABLE(sym)					\
+	__GENDWARFKSYMS_EXPORT(sym)				\
+	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)));	\
+	__CRYPTO_FN_KEY(sym)
+#else
 #define __EXPORT_SYMBOL(sym, license, ns)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
 	__GENDWARFKSYMS_EXPORT(sym)				\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
+#endif
 
 #endif
 
diff --git a/kernel/module/main.c b/kernel/module/main.c
index a8358088b010e..6152b9b39e6b1 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -7,6 +7,7 @@
 
 #define INCLUDE_VERMAGIC
 
+#include <crypto/fips140-redirect.h>
 #include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
@@ -3023,6 +3024,38 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	return module_finalize(info->hdr, info->sechdrs, mod);
 }
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+static void do_crypto_var(struct load_info *info)
+{
+	struct crypto_var_key *crypto_var_keys;
+	unsigned int num_crypto_var_keys;
+	unsigned int i;
+
+	crypto_var_keys = section_objs(info, "__crypto_var_keys",
+		sizeof(*crypto_var_keys), &num_crypto_var_keys);
+
+	for (i = 0; i < num_crypto_var_keys; ++i) {
+		struct crypto_var_key *var_key = &crypto_var_keys[i];
+		*(var_key->ptr) = var_key->var;
+	}
+}
+
+static void do_crypto_fn(struct load_info *info)
+{
+	struct crypto_fn_key *fn_keys;
+	unsigned int num_fn_keys;
+	unsigned int i;
+
+	fn_keys = section_objs(info, "__crypto_fn_keys",
+		sizeof(*fn_keys), &num_fn_keys);
+
+	for (i = 0; i < num_fn_keys; ++i) {
+		struct crypto_fn_key *fk = &fn_keys[i];
+		WRITE_ONCE(*(fk->ptr), fk->func);
+	}
+}
+#endif
+
 /* Call module constructors. */
 static void do_mod_ctors(struct module *mod)
 {
@@ -3077,7 +3110,7 @@ module_param(async_probe, bool, 0644);
  * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  * helper command 'lx-symbols'.
  */
-static noinline int do_init_module(struct module *mod, int flags)
+static noinline int do_init_module(struct load_info *info, struct module *mod, int flags)
 {
 	int ret = 0;
 	struct mod_initfree *freeinit;
@@ -3103,6 +3136,14 @@ static noinline int do_init_module(struct module *mod, int flags)
 	freeinit->init_data = mod->mem[MOD_INIT_DATA].base;
 	freeinit->init_rodata = mod->mem[MOD_INIT_RODATA].base;
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	if (flags & MODULE_INIT_CRYPTO_FROM_MEM)
+		{
+			do_crypto_var(info);
+			do_crypto_fn(info);
+		}
+#endif
+
 	do_mod_ctors(mod);
 	/* Start the module */
 	if (mod->init != NULL)
@@ -3570,7 +3611,7 @@ static int _load_module(struct load_info *info, const char __user *uargs,
 	/* Done! */
 	trace_module_load(mod);
 
-	return do_init_module(mod, flags);
+	return do_init_module(info, mod, flags);
 
  sysfs_cleanup:
 	mod_sysfs_teardown(mod);
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f99e196abeea4..ee83d54a7cd0f 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -91,6 +91,18 @@ vmlinux_link()
 
 	ldflags="${ldflags} ${wl}--script=${objtree}/${KBUILD_LDS}"
 
+	if is_enabled CONFIG_CRYPTO_FIPS140_EXTMOD; then
+		local fips_ko=crypto/fips140/fips140.ko
+		local fips_exported=crypto/fips140/.fips140.exported
+		if [ -f "${fips_ko}" ] && [ -f "${fips_exported}" ]; then
+			for sym in $(awk '{print $2}' "${fips_exported}" | while read s; do
+				${NM} "${fips_ko}" 2>/dev/null | awk -v s="$s" '$3 == s && $2 == "T" {print s; exit}'
+			done); do
+				ldflags="${ldflags} ${wl}--wrap=${sym}"
+			done
+		fi
+	fi
+
 	# The kallsyms linking does not need debug symbols included.
 	if [ -n "${strip_debug}" ] ; then
 		ldflags="${ldflags} ${wl}--strip-debug"
-- 
2.47.3


