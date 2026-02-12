Return-Path: <linux-kbuild+bounces-11133-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOOcBXg+jWmo0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11133-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B311293B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30FCD3053DE7
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9227B21C17D;
	Thu, 12 Feb 2026 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="hfDs4fGp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119C41F4174;
	Thu, 12 Feb 2026 02:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864244; cv=none; b=LrW+nnKpIGEtrhcFk+4FTosP05vHnuNYOFwQi9HxV/jdEQqh81X2gKNaaedr9lYHqcKJzK3IrrTfUb6uQOUSvmSd2iXyQT6IBcrxKsEkOG5UyVo3NPL7Vzknc/YDx5ZVrb2t+gmCDIfpOL8/xrmfeU6ZA8n8/ELkSKfc6g69O6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864244; c=relaxed/simple;
	bh=cp2/GeDn3JQXNtNCJu5K+DdqolXNRNzGZKq0NBMQvdw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nzNv3WjFpMwJQ/huREe4aD86AjQZ2rflEGVjL//YV74IswOveizarcjreq9ZHczi5QpLoWds9iD579uxN21s6qj9WgLoRs4EqHAF7BoC7v+dODLQL1W48znfy+LhhXLKwAovSJCXkog4ZmLFgJ5T0hKGG3X9cOyccUzIe1lvK2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=hfDs4fGp; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864243; x=1802400243;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Cy0xLZEkes1M86Q29CbEJklHznBu90MXzeIBnDOAMI=;
  b=hfDs4fGp54DBVionKlr/NfPE8CZUYDsz9AWYzifA03KngyuFY4YhqP/k
   fIfpbVQ55KEM+JW/cgTA+xhyuRRkKM5WdoVeqVnnUHkxoM0iR8Fl3YpzX
   QyqKm2+AlUrFtuT/R0BUKBuTsWj3rrAbusi13cGbqbXpBu/mVZU/GHwrn
   +FbOwZbh8pXS4EYjOjnwA2mxQOO0EquQwHc9GnYXbUcMm2nPp0y1S1BiR
   2524jbNtDJSsW6TxllFEN9cpTvHJaXI4HEFL88Tq1/0lZderVMDaVszgl
   5oCMQ3TwzszmN0DX64d1Td5ojyzR0Er8ViRizmrPSYAEPisXyyt0Fgrt3
   g==;
X-CSE-ConnectionGUID: DO0n+BDxSL2oEb0IiwxZoA==
X-CSE-MsgGUID: RxHMsxvoTWOmoz+JcdqtBQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913851"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:44:02 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:25144]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id 6cac2b39-f5ac-42fe-9165-49cfa67f0a48; Thu, 12 Feb 2026 02:44:02 +0000 (UTC)
X-Farcaster-Flow-ID: 6cac2b39-f5ac-42fe-9165-49cfa67f0a48
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:01 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:01 +0000
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
Subject: [PATCH 06/17] crypto: add pluggable interface for builtin crypto modules
Date: Thu, 12 Feb 2026 02:42:10 +0000
Message-ID: <20260212024228.6267-7-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11133-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 74B311293B7
X-Rspamd-Action: no action

Traditionally, builtin cryptos interact with the main kernel through
exported functions and variables via EXPORT_SYMBOL. The exported
symbols are statically tied with the main kernel, so not suitable
after those builtin cryptos moved to a standalone kernel module
(e.g., main kernel will not even be compilable since users need the
exact function/variable address).

To address this, introduce a pluggable interface between builtin
crypto functions and variables by placing address placeholders.
During runtime once the crypto kernel module is loaded, the address
placeholder gets updated (by `do_crypto_api` and `do_crypto_var`) to
correct address.

In more details, there are two types of address holders: for function
addresses, "static call" mechanism is used; for variable addresses, a
var_type* pointer is used. To apply this pluggable interface, just
wrap the function/variable header declaration with the placeholder
declaration wrappers (implemented as `DECLARE_STATIC_CALL()`/
`DECLARE_CRYPTO_VAR()`), and place the placeholder definition wrappers
for each crypto function/variable in fips140-api.c (implemented as
`DEFINE_CRYPTO_API_STUB()`/`DEFINE_CRYPTO_VAR_STUB()`). Those wrappers
will be compiled differently for main kernel and the crypto kernel
module using different compilation flags. To make such pluggable
interface only affect cryptos chosen as builtin but not crypto chosen
built as modules already, associate wrappers with CONFIG_CRYPTO_{NAME}
parameter.

