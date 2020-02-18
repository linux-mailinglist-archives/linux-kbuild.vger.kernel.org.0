Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA94162418
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 11:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgBRKA7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 05:00:59 -0500
Received: from conuserg-11.nifty.com ([210.131.2.78]:34996 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbgBRKA7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 05:00:59 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 01IA0Wc4026775;
        Tue, 18 Feb 2020 19:00:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 01IA0Wc4026775
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582020033;
        bh=NzqzNW1tjbJdvMC2zpSOZ2kOLeL8vAGeTVMR5rjqIrY=;
        h=From:To:Cc:Subject:Date:From;
        b=t9vDVzi237NKdJCj88HNe/lNEgJS6EMrU9LdB+VWaTCfFOgfBNh8/1vbVTEKUINX9
         BzMkV9fECAaJtkImQSxIa8C7UxB99lZuXAZ6rdmqNVQrV1U0VEL79jxbte4J3zDrWd
         X2BfSKkRbW3PgYW3S0rIksN+xBO3nO3pYe22vdERvkxsau+orgED9AHzWp095MdPGt
         g0O+7jYaYF+AjwMYaCPFvzjM8EYWfJQxnEru7CtW+ooxNwHppxNTBOfQVV0CzCJl/K
         rkWIl7pWngOPU7IblaauyIKgAr/Bt/vBphUF6M43JNopVHx8Bg3Js7QgT/23PRYxBu
         kfPVB9N8foyOA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] fixdep: remove redundant null character check
Date:   Tue, 18 Feb 2020 19:00:31 +0900
Message-Id: <20200218100031.10018-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If *q is '\0', the condition (isalnum(*q) || *q == '_') is false anyway.

Ensuring non-zero *q is redundant.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/basic/fixdep.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
index ad2041817985..877ca2c88246 100644
--- a/scripts/basic/fixdep.c
+++ b/scripts/basic/fixdep.c
@@ -246,7 +246,7 @@ static void parse_config_file(const char *p)
 		}
 		p += 7;
 		q = p;
-		while (*q && (isalnum(*q) || *q == '_'))
+		while (isalnum(*q) || *q == '_')
 			q++;
 		if (str_ends_with(p, q - p, "_MODULE"))
 			r = q - 7;
-- 
2.17.1

