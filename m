Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EBB9372882
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 May 2021 12:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhEDKMX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 May 2021 06:12:23 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:49882 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhEDKMV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 May 2021 06:12:21 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 144AB1SU020452;
        Tue, 4 May 2021 19:11:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 144AB1SU020452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1620123061;
        bh=W+JoVuH8cVhumGvnB93xcaHICVpPdiH05VWneNbKjN8=;
        h=From:To:Cc:Subject:Date:From;
        b=s3Vb8xZksPe2BlcCGL2yyjgkEDPUva5UjO3Ns0+t6eT89UU9FA8tnYfIJJzWwBp7t
         Q3DF7GNwl8jtKlWq9amUS7JCy9PE2LoHGmHcIIrj29sOE/KFWpwETlo9Wrwkut4xIj
         pn5tPJbZDK3oYv52KGEw8L9vntNer0TTmTSeLXzB3kqMVjuqN1L9e62CS6mz0NIFRq
         wUDX2yp0+/FuQBMGo6j1Ai3R9es8UnpedOdILhnNkKdK66MKD3lSmBtcHTVOHvmnx5
         +cW2KCsFrEKHqXDbAJOSCx9fqA6lm2fM7OGKxvQ6sFbTU//gl70SVbXKj1m9OYEnbS
         rTYJ6oOhNzBNQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: make distclean work against $(objtree) instead of $(srctree)
Date:   Tue,  4 May 2021 19:10:56 +0900
Message-Id: <20210504101058.96498-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This reverts the old commit [1], which seems questionable to me.

It claimed 'make distclean' could not remove editor backup files,
but I believe KBUILD_OUTPUT or O= was set.

When O= is given, Kbuild should always work against $(objtree).
If O= is not given, $(objtree) and $(srctree) are the same, therefore
$(srctree) is cleaned up.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=dd47df980c02eb33833b2690b033c34fba2fa80d

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index cbf4b18cf51c..560408808c33 100644
--- a/Makefile
+++ b/Makefile
@@ -1546,7 +1546,7 @@ PHONY += distclean
 
 distclean: mrproper
 	$(call cmd,rmfiles)
-	@find $(srctree) $(RCS_FIND_IGNORE) \
+	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
 		-o -name '*.bak' -o -name '#*#' -o -name '*%' \
 		-o -name 'core' \) \
-- 
2.27.0

