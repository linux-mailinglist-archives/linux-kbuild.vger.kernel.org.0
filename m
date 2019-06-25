Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07BE52724
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 10:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731072AbfFYIwz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 04:52:55 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:24772 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbfFYIwy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 04:52:54 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x5P8pmsS025960;
        Tue, 25 Jun 2019 17:51:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x5P8pmsS025960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561452709;
        bh=YXVIKxWcP6nUMETBeMDBbVPvinAIc3GMcFygU3uYYac=;
        h=From:To:Cc:Subject:Date:From;
        b=zYLTQY6fXCrf0iusxvNAL8sGTmK4EWYgwmvFKhve7X5mSYbZ0JNLeXXMySQiR1mYp
         GHNkUgwlbsfSLWS6mR5snYWfpH0V3LOkxgNKZPpmQ5zwUA2bUJBW4OkEIy9q0dpu5h
         1PDikpIU0prTlseMfmUGieSR5A/ueJzOW5G50yAUvCjxcDdksw9+2lRCByIVWMKlLd
         CfWqzO9LMY5H2qqdCxCzK6efBVtzP1VX5/LNHph3vbrt4I4HFMolQzTSEFbhL1F2AQ
         oewaN6M7ur6C5L1RV2oej/oio9wKkbOeY20sjIYMNH8Uomg2KqWo+FpZey3sjR2hAi
         IX4VX8tHps0LA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Sam Ravnborg <sam@ravnborg.org>, Xi Wang <wangxi11@huawei.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: add more hints about SUBDIRS replacement
Date:   Tue, 25 Jun 2019 17:51:27 +0900
Message-Id: <20190625085127.9446-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 0126be38d988 ("kbuild: announce removal of SUBDIRS if used")
added a hint about the 'SUBDIRS' replacement, but it was not clear
enough.

Multiple people sent me similar questions, patches.

  https://lkml.org/lkml/2019/1/17/456

I did not mean to suggest M= for building a subdirectory in the kernel
tree.

From the commit 669efc76b317 ("net: hns3: fix compile error"), people
already (ab)use M=... to do that because it seems to work to some extent.

Documentation/kbuild/kbuild.txt says M= and KBUILD_EXTMOD are used for
building external modules.

In fact, Kbuild supports the single target '%/' for this purpose, but
this may not be noticed much.

Kindly add more hints.

Makefile:213: ================= WARNING ================
Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
Makefile:215:
Makefile:216: If you are building an individual subdirectory
Makefile:217: in the kernel tree, you can do like this:
Makefile:218: $ make path/to/dir/you/want/to/build/
Makefile:219: (Do not forget the trailing slash)
Makefile:220:
Makefile:221: If you are building an external module,
Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
Makefile:223: ==========================================

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Makefile b/Makefile
index 7a7c17eb0cbf..823a39d940c6 100644
--- a/Makefile
+++ b/Makefile
@@ -212,6 +212,13 @@ endif
 ifdef SUBDIRS
   $(warning ================= WARNING ================)
   $(warning 'SUBDIRS' will be removed after Linux 5.3)
+  $(warning )
+  $(warning If you are building an individual subdirectory)
+  $(warning in the kernel tree, you can do like this:)
+  $(warning $$ make path/to/dir/you/want/to/build/)
+  $(warning (Do not forget the trailing slash))
+  $(warning )
+  $(warning If you are building an external module,)
   $(warning Please use 'M=' or 'KBUILD_EXTMOD' instead)
   $(warning ==========================================)
   KBUILD_EXTMOD ?= $(SUBDIRS)
-- 
2.17.1

