Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C2B1E9DAD
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 07:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726056AbgFAF6X (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 01:58:23 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:40013 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727068AbgFAF6V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 01:58:21 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0515vaMA023694;
        Mon, 1 Jun 2020 14:57:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0515vaMA023694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590991070;
        bh=1Q3KADhnY+OelPioGoGxZ8yWqtmvAGxr4lH7F3uc4aI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g/A1qfI8lAF0r7Y3vANaQdxrJ5IlZoBLgAjhbNDLx+ayjAz9xR1dV5UHvqFCWUwXr
         lIN3YHdaFb+tvGjth+/iApLXqLSiYKCfNEns2+70jLwqcVIjvdJEEz/SJ6K+Txz5IR
         b78A0QtvHQsRnlDCd/dmOwPLDdsDKhGHg+s87KXgJzGSmdnSKEjoFxQfSnqnCi8Nwf
         pZR5eSZBO5svjepG2cWCET1VVcUEYoi+ws5u+lD8QgJatjNSr1BavoT/CEwHcOkPT6
         BUMPgCmMyNFei00RLxBkSrZURJxziT9dUFlXugM3EjpNkicgbsvpaTjT4MJmnLj9LL
         t4mWeIzgYkZQw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 31/37] modpost: remove is_vmlinux() call in check_for_{gpl_usage,unused}()
Date:   Mon,  1 Jun 2020 14:57:25 +0900
Message-Id: <20200601055731.3006266-31-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200601055731.3006266-1-masahiroy@kernel.org>
References: <20200601055731.3006266-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

check_exports() is never called for vmlinux because mod->skip is set
for vmlinux.

Hence, check_for_gpl_usage() and check_for_unused() are not called
for vmlinux, either. is_vmlinux() is always false here.

Remove the is_vmlinux() calls, and hard-code the ".ko" suffix.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bc00bbac50bb..84a642c14775 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2144,20 +2144,18 @@ void buf_write(struct buffer *buf, const char *s, int len)
 
 static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 {
-	const char *e = is_vmlinux(m) ?"":".ko";
-
 	switch (exp) {
 	case export_gpl:
-		fatal("GPL-incompatible module %s%s "
-		      "uses GPL-only symbol '%s'\n", m, e, s);
+		fatal("GPL-incompatible module %s.ko uses GPL-only symbol '%s'\n",
+		      m, s);
 		break;
 	case export_unused_gpl:
-		fatal("GPL-incompatible module %s%s "
-		      "uses GPL-only symbol marked UNUSED '%s'\n", m, e, s);
+		fatal("GPL-incompatible module %s.ko uses GPL-only symbol marked UNUSED '%s'\n",
+		      m, s);
 		break;
 	case export_gpl_future:
-		warn("GPL-incompatible module %s%s "
-		      "uses future GPL-only symbol '%s'\n", m, e, s);
+		warn("GPL-incompatible module %s.ko uses future GPL-only symbol '%s'\n",
+		     m, s);
 		break;
 	case export_plain:
 	case export_unused:
@@ -2169,13 +2167,11 @@ static void check_for_gpl_usage(enum export exp, const char *m, const char *s)
 
 static void check_for_unused(enum export exp, const char *m, const char *s)
 {
-	const char *e = is_vmlinux(m) ?"":".ko";
-
 	switch (exp) {
 	case export_unused:
 	case export_unused_gpl:
-		warn("module %s%s "
-		      "uses symbol '%s' marked UNUSED\n", m, e, s);
+		warn("module %s.ko uses symbol '%s' marked UNUSED\n",
+		     m, s);
 		break;
 	default:
 		/* ignore */
-- 
2.25.1

