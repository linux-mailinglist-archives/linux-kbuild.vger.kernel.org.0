Return-Path: <linux-kbuild+bounces-11138-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ8nD8g+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11138-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C20D212943E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:45:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72FF0308ECD1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCAC115E5DC;
	Thu, 12 Feb 2026 02:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="LPdAJjMm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55512126C03;
	Thu, 12 Feb 2026 02:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864324; cv=none; b=pwxmOQhGSVkYO1GgPG+AssaedmhJJoMYZxYI1LsWhpOqiurT/OzaSp/Spc1kFs8qpeLPn36cHTk4AeXRK8cDfqF5O69dT26bXOR0E5OOR3aSHeauPjm3D04nkn/ZXLU2Dn7CAjrelqij2s3ywpBnFTsIk3Yy9+K992G0uhgnwY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864324; c=relaxed/simple;
	bh=5e2BnOiU09mlyt3iEEK8vp5cQMafthh7oMDNQWyoyso=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Irko+l5fxQny/YQxP+Gbu7N8pBEFgkfG7O7XuiRUlQ01RfXMfSVghobwbqSZR2shNX0ZL3twlLFgFQE1PY3WzaBcNdhLR/NXTFAsejbG7AmzW6lf5teukL3E9lI57tL8a/EJqZB5vJUic2kp/mMyAetDnryWGf3VEIJXmRhRQ8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=LPdAJjMm; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864323; x=1802400323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dUVVYrou3F9B/zJPOEIF/8Hy2WYMjNWA7VcIsydNM+0=;
  b=LPdAJjMmvr5OIaSfz3i70Zc9Hd2d2ObnJB8JB63JBBZzKCTanV1+wgX4
   wEHfs5QA9oVjGHile1R+vPTNRxGZhWJVTyVQgXEZaHZRcQKI73Md1oIdP
   9/JrxrOIAXQPSTelw7S5F/IB3O5fS6UfUUYgBOZk+weoVt4kS0DijUZIH
   hjTqZo7nBpdypqf2UcsOVsvSlMYVK14bxHXcAdMcEq8x9ZgocrkJwVejt
   OwQmoxpwTWDhJ2uiyFaPTOQnUI4rvMLv4MyM78SOA3w0YG3wTTSO7ImRn
   nKx+znMD/H/Y8Xttd/h4OlzLTYQ4bMpWWkMhImfKEFJ/hjQQAE9CrJcaW
   g==;
X-CSE-ConnectionGUID: r49rjnGcSe+uUt+gIMRefA==
X-CSE-MsgGUID: PgdNvhx/T2OP9vkmZT6XtQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12793234"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:45:20 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:6533]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.54.219:2525] with esmtp (Farcaster)
 id e1d0f926-0f86-408b-93b3-242c265af0cb; Thu, 12 Feb 2026 02:45:19 +0000 (UTC)
