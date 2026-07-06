Return-Path: <linux-kbuild+bounces-13943-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /VpFBSnBS2riZgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13943-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 16:52:25 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0E712365
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 16:52:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oS+K4EsF;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13943-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13943-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 527433088DF5
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jul 2026 14:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F3D3DDB06;
	Mon,  6 Jul 2026 14:29:44 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1677938238A;
	Mon,  6 Jul 2026 14:29:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348184; cv=none; b=OHPEdZTlT7wDt1uLEgxYreoZ466zznZy9zqG5vIMsSi4FqgYVQKmFRjwbLKzyZ1FcJHFGnXhh9b+e4W3KV8oeI1GF2PgCVtIJCoWeAMrwWeSnm5Ykii/aPw/L2LgADe508XxyT3GLtovqdf24rk7qUL2xqYuvxeVO59cx5KA9kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348184; c=relaxed/simple;
	bh=BSJWkYWiEK8Xqz7xF+k2+bXshtYQdOg7qN90gPKEpPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UfTvo4IjxHhuxk5YYey9OK5lblmGG8i64ngNLLiuTRbucyeamYZ/HP3qXAsMUjxpShhRwcNg3e05oDX+Ng307u+jEZU6lajpyP8TJQHvyDmdDJv/7dzx5bXo/xAGFwl+sXy4DjRtuVosVct0vMIvVK97vTlIAX5EJtxsjAtVsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oS+K4EsF; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F21D1F00AC4;
	Mon,  6 Jul 2026 14:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348181;
	bh=m2uyofUK2iN+DupTwgC5XUpbnXqrfdQtHlSxWf3Elcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oS+K4EsFXIqvyIfA53H26sliabr/dNgRi5SiBdLnDKPYHh9mu4VzA+SUpPc0a5MAu
	 XolicZccn1LJYAV3m4R4y6UYg3KiUI08wA9jfGmdfcBI950Kvs8aU+K6Ev7L9B/84e
	 29Ctmh/I2wsgW1Fhm4W9ALi6wAHHC5wnfEVCUoNt+ifg/Ofi0cf2KYKzX3T1c6d7yJ
	 cCRoOcgIrTq0iANkudpyEg6/bQimTsUAGDQSCi89V1e/uzssuqjSV4fMAhE2uJbw+n
	 ejEo8GiOM8RMo+KoEldYcc5SE21cQYh+JAEq7+wc2VJVh2glpI/7Nj6foJXP0lRclV
	 2VwUPoSD4qwLA==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 4/4] kallsyms: add KUnit tests for lineinfo feature
Date: Mon,  6 Jul 2026 10:29:09 -0400
Message-ID: <20260706142914.2398993-5-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706142914.2398993-1-sashal@kernel.org>
References: <20260706142914.2398993-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:masahiroy@kernel.org,m:mcgrof@kernel.org,m:torvalds@linux-foundation.org,m:richard@nod.at,m:jgross@suse.com,m:geert@linux-m68k.org,m:James.Bottomley@HansenPartnership.com,m:sashal@kernel.org,m:corbet@lwn.net,m:nathan@kernel.org,m:nsc@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:gregkh@linuxfoundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:kees@kernel.org,m:peterz@infradead.org,m:linux@leemhuis.info,m:vbabka@kernel.org,m:deller@gmx.de,m:rdunlap@infradead.org,m:laurent.pinchart@ideasonboard.com,m:wangruikang@iscas.ac.cn,m:thunder.leizhen@huawei.com,m:samitolvanen@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13943-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,huawei.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 99B0E712365

Add a KUnit test module (CONFIG_LINEINFO_KUNIT_TEST) that verifies the
kallsyms lineinfo feature produces correct source file:line annotations
in stack traces.

