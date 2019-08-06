Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4998D82BCE
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:40:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731916AbfHFGkY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:40:24 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:39558 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731576AbfHFGkX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:40:23 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x766dO7q002982;
        Tue, 6 Aug 2019 15:39:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x766dO7q002982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073568;
        bh=sw9gOrsRe1Xt1eVzCXiD4YS6wfm2vzRin5darkdpJ1A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Xo7yNbFFf7vTcp5uurMMAUy6l1kcnjkSAIb7IRnyaHiiyAlAcXxZ3cyxMRIfAF3IA
         RJFKw5LdIswvKCFYjwKmz9RHp15n+CtAag32hNQlL5eiKbQKP59yVdqQefLpzLnsBF
         7+WEC4FrwSP86RG8SrayMPhEWuED4gZLTGefyiXp+Blnnr6roMqkmKeufvt0/eZ5+/
         IXrQ/CPghsEJrEJoVgp3IH3wNvtsG+cHXqxylzZyT6FP1jPzUfG/dVubZ37i/9KlhW
         pHXreWssCbxLY4DZEzBl/6Mg57IBK5JdSPtXlRzBRD4m6CZ02CkgdgA+qjNtiNZZTS
         sTT+Z9Yk9Drlg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] kbuild: rename cmd_ar_builtin to cmd_ar_no_sym
Date:   Tue,  6 Aug 2019 15:39:21 +0900
Message-Id: <20190806063923.1266-4-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190806063923.1266-1-yamada.masahiro@socionext.com>
References: <20190806063923.1266-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

In the next commit, I will re-use this for thin-archives of objects
liked into modules.

Rename cmd_ar_builtin to a more generic cmd_ar_no_sym.
(cmd_ar is already defined in scripts/Makefile.lib)

I removed unneeded ifdef builtin-target.

No functional change intended.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index b0ff60ac0c42..68622cbdfda5 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -404,16 +404,14 @@ $(sort $(subdir-obj-y)): $(subdir-ym) ;
 #
 # Rule to compile a set of .o files into one .a file (without symbol table)
 #
-ifdef builtin-target
 
-quiet_cmd_ar_builtin = AR      $@
-      cmd_ar_builtin = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
+quiet_cmd_ar_no_sym = AR      $@
+      cmd_ar_no_sym = rm -f $@; $(AR) rcSTP$(KBUILD_ARFLAGS) $@ $(real-prereqs)
 
 $(builtin-target): $(real-obj-y) FORCE
-	$(call if_changed,ar_builtin)
+	$(call if_changed,ar_no_sym)
 
 targets += $(builtin-target)
-endif # builtin-target
 
 #
 # Rule to create modules.order file
-- 
2.17.1

