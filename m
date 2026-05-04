Return-Path: <linux-kbuild+bounces-12977-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HakNhho+GnuuAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12977-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:34:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F404BAFD9
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:34:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84116301FF91
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020BA37DE80;
	Mon,  4 May 2026 09:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="31e3QaS3";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7w72VJSi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86ED937CD54;
	Mon,  4 May 2026 09:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887216; cv=none; b=bvPoPf5UEyByGrJOq5X0HVgEqR6M4c+EciamYNoBPvD7TUo2D6G8QCcMWBjQgPcMAJKrOFzqrM6gtBwwpMSvT1bkuPDXN6R4qzdXwvanoF8CNxY31z+CpeP+QLV/4KCIzdzkB8rEUZaLejeLi47mZ2yEmM5k8Paq7O/fiIbJY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887216; c=relaxed/simple;
	bh=n0bgWJFcNKpR7u48Mrp0bvJ0+QUs8bWyY+A+fgnbBQA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aq3NMTG4Vm6I7hXxaSKzZoRApxAPWRlvQX9In6AGSPklgPlbSOhhe+TxoYtrsGs38UuFYFFaPyWUHqVHghDVOkagqY57Gpqo7siNK6Nmdu7mj7l9Nc8YslGu/NA+ko+mKGk1vzKFc7dU3QqaHO3+8MbmtA2pWdyhNH5N1NEWmA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=31e3QaS3; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7w72VJSi; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQAG7CVmsWKVP7u5YLgZP2CRjHSITjRICazIKHci/JM=;
	b=31e3QaS305TiIXvNkEsYdXEq2eU+zYNch+6P5rkxUluCBQJPcV7hVEaDkKYyYeIL3C+Yt1
	osYMcLwRsWWX+q5WCdjKSOqe7XfwCjUVKwqAop/pWZXx9VHZ3a2YSmNKcwkmv4A3qaF4+/
	7O3UurhRVwY0qOVaPlAyIZsaSqS4yED8MO8Q8tEVXoGLRIceH7ByYMrruwARg4v6VVJBw4
	W2ZmJGNVh5qODK2gltQSGap0jHN72aMhS002NHIfI+W/tsnHmguGPJ5iqtsHXLHO2ew2o9
	MBkh6IVMUZEn1UkxqgRMfrqaKKbIfEA9NB5Op7hEiNr+wVNevfQuw7cUaWdEmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQAG7CVmsWKVP7u5YLgZP2CRjHSITjRICazIKHci/JM=;
	b=7w72VJSiZ5PXzKa8n3vn+sDeCdYJDKrqfyShNuVyd9tO+RxOtuTTMMTgwPN8tdVccUOYJm
	CDuB+hzrPiZiI8Cw==
Date: Mon, 04 May 2026 11:33:18 +0200
Subject: [PATCH v6 02/11] exec: add dirfd parameter to kernel_execve()
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-2-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=2639;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=n0bgWJFcNKpR7u48Mrp0bvJ0+QUs8bWyY+A+fgnbBQA=;
 b=Iv+b/AJAUhxlOTF9z5Z/INA2wyJRCzy+sdAo250bsF4VV1rrH0mVXbVA7E8pS7XEdlsgRzsjV
 Y0RMQJeyPDnA1ttbX0DCypA1WPwqFMqXkH/2F3PqTAa3sXcWYb8gpni
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 35F404BAFD9
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
	TAGGED_FROM(0.00)[bounces-12977-lists,linux-kbuild=lfdr.de];
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

Allow callers to specify the directory against which to resolve the
program filename. Enables running executables from private mounts.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 fs/exec.c               | 4 ++--
 include/linux/binfmts.h | 2 +-
 init/main.c             | 2 +-
 kernel/umh.c            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/exec.c b/fs/exec.c
index ba12b4c466f6..affae4b4f6f6 100644
--- a/fs/exec.c
+++ b/fs/exec.c
@@ -1846,7 +1846,7 @@ static int do_execveat_common(int fd, struct filename *filename,
 	return bprm_execve(bprm);
 }
 
-int kernel_execve(const char *kernel_filename,
+int kernel_execve(int dirfd, const char *kernel_filename,
 		  const char *const *argv, const char *const *envp)
 {
 	int retval;
@@ -1856,7 +1856,7 @@ int kernel_execve(const char *kernel_filename,
 		return -EINVAL;
 
 	CLASS(filename_kernel, filename)(kernel_filename);
-	CLASS(bprm, bprm)(AT_FDCWD, filename, 0);
+	CLASS(bprm, bprm)(dirfd, filename, 0);
 	if (IS_ERR(bprm))
 		return PTR_ERR(bprm);
 
diff --git a/include/linux/binfmts.h b/include/linux/binfmts.h
index 65abd5ab8836..04e2b7a85b2b 100644
--- a/include/linux/binfmts.h
+++ b/include/linux/binfmts.h
@@ -144,7 +144,7 @@ int copy_string_kernel(const char *arg, struct linux_binprm *bprm);
 extern void set_binfmt(struct linux_binfmt *new);
 extern ssize_t read_code(struct file *, unsigned long, loff_t, size_t);
 
-int kernel_execve(const char *filename,
+int kernel_execve(int dirfd, const char *filename,
 		  const char *const *argv, const char *const *envp);
 
 #endif /* _LINUX_BINFMTS_H */
diff --git a/init/main.c b/init/main.c
index 96f93bb06c49..551d03681234 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1511,7 +1511,7 @@ static int run_init_process(const char *init_filename)
 	pr_debug("  with environment:\n");
 	for (p = envp_init; *p; p++)
 		pr_debug("    %s\n", *p);
-	return kernel_execve(init_filename, argv_init, envp_init);
+	return kernel_execve(AT_FDCWD, init_filename, argv_init, envp_init);
 }
 
 static int try_to_run_init_process(const char *init_filename)
diff --git a/kernel/umh.c b/kernel/umh.c
index cffda97d961c..bab134fa8c36 100644
--- a/kernel/umh.c
+++ b/kernel/umh.c
@@ -106,7 +106,7 @@ static int call_usermodehelper_exec_async(void *data)
 	commit_creds(new);
 
 	wait_for_initramfs();
-	retval = kernel_execve(sub_info->path,
+	retval = kernel_execve(AT_FDCWD, sub_info->path,
 			       (const char *const *)sub_info->argv,
 			       (const char *const *)sub_info->envp);
 out:

-- 
2.53.0


