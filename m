Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E727662F97
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 06:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfGIE0I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 00:26:08 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42157 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbfGIEZm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 00:25:42 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x694OqVu009969;
        Tue, 9 Jul 2019 13:25:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x694OqVu009969
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562646302;
        bh=RaJaeLmuuIEfd1ef6k7J45/hiRecyMkN2GAogQXZ22k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uX7zdjII0oCqxZzVB7KNqMSkUpgWJcg2+oGORop6+ZNSxaG2CYCOqh/GOR8icFu3Q
         CfiIsKHyRYYQu1fBH4ij4Te9U443p9CU77yeyG9VM29BMrhDBg7n81ewSihoBeAyFe
         4U5zMONyEdv7cUg5/U6ehb9rwOypgnO+0H6ZNjqtDUMzuQLMvb78wqKD2w57Jgn7rb
         Q8WdH+Wmsq91Fc096FnuQ56/TDWP2UHmcVlXm+gRvSAFA2sGux17CyoZcHc3MxcZN5
         YllouM6hj9oUsrjVuION2dLviX8+NEgx/CpHmhz8baLZrcGtvsQ16g+AOjdKGqxguZ
         W/D3cS1Q0Rf8g==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nicolas Pitre <nico@fluxnic.net>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] kbuild: split out *.mod out of {single,multi}-used-m rules
Date:   Tue,  9 Jul 2019 13:24:15 +0900
Message-Id: <20190709042416.27554-12-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709042416.27554-1-yamada.masahiro@socionext.com>
References: <20190709042416.27554-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, *.mod is created as a side-effect of obj-m.

Split out *.mod as a dedicated build rule, which allows to
unify the %.c -> %.o rule, and remove the single-used-m rule.

This also makes the incremental build of allmodconfig faster because
it saves $(NM) invocation when there is no change in the module.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index f34f941c3b9b..00bd3bc1d6ba 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -69,8 +69,10 @@ modorder-target := $(obj)/modules.order
 endif
 endif
 
+mod-targets := $(patsubst %.o, %.mod, $(obj-m))
+
 __build: $(if $(KBUILD_BUILTIN),$(builtin-target) $(lib-target) $(extra-y)) \
-	 $(if $(KBUILD_MODULES),$(obj-m) $(modorder-target)) \
+	 $(if $(KBUILD_MODULES),$(obj-m) $(mod-targets) $(modorder-target)) \
 	 $(subdir-ym) $(always)
 	@:
 
@@ -268,7 +270,7 @@ endef
 
 # List module undefined symbols (or empty line if not enabled)
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-cmd_undef_syms = $(NM) $@ | sed -n 's/^  *U //p' | xargs echo
+cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
 else
 cmd_undef_syms = echo
 endif
@@ -278,11 +280,15 @@ $(obj)/%.o: $(src)/%.c $(recordmcount_source) $(objtool_dep) FORCE
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
@@ -463,8 +469,6 @@ cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^) $(cmd_secanalysis
 
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
-	@{ echo $(filter %.o,$^); \
-	   $(cmd_undef_syms); } > $(patsubst %.o,%.mod,$@)
 $(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-m)
-- 
2.17.1

