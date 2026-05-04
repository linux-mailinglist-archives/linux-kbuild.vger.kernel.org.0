Return-Path: <linux-kbuild+bounces-12987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kA+WGjRp+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12987-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:39:00 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C65944BB19C
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA77F306A5C3
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19FED3845CB;
	Mon,  4 May 2026 09:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4fiTe258";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Ya8hyzbQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2489537FF40;
	Mon,  4 May 2026 09:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887223; cv=none; b=G/JFglTKkb/K0bwLtp7mNNMj2AsLEYBltZaJ52khX/Vy5SHdUeP6bQXrNXG+7D+qXP857Ci3a+V47/We1b6NrnZwT5M1oH6Q7H3Gi8NbEamnPeR9AyNuCxgCN/WSk/b6kOVcBTedZ+/xTrgxiTkXkXMP89FnhJ1m3RX3dJZ0Z5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887223; c=relaxed/simple;
	bh=CX9mDSQHReDHwq7Y7h5slKzIlaWwgoLVwu8rW9SRZP4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4CaXKA67oYjZdbhebWbM5EYXHkBxwspG0tyeWqq9bpcyrSQzVCHf4Rrk12wfbHbTLZl+IUj8Ptb/MT2KoRhs+g9WB7s4YdrFQoBGTn5rjqnoMkrxwgklJOVZY2SAXSjbzbaKw+hPbyWIGngQpEzHPhLHtbjsG6CiWKsqCcvES4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4fiTe258; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Ya8hyzbQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54QuLJcpe0mdHxqir8B4oCgM7uiPnZyrpfVJkv2VNTQ=;
	b=4fiTe258PXM0AU2nF7sr5EciL3AdNsNqw81aKrsuxiSBuO4QWf6cAgiMuXLDkBqdvK/XKu
	Ijh3JsX+2dnvAA7LEJpd3cMm46MSUJw5WXC1RTCOLsH2Yswj6DGbHBNmSLGncTETXbrxTG
	B7uwGflbsgYNglEpYOTQ+8l/Dv67mXhK16xU+rzb0T0b4WpETfUPPNPuKNBvOeR/Suw2UY
	96NZZQKjHOOj8/2Fm3c8UNkb70iz1uCEWY6vurHFQLmvXaQucDFopVFYbyPCYPlhA9Tfnj
	+3g8IyKdCIKcMtfF5sd7lSHjIHCKrH0vup+LBZ6I9zlA1WLT5dKKLzAm0dINiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=54QuLJcpe0mdHxqir8B4oCgM7uiPnZyrpfVJkv2VNTQ=;
	b=Ya8hyzbQcKEwRoNDtlD4uUE03ky+hH7RSJQxS5sQvYcq4X0VjPDSsiV9I/5Dbl6forYmpQ
	LVR3IRbfPh4yaiBg==
Date: Mon, 04 May 2026 11:33:26 +0200
Subject: [PATCH v6 10/11] kunit: uapi: Introduce preinit executable
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-10-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=4914;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=CX9mDSQHReDHwq7Y7h5slKzIlaWwgoLVwu8rW9SRZP4=;
 b=rOUneMbzF1f113+9Wt2C9L8BsiwD6Dzs1kpZ+t+eIdHAn5qh6FHYThaZdNzBgRt7wbUS+4RoP
 isGDCOYJAILCmFNroiCghjSkp5vq1Kt9kPuoxp+L8KlkpBK1EnCvsKx
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: C65944BB19C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12987-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:email,linutronix.de:dkim,linutronix.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

UAPI selftests may expect a "normal" userspace environment.
For example the normal kernel API pseudo-filesystems should be mounted.
This could be done from kernel code but it is non-idiomatic.

Add a preinit userspace executable which performs these setup steps
before running the final test executable.
This preinit executable is only ever run from the kernel.
Give it access to autoconf.h and kconfig.h to adapt itself to the
tested kernel.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: David Gow <davidgow@google.com>
---
 MAINTAINERS              |  1 +
 lib/kunit/Makefile       |  5 ++++
 lib/kunit/kunit-uapi.c   | 11 +++++---
 lib/kunit/uapi-preinit.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 82 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b7358d89df70..4e8cf9fa7aa9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14401,6 +14401,7 @@ S:	Maintained
 F:	include/kunit/uapi.h
 F:	lib/kunit/kunit-example-uapi.c
 F:	lib/kunit/kunit-uapi.c
+F:	lib/kunit/uapi-preinit.c
 
 KVM PARAVIRT (KVM/paravirt)
 M:	Paolo Bonzini <pbonzini@redhat.com>
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2434470e9985..05991d69aa70 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -14,8 +14,13 @@ kunit-objs +=				test.o \
 					device.o \
 					platform.o
 
