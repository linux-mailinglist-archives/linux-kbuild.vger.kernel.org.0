Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41D2188C0E
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfHJPzG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:55:06 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34502 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfHJPyn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:43 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG94009713;
        Sun, 11 Aug 2019 00:53:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG94009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452405;
        bh=3uihMbIv8Nur7ulPukTwG5sn3YtGF2A6GIOehwU06DM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g5RJmpthjrYY+ky7lYOx1qHnu5iZqFYdq8HYzF1KXWIrkPurQDacurfHc4bcYuzx9
         EnN7Yo/U2d0lwRIbhM43uLI/KY5WXfco3rB2D2CUng+D3Y8T79Vkewd2JmSHk1xva9
         cqyND8OD1R8eFpskfxH/6buVX9BI2UAH37pIpB61O/noYv6KBg0QcDTX2NMkHfple5
         P0bdFsuHqBTww/xxL7bQIG/WV9oJc66A/x8Y/PnP1bwQ+z/+ZD6eyiSODOH0Z6bE3G
         kNAR4jNoi/YVL9MJ2FfP33qibLLlxjNGqQG4o0N8wXLJc6gZikqYJQQeeg8+/sAbJd
         5FWCl/e4gJ41A==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] kbuild: unify clean-dirs rule for in-kernel and external module
Date:   Sun, 11 Aug 2019 00:53:05 +0900
Message-Id: <20190810155307.29322-10-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Factor out the duplicated code for in-kernel and external module
cleaning.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index e60c09d57b30..871c42e241a6 100644
--- a/Makefile
+++ b/Makefile
@@ -1017,6 +1017,7 @@ vmlinux-alldirs	:= $(sort $(vmlinux-dirs) Documentation \
 			$(drivers-) $(net-) $(libs-) $(virt-))))
 
 build-dirs	:= $(vmlinux-dirs)
+clean-dirs	:= $(vmlinux-alldirs)
 
 init-y		:= $(patsubst %/, %/built-in.a, $(init-y))
 core-y		:= $(patsubst %/, %/built-in.a, $(core-y))
@@ -1388,11 +1389,8 @@ DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
-clean-dirs      := $(addprefix _clean_, $(vmlinux-alldirs))
 
-PHONY += $(clean-dirs) clean archclean vmlinuxclean
-$(clean-dirs):
-	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
+PHONY += archclean vmlinuxclean
 
 vmlinuxclean:
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/link-vmlinux.sh clean
@@ -1629,12 +1627,7 @@ PHONY += _emodinst_post
 _emodinst_post: _emodinst_
 	$(call cmd,depmod)
 
-clean-dirs := $(addprefix _clean_,$(KBUILD_EXTMOD))
-
-PHONY += $(clean-dirs) clean
-$(clean-dirs):
-	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
-
+clean-dirs := $(KBUILD_EXTMOD)
 clean: rm-files := $(KBUILD_EXTMOD)/Module.symvers
 
 PHONY += /
@@ -1664,6 +1657,11 @@ descend: $(build-dirs)
 $(build-dirs): prepare
 	$(Q)$(MAKE) $(build)=$@ need-builtin=1 need-modorder=1
 
+clean-dirs := $(addprefix _clean_, $(clean-dirs))
+PHONY += $(clean-dirs) clean
+$(clean-dirs):
+	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)
+
 clean: $(clean-dirs)
 	$(call cmd,rmdirs)
 	$(call cmd,rmfiles)
-- 
2.17.1

