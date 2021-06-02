Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72DDD3985B4
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 11:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhFBJym (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 05:54:42 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:46901 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFBJyX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 05:54:23 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 1529qB4d002312;
        Wed, 2 Jun 2021 18:52:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 1529qB4d002312
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622627532;
        bh=Jo0cB1deSaGzNI69+zHJ7n0UNjfwKvEu3wKwMihqjSw=;
        h=From:To:Cc:Subject:Date:From;
        b=KpbCvbu8/kE6zCYouy4wGOpXBAv6oRqudC4bQ2nkZvDkGytibcjlbZXjF3v71zfWy
         m21WqkBKdYpxhqaxtcCgjDNT0iDpBf/Dc/pJ0g44QWgN+7JyCSK8fcDOzfh2amxTwu
         BKUoEx9vW/CVVZRe3PsMYtt/wn0CE+xoFRG+56AkWLHJIqQBA77+llCeiLN0PXAhDA
         TMkVR/QJuXwRIQizRB+UTmfaSj0hauJD6PU8yDWawGWQ1K+EIdKxesWnKy04Ds5XMp
         MpaSwsa+DZmLW/pKHxoHX4DGLmYXmJFAA1soHuZXwK/hjORS0aJ7Q4foLXybxUyxzW
         6JwrY3NOZTr3A==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Johannes Berg <johannes@sipsolutions.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: remove trailing slashes from $(KBUILD_EXTMOD)
Date:   Wed,  2 Jun 2021 18:52:09 +0900
Message-Id: <20210602095209.123619-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

M= (or KBUILD_EXTMOD) generally expects a directory path without any
trailing slashes, like M=a/b/c.

If you add a trailing slash, like M=a/b/c/, you will get ugly build
logs (two slashes in a series), but it still works fine as long as it
is consistent between 'make modules' and 'make modules_install'.

So, the following code correctly builds and installs the modules.

  $ make M=a/b/c/ modules
  $ sudo make M=a/b/c/ modules_install

Since commit ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst"),
a problem happens if you add a trailing slash only for modules_install.

  $ make M=a/b/c modules
  $ sudo make M=a/b/c/ modules_install

No module is installed in this case, Johannes Berg reported. [1]

Trim any trailing slashes from $(KBUILD_EXTMOD).

I used the 'dirname' command to remove all the trailing slashes in
case someone plays with a crazy directory path like M=a/b/c/////.
The Make's built-in function, $(dir ...) cannot take care of such
a case.

[1]: https://lore.kernel.org/lkml/10cc8522b27a051e6a9c3e158a4c4b6414fd04a0.camel@sipsolutions.net/

Fixes: ccae4cfa7bfb ("kbuild: refactor scripts/Makefile.modinst")
Reported-by: Johannes Berg <johannes@sipsolutions.net>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index b79e0e8acbe3..6dabf3a1f635 100644
--- a/Makefile
+++ b/Makefile
@@ -129,6 +129,11 @@ endif
 $(if $(word 2, $(KBUILD_EXTMOD)), \
 	$(error building multiple external modules is not supported))
 
+ifneq ($(KBUILD_EXTMOD),)
+# remove trailing slashes
+KBUILD_EXTMOD := $(shell dirname $(KBUILD_EXTMOD)/.)
+endif
+
 export KBUILD_EXTMOD
 
 # Kbuild will save output files in the current working directory.
-- 
2.27.0

