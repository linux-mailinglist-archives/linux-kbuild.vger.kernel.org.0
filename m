Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6B1C32F897
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Mar 2021 07:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhCFGME (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Mar 2021 01:12:04 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:48484 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229626AbhCFGLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Mar 2021 01:11:55 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 1266BSuk023625;
        Sat, 6 Mar 2021 15:11:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 1266BSuk023625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615011089;
        bh=OYZodQowK+AnofibFsnTbuqwLi6cVjHzs6rGqxdb0vs=;
        h=From:To:Cc:Subject:Date:From;
        b=1ya1JtCbfWSQtHXtNu/vrZOhB38/WWr3Pmsk8mo12m0cG2hd0wTRDqqFhBzzcWYKk
         g7fl1wkLctkZGz0gj5UkaRtqnRK0MY2dHOQmmiG+shBV5hXllt2xr0SGi4EHFaHVtS
         +Jd70ITu9d4kZZ++2p758AXMOicuUd4vxKpeNKXA+EITOb8mg565VxGlQE7IhMM1kd
         6kJA89HD19VdfGLCT/vchKxKf/zHHZi5eGOqAZ7xHu/3rz0+ELK26UozEtzqsdLbxU
         p77WM3Y0Oj0P9GPzv683Jmad3EZ0uSB54hPe1Ssl7GBD/s7FjRJULGoOfRD9x5zOU2
         z3U9NHcrnp6jQ==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/2] kbuild: rename multi-used-* to multi-obj-*
Date:   Sat,  6 Mar 2021 15:11:20 +0900
Message-Id: <20210306061121.2023529-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I think multi-obj-* is clearer, and more consisten with real-obj-*.

Rename as follows:

  multi-used-y  ->  multi-obj-y
  multi-used-m  ->  multi-obj-m
  multi-used    ->  multi-obj-ym

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build |  6 +++---
 scripts/Makefile.lib   | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 1b6094a13034..56cf8eb475cf 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -444,11 +444,11 @@ quiet_cmd_link_multi-m = LD [M]  $@
       cmd_link_multi-m = $(LD) $(ld_flags) -r -o $@ $(filter %.o,$^)
 endif
 
-$(multi-used-m): FORCE
+$(multi-obj-m): FORCE
 	$(call if_changed,link_multi-m)
-$(call multi_depend, $(multi-used-m), .o, -objs -y -m)
+$(call multi_depend, $(multi-obj-m), .o, -objs -y -m)
 
-targets += $(multi-used-m)
+targets += $(multi-obj-m)
 targets := $(filter-out $(PHONY), $(targets))
 
 # Add intermediate targets:
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index eee59184de64..e60be0bddda2 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -48,9 +48,9 @@ endif
 suffix-search = $(foreach s,$(2),$($(1:.o=$s)))
 # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
 multi-search = $(sort $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)), $(m))))
-multi-used-y := $(call multi-search,$(obj-y),-objs -y)
-multi-used-m := $(call multi-search,$(obj-m),-objs -y -m)
-multi-used   := $(multi-used-y) $(multi-used-m)
+multi-obj-y := $(call multi-search,$(obj-y),-objs -y)
+multi-obj-m := $(call multi-search,$(obj-m),-objs -y -m)
+multi-obj-ym := $(multi-obj-y) $(multi-obj-m)
 
 # Replace multi-part objects by their individual parts,
 # including built-in.a from subdirectories
@@ -92,12 +92,12 @@ obj-m		:= $(addprefix $(obj)/,$(obj-m))
 lib-y		:= $(addprefix $(obj)/,$(lib-y))
 real-obj-y	:= $(addprefix $(obj)/,$(real-obj-y))
 real-obj-m	:= $(addprefix $(obj)/,$(real-obj-m))
-multi-used-m	:= $(addprefix $(obj)/,$(multi-used-m))
+multi-obj-m	:= $(addprefix $(obj)/, $(multi-obj-m))
 subdir-ym	:= $(addprefix $(obj)/,$(subdir-ym))
 
 # Finds the multi-part object the current object will be linked into.
 # If the object belongs to two or more multi-part objects, list them all.
-modname-multi = $(sort $(foreach m,$(multi-used),\
+modname-multi = $(sort $(foreach m,$(multi-obj-ym),\
 		$(if $(filter $*.o, $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$(m:.o=))))
 
 __modname = $(if $(modname-multi),$(modname-multi),$(basetarget))
-- 
2.27.0

