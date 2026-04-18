Return-Path: <linux-kbuild+bounces-12833-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IV/EVPP4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12833-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:24:51 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678C41F68A
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFD363002F59
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:24:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D09941FF1B4;
	Sat, 18 Apr 2026 00:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="lol+0bf5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FED20297C;
	Sat, 18 Apr 2026 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471885; cv=none; b=R6MjTc0a3FT2/ypiqn1nVnWfzq9pH7NGanISaLvbiTZuzOCRg6XCdU05KgJW7jsO7AZhs7n2bLToRfkhCfYyrgapvZw9W58w62EQafMfo0FpkVCQ+Zl3GcENazSz+JG0aBPZjcqkv9w3i+Q6bRnoxBqhC0+7bzEB8xdSxKyaox8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471885; c=relaxed/simple;
	bh=vKNWkCjksn1XLJFwRxCzEfix660+jZuABa2C1tSNuwU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CLJMdLYUwq0dqc7AEDmUO/f3/KyW049PkwsvsbX29QAb/8XnxMYAmBeDf52CBxJyHn2RjCICjXGIiOQ98vQ8xagJOJ2ruSEJYShlMQ93x0qRH3vq50H0XcX7/VnX3TC+2zrn8OCRB/V9rKUnrNch70pqvjPMt+zNUFu7Nx1faAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=lol+0bf5; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471883; x=1808007883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ernzIdNjWKhjnaH4qugmHhwU3zgei7aT4qcIQ3rNv74=;
  b=lol+0bf57VpoqaZrlOBAo6E/Teg9sy/UqYo7HckHGSrcuucgyw7Z1z8S
   CQEO7po2w/tr6/k4nQ1KK+SVJP0GpdBSN3XluHGueO8u8hiLCbIiUYVX6
   IjqZEjqUR2tyYy5mYuiivxXGNW52UCBzBmGa1i69HGRfotcl/TwgjeG7r
   w8g1kDTwVIdyXQv249rQTutEjMRx/oM71RTMdwimbV2/SUPmBPtjwSVe3
   QiigQ7bVYpxOFCvRNfThxwXmYEzUNWny73oJ835rtWgLEJ5S6OAjTZznC
   eea3Rk67O98TeRVeI6c4SvaoGI1jSLSiRwO1PkD2aqLBzt7MQuq8sxtYK
   Q==;
X-CSE-ConnectionGUID: uWXh+SsERR65yQs45Bp1uQ==
X-CSE-MsgGUID: IB2g0LMcSCG2JxEMi7OVJw==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17378134"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:24:43 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:18241]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.41.208:2525] with esmtp (Farcaster)
 id 4a8e219f-1ac4-48f1-b62b-e9db8a8736e6; Sat, 18 Apr 2026 00:24:43 +0000 (UTC)
X-Farcaster-Flow-ID: 4a8e219f-1ac4-48f1-b62b-e9db8a8736e6
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:42 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:42 +0000
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
Subject: [PATCH v2 16/19] crypto: convert exported symbols in architecture-independent crypto to pluggable symbols
Date: Sat, 18 Apr 2026 00:20:24 +0000
Message-ID: <20260418002032.2877-17-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D039UWB001.ant.amazon.com (10.13.138.119) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12833-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gnu.org:url];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4678C41F68A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Include architecture-independent crypto source files in
fips140.ko by converting their Makefile rules from obj-y to
crypto-objs-y, and apply the pluggable interface introduced
in the earlier patch so that symbols defined in fips140.ko
can still be referenced by vmlinux.

For exported function symbols (the majority, ~hundreds),
the --wrap linker mechanism automatically redirects all
references in vmlinux to trampolines, so no source tree
modifications are needed beyond ensuring each function has
an EXPORT_SYMBOL. A few functions that were not previously
exported now need EXPORT_SYMBOL_GPL added since they move
into the module.

