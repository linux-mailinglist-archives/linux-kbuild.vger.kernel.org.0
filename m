Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A32CC0277
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 11:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfI0JhC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:33065 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbfI0JhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:37:02 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8R9a5uf001372;
        Fri, 27 Sep 2019 18:36:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8R9a5uf001372
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569576971;
        bh=PdteufK64PUrtistqDZxQfPkOhODuQM4/dZUBLfPgTA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EM8WpQlHl/RRg5lRspAhRnXuVP7NMRwN3vND8I4as8aaLPekCtI2sURqIXOQUzDqJ
         TJHa0dr1aSxHTVohjmVKh7oax8Y6aHX6vl0frGNzHY2Kajqt1EupmVDFm5uVTT36nI
         WTqmMnV47W4d6qBAKQZwm29A4ypO1YqbCZQRbrrvANW8PLu1Z4gsMkTGzAkFJ/v6aw
         HY/TlIH66PvW6R/IEv69y/UWP17UXOHEpE7VWJKN4aqBCdnNEQwkFNCXzd0B4zz7VG
         d5miMuXHwDAUjJBe6WWgZaWnkP07YEIXzgMDUvwQxkliu+OIVfQBRM26Bg370XpJOe
         0pyYPUk423uwg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     Jessica Yu <jeyu@kernel.org>
Cc:     Matthias Maennich <maennich@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] kbuild: fix build error of 'make nsdeps' in clean tree
Date:   Fri, 27 Sep 2019 18:36:01 +0900
Message-Id: <20190927093603.9140-6-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927093603.9140-1-yamada.masahiro@socionext.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
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
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d456746da347..80ba8efd56bb 100644
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

