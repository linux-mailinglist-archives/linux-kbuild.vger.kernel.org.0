Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEBAB36A10D
	for <lists+linux-kbuild@lfdr.de>; Sat, 24 Apr 2021 14:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbhDXMJv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 24 Apr 2021 08:09:51 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:18319 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbhDXMJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 24 Apr 2021 08:09:50 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 13OC8YJ9030030;
        Sat, 24 Apr 2021 21:08:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 13OC8YJ9030030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619266115;
        bh=FvNZUb8kMF+HSWmisrOZr06I2tZH5n65AdHI4NzQWyg=;
        h=From:To:Cc:Subject:Date:From;
        b=eqCGikcDV59DIzd/CAaXc3nwU/2Ga9/WsGlQKw04hIh5XJjAuGZRlnvTckQQlWCoY
         GASkxMoh48b6DEKUdPGF5sc+oKd0Hr+L9BpZ95ruIIHk4yhNldR7+ACJzXubYWiAKG
         tr/RQ7yJ6AV1nYq3syqgUMvwA5YCLc7j0LOoaPKaIfFIUTx8tKrQM0oc2C5wzPGes0
         oJMdVBLGuzNz9+POo8yjHkPlj93m8XGVQSE0eWfl0SizTW517a2y4zf9ELHqIGg5+N
         netvo/OTIxHbrwCuv3ApTXSyMnU6HiiiWd+hiGKhfjikM427brvECt+/mMFG5ve1oo
         MAiA6GGz5qzXw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] genksyms: fix stale comment
Date:   Sat, 24 Apr 2021 21:08:29 +0900
Message-Id: <20210424120829.398360-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(shipped source) is a stale comment.

Since commit 833e62245943 ("genksyms: generate lexer and parser during
build instead of shipping"), no genksyms source file is shipped.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/genksyms/Makefile b/scripts/genksyms/Makefile
index ce4f99935de5..d6a422a63b6a 100644
--- a/scripts/genksyms/Makefile
+++ b/scripts/genksyms/Makefile
@@ -22,7 +22,7 @@ $(obj)/pars%.tab.c $(obj)/pars%.tab.h: $(src)/pars%.y FORCE
 
 endif
 
-# -I needed for generated C source (shipped source)
+# -I needed for generated C source to include headers in source tree
 HOSTCFLAGS_parse.tab.o := -I $(srctree)/$(src)
 HOSTCFLAGS_lex.lex.o := -I $(srctree)/$(src)
 
-- 
2.27.0

