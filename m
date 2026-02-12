Return-Path: <linux-kbuild+bounces-11136-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gE/UM6U+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11136-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 334021293FE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA6D0308D4B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8F621CC64;
	Thu, 12 Feb 2026 02:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="qP89yneG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12891F4174;
	Thu, 12 Feb 2026 02:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864291; cv=none; b=dKIwX+fvzeUn2y2eR2J/zZnBfDxWOdafBC/S2KVX5IWDyiRiI+y9S5Gub4ZsGeK7v4Nn91T4SwWC+EzfY2+0INZ5v7xeb17vktDCKXH1pER0o6VRd4KAUNYMC9keZI5H1fpT3hYuB2hucCrTuF8krk/h0xJazg4fxPxzN6UgRnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864291; c=relaxed/simple;
	bh=c45qY6sLijcMsZxG9f2gCvebUYIs+chXP2y/kPzAmYI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SDSRTkVJJzeaFQrvqe+45BVVh9pawziCBlnlxTdiWdrbcosAlEWQELl/BjXeuIwXbmfMqyt/7C7BEmOtavu3apKI88aFU+T9YYzLEntU5l31CE7k4wBDwwxYEgkSQ9zQ4DbHUOeODeCLFdhTfvJxEm7lTC+/L8RI/6RWehTzKUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=qP89yneG; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864289; x=1802400289;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S6YTjsW27kqeW1SkY/4YgSbENcPRl8PAu46Rs0kKZDU=;
  b=qP89yneGxxMGXSzL6zgKsdU96hBJp71YiNQ3P58ZsZRaqUA2sSOcYSg0
   9nG4fg/0Y1YqcLYCXwkOI7ymJJ+prVf/W2MiHkZm6wwIWd+kgfX97WSH9
   3fMu8S5Z5zFb0iXAC3R2OlkkiFTZh+7G28jq+MJNliI+Pce/0Z12vznk8
   e3e3IrhZCxR5KxHkDIjmsLB3gWQqZz0UHzu8m3Yk9gn62gKNMenXK4m/p
   LBpX49DDlvThs1jUzoXDoQDWPUB98DfnZPu2gV4MknXX6HsTmvmmUYQsh
   1TDXnYdQ4Jw0kbStbS2z+p2QE8ekoPQfOCv78yCH7zA4Jme8AYHBnZD/U
   A==;
