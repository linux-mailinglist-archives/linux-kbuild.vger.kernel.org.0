Return-Path: <linux-kbuild+bounces-12832-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NJOAUPP4mm4+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12832-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:24:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2241F67B
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:24:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 962103017A3F
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FF241DEFE8;
	Sat, 18 Apr 2026 00:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="cS6QpZpd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9381E5724;
	Sat, 18 Apr 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471869; cv=none; b=CFyWvELksfJTvkWSvcikZ//D+WV3YCFe/EaeMBxHfObDHKtwafnG207lWuq+HA14/GyrRwET4SaeVH1zD1nTDx+ju6wqBoC22L/7y5Whk2HkTrybFsac8iF4SuSnU9wsIsG8IJbFr2XD7TTo9cE5sVW2xfkIBa64FrSKFEawS3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471869; c=relaxed/simple;
	bh=/6ko8xIFttQt9Fq3lB4po19I6Mdz+gDfPmTmFuchLlM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=juKJoq1xmRspFNNEAFPtyszAPKToX5/StWjStI4Xl6ig3FYWkIrWwtAZsh9ZScYyurhQUSyDc8Wqsji5EuAt7S+wHxciLF5zlNAoMFhbgnBzNcYAg6OWGsl3BMTN/C4LvJ276HxgpmTC6Q09M/cUYtGAXAtn0jtK2yz6TB9DxvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=cS6QpZpd; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471868; x=1808007868;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=byV7NB9IL1memoSsQz2/iUUpNMXGZbfmUV6QHbGPUlE=;
  b=cS6QpZpdUc4Zr3vZarly/UeoyXJfiJFiZvBDWPBR6rwy1eOXh/l2qcsM
   v7PY7W8PFjb4HMm/uPbOSJe0jPKvkGoqDiwstkCLJBFzOqiMS7C59TT0E
   R3/5EDobUWq63Y6ElYcZYCi0kKuxPYoMnympreeteZKEFTyvBER6ScCKv
   kx8zJz58VkTXMfbdQ/wIF3J+8lxYljAQa73P3dPDWygOVhOlZzskldLTE
   a/qwYEL0FDE+8kWsNgMSTPvPxHxaAPBk8Qb426iUVqCU7yZQZFS0/CZbS
   9eEIPrTmIi+ixLCaO7g132tDlVE9i1WKKtHl1j+EJldAyc9xw4/kLzOlR
   A==;