Export sprint_backtrace() and sprint_backtrace_build_id() as GPL symbols
so the test module can exercise the backtrace APIs.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/kallsyms.c          |   2 +
 lib/Kconfig.debug          |  10 +
 lib/tests/Makefile         |   3 +
 lib/tests/lineinfo_kunit.c | 855 +++++++++++++++++++++++++++++++++++++
 4 files changed, 870 insertions(+)
 create mode 100644 lib/tests/lineinfo_kunit.c

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1f58b4123a8ae7..6ac2786cdcbcbd 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -633,6 +633,7 @@ int sprint_backtrace(char *buffer, unsigned long address)
 {
 	return __sprint_symbol(buffer, address, -1, 1, 0, 1);
 }
+EXPORT_SYMBOL_GPL(sprint_backtrace);
 
 /**
  * sprint_backtrace_build_id - Look up a backtrace symbol and return it in a text buffer
@@ -653,6 +654,7 @@ int sprint_backtrace_build_id(char *buffer, unsigned long address)
 {
 	return __sprint_symbol(buffer, address, -1, 1, 1, 1);
 }
+EXPORT_SYMBOL_GPL(sprint_backtrace_build_id);
 
 /* To avoid using get_symbol_offset for every symbol, we carry prefix along. */
 struct kallsym_iter {
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 1244dcac2294ad..257b5ca442f327 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3092,6 +3092,16 @@ config LONGEST_SYM_KUNIT_TEST
 
 	  If unsure, say N.
 
+config LINEINFO_KUNIT_TEST
+	tristate "KUnit tests for kallsyms lineinfo" if !KUNIT_ALL_TESTS
+	depends on KUNIT && KALLSYMS_LINEINFO
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the kallsyms source line info feature.
+	  Verifies that stack traces include correct (file.c:line) annotations.
+
+	  If unsure, say N.
+
 config HW_BREAKPOINT_KUNIT_TEST
 	bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
 	depends on HAVE_HW_BREAKPOINT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index 4ead57602eac46..877416f5f70a3e 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -37,6 +37,9 @@ obj-$(CONFIG_LIVEUPDATE_TEST) += liveupdate.o
 CFLAGS_longest_symbol_kunit.o += $(call cc-disable-warning, missing-prototypes)
 obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
 
+CFLAGS_lineinfo_kunit.o += $(call cc-option,-fno-inline-functions-called-once)
+obj-$(CONFIG_LINEINFO_KUNIT_TEST) += lineinfo_kunit.o
+
 obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
diff --git a/lib/tests/lineinfo_kunit.c b/lib/tests/lineinfo_kunit.c
new file mode 100644
index 00000000000000..285d798cb6a3c4
--- /dev/null
+++ b/lib/tests/lineinfo_kunit.c
@@ -0,0 +1,855 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for kallsyms lineinfo (CONFIG_KALLSYMS_LINEINFO).
+ *
+ * Copyright (c) 2026 Sasha Levin <sashal@kernel.org>
+ *
+ * Verifies that sprint_symbol() and related APIs append correct
+ * " (file.c:NNN)" annotations to kernel symbol lookups.
+ *
+ * Build with: CONFIG_LINEINFO_KUNIT_TEST=m (or =y)
+ * Run with:   ./tools/testing/kunit/kunit.py run lineinfo
+ */
+
+#include <kunit/test.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/smp.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+#include <linux/mod_lineinfo.h>
+
+/* --------------- helpers --------------- */
+
+static char *alloc_sym_buf(struct kunit *test)
+{
+	return kunit_kzalloc(test, KSYM_SYMBOL_LEN, GFP_KERNEL);
+}
+
+/*
+ * Format a symbol with lineinfo annotation.  Lineinfo is appended only
+ * via the sprint_backtrace*() entry points (kernel/kallsyms.c only adds
+ * the "(file:line)" suffix in stack-trace context — sprint_symbol() is
+ * used by %ps and many existing format strings tack literal "()" after
+ * %ps, where the annotation would render as "foo (file:line)()").
+ *
+ * sprint_backtrace() subtracts 1 from the address to handle tail-call
+ * return-address corrections; pass @addr + 1 to recover the original.
+ */
+static int sprint_with_lineinfo(char *buf, unsigned long addr)
+{
+	return sprint_backtrace(buf, addr + 1);
+}
+
+/*
+ * Return true if @buf contains a lineinfo annotation matching
+ * the pattern " (<path>:<digits>)".
+ *
+ * The path may be a full path like "lib/tests/lineinfo_kunit.c" or
+ * a shortened form from module lineinfo (e.g., just a directory name).
+ */
+static bool has_lineinfo(const char *buf)
+{
+	const char *p, *colon, *end;
+
+	p = strstr(buf, " (");
+	if (!p)
+		return false;
+	p += 2; /* skip " (" */
+
+	colon = strchr(p, ':');
+	if (!colon || colon == p)
+		return false;
+
+	/* After colon: one or more digits then ')' */
+	end = colon + 1;
+	if (*end < '0' || *end > '9')
+		return false;
+	while (*end >= '0' && *end <= '9')
+		end++;
+	return *end == ')';
+}
+
+/*
+ * Extract line number from a lineinfo annotation.
+ * Returns 0 if not found.
+ */
+static unsigned int extract_line(const char *buf)
+{
+	const char *p, *colon;
+	unsigned int line = 0;
+
+	p = strstr(buf, " (");
+	if (!p)
+		return 0;
+
+	colon = strchr(p + 2, ':');
+	if (!colon)
+		return 0;
+
+	colon++;
+	while (*colon >= '0' && *colon <= '9') {
+		line = line * 10 + (*colon - '0');
+		colon++;
+	}
+	return line;
+}
+
+/*
+ * Check if the lineinfo annotation contains the given filename substring.
+ */
+static bool lineinfo_contains_file(const char *buf, const char *name)
+{
+	const char *p, *colon;
+
+	p = strstr(buf, " (");
+	if (!p)
+		return false;
+
+	colon = strchr(p + 2, ':');
+	if (!colon)
+		return false;
+
+	/* Search for @name between '(' and ':' */
+	return strnstr(p + 1, name, colon - p - 1) != NULL;
+}
+
+/* --------------- target functions --------------- */
+
+static noinline int lineinfo_target_normal(void)
+{
+	barrier();
+	return 42;
+}
+
+static noinline int lineinfo_target_short(void)
+{
+	barrier();
+	return 1;
+}
+
+static noinline int lineinfo_target_with_arg(int x)
+{
+	barrier();
+	return x + 1;
+}
+
+static noinline int lineinfo_target_many_lines(void)
+{
+	int a = 0;
+
+	barrier();
+	a += 1;
+	a += 2;
+	a += 3;
+	a += 4;
+	a += 5;
+	a += 6;
+	a += 7;
+	a += 8;
+	a += 9;
+	a += 10;
+	barrier();
+	return a;
+}
+
+static __always_inline int lineinfo_inline_helper(void)
+{
+	return 99;
+}
+
+static noinline int lineinfo_inline_caller(void)
+{
+	barrier();
+	return lineinfo_inline_helper();
+}
+
+/* 10-deep call chain */
+static noinline int lineinfo_chain_10(void) { barrier(); return 10; }
+static noinline int lineinfo_chain_9(void)  { barrier(); return lineinfo_chain_10(); }
+static noinline int lineinfo_chain_8(void)  { barrier(); return lineinfo_chain_9(); }
+static noinline int lineinfo_chain_7(void)  { barrier(); return lineinfo_chain_8(); }
+static noinline int lineinfo_chain_6(void)  { barrier(); return lineinfo_chain_7(); }
+static noinline int lineinfo_chain_5(void)  { barrier(); return lineinfo_chain_6(); }
+static noinline int lineinfo_chain_4(void)  { barrier(); return lineinfo_chain_5(); }
+static noinline int lineinfo_chain_3(void)  { barrier(); return lineinfo_chain_4(); }
+static noinline int lineinfo_chain_2(void)  { barrier(); return lineinfo_chain_3(); }
+static noinline int lineinfo_chain_1(void)  { barrier(); return lineinfo_chain_2(); }
+
+/* --------------- Group A: Basic lineinfo presence --------------- */
+
+static void test_normal_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      lineinfo_contains_file(buf, "lineinfo_kunit.c"),
+			      "Wrong file in: %s", buf);
+}
+
+static void test_static_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_short;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in: %s", buf);
+}
+
+static void test_noinline_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_with_arg;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in: %s", buf);
+}
+
+static void test_inline_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_inline_caller;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo for inline caller in: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      lineinfo_contains_file(buf, "lineinfo_kunit.c"),
+			      "Wrong file in: %s", buf);
+}
+
+static void test_short_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_short;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo for short function in: %s", buf);
+}
+
+static void test_many_lines_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_many_lines;
+	unsigned int line;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in: %s", buf);
+	line = extract_line(buf);
+	KUNIT_EXPECT_GT_MSG(test, line, (unsigned int)0,
+			    "Line number should be > 0 in: %s", buf);
+}
+
+/* --------------- Group B: Deep call chain --------------- */
+
+typedef int (*chain_fn_t)(void);
+
+static void test_deep_call_chain(struct kunit *test)
+{
+	static const chain_fn_t chain_fns[] = {
+		lineinfo_chain_1,  lineinfo_chain_2,
+		lineinfo_chain_3,  lineinfo_chain_4,
+		lineinfo_chain_5,  lineinfo_chain_6,
+		lineinfo_chain_7,  lineinfo_chain_8,
+		lineinfo_chain_9,  lineinfo_chain_10,
+	};
+	char *buf = alloc_sym_buf(test);
+	int i, found = 0;
+
+	/* Call chain to prevent dead-code elimination */
+	KUNIT_ASSERT_EQ(test, lineinfo_chain_1(), 10);
+
+	for (i = 0; i < ARRAY_SIZE(chain_fns); i++) {
+		unsigned long addr = (unsigned long)chain_fns[i];
+
+		sprint_with_lineinfo(buf, addr);
+		if (has_lineinfo(buf))
+			found++;
+	}
+
+	/*
+	 * Not every tiny function gets DWARF line info (compiler may
+	 * omit it for very small stubs), but at least some should.
+	 */
+	KUNIT_EXPECT_GT_MSG(test, found, 0,
+			    "None of the 10 chain functions had lineinfo");
+}
+
+/* --------------- Group C: sprint_symbol API variants --------------- */
+
+static void test_sprint_symbol_format(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	sprint_symbol(buf, addr);
+
+	/* Should contain +0x and /0x for offset/size */
+	KUNIT_EXPECT_NOT_NULL_MSG(test, strstr(buf, "+0x"),
+				  "Missing offset in: %s", buf);
+	KUNIT_EXPECT_NOT_NULL_MSG(test, strstr(buf, "/0x"),
+				  "Missing size in: %s", buf);
+	/*
+	 * sprint_symbol() backs %ps, which existing format strings combine
+	 * with literal "()" to indicate function calls; the lineinfo suffix
+	 * is intentionally omitted there to avoid "foo (file:line)()".
+	 */
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo in sprint_symbol output: %s",
+			       buf);
+}
+
+static void test_sprint_backtrace(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	/* sprint_backtrace subtracts 1 internally to handle tail calls */
+	sprint_backtrace(buf, addr + 1);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in backtrace: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      lineinfo_contains_file(buf, "lineinfo_kunit.c"),
+			      "Wrong file in backtrace: %s", buf);
+}
+
+static void test_sprint_backtrace_build_id(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	sprint_backtrace_build_id(buf, addr + 1);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in backtrace_build_id: %s", buf);
+}
+
+static void test_sprint_symbol_no_offset(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	sprint_symbol_no_offset(buf, addr);
+	/* No "+0x" in output */
+	KUNIT_EXPECT_NULL_MSG(test, strstr(buf, "+0x"),
+			      "Unexpected offset in no_offset: %s", buf);
+	/* sprint_symbol_no_offset is a sprint_symbol() variant; lineinfo is
+	 * intentionally only appended in sprint_backtrace*() context.
+	 */
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo in no_offset: %s", buf);
+}
+
+/* --------------- Group D: printk format specifiers --------------- */
+
+static void test_pS_format(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	void *addr = lineinfo_target_normal;
+
+	snprintf(buf, KSYM_SYMBOL_LEN, "%pS", addr);
+	/*
+	 * %pS uses sprint_symbol(), which intentionally omits the lineinfo
+	 * suffix (see kernel/kallsyms.c::__sprint_symbol).  Lineinfo is only
+	 * added via the sprint_backtrace*() entry points, which back %pBb.
+	 */
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo in %%pS: %s", buf);
+}
+
+static void test_pBb_format(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	/*
+	 * %pBb uses sprint_backtrace_build_id which subtracts 1 from the
+	 * address, so pass addr+1 to resolve back to the function.
+	 */
+	void *addr = (void *)((unsigned long)lineinfo_target_normal + 1);
+
+	snprintf(buf, KSYM_SYMBOL_LEN, "%pBb", addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo in %%pBb: %s", buf);
+}
+
+static void test_pSR_format(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	void *addr = lineinfo_target_normal;
+
+	snprintf(buf, KSYM_SYMBOL_LEN, "%pSR", addr);
+	/* %pSR is a sprint_symbol() variant; same rationale as %pS. */
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo in %%pSR: %s", buf);
+}
+
+/* --------------- Group E: Address edge cases --------------- */
+
+static void test_symbol_start_addr(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	/*
+	 * sprint_backtrace() subtracts 1 from the input and reports offset
+	 * relative to the (decremented) address, so an exact "+0x0/" can't
+	 * be expected here.  Verify the symbol resolves and carries lineinfo.
+	 */
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      strnstr(buf, "lineinfo_target_normal",
+				      KSYM_SYMBOL_LEN) != NULL,
+			      "Didn't resolve to expected function: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo at function start: %s", buf);
+}
+
+static void test_symbol_nonzero_offset(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	/*
+	 * sprint_backtrace subtracts 1 internally.
+	 * Passing addr+2 resolves to addr+1 which is inside the function
+	 * at a non-zero offset.
+	 */
+	sprint_backtrace(buf, addr + 2);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      strnstr(buf, "lineinfo_target_normal",
+				      KSYM_SYMBOL_LEN) != NULL,
+			      "Didn't resolve to expected function: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo at non-zero offset: %s", buf);
+}
+
+static void test_unknown_address(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+
+	sprint_symbol(buf, 1UL);
+	/* Should be "0x1" with no lineinfo */
+	KUNIT_EXPECT_NOT_NULL_MSG(test, strstr(buf, "0x1"),
+				  "Expected hex address for bogus addr: %s", buf);
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo for bogus addr: %s", buf);
+}
+
+static void test_kernel_function_lineinfo(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)sprint_symbol;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo for sprint_symbol: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      lineinfo_contains_file(buf, "kallsyms.c"),
+			      "Expected kallsyms.c in: %s", buf);
+}
+
+static void test_assembly_no_lineinfo(struct kunit *test)
+{
+#if IS_BUILTIN(CONFIG_LINEINFO_KUNIT_TEST)
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)_text;
+
+	sprint_with_lineinfo(buf, addr);
+	/*
+	 * _text is typically an asm entry point with no DWARF line info.
+	 * If it has lineinfo, it's a C-based entry — skip in that case.
+	 */
+	if (has_lineinfo(buf))
+		kunit_skip(test, "_text has lineinfo (C entry?): %s", buf);
+
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo for asm symbol: %s", buf);
+#else
+	kunit_skip(test, "_text not accessible from modules");
+#endif
+}
+
+/* --------------- Group F: Module path --------------- */
+
+static void test_module_function_lineinfo(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	if (!IS_MODULE(CONFIG_LINEINFO_KUNIT_TEST)) {
+		kunit_skip(test, "Test only meaningful when built as module");
+		return;
+	}
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_EXPECT_NOT_NULL_MSG(test,
+				  strstr(buf, "[lineinfo_kunit"),
+				  "Missing module name in: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test, has_lineinfo(buf),
+			      "No lineinfo for module function: %s", buf);
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      lineinfo_contains_file(buf, "lineinfo_kunit.c"),
+			      "Wrong file for module function: %s", buf);
+}
+
+/* --------------- Group G: Stress --------------- */
+
+struct lineinfo_stress_data {
+	unsigned long addr;
+	atomic_t failures;
+};
+
+static void lineinfo_stress_fn(void *info)
+{
+	struct lineinfo_stress_data *data = info;
+	char buf[KSYM_SYMBOL_LEN];
+	int i;
+
+	for (i = 0; i < 100; i++) {
+		sprint_with_lineinfo(buf, data->addr);
+		if (!has_lineinfo(buf))
+			atomic_inc(&data->failures);
+	}
+}
+
+static void test_concurrent_sprint_symbol(struct kunit *test)
+{
+	struct lineinfo_stress_data data;
+
+	data.addr = (unsigned long)lineinfo_target_normal;
+	atomic_set(&data.failures, 0);
+
+	on_each_cpu(lineinfo_stress_fn, &data, 1);
+
+	KUNIT_EXPECT_EQ_MSG(test, atomic_read(&data.failures), 0,
+			    "Concurrent lineinfo failures detected");
+}
+
+static void test_rapid_sprint_symbol(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+	int i, failures = 0;
+
+	for (i = 0; i < 1000; i++) {
+		sprint_with_lineinfo(buf, addr);
+		if (!has_lineinfo(buf))
+			failures++;
+	}
+
+	KUNIT_EXPECT_EQ_MSG(test, failures, 0,
+			    "Rapid sprint_symbol failures: %d/1000", failures);
+}
+
+/* --------------- Group H: Safety and plausibility --------------- */
+
+static void test_line_number_plausible(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+	unsigned int line;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_ASSERT_TRUE(test, has_lineinfo(buf));
+
+	line = extract_line(buf);
+	KUNIT_EXPECT_GT_MSG(test, line, (unsigned int)0,
+			    "Line number should be > 0");
+	KUNIT_EXPECT_LT_MSG(test, line, (unsigned int)10000,
+			    "Line number %u implausibly large for this file",
+			    line);
+}
+
+static void test_buffer_no_overflow(struct kunit *test)
+{
+	const size_t canary_size = 16;
+	char *buf;
+	int i;
+
+	buf = kunit_kzalloc(test, KSYM_SYMBOL_LEN + canary_size, GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, buf);
+
+	/* Fill canary area past KSYM_SYMBOL_LEN with 0xAA */
+	memset(buf + KSYM_SYMBOL_LEN, 0xAA, canary_size);
+
+	sprint_with_lineinfo(buf, (unsigned long)lineinfo_target_normal);
+
+	/* Verify canary bytes are untouched */
+	for (i = 0; i < canary_size; i++) {
+		KUNIT_EXPECT_EQ_MSG(test,
+				    (unsigned char)buf[KSYM_SYMBOL_LEN + i],
+				    (unsigned char)0xAA,
+				    "Buffer overflow at offset %d past KSYM_SYMBOL_LEN",
+				    i);
+	}
+}
+
+static void test_dump_stack_no_crash(struct kunit *test)
+{
+	/* Just verify dump_stack() completes without panic */
+	dump_stack();
+	KUNIT_SUCCEED(test);
+}
+
+static void test_sprint_symbol_build_id(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+
+	sprint_symbol_build_id(buf, addr);
+	/* Lineinfo is appended only via sprint_backtrace*(); the symbol
+	 * variants intentionally omit it to avoid clashing with format
+	 * strings that already wrap %ps in literal "()".
+	 */
+	KUNIT_EXPECT_FALSE_MSG(test, has_lineinfo(buf),
+			       "Unexpected lineinfo in sprint_symbol_build_id: %s",
+			       buf);
+}
+
+static void test_sleb128_edge_cases(struct kunit *test)
+{
+	u32 pos;
+	int32_t result;
+
+	/* Value 0: single byte 0x00 */
+	{
+		static const u8 data[] = { 0x00 };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)0);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value -1: single byte 0x7F */
+	{
+		static const u8 data[] = { 0x7f };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)-1);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value 1: single byte 0x01 */
+	{
+		static const u8 data[] = { 0x01 };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)1);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value -64: single byte 0x40 */
+	{
+		static const u8 data[] = { 0x40 };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)-64);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value 63: single byte 0x3F */
+	{
+		static const u8 data[] = { 0x3f };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)63);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value -128: two bytes 0x80 0x7F */
+	{
+		static const u8 data[] = { 0x80, 0x7f };
+
+		pos = 0;
+		result = lineinfo_read_sleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (int32_t)-128);
+		KUNIT_EXPECT_EQ(test, pos, (u32)2);
+	}
+}
+
+static void test_uleb128_edge_cases(struct kunit *test)
+{
+	u32 pos, result;
+
+	/* Value 0: single byte 0x00 */
+	{
+		static const u8 data[] = { 0x00 };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (u32)0);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value 127: single byte 0x7F */
+	{
+		static const u8 data[] = { 0x7F };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (u32)127);
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+
+	/* Value 128: two bytes 0x80 0x01 */
+	{
+		static const u8 data[] = { 0x80, 0x01 };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (u32)128);
+		KUNIT_EXPECT_EQ(test, pos, (u32)2);
+	}
+
+	/* Max u32 0xFFFFFFFF: 5 bytes */
+	{
+		static const u8 data[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0x0F };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, sizeof(data));
+		KUNIT_EXPECT_EQ(test, result, (u32)0xFFFFFFFF);
+		KUNIT_EXPECT_EQ(test, pos, (u32)5);
+	}
+
+	/* Truncated input: pos >= end returns 0 */
+	{
+		static const u8 data[] = { 0x80 };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, 0);
+		KUNIT_EXPECT_EQ_MSG(test, result, (u32)0,
+				    "Expected 0 for empty input");
+	}
+
+	/* Truncated mid-varint: continuation byte but end reached */
+	{
+		static const u8 data[] = { 0x80 };
+
+		pos = 0;
+		result = lineinfo_read_uleb128(data, &pos, 1);
+		KUNIT_EXPECT_EQ_MSG(test, result, (u32)0,
+				    "Expected 0 for truncated varint");
+		KUNIT_EXPECT_EQ(test, pos, (u32)1);
+	}
+}
+
+static void test_line_number_accuracy(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_normal;
+	unsigned int line;
+
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_ASSERT_TRUE(test, has_lineinfo(buf));
+
+	line = extract_line(buf);
+
+	/*
+	 * lineinfo_target_normal is defined around line 103-107.
+	 * Allow wide range: KASAN instrumentation and module lineinfo
+	 * address mapping can shift the reported line significantly.
+	 */
+	KUNIT_EXPECT_GE_MSG(test, line, (unsigned int)50,
+			    "Line %u too low for lineinfo_target_normal", line);
+	KUNIT_EXPECT_LE_MSG(test, line, (unsigned int)300,
+			    "Line %u too high for lineinfo_target_normal", line);
+}
+
+static void test_many_lines_mid_function(struct kunit *test)
+{
+	char *buf = alloc_sym_buf(test);
+	unsigned long addr = (unsigned long)lineinfo_target_many_lines;
+	unsigned int line;
+	unsigned long mid_addr;
+
+	/* Get function size from sprint_with_lineinfo output */
+	sprint_with_lineinfo(buf, addr);
+	KUNIT_ASSERT_TRUE(test, has_lineinfo(buf));
+
+	/* Try an address 8 bytes into the function (past prologue) */
+	mid_addr = addr + 8;
+	sprint_with_lineinfo(buf, mid_addr);
+
+	/*
+	 * Should still resolve to lineinfo_target_many_lines.
+	 * Lineinfo should be present with a plausible line number.
+	 */
+	KUNIT_EXPECT_TRUE_MSG(test,
+			      strnstr(buf, "lineinfo_target_many_lines",
+				      KSYM_SYMBOL_LEN) != NULL,
+			      "Mid-function addr resolved to wrong symbol: %s",
+			      buf);
+	if (has_lineinfo(buf)) {
+		line = extract_line(buf);
+		KUNIT_EXPECT_GE_MSG(test, line, (unsigned int)50,
+				    "Line %u too low for mid-function", line);
+		KUNIT_EXPECT_LE_MSG(test, line, (unsigned int)700,
+				    "Line %u too high for mid-function", line);
+	}
+}
+
+/* --------------- Suite registration --------------- */
+
+static struct kunit_case lineinfo_test_cases[] = {
+	/* Group A: Basic lineinfo presence */
+	KUNIT_CASE(test_normal_function),
+	KUNIT_CASE(test_static_function),
+	KUNIT_CASE(test_noinline_function),
+	KUNIT_CASE(test_inline_function),
+	KUNIT_CASE(test_short_function),
+	KUNIT_CASE(test_many_lines_function),
+	/* Group B: Deep call chain */
+	KUNIT_CASE(test_deep_call_chain),
+	/* Group C: sprint_symbol API variants */
+	KUNIT_CASE(test_sprint_symbol_format),
+	KUNIT_CASE(test_sprint_backtrace),
+	KUNIT_CASE(test_sprint_backtrace_build_id),
+	KUNIT_CASE(test_sprint_symbol_no_offset),
+	/* Group D: printk format specifiers */
+	KUNIT_CASE(test_pS_format),
+	KUNIT_CASE(test_pBb_format),
+	KUNIT_CASE(test_pSR_format),
+	/* Group E: Address edge cases */
+	KUNIT_CASE(test_symbol_start_addr),
+	KUNIT_CASE(test_symbol_nonzero_offset),
+	KUNIT_CASE(test_unknown_address),
+	KUNIT_CASE(test_kernel_function_lineinfo),
+	KUNIT_CASE(test_assembly_no_lineinfo),
+	/* Group F: Module path */
+	KUNIT_CASE(test_module_function_lineinfo),
+	/* Group G: Stress */
+	KUNIT_CASE_SLOW(test_concurrent_sprint_symbol),
+	KUNIT_CASE_SLOW(test_rapid_sprint_symbol),
+	/* Group H: Safety and plausibility */
+	KUNIT_CASE(test_line_number_plausible),
+	KUNIT_CASE(test_buffer_no_overflow),
+	KUNIT_CASE(test_dump_stack_no_crash),
+	KUNIT_CASE(test_sprint_symbol_build_id),
+	/* Group I: Encoding/decoding and accuracy */
+	KUNIT_CASE(test_sleb128_edge_cases),
+	KUNIT_CASE(test_uleb128_edge_cases),
+	KUNIT_CASE(test_line_number_accuracy),
+	KUNIT_CASE(test_many_lines_mid_function),
+	{}
+};
+
+static struct kunit_suite lineinfo_test_suite = {
+	.name = "lineinfo",
+	.test_cases = lineinfo_test_cases,
+};
+kunit_test_suites(&lineinfo_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit tests for kallsyms lineinfo");
+MODULE_AUTHOR("Sasha Levin");
-- 
2.53.0


