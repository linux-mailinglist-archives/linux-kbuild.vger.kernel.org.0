Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2313130DF4
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 08:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgAFHYk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 02:24:40 -0500
Received: from conuserg-10.nifty.com ([210.131.2.77]:59011 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbgAFHYk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 02:24:40 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 0067NuUJ027666;
        Mon, 6 Jan 2020 16:23:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0067NuUJ027666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578295438;
        bh=nH4dFfP1GgwyNJ1zJ0dHhCaaOD+Rq3zIautm+yHcSB0=;
        h=From:To:Cc:Subject:Date:From;
        b=uI4B/uwXD2uUt8T9ilWUdGrV5eqUYNK1Qyoczui8dMvAriIP3iwWjUcwCCVcaj46v
         NESL8gqtR39wKMact7aYK6KaiLOrSiXcCsM8wMcMUudGq4kHmjwxSmIA1cYMHUDtv6
         AwEs5+IUGNkJGa3yX2HkGeq9LzCMqOnjc8dBuHwTsFKa0dcZPKCALziJABSnVgy2Tw
         99OzzmLMLMZ7UUdF+EV69yheIeFSTGEVAB7nn3OjyMdfSgqUxSEhC7EfRVS5/ogd9G
         QUcepOYisf00v1/9rFi5UzqNXJ/q3JD6rj+O4vmeNCkuPzz5M7vYVTWORtW9EBPvHY
         5MH3ZFomDPyMg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] kbuild: get rid of duplication in the first line of *.mod files
Date:   Mon,  6 Jan 2020 16:23:54 +0900
Message-Id: <20200106072355.32178-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The first line of *.mod lists the object files that consist of the
module. This may contain duplication if the same object is added
multiple times, like this:

  obj-m := foo.o
  foo-$(CONFIG_FOO1_X) += foo1.o
  foo-$(CONFIG_FOO1_Y) += foo1.o
  foo-$(CONFIG_FOO2_X) += foo2.o
  foo-$(CONFIG_FOO2_Y) += foo2.o

This is probably not a big deal. As far as I know, the only small
problem is scripts/mod/sumversion.c parses the same file over again.
This can be avoided by adding $(sort ...). It has a side-effect that
sorts the objects alphabetically, but it is not a big deal, either.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2:
  - new patch

 scripts/Makefile.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b734ac8a654e..d8445b696d5b 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -265,8 +265,10 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
+multi-m-prereqs = $(sort $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)))
+
 cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	echo $(if $(multi-m-prereqs), $(multi-m-prereqs), $(@:.mod=.o)); \
 	$(cmd_undef_syms); \
 	} > $@
 
-- 
2.17.1