In addition to the pluggable interface, this patch also adds a way to
collect crypto init functions, such as `module_init()` into a
dedicated ELF section for later module entry to initialize each
crypto.

The idea of using "static call" as pluggable interface for function
address stems from Vegard Nossum <vegard.nossum@oracle.com>, while
we additionally make the following core differences: avoid duplicate
crypto code in main kernel, allow variable pluggable, make this
feature not affect cryptos already chosen to be module-built, and
make this adapt to any .config choices.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/Makefile           |   5 +-
 crypto/fips140/fips140-api.c      |   7 ++
 include/asm-generic/vmlinux.lds.h |   1 +
 include/crypto/api.h              | 197 ++++++++++++++++++++++++++++++
 kernel/module/main.c              |  46 ++++++-
 5 files changed, 253 insertions(+), 3 deletions(-)
 create mode 100644 crypto/fips140/fips140-api.c
 create mode 100644 include/crypto/api.h

diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index 3b4a74ccf41e..fb083022efbb 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -1,5 +1,8 @@
 
 crypto-objs-y += \
-	fips140-module.o 
+	fips140-module.o \
+	fips140-api.o
+
+obj-y += fips140-api.o
 
 clean-files:= .fips140.order .fips140.symvers
\ No newline at end of file
diff --git a/crypto/fips140/fips140-api.c b/crypto/fips140/fips140-api.c
new file mode 100644
index 000000000000..a11e898ff4bc
--- /dev/null
+++ b/crypto/fips140/fips140-api.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Define static call keys for any functions which are part of the crypto
+ * API and used by the standalone FIPS module but which are not built into
+ * vmlinux.
+ */
\ No newline at end of file
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index eeb070f330bd..e25b44d29362 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -724,6 +724,7 @@
 	KERNEL_CTORS()							\
 	MCOUNT_REC()							\
 	*(.init.rodata .init.rodata.*)					\
+	BOUNDED_SECTION(__crypto_api_keys)				\
 	FTRACE_EVENTS()							\
 	TRACE_SYSCALLS()						\
 	KPROBE_BLACKLIST()						\
