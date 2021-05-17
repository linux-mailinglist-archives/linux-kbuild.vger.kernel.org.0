Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E790E3824F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 09:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbhEQHFP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 17 May 2021 03:05:15 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:58553 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235027AbhEQHFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 May 2021 03:05:14 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 14H73Glt004781;
        Mon, 17 May 2021 16:03:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 14H73Glt004781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621234997;
        bh=6qjhF17S3DwzBYJAs6pv957dH/5j1JRv4sjCIoKFd30=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u2LSqvfjpQODCn8BGPMMfelqh5m+OTiOGUzdgE3a3gTVBXEAARmWRNc1i12yZWv+g
         IB9yCuWApieVVhmjFZV1l7seBHwdvE5AaRvOQvhnSV7eYctv4A4onxAMKjWP61u5+N
         vshDaJDoc118zGtMCbWWh0Nig9Ayrw+RGMD7KH6ebjk4Sdh2lGi1qdwRvGz/8tXK8L
         fQ2CS2WSjfsKX8eUIpFn01dLcd2vRrf8MPm6U+Xzt6NUK1S9dyGJ7p1YyStxTv4Goh
         gNvK/wNDNPYGYHvNZtLK9SMMWFXP2AxL+gob4VtXCU2k+MFD2jnUNV9tT21iIdrh6P
         ovVpccsHTk/Vw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] init: use $(call cmd,) for generating include/generated/compile.h
Date:   Mon, 17 May 2021 16:03:12 +0900
Message-Id: <20210517070314.1428091-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210517070314.1428091-1-masahiroy@kernel.org>
References: <20210517070314.1428091-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The 'cmd' macro shows the short log only when $(quiet) is quiet_.
Do not do it manually.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Makefile | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/init/Makefile b/init/Makefile
index 6bc37f64b361..2846113677ee 100644
--- a/init/Makefile
+++ b/init/Makefile
@@ -27,11 +27,11 @@ $(obj)/version.o: include/generated/compile.h
 # mkcompile_h will make sure to only update the
 # actual file if its content has changed.
 
-       chk_compile.h = :
- quiet_chk_compile.h = echo '  CHK     $@'
-silent_chk_compile.h = :
-include/generated/compile.h: FORCE
-	@$($(quiet)chk_compile.h)
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
+quiet_cmd_compile.h = CHK     $@
+      cmd_compile.h = \
+	$(CONFIG_SHELL) $(srctree)/scripts/mkcompile_h $@	\
 	"$(UTS_MACHINE)" "$(CONFIG_SMP)" "$(CONFIG_PREEMPT)"	\
 	"$(CONFIG_PREEMPT_RT)" $(CONFIG_CC_VERSION_TEXT) "$(LD)"
+
+include/generated/compile.h: FORCE
+	$(call cmd,compile.h)
-- 
2.27.0

