Return-Path: <linux-kbuild+bounces-12415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QK5WBiD/y2kJNQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12415-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:06:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0C636DE29
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 19:06:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C2ABF313D174
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 16:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2E1426EC1;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9I9T/0E"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949BD425CEE;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975046; cv=none; b=By/hSEYB6VYz02j3v+XYzNuNHEvFlpFo+gWWZcEsHuglM89FLIJvCtpuAITxZPF2Ji0g0UdJZLvVlbhbSzMOFI+C5x+s33nzgKwN23WQ3+4RSZEK6sTVDKA97ELlLWZxYBiJwITNqgEsIXyfOuTwPXhYPMQP/J7jTToQEFajBFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975046; c=relaxed/simple;
	bh=8ICpeLoyfF2BIMXBU7MfdBMil+QYa1a2pfcUa1hQh+c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iKJ/wn3xL92dei7hodEkDRv91KsFkWBD8f/gtbu9bfsfqzqQXaJG8cg7dKv9EKbF4RYSVzSttqgJ414+tDR6N1TZyw2ELMJlLvjL40TGnDAh0bqQHC1RVFaU2WyOyzVXY42Lb/qxrXmtjnlA0vb7vSkNstT0evS0PGXtYm6jmcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9I9T/0E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512F7C2BCB1;
	Tue, 31 Mar 2026 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774975046;
	bh=8ICpeLoyfF2BIMXBU7MfdBMil+QYa1a2pfcUa1hQh+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o9I9T/0EVFqYtlh0EtKMYzkcoKp4fU7mtqknM9yHsHq3gJeOBQD8xYQSkTns6xxrw
	 GnPGvq1iti2AykrCx+ot7rXEpAPYD8Nl7zotOBjl9vNccYu+K/7r2tvK2H96bPrZ3e
	 UDyvEs0bQM4wVBFxhH59HfJQD4YlZ2MjPI0s0YXs2YmCqXTNOqAYXKLlo6HleWhVqq
	 aVJDM21YM3ihEA1mpjT1E5BVBCpyL07mSAjSHga2XJcivhelzHrF0mCLznCWzoqySZ
	 LaWVnE8s1LfQ2QkGYqpAqRZoInX/lrB7/JzxWlcxVzBuPULzCV7xhPa8JkH8FiGJbO
	 rQm4TnL0HXwPw==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	Justin Stitt <justinstitt@google.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Marco Elver <elver@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH 4/5] lkdtm/bugs: Add basic Overflow Behavior Types test
Date: Tue, 31 Mar 2026 09:37:22 -0700
Message-Id: <20260331163725.2765789-4-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331163716.work.696-kees@kernel.org>
References: <20260331163716.work.696-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10793; i=kees@kernel.org; h=from:subject; bh=8ICpeLoyfF2BIMXBU7MfdBMil+QYa1a2pfcUa1hQh+c=; b=owGbwMvMwCVmps19z/KJym7G02pJDJmnfzjVvF91Tmzp1mmz667KPNVp49U5pK3buvK+84c8J oPtD7ufdpSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzk7h1Ghkk/tZKWfDz+/6S3 9LUvv05kNkz7xqfz0eMTz9xbPwyLQ30Y/mcUf256m5izYz3rm8ApHLrvcr2fa055Elztsf4FV2R WCRcA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12415-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arndb.de:email]
X-Rspamd-Queue-Id: 2E0C636DE29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Exercise the end-to-end build and trap infrastructure in the kernel for
__ob_trap, __ob_wrap, and associated sanitizer ignore patterns (i.e. idiom
exclusions). Add a test for each of the basic overflow conditions under
CONFIG_OVERFLOW_BEHAVIOR_TYPES=y, as well as the corner cases associated
with promotion, casting, etc.

