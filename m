Return-Path: <linux-kbuild+bounces-12984-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Ew7EQRp+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12984-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:12 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CAED34BB141
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:38:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 546D33058098
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6EE538228D;
	Mon,  4 May 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="G+MH4msg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VqwfyAtN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE51137F01B;
	Mon,  4 May 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887222; cv=none; b=qAH3AO1zzbaDNeaAwdSIb4r2k3ff1/orMhjnVH1pvvZt3BhbdZgRILbzBADgScgzdxNT0rrPocmyS0cBbLV/jPXj6UqOs699eeul43dRfeLTwZnqU1GDIt8f7d++ZXIILo7u2BodngDk9VMVXNLoLvkPhdzVwxppfNdSPkdsLgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887222; c=relaxed/simple;
	bh=2L6gp2L3ByeOjEJ+yHu5JnKMwKtbkdQ9OZqBxRAn/MM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VSXa1y9jyqjgh2FOioUIy5dg+tS8SvG1j6xUrfEVW9VT5seTSi1Dvb9GkLznxZ2V2YK3Z3krtr+YviYjCjO1Uoa7bgASBmddehFILpReLB6yhczs2m4nB+kGP9WydkrIdYzGlcfskEuehFg0f31sqF4AuxHZPAXmRONxfpCLR8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=G+MH4msg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VqwfyAtN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNhDee3n5mRVMX7s7eQ6SV9IedetRRfoH0zE/EbioIA=;
	b=G+MH4msgy+08eWsp0mIp0jz9U2a8SGS5ZabdReFhyoMSh2OTk0NZZT8FuFvV2Cfz63TX36
	7aUo0mK13JPjgXJR6JH/IMF3W7Y4k+yiswVrCBcnHqXaSzxs3VjtlJgRIG2DLAjB8QvQGi
	JKC6FVhEbQ3VgXdbFqViS2BvQqVlR1qrzSoWml9yLL2Gp6H5Wjbc16U+ob934DRKQEoLLo
	C05U4338TYhox5/b71uhe/8IIdtoxjzzgw6DfloLKLbcsUhN5oI4Mbd6GHndExHuso7sl0
	Sw1U/MDxu7Gad2TyQZO6elBZ0ystnuiYLh2H+WxnJqkij+aMf4gCZDFLlTMb5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bNhDee3n5mRVMX7s7eQ6SV9IedetRRfoH0zE/EbioIA=;
	b=VqwfyAtNQyPVNa/aneoLCY41scKAuq7mHqjFHQVQ+ccw5AujEywsQPLI4igVSi9F7FlntE
	VNENreqabY06ASDQ==
Date: Mon, 04 May 2026 11:33:23 +0200
Subject: [PATCH v6 07/11] kunit: Introduce UAPI testing framework
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-7-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=11941;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2L6gp2L3ByeOjEJ+yHu5JnKMwKtbkdQ9OZqBxRAn/MM=;
 b=lPC4ggh6t2uwyK3HlqIKDCKnOmbbPHJlJAHhU1cet6DJ0ZYSTqc7/Ws+N6m7ycxFH4zP0+Aa+
 u5t1Zt6AO+eD3mwnKlw1onf50J1UQqUmOsglyEo9Ipd6JdSyWi3HuYy
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: CAED34BB141
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
	TAGGED_FROM(0.00)[bounces-12984-lists,linux-kbuild=lfdr.de];
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

Enable running UAPI tests as part of kunit.
The selftests are embedded into the kernel image and their output is
forwarded to kunit for unified reporting.

The implementation reuses parts of usermode drivers and usermode
helpers. However these frameworks are not used directly as they make it
impossible to retrieve a thread's exit code.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Documentation/dev-tools/kunit/api/index.rst |   5 +
 Documentation/dev-tools/kunit/api/uapi.rst  |  14 ++
 MAINTAINERS                                 |   6 +
 include/kunit/uapi.h                        |  77 +++++++++++
 lib/kunit/Kconfig                           |  16 +++
 lib/kunit/Makefile                          |   2 +
 lib/kunit/kunit-uapi.c                      | 193 ++++++++++++++++++++++++++++
 7 files changed, 313 insertions(+)

