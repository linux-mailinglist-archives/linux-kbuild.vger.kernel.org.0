Return-Path: <linux-kbuild+bounces-8126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85717B10BE3
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 15:50:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C6045A4041
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Jul 2025 13:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C36B2DCF6D;
	Thu, 24 Jul 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bx2ypPIu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715D72DCF5B;
	Thu, 24 Jul 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365011; cv=none; b=O/Z3akrrDEtCYfPsUX5uu0so+H7wOV+yfQty9Rwc5zIzMe7Kcq4HpNgho1erYezWipTwA2cahYaEkDacGJ/E77z2lPo/oC4ak7FtL20AEcQWlfcB4ziqyr5pzxh8vv3BzdD+upzpCDcMBjKpi/C+PkSKkCYsoA9CT4PHYc6JqLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365011; c=relaxed/simple;
	bh=Hll4fVoXdJiq0X8QlG0YQhLfV/cpQXX8ezdfihEc0eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a65eLcKCkIjBAawoxCIrLI9lR/HYSjtyUWndAD1sD3jsX3oLZVvrhGSxwzwo3RRpCgGQ8O/71wZJ3jdKas1jToxYreazSrbxX46jO6PsAx+V+iTGn616xqv/3cJjem1H/7Mmj7VdaEqK52xjAlNePqPS314oLH5N0t8xJ61MypY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bx2ypPIu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A9B7C4CEF6;
	Thu, 24 Jul 2025 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753365010;
	bh=Hll4fVoXdJiq0X8QlG0YQhLfV/cpQXX8ezdfihEc0eg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bx2ypPIuGqXHVPE/2FRq7dBRR94C4tTFkXL3aH3WOEUyyUzZN7IpsUFYnYzPmZFKY
	 dW/3+k6zDelSOKkpLLsAlTqW6N4k7Mo+JNyb1ZGhhvV3PDsnutTY1Li7QKWaLn8b3n
	 BVHFf7OMyS4q8G27T5jzrX3+KfL1JkU3rbLaY2jjQfyklvcr//EApBPwmZBt7mLo/l
	 LesdIYozdg7hojFtVKvDJn93KHw+ia9nboq4ebmuHfbmsHeucjhJRPqwLswzxBYsWh
	 gKRRnyb3Ot945VlXL+TeNUpdR7RwDdbkxyUHuX4ye4JZEGaLkkGSzmMit+R4BZcdV3
	 Trp5J8a0HNlAw==
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
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v5 01/10] module: remove meaningless 'name' parameter from __MODULE_INFO()
Date: Thu, 24 Jul 2025 15:49:38 +0200
Message-ID: <a613ff93428aece0933335957d5980eb6417f2d0.1753354215.git.legion@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1753354215.git.legion@kernel.org>
References: <cover.1753354215.git.legion@kernel.org>
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
index 5faa1fb1f4b4..4689852d7b18 100644
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
2.50.1


