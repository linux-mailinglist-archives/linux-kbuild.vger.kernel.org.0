Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19213B9CD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Sep 2019 09:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437647AbfIUHGJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Sep 2019 03:06:09 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:47051 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437304AbfIUHGJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Sep 2019 03:06:09 -0400
Received: from grover.flets-west.jp (softbank126021098169.bbtec.net [126.21.98.169]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x8L75kWr014505;
        Sat, 21 Sep 2019 16:05:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x8L75kWr014505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1569049547;
        bh=dja71nn69Zhyku0IB7solLpqPi2RIkLVwmV+E9HAVSo=;
        h=From:To:Cc:Subject:Date:From;
        b=hrZv02tV4Ui5XJplTx4XUwlnj2ZjGXePPItpdxb4zSCTUSZTxuQv3J8O5PwONHp03
         ynQlWWMrge71kBlBjzssDpIBkqKAbY+vp/c2nAurnirb4bg8Iwkz4PvM1goMaqVh+C
         vhs0iXLVgKDqz4MOlqdHBh5/BzkVWlTHjIf0g6W3jHrHdUw6SMHmkgiMJduXvbxyVd
         m3scMZl2oXUFpAMrS3z2u6VhUAKbAifEXQiLnxAG4joHOIvnm69wdouKYlQlGPgct8
         TxdcYLY9XMAMuoCjWzHAlSn9szETtBjEmEaVGmYN/yRoRljqV373E3jGCqMeWO8rdZ
         UJwXYTJSpab3w==
X-Nifty-SrcIP: [126.21.98.169]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove SUBDIRS support
Date:   Sat, 21 Sep 2019 16:05:41 +0900
Message-Id: <20190921070542.12868-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linux 5.3 was released. Remove the SUBDIRS support.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/Makefile b/Makefile
index 88b180b2cb64..6206cd358411 100644
--- a/Makefile
+++ b/Makefile
@@ -206,24 +206,8 @@ ifndef KBUILD_CHECKSRC
   KBUILD_CHECKSRC = 0
 endif
 
-# Use make M=dir to specify directory of external module to build
-# Old syntax make ... SUBDIRS=$PWD is still supported
-# Setting the environment variable KBUILD_EXTMOD take precedence
-ifdef SUBDIRS
-  $(warning ================= WARNING ================)
-  $(warning 'SUBDIRS' will be removed after Linux 5.3)
-  $(warning )
-  $(warning If you are building an individual subdirectory)
-  $(warning in the kernel tree, you can do like this:)
-  $(warning $$ make path/to/dir/you/want/to/build/)
-  $(warning (Do not forget the trailing slash))
-  $(warning )
-  $(warning If you are building an external module,)
-  $(warning Please use 'M=' or 'KBUILD_EXTMOD' instead)
-  $(warning ==========================================)
-  KBUILD_EXTMOD ?= $(SUBDIRS)
-endif
-
+# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
+# directory of external module to build. Setting M= takes precedence.
 ifeq ("$(origin M)", "command line")
   KBUILD_EXTMOD := $(M)
 endif
-- 
2.17.1

