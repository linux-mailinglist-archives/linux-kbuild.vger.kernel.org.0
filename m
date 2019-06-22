Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 861A34F6BE
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2019 18:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbfFVQHS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Jun 2019 12:07:18 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55074 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfFVQHN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 12:07:13 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x5MG77nf010140;
        Sun, 23 Jun 2019 01:07:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x5MG77nf010140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561219628;
        bh=sM12Se/SNC24WmIARzc8cjfzxyRxgACkEt3Rjwy8CAA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MQFyp7kM/uCIWxVtksPsDHogRtBwRhlUQf7UGljyZwGVgmafs/+xcTz4BxUdhFaS4
         lnTJ0+zp/8V7mxTM/pKnO05fj8E3313PJy21JRF4mWDGD5ODn5txEvazwCtFwNedSY
         ozrTpWAl3w7WfduUAYhLfRiCCnphyM5+DePkdtX1dLHgZefLIAR+PyI+LbBb+KnJZM
         IMKOju1UEzs4ydG7kb3vLSgSu0NIqcLzyaMElDaA9qJXE6Mtd8iYXu2JJkc36997FF
         NWMKe3c6LAOz5lOVH5II92lAaQx23B42XhuZUxo5m9q7ubrs56EejhPvMUAiMV1t9j
         8Op0M/EF7934w==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] kbuild: save $(strip ...) for calling if_changed and friends
Date:   Sun, 23 Jun 2019 01:07:05 +0900
Message-Id: <20190622160705.17071-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190622160705.17071-1-yamada.masahiro@socionext.com>
References: <20190622160705.17071-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The string returned by $(filter-out ...) does not contain any leading
or trailing spaces.

With the previous commit, 'any-prereq' no longer contains any
excessive spaces.

Nor does 'cmd-check' since it expands to a $(filter-out ...) call.

So, only the space that matters is the one between 'any-prereq'
and 'cmd-check'.

By removing it from the code, we can save $(strip ...) evaluation.
This refactoring is possible because $(any-prereq)$(cmd-check) is only
passed to the first argument of $(if ...), so we are only interested
in whether it is empty or not.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 0fa93f6de0b0..0e57a9524003 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -234,12 +234,12 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 any-prereq = $(filter-out $(PHONY),$?)$(filter-out $(PHONY) $(wildcard $^),$^)
 
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(strip $(any-prereq) $(cmd-check)),                       \
+if_changed = $(if $(any-prereq)$(cmd-check),                                 \
 	$(cmd);                                                              \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
-if_changed_dep = $(if $(strip $(any-prereq) $(cmd-check)),$(cmd_and_fixdep),@:)
+if_changed_dep = $(if $(any-prereq)$(cmd-check),$(cmd_and_fixdep),@:)
 
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
@@ -249,7 +249,7 @@ cmd_and_fixdep =                                                             \
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
-if_changed_rule = $(if $(strip $(any-prereq) $(cmd-check)),$(rule_$(1)),@:)
+if_changed_rule = $(if $(any-prereq)$(cmd-check),$(rule_$(1)),@:)
 
 ###
 # why - tell why a target got built
-- 
2.17.1

