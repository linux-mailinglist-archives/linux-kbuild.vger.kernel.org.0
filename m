Return-Path: <linux-kbuild+bounces-12979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJUjF/5n+GkSuQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12979-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:33:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B2B4BAFB3
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 11:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0FD15300683A
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 09:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED32937EFF6;
	Mon,  4 May 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="KHJzFSXo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="3JNrBWg4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB03B37D13B;
	Mon,  4 May 2026 09:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777887218; cv=none; b=Q7Wl648nOJXZWgy8094soLdrgo2hq5S2FComcD0duKj5fhwWVICVHJnMdnE3LAxhRX2EvU8++BLdywjrEAwl20gsVgxIZsS1PNPbpQ+n4j1voYj0PwnXfF9gowAVAL0+kCPH9izvt6fYyXfC+v7xtWH3lYDGExs8lIuceCbeNBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777887218; c=relaxed/simple;
	bh=6IQeujXtDmMJBXxwWbg/iZaGW/kWT5oGF6ONKpLUivo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HU0XI3Dno9JB4y9kun+5AB9Pq2Ehr0xMiZu7WLLRCmA/m55wauNq3w53KlseEOTB+0Wxzvz7dmE+KUImrBGLiaABI5iwHcz1DQvtCj08PEnr4OEI2bcmQDzS0qYaR4Oo01vtyyoIWu/4v/Tduei+v2MDFarze55qsAut6wEKMK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=KHJzFSXo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=3JNrBWg4; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1777887214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHToxwgv5knqBTlwVbm55Ico/NITwpixj9Vnj9WYkao=;
	b=KHJzFSXo8K9RwrWApixGzV0XEkity1pGDhE2I04yIGVqYXik2ObZ5MVMp5vEU/RgvdhH+n
	xnwkV3vZj/pBvofthYGrE+S/gesdCJAoSnOsnFd5Be69xApwwwbuAsCf6uLq/Wk273egAz
	HlWmUpAi6yYmXoHA34SwlvBhaEcBIuXpb2uXhkXSQZ6gWKRIkO3/yV0S27IJtm7/UXBd0f
	0a3QyTtfLtwjqgNEUTWQiZ87vfoScZ4EjfqqwLBpiyMdigOEuYw0Hi7MV6Rf+aPdkjjBvf
	56XrwPG6d9L4TFxe11mMQfvIqz3qMGp0Xpl/BFqWrExswaWyex/9esdzbWpOxg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1777887214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jHToxwgv5knqBTlwVbm55Ico/NITwpixj9Vnj9WYkao=;
	b=3JNrBWg4lE1cji7KDMZA96EMu1CCZeW+mQtJ3mU3dPORXJm9+LwS+RJJ6PD3Dbi4pvCKRp
	iMHUlYSzYh1t/oBg==
Date: Mon, 04 May 2026 11:33:19 +0200
Subject: [PATCH v6 03/11] umh: add dirfd parameter
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-kunit-kselftests-v6-3-712d3d526d97@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777887211; l=5541;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6IQeujXtDmMJBXxwWbg/iZaGW/kWT5oGF6ONKpLUivo=;
 b=Bk32p7HowhqNBjsR8fXr53puXfLwSLesnkOi5si5O6aApY04poo5Gma1mEo9waYkeDsu9TM1O
 LsjNchuYUR8Ax8X2kZKRTRsO6Lg34ZsS7JyN6TSyV/RhqESvpp0PeIw
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Queue-Id: 37B2B4BAFB3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12979-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux-foundation.org,1wt.eu,weissschuh.net,linux.dev,lwn.net,zeniv.linux.org.uk,suse.cz,lst.de,davidgow.net,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]

Allow callers to specify the directory against which to resolve the
helper's filename. Enables the running of helpers from private mounts.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 fs/coredump.c               | 2 +-
 include/linux/umh.h         | 3 ++-
 kernel/module/kmod.c        | 2 +-
 kernel/umh.c                | 9 ++++++---
 lib/kobject_uevent.c        | 2 +-
 security/keys/request_key.c | 2 +-
 6 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/coredump.c b/fs/coredump.c
