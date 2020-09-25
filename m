Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D41B278C6A
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Sep 2020 17:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729003AbgIYPVb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 25 Sep 2020 11:21:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728750AbgIYPVa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 25 Sep 2020 11:21:30 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E43CC0613CE;
        Fri, 25 Sep 2020 08:21:30 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 7so2841997pgm.11;
        Fri, 25 Sep 2020 08:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HfdKNxFN//fHQRteZ3ano4yEULisk9Ub6ql9G5B3xNA=;
        b=oxe8hyB3SWoORMJx2Fg35b7spl30TjSgnbPZjGJVk6sS6rhFD96ISWOevGjmuBDi4N
         DhzBdjFTeeK67b7waaPtxuVSbKdGK8HdpJOFCGyynvcNzRYBPNca4DN4/QsM7ooGZrcd
         WsP/Ajt4zhN+5EwGmgbbP9cP5gG7CD7lmEy26yf4q6X7px4QGiODop3OJfN3oH3nMg0L
         G/jwVvERTuCU8LKLqUatu0st4i/C6Vurd/9+ofCYqTd8TEs4wF0SE/YXQFYjrcdhPbmA
         wWIhrFBSL2rrJeGLzJeZtp/DPD5aWDotB4wQEOlGucBFRp/ogUnRhAFcsBIfZW7BM7tH
         DVaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HfdKNxFN//fHQRteZ3ano4yEULisk9Ub6ql9G5B3xNA=;
        b=IaatSI7Tr13aXBMMkox3D5r+C/U9tgt/vhJcH223OsoeUIZe4UIaGaRokTwtbc+ZEe
         B2n1K5ngXfOrB/7WXqdGxDbmU8Pgw0qu/QsHGjnWcIrzKL9hq1PWsZDbMM/9fLbc773S
         kZ7z3qHZprbccIp1MvbUGBAEOxdSUIZGm24lePNvfjR0JuMHUEykeF3V0rNyMaYQW+3E
         L+zteHdufkjbEVeS5ZFRBQXILxZka+++7G5QelFQC3lW8WlWiocp1qXjA/hyopXVV3Da
         0f1BdxF5yPF2COsdFT7NDUdlulbcfQgJAgplkhJV/dsMRzEGPTnyyUgDcsY+f+bsLpZI
         JkWQ==
X-Gm-Message-State: AOAM5313HbWbVE6X3LNXalQM0utqxf1/qshGOwK1kdg179j4dO0B7UXC
        tVvXiq9G4qo86j44mTh2DD2PqXOO1JFi8g==
X-Google-Smtp-Source: ABdhPJx3SX4VU6qPahtPnpvBQkwftTxqRgX/Y/NQGT9VlhrynmpafqUBKJ6pXMXIuzy3KtKBOY9G1Q==
X-Received: by 2002:a17:902:9698:b029:d1:9492:745b with SMTP id n24-20020a1709029698b02900d19492745bmr5152587plp.26.1601047289728;
        Fri, 25 Sep 2020 08:21:29 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
        by smtp.gmail.com with ESMTPSA id gf12sm2323324pjb.16.2020.09.25.08.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 08:21:28 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        clang-built-linux@googlegroups.com (open list:CLANG/LLVM BUILD SUPPORT),
        linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Subject: [PATCH] Documentation/llvm: Fix clang target examples
Date:   Fri, 25 Sep 2020 08:21:14 -0700
Message-Id: <20200925152121.20527-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

clang --target=<triple> is how we can specify a particular toolchain
triple to be use, fix the two occurences in the documentation.

Fixes: fcf1b6a35c16 ("Documentation/llvm: add documentation on building w/ Clang/LLVM")
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 Documentation/kbuild/llvm.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
index 334df758dce3..dae90c21aed3 100644
--- a/Documentation/kbuild/llvm.rst
+++ b/Documentation/kbuild/llvm.rst
@@ -39,10 +39,10 @@ which can help simplify cross compiling. ::
 	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
 
 ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
-``CROSS_COMPILE`` is used to set a command line flag: ``--target <triple>``. For
+``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
 example: ::
 
-	clang --target aarch64-linux-gnu foo.c
+	clang --target=aarch64-linux-gnu foo.c
 
 LLVM Utilities
 --------------
-- 
2.25.1

