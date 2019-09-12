Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A6B0B12B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Sep 2019 18:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730119AbfILQXJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 12 Sep 2019 12:23:09 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42379 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfILQXJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Sep 2019 12:23:09 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8CGMu1a021030;
        Fri, 13 Sep 2019 01:22:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8CGMu1a021030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1568305377;
        bh=BmLOVqV59Vde6VCUiKEZh8rSQkSRAqH6r3P6Fy5+ico=;
        h=From:To:Cc:Subject:Date:From;
        b=GnQyqTruc2er6tX9zm3L1Y8mJnaZMNKoOWR/d2UdtM6d2gyz+Pau5nORNcdL02lRv
         4k/JzXU3PCw05eKfBmeIca8gG+UyhW8NbP0vjSaiMgPDTk05pp5hhsJ1zu9RAc3U9a
         4747NrEfj8fvjq/pF7rJuc50NtedlcNgZUohOGvWFNqLBmt9wEAag4P8a7PLxcfXCW
         +WvYTw7Hr9k+vRSVcdg+wgtXuutPKe/cQVBTNH2GBLuDNErcl+jIcKUPMfAH65Pjck
         y8B/+PP7wz3s/UNrTCjzj0MekA112JwcvbJysyZiCPAC7PMGOfsYZ2Zqpjgxxi+9w7
         drF3nnfsDCz1A==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] kbuild: do not create built-in.a that is never linked to vmlinux
Date:   Fri, 13 Sep 2019 01:22:51 +0900
Message-Id: <20190912162254.9603-1-yamada.masahiro@socionext.com>
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
reachable by the chain of obj-y. Otherwise, useless orphan built-in.a
files are generated.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.build | 2 +-
 scripts/Makefile.lib   | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f72aba64d611..6c3e6cb0c0af 100644
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
index 4a0cdd6f5909..26ac638525cb 100644
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

