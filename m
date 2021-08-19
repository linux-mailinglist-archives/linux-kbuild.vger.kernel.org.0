Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBD93F0FBA
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 02:58:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235055AbhHSA7V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 20:59:21 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:60437 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234866AbhHSA7S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 20:59:18 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 17J0vl4n017219;
        Thu, 19 Aug 2021 09:57:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 17J0vl4n017219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629334670;
        bh=gaqwRy+nMDx+G9AJw0KH7WOLfyzuERLberPC9n6U4x4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=StzZXVCDTkKp4tp+dPnbRMWYf6lqRT4P9RXft+VXXt3XVuy+WanY2egGU7bmQhoKK
         EswhCqtNaovuG2zWv5rYBLRdjH3uAjRVjpQgCVmDMTUZNB7V3RwKpYqV70hyZfioUR
         ufwgHx/0UNbh6SZSsj5ZighhHHutrlbzMUqfJhxJYPa72PUQUPyF8Hg9Ag6sLzLlJl
         P7AxFwsmZYbGU+HmG65gvp0J9csWm8jD9RHjYIPuzevlZAurPXot8A6f20J0ysg2+2
         rYa69dJOTIgnQz3uyWPj+tM8DLlLb6GdGvrp2biaM05OWmjr6imNkA/t4cmgUzz+bK
         yLDTamJXwAzsw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH 04/13] kbuild: remove unused quiet_cmd_update_lto_symversions
Date:   Thu, 19 Aug 2021 09:57:35 +0900
Message-Id: <20210819005744.644908-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210819005744.644908-1-masahiroy@kernel.org>
References: <20210819005744.644908-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is not used anywhere.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Makefile.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 3e4cd1439cd4..279363266455 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -411,7 +411,6 @@ $(subdir-builtin): $(obj)/%/built-in.a: $(obj)/% ;
 $(subdir-modorder): $(obj)/%/modules.order: $(obj)/% ;
 
 # combine symversions for later processing
-quiet_cmd_update_lto_symversions = SYMVER  $@
 ifeq ($(CONFIG_LTO_CLANG) $(CONFIG_MODVERSIONS),y y)
       cmd_update_lto_symversions =					\
 	rm -f $@.symversions						\
-- 
2.30.2

