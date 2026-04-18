Return-Path: <linux-kbuild+bounces-12826-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IV7JOPO4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12826-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:59 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE1141F60B
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:22:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75AB63015D04
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB5E1CAA7D;
	Sat, 18 Apr 2026 00:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="hAHZhVV5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.42.203.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991272BD11;
	Sat, 18 Apr 2026 00:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.42.203.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471777; cv=none; b=jtS48PxGmbLC0OEwPfYILBLFJaNcEGe5AuH4y2JEUBo0sPbayo1d1iFd0A/sH8nxPWSou6so8bqHqrH5nox04C8ppdW3yYq9pGKI5T6r7zjKdSREAsaBhaYZ6W7mXcbALpmLCqN6EnFPvsD0S2ayqi5CoLYp5B5hlAqxZwG4dis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471777; c=relaxed/simple;
	bh=xAIsfvZfaeIKd2Kl8pprxx5pYopOF1xmQJH6z190Hyo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t0TTUs3sQprXqSZy9X1BxX6A9AenNceWhjTm5gGEhghrUfOfjpWkKmP2n7k93avPzB71d3i94TSFqbE2nQRexfKcEuiVPyUJ4Jg2VDY3Dmiwa4bbtN/wntbQRF9DkGNXFHpA6Ms5J3cDwkuaBJIGAVqMLUjm1D1NcATtuiBbC/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=hAHZhVV5; arc=none smtp.client-ip=52.42.203.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471775; x=1808007775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q1nzHQ+8MQZYNvUBriyrkYx1UabojV9zAK9fXoyicWw=;
  b=hAHZhVV5zQ5EURbWN0MrWvucy1v4oXNcGWOySfhit9L414/LwhVj1EAz
   DGbmFiBvVQejR+Wa/xn2xxbfaNEhZ6Rb/uEdKnr2KlWjSBoEBoHwywSTj
   HGTbQPBnNSYPJ8HprAeBk0Wogn2bToovmede3PT3VCjrUcbii9bFo6F02
   PBbd7Xkar0Mg4bU9Hf03XsW/fm/Z7CGuVfZDzWR0BAwZiBnx8jv5eGUxp
   J3xPfaQKeYIKrHGzR854CE5OPPaLkYtfiS7W0Dm9ULZrJplmE8HVIMtbO
   NHfgZzMyR/UNcXdrtpe8++sfoGTXKZnYgQ9IAccywLyznZ+PyWJv6v26g
   w==;
X-CSE-ConnectionGUID: DuGuYirdR/Oc3mhGAhN/gg==
X-CSE-MsgGUID: fTv9hllkRlC0fUrPBmZtkg==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17609377"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-008.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:22:54 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:15350]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.25.2:2525] with esmtp (Farcaster)
 id c57742ec-163f-4d8d-bed5-307531d48cf5; Sat, 18 Apr 2026 00:22:54 +0000 (UTC)
X-Farcaster-Flow-ID: c57742ec-163f-4d8d-bed5-307531d48cf5
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:53 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:22:53 +0000
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
Subject: [PATCH v2 09/19] build: embed the standalone crypto module into vmlinux
Date: Sat, 18 Apr 2026 00:20:17 +0000
Message-ID: <20260418002032.2877-10-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D040UWB001.ant.amazon.com (10.13.138.82) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12826-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2FE1141F60B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 Makefile                        | 32 +++++++++++++++++++++++++++++---
 arch/arm64/kernel/vmlinux.lds.S | 16 ++++++++++++++++
 arch/x86/kernel/vmlinux.lds.S   | 16 ++++++++++++++++
 crypto/fips140/Kconfig          | 29 +++++++++++++++++++++++++++++
 crypto/fips140/Makefile         |  4 +++-
 crypto/fips140/fips140-loader.c |  9 +++++++++
 scripts/Makefile.modfinal       | 18 +++++++++++++++++-
 scripts/Makefile.vmlinux        |  6 +++++-
 scripts/link-vmlinux.sh         |  5 +++++
 9 files changed, 129 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index f3c43f87d6786..bd0e4034927c6 100644
--- a/Makefile
+++ b/Makefile
@@ -1306,12 +1306,21 @@ quiet_cmd_ar_vmlinux.a = AR      $@
 	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
 
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
+fips140_build = .
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+fips140_build = fips140_build
+endif
 
 # Generate exported symbol list from fips140.o (no vmlinux.o dependency)
 quiet_cmd_gen_fips140_exported = 
       cmd_gen_fips140_exported = $(NM) $< 2>/dev/null | \
 		sed -n 's/.*__export_symbol_//p' | sort | \
-		awk '{print "0x00000000\t" $$1 "\tcrypto/fips140/fips140\tEXPORT_SYMBOL_GPL\t"}' > $@
+		awk '{print "0x00000000\t" $$1 "\tcrypto/fips140/fips140\tEXPORT_SYMBOL_GPL\t"}' > $@ \
+		$(fips140_cp_exported)
+
+ifeq ($(CONFIG_CRYPTO_FIPS140_EXTMOD_SOURCE),y)
+fips140_cp_exported = ; cp "$(fips140_build)/crypto/fips140/.fips140.exported" crypto/fips140/.fips140.exported
+endif
 
 crypto/fips140/.fips140.exported: crypto/fips140/fips140.o FORCE
 	$(call if_changed,gen_fips140_exported)
@@ -1357,7 +1366,22 @@ PHONY += vmlinux
 vmlinux: private _LDFLAGS_vmlinux := $(LDFLAGS_vmlinux)
 vmlinux: export LDFLAGS_vmlinux = $(_LDFLAGS_vmlinux)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
-vmlinux: fips140-ready
+vmlinux: crypto/fips140/fips140-embedded.o crypto/fips140/fips140-digest.o
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
@@ -1365,7 +1389,9 @@ fips140-ready: crypto/fips140/fips140.o crypto/fips140/.fips140.order crypto/fip
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
index 2d1e75263f033..8d7905b9207ef 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -201,6 +201,22 @@ SECTIONS
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
index 4711a35e706cd..392d209082427 100644
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
index 0665e94b9fe05..68b877f0dbab7 100644
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
index 6a3dcc224e828..db61f1113d686 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -2,7 +2,9 @@
 crypto-objs-y += \
 	fips140-module.o 
 
+obj-y += fips140-loader.o
+
 CFLAGS_fips140-fn-redirect.o += -I$(obj)
 CFLAGS_fips140-module.o += -DFIPS140_CORE
 
-clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported
\ No newline at end of file
+clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported .fips140.hmac
\ No newline at end of file
diff --git a/crypto/fips140/fips140-loader.c b/crypto/fips140/fips140-loader.c
index 369ab3ceede9c..d2eb14f406d6e 100644
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
 
 static int fips_loader_init(void)
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 2e087355988ba..f9b9c798db1a7 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -69,12 +69,28 @@ ifeq ($(crypto-module-gen),1)
 	+$(call if_changed,ld_ko_o)
 else
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
-	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
+	+$(call if_changed_except,ld_ko_o_and_cp_extmod,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
 endif
 	+$(call cmd,check_tracepoint)
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
index fcae1e432d9ad..93b382e08892d 100644
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
index ee83d54a7cd0f..e5f0eef865f78 100755
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


