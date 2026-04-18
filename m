Return-Path: <linux-kbuild+bounces-12834-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHJ2Ol/P4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12834-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:25:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF0C41F698
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:25:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDDB53014BBA
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901071FF1C7;
	Sat, 18 Apr 2026 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="gnRMFmOw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385821F4C8C;
	Sat, 18 Apr 2026 00:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471901; cv=none; b=uKS+xfBwfWizOq3wKa71BR+0ErVDBBUWntAilgt1oiVwtYoaG4zjqeI8ZJMFEexhwpiol7VNKLSFL8nfl+dp8dTsTNT635XFnMjNlcVkTY6HFiI+poig0IS7xjdXDPmgoWBE+n5Mhp2wTVkx0vbFV2af/Bhnt6wd/WO9+M9oiSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471901; c=relaxed/simple;
	bh=i/oH7NEeVKZ2B5UDVBOlT3keJYQbCbEpvF/7RnLI9xE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=catwY/g7NyreMU8jMng6xuq+Z8fvZz348xpq389IajEJv0IG7DNLI5EwijTaaOt8mXSjru7Eszboz8yDXebwfBh7ya66xG5b8y4/TN26Wpx05+ialP44zxjiHSgNFQdQ9p0VYdxXqhKfV3NJC3FbGB33d94UKW5wuqIe9Pxvp48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=gnRMFmOw; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471900; x=1808007900;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ij2ZLCWKyx3FI3ftIkMWOkapg5XDdRnguHlYGirPSgU=;
  b=gnRMFmOwOnRhXPWlqRdRxChQDVO/zMeHQW1ZklHH3vQd3UkxZCgKkWKT
   4jwqoaCruDLRD5P8dZOV2zkIfTDLz+zRaE5dsBTWGbudS6nGWRonVtToy
   VnFPcddrn55m4mZ9dy4Ww7WwCK2yWfbrB5Tz9c7lSpREGlIrYGlRyZS+v
   /I9Uf7fS98zRe5F+hOMzH846JWJ9pudADq6hvyLejGvmAfwI+hEhYF1YH
   NRVDCpqdeOHICNYdwh5rcZCAfMqaXCZmPmpXUxPGghibg8yHjL2XC5pRL
   3DpFq0OrfpHJkBBfOIO1iNRIK4qrBsVTLlCbrYsh+CrL7OxmhxaJpgUpx
   A==;
X-CSE-ConnectionGUID: BEP6Bi5uQVOIY4h7du4YcA==
X-CSE-MsgGUID: H/U+dGGPR0W50mhTBP1Kug==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17399352"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:24:59 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:30456]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.82:2525] with esmtp (Farcaster)
 id 21fb3888-86aa-48b4-9af6-82200b889620; Sat, 18 Apr 2026 00:24:59 +0000 (UTC)
X-Farcaster-Flow-ID: 21fb3888-86aa-48b4-9af6-82200b889620
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:58 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:58 +0000
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
Subject: [PATCH v2 17/19] x86/crypto: convert exported symbols in x86 crypto to pluggable symbols
Date: Sat, 18 Apr 2026 00:20:25 +0000
Message-ID: <20260418002032.2877-18-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
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
	TAGGED_FROM(0.00)[bounces-12834-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 8DF0C41F698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Include x86 architecture-specific crypto source files in
fips140.ko by converting their Makefile rules from obj-y to
crypto-objs-y, and apply the pluggable interface introduced
in the earlier patch so that symbols defined in fips140.ko
can still be referenced by vmlinux.

For exported function symbols, the --wrap linker mechanism
automatically redirects all references in vmlinux to
trampolines, so no source tree modifications are needed
beyond ensuring each function has an EXPORT_SYMBOL.

For exported variable symbols, an architecture-specific
fips140-var-redirect.c is introduced under
arch/x86/crypto/fips140/ to hold DEFINE_CRYPTO_VAR_STUB()
definitions. This file is compiled twice: once for vmlinux
(as the "outlet" providing the placeholder pointers) and
once for fips140.ko (as the "plug" populating them with
real addresses via the __crypto_var_keys section).

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile                      | 41 ++++++++++---------
 arch/x86/crypto/fips140/Makefile              | 14 +++++++
 .../x86/crypto/fips140/fips140-var-redirect.c |  0
 3 files changed, 36 insertions(+), 19 deletions(-)
 create mode 100644 arch/x86/crypto/fips140/Makefile
 create mode 100644 arch/x86/crypto/fips140/fips140-var-redirect.c

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index e04ff8718d6b6..e957739e80df1 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -4,42 +4,42 @@
 
 obj-$(CONFIG_CRYPTO_TWOFISH_586) += twofish-i586.o
 twofish-i586-y := twofish-i586-asm_32.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64) += twofish-x86_64.o
 twofish-x86_64-y := twofish-x86_64-asm_64.o twofish_glue.o
