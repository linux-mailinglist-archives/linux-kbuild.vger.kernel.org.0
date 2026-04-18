Return-Path: <linux-kbuild+bounces-12824-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP5WDcTO4mm6+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12824-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DA41F5E2
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9B0D300CE5A
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC3E01C7012;
	Sat, 18 Apr 2026 00:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="XwMMriWF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FD32BD11;
	Sat, 18 Apr 2026 00:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471744; cv=none; b=nAMmiS83SDVPY0pTxw2HFWnPll0+v3QrOuYDZGt2boT/jWlgHDV5KHOGRjyKDN6O2+ZZOU7Ct3NodB2UTxRHCMHqQx347dlSccLInggCecgKCacPPtF3IeMaX4nVUNv7FlxgFYhL3SkL5vlm/LU8SFhDTtvCoCm/z+K+UFtavOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471744; c=relaxed/simple;
	bh=Q95a1fPd7YkJo0EONKt+0GvB6jMAtK+sv36NVar+E7I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwMV57GAPXU1qo5XEU/0ksPh+vodp5teHRqjsjkH3QTT25rWqSxm/zmxXKbzbSM/Zx2qpul5wA/lCGgC0fiUgouIuK3WqdrlntuXCMM/BKqCzn378XgKK5+8+Bsz+HFBN1DBMeUlKC0Df4DFXwE5Z2fKoukbsIeyJhFp2a0o2ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=XwMMriWF; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471743; x=1808007743;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fTqWYvmvHKg8OZXgeVTuyVjBmXzz6zHcOPAB0cTHcgg=;
  b=XwMMriWFw5+W/HF3DC0yAbK2oV/yxExblYA1pQq4+z2VmYk1n1B6mYRs
   OaY/oYSprFDNJSWazfAyTDj87oGCtVJd5OvtM1Qaaw5cEMV6WgIocA1ym
   UeWzMd5uNWvCR/OtCVeZ43R2o78YAY3mHAfdVbpzM/ABC9L7lAQacUoLD
   S+Lxm599/wuQyDoYotnG9a0551hAKF+c5SsApA6LsOeW8d3KVfHLncAA3
   mocGmq1f5OqRSUTiQ3IGemmDoqK+mwqZ4jQlXlDIEHF7nK5e6tBfSqtzR
   wyWtglS5dsEUHl9+YiBldJJFtcnUB98NVuMAguBw35OlGPYDDQY12iSw9
   Q==;
X-CSE-ConnectionGUID: nwiX+4hEQcmKSresJxCspg==
X-CSE-MsgGUID: 9m254sEbTmGYT3atTkrorg==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17586403"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:22:23 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:27347]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id e56849f5-5c48-4116-80ca-9d214ab04fc1; Sat, 18 Apr 2026 00:22:22 +0000 (UTC)
X-Farcaster-Flow-ID: e56849f5-5c48-4116-80ca-9d214ab04fc1
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:22 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:22 +0000
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
Subject: [PATCH v2 07/19] crypto: dedicated ELF sections for collected crypto initcalls
Date: Sat, 18 Apr 2026 00:20:15 +0000
Message-ID: <20260418002032.2877-8-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12824-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: D43DA41F5E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Cryptographic components must be properly initialized
before use. This initialization is typically achieved
through dedicated init functions registered via wrappers
such as module_init() or late_initcall(). Traditionally,
these init functions are executed automatically as part of
the kernel boot sequence. However, now that the crypto code
is moved into a standalone module (fips140.ko), there needs
to be a way to collect and later execute them from within
the module.

To collect these init functions, the init wrappers
(module_init(), subsys_initcall(), late_initcall()) are
modified so that when compiled for the FIPS module (under
-DFIPS_MODULE), they automatically place the wrapped crypto
init function pointer into a dedicated ELF section instead
of the normal initcall mechanism. A custom linker script
crypto/fips140/fips140.lds is introduced to organize these
sections. Since the init functions must be called in proper
ordering in a later patch (e.g., subsys_initcall before
module_init, and module_init before late_initcall), the
linker script allocates separate leveled sections
(.fips_initcall0, .fips_initcall1, .fips_initcall2) with
corresponding boundary symbols (e.g.,
__fips140_initcall0_start/end) to preserve the correct
execution order.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                   |  2 +-
 crypto/fips140/fips140.lds | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/module.h     | 23 +++++++++++++++++++++++
 3 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 crypto/fips140/fips140.lds