diff --git a/Documentation/dev-tools/kunit/api/index.rst b/Documentation/dev-tools/kunit/api/index.rst
index 5cdb552a0808..34d8fee9a970 100644
--- a/Documentation/dev-tools/kunit/api/index.rst
+++ b/Documentation/dev-tools/kunit/api/index.rst
@@ -9,6 +9,7 @@ API Reference
 	test
 	resource
 	functionredirection
+	uapi
 	clk
 	of
 	platformdevice
@@ -32,6 +33,10 @@ Documentation/dev-tools/kunit/api/functionredirection.rst
 
  - Documents the KUnit Function Redirection API
 
+Documentation/dev-tools/kunit/api/uapi.rst
+
+ - Documents the KUnit Userspace testing API
+
 Driver KUnit API
 ================
 
diff --git a/Documentation/dev-tools/kunit/api/uapi.rst b/Documentation/dev-tools/kunit/api/uapi.rst
new file mode 100644
index 000000000000..1f01b5c6c9db
--- /dev/null
+++ b/Documentation/dev-tools/kunit/api/uapi.rst
@@ -0,0 +1,14 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================
+Userspace Test API
+==================
+
+This file documents all of the userspace testing API.
+Userspace tests are built as :ref:`kbuild userprogs <kbuild_userprogs>`,
+linked statically and without any external dependencies.
+
+For the widest platform compatibility they should use nolibc, as provided by `init/Makefile.nolibc`.
+
+.. kernel-doc:: include/kunit/uapi.h
+   :internal:
diff --git a/MAINTAINERS b/MAINTAINERS
index be4f6242b3fc..e29ca56f7334 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14395,6 +14395,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/kinetic,ktz8866.yaml
 F:	drivers/video/backlight/ktz8866.c
 
+KUNIT UAPI TESTING FRAMEWORK (in addition to KERNEL UNIT TESTING FRAMEWORK)
+M:	Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+S:	Maintained
+F:	include/kunit/uapi.h
+F:	lib/kunit/kunit-uapi.c
+
 KVM PARAVIRT (KVM/paravirt)
 M:	Paolo Bonzini <pbonzini@redhat.com>
 R:	Vitaly Kuznetsov <vkuznets@redhat.com>
diff --git a/include/kunit/uapi.h b/include/kunit/uapi.h
new file mode 100644
index 000000000000..1e0585355124
--- /dev/null
+++ b/include/kunit/uapi.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit Userspace testing API.
+ *
+ * Copyright (C) 2026, Linutronix GmbH.
+ * Author: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ */
+
+#ifndef _KUNIT_UAPI_H
+#define _KUNIT_UAPI_H
+
+#include <linux/types.h>
+
+struct kunit;
+
+/**
+ * struct kunit_uapi_blob - Blob embedded build artifact
+ * @path: Path of the embedded artifact.
+ * @data: Start of the embedded data in memory.
+ * @end: End of the embedded data in memory.
+ */
+struct kunit_uapi_blob {
+	const char *const path;
+	const u8 *data;
+	const u8 *end;
+};
+
+#if IS_ENABLED(CONFIG_KUNIT_UAPI)
+
+/**
+ * KUNIT_UAPI_EMBED_BLOB() - Embed another build artifact into the kernel
+ * @_name: The name of symbol under which the artifact is embedded.
+ * @_path: Path to the artifact on disk.
+ *
+ * Embeds a build artifact like a userspace executable into the kernel or current module.
+ * The build artifact is read from disk and needs to be already built.
+ */
+#define KUNIT_UAPI_EMBED_BLOB(_name, _path)					\
+	asm (									\
+	"	.pushsection .rodata, \"a\"				\n"	\
+	"	.global " __stringify(CONCATENATE(_name, _data)) "	\n"	\
+	__stringify(CONCATENATE(_name, _data)) ":			\n"	\
+	"	.incbin " __stringify(_path) "				\n"	\
+	"	.size " __stringify(CONCATENATE(_name, _data)) ", "		\
+			". - " __stringify(CONCATENATE(_name, _data)) "	\n"	\
+	"	.global " __stringify(CONCATENATE(_name, _end)) "	\n"	\
+	__stringify(CONCATENATE(_name, _end)) ":			\n"	\
+	"	.popsection						\n"	\
+	);									\
+										\
+	extern const char CONCATENATE(_name, _data)[];				\
+	extern const char CONCATENATE(_name, _end)[];				\
+										\
+	static const struct kunit_uapi_blob _name = {				\
+		.path	= _path,						\
+		.data	= CONCATENATE(_name, _data),				\
+		.end	= CONCATENATE(_name, _end),				\
+	}									\
+
+#else /* !CONFIG_KUNIT_UAPI */
+
+/* Unresolved external reference, to be optimized away */
+#define KUNIT_UAPI_EMBED_BLOB(_name, _path)					\
+	extern const struct kunit_uapi_blob _name
+
+#endif /* CONFIG_KUNIT_UAPI */
+
+/**
+ * kunit_uapi_run_kselftest() - Run a userspace kselftest as part of kunit
+ * @test: The test context object.
+ * @executable: kselftest executable to run
+ *
+ * Runs the kselftest and forwards its TAP output and exit status to kunit.
+ */
+void kunit_uapi_run_kselftest(struct kunit *test, const struct kunit_uapi_blob *executable);
+
+#endif /* _KUNIT_UAPI_H */
diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
index 498cc51e493d..f3dc9fac811a 100644
--- a/lib/kunit/Kconfig
+++ b/lib/kunit/Kconfig
@@ -141,4 +141,20 @@ config KUNIT_UML_PCI
 
 	  If unsure, say N.
 