For exported variable symbols (a small number), the
header declarations are replaced with DECLARE_CRYPTO_VAR()
and a macro that redirects accesses through a pointer
indirection. The placeholder definitions are added via
DEFINE_CRYPTO_VAR_STUB() in fips140-var-redirect.c. The
wrapper takes the Kconfig symbol as a parameter so that
when a crypto algorithm is already configured as a module
(=m), the original declaration remains unchanged.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 certs/system_keyring.c                 |   1 +
 crypto/Makefile                        | 202 ++++++++++++-------------
 crypto/asymmetric_keys/Makefile        |  16 +-
 crypto/asymmetric_keys/restrict.c      |   2 +
 crypto/asymmetric_keys/verify_pefile.c |   1 +
 crypto/async_tx/Makefile               |  12 +-
 crypto/fips140/Makefile                |  16 +-
 crypto/fips140/fips140-var-redirect.c  |  78 ++++++++++
 crypto/krb5/Makefile                   |   2 +-
 include/crypto/cast_common.h           |  17 ++-
 include/crypto/md5.h                   |   8 +-
 include/crypto/public_key.h            |   7 +-
 include/crypto/rng.h                   |   1 +
 include/crypto/sm4.h                   |  13 +-
 include/keys/asymmetric-type.h         |   7 +-
 15 files changed, 255 insertions(+), 128 deletions(-)
 create mode 100644 crypto/fips140/fips140-var-redirect.c

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index e0761436ec7f4..b150f5f9da0ba 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -50,6 +50,7 @@ int restrict_link_by_builtin_trusted(struct key *dest_keyring,
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  builtin_trusted_keys);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_builtin_trusted);
 
 /**
  * restrict_link_by_digsig_builtin - Restrict digitalSignature key additions by the built-in keyring
diff --git a/crypto/Makefile b/crypto/Makefile
index b48017ca84cc0..4108129823d23 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -5,41 +5,41 @@
 
 CONTEXT_ANALYSIS := y
 
-obj-$(CONFIG_CRYPTO) += crypto.o
+crypto-objs-$(CONFIG_CRYPTO) += crypto.o
 crypto-y := api.o cipher.o
 
-obj-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
+crypto-objs-$(CONFIG_CRYPTO_ENGINE) += crypto_engine.o
 obj-$(CONFIG_CRYPTO_FIPS) += fips.o
 
 crypto_algapi-$(CONFIG_PROC_FS) += proc.o
 crypto_algapi-y := algapi.o scatterwalk.o $(crypto_algapi-y)
-obj-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
+crypto-objs-$(CONFIG_CRYPTO_ALGAPI2) += crypto_algapi.o
 
-obj-$(CONFIG_CRYPTO_AEAD2) += aead.o
-obj-$(CONFIG_CRYPTO_GENIV) += geniv.o
+crypto-objs-$(CONFIG_CRYPTO_AEAD2) += aead.o
+crypto-objs-$(CONFIG_CRYPTO_GENIV) += geniv.o
 
 crypto_skcipher-y += lskcipher.o
 crypto_skcipher-y += skcipher.o
 
-obj-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += crypto_skcipher.o
 ifeq ($(CONFIG_BPF_SYSCALL),y)
-obj-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_SKCIPHER2) += bpf_crypto_skcipher.o
 endif
 
-obj-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
-obj-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
+crypto-objs-$(CONFIG_CRYPTO_SEQIV) += seqiv.o
+crypto-objs-$(CONFIG_CRYPTO_ECHAINIV) += echainiv.o
 
 crypto_hash-y += ahash.o
 crypto_hash-y += shash.o
-obj-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
+crypto-objs-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
-obj-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
-obj-$(CONFIG_CRYPTO_SIG2) += sig.o
-obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
+crypto-objs-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
+crypto-objs-$(CONFIG_CRYPTO_SIG2) += sig.o
+crypto-objs-$(CONFIG_CRYPTO_KPP2) += kpp.o
 
 dh_generic-y := dh.o
 dh_generic-y += dh_helper.o
-obj-$(CONFIG_CRYPTO_DH) += dh_generic.o
+crypto-objs-$(CONFIG_CRYPTO_DH) += dh_generic.o
 
 $(obj)/rsapubkey.asn1.o: $(obj)/rsapubkey.asn1.c $(obj)/rsapubkey.asn1.h
 $(obj)/rsaprivkey.asn1.o: $(obj)/rsaprivkey.asn1.c $(obj)/rsaprivkey.asn1.h
@@ -51,7 +51,7 @@ rsa_generic-y += rsa.o
 rsa_generic-y += rsa_helper.o
 rsa_generic-y += rsa-pkcs1pad.o
 rsa_generic-y += rsassa-pkcs1.o
-obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
 
 $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
@@ -59,48 +59,48 @@ ecdsa_generic-y += ecdsa.o
 ecdsa_generic-y += ecdsa-x962.o
 ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
-obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
-obj-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
+crypto-objs-$(CONFIG_CRYPTO_MLDSA) += mldsa.o
 
 crypto_acompress-y := acompress.o
 crypto_acompress-y += scompress.o
-obj-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
+crypto-objs-$(CONFIG_CRYPTO_ACOMP2) += crypto_acompress.o
 
 cryptomgr-y := algboss.o testmgr.o
 
-obj-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
-obj-$(CONFIG_CRYPTO_USER) += crypto_user.o
-obj-$(CONFIG_CRYPTO_CMAC) += cmac.o
-obj-$(CONFIG_CRYPTO_HMAC) += hmac.o
-obj-$(CONFIG_CRYPTO_XCBC) += xcbc.o
-obj-$(CONFIG_CRYPTO_NULL) += crypto_null.o
-obj-$(CONFIG_CRYPTO_MD4) += md4.o
-obj-$(CONFIG_CRYPTO_MD5) += md5.o
-obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
-obj-$(CONFIG_CRYPTO_SHA1) += sha1.o
-obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
-obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
-obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
-obj-$(CONFIG_CRYPTO_SM3) += sm3.o
-obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
-obj-$(CONFIG_CRYPTO_WP512) += wp512.o
+crypto-objs-$(CONFIG_CRYPTO_MANAGER2) += cryptomgr.o
+crypto-objs-$(CONFIG_CRYPTO_USER) += crypto_user.o
+crypto-objs-$(CONFIG_CRYPTO_CMAC) += cmac.o
+crypto-objs-$(CONFIG_CRYPTO_HMAC) += hmac.o
+crypto-objs-$(CONFIG_CRYPTO_XCBC) += xcbc.o
+crypto-objs-$(CONFIG_CRYPTO_NULL) += crypto_null.o
+crypto-objs-$(CONFIG_CRYPTO_MD4) += md4.o
+crypto-objs-$(CONFIG_CRYPTO_MD5) += md5.o
+crypto-objs-$(CONFIG_CRYPTO_RMD160) += rmd160.o
+crypto-objs-$(CONFIG_CRYPTO_SHA1) += sha1.o
+crypto-objs-$(CONFIG_CRYPTO_SHA256) += sha256.o
+crypto-objs-$(CONFIG_CRYPTO_SHA512) += sha512.o
+crypto-objs-$(CONFIG_CRYPTO_SHA3) += sha3.o
+crypto-objs-$(CONFIG_CRYPTO_SM3) += sm3.o
+crypto-objs-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
+crypto-objs-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
-obj-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
-obj-$(CONFIG_CRYPTO_ECB) += ecb.o
-obj-$(CONFIG_CRYPTO_CBC) += cbc.o
-obj-$(CONFIG_CRYPTO_PCBC) += pcbc.o
-obj-$(CONFIG_CRYPTO_CTS) += cts.o
-obj-$(CONFIG_CRYPTO_LRW) += lrw.o
-obj-$(CONFIG_CRYPTO_XTS) += xts.o
-obj-$(CONFIG_CRYPTO_CTR) += ctr.o
-obj-$(CONFIG_CRYPTO_XCTR) += xctr.o
-obj-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
-obj-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
-obj-$(CONFIG_CRYPTO_GCM) += gcm.o
-obj-$(CONFIG_CRYPTO_CCM) += ccm.o
-obj-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
-obj-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
+crypto-objs-$(CONFIG_CRYPTO_BLAKE2B) += blake2b.o
+crypto-objs-$(CONFIG_CRYPTO_ECB) += ecb.o
+crypto-objs-$(CONFIG_CRYPTO_CBC) += cbc.o
+crypto-objs-$(CONFIG_CRYPTO_PCBC) += pcbc.o
+crypto-objs-$(CONFIG_CRYPTO_CTS) += cts.o
+crypto-objs-$(CONFIG_CRYPTO_LRW) += lrw.o
+crypto-objs-$(CONFIG_CRYPTO_XTS) += xts.o
+crypto-objs-$(CONFIG_CRYPTO_CTR) += ctr.o
+crypto-objs-$(CONFIG_CRYPTO_XCTR) += xctr.o
+crypto-objs-$(CONFIG_CRYPTO_HCTR2) += hctr2.o
+crypto-objs-$(CONFIG_CRYPTO_ADIANTUM) += adiantum.o
+crypto-objs-$(CONFIG_CRYPTO_GCM) += gcm.o
+crypto-objs-$(CONFIG_CRYPTO_CCM) += ccm.o
+crypto-objs-$(CONFIG_CRYPTO_CHACHA20POLY1305) += chacha20poly1305.o
+crypto-objs-$(CONFIG_CRYPTO_AEGIS128) += aegis128.o
 aegis128-y := aegis128-core.o
 
 ifeq ($(ARCH),arm)
@@ -123,64 +123,64 @@ endif
 # Enable <arm_neon.h>
 CFLAGS_aegis128-neon-inner.o += -isystem $(shell $(CC) -print-file-name=include)
 
-obj-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
-obj-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
-obj-$(CONFIG_CRYPTO_DES) += des_generic.o
-obj-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
-obj-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
-obj-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
-obj-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
-obj-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
-obj-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
+crypto-objs-$(CONFIG_CRYPTO_PCRYPT) += pcrypt.o
+crypto-objs-$(CONFIG_CRYPTO_CRYPTD) += cryptd.o
+crypto-objs-$(CONFIG_CRYPTO_DES) += des_generic.o
+crypto-objs-$(CONFIG_CRYPTO_FCRYPT) += fcrypt.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH) += blowfish_generic.o
+crypto-objs-$(CONFIG_CRYPTO_BLOWFISH_COMMON) += blowfish_common.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH) += twofish_generic.o
+crypto-objs-$(CONFIG_CRYPTO_TWOFISH_COMMON) += twofish_common.o
+crypto-objs-$(CONFIG_CRYPTO_SERPENT) += serpent_generic.o
 CFLAGS_serpent_generic.o := $(call cc-option,-fsched-pressure)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
-obj-$(CONFIG_CRYPTO_AES) += aes.o
-obj-$(CONFIG_CRYPTO_SM4) += sm4.o
-obj-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
-obj-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
-obj-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
-obj-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
-obj-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
-obj-$(CONFIG_CRYPTO_ARC4) += arc4.o
-obj-$(CONFIG_CRYPTO_TEA) += tea.o
-obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
-obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
-obj-$(CONFIG_CRYPTO_SEED) += seed.o
-obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
-obj-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
+crypto-objs-$(CONFIG_CRYPTO_AES) += aes.o
+crypto-objs-$(CONFIG_CRYPTO_SM4) += sm4.o
+crypto-objs-$(CONFIG_CRYPTO_SM4_GENERIC) += sm4_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAMELLIA) += camellia_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST_COMMON) += cast_common.o
+crypto-objs-$(CONFIG_CRYPTO_CAST5) += cast5_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CAST6) += cast6_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ARC4) += arc4.o
+crypto-objs-$(CONFIG_CRYPTO_TEA) += tea.o
+crypto-objs-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
+crypto-objs-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
+crypto-objs-$(CONFIG_CRYPTO_SEED) += seed.o
+crypto-objs-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
+crypto-objs-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
-obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
-obj-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
+crypto-objs-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
+crypto-objs-$(CONFIG_CRYPTO_CRC32C) += crc32c-cryptoapi.o
 crc32c-cryptoapi-y := crc32c.o
-obj-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
+crypto-objs-$(CONFIG_CRYPTO_CRC32) += crc32-cryptoapi.o
 crc32-cryptoapi-y := crc32.o
-obj-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
-obj-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
-obj-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
-obj-$(CONFIG_CRYPTO_LZ4) += lz4.o
-obj-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
-obj-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
-obj-$(CONFIG_CRYPTO_842) += 842.o
-obj-$(CONFIG_CRYPTO_RNG2) += rng.o
-obj-$(CONFIG_CRYPTO_DRBG) += drbg.o
-obj-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
+crypto-objs-$(CONFIG_CRYPTO_AUTHENC) += authenc.o authencesn.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5ENC) += krb5enc.o
+crypto-objs-$(CONFIG_CRYPTO_LZO) += lzo.o lzo-rle.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4) += lz4.o
+crypto-objs-$(CONFIG_CRYPTO_LZ4HC) += lz4hc.o
+crypto-objs-$(CONFIG_CRYPTO_XXHASH) += xxhash_generic.o
+crypto-objs-$(CONFIG_CRYPTO_842) += 842.o
+crypto-objs-$(CONFIG_CRYPTO_RNG2) += rng.o
+crypto-objs-$(CONFIG_CRYPTO_DRBG) += drbg.o
+crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY) += jitterentropy_rng.o
 CFLAGS_jitterentropy.o = -O0
 KASAN_SANITIZE_jitterentropy.o = n
 UBSAN_SANITIZE_jitterentropy.o = n
 jitterentropy_rng-y := jitterentropy.o jitterentropy-kcapi.o
-obj-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
-obj-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
-obj-$(CONFIG_CRYPTO_USER_API) += af_alg.o
-obj-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
-obj-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
-obj-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
-obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
-obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
-obj-$(CONFIG_CRYPTO_ECC) += ecc.o
-obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
+crypto-objs-$(CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE) += jitterentropy-testing.o
+crypto-objs-$(CONFIG_CRYPTO_BENCHMARK) += tcrypt.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API) += af_alg.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_HASH) += algif_hash.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_SKCIPHER) += algif_skcipher.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_RNG) += algif_rng.o
+crypto-objs-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
+crypto-objs-$(CONFIG_CRYPTO_ZSTD) += zstd.o
+crypto-objs-$(CONFIG_CRYPTO_ECC) += ecc.o
+crypto-objs-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
-obj-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECDH) += ecdh_generic.o
 
 $(obj)/ecrdsa_params.asn1.o: $(obj)/ecrdsa_params.asn1.c $(obj)/ecrdsa_params.asn1.h
 $(obj)/ecrdsa_pub_key.asn1.o: $(obj)/ecrdsa_pub_key.asn1.c $(obj)/ecrdsa_pub_key.asn1.h
@@ -188,23 +188,23 @@ $(obj)/ecrdsa.o: $(obj)/ecrdsa_params.asn1.h $(obj)/ecrdsa_pub_key.asn1.h
 ecrdsa_generic-y += ecrdsa.o
 ecrdsa_generic-y += ecrdsa_params.asn1.o
 ecrdsa_generic-y += ecrdsa_pub_key.asn1.o
-obj-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
+crypto-objs-$(CONFIG_CRYPTO_ECRDSA) += ecrdsa_generic.o
 
 #
 # generic algorithms and the async_tx api
 #
-obj-$(CONFIG_XOR_BLOCKS) += xor.o
+crypto-objs-$(CONFIG_XOR_BLOCKS) += xor.o
 obj-$(CONFIG_ASYNC_CORE) += async_tx/
 obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys/
 crypto_simd-y := simd.o
-obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
+crypto-objs-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 
 #
 # Key derivation function
 #
-obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
+crypto-objs-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 
-obj-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
+crypto-objs-$(CONFIG_CRYPTO_DF80090A) += df_sp80090a.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
 
diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index bc65d3b98dcbf..bccf6952e0e5a 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -3,26 +3,26 @@
 # Makefile for asymmetric cryptographic keys
 #
 
-obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
+crypto-objs-$(CONFIG_ASYMMETRIC_KEY_TYPE) += asymmetric_keys.o
 
 asymmetric_keys-y := \
 	asymmetric_type.o \
 	restrict.o \
 	signature.o
 
-obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
+crypto-objs-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) += public_key.o
 
 #
 # X.509 Certificate handling
 #
-obj-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
+crypto-objs-$(CONFIG_X509_CERTIFICATE_PARSER) += x509_key_parser.o
 x509_key_parser-y := \
 	x509.asn1.o \
 	x509_akid.asn1.o \
 	x509_cert_parser.o \
 	x509_loader.o \
 	x509_public_key.o
-obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
+crypto-objs-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
 x509_selftest-y += selftest.o
 x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_RSA) += selftest_rsa.o
 x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA) += selftest_ecdsa.o
@@ -37,7 +37,7 @@ $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
 #
 # PKCS#8 private key handling
 #
-obj-$(CONFIG_PKCS8_PRIVATE_KEY_PARSER) += pkcs8_key_parser.o
+crypto-objs-$(CONFIG_PKCS8_PRIVATE_KEY_PARSER) += pkcs8_key_parser.o
 pkcs8_key_parser-y := \
 	pkcs8.asn1.o \
 	pkcs8_parser.o
@@ -50,7 +50,7 @@ clean-files	+= pkcs8.asn1.c pkcs8.asn1.h
 #
 # PKCS#7 message handling
 #
-obj-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
+crypto-objs-$(CONFIG_PKCS7_MESSAGE_PARSER) += pkcs7_message.o
 pkcs7_message-y := \
 	pkcs7.asn1.o \
 	pkcs7_parser.o \
@@ -63,14 +63,14 @@ $(obj)/pkcs7.asn1.o: $(obj)/pkcs7.asn1.c $(obj)/pkcs7.asn1.h
 #
 # PKCS#7 parser testing key
 #
-obj-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
+crypto-objs-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
 pkcs7_test_key-y := \
 	pkcs7_key_type.o
 
 #
 # Signed PE binary-wrapped key handling
 #
-obj-$(CONFIG_SIGNED_PE_FILE_VERIFICATION) += verify_signed_pefile.o
+crypto-objs-$(CONFIG_SIGNED_PE_FILE_VERIFICATION) += verify_signed_pefile.o
 
 verify_signed_pefile-y := \
 	verify_pefile.o \
diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 86292965f4930..bd21129816183 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -114,6 +114,7 @@ int restrict_link_by_signature(struct key *dest_keyring,
 	key_put(key);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_signature);
 
 /**
  * restrict_link_by_ca - Restrict additions to a ring of CA keys
@@ -198,6 +199,7 @@ int restrict_link_by_digsig(struct key *dest_keyring,
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  trust_keyring);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_digsig);
 
 static bool match_either_id(const struct asymmetric_key_id **pair,
 			    const struct asymmetric_key_id *single)
diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
index 1f3b227ba7f22..4ef1c677cf70d 100644
--- a/crypto/asymmetric_keys/verify_pefile.c
+++ b/crypto/asymmetric_keys/verify_pefile.c
@@ -454,3 +454,4 @@ int verify_pefile_signature(const void *pebuf, unsigned pelen,
 	kfree_sensitive(ctx.digest);
 	return ret;
 }
+EXPORT_SYMBOL_GPL(verify_pefile_signature);
diff --git a/crypto/async_tx/Makefile b/crypto/async_tx/Makefile
index 056e482453730..9642987ebd717 100644
--- a/crypto/async_tx/Makefile
+++ b/crypto/async_tx/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_ASYNC_CORE) += async_tx.o
-obj-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
-obj-$(CONFIG_ASYNC_XOR) += async_xor.o
-obj-$(CONFIG_ASYNC_PQ) += async_pq.o
-obj-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
-obj-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
+crypto-objs-$(CONFIG_ASYNC_CORE) += async_tx.o
+crypto-objs-$(CONFIG_ASYNC_MEMCPY) += async_memcpy.o
+crypto-objs-$(CONFIG_ASYNC_XOR) += async_xor.o
+crypto-objs-$(CONFIG_ASYNC_PQ) += async_pq.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_RECOV) += async_raid6_recov.o
+crypto-objs-$(CONFIG_ASYNC_RAID6_TEST) += raid6test.o
diff --git a/crypto/fips140/Makefile b/crypto/fips140/Makefile
index c3612c24df296..3ec276a51ae9e 100644
--- a/crypto/fips140/Makefile
+++ b/crypto/fips140/Makefile
@@ -1,11 +1,23 @@
 
 crypto-objs-y += \
-	fips140-module.o 
+	fips140-module.o  \
+	fips140-var-redirect-fips.o
 
-obj-y += fips140-loader.o
+obj-y += fips140-loader.o fips140-var-redirect-main.o
 
 CFLAGS_fips140-fn-redirect.o += -I$(obj)
 CFLAGS_fips140-module.o += -DFIPS140_CORE
+CFLAGS_fips140-var-redirect-fips.o += -DFIPS140_CORE
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
 
 clean-files:= .fips140.order .fips140.symvers .fips140-fn-redirect.h .fips140.exported .fips140.hmac .fips140.ko.btf
 ifdef CONFIG_CRYPTO_FIPS140_DUAL_VERSION
diff --git a/crypto/fips140/fips140-var-redirect.c b/crypto/fips140/fips140-var-redirect.c
new file mode 100644
index 0000000000000..35da3805e3b8d
--- /dev/null
+++ b/crypto/fips140/fips140-var-redirect.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/*
+ * Variable redirect stubs for the FIPS140 pluggable interface.
+ * These create pointer indirections in vmlinux for variables that
+ * are defined in fips140.ko, allowing vmlinux code to access them
+ * through CRYPTO_VAR_NAME() pointers populated at module load time.
+ */
+
+/*
+ * crypto/md5.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_MD5)
+
+#include <crypto/md5.h>
+
+#undef md5_zero_message_hash
+DEFINE_CRYPTO_VAR_STUB(md5_zero_message_hash);
+
+#endif
+
+/*
+ * crypto/asymmetric_keys/asymmetric_type.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+
+#include <keys/asymmetric-type.h>
+
+#undef key_type_asymmetric
+DEFINE_CRYPTO_VAR_STUB(key_type_asymmetric);
+
+#endif
+
+/*
+ * crypto/asymmetric_keys/public_key.c
+ */
+#if IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+
+#include <crypto/public_key.h>
+
+#undef public_key_subtype
+DEFINE_CRYPTO_VAR_STUB(public_key_subtype);
+
+#endif
+
+/*
+ * crypto/sm4.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_SM4)
+
+#include <crypto/sm4.h>
+
+#undef crypto_sm4_fk
+#undef crypto_sm4_ck
+#undef crypto_sm4_sbox
+DEFINE_CRYPTO_VAR_STUB(crypto_sm4_fk);
+DEFINE_CRYPTO_VAR_STUB(crypto_sm4_ck);
+DEFINE_CRYPTO_VAR_STUB(crypto_sm4_sbox);
+
+#endif
+
+/*
+ * crypto/cast_common.c
+ */
+#if IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+
+#include <crypto/cast_common.h>
+
+#undef cast_s1
+#undef cast_s2
+#undef cast_s3
+#undef cast_s4
+DEFINE_CRYPTO_VAR_STUB(cast_s1);
+DEFINE_CRYPTO_VAR_STUB(cast_s2);
+DEFINE_CRYPTO_VAR_STUB(cast_s3);
+DEFINE_CRYPTO_VAR_STUB(cast_s4);
+
+#endif
\ No newline at end of file
diff --git a/crypto/krb5/Makefile b/crypto/krb5/Makefile
index d38890c0b2472..513759fc8dccf 100644
--- a/crypto/krb5/Makefile
+++ b/crypto/krb5/Makefile
@@ -15,4 +15,4 @@ krb5-$(CONFIG_CRYPTO_KRB5_SELFTESTS) += \
 	selftest.o \
 	selftest_data.o
 
