Return-Path: <linux-kbuild+bounces-12983-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLzlDudo+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12983-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:37:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D64BB0FD
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:37:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C15F3050205
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C4A3803FA;
	Mon,  4 May 2026 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mytd3Boy";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SmVfsSu9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DF637DE91;
	Mon,  4 May 2026 09:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887222; cv=none; b=GazYloRNJkZa5e4FnPy7Ujb0vENUJIf8biVjbWA8s/0ysCQL0hkx8R7LHa+mcXNzJbipxb8V6iD6LGHdKFNoIr9XxL1othWDUuB8bsFk8ihnc4K8oa5jH1lt1wccIHuJoSizQXk/BuWlhsBQaQTC1mrQGZsdowdy/LhoHrmi6pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887222; c=relaxed/simple;
	bh=2eKO4vMe4Rs11ZE058NHDusLM5GzLyo6TWJUCIU1st4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUILjASWvDz0LKbcQFL5mT8q51bbJK2mK11lhOM0cJfXTSUAFeLLpesTnWutGDoG1hBQM/6zsetHQTGwV5orfU55VeGGKtXsNAp2r0nNWcP90XYMb5Yp6i0bR2DawHk/XQNjKCZNHS5NPPlcSqgThsNS67tNb/A+GrXY+Tr0FKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mytd3Boy; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SmVfsSu9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txu04uvacD5BOS6pZdks2wuxHk5ixo4TfuHlWKL2s0s=;
	b=mytd3Boyf69X4DDkWYFsi3ghOpooOmkdsKjdjdOBxbNWBWvOZP9MPNV43Sc79YmSQtHmRE
	eva8BnHmWcioprtk8fVgJd3wokb8PwA5ABxUvu9bO1BJGh8iRtLshnMDDIEgMkfXXnupq6
	AQTA2l9yxbUhGe8cvG/rq3Vr1TSuiIKGR4sVCZ73LzT9lnfbc7F7j0TpunBJsfo7kSSbIs
	2vFXEW3QMA90ILnGysdIhsPPNdRC2eOl+RUj9baIAALDNFxvdQJQ/x2rYgWy5kJwV8r2BI
	h8rZyhDn0/kpWS1B1xoj96n2d+IvapYP4hB7J3MPtfAajl0Mrbwo86x78k6WgQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=txu04uvacD5BOS6pZdks2wuxHk5ixo4TfuHlWKL2s0s=;
	b=SmVfsSu9Ki8BtDRjyzCt/w/mgkUvSIl+eZyl+8rVP3O0aXLRqNJ5Md6wQqTc+aIj6Ss/iO
	OGjOTGd18wjqzsAQ==
Date: Mon, 04 May 2026 11:33:24 +0200
Subject: [PATCH v6 08/11] kunit: uapi: Forward test executable output to
 KUnit log
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-8-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=5270;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=2eKO4vMe4Rs11ZE058NHDusLM5GzLyo6TWJUCIU1st4=;
 b=eAyXR25yto2GniYCRLnQQbR726ZuqwLNF+cJwkhT563vUaH60/3lrMUsQgD6kXStTvdCBgEwI
 vf+45teK5TZC+XQ54PNDtmEuDO+/q/Y8/AerLsK3YVRVM8UiBjRLNwu
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: BD9D64BB0FD
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
	TAGGED_FROM(0.00)[bounces-12983-lists,linux-kbuild=lfdr.de];
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

The output of the test executable should be grouped together with the
regular KUnit output and also be available in debugfs.
Install a custom miscdevice as stdout and stderr which forwards the
written data to the KUnit log.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/kunit/kunit-uapi.c | 155 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 154 insertions(+), 1 deletion(-)

diff --git a/lib/kunit/kunit-uapi.c b/lib/kunit/kunit-uapi.c
index 485b79fd193d..7f0309a827a5 100644
--- a/lib/kunit/kunit-uapi.c
+++ b/lib/kunit/kunit-uapi.c
@@ -11,6 +11,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/fs_struct.h>
+#include <linux/miscdevice.h>
 #include <linux/pid.h>
 #include <linux/pipe_fs_i.h>
 #include <linux/sched/task.h>
@@ -22,6 +23,8 @@
 #include <kunit/test.h>
 #include <kunit/uapi.h>
 
+#define KUNIT_LOG_DEVICE "kunit-log"
+
 enum {
 	KSFT_PASS	= 0,
 	KSFT_FAIL	= 1,
@@ -94,10 +97,48 @@ static int kunit_uapi_get_cwd(struct vfsmount *mnt)
 	return take_fd(fd);
 }
 
