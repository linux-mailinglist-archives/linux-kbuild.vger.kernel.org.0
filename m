Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D23B791BC5
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 06:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfHSESO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 00:18:14 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:64650 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbfHSESO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 00:18:14 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7J4I9D8008244;
        Mon, 19 Aug 2019 13:18:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7J4I9D8008244
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566188289;
        bh=e7BmF1PuMSk48M81/NeS966gLZ8vRa4OKN51C6ydmoE=;
        h=From:To:Cc:Subject:Date:From;
        b=r3htJbStvEnu8V+HNHV2buUvv/GF4cdBTqL73vG2YQS0xl6FNvGBefQhB4q0JVJSv
         fm2zZF/I76dCn0miGL5zYeVZEKXS9XSMIhZnxLgOqTxHxHuv/Vsoxo2u4i2hHwVabL
         LjdshBXK7QsW9N+XcgRwzforg0AylA7/TeFyO7XV47uPAgC1REXsXpETBxutdg3IdK
         /fHQ0/D75jRxbt3KZAV6EAD5VA7D+KPlEtivWZ4nl4lYJ7o6ugaItr+uHy7mYq9SUk
         WZ3TKhRci9yLwA/qONDrsoMv9JlmcyfX8xiN0xl1kXeir9Gwgh4yL4bkK/xV2scTEh
         uF9GFNpjWmEjQ==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] .gitignore: ignore modules.order explicitly
Date:   Mon, 19 Aug 2019 13:18:07 +0900
Message-Id: <20190819041807.11433-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The pattern '*.order' was added by commit c6025f4c8bbe ("kbuild: ignore
*.order files") to ignore modules.order files.

I do not see any other user of the '.order' extension.

Ignore 'modules.order' explicitly instead of '*.order'.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 2030c7a4d2f8..ce2c6348d372 100644
--- a/.gitignore
+++ b/.gitignore
@@ -34,7 +34,6 @@
 *.mod.c
 *.o
 *.o.*
-*.order
 *.patch
 *.s
 *.so
@@ -46,6 +45,7 @@
 *.xz
 Module.symvers
 modules.builtin
+modules.order
 
 #
 # Top-level generic files
-- 
2.17.1