-obj-$(CONFIG_CRYPTO_KRB5) += krb5.o
+crypto-objs-$(CONFIG_CRYPTO_KRB5) += krb5.o
diff --git a/include/crypto/cast_common.h b/include/crypto/cast_common.h
index b900902441646..16de2c16bc174 100644
--- a/include/crypto/cast_common.h
+++ b/include/crypto/cast_common.h
@@ -2,9 +2,18 @@
 #ifndef _CRYPTO_CAST_COMMON_H
 #define _CRYPTO_CAST_COMMON_H
 
-extern const u32 cast_s1[256];
-extern const u32 cast_s2[256];
-extern const u32 cast_s3[256];
-extern const u32 cast_s4[256];
+#include <crypto/fips140-redirect.h>
+
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s1, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s2, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s3, const u32, [256]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_CAST_COMMON, cast_s4, const u32, [256]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_CAST_COMMON)
+#define cast_s1 (((const u32*)CRYPTO_VAR_NAME(cast_s1)))
+#define cast_s2 (((const u32*)CRYPTO_VAR_NAME(cast_s2)))
+#define cast_s3 (((const u32*)CRYPTO_VAR_NAME(cast_s3)))
+#define cast_s4 (((const u32*)CRYPTO_VAR_NAME(cast_s4)))
+#endif
 
 #endif
