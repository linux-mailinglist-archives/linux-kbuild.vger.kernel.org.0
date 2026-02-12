Return-Path: <linux-kbuild+bounces-11142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMg0FgI/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11142-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:26 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB97312949B
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5CC1E3023B8E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B24D191484;
	Thu, 12 Feb 2026 02:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="tUTqJ/2Q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.155.198.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEAD8460;
	Thu, 12 Feb 2026 02:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.155.198.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864383; cv=none; b=Uo0Pqmaaw6O7nDklgXuQ84sFR7Y5X2bCd9Ds9otEAxcnPHzsfY/aFSunw6Pr85TEdMTV4XxlU9EC9AWlRzxHVyLINljADXuKunpfdi643kl9+mJl2bwv1ZfwkNBg1095bBGzjlyMxvZX+8tuiVFRJqgfjJwtOtHOEkDuLgMaTOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864383; c=relaxed/simple;
	bh=mnjf91rkcEyO5gwe2vyp9Dra1+c6tN2ihyvpgk3iljc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cC/SKH4ZloCEkTSYPeRcsQulZYA9X0fK5SSIqrkx9XcoELNzVUOYqFN5Of98FOynwxSGJ1gGYNeX3k17p2N3Z/F/ZIk2vjgvYMZAyQMZw2ttG79AI0DVAkALyrTcVgBEold7/YdNiURuH4Q/8okJLIXyPYYKyEboehzXPYeSqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=tUTqJ/2Q; arc=none smtp.client-ip=35.155.198.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864382; x=1802400382;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wbneh8UfA8Seb0DzTuFA1ZZfq/ud9cCo2i7ye2KFd40=;
  b=tUTqJ/2Q4E8fqsa/UcBk2+/GujkRZ+2XLe4dhIGuaWMorT3/MBhRm1xL
   Kd8m4nYQaNwgjOBqR+f8aEeDqM1Nv8Yfa6vPdg/u9dPk2wHx5OzCnclzl
   xws/A5jM6T30xgDkHI+l1L3n35exmtKhx0IWPfrdOXI/hMsJIebqMdD6n
   SvafYs5BvG6PJrwXFxfaqqG0XY8Ia4jcynuEVJxdxiKW6veEq7r03XmLu
   zwuhhRphNUnkJm6pPaIk3DXRAOuqmgTIuvrKPJdpYBmCFjLsB4NLvq1mB
   4qHA7sUlBbRZqgihffThvjIOumiRL8N3BBnaWe5R8p4el260okgD8zOa5
   Q==;
X-CSE-ConnectionGUID: DGUzZrLSTUyylITJehVvHQ==
X-CSE-MsgGUID: JP56y5aWSUe/LyCifnxanA==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12803013"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-009.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:22 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:4438]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.61.62:2525] with esmtp (Farcaster)
 id 5bd3107b-1ba7-4129-9707-344bc0b38f08; Thu, 12 Feb 2026 02:46:22 +0000 (UTC)
X-Farcaster-Flow-ID: 5bd3107b-1ba7-4129-9707-344bc0b38f08
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:21 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:21 +0000
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
Subject: [PATCH 15/17] x86: crypto: to convert exported crypto symbols into pluggable interface for x86 cryptos
Date: Thu, 12 Feb 2026 02:42:19 +0000
Message-ID: <20260212024228.6267-16-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D046UWA004.ant.amazon.com (10.13.139.76) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11142-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB97312949B
X-Rspamd-Action: no action

Prepare to convert exported crypto symbols in x86 cryptos
into pluggable interface. This patch introduces architecture specific
crypto API definition file `fips140-api.c`.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/x86/crypto/Makefile              |  3 +++
 arch/x86/crypto/fips140/Makefile      | 14 ++++++++++++++
 arch/x86/crypto/fips140/fips140-api.c |  0
 3 files changed, 17 insertions(+)
 create mode 100644 arch/x86/crypto/fips140/Makefile
 create mode 100644 arch/x86/crypto/fips140/fips140-api.c

diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index b21ad0978c52..ab248a1beb00 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -70,3 +70,6 @@ aria-aesni-avx2-x86_64-y := aria-aesni-avx2-asm_64.o aria_aesni_avx2_glue.o
 
 obj-$(CONFIG_CRYPTO_ARIA_GFNI_AVX512_X86_64) += aria-gfni-avx512-x86_64.o
 aria-gfni-avx512-x86_64-y := aria-gfni-avx512-asm_64.o aria_gfni_avx512_glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
diff --git a/arch/x86/crypto/fips140/Makefile b/arch/x86/crypto/fips140/Makefile
new file mode 100644
index 000000000000..0a150ab16027
--- /dev/null
+++ b/arch/x86/crypto/fips140/Makefile
@@ -0,0 +1,14 @@
+
+crypto-objs-y += fips140-api-fips.o
+
+obj-y += fips140-api-main.o
+
+# Explicit rules to compile same source to different objects
+$(obj)/fips140-api-main.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+$(obj)/fips140-api-fips.o: $(src)/fips140-api.c FORCE
+	$(call if_changed_rule,cc_o_c)
+
+CFLAGS_fips140-api-main.o += -I$(srctree)
+CFLAGS_fips140-api-fips.o += -I$(srctree)
\ No newline at end of file
diff --git a/arch/x86/crypto/fips140/fips140-api.c b/arch/x86/crypto/fips140/fips140-api.c
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.47.3


