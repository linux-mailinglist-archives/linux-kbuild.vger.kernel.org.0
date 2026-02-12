Return-Path: <linux-kbuild+bounces-11132-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJIaGmc+jWmo0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11132-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F19812939F
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D2EA308C283
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D3EC21ADA7;
	Thu, 12 Feb 2026 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PJW70Dad"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1AF1624C0;
	Thu, 12 Feb 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864228; cv=none; b=Ah2gYc48CQxXrgF9u6EFo7K39+9fdxPANBFRzUNu9DQMfojjGGxG4GmsEDjGk/Jf2jhO9msrXIx/VtPIeHuPgzxg7ES+o/iwAiBTS0BFgv173M16j8H844CvBCM/a871xWX8vn94atCEnonCmtGoSNcbw9WP7/QNhiKaAnEaINc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864228; c=relaxed/simple;
	bh=BCVyEwamGQyG+1IyRtRfhsrFU94ztngVDHLW/tA423o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AcHVN8m3HzGaB77RBSTzlvry40F/mpFSMsrJQ1IgtE9iM4uODWVTA+DSVQCbTXecWNIuFkeQiizhlexTtaSbf8VUIbfY0CtD4FXclIX6jIhmQEoKiGZfsY22pFN5Yyti1DFNf60U8Az4lx7weXJkUw2X+01HriXAiB+li9pMaPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PJW70Dad; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864227; x=1802400227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rjGxoBaqjFRnKAaX4Bm21Q5i2jPS8+CuyHD0wJOasUQ=;
  b=PJW70DadNW55BitOUSArId7m+6iNO5B72BI2P3vOzSYAO8mqM4GS+Zmz
   koJNDkcf3igZGu8LI+CxHQA42F9B4aeMjh3jPM2Z7IAG+/0uXCvofWZIV
   QKnryIpPlwFy0Ok5bZOpM7JOJBJhoNTqiWAbXzUonjM60U7n32RvXfmq0
   X4XrCcOFCss7ovOpViL5GEawJBHpxzuq0emjbbo0+RkiyZlUCN8EAjBon
   EvlVeyRk0q5jNlr3lcyyAW2x3er4rdIgpxRIHItFVFpQHNiGq2m9Iv5B2
   qA7xiwpGhoNgU3sQMaTIP6sP5SAShd54hqubuuf2IITcPeyBupNip9Hcu
   Q==;
X-CSE-ConnectionGUID: HzZhExd8TpW5PzotmRRTQw==
X-CSE-MsgGUID: RDMMlo9tTJmW3QuhckKugA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12721086"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:43:46 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:6488]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.20.103:2525] with esmtp (Farcaster)
 id ddf2a9ea-9728-4ce2-9420-40b896ad3fdd; Thu, 12 Feb 2026 02:43:46 +0000 (UTC)
X-Farcaster-Flow-ID: ddf2a9ea-9728-4ce2-9420-40b896ad3fdd
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:43:46 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:43:46 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Catalin Marinas <catalin.marinas@arm.com>, "Will
 Deacon" <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Luis Chamberlain
	<mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-kbuild@vger.kernel.org>, <linux-modules@vger.kernel.org>
Subject: [PATCH 05/17] module: allow kernel module loading directly from memory
Date: Thu, 12 Feb 2026 02:42:09 +0000
Message-ID: <20260212024228.6267-6-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024228.6267-1-wanjay@amazon.com>
References: <20260212024228.6267-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWA002.ant.amazon.com (10.13.139.81) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11132-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F19812939F
X-Rspamd-Action: no action

From: Vegard Nossum <vegard.nossum@oracle.com>

To enable loading the crypto module earlier before file system is ready,
add a new helper function, load_crypto_module_mem(), which can load a kernel
module from a byte array in memory. When loading in this way, we don't
do signature verification as crypto is not ready yet before loaded.
To tell that a module is loaded in this way, a new module loader flag,
MODULE_INIT_CRYPTO_FROM_MEM, is added.

