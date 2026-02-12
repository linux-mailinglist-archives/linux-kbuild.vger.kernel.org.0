Return-Path: <linux-kbuild+bounces-11139-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4L9rOtM+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11139-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E211129455
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A72173022624
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B015191484;
	Thu, 12 Feb 2026 02:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="TGN3c34e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1086A137750;
	Thu, 12 Feb 2026 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864337; cv=none; b=pEUdDaiVokc9qodZEr+yZmrus/OY8V8E6Oe0WSi1E0uYHLYZN5qU2bSWl1bUswYzDUgFdHa7LbzlL2qds3C8PmolsgZ3TBmgGhCGw8ZtOGfXZfTvnyqV+Pb8skGx6YnKo+Lfm+s+PDvpGDPtfAdaBg95tiwnCAfEl+h/gygYnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864337; c=relaxed/simple;
	bh=HxLNVJmp4z3p5bWik8Tb773zPedqaZzlnSOX/UzN4/g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Apps8Tk42TE8PTpt6sBFBqW3V4SOFwglorCcKSkHa8J3CTy86ZNyPYCW7Jl9u+4JJS0X3ld4IThJpeKcohsct45yVHpTLo4PyjuzzB/pk8ml4av6gfPRR4XhU9x7mNkUSSoLRO1NMPKYYc72M/PfkZC8kCgJjrh2SL3HsdWTS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=TGN3c34e; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864336; x=1802400336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+8sQBfTO8DEdAfK+iLEVvvM8f2iA6e8n+273DKpur94=;
  b=TGN3c34ejMUQOalZ7bruTKUu0enxwKhwHu7Duh2MQdz1A4tE3E2EP9ob
   xonXkDW7Y3GuQZ60M/a0/iF09OBmE/wNJQ/BSHBA3WjW3Z0eiTGep0fnD
   bQuH/zLJuGpOjEgDszDwKXTlvUFy7/Bn00fAe8j24anxgIOu8G3SS/ZP5
   p/SSpMrScRQfCzleNZCyRKFS5x8FbhGu0Nr4+THW8PlegFJjTaQtSGYH4
   9VQYzt0MtmdfUzQMfw+wNFl/lCUNtD3e30tbAoiZpLb9NFawsqsSHM9Hb
   CFXeTW5EIb8eM7iv8YY1Jb8apb02lFhoK2iMVeQAxP2VuTQWIevKiAdyp
   Q==;
X-CSE-ConnectionGUID: x6vqso+ASkaQblCT4JBAMQ==
X-CSE-MsgGUID: O3MGKhbORhW5VJRucVWKHw==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12912815"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:35 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:14427]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 4ddb9a8f-0eac-49c3-8f98-09c5ecdbf1fa; Thu, 12 Feb 2026 02:45:35 +0000 (UTC)
X-Farcaster-Flow-ID: 4ddb9a8f-0eac-49c3-8f98-09c5ecdbf1fa
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:34 +0000
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
Subject: [PATCH 12/17] Execute crypto initcalls during module initialization
Date: Thu, 12 Feb 2026 02:42:16 +0000
Message-ID: <20260212024228.6267-13-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWB002.ant.amazon.com (10.13.139.181) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11139-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E211129455
X-Rspamd-Action: no action

After moving builtin cryptos into the standalone crypto module, to ensure
all such cryptos are properly initialized as they were builtin, the
initcalls of the cryptos should be executed at proper booting time.

To do so, this patch adds run_initcalls() function to execute the
initialization calls of the collected cryptos right after the module is
loaded. The function iterates through initcalls in the __fips_initcalls
section (which stores all function addresses of the collected crypto
initcalls) and executes them.

A key consideration is to ensure the crypto initcalls are executed in
proper order, for instance, some crypto initcalls are ought to execute
at `late_initcall` boot time level while some should be executed at
`module_init` boot time level. To do so, this patch enables coordination
between kernel and the crypto module initialization to preserve proper
execution order by hijacking the kernel initialization function
`do_initcall_level` with added synchronization helpers.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-loader.c | 92 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.c | 50 ++++++++++++++++++
 crypto/fips140/fips140-module.h | 12 +++++
 include/linux/init.h            | 10 ++++
 init/main.c                     |  4 ++
 5 files changed, 168 insertions(+)

diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 826075928723..d9a477421063 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -107,3 +107,95 @@ static int __init fips_loader_init(void)
 	vfree(vmalloc_mem); // Free after successful module loading
 	return ret;
 }
+
+/* FIPS140 synchronization between kernel and module
+ *
+ * Synchronization levels map kernel initcall levels to FIPS module levels:
+ * - Level 0: subsys_initcall (kernel init level 4) - Basic subsystem initialization
+ * - Level 1: device_initcall (kernel init level 6) - Device driver initialization  
+ * - Level 2: late_initcall (kernel init level 7) - Late system initialization
+ *
+ * The kernel marks each level complete and waits for the FIPS module to
+ * complete the corresponding level before proceeding to ensure proper
+ * initialization ordering between kernel crypto and FIPS module.
+ */
+atomic_t fips140_kernel_level_complete = ATOMIC_INIT(0);
+atomic_t fips140_module_level_complete = ATOMIC_INIT(0);
+
+/* Wait queues for efficient synchronization */
+DECLARE_WAIT_QUEUE_HEAD(fips140_kernel_wq);
+DECLARE_WAIT_QUEUE_HEAD(fips140_module_wq);
+
+void fips140_mark_kernel_level_complete(int level)
+{
+	atomic_or(1 << level, &fips140_kernel_level_complete);
+	wake_up(&fips140_kernel_wq);
+}
+
+bool fips140_is_kernel_level_complete(int level)
+{
+	return atomic_read(&fips140_kernel_level_complete) & (1 << level);
+}
+
+bool fips140_is_module_level_complete(int level)
+{
+	return atomic_read(&fips140_module_level_complete) & (1 << level);
+}
+
+void fips140_mark_module_level_complete(int level)
+{
+	atomic_or(1 << level, &fips140_module_level_complete);
+	wake_up(&fips140_module_wq);
+}
+
+static int __init fips140_sync_thread(void *data)
+{
+	pr_info("FIPS 140: starting sync thread\n");
+	
+	/* Call FIPS loader explicitly */
+	int ret = fips_loader_init();
+	if (ret)
+		panic("FIPS 140: loader initialization failed: %d\n", ret);
+	
+	pr_info("FIPS 140: sync thread finished\n");
+	return 0;
+}
+
+void __init start_fips140_loader(void)
+{
+	struct task_struct *task;
+	
+	task = kthread_run(fips140_sync_thread, NULL, "fips140_sync");
+	if (IS_ERR(task)) {
+		panic("FIPS 140: failed to create sync thread\n");
+	}
+}
+
+void __init wait_until_fips140_level_sync(int level)
+{
+	/* Map kernel initcall levels to FIPS module levels */
+	int fips_level = -1;
+	if (level == 3) /* Start FIPS loader thread at arch_initcall_sync level */
+		start_fips140_loader(); 
+	if (level == 4) /* subsys_initcall */
+		fips_level = 0;
+	else if (level == 6) /* device_initcall */
+		fips_level = 1;
+	else if (level == 7) /* late_initcall */
+		fips_level = 2;
+
+	if (fips_level >= 0) {
+		/* Mark kernel level complete and wait for module level completion */
+		fips140_mark_kernel_level_complete(fips_level);
+		wait_event(fips140_module_wq, fips140_is_module_level_complete(fips_level));
+	}
+}
+
+EXPORT_SYMBOL(fips140_kernel_level_complete);
+EXPORT_SYMBOL(fips140_module_level_complete);
+EXPORT_SYMBOL(fips140_kernel_wq);
+EXPORT_SYMBOL(fips140_module_wq);
+EXPORT_SYMBOL(fips140_mark_kernel_level_complete);
+EXPORT_SYMBOL(fips140_is_kernel_level_complete);
+EXPORT_SYMBOL(fips140_is_module_level_complete);
+EXPORT_SYMBOL(fips140_mark_module_level_complete);
\ No newline at end of file
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index a942de8780ef..e0e669ba1b5e 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,9 +16,59 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static int __init run_initcalls(void)
+{
+	typedef int (*initcall_t)(void);
+	
+	extern initcall_t __fips140_initcall0_start[], __fips140_initcall0_end[];
+	extern initcall_t __fips140_initcall1_start[], __fips140_initcall1_end[];
+	extern initcall_t __fips140_initcall2_start[], __fips140_initcall2_end[];
+
+	initcall_t *starts[] = {
+		__fips140_initcall0_start,
+		__fips140_initcall1_start,
+		__fips140_initcall2_start,
+	};
+	
+	initcall_t *ends[] = {
+		__fips140_initcall0_end,
+		__fips140_initcall1_end,
+		__fips140_initcall2_end,
+	};
+
+	pr_info("FIPS 140: run_initcalls starting\n");
+
+	for (int level = 0; level < ARRAY_SIZE(starts); level++) {
+		
+		/* Run FIPS initcalls for this level */
+		for (initcall_t *initcall = starts[level]; initcall < ends[level]; ++initcall) {
+			int ret;
+			initcall_t fn = *initcall;
+			
+			ret = fn();
+			if (!ret || ret == -ENODEV)
+				continue;
+
+			pr_err("FIPS 140: initcall %pS failed: %d\n", fn, ret);
+		}
+	
+		if (level < 2)
+			fips140_mark_module_level_complete(level);
+		/* Wait for kernel to complete this level */
+		wait_event(fips140_kernel_wq, fips140_is_kernel_level_complete(level));
+	}
+
+	pr_info("FIPS 140: run_initcalls finished\n");
+	return 0;
+}
+
 /* Initialize the FIPS 140 module */
 static int __init fips140_init(void)
 {
+    pr_info("loading " FIPS140_MODULE_NAME "\n");
+
+	run_initcalls();
+	fips140_mark_module_level_complete(2);
     return 0;
 }
 
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index ed2b6e17969f..e95dac8eeda9 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -10,5 +10,17 @@
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
 #include <linux/init.h>