For example, executing this test with CONFIG_OVERFLOW_BEHAVIOR_TYPES_WARN=y
(instead of CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP=y), will show:

    $ echo OBT_ASSIGN_TRUNCATE_TO | cat >/sys/kernel/debug/provoke-crash/DIRECT
    $ dmesg
    ...
    lkdtm: Performing direct entry OBT_ASSIGN_TRUNCATE_TO
    UBSAN: implicit-conversion in ../drivers/misc/lkdtm/bugs.c:825:10
    cannot represent 'int' value 2147483647 during reference binding to 'u8t' (aka '__ob_trap u8'), truncated to 255

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <shuah@kernel.org>
Cc: <linux-kselftest@vger.kernel.org>
---
 drivers/misc/lkdtm/bugs.c               | 253 ++++++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  10 +
 2 files changed, 263 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index e0098f314570..f00c9099957e 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -817,6 +817,249 @@ static noinline void lkdtm_CORRUPT_PAC(void)
 #endif
 }
 
+static void lkdtm_OBT_ASSIGN_TRUNCATE_TO(void)
+{
+	volatile int big = INT_MAX;
+	volatile int wide_low_value = 5;
+	u8 __ob_trap narrow_low_value = 0;
+	s32 __ob_trap same = 0;
+	u8 __ob_trap small = 0;
+
+	pr_info("Performing same-width assignment to OBT\n");
+	same = big;
+
+	pr_info("Performing small-value assignment to OBT\n");
+	narrow_low_value = wide_low_value;
+
+	pr_info("Expecting trap on truncated assignment to OBT\n");
+	small = big;
+
+	pr_err("FAIL: survived overflowing truncated assignment to OBT: %d -> %u (ok: %d -> %u)\n",
+		same, small, wide_low_value, narrow_low_value);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_ASSIGN_TRUNCATE_FROM(void)
+{
+	volatile s32 __ob_trap big = INT_MAX;
+	volatile s32 __ob_trap wide_low_value = 5;
+	u8 narrow_low_value = 0;
+	s32 same = 0;
+	u8 small = 0;
+
+	pr_info("Performing same-width assignment from OBT\n");
+	same = big;
+
+	pr_info("Performing small-value assignment from OBT\n");
+	narrow_low_value = wide_low_value;
+
+	pr_info("Expecting trap on truncated assignment from OBT\n");
+	small = big;
+
+	pr_err("FAIL: survived overflowing truncated assignment from OBT: %d -> %u (ok: %d -> %u)\n",
+		same, small, wide_low_value, narrow_low_value);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_CAST_TRUNCATE(void)
+{
+	volatile u32 __ob_trap big = INT_MAX;
+	u32 trunc = 0;
+	u32 small = 0;
+
+	pr_info("Performing wrapping too-small cast\n");
+	trunc = (u16 __ob_wrap)big;
+
+	pr_info("Expecting trap on too-small cast\n");
+	small = (s16)big;
+
+	pr_err("FAIL: survived truncated casting: %u -> %u (ok: %u -> %u)\n",
+		big, small, big, trunc);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_CAST_SIGNED(void)
+{
+	volatile u32 __ob_trap big = UINT_MAX;
+	s32 neg = 0;
+	s32 small = 0;
+
+	pr_info("Performing explicit sign-changing cast\n");
+	neg = (s32 __ob_wrap)big;
+
+	pr_info("Expecting trap on unexpected sign-changing cast\n");
+	small = (s32)big;
+
+	pr_err("FAIL: survived lossy sign conversion: %u -> %d (forced: %u -> %d)\n",
+		big, small, big, neg);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_MUL(void)
+{
+	/* Promotion means no overflow checking can happen. */
+	volatile u8 __ob_trap a8 = 100;
+	volatile u8 __ob_trap b8 = 3;
+	unsigned int promoted;
+	/* 32-bit or larger, however, get checked. */
+	volatile u32 __ob_trap a = UINT_MAX - 1;
+	volatile u32 __ob_trap b = 2;
+	unsigned long long happy;
+	unsigned long long outcome;
+
+	/* Promotion means a * b happens as "int __ob_trap", so no trap. */
+	pr_info("Performing promoted overflowing unsigned multiplication\n");
+	promoted = a8 * b8;
+
+	pr_info("Performing non-overflowing unsigned multiplication\n");
+	happy = b * b;
+
+	pr_info("Expecting trap on overflowing unsigned multiplication\n");
+	outcome = a * b;
+
+	pr_err("FAIL: survived unsigned multiplication overflow: %u * %u -> %llu (ok: %u * %u -> %llu, %u)\n",
+		a, b, outcome, b, b, happy, promoted);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_MUL_SIGNED(void)
+{
+	/* Promotion means no overflow checking can happen. */
+	volatile s8 __ob_trap a8 = 100;
+	volatile s8 __ob_trap b8 = 3;
+	int promoted;
+	/* 32-bit or larger, however, get checked. */
+	volatile s32 __ob_trap a = INT_MAX - 1;
+	volatile s32 __ob_trap b = 2;
+	signed long long happy;
+	signed long long outcome;
+
+	/* Promotion means a8 * b8 happens as "int __ob_trap", so no trap. */
+	pr_info("Performing promoted overflowing signed multiplication\n");
+	promoted = a8 * b8;
+
+	pr_info("Performing non-overflowing signed multiplication\n");
+	happy = b * b;
+
+	pr_info("Expecting trap on overflowing signed multiplication\n");
+	outcome = a * b;
+
+	pr_err("FAIL: survived signed multiplication overflow: %d * %d -> %lld (ok: %d * %d -> %lld, %d)\n",
+		a, b, outcome, b, b, happy, promoted);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_ADD(void)
+{
+	/* Promotion means no overflow checking can happen. */
+	volatile u8 __ob_trap a8 = 250;
+	volatile u8 __ob_trap b8 = 30;
+	unsigned int promoted;
+	/* 32-bit or larger, however, get checked. */
+	volatile u32 __ob_trap a = UINT_MAX - 1;
+	volatile u32 __ob_trap b = 2;
+	unsigned long long happy;
+	unsigned long long outcome;
+
+	/* Promotion means a8 + b8 happens as "int __ob_trap", so no trap. */
+	pr_info("Performing promoted overflowing unsigned addition\n");
+	promoted = a8 + b8;
+
+	pr_info("Performing idiomatic unsigned overflow addition test\n");
+	if (a + b < a) {
+		/* Report status so test isn't elided by compiler. */
+		pr_info("ok: overflow contained by conditional\n");
+	}
+
+	pr_info("Performing non-overflowing unsigned addition\n");
+	happy = b + b;
+
+	pr_info("Expecting trap on overflowing unsigned addition\n");
+	outcome = a + b;
+
+	pr_err("FAIL: survived unsigned addition overflow: %u + %u -> %llu (ok: %u + %u -> %llu)\n",
+		a, b, outcome, b, b, happy);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_ADD_SIGNED(void)
+{
+	/* Promotion means no overflow checking can happen. */
+	volatile s8 __ob_trap a8 = 120;
+	volatile s8 __ob_trap b8 = 30;
+	int promoted;
+	/* 32-bit or larger, however, get checked. */
+	volatile s32 __ob_trap a = INT_MAX - 1;
+	volatile s32 __ob_trap b = 2;
+	signed long long happy;
+	signed long long outcome;
+
+	/* Promotion means a8 + b8 happens as "int __ob_trap", so no trap. */
+	pr_info("Performing promoted overflowing signed addition\n");
+	promoted = a8 + b8;
+
+	pr_info("Performing idiomatic signed overflow addition test\n");
+	if (a + b < a) {
+		/* Report status so test isn't elided by compiler. */
+		pr_info("ok: overflow contained by conditional\n");
+	}
+
+	pr_info("Performing non-overflowing signed addition\n");
+	happy = b + b;
+
+	pr_info("Expecting trap on overflowing signed addition\n");
+	outcome = a + b;
+
+	pr_err("FAIL: survived signed addition overflow: %u + %u -> %llu (ok: %u + %u -> %llu)\n",
+		a, b, outcome, b, b, happy);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_NEGATED_UNSIGNED(void)
+{
+	volatile unsigned long __ob_trap value = 256;
+	size_t outcome;
+
+	pr_info("Expecting trap on overflowing unsigned negation\n");
+	outcome = value & -value;
+
+	pr_err("FAIL: survived negated unsigned value: %lu -> %zu\n",
+		value, outcome);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
+static void lkdtm_OBT_POSTFIX_OPERATORS(void)
+{
+	volatile int target = 300;
+	volatile int flag = 0;
+	int i;
+	u8 __ob_wrap wrapper = 0; /* Explicitly wrapping. */
+	u8 __ob_trap counter = 0;
+
+	pr_info("Performing u8 __ob_wrap post-increment past 255\n");
+	for (i = 0; i < target; i++)
+		wrapper++;
+	if (wrapper != 44)
+		pr_err("FAIL: wrapped incorrecty: %u\n", wrapper);
+
+	pr_info("Performing idiomatic post-decrement zero test\n");
+	counter = target / 2;
+	while (counter--)
+		if (flag)
+			break;
+	if (counter != 255)
+		pr_err("FAIL: u8 __ob_trap post-decrement zero-test did not wrap: %u\n",
+			counter);
+
+	pr_info("Expecting trap on u8 __ob_trap post-increment past 255\n");
+	counter = 0;
+	for (i = 0; i < target; i++)
+		counter++;
+
+	pr_err("FAIL: survived overflowed post-increment: %u\n", counter);
+	pr_expected_config(CONFIG_OVERFLOW_BEHAVIOR_TYPES_TRAP);
+}
+
 static struct crashtype crashtypes[] = {
 	CRASHTYPE(PANIC),
 	CRASHTYPE(PANIC_STOP_IRQOFF),
@@ -850,6 +1093,16 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(UNSET_SMEP),
 	CRASHTYPE(DOUBLE_FAULT),
 	CRASHTYPE(CORRUPT_PAC),
+	CRASHTYPE(OBT_ASSIGN_TRUNCATE_TO),
+	CRASHTYPE(OBT_ASSIGN_TRUNCATE_FROM),
+	CRASHTYPE(OBT_CAST_TRUNCATE),
+	CRASHTYPE(OBT_CAST_SIGNED),
+	CRASHTYPE(OBT_MUL),
+	CRASHTYPE(OBT_MUL_SIGNED),
+	CRASHTYPE(OBT_ADD),
+	CRASHTYPE(OBT_ADD_SIGNED),
+	CRASHTYPE(OBT_NEGATED_UNSIGNED),
+	CRASHTYPE(OBT_POSTFIX_OPERATORS),
 };
 
 struct crashtype_category bugs_crashtypes = {
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index e62b85b591be..231299ba3959 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -87,3 +87,13 @@ FORTIFY_STR_MEMBER detected buffer overflow
 FORTIFY_MEM_OBJECT detected buffer overflow
 FORTIFY_MEM_MEMBER detected field-spanning write
 PPC_SLB_MULTIHIT Recovered
+OBT_ASSIGN_TRUNCATE_TO traps: UBSAN: integer truncation
+OBT_ASSIGN_TRUNCATE_FROM traps: UBSAN: integer truncation
+OBT_CAST_TRUNCATE traps: UBSAN: integer truncation
+OBT_CAST_SIGNED traps: UBSAN: integer truncation
+OBT_MUL traps: UBSAN: integer multiplication overflow
+OBT_MUL_SIGNED traps: UBSAN: integer multiplication overflow
+OBT_ADD traps: UBSAN: integer addition overflow
+OBT_ADD_SIGNED traps: UBSAN: integer addition overflow
+OBT_NEGATED_UNSIGNED traps: UBSAN: negation overflow
+OBT_POSTFIX_OPERATORS traps: UBSAN: integer truncation
-- 
2.34.1