X-CSE-ConnectionGUID: kYJhk8AfSpaa0vzj727F0Q==
X-CSE-MsgGUID: xmUe0TPHShKGLyTQjK8qwA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12913902"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:44:49 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:21503]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 33a7ddc7-86d5-4809-91af-de7f5ca51030; Thu, 12 Feb 2026 02:44:49 +0000 (UTC)
X-Farcaster-Flow-ID: 33a7ddc7-86d5-4809-91af-de7f5ca51030
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:48 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:44:48 +0000
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
Subject: [PATCH 09/17] build: embed the standalone crypto module into vmlinux
Date: Thu, 12 Feb 2026 02:42:13 +0000
Message-ID: <20260212024228.6267-10-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWA003.ant.amazon.com (10.13.139.18) To
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
	TAGGED_FROM(0.00)[bounces-11136-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 334021293FE
X-Rspamd-Action: no action

As mentioned in earlier patch, in order to load standalone crypto module
in early boot before filesystem is ready, the module needs to be embedded
into vmlinux image. This patch intends to make such embedded process a
seamless process that will automatically trigger as building vmlinux (i.e.,
during `make vmlinux`). So it adds make dependency rule such that vmlinux
will depend on the `fips140.ko` and its signature `.fips140.hmac`
generation rule. It also modifies vmlinux link rule to finally link them
with vmlinux.o.

The high level idea of embedding fips140.ko into vmlinux stems from
Vegard Nossum <vegard.nossum@oracle.com>.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 Makefile                        | 25 +++++++++++++++++++++++--
 arch/arm64/kernel/vmlinux.lds.S | 16 ++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S   | 16 ++++++++++++++++
 crypto/fips140/Kconfig          | 29 +++++++++++++++++++++++++++++
 crypto/fips140/Makefile         | 16 +++++++++++++---
 crypto/fips140/fips140-loader.c |  9 +++++++++
 scripts/Makefile.modfinal       | 18 +++++++++++++++++-
 scripts/Makefile.vmlinux        |  6 +++++-
 scripts/link-vmlinux.sh         |  5 +++++
 9 files changed, 133 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 8413cc02665c..7530009d8081 100644
--- a/Makefile
+++ b/Makefile
@@ -1292,7 +1292,26 @@ PHONY += vmlinux
 vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
-vmlinux: fips140-ready
+vmlinux: crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
+fips140_build = .
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+fips140_build = fips140_build
+endif
+crypto/fips140/fips140-embedded.o: fips140-ready
+	@echo "  LD      $@"
+	@$(LD) -r -b binary -o $@ $(fips140_build)/crypto/fips140/fips140.ko
+	@$(OBJCOPY) --rename-section .data=.fips140_module_data $@
+
+crypto/fips140/.fips140.hmac: crypto/fips140/fips140-embedded.o
+	@echo "  HMAC    $@"
+	@hmac_key=$$(awk -F'"' '/^CONFIG_CRYPTO_FIPS140_HMAC_KEY=/{print $$2}' .config); \
+	openssl dgst -sha256 -hmac "$$hmac_key" -binary -out $@ $(fips140_build)/crypto/fips140/fips140.ko
+
+crypto/fips140/fips140-digest.o: crypto/fips140/.fips140.hmac
+	@echo "  LD      $@"
+	@$(LD) -r -b binary -o $@ crypto/fips140/.fips140.hmac
+	@$(OBJCOPY) --rename-section .data=.fips140_digest $@
+
 # Ensure fips140.ko is built before embedding
 fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fips140/fips140.mod vmlinux.o | modules_prepare
 	$(Q)$(MAKE) KBUILD_MODULES= -f $(srctree)/scripts/Makefile.modpost
@@ -1300,7 +1319,9 @@ fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fip
 ifneq ($(KBUILD_MODPOST_NOFINAL),1)
 	$(Q)$(MAKE) KBUILD_MODULES=y crypto-module-gen=1 -f $(srctree)/scripts/Makefile.modfinal
 endif
-	@:
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+	cp "$(fips140_build)/crypto/fips140/fips140.ko" crypto/fips140/fips140.ko;
+endif
 
 # Generate fips140.o from crypto-module.a files
 crypto/fips140/fips140.o: crypto-module.a FORCE
diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index ad6133b89e7a..8de7dba3ac12 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -200,6 +200,22 @@ SECTIONS
 	/* everything from this point to __init_begin will be marked RO NX */
 	RO_DATA(PAGE_SIZE)
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	/* FIPS 140 embedded module data */
+	.fips140_embedded : {
+		. = ALIGN(8);
+		_binary_fips140_ko_start = .;
+		KEEP(*(.fips140_module_data))
+		_binary_fips140_ko_end = .;
+	}
+	.fips140_digest : {
+		. = ALIGN(8);
+		_binary_fips140_hmac_start = .;
+		KEEP(*(.fips140_digest))
+		_binary_fips140_hmac_end = .;
+	}
+#endif
+
 	HYPERVISOR_RODATA_SECTIONS
 
 	.got : { *(.got) }
diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index 3a24a3fc55f5..25fdea6b9f27 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -171,6 +171,22 @@ SECTIONS
 	RO_DATA(PAGE_SIZE)
 	X86_ALIGN_RODATA_END
 
+#ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+	/* FIPS 140 embedded module data */
+	.fips140_embedded : AT(ADDR(.fips140_embedded) - LOAD_OFFSET) {
+		. = ALIGN(8);
+		_binary_fips140_ko_start = .;
+		KEEP(*(.fips140_module_data))
+		_binary_fips140_ko_end = .;
+	}
+	.fips140_digest : AT(ADDR(.fips140_digest) - LOAD_OFFSET) {
+		. = ALIGN(8);
+		_binary_fips140_hmac_start = .;
+		KEEP(*(.fips140_digest))
+		_binary_fips140_hmac_end = .;
+	}
+#endif
+
 	/* Data */
 	.data : AT(ADDR(.data) - LOAD_OFFSET) {
 		/* Start of data section */
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
index 0665e94b9fe0..68b877f0dbab 100644
--- a/crypto/fips140/Kconfig
+++ b/crypto/fips140/Kconfig
@@ -12,4 +12,33 @@ config CRYPTO_FIPS140_EXTMOD
 	  can be enabled to restrict crypto algorithm usage to only
 	  those provided by this module.
 
+	  If unsure, say N.
+config CRYPTO_FIPS140_HMAC_KEY
+	string "FIPS 140-3 external module HMAC key"
+	depends on CRYPTO_FIPS140_EXTMOD
+	default "The quick brown fox jumps over the lazy dog while the sphinx of black quartz judges my vow"
+	help
+	  This is the HMAC key used to build and verify the integrity of
+	  the FIPS module.
+
+	  Must be at least 80 characters.
+config CRYPTO_FIPS140_EXTMOD_SOURCE
+	bool "Use external FIPS module source"
+	depends on CRYPTO_FIPS140_EXTMOD
+	default n
+	help
+	  Use pre-built FIPS modules from an external build directory instead
+	  of freshly built modules from the current kernel build.
+	  
+	  If N, the kernel uses freshly generated crypto modules from the
+	  current build directory:
+	    - crypto/fips140/fips140.ko
+	    - crypto/aes.ko
+	    - crypto/sha256.ko
+	  
+	  If Y, pre-built modules from fips140_build/ are used:
+	    - fips140_build/crypto/fips140/fips140.ko
+	    - fips140_build/crypto/aes.ko
+	    - fips140_build/crypto/sha256.ko
+	  
 	  If unsure, say N.
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index fb083022efbb..8f9d3c06ac98 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -1,8 +1,18 @@
 
 crypto-objs-y += \
 	fips140-module.o \
-	fips140-api.o
+	fips140-api-fips.o
 
-obj-y += fips140-api.o
+obj-y += fips140-api-main.o fips140-loader.o
 
-clean-files:= .fips140.order .fips140.symvers
\ No newline at end of file
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-api-main.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-api-fips.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-api-main.o += -I$(srctree)
+CFLAGS_fips140-api-fips.o += -I$(srctree)
+
+clean-files:= .fips140.order .fips140.symvers .fips140.hmac
\ No newline at end of file
diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index cbf5ff59eb2e..7fcb420997cb 100644
--- a/crypto/fips140/fips140-loader.c
+++ b/crypto/fips140/fips140-loader.c
@@ -14,10 +14,17 @@
 
 extern const u8 _binary_fips140_ko_start[];
 extern const u8 _binary_fips140_ko_end[];
+extern const u8 _binary_fips140_hmac_start[];
+extern const u8 _binary_fips140_hmac_end[];
+
 const u8 *_binary_crypto_ko_start;
 EXPORT_SYMBOL_GPL(_binary_crypto_ko_start);
 const u8 *_binary_crypto_ko_end;
 EXPORT_SYMBOL_GPL(_binary_crypto_ko_end);
+const u8 *_binary_crypto_hmac_start;
+EXPORT_SYMBOL_GPL(_binary_crypto_hmac_start);
+const u8 *_binary_crypto_hmac_end;
+EXPORT_SYMBOL_GPL(_binary_crypto_hmac_end);
 
 /* Function to load crypto module from memory */
 extern int load_crypto_module_mem(const char *mem, size_t size);
@@ -26,6 +33,8 @@ static void load_prepare(void)
 {
 	_binary_crypto_ko_start = _binary_fips140_ko_start;
 	_binary_crypto_ko_end = _binary_fips140_ko_end;
+	_binary_crypto_hmac_start = _binary_fips140_hmac_start;
+	_binary_crypto_hmac_end = _binary_fips140_hmac_end;
 }
 
 static int __init fips_loader_init(void)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index c68dab4d6584..6a2219582258 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -69,11 +69,27 @@ ifeq ($(crypto-module-gen),1)
 	+$(call if_changed,ld_ko_o)
 else
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+	+$(call if_changed_except,ld_ko_o_and_cp_extmod,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 endif
+
+fips140_build = .
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+fips140_build = fips140_build
+endif
+
+quiet_cmd_ld_ko_o_and_cp_extmod = LD [M]  $@
+      cmd_ld_ko_o_and_cp_extmod = \
+	$(LD) -r $(KBUILD_LDFLAGS) \
+		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE) \
+		-T $(objtree)/scripts/module.lds -o $@ $(filter %.o, $^); \
+	if [ "$(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE)" = "y" ] && \
+	   [ -f "$(fips140_build)/$@" ]; then \
+		echo "  CP [M]  $@"; \
+		cp "$(fips140_build)/$@" "$@"; \
+	fi
 else
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index fcae1e432d9a..93b382e08892 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -67,8 +67,12 @@ cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
+ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+fips140-deps := crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
+endif
+
 targets += vmlinux.unstripped .vmlinux.export.o
-vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) FORCE
+vmlinux.unstripped: scripts/link-vmlinux.sh vmlinux.o .vmlinux.export.o $(KBUILD_LDS) $(fips140-deps) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF
 vmlinux.unstripped: $(RESOLVE_BTFIDS) $(srctree)/scripts/gen-btf.sh
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index f99e196abeea..34c0a162da84 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -75,6 +75,11 @@ vmlinux_link()
 	fi
 
 	objs="${objs} .vmlinux.export.o"
+
+	if is_enabled CONFIG_CRYPTO_FIPS140_EXTMOD; then
+		objs="${objs} crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o"
+	fi
+
 	objs="${objs} init/version-timestamp.o"
 
 	if [ "${SRCARCH}" = "um" ]; then
-- 
2.47.3


