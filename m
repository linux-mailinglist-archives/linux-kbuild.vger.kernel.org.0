Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21AA13441C
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727200AbfFDKPi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:38 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39190 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727085AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7K032511;
        Tue, 4 Jun 2019 19:14:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7K032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643267;
        bh=LSUJNxijHUvxY1rUpeDqChsQP6kLQbdVLxrgaFhk53Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LAwtFKf2wIw6tMpPoEnHS5RkStUORb0Z3gAA8ZbTb+V88FeU8cv88xStQPNue6h+/
         OKqB2KOIaWtFJVVwM+XH+1poPrmHPvEhSSVL64aR0FEAjqIpEIUi5s9yjsXrWEpGnj
         qO4KjeafCKeZLvlmM6qJBYUQL9bS5ht8nC02ZrPT/RQ8mPP1BVc06RHEGwfVI+ue4j
         rxsvZeYr0BaXPIlbGxKWpskliA+8MCD5xBXj61OAqPIgTPJ6f5QyvjzBv93/ZNdwyH
         7QFsTlFeo0uhbM3zg/0x+64Qoqfphszli/KbT9BhjKBnjg7HLh6ihcNcanikBMUTAC
         6J7CTEB97kYPQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/15] fixup: kbuild: add support for ensuring headers are self-contained
Date:   Tue,  4 Jun 2019 19:14:08 +0900
Message-Id: <20190604101409.2078-15-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is needed to avoid regeneration of header-test C files.

This will go away when Jani send v2.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2b4d56483c2e..067e98628664 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -298,10 +298,9 @@ $(obj)/%.lst: $(src)/%.c FORCE
 # ---------------------------------------------------------------------------
 
 quiet_cmd_header_test = HDRTEST $@
-      cmd_header_test = echo "\#include \"$(<F)\"" > $@
+      cmd_header_test = echo "\#include \"$*.h\"" > $@
 
-# FIXME: would be nice to be able to limit this implicit rule to header-test-y
-$(obj)/%.header_test.c: $(src)/%.h FORCE
+$(obj)/%.header_test.c:
 	$(call if_changed,header_test)
 
 # Compile assembler sources (.S)
-- 
2.17.1

