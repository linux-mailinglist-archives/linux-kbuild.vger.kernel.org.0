Return-Path: <linux-kbuild+bounces-12818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AP0ICWbO4mm6+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12818-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:20:54 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D262241F523
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:20:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B2EF300C00A
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D475C199FAC;
	Sat, 18 Apr 2026 00:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="mDjvRUba"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.162.73.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E82BD11;
	Sat, 18 Apr 2026 00:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.162.73.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471650; cv=none; b=tCewiEz3RiO2P1l1wYvqzTvyHtlnu8liI7unGJ03I2frT2i+A5zuSAFoOIpxIjXqANSft/ZMrp9nIX1oJ8oJ/u23G3chLERGQcIBXzrkVHJwW6IJ4QQh0andDuqsb3Y+PydqGt4I7DmCNNsEl+YHp6zbwHd5M7GxxBNjdTGtSfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471650; c=relaxed/simple;
	bh=/S7GIJfOcvuW5erZnQGYTPQlFZgylRMka5vuuu/1/+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sT3i47Z4Z3CtWPSiXcfamAO8kq9mPSx38aywVUgoXjfPpCCuJ8Ds+w+Dvy3yOqMbiJzdn64W8po/zqhYE2lO3PaMcl866ndb1YWLJuyIoPBYr2VWS3TS/zg9ITCcuQvqFCt7F0kZLrU/vwEjCRtAY3MhYrM5L6yn3DrKjDcguWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=mDjvRUba; arc=none smtp.client-ip=35.162.73.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471649; x=1808007649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YKqhp+h5tr1j1YyBp1e3IhdY0y212x/JXc1mTvz9lyw=;
  b=mDjvRUbaV2ZJ50KK605AJ6TGmV0rISbLWctN1SoAaYiDH7Oa46kkIZsm
   4f6UVkXfoBwBuXKBjn0yDqKivEx2/LWAeDJBOkYYDMt0RD8AFNNU7k+ZI
   sLOb2tZAHPBZKFbnuIEcPhk/LMgspRrmQZMSe1OoEDO54SNQ0kP1gl2ga
   f11blthPE5UDl59wI8uPt3Culj/5ptbkYjbUm1rjRvF0G403CvXfIfXmM
   8VHbH7zM1ArCGOvTA8p6VCWHLZ3Kmy7t3I7lMTwlneNFV9C39NVdp/DVa
   PNTLCKAJ3PbzjiV4VVUI1llM/bAkQmzFpLdqiS9MSDgS2fV2J9RD88nzd
   g==;
X-CSE-ConnectionGUID: d7/VvQ+pR0OAUcKUhTLGdw==
X-CSE-MsgGUID: cff9/EewQPqqtx4+8XbMlQ==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17401470"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-012.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:20:49 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:9370]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.17.68:2525] with esmtp (Farcaster)
 id c1392d9f-f0b6-4027-b02a-fb741f7f05ff; Sat, 18 Apr 2026 00:20:49 +0000 (UTC)
X-Farcaster-Flow-ID: c1392d9f-f0b6-4027-b02a-fb741f7f05ff
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:20:49 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:20:48 +0000
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
Subject: [PATCH v2 01/19] crypto: add Kconfig options for standalone crypto module
Date: Sat, 18 Apr 2026 00:20:09 +0000
Message-ID: <20260418002032.2877-2-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWA002.ant.amazon.com (10.13.139.10) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12818-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: D262241F523
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add Kconfig option `CRYPTO_FIPS140_EXTMOD` to enable standalone crypto
module support that can override built-in cryptographic implementations.

Currently supports X86_64 and ARM64 architectures and requires CRYPTO
and MODULES to be enabled.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/Kconfig         |  1 +
 crypto/fips140/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 crypto/fips140/Kconfig

diff --git a/crypto/Kconfig b/crypto/Kconfig
index b54a1bef6adef..d792ff01298b7 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1387,6 +1387,7 @@ endif
 endif
 
 source "drivers/crypto/Kconfig"
+source "crypto/fips140/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 source "crypto/krb5/Kconfig"
diff --git a/crypto/fips140/Kconfig b/crypto/fips140/Kconfig
new file mode 100644
index 0000000000000..0665e94b9fe05
--- /dev/null
+++ b/crypto/fips140/Kconfig
@@ -0,0 +1,15 @@
+config CRYPTO_FIPS140_EXTMOD
+	bool "FIPS 140 compliant algorithms as a kernel module"
+	depends on CRYPTO && (X86_64 || ARM64) && MODULES
+	select CRYPTO_FIPS
+	help
+	  This option enables building a kernel module that contains
+	  copies of crypto algorithms that are built in a way that
+	  complies with the FIPS 140 standard.
+
+	  The module registers the algorithms it contains with the
+	  kernel crypto API, and the kernel crypto API's FIPS 140 mode
+	  can be enabled to restrict crypto algorithm usage to only
+	  those provided by this module.
+
+	  If unsure, say N.
-- 
2.47.3


