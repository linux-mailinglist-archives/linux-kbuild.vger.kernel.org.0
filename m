Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E823130C83
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 04:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbgAFDXx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Jan 2020 22:23:53 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:28701 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgAFDXx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jan 2020 22:23:53 -0500
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0063NPRQ000672;
        Mon, 6 Jan 2020 12:23:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0063NPRQ000672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578281006;
        bh=wvIIht9IjcI1sfB8BY3Nr3IRwO3XwvIvbn+5CR6Dbh8=;
        h=From:To:Cc:Subject:Date:From;
        b=Mpe2P6BY3kQ6AOThh2zkWSMu9ApwJEKLqNjXJsdeEnvIXrt61xJyzxt9gH+HS1otj
         Xgop6EHssamcdbnSFCr7RvCYuLlIDchF3VHuw2ni9NJL42OGbw07nycOgOYg9ZYxSX
         oSGOKN8p7TFabK1WYddM6pSUf5Cx+He+w3NEhYkHhpWwdPKYaONVD+S0QKKM0NQE1g
         ViEj1s4PuFA6HcRfGyYGU3CbWwPy6zYyUJ6qsCS9SSbLGZK44vK8/s6gTyvqBll1dX
         ePacfiyDTEXWYsCpyfqN3R/NrzFJeXwmZMgsMeC+o+b8k32LaJFey+tHJ0NcdPhM27
         RePHblFXsYpAw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Fumiya Shigemitsu <shfy1014@gmail.com>,
        Yongxin Liu <yongxin.liu@windriver.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: allow modules to link *.a archives
Date:   Mon,  6 Jan 2020 12:23:24 +0900
Message-Id: <20200106032324.3147-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
modules cannot link *.a archives.

I do not see such a usecase in the upstream code, but multiple people
reported this issue, so it seems to be a desired feature for external
modules.

For example, libfoo.a is not linked in the following test case:

    obj-m := foo.o
    foo-objs := foo1.o libfoo.a

Instead of reverting the offending commit, I wrote slightly cleaner code.
I added multi-m-prereqs to avoid code duplication.

Reported-by: Fumiya Shigemitsu <shfy1014@gmail.com>
Reported-by: Yongxin Liu <yongxin.liu@windriver.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b734ac8a654e..a8481b765ea8 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -265,8 +265,10 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
+multi-m-prereqs = $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m))
+
 cmd_mod = { \
-	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	echo $(if $(multi-m-prereqs), $(multi-m-prereqs), $(@:.mod=.o)); \
 	$(cmd_undef_syms); \
 	} > $@
 
@@ -427,13 +429,13 @@ targets += $(obj)/lib-ksyms.o
 endif
 
 # NOTE:
-# Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
+# Do not replace $(multi-m-prereqs) with $(real-prereqs). When a single object
 # module is turned into a multi object module, $^ will contain header file
 # dependencies recorded in the .*.cmd file.
 quiet_cmd_link_multi-m = LD [M]  $@
-      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
+      cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(multi-m-prereqs)
 
-$(multi-used-m): FORCE
+$(multi-used-m): $(obj)/%.o: FORCE
 	$(call if_changed,link_multi-m)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
-- 
2.17.1

