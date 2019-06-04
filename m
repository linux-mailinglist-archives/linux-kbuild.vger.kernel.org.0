Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53F7C34436
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfFDKQV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:16:21 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39165 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727061AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7G032511;
        Tue, 4 Jun 2019 19:14:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7G032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643263;
        bh=VGjPFxsP6kBrwBDYVWYAlv4U8kztKdxrIjkfmrPtJXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mPNAsiSfLq57iHEV9xRwWBflUZfrT8ykBp+GDWZIAjQVsJRkpidrYn5NkG9tdx0QX
         Z4wnRAsDdssWbfEuF/grcOod8QKRBuz5qp1MRl7V8lCPEHVjH0BEs56PXqBZutxt5e
         66MwUD6gQ2OAu5/QtgktevdXDj9X4ST08oq01DRS3BK5Uqyv01nWs5TZQZJyahCJQb
         0S0lRIy9WXxWAiPFrpoLLjQYe4L5LJOnXmbdbrwESnQQLXqqCx7keYmlD/Hx9UCqoL
         2S3L71IWhirlHqf21BD7bSeBFGx/i+0MNV5ytyZJkEEdhnVzQW4tJQ2TG34DraNtat
         m8IRGhxixPBmQ==
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
Subject: [PATCH 10/15] kbuild: move hdr-inst shorthand to top Makefile
Date:   Tue,  4 Jun 2019 19:14:04 +0900
Message-Id: <20190604101409.2078-11-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Now that hdr-inst is used only in the top Makefile, move it there
from scripts/Kbuild.include.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile               | 2 ++
 scripts/Kbuild.include | 6 ------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 608af32cc758..48bac02fb72d 100644
--- a/Makefile
+++ b/Makefile
@@ -1190,6 +1190,8 @@ headers_install: headers
 
 PHONY += archheaders archscripts
 
+hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
+
 PHONY += headers
 headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 	$(if $(wildcard $(srctree)/arch/$(SRCARCH)/include/uapi/asm/Kbuild),, \
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index f12e81eeb89b..9ae4493d5bcd 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -180,12 +180,6 @@ dtbinst := -f $(srctree)/scripts/Makefile.dtbinst obj
 # $(Q)$(MAKE) $(clean)=dir
 clean := -f $(srctree)/scripts/Makefile.clean obj
 
-###
-# Shorthand for $(Q)$(MAKE) -f scripts/Makefile.headersinst obj=
-# Usage:
-# $(Q)$(MAKE) $(hdr-inst)=dir
-hdr-inst := -f $(srctree)/scripts/Makefile.headersinst obj
-
 # echo command.
 # Short version is used, if $(quiet) equals `quiet_', otherwise full one.
 echo-cmd = $(if $($(quiet)cmd_$(1)),\
-- 
2.17.1