X-CSE-ConnectionGUID: rXOSviXqQrKoFNQ3rSku9A==
X-CSE-MsgGUID: pO4nwcswRgyo5TZlxXhL0g==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17612870"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:24:27 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:15293]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id e505477a-475d-40fb-861c-e9f890d2e32e; Sat, 18 Apr 2026 00:24:27 +0000 (UTC)
X-Farcaster-Flow-ID: e505477a-475d-40fb-861c-e9f890d2e32e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:27 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:24:26 +0000
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
Subject: [PATCH v2 15/19] crypto: fips140: add module integrity self-check
Date: Sat, 18 Apr 2026 00:20:23 +0000
Message-ID: <20260418002032.2877-16-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA001.ant.amazon.com (10.13.139.103) To
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
	TAGGED_FROM(0.00)[bounces-12832-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01D2241F67B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add verify_integrity() function to perform HMAC-SHA256 self verification
of this standalone crypto module against pre-computed hash. This integrity
self-check is required by FIPS 140-3.

This patch is picked from Vegard Nossum <vegard.nossum@oracle.com> with
minor modifications.

Co-developed-by: Vegard Nossum <vegard.nossum@oracle.com>
Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/Kconfig          |  2 ++
 crypto/fips140/fips140-module.c | 52 +++++++++++++++++++++++++++++++++
 crypto/fips140/fips140-module.h |  4 +++
 3 files changed, 58 insertions(+)

diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
index 7d8997aa10945..85d2c99579549 100644
--- a/crypto/fips140/Kconfig
+++ b/crypto/fips140/Kconfig
@@ -2,6 +2,8 @@ config CRYPTO_FIPS140_EXTMOD
 	bool "FIPS 140 compliant algorithms as a kernel module"
 	depends on CRYPTO && (X86_64 || ARM64) && MODULES
 	select CRYPTO_FIPS
+	select CRYPTO_SHA256
+	select CRYPTO_HMAC
 	help
 	  This option enables building a kernel module that contains
 	  copies of crypto algorithms that are built in a way that
diff --git a/crypto/fips140/fips140-module.c b/crypto/fips140/fips140-module.c
index 8767d98baacd9..1e68c509d2db0 100644
--- a/crypto/fips140/fips140-module.c
+++ b/crypto/fips140/fips140-module.c
@@ -16,6 +16,54 @@
 
 #define CRYPTO_INTERNAL "CRYPTO_INTERNAL"
 
+static const u8 fips140_integ_hmac_key[] = CONFIG_CRYPTO_FIPS140_HMAC_KEY;
+
+static int verify_integrity(void)
+{
+	extern const u8 *_binary_crypto_ko_start;
+	extern const u8 *_binary_crypto_ko_end;
+	extern const u8 *_binary_crypto_hmac_start;
+	
+	struct crypto_shash *tfm;
+	SHASH_DESC_ON_STACK(desc, tfm);
+	u8 digest[SHA256_DIGEST_SIZE];
+	int err;
+
+	tfm = crypto_alloc_shash("hmac(sha256)", 0, 0);
+	if (IS_ERR(tfm))
+		panic("FIPS 140: failed to allocate hmac tfm (%ld)\n", PTR_ERR(tfm));
+
+	desc->tfm = tfm;
+
+	err = crypto_shash_setkey(tfm, fips140_integ_hmac_key, sizeof(fips140_integ_hmac_key) - 1);
+	if (err)
+		panic("FIPS 140: crypto_shash_setkey() failed: %d\n", err);
+
+	err = crypto_shash_init(desc);
+	if (err)
+		panic("FIPS 140: crypto_shash_init() failed: %d\n", err);
+
+	err = crypto_shash_update(desc, _binary_crypto_ko_start, _binary_crypto_ko_end - _binary_crypto_ko_start);
+	if (err)
+		panic("FIPS 140: crypto_shash_update() failed: %d\n", err);
+
+	err = crypto_shash_final(desc, digest);
+	if (err)
+		panic("FIPS 140: crypto_shash_final() failed: %d\n", err);
+
+	shash_desc_zero(desc);
+
+	if (memcmp(digest, _binary_crypto_hmac_start, sizeof(digest)))
+		panic("FIPS 140: failed integrity check\n");
+
+	pr_info("FIPS 140: integrity verification passed\n");
+
+	crypto_free_shash(tfm);
+	memzero_explicit(digest, sizeof(digest));
+
+	return 0;
+}
+
 /*
  * Run FIPS module initcalls level by level, synchronizing with the
  * kernel's initcall progression.
@@ -85,6 +133,10 @@ static int __init fips140_init(void)
     pr_info("loading " FIPS140_MODULE_NAME "\n");
 
 	run_initcalls();
+
+	if (fips_enabled){
+		verify_integrity(); /* Panics if integrity check fails */
+	}
 	fips140_mark_module_level_complete(3);
     return 0;
 }
diff --git a/crypto/fips140/fips140-module.h b/crypto/fips140/fips140-module.h
index e95dac8eeda9e..b8968d54800ec 100644
--- a/crypto/fips140/fips140-module.h
+++ b/crypto/fips140/fips140-module.h
@@ -9,9 +9,13 @@
 #include <linux/module.h>
 #include <linux/crypto.h>
 #include <crypto/algapi.h>
+#include <crypto/hash.h>
+#include <crypto/sha2.h>
 #include <linux/init.h>
+#include <linux/string.h>
 #include <linux/atomic.h>
 #include <linux/wait.h>
+#include <linux/fips.h>
 
 /* FIPS140 synchronization between kernel and module */
 extern atomic_t fips140_kernel_level_complete;
-- 
2.47.3


