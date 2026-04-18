Return-Path: <linux-kbuild+bounces-12821-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEoKGpbO4mmX+gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12821-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:42 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B675041F578
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 02:21:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4DEE430087A6
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Apr 2026 00:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA49A1A262D;
	Sat, 18 Apr 2026 00:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Ewj65ND4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5DA2BD11;
	Sat, 18 Apr 2026 00:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776471697; cv=none; b=WNS6/RnzXo6d1cmxGZFx0Tf8vz7HUekLwtx7eBhXiYjz7W4QoA9xRgptahF8vgoJ6gtw9RZaQlAQuCVNz4uQ0YJGo/WyTyZqSy0OU87Z1fLSNPYpklYqst6eQPfrYJrxbkJkqhdDNo/iwqKAjTDLsJQjO1LHZ9EyMGnyOL3dGC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776471697; c=relaxed/simple;
	bh=c/SCWaHRlDhiWp/34gE3+EGNhEDQ0guibsj74x8r+74=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UnOFJ79Luz1nN9R5O33ZYj7EjNCf9jB8hctS0KVgDbH0EvXy3gYw+TbvmGIG4mRXM4yI4ofiou449i1QuZC2ulzyflmeNwOCpgCyMly1A8ZImsErlW6XvQfJbWOmyxUWYlLEEtqWr6GMa8PuXTuCDg/Hlm7CwXupQ16eecol0AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Ewj65ND4; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1776471696; x=1808007696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j5xia90OnNxpHDW4IhBqW8EDdaqm7on9SBX3cSQO+Gc=;
  b=Ewj65ND4YHFC9Ku4vjH4B8wvgo0fnYrtaTEtxubnmui1YzInxalvhagm
   FuA0UlreeWUCGuomj37exhYxMjxss3K3ixHYsQazgo6rlzwYFhapyr7Ys
   hch/0UU6LDSZw4dZQzPnDte7QIjF+G2ws1/NYaQRK7WepBNZP9CD0xw5v
   PYwTrBCC/1kZg04/VVVqdJTwUpyFDB5F1ySDbe1EqIfzmm7aywAlwdNmy
   lJRytsMbT9qvLoO17721i+jz8ZC9kRQdgxNLMyw5SJJRFNcHR7OAQeyut
   ob0NUio4SwTT4gh1rzGAzu+ht4+fdyd3hIrwOnAAdEoOtQOi4WmE/uD+N
   w==;
X-CSE-ConnectionGUID: 9crb3GnOQ2ysPv5a8ay7sQ==
X-CSE-MsgGUID: 0d4CBFUiQ/qOlDvOXHG0iA==
X-IronPort-AV: E=Sophos;i="6.23,185,1770595200"; 
   d="scan'208";a="17378043"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2026 00:21:36 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:18932]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.1.88:2525] with esmtp (Farcaster)
 id 1281606b-bc68-48e4-901c-b4170531407b; Sat, 18 Apr 2026 00:21:36 +0000 (UTC)
X-Farcaster-Flow-ID: 1281606b-bc68-48e4-901c-b4170531407b
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:35 +0000
Received: from dev-dsk-wanjay-2c-d25651b4.us-west-2.amazon.com (172.19.198.4)
 by EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Sat, 18 Apr 2026 00:21:35 +0000
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
Subject: [PATCH v2 04/19] build: Add ELF marker for crypto-objs-m modules
Date: Sat, 18 Apr 2026 00:20:12 +0000
Message-ID: <20260418002032.2877-5-wanjay@amazon.com>
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
X-ClientProxiedBy: EX19D033UWC002.ant.amazon.com (10.13.139.196) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-Spamd-Result: default: False [-6.16 / 15.00];
	WHITELIST_DMARC(-7.00)[amazon.com:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amazon.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amazon.com:s=amazoncorp2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,oracle.com,suse.de,amazon.com,amazon.de,kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,suse.com,google.com,infradead.org,linux.win,wunner.de,iogearbox.net,lists.infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12821-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wanjay@amazon.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amazon.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-kbuild];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B675041F578
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 0000000000000..eadca087cee20
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
index cf021ad77e153..685d9b8fcbf4a 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,6 +69,7 @@ obj-m += $(crypto-objs-m)
 ifndef CONFIG_CRYPTO_FIPS140_EXTMOD
 obj-y += $(crypto-objs-y)
 crypto-objs-y :=
+crypto-objs-m := $(filter-out $(crypto-objs-y),$(crypto-objs-m))
 endif
 
 # When an object is listed to be built compiled-in and modular,
@@ -131,6 +132,7 @@ multi-obj-m := $(call multi-search, $(obj-m), .o, -objs -y -m)
 multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 multi-crypto-objs-y := $(call multi-search, $(crypto-objs-y), .o, -objs -y)
+multi-crypto-objs-m := $(call multi-search, $(crypto-objs-m), .o, -objs -y -m)
 endif
 
 # Replace multi-part objects by their individual parts,
@@ -139,6 +141,7 @@ real-obj-y := $(call real-search, $(obj-y), .o, -objs -y)
 real-obj-m := $(call real-search, $(obj-m), .o, -objs -y -m)
 ifdef CONFIG_CRYPTO_FIPS140_EXTMOD
 real-crypto-objs-y := $(strip $(call real-search, $(crypto-objs-y), .o, -objs -y))
+real-crypto-objs-m := $(strip $(call real-search, $(crypto-objs-m), .o, -objs -y -m))
 endif
 
 always-y += $(always-m)
@@ -166,11 +169,13 @@ real-obj-y	:= $(addprefix $(obj)/, $(real-obj-y))
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
 
@@ -578,6 +583,16 @@ $(multi-crypto-objs-y): %.o: %.mod FORCE
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


