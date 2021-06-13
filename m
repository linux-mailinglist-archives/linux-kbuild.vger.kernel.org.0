Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52DE3A58A5
	for <lists+linux-kbuild@lfdr.de>; Sun, 13 Jun 2021 15:08:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231733AbhFMNKC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 13 Jun 2021 09:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFMNKB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 13 Jun 2021 09:10:01 -0400
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [IPv6:2001:67c:2050::465:101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9423DC061574;
        Sun, 13 Jun 2021 06:08:00 -0700 (PDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4G2vyN3cWPzQjld;
        Sun, 13 Jun 2021 15:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-language:content-type
        :content-type:mime-version:date:date:message-id:subject:subject
        :from:from:received; s=mail20150812; t=1623589670; bh=ccqv7qyiWt
        qLYecevOiYfROlLLhMW52pT4dZGTqxQMg=; b=cJzY7je4w8vasuaqbe2Y9MgUk5
        PgNbSt2BgT+c6Ze+K6ae/KESUbrVnlwkAfPmvX64BVarDFpoiBd33JzsN/phC2bl
        XrZyiykJ64I+9+Uc9TOK5diUOUZmbCDM/IZS6BJOtkcaokuKVeB7WzvEnwAj3jKV
        +sXcBB1597aOE/X6fp8FJSSptHUYVkIsIOMVXS1PX8R8rh18g2HqHqLqvD1i1kzZ
        cBuDzLlVBz1f9XhO8o3HLf9W/KXhkISMtzcBhp2lDyCAJ/UXC5KADKv8Bpb8pIxS
        A5GHn/nzer4/3sfa97LnH/o4YanI7z9azprkZRorQEmDI/cDFJu2r1kRpgQQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1623589674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=5ePQnm+3HJZeWjTq3ey819ji536NrzATHln8V3feSI8=;
        b=fa4jZnl35wmVZqArRoo471/QIc1kwcSJG2VHe3f91Q1OCngaQuG29yByPhnQBSarcoPTQl
        VqFDQzlRfWo7gDyaoPHA0UozpVy9Jb8NVpHftrFjxJ03CFSJfSrnan0Lc7a+S+tZ8r8X12
        1oY7wlexwbgwaj40SWuXjV0Q7GyRojdQ1I6YWlo/hBBc5hrFjLr3xXlKH9ijPLyaCahz1B
        goHLvY6JlBmnQv+rLXcRuQ7CVBV1e83rjZKG2DGX+M11eJRgICQPKa/HneDyevYy7+DQN9
        ENafRtFPmcb+S7CrmCP6uqRJ5+Ydx0nUF2kmxEUmaMQiaUxfzioaSZu//AIyhQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
        by spamfilter04.heinlein-hosting.de (spamfilter04.heinlein-hosting.de [80.241.56.122]) (amavisd-new, port 10030)
        with ESMTP id vnV9vcHeMag1; Sun, 13 Jun 2021 15:07:50 +0200 (CEST)
From:   Tor Vic <torvic9@mailbox.org>
Subject: [PATCH 1/1] Makefile: Pass -warn-stack-size only on LLD < 13.0.0
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, Nathan Chancellor <nathan@kernel.org>,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        keescook@chromium.org
Cc:     "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>, linux-kbuild@vger.kernel.org
Message-ID: <7631bab7-a8ab-f884-ab54-f4198976125c@mailbox.org>
Date:   Sun, 13 Jun 2021 13:07:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-MBO-SPAM-Probability: 
X-Rspamd-Score: -1.31 / 15.00 / 15.00
X-Rspamd-Queue-Id: 3E50C1890
X-Rspamd-UID: d27c46
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since LLVM commit fc018eb, the '-warn-stack-size' flag has been dropped
[1], leading to the following error message when building with Clang-13
and LLD-13:

    ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument
    '-warn-stack-size=2048'.  Try: 'ld.lld --help'
    ld.lld: Did you mean '--asan-stack=2048'?

In the same way as with commit 2398ce80152a ("x86, lto: Pass
-stack-alignment only on LLD < 13.0.0") , make '-warn-stack-size'
conditional on LLD < 13.0.0.

[1] https://reviews.llvm.org/D103928

Fixes: 24845dcb170e ("Makefile: LTO: have linker check -Wframe-larger-than")
Cc: stable@vger.kernel.org
Link: https://github.com/ClangBuiltLinux/linux/issues/1377
Signed-off-by: Tor Vic <torvic9@mailbox.org>
---
 Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 144d4f8b7eb3..51a1b6b2c2ab 100644
--- a/Makefile
+++ b/Makefile
@@ -929,11 +929,14 @@ CC_FLAGS_LTO	+= -fvisibility=hidden
 # Limit inlining across translation units to reduce binary size
 KBUILD_LDFLAGS += -mllvm -import-instr-limit=5

-# Check for frame size exceeding threshold during prolog/epilog insertion.
+# Check for frame size exceeding threshold during prolog/epilog insertion
+# when using lld < 13.0.0.
 ifneq ($(CONFIG_FRAME_WARN),0)
+ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
 KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
 endif
 endif
+endif

 ifdef CONFIG_LTO
 KBUILD_CFLAGS	+= -fno-lto $(CC_FLAGS_LTO)
-- 
2.32.0
