Return-Path: <linux-kbuild+bounces-12985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEZlOxVp+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12985-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:29 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B24BB15F
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5FBC8305C8C8
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92EA938237E;
	Mon,  4 May 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NC+00Yvn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YjAiuNtu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B4737F8A7;
	Mon,  4 May 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887222; cv=none; b=bgc4b3xK7qLRoakmMqTpGuyE24ip6I4huXef4THXNZpdGjCLJkeEfyLlBqa7fS/U7tzMGQ8NJcho3N/YUHfVq2UFRUXHPEZ4LNg3+RzzVctLU9SDvD0DSi731r5ggttLvIkVZRzVQcR2xB3ugpfwTNXUMGkc6Aj9WvJBCPsHtr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887222; c=relaxed/simple;
	bh=X2NN2sojneity7IMySlccOZ5k53NgDydZFJmaouxqdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0RZT4drm+YX2uU+ICnlmIEH1eoHNbPR5V9EnvgCF0+7oYHkwU09gap42EnqqWpLRfAdjahaJMQ10cd1ie18poixzK85mqJ5MQcLsyspa+PJzKsz6T5ITPay5IgAMcP6HGu6UFJmycTzVjms8IaBBsh2520dXg9Mjya5eO3fKcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NC+00Yvn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YjAiuNtu; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ft5tjVlJemnVxdKrQOWR07GWUrenfDbo6YKiLlRQjYg=;
	b=NC+00YvnEebssrgHehzlz8bX7d+X1xp33wCP3F4/hOYN8p9eHYVnXdW9p4aP28p0zVsJt9
	KeKHZP/hTwB7uHL5RRZhma/aQBpVrdIOJh1JTyz/NAxYkUX/wdjJdZYhI8xbOZJHmUdQa6
	NOimy2qPsefv3aMws9u7uUwsUXTWN0MagCH2NggrHygMmRa+2AdYfvPKVvUA88IDNb1aQy
	Z4UF9aa9F9JaaLJtPRjudkod2k2pqxoZu9KITzPUWycNwzWDJTGBV70ah0fZbcD1owZru8
	jzHvynCd/7HagURExUsddqcXdodk2pS0roZJu0rMOXpXX/Qce4KiKQ4KwZvlQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ft5tjVlJemnVxdKrQOWR07GWUrenfDbo6YKiLlRQjYg=;
	b=YjAiuNtuewrsNsYXNQ5rzmlr51bXN+FcRHyyKsBkqi8MmLFxxEc/o7iKpcKU16CH1ILplT
	wmFhEZ+1YxCEjKCA==
Date: Mon, 04 May 2026 11:33:25 +0200
Subject: [PATCH v6 09/11] kunit: uapi: Add example for UAPI tests
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-9-712d3d526d97@linutronix.de>
References: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
In-Reply-To: <20260504-kunit-kselftests-v6-0-712d3d526d97@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Nicolas Schier <nicolas.schier@linux.dev>, 
 Kees Cook <kees@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Christoph Hellwig <hch@lst.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
 linux-doc@vger.kernel.org, workflows@vger.kernel.org, linux-mm@kvack.org, 
 linux-fsdevel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Christophe Leroy <chleroy@kernel.org>, Nicolas Schier <nsc@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=3560;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=X2NN2sojneity7IMySlccOZ5k53NgDydZFJmaouxqdA=;
 b=d+F6BfdlzPGVKpRtvndevjxQUwuA2kdiKjOKE+xclSjrFppN4PZlwNeh8L5VMEutjdqDzgLmY
 LaFBlIeV+GPAc2hVsx4yFUiV9oZx8OMoKI//hL7q4tmqR6l1KjH9PQg
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 550B24BB15F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12985-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Extend the example to show how to run a userspace executable.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: David Gow <davidgow@google.com>
---
 MAINTAINERS                    |  1 +
 lib/kunit/Makefile             | 10 ++++++++++
 lib/kunit/kunit-example-test.c | 15 +++++++++++++++
 lib/kunit/kunit-example-uapi.c | 22 ++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e29ca56f7334..b7358d89df70 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14399,6 +14399,7 @@ KUNIT UAPI TESTING FRAMEWORK (in addition to KERNEL UNIT TESTING FRAMEWORK)
 M:	Thomas Weißschuh <thomas.weissschuh@linutronix.de>
 S:	Maintained
 F:	include/kunit/uapi.h
