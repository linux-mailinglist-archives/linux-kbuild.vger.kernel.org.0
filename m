Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD27F3EB00E
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Aug 2021 08:30:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238893AbhHMGbC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 02:31:02 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17302 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbhHMGbC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 02:31:02 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 17D6U7KX027960;
        Fri, 13 Aug 2021 15:30:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 17D6U7KX027960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628836208;
        bh=2uyWj3h2GkHP1NCnqBhoeJftu4PYK3lPRAQw5R60hWs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jix1rYh0mraSpD3oie+vA8WRYLEn++pG++eMwczTMU89WDlLUvuvD1w7mGFoN1V8z
         gQVGHJhxHUJ2gGv3kQXJkmJZDefSutU1R7qJNVJsCKn7a56DsCa0BUYeQ/vgrSljCJ
         bk3s+DkmG7m24/lbC6rvcc23buqw+9Lysbr/BdH0lNwJ9tDb/iepXvs+dWuHgD/2HC
         W0xxXDswKv1t0ZjvKARkRyECf09mbmBxXPy5dsmaTTp192N3RZ3ODRCp2GvuaRi8Zx
         CLWc25Y3SKrAlsYnH4djEGb3IZjV0PRrnYLRfYM5WeihZMk+mEqpnB5NstvL8wdZcs
         GIASuywfsuqkg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH 2/2] kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk
Date:   Fri, 13 Aug 2021 15:30:05 +0900
Message-Id: <20210813063005.1739278-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210813063005.1739278-1-masahiroy@kernel.org>
References: <20210813063005.1739278-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

if_changed, if_changed_dep, and if_changed_rule must have FORCE as a
prerequisite so the command line change is detected.

Documentation/kbuild/makefiles.rst clearly explains it:

  Note: It is a typical mistake to forget the FORCE prerequisite.

However, not all people read the document, or understand what is written
in it.

People repeated this mistake over again, and I determined a compelling
force is needed.

Show a warning if FORCE is missing in the prerequisite of if_changed
and friends. Same for filechk.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kbuild.include | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index c3c975a92318..dd48e68965f8 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -57,6 +57,7 @@ kecho := $($(quiet)kecho)
 # - If the content differ the new file is used
 # - If they are equal no change, and no timestamp update
 define filechk
+	$(check-FORCE)
 	$(Q)set -e;						\
 	mkdir -p $(dir $@);					\
 	trap "rm -f $(dot-target).tmp" EXIT;			\
@@ -130,7 +131,11 @@ make-cmd = $(call escsq,$(subst $(pound),$$(pound),$(subst $$,$$$$,$(cmd_$(1))))
 # PHONY targets skipped in both cases.
 newer-prereqs = $(filter-out $(PHONY),$?)
 
-if-changed-cond = $(newer-prereqs)$(cmd-check)
+# It is a typical mistake to forget the FORCE prerequisite. Check it here so
+# no more breakage will slip in.
+check-FORCE = $(if $(filter FORCE, $^),,$(warning FORCE prerequsite is missing))
+
+if-changed-cond = $(newer-prereqs)$(cmd-check)$(check-FORCE)
 
 # Execute command if command has changed or prerequisite(s) are updated.
 if_changed = $(if $(if-changed-cond),                                        \
-- 
2.30.2

