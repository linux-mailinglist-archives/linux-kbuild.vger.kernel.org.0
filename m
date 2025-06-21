Return-Path: <linux-kbuild+bounces-7600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CFAE2946
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 15:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77F41169552
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 13:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D34601531E3;
	Sat, 21 Jun 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pe1Ttxxq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A9DDC1;
	Sat, 21 Jun 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750514258; cv=none; b=ZeYPJN/vXoA7EeICfH039kOqnRVSW1BdAx8EsW+JMsxOa/SSpj3AxuJZWgI5VTMtzMF6m0aXsbr01TMNaCVl0378niMNyHwjSjAsGWYUAvZ7B7/eVG7yhfuW9G+L7QRIWt/Ph8MY3xRW6bfBy8jgvcUYbAofHkh6ldiG3IP05o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750514258; c=relaxed/simple;
	bh=SV2yBb7mPZ1Z1JgQ1i1j3we1Iejdg6pRIK1Z7mGfVw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hu2pCzA1KhrvD/Zu586yECLzvfXWVM2qGyb41a3wPA7wN9Ln5KO/iXPNvv85Lj9cGiiBEl46oGsmkZlyxXwxY6kcShahUfnhLv5pmlJw24ttDAyz3tbTLKXGdYCpv8YGcF2Jk/yuUGg3KiA+3obRUNCokN1UfVib5d7kfXWhvZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pe1Ttxxq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F009C4CEF1;
	Sat, 21 Jun 2025 13:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750514258;
	bh=SV2yBb7mPZ1Z1JgQ1i1j3we1Iejdg6pRIK1Z7mGfVw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pe1TtxxqDXAXltnMjYAAJPHpXLJ5a/Ku568lPJeZzwqM85bzVh/k58miB6EUy1iSs
	 xR1bpM4IptIBxrzU1ZA6n0VauDleF6bx2aaNSnpaijtTyFV7C5ewAHeMuLqJ/b+kLU
	 FwRhQn9xWpvYUUGF7nVFZzbQ/CO1IWCe4ONDatUMyzmcRXz5xKDPl1JFIOEHV8A98i
	 GWkQGvKs7tOAyoMe0nxczGsfZ8TeOHVJuB8CbEq/b55KgjnGBkuQsBA3q3RWb8lDMV
	 rjyka1rol65130hFu9ONZ5qici2LPV5AqgnQfcPApyxTlK0ImHSbJW3AqjW4DlesMB
	 XnCWnTZa8BrTg==
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v4 1/7] module: remove meaningless 'name' parameter from __MODULE_INFO()
Date: Sat, 21 Jun 2025 15:57:13 +0200
Message-ID: <b570ffc48f5cacee67b256ec51ef74f5433a7172.1750511018.git.legion@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750511018.git.legion@kernel.org>
References: <cover.1750511018.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Masahiro Yamada <masahiroy@kernel.org>

The symbol names in the .modinfo section are never used and already
randomized by the __UNIQUE_ID() macro.

Therefore, the second parameter of  __MODULE_INFO() is meaningless
and can be removed to simplify the code.

With this change, the symbol names in the .modinfo section will be
prefixed with __UNIQUE_ID_modinfo, making it clearer that they
originate from MODULE_INFO().

[Before]

  $ objcopy  -j .modinfo vmlinux.o modinfo.o
  $ nm -n modinfo.o | head -n10
  0000000000000000 r __UNIQUE_ID_license560
  0000000000000011 r __UNIQUE_ID_file559
  0000000000000030 r __UNIQUE_ID_description558
  0000000000000074 r __UNIQUE_ID_license580
  000000000000008e r __UNIQUE_ID_file579
  00000000000000bd r __UNIQUE_ID_description578
  00000000000000e6 r __UNIQUE_ID_license581
  00000000000000ff r __UNIQUE_ID_file580
  0000000000000134 r __UNIQUE_ID_description579
  0000000000000179 r __UNIQUE_ID_uncore_no_discover578

