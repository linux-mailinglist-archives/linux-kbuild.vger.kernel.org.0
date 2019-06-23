Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F32E94FCA1
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Jun 2019 18:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbfFWQNi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 Jun 2019 12:13:38 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:23058 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726647AbfFWQNi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 Jun 2019 12:13:38 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id x5NGDU0w024279;
        Mon, 24 Jun 2019 01:13:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com x5NGDU0w024279
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561306410;
        bh=jqiQ1y5oNfRR0g7lME/nEDNqOJEW6bjlbalGJ20HGQ0=;
        h=From:To:Cc:Subject:Date:From;
        b=xDxG0siw4cbp7po2wAgeT49KgFRCeqsPlrhZEwuZggbYGoHPmGabUijA79H8aOPgE
         043ZeuEXYhloNDl93C987jGila8l9k6Y/w8ggnmssC4Bi84UxraxZcDh3fE+dD9Sqc
         3gMDLiFYOK7Go3ya81r/l+RVnLl614U3qJI0IdHweL8YBZ0WY6mgyKwjGEM0fK0L9i
         T+kBWj4+seEbUFVV7O8kBFQ6/2B1yknD4ywlPF1PVT4OJ5Q0z6BE/XcwPEtSl6Y+9Y
         GplBE7YI11RrvZollgtMH3zvUysZa23pN6m++1tg+gNrJ90BOOB9Z0srA1pN6yea+F
         Wf5HvEaiFhrZg==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] kbuild: fix missed rebuild of modules.builtin
Date:   Mon, 24 Jun 2019 01:13:27 +0900
Message-Id: <20190623161328.22461-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Unlike modules.order, modules.builtin is not rebuilt every time.
Once modules.builtin is created, it will not be updated until
auto.conf or tristate.conf is changed.

So, it misses to notice a change in Makefile, for example, renaming
of modules.

Kbuild must always descend into directories for modules.builtin too.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index 9514dac2660a..19c33bc69bb1 100644
--- a/Makefile
+++ b/Makefile
@@ -1289,12 +1289,16 @@ modules: $(vmlinux-dirs) $(if $(KBUILD_BUILTIN),vmlinux) modules.builtin
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/modules-check.sh
 
-modules.builtin: $(vmlinux-dirs:%=%/modules.builtin)
-	$(Q)$(AWK) '!x[$$0]++' $^ > $(objtree)/modules.builtin
+modbuiltin-dirs := $(addprefix _modbuiltin_, $(vmlinux-dirs))
 
-%/modules.builtin: include/config/auto.conf include/config/tristate.conf
-	$(Q)$(MAKE) $(modbuiltin)=$*
+modules.builtin: $(modbuiltin-dirs)
+	$(Q)$(AWK) '!x[$$0]++' $(addsuffix /$@, $(vmlinux-dirs)) > $@
 
+PHONY += $(modbuiltin-dirs)
+# tristate.conf is not included from this Makefile. Add it as a prerequisite
+# here to make it self-healing in case somebody accidentally removes it.
+$(modbuiltin-dirs): include/config/tristate.conf
+	$(Q)$(MAKE) $(modbuiltin)=$(patsubst _modbuiltin_%,%,$@)
 
 # Target to prepare building external modules
 PHONY += modules_prepare
-- 
2.17.1

