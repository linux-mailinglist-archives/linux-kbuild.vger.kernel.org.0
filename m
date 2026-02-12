Return-Path: <linux-kbuild+bounces-11131-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8COWGVo+jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11131-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CC5129388
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:43:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A1833016B24
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:43:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F7A71F4174;
	Thu, 12 Feb 2026 02:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RsFzxNzH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com [50.112.246.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171161624C0;
	Thu, 12 Feb 2026 02:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=50.112.246.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864213; cv=none; b=RY+5YsgJAk8vKajOPcyr226QKZBQUgGycIi0nJb5pQ6m2bymq1eDmP/maiTOF8GBnM1OyyJmBuxEynq4Js8kLWr5P482ObhH3JhTa0subXqG6oxvGhuZZvZy+xRhVZ2NACD9p2UKbRF4R8MphpdFjXDoXkHhQ2Dh7jp6K5/kXsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864213; c=relaxed/simple;
	bh=EGj9J5c89BQTnewO+04vZtxnh/2UlP+5KUiyihXEZOM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qe+nWWT4Ivz0Ak6g5py1Q9RgbpVRTmSBVkPXvpw3h5rNZTrumkvUqrlynZhwwq6hq7ggefFp1sPNSckDnb4mMSo1qEKimTa8RPwsS1uA4ONqIbLyAWyM4RZiMbSPxpfd1fWmoP1773Owhkodu8Nr//N2C+XpQtRyT8cQRs7DTn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RsFzxNzH; arc=none smtp.client-ip=50.112.246.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864212; x=1802400212;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FGaKTq4xDCjTwRgsCsx+MJqg359eKvabti85iEL3Afc=;
  b=RsFzxNzHeLghgaOzgkmaiNzms/k9/zujrPsOk6lGZ9WCdPIeSQjil2Yy
   iwhE9psR2gz/p4yoclB2YNUktp4t+VSWaXruru5ZGVWW/G9GWcPlruT2m
   kdpJ/he7vXGjkoTLy+mtlFrYPF3wwX1OIQlCFmEQBtLARy5ZPgrjoyumO
   7HZOO/GRAPmeBOx48TIeqJpoH9j59zRQjufSE5MCXccSAfU1FVXZnsSxz
   k31Mr2Ho6cMtR0AC1zDHF/WQ6y1IAKwp92qn/x1W5pGQ76N1oxXKNdswV
   sqlcNwYAOHa6pjhWQmMZqzLQ2AnpnAeXx/G0bzRgnkQGl+fGSaJnv9Zj7
   A==;
X-CSE-ConnectionGUID: lu+7iIfzSSqzKNnKSQQ3bQ==
X-CSE-MsgGUID: QKSzoIODRsWY+FUXA6e2RQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12743690"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-015.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:43:31 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:24283]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.238:2525] with esmtp (Farcaster)
 id 3e322111-5394-49ae-a206-4c78e391b85e; Thu, 12 Feb 2026 02:43:31 +0000 (UTC)
X-Farcaster-Flow-ID: 3e322111-5394-49ae-a206-4c78e391b85e
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:43:30 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:43:30 +0000
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
Subject: [PATCH 04/17] build: Add ELF marker for crypto-objs-m modules
Date: Thu, 12 Feb 2026 02:42:08 +0000
Message-ID: <20260212024228.6267-5-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D044UWA002.ant.amazon.com (10.13.139.11) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11131-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 79CC5129388
X-Rspamd-Action: no action

Previously, crypto-objs-$(CONFIG_*) behavior depends on the config value.
When CONFIG_*=y, crypto is built into fips140.ko. When CONFIG_*=m, crypto
is already built as a separate module (e.g., aes.ko), so previous patches
do not affect such modules.

This patch adds an ELF marker to identify modules built with CONFIG_*=m
so they can be distinguished as part of the CONFIG_CRYPTO_FIPS140_EXTMOD
framework. This gives module loaders a way to tell the module is included
in crypto-objs-m.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/fips140/fips140-crypto-module-marker.h |  8 ++++++++
 scripts/Makefile.build                        | 15 +++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 crypto/fips140/fips140-crypto-module-marker.h

diff --git a/crypto/fips140/fips140-crypto-module-marker.h b/crypto/fips140/fips140-crypto-module-marker.h
new file mode 100644
index 000000000000..eadca087cee2
--- /dev/null
+++ b/crypto/fips140/fips140-crypto-module-marker.h
@@ -0,0 +1,8 @@
+#ifndef _FIPS140_CRYPTO_MODULE_MARKER_H
+#define _FIPS140_CRYPTO_MODULE_MARKER_H
+
+/* Crypto module marker - automatically included for crypto-objs-m modules */
+static const char __fips140_crypto_marker[] 
+    __attribute__((section(".fips140_crypto_marker"), used)) = "FIPS140_CRYPTO_OBJS_M";
+
+#endif /* _FIPS140_CRYPTO_MODULE_MARKER_H */
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 018289da4ccd..cb21112472d4 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -68,6 +68,7 @@ obj-m += $(crypto-objs-m)
 ifndef CONFIG_CRYPTO_FIPS140_EXTMOD
 obj-y += $(crypto-objs-y)
 crypto-objs-y :=
+crypto-objs-m := $(filter-out $(crypto-objs-y),$(crypto-objs-m))
 endif
 
 # When an object is listed to be built compiled-in and modular,
@@ -130,6 +131,7 @@ multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 multi-crypto-objs-y := $(call multi-search, $(crypto-objs-y), .o, -objs -y)
+multi-crypto-objs-m := $(call multi-search, $(crypto-objs-m), .o, -objs -y -m)
 endif
 
 # Replace multi-part objects by their individual parts,
@@ -138,6 +140,7 @@ real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
 real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 real-crypto-objs-y := $(strip $(call real-search, $(crypto-objs-y), .o, -objs -y))
+real-crypto-objs-m := $(strip $(call real-search, $(crypto-objs-m), .o, -objs -y -m))
 endif
 
 always-y += $(always-m)
@@ -165,11 +168,13 @@ real-obj-y	:= $(addprefix $(obj)/, $(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/, $(real-obj-m))
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 real-crypto-objs-y := $(addprefix $(obj)/, $(real-crypto-objs-y))
+real-crypto-objs-m := $(addprefix $(obj)/, $(real-crypto-objs-m))
 endif
 multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/, $(subdir-ym))
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 multi-crypto-objs-y := $(addprefix $(obj)/, $(multi-crypto-objs-y))
+multi-crypto-objs-m := $(addprefix $(obj)/, $(multi-crypto-objs-m))
 endif
 endif
 
@@ -575,6 +580,16 @@ $(multi-crypto-objs-y): %.o: %.mod FORCE
 $(call multi_depend, $(multi-crypto-objs-y), .o, -objs -y -m)
 endif
 endif
+
+# Individual object compilation with version-specific flags
+$(real-crypto-objs-m): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1 -include $(srctree)/crypto/fips140/fips140-crypto-module-marker.h
+
+# Also set flags for individual objects that make up composite crypto objects
+$(foreach obj,$(multi-crypto-objs-m),$($(obj:.o=-y))): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1
+$(foreach obj,$(multi-crypto-objs-m),$($(obj:.o=-objs))): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1
+
+# Multi-part crypto objects
+$(multi-crypto-objs-m): private KBUILD_CFLAGS += -DFIPS140_CRYPTO_OBJS_M=1 -include $(srctree)/crypto/fips140/fips140-crypto-module-marker.h
 endif
 # This is a list of build artifacts from the current Makefile and its
 # sub-directories. The timestamp should be updated when any of the member files.
-- 
2.47.3


