Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9DEC9962
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 09:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbfJCH7e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 03:59:34 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:59224 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727452AbfJCH7Q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:16 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x937wTkW007720;
        Thu, 3 Oct 2019 16:58:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x937wTkW007720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570089513;
        bh=+2++qHqEb0DqRRYFRDlh3635ELQ/E4mk9ABraUBN90M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xzpHUKIW1Rdb+BGeVOTE9aitZme/b4Cfxbnx0ukpryA73Q4laaIZVJGwNI8EgBL11
         m+uKhaOQFaL8e1PwVsafamEH4O56h27AmtxkNtTG6KI0ugDRwCQ7rSRUgK2aQaka0l
         M/Ph7mbYklGJwrBRwxK4BavnKcTVFXoPN3q6/Dbc3raiAeBUwo68O0yC92D6Mr/lq2
         psMYe10UTW5BIQLpX3JB4Zr2JUg5sFAVaP1le7jQz8Cbn9I517yaTTo44qZOfrqqNA
         JLYFfDsJ/ak3lsxsO5PD+KT3jvexpQIMH8cdcXjE8jyCtEoT5j5IbFnHbJeSXbaDi6
         j9JPu7ZbVh3ZA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shaun Ruffell <sruffell@sruffell.net>,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] kbuild: fix build error of 'make nsdeps' in clean tree
Date:   Thu,  3 Oct 2019 16:58:24 +0900
Message-Id: <20191003075826.7478-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003075826.7478-1-yamada.masahiro@socionext.com>
References: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Running 'make nsdeps' in a clean source tree fails as follows:

$ make -s clean; make -s defconfig; make nsdeps
   [ snip ]
awk: fatal: cannot open file `init/modules.order' for reading (No such file or directory)
make: *** [Makefile;1307: modules.order] Error 2
make: *** Deleting file 'modules.order'
make: *** Waiting for unfinished jobs....

The cause of the error is 'make nsdeps' does not build modules at all.
Set KBUILD_MODULES to fix it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Matthias Maennich <maennich@google.com>
---

Changes in v2: None

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 6f54f2f95743..d97f38ad5d9f 100644
--- a/Makefile
+++ b/Makefile
@@ -616,7 +616,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all _all modules,$(MAKECMDGOALS)),)
+ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
-- 
2.17.1