-obj-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_X86_64_3WAY) += twofish-x86_64-3way.o
 twofish-x86_64-3way-y := twofish-x86_64-asm_64-3way.o twofish_glue_3way.o
-obj-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_AVX_X86_64) += twofish-avx-x86_64.o
 twofish-avx-x86_64-y := twofish-avx-x86_64-asm_64.o twofish_avx_glue.o
 
 obj-$(CONFIG_CRYPTO_SERPENT_SSE2_586) += serpent-sse2-i586.o
 serpent-sse2-i586-y := serpent-sse2-i586-asm_32.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_SSE2_X86_64) += serpent-sse2-x86_64.o
 serpent-sse2-x86_64-y := serpent-sse2-x86_64-asm_64.o serpent_sse2_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX_X86_64) += serpent-avx-x86_64.o
 serpent-avx-x86_64-y := serpent-avx-x86_64-asm_64.o serpent_avx_glue.o
-obj-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT_AVX2_X86_64) += serpent-avx2.o
 serpent-avx2-y := serpent-avx2-asm_64.o serpent_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_X86_64) += camellia-x86_64.o
 camellia-x86_64-y := camellia-x86_64-asm_64.o camellia_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64) += camellia-aesni-avx-x86_64.o
 camellia-aesni-avx-x86_64-y := camellia-aesni-avx-asm_64.o camellia_aesni_avx_glue.o
-obj-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64) += camellia-aesni-avx2.o
 camellia-aesni-avx2-y := camellia-aesni-avx2-asm_64.o camellia_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_X86_64) += blowfish-x86_64.o
 blowfish-x86_64-y := blowfish-x86_64-asm_64.o blowfish_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5_AVX_X86_64) += cast5-avx-x86_64.o
 cast5-avx-x86_64-y := cast5-avx-x86_64-asm_64.o cast5_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6_AVX_X86_64) += cast6-avx-x86_64.o
 cast6-avx-x86_64-y := cast6-avx-x86_64-asm_64.o cast6_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
+crypto-objs-$(CONFIG_CRYPTO_AEGIS128_AESNI_SSE2) += aegis128-aesni.o
 aegis128-aesni-y := aegis128-aesni-asm.o aegis128-aesni-glue.o
 
-obj-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
+crypto-objs-$(CONFIG_CRYPTO_AES_NI_INTEL) += aesni-intel.o
 aesni-intel-y := aesni-intel_asm.o aesni-intel_glue.o
 aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-aesni-x86_64.o \
@@ -47,17 +47,20 @@ aesni-intel-$(CONFIG_64BIT) += aes-ctr-avx-x86_64.o \
 			       aes-gcm-vaes-avx512.o \
 			       aes-xts-avx-x86_64.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64) += sm4-aesni-avx-x86_64.o
 sm4-aesni-avx-x86_64-y := sm4-aesni-avx-asm_64.o sm4_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64) += sm4-aesni-avx2-x86_64.o
 sm4-aesni-avx2-x86_64-y := sm4-aesni-avx2-asm_64.o sm4_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX_X86_64) += aria-aesni-avx-x86_64.o
 aria-aesni-avx-x86_64-y := aria-aesni-avx-asm_64.o aria_aesni_avx_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_AESNI_AVX2_X86_64) += aria-aesni-avx2-x86_64.o
 aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
-obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
\ No newline at end of file
diff --git a/arch/x86/crypto/fips140/Makefile b/arch/x86/crypto/fips140/Makefile
new file mode 100644
index 0000000000000..a7a5259a43ab6
--- /dev/null
+++ b/arch/x86/crypto/fips140/Makefile
@@ -0,0 +1,14 @@
+
+crypto-objs-y += fips140-var-redirect-fips.o
+
+obj-y += fips140-var-redirect-main.o
+
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-var-redirect-main.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-var-redirect-fips.o: $(src)/fips140-var-redirect.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-var-redirect-main.o += -I$(srctree)
+CFLAGS_fips140-var-redirect-fips.o += -I$(srctree)
diff --git a/arch/x86/crypto/fips140/fips140-var-redirect.c b/arch/x86/crypto/fips140/fips140-var-redirect.c
new file mode 100644
index 0000000000000..e69de29bb2d1d
-- 
2.47.3


