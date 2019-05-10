Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 496E41A208
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 18:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfEJQ44 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 12:56:56 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55604 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727796AbfEJQ44 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 12:56:56 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x4AGunoM012770;
        Sat, 11 May 2019 01:56:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x4AGunoM012770
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557507410;
        bh=N7mSQ4tVVX/KC8PH5fw/1F8p9+stEg4TYw+cHa0/ONA=;
        h=From:To:Cc:Subject:Date:From;
        b=CcvwFCiDPjzngQEX9VJ3h96klp0aF8OrB5UMg/1mj9j4LMZV/RjdOXM5X6yIsNDXI
         3E+q4YRIx7GXZK6079kyfIDENG0M2L++N0upIIOznogqG3Qh109wyVHCH8gRi8SojI
         KiqBSwXKA2pcCrbjTRSb2GQRO+YzcXMDkkIjEF4rN+vrnOwgEFqi+B5EzXuG7Nw2pi
         5zTPQ6neOxDA0Hml6gIIeZodJUubq2YRBsPx8aLfPz9L+pkiecQv0gLYpgViFOl7Ng
         5rJ0GD06SKaKeqpTFXD/HxU5AH6/csvSdBNOyXuHRvGi/9bnuvf9yomgf5g5PswjEl
         qWyQdcE9g6BBw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: remove useless pointer check in conf_write_dep()
Date:   Sat, 11 May 2019 01:56:48 +0900
Message-Id: <1557507408-7992-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

conf_write_dep() has just one caller:

    conf_write_dep("include/config/auto.conf.cmd");

"name" always points to a valid string.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/confdata.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 399973e..431b805 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -961,8 +961,6 @@ static int conf_write_dep(const char *name)
 	struct file *file;
 	FILE *out;
 
-	if (!name)
-		name = ".kconfig.d";
 	out = fopen("..config.tmp", "w");
 	if (!out)
 		return 1;
-- 
2.7.4