+F:	lib/kunit/kunit-example-uapi.c
 F:	lib/kunit/kunit-uapi.c
 
 KVM PARAVIRT (KVM/paravirt)
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 6059621a2d32..2434470e9985 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -1,3 +1,5 @@
+include $(srctree)/init/Makefile.nolibc
+
 obj-$(CONFIG_KUNIT) +=			kunit.o
 
 kunit-objs +=				test.o \
@@ -31,3 +33,11 @@ obj-$(CONFIG_KUNIT_TEST) +=		assert_test.o
 endif
 
 obj-$(CONFIG_KUNIT_EXAMPLE_TEST) +=	kunit-example-test.o
+
+userprogs +=				kunit-example-uapi
+kunit-example-uapi-userccflags :=	-static $(NOLIBC_USERCFLAGS)
+
+ifdef CONFIG_KUNIT_UAPI
+CFLAGS_kunit-example-test.o :=		-Wa,-I$(obj)
+$(obj)/kunit-example-test.o: $(obj)/kunit-example-uapi
+endif
diff --git a/lib/kunit/kunit-example-test.c b/lib/kunit/kunit-example-test.c
index 0bae7b7ca0b0..febabc995405 100644
--- a/lib/kunit/kunit-example-test.c
+++ b/lib/kunit/kunit-example-test.c
@@ -8,6 +8,7 @@
 
 #include <kunit/test.h>
 #include <kunit/static_stub.h>
+#include <kunit/uapi.h>
 
 /*
  * This is the most fundamental element of KUnit, the test case. A test case
@@ -489,6 +490,19 @@ static void example_params_test_with_init_dynamic_arr(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, param_val - param_val, 0);
 }
 
+/*
+ * This test shows the usage of UAPI tests.
+ */
+static void example_uapi_test(struct kunit *test)
+{
+	KUNIT_UAPI_EMBED_BLOB(kunit_example_uapi, "kunit-example-uapi");
+
+	if (IS_ENABLED(CONFIG_KUNIT_UAPI))
+		kunit_uapi_run_kselftest(test, &kunit_example_uapi);
+	else
+		kunit_skip(test, "CONFIG_KUNIT_UAPI is not enabled");
+}
+
 /*
  * Here we make a list of all the test cases we want to add to the test suite
  * below.
@@ -514,6 +528,7 @@ static struct kunit_case example_test_cases[] = {
 				   kunit_array_gen_params, example_param_init_dynamic_arr,
 				   example_param_exit_dynamic_arr),
 	KUNIT_CASE_SLOW(example_slow_test),
+	KUNIT_CASE(example_uapi_test),
 	{}
 };
 
diff --git a/lib/kunit/kunit-example-uapi.c b/lib/kunit/kunit-example-uapi.c
new file mode 100644
index 000000000000..5875b0d680d4
--- /dev/null
+++ b/lib/kunit/kunit-example-uapi.c
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit Userspace example test.
+ *
+ * Copyright (C) 2026, Linutronix GmbH.
+ * Author: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ *
+ * This is *userspace* code.
+ */
+
+#include "../../tools/testing/selftests/kselftest.h"
+
+int main(void)
+{
+	ksft_print_header();
+	ksft_set_plan(4);
+	ksft_test_result_pass("userspace test 1\n");
+	ksft_test_result_pass("userspace test 2\n");
+	ksft_test_result_skip("userspace test 3: some reason\n");
+	ksft_test_result_pass("userspace test 4\n");
+	ksft_finished();
+}

-- 
2.53.0


