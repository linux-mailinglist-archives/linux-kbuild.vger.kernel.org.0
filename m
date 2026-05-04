Return-Path: <linux-kbuild+bounces-12986-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iwzNICJp+Gl4uQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12986-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9C4BB17D
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3EC143060D7B
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25D638425D;
	Mon,  4 May 2026 09:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BqTtpk+C";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZanvYVfs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6228037D135;
	Mon,  4 May 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887223; cv=none; b=tb+d3bLBjF2jVzNJOkQPjV1X8Wfs8Kcw0djL7cpJ2IeeQt+JnQ8NGBMfzzuLFBdlCodh7stDe51eLd+oIZkCzvNNwc+k1Mdhcr8Tg5N34/XPsLaZJsLflBOiYzpFCmM4JwFsbgy3bXyhN64Po8dbx8xEzk/uAsDi4JwJZ7jUuls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887223; c=relaxed/simple;
	bh=TauxOYpi03qFPcnNm3AqoC889sKpf9SoQTyDHbRy9hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VTBduZgBvyQPeQEKPVLv/odn6e1LPk5SLHgem3w+hguTnflS3SNEQaSAgfZUh7QK5AqIQ7Tvjk8BKERPP/Rt6erJWpiyS/MRCBrawhHEiVdOsRLCGb2XXXymXbEQ+VuzsRbgv0C5GYo69+WSJAZl/GzaQtF0wr2wafzcsfnWYfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BqTtpk+C; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZanvYVfs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PrS0k2Drv80OdaJ1YmUo8BOgCdISFvzkHUaFnv4iGkM=;
	b=BqTtpk+CXBSv6WfgRGnKdP1smf/6qR/nWC5fL4wYSSvJxXy7s4NFkunXA3qfZLfKUsavGv
	+wWq9EV1hah3Ei3nPcAx79AIcSZ3TyR/mBlC1+p00FxtQ5KObA4ZCuFlDx85ejGxU7UuiJ
	hdLrvogkSvos2xghKe2i5Zg0/+3dTwMhgb/xDUIQfGz/hiBploTjsyScRo9K3Lp063ksFZ
	KzgVsVr3Wz1txl6BZ4AYTQWPMD8nC9S9mrHhWkoN7NIsQukE0LAQCDjOiPaHKUWEQNa4HQ
	+4ImbazmNQDpitSLHA2xSNSI6H6qGMn2BzEBX84vIbkUnsWP6iIGtvp6ILTFkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PrS0k2Drv80OdaJ1YmUo8BOgCdISFvzkHUaFnv4iGkM=;
	b=ZanvYVfsjTNqFNMSVnatHHJiQ1Hha7pnJ5tAY/2b8uIVYGIg3BEt/sK+UwR+ADsManbVrj
	jvpfybI/ZMvglgCw==
Date: Mon, 04 May 2026 11:33:27 +0200
Subject: [PATCH v6 11/11] kunit: uapi: Validate usability of /proc
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-11-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=4066;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=TauxOYpi03qFPcnNm3AqoC889sKpf9SoQTyDHbRy9hg=;
 b=1hWzT6507OnOzELkr3kP6C8GS+SfvKLQdLpAiBvyOpYn0JryvJmarJBk+xXRskvu55bxKdheG
 G3cv2zqewfuCaw+z7LMh9TYx3Tv2oeaAUW9Qr91SEgKS00S4V/4Fr0G
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 26A9C4BB17D
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
	TAGGED_FROM(0.00)[bounces-12986-lists,linux-kbuild=lfdr.de];
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

Show that the selftests are executed from a fairly "normal"
userspace context.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS                 |  1 +
 lib/kunit/Makefile          |  9 ++++++++
 lib/kunit/kunit-test-uapi.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 lib/kunit/kunit-test.c      | 24 ++++++++++++++++++++-
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4e8cf9fa7aa9..693aafe4d3f9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14400,6 +14400,7 @@ M:	Thomas Weißschuh <thomas.weissschuh@linutronix.de>
 S:	Maintained
 F:	include/kunit/uapi.h
 F:	lib/kunit/kunit-example-uapi.c
