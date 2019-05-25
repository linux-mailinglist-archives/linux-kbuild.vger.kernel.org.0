Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4352A43A
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 May 2019 13:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfEYLtk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 May 2019 07:49:40 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19685 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbfEYLtk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 May 2019 07:49:40 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x4PBnLmr006832;
        Sat, 25 May 2019 20:49:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x4PBnLmr006832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558784962;
        bh=GcQ0/FUcETTNQeH6qzQKxM8A8Qu2qmHKXiYNQ7p/tn0=;
        h=From:To:Cc:Subject:Date:From;
        b=CdYjXNohyx7syAc6Z486jL4ktqGmdHFwPBG20R/Sk6klfweBdmLxmZOwLjGGiW56y
         /3Q7Hiz3cdDUnBlyGx+kOeW1e3jtr8fTfsD9YamQNastvfc0efpTvmxWsfIs/Z/fzT
         uwF8NRs0sCOUnceAYciwtwLAG3kPu/ciwqHRS6AfuDxg8j9/cifs9EkO7EJm2b/vx8
         DwyUf8XNjhMp8CQj9rkmio7asncHBE3f4wg+ZflbXiFgDUm8AtpubgqAC0RaCyAh8j
         0jMB8m4iqLHfKTnCj0rXdBh0D3PyJTrjs6W5iw0UFb6lrzvM31lOk0Ru5SciX0AIzR
         6u6F1ILeUp/vw==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: tests: fix recursive inclusion unit test
Date:   Sat, 25 May 2019 20:49:19 +0900
Message-Id: <20190525114919.26188-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding SPDX license identifier is pretty safe; however, here is one
exception.

Since commit ec8f24b7faaf ("treewide: Add SPDX license identifier -
Makefile/Kconfig"), "make testconfig" would not pass.

When Kconfig detects a circular file inclusion, it displays error
messages with a file name and a line number prefixed to each line.

The unit test checks if Kconfig emits the error messages correctly
(this also checks the line number correctness).

Now that the test input has the SPDX license identifier at the very top,
the line numbers in the expected stderr should be incremented by 1.

Fixes: ec8f24b7faaf ("treewide: Add SPDX license identifier - Makefile/Kconfig")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/tests/err_recursive_inc/expected_stderr | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/tests/err_recursive_inc/expected_stderr b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
index 6b582eee2176..b070a31fdfeb 100644
--- a/scripts/kconfig/tests/err_recursive_inc/expected_stderr
+++ b/scripts/kconfig/tests/err_recursive_inc/expected_stderr
@@ -1,6 +1,6 @@
 Recursive inclusion detected.
 Inclusion path:
   current file : Kconfig.inc1
-  included from: Kconfig.inc3:1
-  included from: Kconfig.inc2:3
-  included from: Kconfig.inc1:4
+  included from: Kconfig.inc3:2
+  included from: Kconfig.inc2:4
+  included from: Kconfig.inc1:5
-- 
2.17.1