[After]

  $ objcopy  -j .modinfo vmlinux.o modinfo.o
  $ nm -n modinfo.o | head -n10
  0000000000000000 r __UNIQUE_ID_modinfo560
  0000000000000011 r __UNIQUE_ID_modinfo559
  0000000000000030 r __UNIQUE_ID_modinfo558
  0000000000000074 r __UNIQUE_ID_modinfo580
  000000000000008e r __UNIQUE_ID_modinfo579
  00000000000000bd r __UNIQUE_ID_modinfo578
  00000000000000e6 r __UNIQUE_ID_modinfo581
  00000000000000ff r __UNIQUE_ID_modinfo580
  0000000000000134 r __UNIQUE_ID_modinfo579
  0000000000000179 r __UNIQUE_ID_modinfo578

Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 include/crypto/algapi.h     | 4 ++--
 include/linux/module.h      | 3 ---
 include/linux/moduleparam.h | 9 +++++----
 include/net/tcp.h           | 4 ++--
 4 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index 188eface0a11..fc4574940636 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -43,8 +43,8 @@
  * alias.
  */
 #define MODULE_ALIAS_CRYPTO(name)	\
-		__MODULE_INFO(alias, alias_userspace, name);	\
-		__MODULE_INFO(alias, alias_crypto, "crypto-" name)
+		MODULE_INFO(alias, name);	\
+		MODULE_INFO(alias, "crypto-" name)
 
 struct crypto_aead;
 struct crypto_instance;
diff --git a/include/linux/module.h b/include/linux/module.h
index 8050f77c3b64..24fe6b865e9c 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -164,9 +164,6 @@ extern void cleanup_module(void);
 
 struct module_kobject *lookup_or_create_module_kobject(const char *name);
 
-/* Generic info of form tag = "info" */
-#define MODULE_INFO(tag, info) __MODULE_INFO(tag, tag, info)
-
 /* For userspace: you can also call me... */
 #define MODULE_ALIAS(_alias) MODULE_INFO(alias, _alias)
 
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index bfb85fd13e1f..00166f747e27 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -20,18 +20,19 @@
 /* Chosen so that structs with an unsigned long line up. */
 #define MAX_PARAM_PREFIX_LEN (64 - sizeof(unsigned long))
 
-#define __MODULE_INFO(tag, name, info)					  \
-	static const char __UNIQUE_ID(name)[]				  \
+/* Generic info of form tag = "info" */
+#define MODULE_INFO(tag, info)					  \
+	static const char __UNIQUE_ID(modinfo)[]			  \
 		__used __section(".modinfo") __aligned(1)		  \
 		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
 
 #define __MODULE_PARM_TYPE(name, _type)					  \
-	__MODULE_INFO(parmtype, name##type, #name ":" _type)
+	MODULE_INFO(parmtype, #name ":" _type)
 
 /* One for each parameter, describing how to use it.  Some files do
    multiple of these per line, so can't just use MODULE_INFO. */
 #define MODULE_PARM_DESC(_parm, desc) \
-	__MODULE_INFO(parm, _parm, #_parm ":" desc)
+	MODULE_INFO(parm, #_parm ":" desc)
 
 struct kernel_param;
 
diff --git a/include/net/tcp.h b/include/net/tcp.h
index 5078ad868fee..9b39ef630c92 100644
--- a/include/net/tcp.h
+++ b/include/net/tcp.h
@@ -2662,8 +2662,8 @@ void tcp_update_ulp(struct sock *sk, struct proto *p,
 		    void (*write_space)(struct sock *sk));
 
 #define MODULE_ALIAS_TCP_ULP(name)				\
-	__MODULE_INFO(alias, alias_userspace, name);		\
-	__MODULE_INFO(alias, alias_tcp_ulp, "tcp-ulp-" name)
+	MODULE_INFO(alias, name);		\
+	MODULE_INFO(alias, "tcp-ulp-" name)
 
 #ifdef CONFIG_NET_SOCK_MSG
 struct sk_msg;
-- 
2.49.0


