Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16C741CD082
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 May 2020 05:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728101AbgEKDux (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 23:50:53 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:44054 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbgEKDux (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 23:50:53 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 04B3oFts022396;
        Mon, 11 May 2020 12:50:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 04B3oFts022396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589169016;
        bh=0XAx4F4+9RG7//GyYplcO9iPdaPpdu6uh8fjArPWH6M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=x4WFcasaWdYCkwIwk98Gijalsz7FISOfDXj+R26BgMnoFPHLTndQGGSLMIuaBjSHN
         Y5kh1Vhi+j8vKAW6QqNURhFuWon8sToAVotX8YNARdxmxGLkOOQ4KZ3tiUbfCBOg7z
         fKfRBogjgzQH6m1QcxyMEuG+IrR6ERRUMclpMpsFVSIp/YUiApHMC+KbxLMT/Vbc9E
         +8HoYRoymy+ae5px3WHC+vF6AJZcuHIKw+P5JFpmf8iWGdi0D8Si7Prn4BDtjkrXN7
         +9QSeE5FxWAfs0QQnb8SSddH2E3KVqElH2eE1shcCQZQwxgYnHXokDLU7XQ2Z+W2cr
         WpEXT8bp/iRhw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kbuild: error out if targets prefixed with '__' are directly run
Date:   Mon, 11 May 2020 12:50:13 +0900
Message-Id: <20200511035013.1629672-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200511035013.1629672-1-masahiroy@kernel.org>
References: <20200511035013.1629672-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Some targets are internal-use only.

It is tedious to care about "what if __build_one_by_one is contained
in $(MAKECMDGOALS)?" etc.

Prefix internal targets with double underscores. Stop parsing Makefile
if they are directly run.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 1a4977ad7cd9..1162cb04860c 100644
--- a/Makefile
+++ b/Makefile
@@ -11,9 +11,12 @@ NAME = Kleptomaniac Octopus
 # Comments in this file are targeted only to the developer, do not
 # expect to learn how to build the kernel reading this file.
 
+$(if $(filter __%, $(MAKECMDGOALS)), \
+	$(error targets prefixed with '__' are only for internal use))
+
 # That's our default target when none is given on the command line
-PHONY := _all
-_all:
+PHONY := __all
+__all:
 
 # We are using a recursive build, so we need to do a little thinking
 # to get the ordering right.
@@ -172,13 +175,13 @@ export sub_make_done := 1
 
 ifeq ($(need-sub-make),1)
 
-PHONY += $(MAKECMDGOALS) sub-make
+PHONY += $(MAKECMDGOALS) __sub-make
 
-$(filter-out _all sub-make $(this-makefile), $(MAKECMDGOALS)) _all: sub-make
+$(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
 	@:
 
 # Invoke a second make in the output directory, passing relevant variables
-sub-make:
+__sub-make:
 	$(Q)$(MAKE) -C $(abs_objtree) -f $(abs_srctree)/Makefile $(MAKECMDGOALS)
 
 endif # need-sub-make
@@ -323,7 +326,7 @@ ifdef mixed-build
 
 PHONY += $(MAKECMDGOALS) __build_one_by_one
 
-$(filter-out __build_one_by_one, $(MAKECMDGOALS)): __build_one_by_one
+$(MAKECMDGOALS): __build_one_by_one
 	@:
 
 __build_one_by_one:
@@ -598,12 +601,12 @@ else #!config-build
 # targets and others. In general all targets except *config targets.
 
 # If building an external module we do not care about the all: rule
-# but instead _all depend on modules
+# but instead __all depend on modules
 PHONY += all
 ifeq ($(KBUILD_EXTMOD),)
-_all: all
+__all: all
 else
-_all: modules
+__all: modules
 endif
 
 # Decide whether to build built-in, modular, or both.
@@ -625,7 +628,7 @@ endif
 # in addition to whatever we do anyway.
 # Just "make" or "make all" shall build modules as well
 
-ifneq ($(filter all _all modules nsdeps,$(MAKECMDGOALS)),)
+ifneq ($(filter all modules nsdeps,$(MAKECMDGOALS)),)
   KBUILD_MODULES := 1
 endif
 
-- 
2.25.1