diff --git a/include/crypto/md5.h b/include/crypto/md5.h
index c47aedfe67ecd..5f1118da21546 100644
--- a/include/crypto/md5.h
+++ b/include/crypto/md5.h
@@ -20,7 +20,13 @@
 #define CRYPTO_MD5_STATESIZE \
 	CRYPTO_HASH_STATESIZE(MD5_STATE_SIZE, MD5_HMAC_BLOCK_SIZE)
 
-extern const u8 md5_zero_message_hash[MD5_DIGEST_SIZE];
+#include <crypto/fips140-redirect.h>
+
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_MD5, md5_zero_message_hash, const u8, [MD5_DIGEST_SIZE]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_MD5)
+#define md5_zero_message_hash (((const u8*)CRYPTO_VAR_NAME(md5_zero_message_hash)))
+#endif
 
 struct md5_state {
 	u32 hash[MD5_HASH_WORDS];
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 4c5199b20338f..0ab9067d0995a 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -13,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/keyctl.h>
 #include <linux/oid_registry.h>
+#include <crypto/fips140-redirect.h>
 
 /*
  * Cryptographic data for the public-key subtype of the asymmetric key type.
@@ -55,7 +56,11 @@ struct public_key_signature {
 
 extern void public_key_signature_free(struct public_key_signature *sig);
 
-extern struct asymmetric_key_subtype public_key_subtype;
+DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE, public_key_subtype, struct asymmetric_key_subtype, );
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE)
+#define public_key_subtype (*((struct asymmetric_key_subtype*)CRYPTO_VAR_NAME(public_key_subtype)))
+#endif
 
 struct key;
 struct key_type;
diff --git a/include/crypto/rng.h b/include/crypto/rng.h
index 07f494b2c8817..94a5cdd8695ac 100644
--- a/include/crypto/rng.h
+++ b/include/crypto/rng.h
@@ -14,6 +14,7 @@
 #include <linux/crypto.h>
 #include <linux/fips.h>
 #include <linux/random.h>
+#include <crypto/fips140-redirect.h>
 
 struct crypto_rng;
 
diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
index 9656a9a403264..43db9322863be 100644
--- a/include/crypto/sm4.h
+++ b/include/crypto/sm4.h
@@ -11,6 +11,7 @@
 
 #include <linux/types.h>
 #include <linux/crypto.h>
+#include <crypto/fips140-redirect.h>
 
 #define SM4_KEY_SIZE	16
 #define SM4_BLOCK_SIZE	16
@@ -21,9 +22,15 @@ struct sm4_ctx {
 	u32 rkey_dec[SM4_RKEY_WORDS];
 };
 
-extern const u32 crypto_sm4_fk[];
-extern const u32 crypto_sm4_ck[];
-extern const u8 crypto_sm4_sbox[];
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_SM4, crypto_sm4_fk, const u32, [4]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_SM4, crypto_sm4_ck, const u32, [32]);
+DECLARE_CRYPTO_VAR(CONFIG_CRYPTO_SM4, crypto_sm4_sbox, const u8, [256]);
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_CRYPTO_SM4)
+#define crypto_sm4_fk (((const u32*)CRYPTO_VAR_NAME(crypto_sm4_fk)))
+#define crypto_sm4_ck (((const u32*)CRYPTO_VAR_NAME(crypto_sm4_ck)))
+#define crypto_sm4_sbox (((const u8*)CRYPTO_VAR_NAME(crypto_sm4_sbox)))
+#endif
 
 /**
  * sm4_expandkey - Expands the SM4 key as described in GB/T 32907-2016
diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
index 1b91c8f98688d..e38f4d60c9c1d 100644
--- a/include/keys/asymmetric-type.h
+++ b/include/keys/asymmetric-type.h
@@ -12,8 +12,13 @@
 
 #include <linux/key-type.h>
 #include <linux/verification.h>
+#include <crypto/fips140-redirect.h>
 
-extern struct key_type key_type_asymmetric;
+DECLARE_CRYPTO_VAR(CONFIG_ASYMMETRIC_KEY_TYPE, key_type_asymmetric, struct key_type, );
+
+#if defined(CONFIG_CRYPTO_FIPS140_EXTMOD) && !defined(FIPS_MODULE) && IS_BUILTIN(CONFIG_ASYMMETRIC_KEY_TYPE)
+#define key_type_asymmetric (*((struct key_type*)CRYPTO_VAR_NAME(key_type_asymmetric)))
+#endif
 
 /*
  * The key payload is four words.  The asymmetric-type key uses them as
-- 
2.47.3