+#include <linux/atomic.h>
+#include <linux/wait.h>
+
+/* FIPS140 synchronization between kernel and module */
+extern atomic_t fips140_kernel_level_complete;
+extern atomic_t fips140_module_level_complete;
+extern wait_queue_head_t fips140_kernel_wq;
+
+void fips140_mark_kernel_level_complete(int level);
+bool fips140_is_kernel_level_complete(int level);
+bool fips140_is_module_level_complete(int level);
+void fips140_mark_module_level_complete(int level);
 
 #endif /* _CRYPTO_FIPS140_MODULE_H */
diff --git a/include/linux/init.h b/include/linux/init.h
index 40331923b9f4..eefbdfac1d41 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -392,4 +392,14 @@ void __init parse_early_options(char *cmdline);
 #define __exit_p(x) NULL
 #endif
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(__ASSEMBLY__)
+/* FIPS140 synchronization between kernel and module */
+void fips140_mark_kernel_level_complete(int level);
+bool fips140_is_kernel_level_complete(int level);
+bool fips140_is_module_level_complete(int level);
+void fips140_mark_module_level_complete(int level);
+void start_fips140_loader(void);
+void wait_until_fips140_level_sync(int level);
+#endif /* CONFIG_CRYPTO_FIPS140_EXTMOD && !__ASSEMBLY__ */
+
 #endif /* _LINUX_INIT_H */
diff --git a/init/main.c b/init/main.c
index b84818ad9685..0324226fe7b9 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1438,6 +1438,10 @@ static void __init do_initcall_level(int level, char *command_line)
 	do_trace_initcall_level(initcall_level_names[level]);
 	for (fn = initcall_levels[level]; fn < initcall_levels[level+1]; fn++)
 		do_one_initcall(initcall_from_entry(fn));
+
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	wait_until_fips140_level_sync(level);
+#endif
 }
 
 static void __init do_initcalls(void)
-- 
2.47.3


