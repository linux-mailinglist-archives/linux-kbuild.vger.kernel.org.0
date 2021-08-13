Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50BAD3EB00D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Aug 2021 08:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238889AbhHMGbC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 02:31:02 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17303 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238776AbhHMGbB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 02:31:01 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 17D6U7KW027960;
        Fri, 13 Aug 2021 15:30:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 17D6U7KW027960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628836208;
        bh=8QEPgd04IIZeiouqqMA3n0LluzccoXO1FytQ+dXRUZY=;
        h=From:To:Cc:Subject:Date:From;
        b=KT4P3MfRbTbG5UVZF7rcysB22J+PjRQdfEozadN0XPFFeU59q3uuEi58FhzIW1hix
         yRzkCEyiSTFW2lFY8xRNToy5HfYSa7yrl8f0ZujHtdhG5bYzrrnE8RP6nLr0VGdYDW
         q/CT2HxQAJVHoqd2yb5P6thtE9YekWqRDz94lQ/AaMKhSSnVlXVWurqj2SGdfTxuyb
         2SfBO/mQyN7ylFto0My9t6Z+aCPUK01Urg8A5rK/zihfwuyAUCd7j4ZmDxJ//o3ISb
         OMhCmYip7BHXClBGTrJ3nkdQnOpkVP7SKkjzkRKiN0tVA3OREo+IQApniJ7VhNX5+f
         a01ts/Pr6aRpA==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 1/2] kbuild: macrofy the condition of if_changed and friends
Date:   Fri, 13 Aug 2021 15:30:04 +0900
Message-Id: <20210813063005.1739278-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Add a new macro that expands into $(newer-prereqs)$(cmd-check).

It makes it easier to add common code for if_changed, if_changed_dep,
and if_changed_rule.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index f247e691562d..c3c975a92318 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -130,13 +130,15 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 # PHONY targets skipped in both cases.
 newer-prereqs = $(filter-out $(PHONY),$?)
 
+if-changed-cond = $(newer-prereqs)$(cmd-check)
+
 # Execute command if command has changed or prerequisite(s) are updated.
-if_changed = $(if $(newer-prereqs)$(cmd-check),                              \
+if_changed = $(if $(if-changed-cond),                                        \
 	$(cmd);                                                              \
 	printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, @:)
 
 # Execute the command and also postprocess generated .d dependencies file.
-if_changed_dep = $(if $(newer-prereqs)$(cmd-check),$(cmd_and_fixdep),@:)
+if_changed_dep = $(if $(if-changed-cond),$(cmd_and_fixdep),@:)
 
 cmd_and_fixdep =                                                             \
 	$(cmd);                                                              \
@@ -146,7 +148,7 @@ cmd_and_fixdep =                                                             \
 # Usage: $(call if_changed_rule,foo)
 # Will check if $(cmd_foo) or any of the prerequisites changed,
 # and if so will execute $(rule_foo).
-if_changed_rule = $(if $(newer-prereqs)$(cmd-check),$(rule_$(1)),@:)
+if_changed_rule = $(if $(if-changed-cond),$(rule_$(1)),@:)
 
 ###
 # why - tell why a target got built
-- 
2.30.2

