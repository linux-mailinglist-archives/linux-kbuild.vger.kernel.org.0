Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2827157F90
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Feb 2020 17:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbgBJQTa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 10 Feb 2020 11:19:30 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:65330 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727120AbgBJQT3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 10 Feb 2020 11:19:29 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 01AGIte3016092;
        Tue, 11 Feb 2020 01:18:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 01AGIte3016092
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581351536;
        bh=SL4MRwT3ATSa2hQI1yjh/EyEY5X2F0/2RXCoIx/OgHE=;
        h=From:To:Cc:Subject:Date:From;
        b=crTnNtuLPCmHQUWJ0zfu9b/MXO1lS+3g+PQ5wrSLn/1D8RG/BbirUjJA5rJf2ftOS
         oOUu2KOvpuBWWthQhjj0Iyo4D2+u43t0PRK8PsvRIcXvmk+72PcF0rJpkat32msS2o
         5Set9v0ljQvxMvO+mE/5uDmMzrM3niLe0GvDGI/EFgWnmoij8x9Fvu6O0JMZ0kYaIu
         pZCpAgCj4Yn/Q/be+tg473Gpc393S5YMft+jf8kg1vAlqGfT0sgPY61HnQx0ae7LN0
         89UZ4bo8KqV9ehjkSKKeSFR0wbYA6ITuAdDUDOYG1XofWN+1ke23wf+nfiNoeRzYhY
         hs7hn8QViem0w==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     youling257 <youling257@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] scripts/kallsyms: fix memory corruption caused by write over-run
Date:   Tue, 11 Feb 2020 01:18:52 +0900
Message-Id: <20200210161852.842-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

scripts/kallsyms crashes because memcpy() writes one more byte than
allocated.

Fixes: 8d60526999aa ("scripts/kallsyms: change table to store (strcut sym_entry *)")
Reported-by: youling257 <youling257@gmail.com>
Reported-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kallsyms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index a566d8201b56..0133dfaaf352 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -210,7 +210,7 @@ static struct sym_entry *read_symbol(FILE *in)
 
 	len = strlen(name) + 1;
 
-	sym = malloc(sizeof(*sym) + len);
+	sym = malloc(sizeof(*sym) + len + 1);
 	if (!sym) {
 		fprintf(stderr, "kallsyms failure: "
 			"unable to allocate required amount of memory\n");
@@ -219,7 +219,7 @@ static struct sym_entry *read_symbol(FILE *in)
 	sym->addr = addr;
 	sym->len = len;
 	sym->sym[0] = type;
-	memcpy(sym_name(sym), name, len);
+	strcpy(sym_name(sym), name);
 	sym->percpu_absolute = 0;
 
 	return sym;
-- 
2.17.1

