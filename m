Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4760F226E0F
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jul 2020 20:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728962AbgGTSMr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jul 2020 14:12:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728448AbgGTSMq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jul 2020 14:12:46 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955F6C0619D2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 11:12:46 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 8so22318479ybc.23
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Jul 2020 11:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=foQP01o+jLLxWyYMddt7wMxz9LiizEHjChmq39E8dvQ=;
        b=ks6dk1mRoPvv5K/RguqHzZXRvpQzZ8Sma0KZPaH2f9dcYupIWG8cBMxwDl+AR4xhaV
         CH1dhBt+6QvtqFvJImE7/TQy6QanJ3RuMki6d2XjchxX6NLmodxKd/KU4im88YsqeISB
         0PdFNGrai/DE1DxfYYhfhT+51rxO3HwD7yttKR78i/mA3LXJAncVIiTIkjq0TKeK7F2b
         sHfctGLF7Zvzut+ZSeq6cb4vKRBUUEW2YtnYgEgH5jCsx4+dhdKZHZk4cn03GDcAWKAt
         Wmc6voUlwuxFz/qni4DIekfBhxrgjZWS+g8WjfJWc6pKMq891yKv8oGa2AbFZd79eTpv
         o/EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=foQP01o+jLLxWyYMddt7wMxz9LiizEHjChmq39E8dvQ=;
        b=U+xWHDUYIk1DKN9O23Q55snYo/JZ+2kLLITUx1R6UmJW8LOmsAXUknGcOzQOHSTAAa
         Qv57xXI36Mzi/bXQ3GZIYvTgvWb6DvzHgYkRUIS7Rq8tW8ybgRpkQQsRyfmZe2AOOr1+
         GT1K2iTkOb6CTvCWlkVtMOxVeTZcFkNLn8KXdWEloB6IdzyJpR8S4GO3QX31eZ99JHS7
         c2H+sYDSJjlz2mo12da2FjUhmKf8VAsvCbwePuQKT1/LhJifyrZTZES7dJq7NADaV32o
         m7i5WiinXn2NIslTwYDDNH0JqGbvF2POEXa6AJbpJ+stSm97LMDbCgZAisxHJlRv4ClP
         hmsw==
X-Gm-Message-State: AOAM5328SCJAOXLWxg8IaD0gAW3VKL+Z7+llgqoxZKUBdk8W/g4umk7y
        QklCjKd4+FsTDQ09JYp3USMddASru8HN
X-Google-Smtp-Source: ABdhPJzqOaS4ZMz+61ASiwWqZJTx0yklQsWOZm640ChrHnJkwqqqGPaVilq3n2xbqX2bO72REcKFb38xI/gV
X-Received: by 2002:a25:fc04:: with SMTP id v4mr37291336ybd.164.1595268765617;
 Mon, 20 Jul 2020 11:12:45 -0700 (PDT)
Date:   Mon, 20 Jul 2020 11:12:22 -0700
Message-Id: <20200720181237.3015826-1-maskray@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
Subject: [PATCH] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
From:   Fangrui Song <maskray@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Cc:     Fangrui Song <maskray@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When CROSS_COMPILE is set (e.g. aarch64-linux-gnu-), if
$(CROSS_COMPILE)elfedit is found at /usr/bin/aarch64-linux-gnu-,
GCC_TOOLCHAIN_DIR will be set to /usr/bin/.  --prefix= will be set to
/usr/bin/ and Clang as of 11 will search for both
$(prefix)aarch64-linux-gnu-$needle and $(prefix)$needle.

GCC searchs for $(prefix)aarch64-linux-gnu/$version/$needle,
$(prefix)aarch64-linux-gnu/$needle and $(prefix)$needle. In practice,
$(prefix)aarch64-linux-gnu/$needle rarely contains executables.

To better model how GCC's -B/--prefix takes in effect in practice, newer
Clang only searches for $(prefix)$needle and for example it will find
/usr/bin/as instead of /usr/bin/aarch64-linux-gnu-as.

Set --prefix= to $(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
(/usr/bin/aarch64-linux-gnu-) so that newer Clang can find the
appropriate cross compiling GNU as (when -no-integrated-as is in
effect).

Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Signed-off-by: Fangrui Song <maskray@google.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1099
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0b5f8538bde5..3ac83e375b61 100644
--- a/Makefile
+++ b/Makefile
@@ -567,7 +567,7 @@ ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)
+CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(CROSS_COMPILE)
 GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
 endif
 ifneq ($(GCC_TOOLCHAIN),)
-- 
2.28.0.rc0.105.gf9edc3c819-goog