index bb6fdb1f458e..45df2387be3d 100644
--- a/fs/coredump.c
+++ b/fs/coredump.c
@@ -1015,7 +1015,7 @@ static bool coredump_pipe(struct core_name *cn, struct coredump_params *cprm,
 		helper_argv[argi] = cn->corename + argv[argi];
 	helper_argv[argi] = NULL;
 
-	sub_info = call_usermodehelper_setup(helper_argv[0], helper_argv, NULL,
+	sub_info = call_usermodehelper_setup(AT_FDCWD, helper_argv[0], helper_argv, NULL,
 					     GFP_KERNEL, umh_coredump_setup,
 					     NULL, cprm);
 	if (!sub_info)
diff --git a/include/linux/umh.h b/include/linux/umh.h
index daa6a7048c11..6670b9ff85d4 100644
--- a/include/linux/umh.h
+++ b/include/linux/umh.h
@@ -20,6 +20,7 @@ struct file;
 struct subprocess_info {
 	struct work_struct work;
 	struct completion *complete;
+	int dirfd;
 	const char *path;
 	char **argv;
 	char **envp;
@@ -34,7 +35,7 @@ extern int
 call_usermodehelper(const char *path, char **argv, char **envp, int wait);
 
 extern struct subprocess_info *
-call_usermodehelper_setup(const char *path, char **argv, char **envp,
+call_usermodehelper_setup(int dirfd, const char *path, char **argv, char **envp,
 			  gfp_t gfp_mask,
 			  int (*init)(struct subprocess_info *info, struct cred *new),
 			  void (*cleanup)(struct subprocess_info *), void *data);
diff --git a/kernel/module/kmod.c b/kernel/module/kmod.c
index a25dccdf7aa7..a85c57a707af 100644
--- a/kernel/module/kmod.c
+++ b/kernel/module/kmod.c
@@ -95,7 +95,7 @@ static int call_modprobe(char *orig_module_name, int wait)
 	argv[3] = module_name;	/* check free_modprobe_argv() */
 	argv[4] = NULL;
 
-	info = call_usermodehelper_setup(modprobe_path, argv, envp, GFP_KERNEL,
+	info = call_usermodehelper_setup(AT_FDCWD, modprobe_path, argv, envp, GFP_KERNEL,
 					 NULL, free_modprobe_argv, NULL);
 	if (!info)
 		goto free_module_name;
diff --git a/kernel/umh.c b/kernel/umh.c
index bab134fa8c36..5cdcba6005d9 100644
--- a/kernel/umh.c
+++ b/kernel/umh.c
@@ -106,7 +106,7 @@ static int call_usermodehelper_exec_async(void *data)
 	commit_creds(new);
 
 	wait_for_initramfs();
-	retval = kernel_execve(AT_FDCWD, sub_info->path,
+	retval = kernel_execve(sub_info->dirfd, sub_info->path,
 			       (const char *const *)sub_info->argv,
 			       (const char *const *)sub_info->envp);
 out:
@@ -331,6 +331,7 @@ static void helper_unlock(void)
 
 /**
  * call_usermodehelper_setup - prepare to call a usermode helper
+ * @dirfd: directory to resolve path against
  * @path: path to usermode executable
  * @argv: arg vector for process
  * @envp: environment for process
@@ -352,7 +353,7 @@ static void helper_unlock(void)
  * Function must be runnable in either a process context or the
  * context in which call_usermodehelper_exec is called.
  */
-struct subprocess_info *call_usermodehelper_setup(const char *path, char **argv,
+struct subprocess_info *call_usermodehelper_setup(int dirfd, const char *path, char **argv,
 		char **envp, gfp_t gfp_mask,
 		int (*init)(struct subprocess_info *info, struct cred *new),
 		void (*cleanup)(struct subprocess_info *info),
@@ -366,8 +367,10 @@ struct subprocess_info *call_usermodehelper_setup(const char *path, char **argv,
 	INIT_WORK(&sub_info->work, call_usermodehelper_exec_work);
 
 #ifdef CONFIG_STATIC_USERMODEHELPER
+	sub_info->dirfd = AT_FDCWD;
 	sub_info->path = CONFIG_STATIC_USERMODEHELPER_PATH;
 #else
+	sub_info->dirfd = dirfd;
 	sub_info->path = path;
 #endif
 	sub_info->argv = argv;
@@ -484,7 +487,7 @@ int call_usermodehelper(const char *path, char **argv, char **envp, int wait)
 	struct subprocess_info *info;
 	gfp_t gfp_mask = (wait == UMH_NO_WAIT) ? GFP_ATOMIC : GFP_KERNEL;
 
-	info = call_usermodehelper_setup(path, argv, envp, gfp_mask,
+	info = call_usermodehelper_setup(AT_FDCWD, path, argv, envp, gfp_mask,
 					 NULL, NULL, NULL);
 	if (info == NULL)
 		return -ENOMEM;
diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index ddbc4d7482d2..426ac83f1d2a 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -628,7 +628,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
 			goto exit;
 
 		retval = -ENOMEM;
-		info = call_usermodehelper_setup(env->argv[0], env->argv,
+		info = call_usermodehelper_setup(AT_FDCWD, env->argv[0], env->argv,
 						 env->envp, GFP_KERNEL,
 						 NULL, cleanup_uevent_env, env);
 		if (info) {
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index a7673ad86d18..f6f3d4bc0bda 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -101,7 +101,7 @@ static int call_usermodehelper_keys(const char *path, char **argv, char **envp,
 {
 	struct subprocess_info *info;
 
-	info = call_usermodehelper_setup(path, argv, envp, GFP_KERNEL,
+	info = call_usermodehelper_setup(AT_FDCWD, path, argv, envp, GFP_KERNEL,
 					  umh_keys_init, umh_keys_cleanup,
 					  session_keyring);
 	if (!info)

-- 
2.53.0