X-Farcaster-Flow-ID: e1d0f926-0f86-408b-93b3-242c265af0cb
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:19 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:45:19 +0000
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
Subject: [PATCH 11/17] Allow selective crypto module loading at boot based on FIPS mode
Date: Thu, 12 Feb 2026 02:42:15 +0000
Message-ID: <20260212024228.6267-12-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D037UWC004.ant.amazon.com (10.13.139.254) To
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
	TAGGED_FROM(0.00)[bounces-11138-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C20D212943E
X-Rspamd-Action: no action

Introduce CONFIG_CRYPTO_FIPS140_DUAL_VERSION to enable dual crypto module
versions within a single kernel build, allowing boot-time selection based on
FIPS mode status.

This configuration allows FIPS mode to use pre-compiled certified crypto
modules from external source, while regular mode uses freshly built kernel
crypto implementation for optimal performance and latest security features.

The implementation embeds both certified and non-certified fips140.ko
modules in vmlinux and adds new linker sections (.nonfips140_embedded,
.nonfips140_btf) for non-FIPS crypto module storage. It modifies
fips140-loader.c to select appropriate module at boot time based on
fips_enabled flag, updates build system to generate and embed both module
versions, and includes BTF support for both module variants when
CONFIG_DEBUG_INFO_BTF_MODULES is enabled.

For modular crypto algorithms (e.g., aes.ko), they are not automatically
duplicated. They should either be built-in to fips140.ko for automatic
duplication, or require userspace utilities like modprobe to handle
proper isolation between FIPS and non-FIPS modular crypto implementations.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                        | 13 +++++++++++++
 arch/arm64/kernel/vmlinux.lds.S | 16 ++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S   | 16 ++++++++++++++++
 crypto/fips140/Kconfig          | 24 ++++++++++++++++++++++++
 crypto/fips140/Makefile         |  5 ++++-
 crypto/fips140/fips140-loader.c | 28 +++++++++++++++++++++++++++-
 scripts/Makefile.vmlinux        | 29 +++++++++++++++++++++++++++--
 scripts/link-vmlinux.sh         |  6 ++++++
 8 files changed, 133 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 7530009d8081..b3a9f7a17ddf 100644
--- a/Makefile
+++ b/Makefile
@@ -1293,6 +1293,9 @@ vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 vmlinux: crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+vmlinux: crypto/fips140/nonfips140-embedded.o
+endif
 fips140_build = .
 ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
 fips140_build = fips140_build
@@ -1302,6 +1305,14 @@ crypto/fips140/fips140-embedded.o: fips140-ready
 	@$(LD) -r -b binary -o $@ $(fips140_build)/crypto/fips140/fips140.ko
 	@$(OBJCOPY) --rename-section .data=.fips140_module_data $@
 
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+crypto/fips140/nonfips140-embedded.o: fips140-ready
+	@echo "  LD      $@"
+	@$(LD) -r -b binary -o $@ crypto/fips140/fips140.ko
+	@$(OBJCOPY) --rename-section .data=.nonfips140_module_data \
+		--prefix-symbols nonfips140_ $@
+endif
+
 crypto/fips140/.fips140.hmac: crypto/fips140/fips140-embedded.o
 	@echo "  HMAC    $@"
 	@hmac_key=$$(awk -F'"' '/^CONFIG_CRYPTO_FIPS140_HMAC_KEY=/{print $$2}' .config); \
@@ -1319,9 +1330,11 @@ fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fip
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) KBUILD_MODULES=y crypto-module-gen=1 -f $(srctree)/scripts/Makefile.modfinal
 endif
+ifndef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
 ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
 	cp "$(fips140_build)/crypto/fips140/fips140.ko" crypto/fips140/fips140.ko;
 endif
+endif
 
 # Generate fips140.o from crypto-module.a files
 crypto/fips140/fips140.o: crypto-module.a FORCE
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index 41223fa3f14e..0722e07c5551 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -222,6 +222,22 @@ SECTIONS
 		__stop_fips140_btf = .;
 	}
 #endif
+#ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+	.nonfips140_embedded : {
+		. = ALIGN(8);
+		_binary_nonfips140_ko_start = .;
+		KEEP(*(.nonfips140_module_data))
+		_binary_nonfips140_ko_end = .;
+	}
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	.nonfips140_btf : {
+		. = ALIGN(8);
+		__start_nonfips140_btf = .;
+		KEEP(*(.nonfips140_btf))
+		__stop_nonfips140_btf = .;
+	}
+#endif
+#endif
 #endif
 
 	HYPERVISOR_RODATA_SECTIONS
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index e07c1b5c52cf..aa1b97d7aabd 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -193,6 +193,22 @@ SECTIONS
 		__stop_fips140_btf = .;
 	}
 #endif
+#ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+	.nonfips140_embedded : AT(ADDR(.nonfips140_embedded) - LOAD_OFFSET) {
+		. = ALIGN(8);
+		_binary_nonfips140_ko_start = .;
+		KEEP(*(.nonfips140_module_data))
+		_binary_nonfips140_ko_end = .;
+	}
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+	.nonfips140_btf : AT(ADDR(.nonfips140_btf) - LOAD_OFFSET) {
+		. = ALIGN(8);
+		__start_nonfips140_btf = .;
+		KEEP(*(.nonfips140_btf))
+		__stop_nonfips140_btf = .;
+	}
+#endif
+#endif
 #endif
 
 	/* Data */
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
index 68b877f0dbab..7d8997aa1094 100644
--- a/crypto/fips140/Kconfig
+++ b/crypto/fips140/Kconfig
@@ -42,3 +42,27 @@ config CRYPTO_FIPS140_EXTMOD_SOURCE
 	    - fips140_build/crypto/sha256.ko
 	  
 	  If unsure, say N.
