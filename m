Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB022C9FE6
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 11:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbgLAKfe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 05:35:34 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:24192 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729852AbgLAKfd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 05:35:33 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 0B1AYKHh001992;
        Tue, 1 Dec 2020 19:34:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 0B1AYKHh001992
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606818864;
        bh=9lHhJTFveSp+yoYJ6W1i7rFRQaHiXXJ0F0/7229gRK8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LLq8XDC3Uz7FuzXc/kH9FX34yp63IIIOdsJs57kMzT2B6Qao/3BI6WkX9gvaOIATv
         BonIfSGXxHTYmFf2+by9JIFqKjnuGFHqTb5fG1nx6TVylzTHpB2zat0CG6eIbNTdg7
         JQI20BuIzoBZ54jPeOZPa5mCEugAa/LrqMRBbQGyNLyvknW7l7IiV5Rx2RPZg4nT0s
         j1UjdMCcrrLhVe1zMj8+Kl+j6gaifO+LmDmu8i70UkRSVKJX69Bc3wuUTIe8dfrEPJ
         +0yTSV9XNs3ujzyIrN+HY3nENnaYa7k8SFo3BYp1fvu8VzlQM+9IavRH2yP6rbVJat
         eKN8KH+18gdGQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Quentin Perret <qperret@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] modpost: turn section mismatches to error from fatal()
Date:   Tue,  1 Dec 2020 19:34:18 +0900
Message-Id: <20201201103418.675850-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201201103418.675850-1-masahiroy@kernel.org>
References: <20201201103418.675850-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is code that reports static EXPORT_SYMBOL a few lines below.
It is not a good idea to bail out here.

I renamed sec_mismatch_fatal to sec_mismatch_warn_only (with logical
inversion) to match to CONFIG_SECTION_MISMATCH_WARN_ONLY.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index d907c63b948f..a750596d5cc2 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -34,7 +34,7 @@ static int external_module = 0;
 static int warn_unresolved = 0;
 /* How a symbol is exported */
 static int sec_mismatch_count = 0;
-static int sec_mismatch_fatal = 0;
+static int sec_mismatch_warn_only = true;
 /* ignore missing files */
 static int ignore_missing_files;
 /* If set to 1, only warn (instead of error) about missing ns imports */
@@ -2576,7 +2576,7 @@ int main(int argc, char **argv)
 			warn_unresolved = 1;
 			break;
 		case 'E':
-			sec_mismatch_fatal = 1;
+			sec_mismatch_warn_only = false;
 			break;
 		case 'N':
 			allow_missing_ns_imports = 1;
@@ -2640,8 +2640,8 @@ int main(int argc, char **argv)
 
 	if (dump_write)
 		write_dump(dump_write);
-	if (sec_mismatch_count && sec_mismatch_fatal)
-		fatal("Section mismatches detected.\n"
+	if (sec_mismatch_count && !sec_mismatch_warn_only)
+		error("Section mismatches detected.\n"
 		      "Set CONFIG_SECTION_MISMATCH_WARN_ONLY=y to allow them.\n");
 	for (n = 0; n < SYMBOL_HASH_SIZE; n++) {
 		struct symbol *s;
-- 
2.27.0

