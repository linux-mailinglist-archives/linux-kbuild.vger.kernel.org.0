Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C52434F6BA
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2019 18:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbfFVQHN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Jun 2019 12:07:13 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55073 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726276AbfFVQHM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 12:07:12 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5MG77ne010140;
        Sun, 23 Jun 2019 01:07:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5MG77ne010140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561219628;
        bh=BrWzygOirnh6Vzzhfu7Gd4Vu22siU0gsu4JudlFjotY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hEIwm/ptIqDFlBaDqP+pAnTTU3InHllPUGjYX0fcKWpWJiukEomYRDuJfYBgfxTAm
         0DB/EuFTzo8CNeIKrKhaQ7ImdNWgWAC2qZUarboZQzgQ5pIzbf7jfJ4hmNARqHoipu
         quqv7AIPranMc7rcvif5v0hRULFR2soPafgK19FPR5gtR3cFc+gT5CySegkVb1oR9v
         APp3JMA9k6KloCtdyciaikmEV+LKkNnAlXBjeQN5VMpzSlEp8UdFTUx3/kIi1/sF8v
         Zv7siSAGTewl+FcTWBrdw4x6aI/adXmmkKqKN+jGayJdqfgRejaCHvUqeWgq7sl967
         3gvIdyofqYWLw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] kbuild: save $(strip ...) for calling any-prepreq
Date:   Sun, 23 Jun 2019 01:07:04 +0900
Message-Id: <20190622160705.17071-2-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The string returned by $(filter-out ...) does not contain any leading
or trailing spaces.

So, only the space that matters is the one between

  $(filter-out $(PHONY),$?)

and

  $(filter-out $(PHONY) $(wildcard $^),$^)

By removing it from the code, we can save $(strip ...) evaluation.
This refactoring is possible because $(any-prereq) is only passed to
the first argument of $(if ...), so we are only interested in whether
it is empty or not.

This is also the prerequisite for the next commit.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 4bec04c89750..0fa93f6de0b0 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -231,7 +231,7 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 
 # Find any prerequisites that is newer than target or that does not exist.
 # PHONY targets skipped in both cases.
-any-prereq = $(filter-out $(PHONY),$?) $(filter-out $(PHONY) $(wildcard $^),$^)
+any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
@@ -274,7 +274,7 @@ ifeq ($(KBUILD_VERBOSE),2)
 why =                                                                        \
     $(if $(filter $@, $(PHONY)),- due to target is PHONY,                    \
         $(if $(wildcard $@),                                                 \
-            $(if $(strip $(any-prereq)),- due to: $(any-prereq),             \
+            $(if $(any-prereq),- due to: $(any-prereq),                      \
                 $(if $(cmd-check),                                           \
                     $(if $(cmd_$@),- due to command line change,             \
                         $(if $(filter $@, $(targets)),                       \
-- 
2.17.1