Co-developed-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
[With code change and revise commit message]
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 include/linux/module.h      |   2 +
 include/uapi/linux/module.h |   5 ++
 kernel/module/main.c        | 100 +++++++++++++++++++++++++-----------
 kernel/params.c             |   3 +-
 4 files changed, 79 insertions(+), 31 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 20ddfd97630d..22a1d8459ce4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -589,6 +589,8 @@ struct module {
 
 #ifdef CONFIG_MODULES
 
+extern int load_crypto_module_mem(const char *mem, size_t size);
+
 /* Get/put a kernel symbol (calls must be symmetric) */
 void *__symbol_get(const char *symbol);
 void *__symbol_get_gpl(const char *symbol);
diff --git a/include/uapi/linux/module.h b/include/uapi/linux/module.h
index 03a33ffffcba..30e9a7813eac 100644
--- a/include/uapi/linux/module.h
+++ b/include/uapi/linux/module.h
@@ -7,4 +7,9 @@
 #define MODULE_INIT_IGNORE_VERMAGIC	2
 #define MODULE_INIT_COMPRESSED_FILE	4
 
+#ifdef __KERNEL__
+/* Internal flags */
+#define MODULE_INIT_CRYPTO_FROM_MEM			30
+#endif
+
 #endif /* _UAPI_LINUX_MODULE_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 710ee30b3bea..2914e7619766 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2572,11 +2572,14 @@ static void module_augment_kernel_taints(struct module *mod, struct load_info *i
 
 static int check_modinfo(struct module *mod, struct load_info *info, int flags)
 {
-	const char *modmagic = get_modinfo(info, "vermagic");
+	const char *modmagic = NULL;
 	int err;
 
-	if (flags & MODULE_INIT_IGNORE_VERMAGIC)
-		modmagic = NULL;
+	if (flags & MODULE_INIT_CRYPTO_FROM_MEM)
+		return 0;
+
+	if (!(flags & MODULE_INIT_IGNORE_VERMAGIC))
+		modmagic = get_modinfo(info, "vermagic");
 
 	/* This is allowed: modprobe --force will invalidate it. */
 	if (!modmagic) {
@@ -3007,7 +3010,7 @@ module_param(async_probe, bool, 0644);
  * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  * helper command 'lx-symbols'.
  */
-static noinline int do_init_module(struct module *mod)
+static noinline int do_init_module(struct module *mod, int flags)
 {
 	int ret = 0;
 	struct mod_initfree *freeinit;
@@ -3070,8 +3073,10 @@ static noinline int do_init_module(struct module *mod)
 	ftrace_free_mem(mod, mod->mem[MOD_INIT_TEXT].base,
 			mod->mem[MOD_INIT_TEXT].base + mod->mem[MOD_INIT_TEXT].size);
 	mutex_lock(&module_mutex);
-	/* Drop initial reference. */
-	module_put(mod);
+	/* Drop initial reference for normal modules to allow unloading.
+	 * Keep reference for MODULE_INIT_CRYPTO_FROM_MEM modules to prevent unloading. */
+	if (!(flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		module_put(mod);  
 	trim_init_extable(mod);
 #ifdef CONFIG_KALLSYMS
 	/* Switch to core kallsyms now init is done: kallsyms may be walking! */
@@ -3347,31 +3352,17 @@ static int early_mod_check(struct load_info *info, int flags)
 /*
  * Allocate and load the module: note that size of section 0 is always
  * zero, and we rely on this for optional sections.
+ *
+ * NOTE: module signature verification must have been done already.
  */
-static int load_module(struct load_info *info, const char __user *uargs,
-		       int flags)
+static int _load_module(struct load_info *info, const char __user *uargs,
+			int flags)
 {
 	struct module *mod;
 	bool module_allocated = false;
 	long err = 0;
 	char *after_dashes;
 
-	/*
-	 * Do the signature check (if any) first. All that
-	 * the signature check needs is info->len, it does
-	 * not need any of the section info. That can be
-	 * set up later. This will minimize the chances
-	 * of a corrupt module causing problems before
-	 * we even get to the signature check.
-	 *
-	 * The check will also adjust info->len by stripping
-	 * off the sig length at the end of the module, making
-	 * checks against info->len more correct.
-	 */
-	err = module_sig_check(info, flags);
-	if (err)
-		goto free_copy;
-
 	/*
 	 * Do basic sanity checks against the ELF header and
 	 * sections. Cache useful sections and set the
@@ -3405,7 +3396,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	 * We are tainting your kernel if your module gets into
 	 * the modules linked list somehow.
 	 */
-	module_augment_kernel_taints(mod, info);
+	if (!(flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		module_augment_kernel_taints(mod, info);
 
 	/* To avoid stressing percpu allocator, do this once we're unique. */
 	err = percpu_modalloc(mod, info);
@@ -3452,7 +3444,11 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	flush_module_icache(mod);
 
 	/* Now copy in args */
-	mod->args = strndup_user(uargs, ~0UL >> 1);
+	if ((flags & MODULE_INIT_CRYPTO_FROM_MEM))
+		mod->args = kstrdup("", GFP_KERNEL);
+	else
+		mod->args = strndup_user(uargs, ~0UL >> 1);
+
 	if (IS_ERR(mod->args)) {
 		err = PTR_ERR(mod->args);
 		goto free_arch_cleanup;
@@ -3500,13 +3496,10 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	if (codetag_load_module(mod))
 		goto sysfs_cleanup;
 
-	/* Get rid of temporary copy. */
-	free_copy(info, flags);
-
 	/* Done! */
 	trace_module_load(mod);
 
-	return do_init_module(mod);
+	return do_init_module(mod, flags);
 
  sysfs_cleanup:
 	mod_sysfs_teardown(mod);
@@ -3562,7 +3555,54 @@ static int load_module(struct load_info *info, const char __user *uargs,
 		audit_log_kern_module(info->name ? info->name : "?");
 		mod_stat_bump_becoming(info, flags);
 	}
+	return err;
+}
+
+/*
+ * Load crypto module from kernel memory without signature check.
+ */
+int __init load_crypto_module_mem(const char *mem, size_t size)
+{
+	int err;
+	struct load_info info = { };
+
+	if (!mem) {
+		pr_err("load_crypto_module_mem: mem parameter is NULL\n");
+		return -EINVAL;
+	}
+
+	info.sig_ok = true;
+	info.hdr = (Elf_Ehdr *) mem;
+	info.len = size;
+
+	err = _load_module(&info, NULL, MODULE_INIT_CRYPTO_FROM_MEM);
+	return err;
+}
+
+static int load_module(struct load_info *info, const char __user *uargs,
+		       int flags)
+{
+	int err;
+
+	/*
+	 * Do the signature check (if any) first. All that
+	 * the signature check needs is info->len, it does
+	 * not need any of the section info. That can be
+	 * set up later. This will minimize the chances
+	 * of a corrupt module causing problems before
+	 * we even get to the signature check.
+	 *
+	 * The check will also adjust info->len by stripping
+	 * off the sig length at the end of the module, making
+	 * checks against info->len more correct.
+	 */
+	err = module_sig_check(info, flags);
+	if (!err)
+		err = _load_module(info, uargs, flags);
+
+	/* Get rid of temporary copy. */
 	free_copy(info, flags);
+
 	return err;
 }
 
diff --git a/kernel/params.c b/kernel/params.c
index 7c2242f64bf0..b0671d752ff1 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -967,7 +967,8 @@ static int __init param_sysfs_init(void)
 
 	return 0;
 }
-subsys_initcall(param_sysfs_init);
+/* Use arch_initcall instead of subsys_initcall for early module loading */
+arch_initcall(param_sysfs_init);
 
 /*
  * param_sysfs_builtin_init - add sysfs version and parameter
-- 
2.47.3