+F:	lib/kunit/kunit-test-uapi.c
 F:	lib/kunit/kunit-uapi.c
 F:	lib/kunit/uapi-preinit.c
 
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 05991d69aa70..1a4af6b66524 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -29,6 +29,15 @@ endif
 obj-$(if $(CONFIG_KUNIT),y) +=		hooks.o
 
 obj-$(CONFIG_KUNIT_TEST) +=		kunit-test.o
+
+userprogs +=				kunit-test-uapi
+kunit-test-uapi-userccflags :=		-static $(NOLIBC_USERCFLAGS)
+
+ifdef CONFIG_KUNIT_UAPI
+CFLAGS_kunit-test.o :=			-Wa,-I$(obj)
+$(obj)/kunit-test.o: $(obj)/kunit-test-uapi
+endif
+
 obj-$(CONFIG_KUNIT_TEST) +=		platform-test.o
 
 # string-stream-test compiles built-in only.
diff --git a/lib/kunit/kunit-test-uapi.c b/lib/kunit/kunit-test-uapi.c
new file mode 100644
index 000000000000..2e75e57865e3
--- /dev/null
+++ b/lib/kunit/kunit-test-uapi.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit Userspace selftest.
+ *
+ * Copyright (C) 2026, Linutronix GmbH.
+ * Author: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ *
+ * This is *userspace* code.
+ */
+
+#include <fcntl.h>
+#include <unistd.h>
+#include <string.h>
+
+#include "../../tools/testing/selftests/kselftest.h"
+
+static void test_procfs(void)
+{
+	char buf[256];
+	ssize_t r;
+	int fd;
+
+	fd = open("/proc/self/comm", O_RDONLY);
+	if (fd == -1) {
+		ksft_test_result_fail("procfs: open() failed: %s\n", strerror(errno));
+		return;
+	}
+
+	r = read(fd, buf, sizeof(buf));
+	close(fd);
+
+	if (r == -1) {
+		ksft_test_result_fail("procfs: read() failed: %s\n", strerror(errno));
+		return;
+	}
+
+	if (r != 16 || strncmp("kunit-test-uapi\n", buf, 16) != 0) {
+		ksft_test_result_fail("procfs: incorrect comm\n");
+		return;
+	}
+
+	ksft_test_result_pass("procfs\n");
+}
+
+int main(void)
+{
+	ksft_print_header();
+	ksft_set_plan(1);
+	test_procfs();
+	ksft_finished();
+}
diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
index 126e30879dad..b62e24fb9c55 100644
--- a/lib/kunit/kunit-test.c
+++ b/lib/kunit/kunit-test.c
@@ -9,6 +9,7 @@
 #include <kunit/test.h>
 #include <kunit/test-bug.h>
 #include <kunit/static_stub.h>
+#include <kunit/uapi.h>
 
 #include <linux/device.h>
 #include <kunit/device.h>
@@ -914,10 +915,31 @@ static struct kunit_suite kunit_stub_test_suite = {
 	.test_cases = kunit_stub_test_cases,
 };
 
+static void kunit_uapi_test(struct kunit *test)
+{
+	KUNIT_UAPI_EMBED_BLOB(kunit_test_uapi, "kunit-test-uapi");
+
+	if (IS_ENABLED(CONFIG_KUNIT_UAPI))
+		kunit_uapi_run_kselftest(test, &kunit_test_uapi);
+	else
+		kunit_skip(test, "CONFIG_KUNIT_UAPI is not enabled");
+}
+
+static struct kunit_case kunit_uapi_test_cases[] = {
+	KUNIT_CASE(kunit_uapi_test),
+	{}
+};
+
+static struct kunit_suite kunit_uapi_test_suite = {
+	.name = "kunit_uapi",
+	.test_cases = kunit_uapi_test_cases,
+};
+
 kunit_test_suites(&kunit_try_catch_test_suite, &kunit_resource_test_suite,
 		  &kunit_log_test_suite, &kunit_status_test_suite,
 		  &kunit_current_test_suite, &kunit_device_test_suite,
-		  &kunit_fault_test_suite, &kunit_stub_test_suite);
+		  &kunit_fault_test_suite, &kunit_stub_test_suite,
+		  &kunit_uapi_test_suite);
 
 MODULE_DESCRIPTION("KUnit test for core test infrastructure");
 MODULE_LICENSE("GPL v2");

-- 
2.53.0