diff --git a/include/crypto/api.h b/include/crypto/api.h
new file mode 100644
index 000000000000..b58240ffd173
--- /dev/null
+++ b/include/crypto/api.h
@@ -0,0 +1,197 @@
+#ifndef _CRYPTO_API_H
+#define _CRYPTO_API_H
+
+#include <linux/static_call.h>
+
+#define CRYPTO_VAR_NAME(name) __crypto_##name##_ptr
+
+#define __CAT(a,b) a##b
+#define _CAT(a,b)  __CAT(a,b)
+
+#define __IF_1(...) __VA_ARGS__
+#define __IF_0(...)
+#define __IFNOT_1(...)
+#define __IFNOT_0(...) __VA_ARGS__
+
+/* Emit __VA_ARGS__ only if cfg is built into vmlinux (=y) */
+#define IF_BUILTIN(cfg, ...)     _CAT(__IF_,    IS_BUILTIN(cfg))(__VA_ARGS__)
+/* Emit __VA_ARGS__ only if cfg is NOT built in (i.e., =m or unset) */
+#define IF_NOT_BUILTIN(cfg, ...) _CAT(__IFNOT_, IS_BUILTIN(cfg))(__VA_ARGS__)
+
+#if !defined(CONFIG_CRYPTO_FIPS140_EXTMOD)
+
+/*
+ * These are the definitions that get used when no standalone FIPS module
+ * is used: we simply forward everything to normal functions and function
+ * calls.
+ */
+
+#define DECLARE_CRYPTO_API(cfg, name, ret_type, args_decl, args_call)       \
+	ret_type name args_decl;
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...) \
+	extern var_type name __VA_ARGS__;
+
+#define crypto_module_init(fn) module_init(fn)
+#define crypto_module_exit(fn) module_exit(fn)
+
+#define crypto_subsys_initcall(fn)	subsys_initcall(fn)
+#define crypto_late_initcall(fn)	late_initcall(fn)
+
+#define crypto_module_cpu_feature_match(x, __initfunc) \
+	module_cpu_feature_match(x, __initfunc)
+
+#else
+
+struct crypto_api_key {
+	struct static_call_key *key;
+	void *tramp;
+	void *func;
+};
+
+struct crypto_var_key {
+	void **ptr;
+	void *var;
+};
+
+#ifndef FIPS_MODULE
+
+/*
+ * These are the definitions that get used for vmlinux and in-tree
+ * kernel modules.
+ *
+ * In this case, all references to the kernel crypto API functions will
+ * be replaced by wrappers that perform a call using the kernel's static_call
+ * functionality.
+ */
+
+/* Consolidated version of different DECLARE_CRYPTO_API versions */
+
+/*
+ *  - If cfg is built-in (=y): declare nonfips_<name>, a static_call key,
+ *    and an inline wrapper <name>() that dispatches via static_call.
+ *  - Else (cfg =m or unset): only declare <name>() prototype.
+ */
+#define DECLARE_CRYPTO_API(cfg, name, ret_type, args_decl, args_call)       \
+	IF_BUILTIN(cfg,                                                      \
+		ret_type nonfips_##name args_decl;                           \
+		DECLARE_STATIC_CALL(crypto_##name##_key, nonfips_##name);    \
+		static inline ret_type name args_decl                        \
+		{                                                            \
+			return static_call(crypto_##name##_key) args_call;   \
+		}                                                            \
+	)                                                                   \
+	IF_NOT_BUILTIN(cfg,                                                 \
+		ret_type name args_decl;                                    \
+	)
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...) \
+	IF_BUILTIN(cfg, \
+		extern void *CRYPTO_VAR_NAME(name); \
+	) \
+	IF_NOT_BUILTIN(cfg, \
+		extern var_type name __VA_ARGS__; \
+	)
+
+#define DEFINE_CRYPTO_API_STUB(name) \
+	DEFINE_STATIC_CALL_NULL(crypto_##name##_key, name); \
+	EXPORT_STATIC_CALL(crypto_##name##_key)
+
+#define DEFINE_CRYPTO_VAR_STUB(name) \
+	void* CRYPTO_VAR_NAME(name) = NULL;\
+	EXPORT_SYMBOL(CRYPTO_VAR_NAME(name));
+
+#define crypto_module_init(fn) module_init(fn)
+#define crypto_module_exit(fn) module_exit(fn)
+
+#define crypto_subsys_initcall(fn)	subsys_initcall(fn)
+#define crypto_late_initcall(fn)	late_initcall(fn)
+
+#define crypto_module_cpu_feature_match(x, __initfunc) \
+	module_cpu_feature_match(x, __initfunc)
+	
+#else /* defined(FIPS_MODULE) */
+
+/* Consolidated version of different DECLARE_CRYPTO_API versions,
+   within FIPS module, API remains the same, only declare static 
+   call key */
+#define DECLARE_CRYPTO_API(cfg, name, ret_type, args_decl, args_call) \
+	IF_BUILTIN(cfg,                                                   \
+		ret_type name args_decl;                                      \
+		DECLARE_STATIC_CALL(crypto_##name##_key, name)                \
+	)                                                                 \
+	IF_NOT_BUILTIN(cfg,                                               \
+		ret_type name args_decl;                                      \
+	)
+
+#define DECLARE_CRYPTO_VAR(cfg, name, var_type, ...)               \
+	IF_BUILTIN(cfg,                                             \
+		extern var_type name __VA_ARGS__;                   \
+		extern void *CRYPTO_VAR_NAME(name);                  \
+	)                                                            \
+	IF_NOT_BUILTIN(cfg,                                          \
+		extern var_type name __VA_ARGS__;                   \
+	)
+
+#define DEFINE_CRYPTO_VAR_STUB(name) \
+	static struct crypto_var_key __crypto_##name##_var_key \
+		__used \
+		__section("__crypto_var_keys") \
+		__aligned(__alignof__(struct crypto_var_key)) = \
+	{ \
+		.ptr = &CRYPTO_VAR_NAME(name), \
+		.var = (void*)&name, \
+	};
+
+/*
+ * These are the definitions that get used for the main kernel.
+ *
+ * In this case, initialize crypto static call key with original name
+ */
+
+#define DEFINE_CRYPTO_API_STUB(name) \
+	static struct crypto_api_key __##name##_key \
+		__used \
+		__section("__crypto_api_keys") \
+		__aligned(__alignof__(struct crypto_api_key)) = \
+	{ \
+		.key = &STATIC_CALL_KEY(crypto_##name##_key), \
+		.tramp = STATIC_CALL_TRAMP_ADDR(crypto_##name##_key), \
+		.func = &name, \
+	};
+
+#define crypto_module_init(fn) \
+	static initcall_t __used __section(".fips_initcall1") \
+		__fips_##fn = fn;
+#define crypto_module_exit(fn) \
+		static unsigned long __used __section(".fips_exitcall") \
+		__fips_##fn = (unsigned long) &fn;
+#define crypto_subsys_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall0") \
+		__fips_##fn = fn;
+#define crypto_subsys_exitcall(fn) \
+		static unsigned long __used __section(".fips_exitcall") \
+		__fips_##fn = (unsigned long) &fn;
+#define crypto_late_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall2") \
+		__fips_##fn = fn;
+#define crypto_late_exitcall(fn) \
+		static unsigned long __used __section(".fips_exitcall") \
+		__fips_##fn = (unsigned long) &fn;
+
+#define crypto_module_cpu_feature_match(x, __initfunc) \
+static struct cpu_feature const __maybe_unused cpu_feature_match_ ## x[] = \
+	{ { .feature = cpu_feature(x) }, { } }; \
+MODULE_DEVICE_TABLE(cpu, cpu_feature_match_ ## x); \
+static int __init cpu_feature_match_ ## x ## _init(void) \
+{ \
+	if (!cpu_have_feature(cpu_feature(x))) \
+		return -ENODEV; \
+	return __initfunc(); \
+} \
+crypto_module_init(cpu_feature_match_ ## x ## _init)
+
+#endif /* defined(FIPS_MODULE) */
+#endif /* defined(CONFIG_CRYPTO_FIPS140_EXTMOD) */
+
+#endif /* !_CRYPTO_API_H */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 2914e7619766..dad84f0548ac 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -7,6 +7,7 @@
 
 #define INCLUDE_VERMAGIC
 
+#include <crypto/api.h>
 #include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
@@ -2956,6 +2957,39 @@ static int post_relocation(struct module *mod, const struct load_info *info)
 	return module_finalize(info->hdr, info->sechdrs, mod);
 }
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+static void do_crypto_api(struct load_info *info)
+{
+	struct crypto_api_key *crypto_api_keys;
+	unsigned int num_crypto_api_keys;
+
+	unsigned int i;
+
+	crypto_api_keys = section_objs(info, "__crypto_api_keys",
+		sizeof(*crypto_api_keys), &num_crypto_api_keys);
+
+	for (i = 0; i < num_crypto_api_keys; ++i) {
+		struct crypto_api_key *key = &crypto_api_keys[i];
+		__static_call_update(key->key, key->tramp, key->func);
+	}
+}
+
+static void do_crypto_var(struct load_info *info)
+{
+	struct crypto_var_key *crypto_var_keys;
+	unsigned int num_crypto_var_keys;
+	unsigned int i;
+
+	crypto_var_keys = section_objs(info, "__crypto_var_keys",
+		sizeof(*crypto_var_keys), &num_crypto_var_keys);
+
+	for (i = 0; i < num_crypto_var_keys; ++i) {
+		struct crypto_var_key *var_key = &crypto_var_keys[i];
+		*(var_key->ptr) = var_key->var;
+	}
+}
+#endif
+
 /* Call module constructors. */
 static void do_mod_ctors(struct module *mod)
 {
@@ -3010,7 +3044,7 @@ module_param(async_probe, bool, 0644);
  * Keep it uninlined to provide a reliable breakpoint target, e.g. for the gdb
  * helper command 'lx-symbols'.
  */
-static noinline int do_init_module(struct module *mod, int flags)
+static noinline int do_init_module(struct load_info *info, struct module *mod, int flags)
 {
 	int ret = 0;
 	struct mod_initfree *freeinit;
@@ -3036,6 +3070,14 @@ static noinline int do_init_module(struct module *mod, int flags)
 	freeinit->init_data = mod->mem[MOD_INIT_DATA].base;
 	freeinit->init_rodata = mod->mem[MOD_INIT_RODATA].base;
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	if (flags & MODULE_INIT_CRYPTO_FROM_MEM)
+		{
+			do_crypto_api(info);
+			do_crypto_var(info);
+		}
+#endif
+
 	do_mod_ctors(mod);
 	/* Start the module */
 	if (mod->init != NULL)
@@ -3499,7 +3541,7 @@ static int _load_module(struct load_info *info, const char __user *uargs,
 	/* Done! */
 	trace_module_load(mod);
 
-	return do_init_module(mod, flags);
+	return do_init_module(info, mod, flags);
 
  sysfs_cleanup:
 	mod_sysfs_teardown(mod);
-- 
2.47.3