+userprogs +=				uapi-preinit
+uapi-preinit-userccflags +=		-static $(NOLIBC_USERCFLAGS)
 obj-$(CONFIG_KUNIT_UAPI) +=		kunit-uapi.o
 
+CFLAGS_kunit-uapi.o :=			-Wa,-I$(obj)
+$(obj)/kunit-uapi.o: $(obj)/uapi-preinit
+
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
 endif
diff --git a/lib/kunit/kunit-uapi.c b/lib/kunit/kunit-uapi.c
index 7f0309a827a5..702d26878ccd 100644
--- a/lib/kunit/kunit-uapi.c
+++ b/lib/kunit/kunit-uapi.c
@@ -33,6 +33,8 @@ enum {
 	KSFT_SKIP	= 4,
 };
 
+KUNIT_UAPI_EMBED_BLOB(kunit_uapi_preinit, "uapi-preinit");
+
 static struct vfsmount *kunit_uapi_mount_fs(const char *name)
 {
 	struct file_system_type *type;
@@ -158,18 +160,17 @@ static int kunit_uapi_run_executable_in_mount(struct kunit *test,
 					      const struct kunit_uapi_blob *executable,
 					      struct vfsmount *mnt)
 {
-	const char *executable_target = kunit_uapi_executable_target(executable);
 	struct kunit_uapi_usermodehelper_ctx ctx = {
 		.test	= test,
 		.mnt	= mnt,
 	};
 	struct subprocess_info *info;
 	const char *const argv[] = {
-		executable_target,
+		kunit_uapi_executable_target(executable),
 		NULL
 	};
 
-	info = call_usermodehelper_setup(AT_FDCWD, executable_target, (char **)argv, NULL,
+	info = call_usermodehelper_setup(AT_FDCWD, kunit_uapi_preinit.path, (char **)argv, NULL,
 					 GFP_KERNEL, kunit_uapi_usermodehelper_init, NULL, &ctx);
 	if (!info)
 		return -ENOMEM;
@@ -192,6 +193,10 @@ static int kunit_uapi_run_executable(struct kunit *test, const struct kunit_uapi
 	if (err)
 		return err;
 
+	err = kunit_uapi_write_executable(mnt, &kunit_uapi_preinit);
+	if (err)
+		return err;
+
 	err = kunit_uapi_run_executable_in_mount(test, executable, mnt);
 	if (err)
 		return err;
diff --git a/lib/kunit/uapi-preinit.c b/lib/kunit/uapi-preinit.c
new file mode 100644
index 000000000000..686737ea3c76
--- /dev/null
+++ b/lib/kunit/uapi-preinit.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit Userspace environment setup.
+ *
+ * Copyright (C) 2026, Linutronix GmbH.
+ * Author: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ *
+ * This is *userspace* code.
+ */
+
+#include <sys/mount.h>
+#include <sys/stat.h>
+
+#include "../../tools/testing/selftests/kselftest.h"
+
+#define KUNIT_UAPI_CHDIR_FD 3
+
+static int setup_api_mount(const char *target, const char *fstype)
+{
+	int ret;
+
+	ret = mkdir(target, 0755);
+	if (ret && errno != EEXIST)
+		return -errno;
+
+	ret = mount("none", target, fstype, 0, NULL);
+	if (ret && errno != EBUSY)
+		return -errno;
+
+	return 0;
+}
+
+static void exit_failure(const char *stage, int err)
+{
+	/* If preinit fails synthesize a failed test report. */
+	ksft_print_header();
+	ksft_set_plan(1);
+	ksft_test_result_fail("Failed during test setup: %s: %s\n", stage, strerror(-err));
+	ksft_finished();
+}
+
+int main(int argc, char **argv, char **envp)
+{
+	int ret;
+
+	ret = fchdir(KUNIT_UAPI_CHDIR_FD);
+	close(KUNIT_UAPI_CHDIR_FD);
+	if (ret)
+		exit_failure("fchdir", ret);
+
+	ret = setup_api_mount("/proc", "proc");
+	if (ret)
+		exit_failure("mount /proc", ret);
+
+	ret = setup_api_mount("/sys", "sysfs");
+	if (ret)
+		exit_failure("mount /sys", ret);
+
+	ret = setup_api_mount("/dev", "devtmpfs");
+	if (ret)
+		exit_failure("mount /dev", ret);
+
+	ret = execve(argv[0], argv, envp);
+	if (ret)
+		exit_failure("execve", ret);
+
+	return 0;
+}

-- 
2.53.0


