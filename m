Return-Path: <linux-kbuild+bounces-11248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SD+vAJZFjWlj0gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11248-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:30 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 31896129EDE
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 04:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E24F2300382E
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 03:14:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06B823D7CD;
	Thu, 12 Feb 2026 03:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="evhvtKBV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com [34.218.115.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D1B23D7E0;
	Thu, 12 Feb 2026 03:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.218.115.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770866048; cv=none; b=cNuAqT6sLrIA/FZ5P3aPuuM8F+QRbJ1hOAxZKrRpRN9+vsOUQkPHDxGUyv8w0p+Tcq6QXhLmF1pB7ZljXNo4jk9J9o6k7rtvqC89PkX76MDuvZqKg7t6tA1gdR4Vpjo8eR0B6qcnYZ7Z3A1bFLkm2hHdodPEs7/TaxlKqCJOYDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770866048; c=relaxed/simple;
	bh=m6LWaAvGiZ/pWl2jYFJB8UZeWp8B//ndpd1SQPJl1gw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MNpJ4tZMvn3qTTNGLc12DCJNc32vPUCH8Tevi7k2acD7fT5fLJM/hu0FvtNT6aZykpQDM5VT2RPCAtJZzKYospfUencS4dRa7zx13jiYH2nOnWZC5Wpx3RP9qZ5QYXFrmaN2ZVzoO+I5kheCPwiQjcLYgniKWyG7m1nd3v//Si0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=evhvtKBV; arc=none smtp.client-ip=34.218.115.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770866047; x=1802402047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BhYhP9Nwc0ZhnGAnRt+3Lc67Lhm35xrT4r4Ii6JFG0I=;
  b=evhvtKBVG3IVR6U4lxSG3u0LNF3AYkhAnV5mCRAzWotzorafljfMgzXt
   mzBhrlf8YZlpyEPuUvUk/BvBTRSjGedJvXXviiJBvpHpaZ4QlAHsiTW7R
   xTjCJSfDxnjvkv66kDa7AXecJEx/785I71RByUvHfw9iqjZuHH5eOVr8n
   68miaCCaUXbynyKw+0nf+exjDdhkamoGKRHxHT3N7qn3651r9XJvunUa2
   NP+DZxlSaQhu5ws3T8RYv05mJEmEghpczhnNQdjI6GnjdC6rCY9PhLKuy
   pCVLXMMxCYP/TPK0uA5c6LlxZWHVZ2oWdVjoiGx0XoPU2F8FIe/j8eXnZ
   w==;
X-CSE-ConnectionGUID: K2SFhIq/Tw6BQcpYkbJqNw==
X-CSE-MsgGUID: +PseZSO7QA6C1V1vO05c+g==
X-IronPort-AV: E=Sophos;i="6.21,285,1763424000"; 
   d="scan'208";a="12727739"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-013.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 03:14:07 +0000
Received: from EX19MTAUWC002.ant.amazon.com [205.251.233.51:5626]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.3.19:2525] with esmtp (Farcaster)
 id a23d19c4-fc7d-406e-8c39-56ceed057616; Thu, 12 Feb 2026 03:14:07 +0000 (UTC)
X-Farcaster-Flow-ID: a23d19c4-fc7d-406e-8c39-56ceed057616
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:06 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Thu, 12 Feb 2026 03:14:05 +0000
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
Subject: [PATCH 103/106] crypto: convert exported crypto symbol into pluggable interface for CONFIG_PKCS7_TEST_KEY crypto
Date: Thu, 12 Feb 2026 02:47:19 +0000
Message-ID: <20260212024725.11264-104-wanjay@amazon.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260212024725.11264-1-wanjay@amazon.com>
References: <20260212024725.11264-1-wanjay@amazon.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,arm.com,kernel.org,redhat.com,alien8.de,suse.com,lists.infradead.org,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11248-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 31896129EDE
X-Rspamd-Action: no action

Apply Crypto API wrappers to the exported crypto symbol in
CONFIG_PKCS7_TEST_KEY-related crypto to convert them into pluggable
interface.

Signed-off-by: Jay Wang <wanjay@amazon.com>
---
 crypto/asymmetric_keys/Makefile         | 2 +-
 crypto/asymmetric_keys/pkcs7_key_type.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 3fdd11ea399a..6a17f563c359 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -63,7 +63,7 @@ $(obj)/pkcs7.asn1.o: $(obj)/pkcs7.asn1.c $(obj)/pkcs7.asn1.h
 #
 # PKCS#7 parser testing key
 #
-obj-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
+crypto-objs-$(CONFIG_PKCS7_TEST_KEY) += pkcs7_test_key.o
 pkcs7_test_key-y := \
 	pkcs7_key_type.o
 
diff --git a/crypto/asymmetric_keys/pkcs7_key_type.c b/crypto/asymmetric_keys/pkcs7_key_type.c
index b930d3bbf1af..a6921222ced1 100644
--- a/crypto/asymmetric_keys/pkcs7_key_type.c
+++ b/crypto/asymmetric_keys/pkcs7_key_type.c
@@ -4,8 +4,8 @@
  * Copyright (C) 2014 Red Hat, Inc. All Rights Reserved.
  * Written by David Howells (dhowells@redhat.com)
  */
-
 #define pr_fmt(fmt) "PKCS7key: "fmt
+#include <crypto/api.h>
 #include <linux/key.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -91,5 +91,5 @@ static void __exit pkcs7_key_cleanup(void)
 	unregister_key_type(&key_type_pkcs7);
 }
 
-module_init(pkcs7_key_init);
-module_exit(pkcs7_key_cleanup);
+crypto_module_init(pkcs7_key_init);
+crypto_module_exit(pkcs7_key_cleanup);
-- 
2.47.3