+config CRYPTO_FIPS140_DUAL_VERSION
+	bool "Enable dual crypto versions for FIPS and regular modes"
+	depends on CRYPTO_FIPS140_EXTMOD && CRYPTO_FIPS140_EXTMOD_SOURCE
+	default n
+	help
+	  Enable keeping two crypto module versions in the same kernel build
+	  for boot-time switching based on FIPS mode status. This allows:
+	  - Non-FIPS users: Get latest crypto algorithms built from current
+	    kernel sources for optimal performance and security features
+	  - FIPS users: Get pre-compiled certified crypto modules that have
+	    undergone formal validation and certification processes
+
+	  When enabled:
+
+	  For core fips140.ko:
+	  - FIPS mode: Uses certified module from CRYPTO_FIPS140_EXTMOD_SOURCE
+	  - Regular mode: Uses freshly built kernel crypto implementation
+
+	  For modular algorithms (e.g., aes.ko), they are not duplicated
+	  automatically. Either make them built-in to be included into
+	  fips140.ko for automatic duplication, or require OS utilities such
+	  as `modprobe` to correctly isolate modular cryptos in filesystems.
+
+	  If unsure, say N.
\ No newline at end of file
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index ac8ae42eb0fa..c99bf2948432 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -15,4 +15,7 @@ $(obj)/fips140-api-fips.o: $(src)/fips140-api.c FORCE
 CFLAGS_fips140-api-main.o += -I$(srctree)
 CFLAGS_fips140-api-fips.o += -I$(srctree)
 
-clean-files:= .fips140.order .fips140.symvers .fips140.hmac .fips140.ko.btf
\ No newline at end of file
+clean-files:= .fips140.order .fips140.symvers .fips140.hmac .fips140.ko.btf
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+clean-files += .nonfips140.ko.btf
+endif
\ No newline at end of file
diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 13c82ffdc65b..826075928723 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -11,12 +11,20 @@
 #include <linux/elf.h>
 #include <linux/kthread.h>
 #include <linux/wait.h>
+#include <linux/fips.h>
 
 extern const u8 _binary_fips140_ko_start[];
 extern const u8 _binary_fips140_ko_end[];
 extern const u8 _binary_fips140_hmac_start[];
 extern const u8 _binary_fips140_hmac_end[];
 
+#ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+/* For non-FIPS mode: no module signature/HMAC is required,
+ * so only include binary start/end address without module sig address */
+extern const u8 _binary_nonfips140_ko_start[];
+extern const u8 _binary_nonfips140_ko_end[];
+#endif
+
 const u8 *_binary_crypto_ko_start;
 EXPORT_SYMBOL_GPL(_binary_crypto_ko_start);
 const u8 *_binary_crypto_ko_end;
@@ -29,6 +37,10 @@ EXPORT_SYMBOL_GPL(_binary_crypto_hmac_end);
 #ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 extern const u8 __start_fips140_btf[];
 extern const u8 __stop_fips140_btf[];
+#ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+extern const u8 __start_nonfips140_btf[];
+extern const u8 __stop_nonfips140_btf[];
+#endif
 const u8 *__start_crypto_btf;
 const u8 *__stop_crypto_btf;
 #endif
@@ -49,11 +61,25 @@ static void load_prepare(void)
 	_binary_crypto_ko_end = _binary_fips140_ko_end;
 	_binary_crypto_hmac_start = _binary_fips140_hmac_start;
 	_binary_crypto_hmac_end = _binary_fips140_hmac_end;
-	
+
 #ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	__start_crypto_btf = __start_fips140_btf;
 	__stop_crypto_btf = __stop_fips140_btf;
 #endif
+
+#ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+	if (!fips_enabled) {
+		_binary_crypto_ko_start = _binary_nonfips140_ko_start;
+		_binary_crypto_ko_end = _binary_nonfips140_ko_end;
+		_binary_crypto_hmac_start = NULL;
+		_binary_crypto_hmac_end = NULL;
+
+#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+		__start_crypto_btf = __start_nonfips140_btf;
+		__stop_crypto_btf = __stop_nonfips140_btf;
+#endif
+		}
+#endif
 }
 
 static int __init fips_loader_init(void)
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b30d65f8b6b3..996d016e518c 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -81,7 +81,18 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	cp crypto/fips140/.fips140.ko.btf crypto/fips140/.fips140.ko.btf.first; \
 	rm -f crypto/fips140/fips140.ko.tmp; \
 	$(LD) -r -b binary -o crypto/fips140/fips140_btf.o crypto/fips140/.fips140.ko.btf; \