+config KUNIT_UAPI
+	tristate "KUnit UAPI testing framework"
+	depends on KUNIT
+	depends on ARCH_HAS_NOLIBC
+	depends on !STATIC_USERMODEHELPER
+	depends on !LTO_CLANG # https://github.com/llvm/llvm-project/issues/112920
+	select HEADERS_INSTALL
+	select DEVTMPFS
+	default KUNIT
+	help
+	  Enables support for building and running userspace selftests as part of kunit.
+	  These tests should be statically linked and use kselftest.h or kselftest_harness.h
+	  for status reporting.
+
+	  In most cases this should be left as its default.
+
 endif # KUNIT
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 656f1fa35abc..6059621a2d32 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -12,6 +12,8 @@ kunit-objs +=				test.o \
 					device.o \
 					platform.o
 
+obj-$(CONFIG_KUNIT_UAPI) +=		kunit-uapi.o
+
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
 endif
diff --git a/lib/kunit/kunit-uapi.c b/lib/kunit/kunit-uapi.c
new file mode 100644
index 000000000000..485b79fd193d
--- /dev/null
+++ b/lib/kunit/kunit-uapi.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit Userspace testing API.
+ *
+ * Copyright (C) 2026, Linutronix GmbH.
+ * Author: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
+ */
+
+#include <linux/binfmts.h>
+#include <linux/export.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/fs_struct.h>
+#include <linux/pid.h>
+#include <linux/pipe_fs_i.h>
+#include <linux/sched/task.h>
+#include <linux/seq_buf.h>
+#include <linux/types.h>
+#include <linux/umh.h>
+
+#include <kunit/test-bug.h>
+#include <kunit/test.h>
+#include <kunit/uapi.h>
+
+enum {
+	KSFT_PASS	= 0,
+	KSFT_FAIL	= 1,
+	KSFT_XFAIL	= 2,
+	KSFT_XPASS	= 3,
+	KSFT_SKIP	= 4,
+};
+
+static struct vfsmount *kunit_uapi_mount_fs(const char *name)
+{
+	struct file_system_type *type;
+
+	type = get_fs_type(name);
+	if (!type)
+		return ERR_PTR(-ENODEV);
+
+	return kern_mount(type);
+}
+
+static int kunit_uapi_write_file(struct vfsmount *mnt, const char *name, mode_t mode,
+				 const u8 *data, size_t size)
+{
+	struct file *file;
+	ssize_t written;
+
+	file = file_open_root_mnt(mnt, name, O_CREAT | O_WRONLY, mode);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	written = kernel_write(file, data, size, NULL);
+	filp_close(file, NULL);
+	if (written != size) {
+		if (written >= 0)
+			return -ENOMEM;
+		return written;
+	}
+
+	return 0;
+}
+
+static const char *kunit_uapi_executable_target(const struct kunit_uapi_blob *executable)
+{
+	return kbasename(executable->path);
+}
+
+static int kunit_uapi_write_executable(struct vfsmount *mnt,
+				       const struct kunit_uapi_blob *executable)
+{
+	return kunit_uapi_write_file(mnt, kunit_uapi_executable_target(executable), 0755,
+				     executable->data, executable->end - executable->data);
+}
+
+struct kunit_uapi_usermodehelper_ctx {
+	struct vfsmount *mnt;
+	struct kunit *test;
+};
+
+static int kunit_uapi_get_cwd(struct vfsmount *mnt)
+{
+	CLASS(get_unused_fd, fd)(O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	struct file *file __free(fput) = file_open_root_mnt(mnt, "/", O_DIRECTORY, 0);
+	if (IS_ERR(file))
+		return PTR_ERR(file);
+
+	fd_install(fd, no_free_ptr(file));
+
+	return take_fd(fd);
+}
+
+static int kunit_uapi_usermodehelper_init(struct subprocess_info *info, struct cred *new)
+{
+	struct kunit_uapi_usermodehelper_ctx *ctx = info->data;
+	int dirfd;
+
+	dirfd = kunit_uapi_get_cwd(ctx->mnt);
+	if (dirfd < 0)
+		return dirfd;
+
+	kernel_sigaction(SIGKILL, SIG_DFL);
+	kernel_sigaction(SIGABRT, SIG_DFL);
+
+	current->kunit_test = ctx->test;
+
+	info->dirfd = dirfd;
+
+	return 0;
+}
+
+static int kunit_uapi_run_executable_in_mount(struct kunit *test,
+					      const struct kunit_uapi_blob *executable,
+					      struct vfsmount *mnt)
+{
+	const char *executable_target = kunit_uapi_executable_target(executable);
+	struct kunit_uapi_usermodehelper_ctx ctx = {
+		.test	= test,
+		.mnt	= mnt,
+	};
+	struct subprocess_info *info;
+	const char *const argv[] = {
+		executable_target,
+		NULL
+	};
+
+	info = call_usermodehelper_setup(AT_FDCWD, executable_target, (char **)argv, NULL,
+					 GFP_KERNEL, kunit_uapi_usermodehelper_init, NULL, &ctx);
+	if (!info)
+		return -ENOMEM;
+
+	/* Flush delayed fput so exec can open the file read-only */
+	flush_delayed_fput();
+
+	return call_usermodehelper_exec(info, UMH_WAIT_PROC);
+}
+
+static int kunit_uapi_run_executable(struct kunit *test, const struct kunit_uapi_blob *executable)
+{
+	int err;
+
+	struct vfsmount *mnt __free(kern_unmount) = kunit_uapi_mount_fs("ramfs");
+	if (IS_ERR(mnt))
+		return PTR_ERR(mnt);
+
+	err = kunit_uapi_write_executable(mnt, executable);
+	if (err)
+		return err;
+
+	err = kunit_uapi_run_executable_in_mount(test, executable, mnt);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+void kunit_uapi_run_kselftest(struct kunit *test, const struct kunit_uapi_blob *executable)
+{
+	u8 exit_code, exit_signal;
+	int err;
+
+	err = kunit_uapi_run_executable(test, executable);
+	if (err < 0)
+		KUNIT_FAIL_AND_ABORT(test, "Could not run test executable: %pe\n", ERR_PTR(err));
+
+	exit_code = err >> 8;
+	exit_signal = err & 0xff;
+
+	if (exit_signal)
+		KUNIT_FAIL_AND_ABORT(test, "kselftest exited with signal: %d\n", exit_signal);
+	else if (exit_code == KSFT_PASS)
+		; /* Noop */
+	else if (exit_code == KSFT_FAIL)
+		KUNIT_FAIL_AND_ABORT(test, "kselftest exited with code KSFT_FAIL\n");
+	else if (exit_code == KSFT_XPASS)
+		KUNIT_FAIL_AND_ABORT(test, "kselftest exited with code KSFT_XPASS\n");
+	else if (exit_code == KSFT_XFAIL)
+		; /* Noop */
+	else if (exit_code == KSFT_SKIP)
+		kunit_mark_skipped(test, "kselftest exited with code KSFT_SKIP\n");
+	else
+		KUNIT_FAIL_AND_ABORT(test, "kselftest exited with unknown exit code: %d\n",
+				     exit_code);
+}
+EXPORT_SYMBOL_GPL(kunit_uapi_run_kselftest);
+
+MODULE_DESCRIPTION("KUnit UAPI testing framework");
+MODULE_AUTHOR("Thomas Weißschuh <thomas.weissschuh@linutronix.de");
+MODULE_LICENSE("GPL");

-- 
2.53.0


