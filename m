Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 238123441A
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2019 12:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfFDKPi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Jun 2019 06:15:38 -0400
Received: from conuserg-08.nifty.com ([210.131.2.75]:39169 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbfFDKPi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Jun 2019 06:15:38 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id x54AEC78032511;
        Tue, 4 Jun 2019 19:14:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com x54AEC78032511
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559643256;
        bh=e9SJiB4wnNAkhH818NbOR4wiR7iq+acLPPc6r/sEHqM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wHBFMpviCKXyTlZK9yx9rTb6w54/CFiGPJKXwz3QNn4NZbc6VjSt4uDy4FBFy4I5d
         Ofpl6bCf61/AQZAtZjS5QtZvoIB2HxrHCZvJ58O6MpiexlY8Bkw62/v6GZN6W1oA3f
         02a9bI9qWYRoL3jrINrk6i3GmRU994yZl4W2co2a9U0aYYVlK9MNNk1xlsPdgvPDK2
         bKeuoBcMHpbm+RJ5ns27JAJHEQknqCQETn64BVurzli3sl6ogWLPTKMCu+sKNrjz37
         yg7aqlh9VDlehbbmy/6qUwbJoroYTlc0JIsU91O9gOXSv8gNVu0hNTv9SNw2KLTWGg
         ehBAHQJCJFt1Q==
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
Subject: [PATCH 02/15] kbuild: remove stale dependency between Documentation/ and headers_install
Date:   Tue,  4 Jun 2019 19:13:56 +0900
Message-Id: <20190604101409.2078-3-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190604101409.2078-1-yamada.masahiro@socionext.com>
References: <20190604101409.2078-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 8e2faea877eb ("Make Documenation depend on headers_install")
dates back to 2014, which is before Sphinx was introduced for the
kernel documentation.

Since none of DOC_TARGET requires headers_install, it is strange to
run it only for the single target "Documentation/".

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 7745bdd84861..67b866d19269 100644
--- a/Makefile
+++ b/Makefile
@@ -1745,8 +1745,7 @@ build-dir = $(patsubst %/,%,$(dir $(build-target)))
 PHONY += /
 /: ./
 
-# Make sure the latest headers are built for Documentation
-Documentation/ samples/: headers_install
+samples/: headers_install
 %/: prepare FORCE
 	$(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
 
-- 
2.17.1