diff --git a/Makefile b/Makefile
index feacb5bd6235a..f3c43f87d6786 100644
--- a/Makefile
+++ b/Makefile
@@ -1378,7 +1378,7 @@ crypto/fips140/.fips140.symvers: fips140-ready
 	@:
 modpost: crypto/fips140/.fips140.symvers
 quiet_cmd_ld_fips140 = LD [M]  $@
-      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none --whole-archive $< --no-whole-archive -o $@
+      cmd_ld_fips140 = $(LD) -r $(KBUILD_LDFLAGS) $(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) --build-id=none -T $(srctree)/crypto/fips140/fips140.lds --whole-archive $< --no-whole-archive -o $@
 
 cmd_fips140_mod = ar -t $< > $@
 
diff --git a/crypto/fips140/fips140.lds b/crypto/fips140/fips140.lds
new file mode 100644
index 0000000000000..6b5c63b1c6028
--- /dev/null
+++ b/crypto/fips140/fips140.lds
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/*
+ * FIPS 140 module initcall section layout.
+ *
+ * The overridden subsys_initcall/module_init/late_initcall macros
+ * (include/linux/module.h) place function pointers into these
+ * sections when compiled with FIPS_MODULE defined.
+ *
+ * Section mapping:
+ *   .fips_initcall0  <-  subsys_initcall()
+ *                        Syncs with kernel subsys_initcall (initcall level 4)
+ *   .fips_initcall1  <-  module_init()
+ *                        Syncs with kernel device_initcall (initcall level 6)
+ *   .fips_initcall2  <-  late_initcall()
+ *                        Syncs with kernel late_initcall (initcall level 7)
+ *
+ * The fips140 loader thread (fips140-loader.c) starts at
+ * arch_initcall_sync (level 3) and run_initcalls() in
+ * fips140-module.c executes each level in order, synchronizing
+ * with the kernel's initcall progression via wait queues.
+ */
+
+SECTIONS {
+	.init.data : {
+		__fips140_initcalls_start = .;
+		__fips140_initcall0_start = .;
+		*(.fips_initcall0)
+		__fips140_initcall0_end = .;
+		__fips140_initcall1_start = .;
+		*(.fips_initcall1)
+		__fips140_initcall1_end = .;
+		__fips140_initcall2_start = .;
+		*(.fips_initcall2)
+		__fips140_initcall2_end = .;
+		__fips140_initcalls_end = .;
+	}
+}
\ No newline at end of file
diff --git a/include/linux/module.h b/include/linux/module.h
index 0ff24c45ef61d..6a10b70b5e92c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -115,18 +115,40 @@ extern void cleanup_module(void);
 #define postcore_initcall(fn)		module_init(fn)
 #define postcore_initcall_sync(fn)	module_init(fn)
 #define arch_initcall(fn)		module_init(fn)
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+#define subsys_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall0") \
+		__fips_##fn = fn;
+#else
 #define subsys_initcall(fn)		module_init(fn)
+#endif
 #define subsys_initcall_sync(fn)	module_init(fn)
 #define fs_initcall(fn)			module_init(fn)
 #define fs_initcall_sync(fn)		module_init(fn)
 #define rootfs_initcall(fn)		module_init(fn)
 #define device_initcall(fn)		module_init(fn)
 #define device_initcall_sync(fn)	module_init(fn)
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+#define late_initcall(fn) \
+	static initcall_t __used __section(".fips_initcall2") \
+		__fips_##fn = fn;
+#else
 #define late_initcall(fn)		module_init(fn)
+#endif
 #define late_initcall_sync(fn)		module_init(fn)
 
 #define console_initcall(fn)		module_init(fn)
 
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && defined(FIPS_MODULE) && !defined(FIPS140_CORE)
+/* FIPS module: place init/exit in special sections for fips140 loader */
+#define module_init(initfn) \
+	static initcall_t __used __section(".fips_initcall1") \
+		__fips_##initfn = initfn;
+
+#define module_exit(exitfn) \
+	static unsigned long __used __section(".fips_exitcall") \
+		__fips_##exitfn = (unsigned long)&exitfn;
+#else
 /* Each module must use one module_init(). */
 #define module_init(initfn)					\
 	static inline initcall_t __maybe_unused __inittest(void)		\
@@ -142,6 +164,7 @@ extern void cleanup_module(void);
 	void cleanup_module(void) __copy(exitfn)		\
 		__attribute__((alias(#exitfn)));		\
 	___ADDRESSABLE(cleanup_module, __exitdata);
+#endif /* CONFIG_CRYPTO_FIPS140_EXTMOD && FIPS_MODULE && !FIPS140_CORE */
 
 #endif
 
-- 
2.47.3


