Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8EB75CD8
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2019 04:18:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbfGZCSK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Jul 2019 22:18:10 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:21982 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfGZCSK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 22:18:10 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x6Q2HpYX016459;
        Fri, 26 Jul 2019 11:17:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x6Q2HpYX016459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564107471;
        bh=sP8514OambOv5RPYsCOuewPkI9Z9loIm68XJqeC4lrU=;
        h=From:To:Cc:Subject:Date:From;
        b=zOS6XRj0+hlcW4b/6zpOW0Zr5pw6BuIo22oRb8e9zrpc3c7QXcJXOt2ysHjBDiUjC
         oolxTvpoAk2+bVVxbnWLGVOv3xKntaKnEZLOwUwTnQfzmD0ZJ+hB7ocnYLcqzM4xJI
         F/AS2ptsKi8acYM75T8rkRW78vDVY7UHGA1x/YvQ+Lb3WS5kqxp0/DA/KFNu6YjZ/i
         q76l7DpWrkY9QXA1BWtTA0dWDgy67qNl3HJ+wkcGgs7IEf5ajk4IjkBnJLnTLHpEHb
         HIOM+ZjBXnKVN0QHr89Q781FphEymRqErOL+SWhZw6JbkGT66LqhqucUYJK6KdpCOx
         Z4Xd4ohMHRLKQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: clean-up subdir-ym computation
Date:   Fri, 26 Jul 2019 11:17:47 +0900
Message-Id: <20190726021747.5021-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The intermediate variables __subdir-{y,m} are unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.lib | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 41c50f9461e5..444574963cb5 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -20,27 +20,20 @@ obj-m := $(filter-out $(obj-y),$(obj-m))
 # Filter out objects already built-in
 lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 
+# Subdirectories we need to descend into
+subdir-ym := $(sort $(subdir-y) $(subdir-m) $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-m))))
+
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
 modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
 
 # Handle objects in subdirs
-# ---------------------------------------------------------------------------
-# o if we encounter foo/ in $(obj-y), replace it by foo/built-in.a
-#   and add the directory to the list of dirs to descend into: $(subdir-y)
-# o if we encounter foo/ in $(obj-m), remove it from $(obj-m)
-#   and add the directory to the list of dirs to descend into: $(subdir-m)
-__subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
-subdir-y	+= $(__subdir-y)
-__subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
-subdir-m	+= $(__subdir-m)
+# When we encounter foo/ in $(obj-y), link foo/built-in.a into vmlinux,
+# but we do not do that for $(obj-m)
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
 obj-m		:= $(filter-out %/, $(obj-m))
 
-# Subdirectories we need to descend into
-subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
-
 # if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
 multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
-- 
2.17.1

