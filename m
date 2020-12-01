Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BFD2C9FE2
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387432AbgLAKfd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:35:33 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:24195 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729504AbgLAKfc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:35:32 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 0B1AYKHg001992;
        Tue, 1 Dec 2020 19:34:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 0B1AYKHg001992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606818863;
        bh=VfcHSo85/XelpNnmCDHDeOKYCBPm09TwO459Oz9cQto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0NohZ6uJ6Ar8tU1eZcEOZGknrP0NGIzAIdZrKKSMyqeNh/V2yGeLElpqEWSzlfmwb
         zWKfLkv0rnZjiAaSuV85Hojb569KDa+DBvjIoJs3lYBfiUDbpZxOU4XXhZKplnDZnQ
         IIWraw+YwJCa1zNQPouR4ktX+fc3S4Tq6pF1cXsc/CFVWjrl2FrjU2lwtAM236SPnl
         bLfmdM+ZzSN2Sn+32IaJwU7FymAmu+IyiZrvN+iwoWBnivPCZcMR7nzFChFsJtaM0u
         M2GHWgnHe/eWBMYLaT7TZJIFApJ8iEJXtrlnCFaAJ17AZSLeEYZD3sqpVtCxz9qiQb
         xn2JkuFhdKKEA==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Quentin Perret <qperret@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] modpost: change license incompatibility to error() from fatal()
Date:   Tue,  1 Dec 2020 19:34:17 +0900
Message-Id: <20201201103418.675850-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201103418.675850-1-masahiroy@kernel.org>
References: <20201201103418.675850-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Change fatal() to error() to continue running to report more possible
issues.

There is no difference in the fact that modpost will fail anyway.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d55d7e5ef111..d907c63b948f 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2145,11 +2145,11 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 {
 	switch (exp) {
 	case export_gpl:
-		fatal("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
+		error("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
 		      m, s);
 		break;
 	case export_unused_gpl:
-		fatal("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
+		error("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
 		      m, s);
 		break;
 	case export_gpl_future:
-- 
2.27.0

