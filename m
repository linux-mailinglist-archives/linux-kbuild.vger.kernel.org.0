Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6700E77622
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jul 2019 05:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbfG0DBg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Jul 2019 23:01:36 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:53478 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726184AbfG0DBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jul 2019 23:01:36 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x6R31DYB001215;
        Sat, 27 Jul 2019 12:01:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x6R31DYB001215
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564196474;
        bh=UNyfgzuhf7SSHm0jA4hur0Fz0ys04Oa0KDkTYVtSEDc=;
        h=From:To:Cc:Subject:Date:From;
        b=WHk1dk/GTv4oJrrpZoJeX5dy1YFcWYpAJW1ulCm0lYFF8toiGwx+fPiC5jqVv834j
         4GeuXH2BvQBaV1i0Xf9HWctpmJA+ZdHnJ5sNNQ+LgVXSEZ7jomflqtnLaBrvb2BOs9
         iveJyyMnWFKSe8hrfLHQz0ifZ/OZZFFVF65J+pjzPIfNmDHCiBf4K0+oPX28iiGiNp
         Z30nvzUK84jxzruInW/odLhB3q/axhMHBRD4OnKGSk/ZBbm+KHrkeWcFCEQhHJvHCy
         8WjknL9NDZsW5qgaTrBsfWYBBbdKU3+1AwCxI+vdkjR2f1JdkYi0KZgEYZd5M55k9F
         41s8UotmvEvPA==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Tom Roeder <tmroeder@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gen_compile_commands: lower the entry count threshold
Date:   Sat, 27 Jul 2019 12:01:10 +0900
Message-Id: <20190727030110.17208-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Running gen_compile_commands.py after building with allnoconfig
gave this:

$ ./scripts/gen_compile_commands.py
WARNING: Found 449 entries. Have you compiled the kernel?

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/gen_compile_commands.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/gen_compile_commands.py b/scripts/gen_compile_commands.py
index 7915823b92a5..c458696ef3a7 100755
--- a/scripts/gen_compile_commands.py
+++ b/scripts/gen_compile_commands.py
@@ -21,9 +21,9 @@ _LINE_PATTERN = r'^cmd_[^ ]*\.o := (.* )([^ ]*\.c)$'
 _VALID_LOG_LEVELS = ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']
 
 # A kernel build generally has over 2000 entries in its compile_commands.json
-# database. If this code finds 500 or fewer, then warn the user that they might
+# database. If this code finds 300 or fewer, then warn the user that they might
 # not have all the .cmd files, and they might need to compile the kernel.
-_LOW_COUNT_THRESHOLD = 500
+_LOW_COUNT_THRESHOLD = 300
 
 
 def parse_arguments():
-- 
2.17.1

