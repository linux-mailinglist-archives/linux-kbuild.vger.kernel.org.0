Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECCDF65183
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Jul 2019 07:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727967AbfGKFpx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:59472 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727960AbfGKFpx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Jul 2019 01:45:53 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x6B5ip8V031345;
        Thu, 11 Jul 2019 14:44:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x6B5ip8V031345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562823900;
        bh=iRp9Du8hIMlIwOLhJe7rDNMn7P7N/4zadqD4+iwRwl8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kHHROSX5oyo66/pfhCsF+TrfXLXku+LACPJkW0iet8erC7xG/EvN4XWYSx5tsRd/W
         lsFYztWkgGnh31I5CogAYVE1AD20ywUkiqdw7T2a/L9KKpjZ4e74xRXA4Peqey4nJ6
         gowGCHXn/8v2uBm8G8bJdnfXKUn+mxBVNKfl4K7VKH6BOatc6BPFpwQWENIIJzddyh
         ge9KxtwnrpMCyjXJRLm6OcUmdxeD2bEk99+ybLty2fZrElUbLtSesyNB+eHNlsaTnc
         utDi+WeMxMGD4ZFlOGRLEAsSuC7BAGg7lUtPXje6fX8D/iDN7fK2xvGm5nMS3+DGR6
         sQfWX0otXw6Jw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/11] kbuild: split out *.mod out of {single,multi}-used-m rules
Date:   Thu, 11 Jul 2019 14:44:34 +0900
Message-Id: <20190711054434.1177-12-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190711054434.1177-1-yamada.masahiro@socionext.com>
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, *.mod is created as a side-effect of obj-m.

Split out *.mod as a dedicated build rule, which allows to unify
the %.c -> %.o rule, and remove the single-used-m rule.

This also makes the incremental build of allmodconfig faster because
it saves $(NM) invocation when there is no change in the module.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 scripts/Makefile.build | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2709646b1a5d..63fc266b4985 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -67,8 +67,10 @@ ifeq ($(CONFIG_MODULES)$(need-modorder),y1)
 modorder-target := $(obj)/modules.order
 endif
 
+mod-targets := $(patsubst %.o, %.mod, $(obj-m))
+
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(modorder-target)) \
+	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
 	 $(subdir-ym) $(always)
 	@:
 
@@ -266,7 +268,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $@ | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
 else
 cmd_undef_syms = echo
 endif
@@ -276,11 +278,15 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
 	$(call cmd,force_checksrc)
 	$(call if_changed_rule,cc_o_c)
 
-$(single-used-m): $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
-	$(call cmd,force_checksrc)
-	$(call if_changed_rule,cc_o_c)
-	@{ echo $@; \
-	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
+cmd_mod = { \
+	echo $(if $($*-objs)$($*-y)$($*-m), $(addprefix $(obj)/, $($*-objs) $($*-y) $($*-m)), $(@:.mod=.o)); \
+	$(cmd_undef_syms); \
+	} > $@
+
+$(obj)/%.mod: $(obj)/%.o FORCE
+	$(call if_changed,mod)
+
+targets += $(mod-targets)
 
 quiet_cmd_cc_lst_c = MKLST   $@
       cmd_cc_lst_c = $(CC) $(c_flags) -g -c -o $*.o $< && \
@@ -461,8 +467,6 @@ cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(filter %.o,$^); \
-	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-m)
-- 
2.17.1

