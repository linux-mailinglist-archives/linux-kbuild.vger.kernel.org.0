Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D355F2C7077
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 19:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729604AbgK1R7h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 12:59:37 -0500
Received: from condef-05.nifty.com ([202.248.20.70]:56476 "EHLO
        condef-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728737AbgK1R5Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:57:24 -0500
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-05.nifty.com with ESMTP id 0ASBqO0J018974;
        Sat, 28 Nov 2020 20:52:24 +0900
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 0ASBpD6A027804;
        Sat, 28 Nov 2020 20:51:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 0ASBpD6A027804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606564274;
        bh=Oe2ZFAifC7/qdzprizr4QT5l0mFUMCDjLUG0sLhHkhg=;
        h=From:To:Cc:Subject:Date:From;
        b=o/Sv0ww+iUid2SRO1Ut0r/Qraf8ys4jUb01lSJPxzQdd34OGGcSSDvc41ecS13u65
         ftzx9V71JNYBIMe6xW8hXNZLuQVrI5Yzk6ieDq59ULTkLZDCH0PpPfLOwUUYJqLCwQ
         A/fMn7R3hyRWzZWCeLmVOVLMQzYXrJrRO9ji0XBrRjamphfn5M7dbgvRGpgoBSzwXV
         Vg6/0sZbSpSZkEWGxYt2ArS7oKd92YFcpU6A4Z1Q26EkPTwOsdCmquNFby3ez+iEHo
         jBmWyreIHKSiXi2B8+oq2mp7HqwQXu+xMnf0FUjjKXVegC/FORiU4lgb201aO7gVwP
         7UyPswJKyvQJQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] kbuild: doc: update the description about kbuild Makefiles
Date:   Sat, 28 Nov 2020 20:51:02 +0900
Message-Id: <20201128115108.179256-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This line was written in 2003. Now we have much more Makefiles.

The number of Makefiles is not important. The point is we have a
Makefile in (almost) every directory.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 Documentation/kbuild/makefiles.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 0d5dd5413af0..a7b874097a91 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -71,7 +71,7 @@ The Makefiles have five parts::
 	.config			the kernel configuration file.
 	arch/$(ARCH)/Makefile	the arch Makefile.
 	scripts/Makefile.*	common rules etc. for all kbuild Makefiles.
-	kbuild Makefiles	there are about 500 of these.
+	kbuild Makefiles	exist in every subdirectory
 
 The top Makefile reads the .config file, which comes from the kernel
 configuration process.
-- 
2.27.0

