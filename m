Return-Path: <linux-kbuild+bounces-12829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP3TLhHP4mm6+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12829-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:23:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F39F41F64F
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 026A93033388
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 014251DEFE8;
	Sat, 18 Apr 2026 00:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="deVuY3BD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6CB45BE3;
	Sat, 18 Apr 2026 00:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471822; cv=none; b=ZZWFw0XiY5XEVnLHabnKjWCV01SGu9+p3jgjhPvHRNNxAg/+jjFW0qsVSdvYBFP2DpWXZNb+ClFTPbll0FodjO4hzcrju5eTC2Kdk+sK8w83bOEMjBD6MgAbSDppXHAPAA8ykr1KUNFIK3C00VKGAW2Uop5DgWyWnVP8WTmCAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471822; c=relaxed/simple;
	bh=1ASN7eulYHaX770MrItuYUfMVPqkWsdYmSBqvhia1yM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CxhYbpmxe5RB7cW8HV3i5H+UwBUAe1G7TA+4RmVDimGYEozp2YfVG+515n+CYWLY1JKODxNL//eb1tPv7mMck13E71wQvOsTxt/kucyRKxHsZWpDc9DWJhWd+kZdF1oJTKyRDTD9ss6x/ZXNoyyqEW6mZHQfQUgRS7EFa0GxwLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=deVuY3BD; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471821; x=1808007821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GCdEJLWtd/5Z1HpD00+30I8H4Ghd1bcovjoP51Pgb4A=;
  b=deVuY3BDNH7NsLdHpHrHwpIhvjdkFfueQ0udX0OsBgHuj1yNCF/8X1xb
   9Pfd8HZOajVtBSbEGGoQnxLl9q0Ou3wU21SBrfwgfapnuflvjUzPr/2ac
   19Ss49zsGOeGL2tN++zOa7Yl6n5fsGaLbwJRt34LsXoc53Mq6TkU6KigV
   lIHfegGfKKWrWO4ie+c/3NWPTZMO6sa9ikszV2ohV9Epyhfoo80K9j1ch
   zLweHila0rKhDl+nuCYrwhAY+FA+lVR4x4XPJGDMjqjImwC8WYc8TKRg/
   a+0xJrfiuaE37hL/L5hyOd+8h8mL/sE4t+XuxjwdKEuHagjNSfoCZrzOV
   A==;
X-CSE-ConnectionGUID: F518fIseSpmfbte2rEOOpg==
X-CSE-MsgGUID: ti1FFrB9SSakRHWfcOg5bA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17586458"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:23:41 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:17736]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.47.173:2525] with esmtp (Farcaster)
 id 76a6816f-43ee-4127-98e7-1c6ddd33a7ec; Sat, 18 Apr 2026 00:23:40 +0000 (UTC)
X-Farcaster-Flow-ID: 76a6816f-43ee-4127-98e7-1c6ddd33a7ec
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:40 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:23:40 +0000
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
Subject: [PATCH v2 12/19] Allow selective crypto module loading at boot based on FIPS mode
Date: Sat, 18 Apr 2026 00:20:20 +0000
Message-ID: <20260418002032.2877-13-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D040UWA004.ant.amazon.com (10.13.139.93) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12829-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2F39F41F64F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 Makefile                        | 15 +++++++++++++++
 arch/arm64/kernel/vmlinux.lds.S | 16 ++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S   | 16 ++++++++++++++++
 crypto/fips140/Kconfig          | 24 ++++++++++++++++++++++++
 crypto/fips140/Makefile         |  5 ++++-
 crypto/fips140/fips140-loader.c | 26 ++++++++++++++++++++++++++
 scripts/Makefile.vmlinux        | 29 +++++++++++++++++++++++++++--
 scripts/link-vmlinux.sh         |  6 ++++++
 8 files changed, 134 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index bd0e4034927c6..4cf7349d5d263 100644
--- a/Makefile
+++ b/Makefile
@@ -1318,9 +1318,11 @@ quiet_cmd_gen_fips140_exported =
 		awk '{print "0x00000000\t" $$1 "\tcrypto/fips140/fips140\tEXPORT_SYMBOL_GPL\t"}' > $@ \
 		$(fips140_cp_exported)
 
+ifndef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
 ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
 fips140_cp_exported = ; cp "$(fips140_build)/crypto/fips140/.fips140.exported" crypto/fips140/.fips140.exported
 endif
+endif
 
 crypto/fips140/.fips140.exported: crypto/fips140/fips140.o FORCE
 	$(call if_changed,gen_fips140_exported)
@@ -1367,11 +1369,22 @@ vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 vmlinux: crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+vmlinux: crypto/fips140/nonfips140-embedded.o
+endif
 crypto/fips140/fips140-embedded.o: fips140-ready
 	@echo "  LD      $@"
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
@@ -1389,9 +1402,11 @@ fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fip
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
index 53acbe87b4539..c50072870bcae 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -223,6 +223,22 @@ SECTIONS
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
index d06ac39f931bd..d5d123a398fec 100644
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
index 68b877f0dbab7..7d8997aa10945 100644
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
index a4973c48dbe43..c3612c24df296 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -7,4 +7,7 @@ obj-y += fips140-loader.o
 CFLAGS_fips140-fn-redirect.o += -I$(obj)
 CFLAGS_fips140-module.o += -DFIPS140_CORE
 
-clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported .fips140.hmac .fips140.ko.btf
\ No newline at end of file
+clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported .fips140.hmac .fips140.ko.btf
+ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
+clean-files += .nonfips140.ko.btf
+endif
\ No newline at end of file
diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 9665ddb26e2d1..490fb7276befb 100644
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
@@ -47,6 +59,20 @@ static void load_prepare(void)
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
 
 static int fips_loader_init(void)
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index b30d65f8b6b3d..996d016e518ca 100644
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
index de40d6bb3a93d..283e7e3316ef6 100755
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


