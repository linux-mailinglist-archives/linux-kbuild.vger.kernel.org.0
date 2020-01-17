Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82EF9140FB3
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 18:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgAQRQG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 12:16:06 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:20894 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRQG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 12:16:06 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 00HHFttT008842;
        Sat, 18 Jan 2020 02:15:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 00HHFttT008842
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579281356;
        bh=o7UmDXEbY6/lJKfSeZ85C9oBWx5szmcnLgIbcjg4jwE=;
        h=From:To:Cc:Subject:Date:From;
        b=pfbXG7yDEesfxclBm+SA9LWzBKBD+to/PSmABzTePJweZBrag8DVKtOWGj8K2Y5+Y
         yN1Uhn12/DOL4eDui1eI58L6kh8rTZQG8iHm338amnjhHMgFsxYbbbKCnMmWvXdRtr
         ofbRT7vs6t6Wsn/KllB7DNe95UDVr+eh/OwN5lDFtbDwXWqzyLS8vaJ0QYogNEZyrn
         zBOmHl3n2IJxnrg5BPBbxb9tRu8vjK6zghs8jCnVbfVWIchwA6ZlLKO8SJ3/qE1oqA
         z/stZDJTGH7D8svrU/7k3MhBtf3r91KAWAJKoOET2itp1GGE45nMc9cvfbn3YY8nq8
         5oU954z9pb34A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: use -S instead of -E for precise cc-option test in Kconfig
Date:   Sat, 18 Jan 2020 02:14:35 +0900
Message-Id: <20200117171435.11591-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Currently, -E (stop after the preprocessing stage) is used to check
whether the given compiler flag is supported.

While it is faster than -S (or -c), it can be false-positive. You need
to run the compilation proper to check the flag more precisely.

For example, when testing "--param asan-instrument-allocas=1", my gcc
gives a different result for -E vs -S.

$ gcc -Werror --param asan-instrument-allocas=1 -E -x c /dev/null -o /dev/null
$ echo $?
0

$ gcc -Werror --param asan-instrument-allocas=1 -S -x c /dev/null -o /dev/null
cc1: error: invalid --param name ‘asan-instrument-allocas’; did you mean ‘asan-instrument-writes’?
$ echo $?
1

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kconfig.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index d4adfbe42690..bfb44b265a94 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /dev/null)
+cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /dev/null)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
-- 
2.17.1

