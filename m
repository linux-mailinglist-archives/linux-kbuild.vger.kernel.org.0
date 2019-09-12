Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 827BCB0986
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 09:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfILHdr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 03:33:47 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:43159 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfILHdr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 03:33:47 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x8C7Xbg8018895;
        Thu, 12 Sep 2019 16:33:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x8C7Xbg8018895
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568273618;
        bh=LqEDIT/B2atU2BjPW+NBM34K9nUbTM8vvHn1AoCzsCs=;
        h=From:To:Cc:Subject:Date:From;
        b=M3Ei2vzubTb8BRzMbZ3SsNAr7MzewSzAZZg0zDVPpLcsU8giwNoH2pPXhZb3KqHue
         odD+Ces3Hh+ja/8ryuQfAxx1dm9VKVYFKm2SByyrtwz0WJUu1IUGHfSDkyst4JMQyx
         zzGci76Sxf8fB9rO6hk+bnSzZy9c3JEq489y20fYE4i+pn7LPLgZx+ZphHznPEdT4X
         TaLjDemlz8XN5cKSX8rMLnt82dQtUMzg+Yjd279m+1nU276+HRem16ZglaC4LNhgVI
         wfiOlQVAlIKDrGDQw75+lpNPws1lFswTughJxWK85A1iovkzB1P2+R+OxCZ7Hmax3R
         H3FC736G/j2HQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] kbuild: do not create built-in.a that is never linked to vmlinux
Date:   Thu, 12 Sep 2019 16:33:33 +0900
Message-Id: <20190912073336.7036-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Both 'obj-y += foo/' and 'obj-m += foo/' requrest Kbuild to visit the
sub-directory foo/, but the difference is that only the former combines
foo/built-in.a into the built-in.a of the current directory because
everything in sub-directories visited by obj-m is supposed to be modular.

So, it makes sense to create built-in.a only if that sub-directory is
reachable by the chain of obj-y. Otherwise, built-in.a will not be
linked into vmlinux anyway. If an orphan built-in.a is created, it is
very likely a Makefile bug.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9fa09361aa5d..54fc68168686 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -66,7 +66,7 @@ lib-target := $(obj)/lib.a
 real-obj-y += $(obj)/lib-ksyms.o
 endif
 
-ifneq ($(strip $(real-obj-y) $(need-builtin)),)
+ifdef need-builtin
 builtin-target := $(obj)/built-in.a
 endif
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 264611972c4a..07095d3789a1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -35,7 +35,11 @@ __subdir-y	:= $(patsubst %/,%,$(filter %/, $(obj-y)))
 subdir-y	+= $(__subdir-y)
 __subdir-m	:= $(patsubst %/,%,$(filter %/, $(obj-m)))
 subdir-m	+= $(__subdir-m)
+ifdef need-builtin
 obj-y		:= $(patsubst %/, %/built-in.a, $(obj-y))
+else
+obj-y		:= $(filter-out %/, $(obj-y))
+endif
 obj-m		:= $(filter-out %/, $(obj-m))
 
 # Subdirectories we need to descend into
-- 
2.17.1

