Return-Path: <linux-kbuild+bounces-11143-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDNmHRI/jWmq0QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11143-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B11294B0
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86EB2308A9ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 02:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153A41D7E42;
	Thu, 12 Feb 2026 02:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="W8SynM4Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.77.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAD1137750;
	Thu, 12 Feb 2026 02:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.77.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770864399; cv=none; b=ZYQDXefne4lXXuUfSBb6NupJZd/4XT6XD9VqX/Mo4Djk6LuSxkz1DLmo1C6iT2XSv0+4gelYpKkl6+763yyWnk+g2vOI1EyhaFdxzyT0XiAnqqMPHbc4YI4CP/FGqoEfL5oFNeAL6qnN7Kl8xBC2kylUJMJA+Wz+cU8nszIZBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770864399; c=relaxed/simple;
	bh=hEE9cLPiHgg1uugbyGsf37REIqUYJezhNCoIAIOPX74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikHk6RafCGk0cWPsnchaedHAXPiUJNfgvTHOcYTL9PbA1gh9QjVJyyI2RBBAwpl7CBcGakxacmI9XeNAXUrPz4PEJmAavmCh4/dJl0IyLfaIru8wb0WhJ0UX1vDLtiu3jXbi/w4YRkHqZmortiHUpCa898LxihWPn9fJXrf7JPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=W8SynM4Y; arc=none smtp.client-ip=44.246.77.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770864397; x=1802400397;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r1ccqnXvznzNGogOKvANquFZ3Qvedb0hNet0hrKXo3Q=;
  b=W8SynM4Yc9K8PK8x6nC1adaOO9LMy0J48bSC2EyDXCkWxC3gY3u9jxR9
   e8kUOFU1ZeLzku7CTpKYAS692DVjQhw/7RYWXBRLk9bWr4j8zcfI4abdS
   ZrU1QqnbCZgOBpOYYPoJLsUsURoiTWIy8E8EQn0S2gThm/9Cxfl90eOKx
   GbAw8Ph00ddyMQfrpzJiVxrqDGLXVnLTG5ZHnyVeT0ep1aSaCBlCOvDyL
   3jxfQSkncasSMYFkVELilZHLA67DzvcLZL9UjjOVVY4uZShJ8JEy/o8CM
   YHBQ7YULtkBEocNQkA/uctEz+j2qQwVQgRzvyC2tE+aAyqfGw8dlb9UgD
   Q==;
X-CSE-ConnectionGUID: LLn5dxOQSLSwSisd4bhCkA==
X-CSE-MsgGUID: F2CPcaJ2QseDGee8gTHivQ==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12914007"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-004.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 02:46:37 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:29551]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.40.228:2525] with esmtp (Farcaster)
 id caf039b4-492c-49c0-91ab-1e3376292296; Thu, 12 Feb 2026 02:46:37 +0000 (UTC)
X-Farcaster-Flow-ID: caf039b4-492c-49c0-91ab-1e3376292296
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:37 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 02:46:36 +0000
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
Subject: [PATCH 16/17] arm64: crypto: to convert exported crypto symbols into pluggable interface for arm64 cryptos
Date: Thu, 12 Feb 2026 02:42:20 +0000
Message-ID: <20260212024228.6267-17-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D043UWA002.ant.amazon.com (10.13.139.53) To
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
	TAGGED_FROM(0.00)[bounces-11143-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: CD9B11294B0
X-Rspamd-Action: no action

Prepare to convert exported crypto symbols in arm64 cryptos
into pluggable interface. This patch introduces architecture specific
crypto API definition file `fips140-api.c`.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 arch/arm64/crypto/Makefile              |  3 +++
 arch/arm64/crypto/fips140/Makefile      | 14 ++++++++++++++
 arch/arm64/crypto/fips140/fips140-api.c |  0
 3 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/crypto/fips140/Makefile
 create mode 100644 arch/arm64/crypto/fips140/fips140-api.c

diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index 3574e917bc37..9f7106424d66 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -40,3 +40,6 @@ aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
+
+# FIPS 140 kernel module
+obj-$(CONFIG_CRYPTO_FIPS140_EXTMOD) += fips140/
\ No newline at end of file
diff --git a/arch/arm64/crypto/fips140/Makefile b/arch/arm64/crypto/fips140/Makefile
new file mode 100644
index 000000000000..0a150ab16027
--- /dev/null
+++ b/arch/arm64/crypto/fips140/Makefile
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
diff --git a/arch/arm64/crypto/fips140/fips140-api.c b/arch/arm64/crypto/fips140/fips140-api.c
new file mode 100644
index 000000000000..e69de29bb2d1
-- 
2.47.3


