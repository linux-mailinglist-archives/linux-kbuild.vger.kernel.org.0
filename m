Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 436E634427
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:17:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbfFDKPt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:49 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39349 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727110AbfFDKPo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:44 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7D032511;
        Tue, 4 Jun 2019 19:14:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7D032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643261;
        bh=H2hb1rFxVd8vHXaptRM3sOd643GclddrQKolqKpXINY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u4rG5ouSgpTeBTdm1t8he1y5hpf62Q1dbSEmqMuyECjosHT0jnx102AWpORD7ktc9
         urK7tk8gFJFGuQRa1lWxU4znmjdssG3HWp+B66VehHKcBZa/TahSvw5lJjuJRDNkgQ
         0t2pZqguJaCBVXQts45mQ91bR94+TjUM76Wrhnv18O4wY1pWuRImUZg+VorPG0NSY3
         wOMAFxmuakQ1z8+7ycZ/0VysAedtHWvqePToWSJC4GXsRy3lo5HKAEfjt9ppze29Xq
         V+p9ElP1a1KzhFKRlPe5SunFHy/HaV++RPHHz8ihxgMltj5cD5q8TIwacSKGEVRjZf
         cARg5XJjpS8dQ==
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
Subject: [PATCH 07/15] kbuild: build all prerequisite of headers_install simultaneously
Date:   Tue,  4 Jun 2019 19:14:01 +0900
Message-Id: <20190604101409.2078-8-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, scripts/unifdef is compiled after scripts_basic,
uapi-asm-generic, archheaders, and archscripts.

The proper dependency is just scripts_basic. There is no problem
to compile scripts/unifdef and other headers at the same time.

Split scripts_unifdef out in order to allow more parallel building.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index e998c40c94b4..f9c206eb3583 100644
--- a/Makefile
+++ b/Makefile
@@ -1181,8 +1181,7 @@ export INSTALL_HDR_PATH = $(objtree)/usr
 PHONY += archheaders archscripts
 
 PHONY += __headers
-__headers: $(version_h) scripts_basic uapi-asm-generic archheaders archscripts
-	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
+__headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
 
 PHONY += headers_install
 headers_install: __headers
@@ -1204,6 +1203,10 @@ ifdef CONFIG_HEADERS_CHECK
 all: headers_check
 endif
 
+PHONY += scripts_unifdef
+scripts_unifdef: scripts_basic
+	$(Q)$(MAKE) $(build)=scripts scripts/unifdef
+
 # ---------------------------------------------------------------------------
 # Kernel selftest
 
-- 
2.17.1

