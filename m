Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD78320A63
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 14:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBUNEr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 08:04:47 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:58309 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhBUNEh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 08:04:37 -0500
Received: from grover.flets-west.jp (softbank126026090165.bbtec.net [126.26.90.165]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 11LD3L9k011207;
        Sun, 21 Feb 2021 22:03:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 11LD3L9k011207
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613912602;
        bh=qS/D3Dr04t+wT3tHPP3OA2ceB85dJFZJPAutCG6/3mQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=1Gt+YMo0QeLDbEDDYlA15fg11g3T6y5WiVcIyervV5XyB75baDBgqt5NC0opq/5S2
         X4eZ/MVMQEmdKFI4AOF9uu9oeokGXTrSZaPhtxJ+yD215mxSPAm1oTDtsMfJ39x78c
         bGhfmUXw7X96T0QTWmcpYlP1MkIkdXY1k0V0U/ZPNCklEVYYiz2nRfFz3vvGvPp0YZ
         7VsoxhdBblTM+tHM/n0oicCZR2lLK3AbLVNokqLYinVwoDjcsRFlCpYWAvBqAokiYK
         kMvZOVll9qy/MunVXABoDntX2fpCj1oEup32+DSVBMM0FdJ5PMt9Lpo31IhT5BHqiL
         u4+LFoLuatqUA==
X-Nifty-SrcIP: [126.26.90.165]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kconfig: omit --oldaskconfig option for 'make config'
Date:   Sun, 21 Feb 2021 22:03:17 +0900
Message-Id: <20210221130318.160327-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210221130318.160327-1-masahiroy@kernel.org>
References: <20210221130318.160327-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/kconfig/conf.c line 39 defines the default of input_mode as
oldaskconfig. Hence, 'make config' works in the same way even without
the --oldaskconfig option given. Note this in the help message.

This will be helpful to unify build rules in Makefile in the next
commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 2 +-
 scripts/kconfig/conf.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 2c40e68853dd..5180a71c931f 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -29,7 +29,7 @@ menuconfig: $(obj)/mconf
 	$(Q)$< $(silent) $(Kconfig)
 
 config: $(obj)/conf
-	$(Q)$< $(silent) --oldaskconfig $(Kconfig)
+	$(Q)$< $(silent) $(Kconfig)
 
 nconfig: $(obj)/nconf
 	$(Q)$< $(silent) $(Kconfig)
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index 37e17934b67a..957d2a0832f7 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -483,6 +483,7 @@ static void conf_usage(const char *progname)
 	printf("  --randconfig            New config with random answer to all options\n");
 	printf("  --yes2modconfig         Change answers from yes to mod if possible\n");
 	printf("  --mod2yesconfig         Change answers from mod to yes if possible\n");
+	printf("  (If none of the above is given, --oldaskconfig is the default)\n");
 }
 
 int main(int ac, char **av)
-- 
2.27.0

