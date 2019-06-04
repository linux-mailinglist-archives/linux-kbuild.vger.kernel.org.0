Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3804C34422
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:17:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfFDKPn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:43 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39318 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbfFDKPn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:43 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC7A032511;
        Tue, 4 Jun 2019 19:14:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC7A032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643258;
        bh=UUUjFRogbBACivTlFc6RgzhbVkPaCnIYQJXNtS0Cn2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pHvc2lxavg4I4Q3qoMUzW+SXQ01lTpJbEksIGn94RMsh+7NKYUWzu/3ELUBMZdrWx
         4u0ldaTSyoez+pXhB7SzlMB5Hig069bPACKP76bGaeiVEyVIdsdt3o4KXykw7R+sMK
         KhtNOE1cED0YSHV/Xc+YMKFHPpJXe0un5tB9tC8xaHA+qCuzqqtbMhrlJhAvugkBoG
         vMM+sYS6IuYgadmgW1lKC8HBXgUGlaDEufXu8Urh4mb3OGmSr/eu4hrNOeyKrD4VaS
         MmA2sW32rC+eKVvBg5mQiYSN1cFEuSiXgA9Av/r5mKniEfMn7flHVowjSuZsNd1sr0
         Ew8hewIOFKrUw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Howells <dhowells@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Jani Nikula <jani.nikula@intel.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 04/15] kbuild: fix Kconfig prompt of CONFIG_HEADERS_CHECK
Date:   Tue,  4 Jun 2019 19:13:58 +0900
Message-Id: <20190604101409.2078-5-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Prior to commit 257edce66d31 ("kbuild: exploit parallel building for
CONFIG_HEADERS_CHECK"), the sanity check of exported headers was done
as a side-effect of build rule of vmlinux.

That commit is good, but I missed to update the prompt of the Kconfig
entry. For the sake of preciseness, lets' say "when building 'all'".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 lib/Kconfig.debug | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cbdfae379896..7cdcb962358c 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -306,11 +306,11 @@ config DEBUG_FS
 	  If unsure, say N.
 
 config HEADERS_CHECK
-	bool "Run 'make headers_check' when building vmlinux"
+	bool "Run sanity checks on uapi headers when building 'all'"
 	depends on !UML
 	help
-	  This option will extract the user-visible kernel headers whenever
-	  building the kernel, and will run basic sanity checks on them to
+	  This option will extract the user-visible kernel headers when
+	  building the 'all' target, and will run basic sanity checks on them to
 	  ensure that exported files do not attempt to include files which
 	  were not exported, etc.
 
-- 
2.17.1