+static int kunit_uapi_open_standard_streams(void)
+{
+	struct vfsmount *devtmpfs __free(kern_unmount) = kunit_uapi_mount_fs("devtmpfs");
+	if (IS_ERR(devtmpfs))
+		return PTR_ERR(devtmpfs);
+
+	CLASS(get_unused_fd, stdin_fd)(O_RDONLY);
+	if (stdin_fd < 0)
+		return stdin_fd;
+
+	CLASS(get_unused_fd, stdout_fd)(O_WRONLY);
+	if (stdout_fd < 0)
+		return stdout_fd;
+
+	CLASS(get_unused_fd, stderr_fd)(O_WRONLY);
+	if (stderr_fd < 0)
+		return stderr_fd;
+
+	struct file *logfile __free(fput) = file_open_root_mnt(devtmpfs, KUNIT_LOG_DEVICE,
+							       O_RDWR, 0);
+	if (IS_ERR(logfile))
+		return PTR_ERR(logfile);
+
+	fd_install(stdin_fd, no_free_ptr(logfile));
+	fd_install(stdout_fd, fget(stdin_fd));
+	fd_install(stderr_fd, fget(stdin_fd));
+
+	take_fd(stdin_fd);
+	take_fd(stdout_fd);
+	take_fd(stderr_fd);
+
+	return 0;
+}
+
 static int kunit_uapi_usermodehelper_init(struct subprocess_info *info, struct cred *new)
 {
 	struct kunit_uapi_usermodehelper_ctx *ctx = info->data;
-	int dirfd;
+	int ret, dirfd;
+
+	ret = kunit_uapi_open_standard_streams();
+	if (ret)
+		return ret;
 
 	dirfd = kunit_uapi_get_cwd(ctx->mnt);
 	if (dirfd < 0)
@@ -188,6 +229,118 @@ void kunit_uapi_run_kselftest(struct kunit *test, const struct kunit_uapi_blob *
 }
 EXPORT_SYMBOL_GPL(kunit_uapi_run_kselftest);
 
+struct kunit_uapi_log_private {
+	struct mutex mutex;
+	struct seq_buf buf;
+	char data[4096];
+};
+
+static int kunit_uapi_log_open(struct inode *ino, struct file *file)
+{
+	struct kunit_uapi_log_private *priv;
+
+	priv = kmalloc_obj(*priv);
+	if (!priv)
+		return -ENOMEM;
+
+	mutex_init(&priv->mutex);
+	seq_buf_init(&priv->buf, priv->data, sizeof(priv->data));
+
+	file->private_data = priv;
+
+	return 0;
+}
+
+static void kunit_uapi_log_str(struct kunit *test, const char *str, size_t len)
+{
+	kunit_log(KERN_INFO, test, KUNIT_SUBSUBTEST_INDENT "%.*s", (int)len, str);
+}
+
+static void kunit_uapi_print_buf_to_log(struct kunit *test, struct seq_buf *s)
+{
+	const char *start, *lf;
+
+	if (s->size == 0 || s->len == 0)
+		return;
+
+	start = seq_buf_str(s);
+	while ((lf = strchr(start, '\n'))) {
+		kunit_uapi_log_str(test, start, lf - start + 1);
+		start = ++lf;
+	}
+
+	/* Remove printed data from buffer */
+	memmove(s->buffer, start, start - s->buffer);
+	s->len -= start - s->buffer;
+}
+
+static ssize_t kunit_uapi_log_write(struct file *file, const char __user *ubuf, size_t count,
+				    loff_t *off)
+{
+	struct kunit_uapi_log_private *priv = file->private_data;
+	struct seq_buf *buf = &priv->buf;
+	struct kunit *test;
+
+	test = kunit_get_current_test();
+	if (!test)
+		return -ENODEV;
+
+	guard(mutex)(&priv->mutex);
+
+	if (seq_buf_has_overflowed(buf))
+		return -E2BIG;
+
+	if (buf->size < buf->len + count) {
+		seq_buf_set_overflow(buf);
+		kunit_warn(test, "KUnit UAPI line buffer has overflowed\n");
+		return -E2BIG;
+	}
+
+	if (copy_from_user(buf->buffer + buf->len, ubuf, count))
+		return -EFAULT;
+
+	buf->len += count;
+
+	kunit_uapi_print_buf_to_log(test, &priv->buf);
+
+	return count;
+}
+
+static int kunit_uapi_log_release(struct inode *ino, struct file *file)
+{
+	struct kunit_uapi_log_private *priv = file->private_data;
+	struct kunit *test;
+
+	mutex_destroy(&priv->mutex);
+
+	test = kunit_get_current_test();
+	if (!test) {
+		kfree(priv);
+		return -ENODEV;
+	}
+
+	/* Flush last partial line */
+	kunit_uapi_log_str(test, priv->buf.buffer, priv->buf.len);
+	kunit_uapi_log_str(test, "\n", 1);
+
+	kfree(priv);
+	return 0;
+}
+
+static const struct file_operations kunit_uapi_log_fops = {
+	.owner		= THIS_MODULE,
+	.open		= kunit_uapi_log_open,
+	.release	= kunit_uapi_log_release,
+	.write		= kunit_uapi_log_write,
+};
+
+static struct miscdevice kunit_uapi_log = {
+	.minor	= MISC_DYNAMIC_MINOR,
+	.name	= KUNIT_LOG_DEVICE,
+	.fops	= &kunit_uapi_log_fops,
+};
+module_misc_device(kunit_uapi_log);
+
 MODULE_DESCRIPTION("KUnit UAPI testing framework");
 MODULE_AUTHOR("Thomas Weißschuh <thomas.weissschuh@linutronix.de");
 MODULE_LICENSE("GPL");

-- 
2.53.0


