Return-Path: <linux-kbuild+bounces-12830-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM71N2DP4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12830-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:25:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A01441F6A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D95593015CBC
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417DF1E5B63;
	Sat, 18 Apr 2026 00:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="fblhjJHD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D343345BE3;
	Sat, 18 Apr 2026 00:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.245.243.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471838; cv=none; b=FcNqwe67yCcuZ47WhCnUNsouUnmjO/dKSs00FipefDx4n/YvRL/EeO3oUaAlJnycyB9l6FiFfX1w0eL2x/AHHIeHKpitdX1+YLCHu5BHKSJWrigHM2jqSe23tPjRm0O38xW23mr9o1Jyjj//XyfYUiIMwvUwJNnUXp56RqYhEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471838; c=relaxed/simple;
	bh=MgnEMRzvVfgMCtR1Tz+gnfc7m486WIjZpMLxPDTEENA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laUte7Yev5n9DK5Yc3HfsYLvwfwYTI5RCfeF1v8BodalcAbq4xJtbuNA+4GoDvdzB08+Z8mFZvF2iip9BmQDjPqRUbP6i59wsLKA35t1HCBi28AUnnKEh20jkiT9fKYqWWLTpr81AF24dBfJA9xzZwB/+AFRFGLmo5O+SeZTBrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=fblhjJHD; arc=none smtp.client-ip=44.245.243.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471836; x=1808007836;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C8ML/v8CMjKBgMZ6fCfb/wXQKu3jynI5XrRaMAZACdQ=;
  b=fblhjJHDBPLNs7z0+Uj2VKd/JLNF7OvzjUx+4fs1xQDxcniy/AjX09EQ
   8sJvpK+pc8KWIIjOISCn5Z6j3/tdVjNGm4VS6biAe3A9NbywM0nNAccRo
   8fwi66ofjlmHsWe4HhOlRZR3mmDFpZ9foR4bXtrYVywElRXfB0RU1RwGD
   xLBPvUqw7kimWT+AW+ff1G20sFjI5ueQcaOvc8oYpdkreSlPAb4X/fq22
   zDm3dgw80eDVm0sVNLcIbRnNWE/6HzYTozrKNTVO/i+GpBoJx6v6MvD7a
   +dTIN6ct3sylUs95Rh9rxiPt+N7L1Fj+g3rBUW8dAJSjxNKzXZuBQHtzK
   A==;
X-CSE-ConnectionGUID: f33gnUlnSVu+tK+dYfk13A==
X-CSE-MsgGUID: O+kysqVoTwSziLUuks6ZnA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17123698"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:23:56 +0000
Received: from EX19MTAUWC001.ant.amazon.com [205.251.233.105:19226]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.131:2525] with esmtp (Farcaster)
 id 5cc596c0-8d7c-4ff2-883f-4c39741ad746; Sat, 18 Apr 2026 00:23:56 +0000 (UTC)
X-Farcaster-Flow-ID: 5cc596c0-8d7c-4ff2-883f-4c39741ad746
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:56 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:55 +0000
From: Jay Wang <wanjay@amazon.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, <linux-crypto@vger.kernel.org>, Masahiro Yamada
	<masahiroy@kernel.org>, <linux-kbuild@vger.kernel.org>
CC: Jay Wang <jay.wang.upstream@gmail.com>, Vegard Nossum
	<vegard.nossum@oracle.com>, Nicolai Stange <nstange@suse.de>, Ilia Okomin
	<ilya.okomin@oracle.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Bjoern Doebel <doebel@amazon.de>, Martin Pohlack <mpohlack@amazon.de>,
	Benjamin Herrenschmidt <benh@amazon.com>, Nathan Chancellor
	<nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
	<hpa@zytor.com>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu
	<petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen
	<samitolvanen@google.com>, David Howells <dhowells@redhat.com>, "David
 Woodhouse" <dwmw2@infradead.org>, Jarkko Sakkinen <jarkko@kernel.org>, "Ignat
 Korchagin" <ignat@linux.win>, Lukas Wunner <lukas@wunner.de>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	"Andrii Nakryiko" <andrii@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<linux-modules@vger.kernel.org>
Subject: [PATCH v2 13/19] Execute crypto initcalls during module initialization
Date: Sat, 18 Apr 2026 00:20:21 +0000
Message-ID: <20260418002032.2877-14-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260418002032.2877-1-wanjay@amazon.com>
References: <20260418002032.2877-1-wanjay@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D038UWB002.ant.amazon.com (10.13.139.185) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12830-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A01441F6A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 crypto/fips140/fips140-loader.c | 93 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.c | 67 ++++++++++++++++++++++++
 crypto/fips140/fips140-module.h | 12 +++++
 include/linux/init.h            | 10 ++++
 init/main.c                     |  4 ++
 5 files changed, 186 insertions(+)

diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 490fb7276befb..ab9a3f9c5599e 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -100,3 +100,96 @@ static int fips_loader_init(void)
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
+static int fips140_sync_thread(void *data)
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
+	if (level == 3) { /* Start FIPS loader thread at arch_initcall_sync level */
+		start_fips140_loader();
+		fips_level = 0;
+	} else if (level == 4) /* subsys_initcall */
+		fips_level = 1;
+	else if (level == 6) /* device_initcall */
+		fips_level = 2;
+	else if (level == 7) /* late_initcall */
+		fips_level = 3;
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
index a942de8780efb..8767d98baacd9 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,9 +16,76 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+/*
+ * Run FIPS module initcalls level by level, synchronizing with the
+ * kernel's initcall progression.
+ *
+ * Initcall section mapping (see include/linux/module.h):
+ *   Level 0 (.fips_initcall0) <- subsys_initcall()
+ *                                Syncs with kernel subsys_initcall (initcall level 4)
+ *   Level 1 (.fips_initcall1) <- module_init()
+ *                                Syncs with kernel device_initcall (initcall level 6)
+ *   Level 2 (.fips_initcall2) <- late_initcall()
+ *                                Syncs with kernel late_initcall (initcall level 7)
+ */
+
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
+			fips140_mark_module_level_complete(level + 1);
+		/* Wait for kernel to complete this level */
+		wait_event(fips140_kernel_wq, fips140_is_kernel_level_complete(level + 1));
+	}
+
+	pr_info("FIPS 140: run_initcalls finished\n");
+	return 0;
+}
+
 /* Initialize the FIPS 140 module */
 static int __init fips140_init(void)
 {
+	/* Signal that module is loaded and address placeholders are populated */
+	fips140_mark_module_level_complete(0);
+	wait_event(fips140_kernel_wq, fips140_is_kernel_level_complete(0));
+
+    pr_info("loading " FIPS140_MODULE_NAME "\n");
+
+	run_initcalls();
+	fips140_mark_module_level_complete(3);
     return 0;
 }
 
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index ed2b6e17969fc..e95dac8eeda9e 100644
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
index 40331923b9f4a..eefbdfac1d41b 100644
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
index 96f93bb06c490..8ef50419b42e4 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1452,6 +1452,10 @@ static void __init do_initcall_level(int level, char *command_line)
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