-	$(OBJCOPY) --rename-section .data=.fips140_btf crypto/fips140/fips140_btf.o; \
+	$(OBJCOPY) --rename-section .data=.fips140_btf crypto/fips140/fips140_btf.o
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+      cmd_link_vmlinux += ; \
+	cp crypto/fips140/fips140.ko crypto/fips140/nonfips140.ko.tmp; \
+	LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $@ crypto/fips140/nonfips140.ko.tmp; \
+	$(RESOLVE_BTFIDS) -b $@ crypto/fips140/nonfips140.ko.tmp; \
+	$(OBJCOPY) --dump-section=.BTF=crypto/fips140/.nonfips140.ko.btf crypto/fips140/nonfips140.ko.tmp; \
+	rm -f crypto/fips140/nonfips140.ko.tmp; \
+	$(LD) -r -b binary -o crypto/fips140/nonfips140_btf.o crypto/fips140/.nonfips140.ko.btf; \
+	$(OBJCOPY) --rename-section .data=.nonfips140_btf --prefix-symbols nonfips140_ crypto/fips140/nonfips140_btf.o
+endif
+	  cmd_link_vmlinux += ; \
 	rm -f $@; \
 	FIPS140_BTF_RELINK=1 $< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@"; \
 	cp $(fips140_build)/crypto/fips140/fips140.ko crypto/fips140/fips140.ko.tmp2; \
@@ -90,13 +101,27 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	$(OBJCOPY) --dump-section=.BTF=crypto/fips140/.fips140.ko.btf.second crypto/fips140/fips140.ko.tmp2; \
 	rm -f crypto/fips140/fips140.ko.tmp2; \
 	diff crypto/fips140/.fips140.ko.btf.first crypto/fips140/.fips140.ko.btf.second >/dev/null || echo "Module BTF differs"; \
-	rm -f crypto/fips140/.fips140.ko.btf.first crypto/fips140/.fips140.ko.btf.second; \
+	rm -f crypto/fips140/.fips140.ko.btf.first crypto/fips140/.fips140.ko.btf.second
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+      cmd_link_vmlinux += ; \
+	cp crypto/fips140/fips140.ko crypto/fips140/nonfips140.ko.tmp2; \
+	LLVM_OBJCOPY="$(OBJCOPY)" $(PAHOLE) -J $(PAHOLE_FLAGS) $(MODULE_PAHOLE_FLAGS) --btf_base $@ crypto/fips140/nonfips140.ko.tmp2; \
+	$(RESOLVE_BTFIDS) -b $@ crypto/fips140/nonfips140.ko.tmp2; \
+	$(OBJCOPY) --dump-section=.BTF=crypto/fips140/.nonfips140.ko.btf.second crypto/fips140/nonfips140.ko.tmp2; \
+	rm -f crypto/fips140/nonfips140.ko.tmp2; \
+	diff crypto/fips140/.nonfips140.ko.btf crypto/fips140/.nonfips140.ko.btf.second >/dev/null || echo "Nonfips140 Module BTF differs"; \
+	rm -f crypto/fips140/.nonfips140.ko.btf.second
+endif
+	  cmd_link_vmlinux += ; \
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 endif
 endif
 
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 fips140-deps := crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+fips140-deps += crypto/fips140/nonfips140-embedded.o
+endif
 endif
 
 targets += vmlinux.unstripped .vmlinux.export.o
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 37c9b8576ec7..43a272e8d3a4 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -78,8 +78,14 @@ vmlinux_link()
 
 	if is_enabled CONFIG_CRYPTO_FIPS140_EXTMOD; then
 		objs="${objs} crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o"
+		if is_enabled CONFIG_CRYPTO_FIPS140_DUAL_VERSION; then
+			objs="${objs} crypto/fips140/nonfips140-embedded.o"
+		fi
 		if is_enabled CONFIG_DEBUG_INFO_BTF_MODULES && [ -n "${FIPS140_BTF_RELINK}" ] && [ -f crypto/fips140/fips140_btf.o ]; then
 			objs="${objs} crypto/fips140/fips140_btf.o"
+			if is_enabled CONFIG_CRYPTO_FIPS140_DUAL_VERSION && [ -f crypto/fips140/nonfips140_btf.o ]; then
+				objs="${objs} crypto/fips140/nonfips140_btf.o"
+			fi
 		fi
 	fi
 
-- 
2.47.3


