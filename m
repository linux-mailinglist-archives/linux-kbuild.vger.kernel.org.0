Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45302BFF2B
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Nov 2020 05:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgKWEzT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 22 Nov 2020 23:55:19 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:27300 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgKWEzT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Nov 2020 23:55:19 -0500
Received: from grover.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 0AN4sGHd016676;
        Mon, 23 Nov 2020 13:54:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 0AN4sGHd016676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606107257;
        bh=/o5wTvKOLZQLtQV9dPLOE9QXEXpoApG//zQm3uD9KRU=;
        h=From:To:Cc:Subject:Date:From;
        b=PxmMBS8tngOoTqQDbyGX9XiC/WpTr/hotBhOknWjj2HpKnns7915HCM8+lITRFnW8
         fOSXycBYwvRwTIqy0D+PjyPg1ADqNzPL5qVLPiE8GG5Hb4eY24mKbaZfUzzzJ1FqH3
         F2Pm0CbREAu3pSTGPPORPU/rvmX6CnPh1I+yoh4v/qtlp8VICn407Oq2RUjwFIq0H9
         U4tTVuQtnBgVah5ddX3RQBybmphpOPciTPt3Z+46PF9Lxi8mrQx+FX2V3IjwT59XUX
         gDKPpatCsauQEoPM1SAf2bqnCIV2PZhIIybV7UvM5/6YTp9PGl/517iBnhgnaCKxO3
         x7sgmljLQZhxQ==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] kbuild: doc: update the description about kbuild Makefiles
Date:   Mon, 23 Nov 2020 13:53:57 +0900
Message-Id: <20201123045403.63402-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
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
2.25.1

