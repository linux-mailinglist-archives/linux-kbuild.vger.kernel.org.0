Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08CF5C9C4E
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2019 12:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbfJCKaD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Oct 2019 06:30:03 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:49078 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfJCKaB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 06:30:01 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id x93ATIYv014338;
        Thu, 3 Oct 2019 19:29:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x93ATIYv014338
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570098560;
        bh=kZnR29A01CLRY6YuzVibGJ8V77kkHRFaE8m/+CQ4ZTk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SXDG6Dv44hCsS46cxrD2S2SKZlWCtlieKaq3f0eDh+o/a+geZJH2eh7MB2/2aVIWn
         UKxdsz9rmKjs5EAdCquwLC2eYxQEaTXJ6gFNah021tj6EGmcyjSiZRjUYYcQDCkT50
         AuzlIoRR80caoeOpU2FLFxl21sWrTARnUFTtbEXCNGz2ukJsyrURoaBf+kpTfiTSrF
         CoW/H6AOjBZaAOs8Rmqs4QLN42iW7FE8ZU1n6Z6iGqmckaDLZ3mCPzj6vWZlcq+VYk
         efhf4+rJj/AQENDwxgaqMlIuC4R1gU3lXh8au+sU59aK9urF9hexKjYE5vyfc4LS6n
         wziuxA8b3fSMw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] modpost: do not parse vmlinux for external module builds
Date:   Thu,  3 Oct 2019 19:29:13 +0900
Message-Id: <20191003102915.28301-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191003102915.28301-1-yamada.masahiro@socionext.com>
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building external modules, $(objtree)/Module.symvers is scanned
for symbol information of vmlinux and in-tree modules.

Additionally, vmlinux is parsed if it exists in $(objtree)/.
This is totally redundant since all the necessary information is
contained in $(objtree)/Module.symvers.

Do not parse vmlinux at all for external module builds. This makes
sense because vmlinux is deleted by 'make clean'.

'make clean' leaves all the build artifacts for building external
modules. vmlinux is unneeded for that.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.modpost | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 952fff485546..72109d201196 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -67,8 +67,12 @@ __modpost:
 
 else
 
+MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T -
+
+ifeq ($(KBUILD_EXTMOD),)
+MODPOST += $(wildcard vmlinux)
+else
 # When building external modules load the Kbuild file to retrieve EXTRA_SYMBOLS info
-ifneq ($(KBUILD_EXTMOD),)
 
 # set src + obj - they may be used when building the .mod.c file
 obj := $(KBUILD_EXTMOD)
@@ -79,8 +83,6 @@ include $(if $(wildcard $(KBUILD_EXTMOD)/Kbuild), \
              $(KBUILD_EXTMOD)/Kbuild, $(KBUILD_EXTMOD)/Makefile)
 endif
 
-MODPOST += $(subst -i,-n,$(filter -i,$(MAKEFLAGS))) -s -T - $(wildcard vmlinux)
-
 # find all modules listed in modules.order
 modules := $(sort $(shell cat $(MODORDER)))
 
-- 
2.17.1

