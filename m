Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0FC82BD2
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731954AbfHFGkg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:36 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39570 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731731AbfHFGkW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:22 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7p002982;
        Tue, 6 Aug 2019 15:39:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7p002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073567;
        bh=WuuYZLz5z+C5ByPickHqXjcy+trxgXoTZfNCL4q0+ek=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wZP3k/5mLGK/rx72rRKUp6Fflr4SFpT0/nbDK73dPtFRSCq+FIMJ6AFUdjAuYREoQ
         EAoB0nlX3+1RRxB0U/vlYlvpU95Uhe8+Msw90FPV9xLbEfeZHIWePv2+3Bn7jqRTQe
         Uh+mh36iRXvl6s62Jz/UaHL/Wojga/DMWusWL+o+vZo52M+vTCYI7lmFoWhQ9tR3D2
         1rFNPX0nTg1KndQuNruLobq/a82uM/s6hzhb1Ws0DyCqENCPOiAG8ud3yRQvfi/Ste
         viHvqiBOcXazcEmxmzsheRHLk4djPhzzPUHdJK7FFJ6/M/DfcQipQieljKkQpp3Bdv
         RRKN76F/VEWJg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] kbuild: clean up modname calculation
Date:   Tue,  6 Aug 2019 15:39:20 +0900
Message-Id: <20190806063923.1266-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'multi-used' is used for computing the modname. Improve the code
readability by removing the .o suffix before the foreach loop.

I renamed multi-used-m to modules-multi.

No functional change intended.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build |  6 +++---
 scripts/Makefile.lib   | 15 +++++++++------
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 0d434d0afc0b..b0ff60ac0c42 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -460,11 +460,11 @@ endif
 quiet_cmd_link_multi-m = LD [M]  $@
       cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
 
-$(multi-used-m): FORCE
+$(modules-multi): FORCE
 	$(call if_changed,link_multi-m)
-$(call multi_depend, $(multi-used-m), .o, -objs -y -m)
+$(call multi_depend, $(modules-multi), .o, -objs -y -m)
 
-targets += $(multi-used-m)
+targets += $(modules-multi)
 targets := $(filter-out $(PHONY), $(targets))
 
 # Add intermediate targets:
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0a540599823e..e503f12e8e9c 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -41,10 +41,13 @@ obj-m		:= $(filter-out %/, $(obj-m))
 # Subdirectories we need to descend into
 subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
-# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
-multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
-multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
-multi-used   := $(multi-used-y) $(multi-used-m)
+# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo is multi-used
+multi-used-y := $(sort $(foreach m, $(patsubst %.o,%,$(obj-y)), $(if $(strip $($(m)-objs) $($(m)-y) $($(m)-)), $(m))))
+multi-used-m := $(sort $(foreach m, $(patsubst %.o,%,$(obj-m)), $(if $(strip $($(m)-objs) $($(m)-y) $($(m)-m) $($(m)-)), $(m))))
+
+modules-multi := $(addsuffix .o, $(multi-used-m))
+
+multi-used := $(multi-used-y) $(multi-used-m)
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
 # tell kbuild to descend
@@ -90,14 +93,14 @@ lib-y		:= $(addprefix $(obj)/,$(lib-y))
 subdir-obj-y	:= $(addprefix $(obj)/,$(subdir-obj-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
-multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
+modules-multi	:= $(addprefix $(obj)/,$(modules-multi))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, all of them are
 # concatenated with a colon separator.
 modname-multi = $(subst $(space),:,$(sort $(foreach m,$(multi-used),\
-		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=)))))
+		$(if $(filter $*.o, $($(m)-objs) $($(m)-y) $($(m)-m)),$(m)))))
 
 modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
 
-- 
2.17.1

