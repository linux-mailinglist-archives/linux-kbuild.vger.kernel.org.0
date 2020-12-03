Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADA732CD64E
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Dec 2020 14:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730438AbgLCM7L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 07:59:11 -0500
Received: from conuserg-12.nifty.com ([210.131.2.79]:53614 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbgLCM7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 07:59:10 -0500
Received: from oscar.flets-west.jp (softbank126090211135.bbtec.net [126.90.211.135]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 0B3CvCTZ012509;
        Thu, 3 Dec 2020 21:57:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 0B3CvCTZ012509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607000233;
        bh=4LEowQvA7xjRCrLhVDoyfxqY/ZOsWCHa7kvgy3K/tZY=;
        h=From:To:Cc:Subject:Date:From;
        b=utJkJDnBRTSN6PtYSPJeDEwQcuM+VJnE2ke5PXJLGn+oit67fPC+R+iTazU3+/mY8
         LVVGIq36ErkcoBzKccRygYST+r76vpn8O++gPQKATc0ad6iUlLTAF9gtEgKGtDNEkI
         2701SeLnZIvuq/RL9J131MqK574AnldM40QNh1i0MERr7lrDQpNfYXzZSO5HuspLnF
         C79Au3LXp3R5jaxZRHYgX0T2jV+4o69OIkrKw31LPlWAtk2aHAnkziKaU8BOrWvtjQ
         9xl8kpOnPtjyENOnrIiBxaDhtwTQcZVZyEDQBhbyb19uzMn++eTI5+1xHEiubKYp7p
         iyylJTo0/jRYw==
X-Nifty-SrcIP: [126.90.211.135]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org, Kees Cook <keescook@chromium.org>,
        Emese Revfy <re.emese@gmail.com>,
        linux-hardening@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] gcc-plugins: simplify GCC plugin-dev capability test
Date:   Thu,  3 Dec 2020 21:57:00 +0900
Message-Id: <20201203125700.161354-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Linus pointed out a third of the time in the Kconfig parse stage comes
from the single invocation of cc1plus in scripts/gcc-plugin.sh [1],
and directly testing plugin-version.h for existence cuts down the
overhead a lot. [2]

This commit takes one step further to kill the build test entirely.

The small piece of code was probably intended to test the C++ designated
initializer, which was not supported until C++20.

In fact, with -pedantic option given, both GCC and Clang emit a warning.

$ echo 'class test { public: int test; } test = { .test = 1 };' | g++ -x c++ -pedantic - -fsyntax-only
<stdin>:1:43: warning: C++ designated initializers only available with '-std=c++2a' or '-std=gnu++2a' [-Wpedantic]
$ echo 'class test { public: int test; } test = { .test = 1 };' | clang++ -x c++ -pedantic - -fsyntax-only
<stdin>:1:43: warning: designated initializers are a C++20 extension [-Wc++20-designator]
class test { public: int test; } test = { .test = 1 };
                                          ^
1 warning generated.

Otherwise, modern C++ compilers should be able to build the code, and
hopefully skipping this test should not make any practical problem.

Checking the existence of plugin-version.h is still needed to ensure
the plugin-dev package is installed. The test code is now small enough
to be embedded in scripts/gcc-plugins/Kconfig.

[1] https://lore.kernel.org/lkml/CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com/
[2] https://lore.kernel.org/lkml/CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com/

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/gcc-plugin.sh       | 19 -------------------
 scripts/gcc-plugins/Kconfig |  2 +-
 2 files changed, 1 insertion(+), 20 deletions(-)
 delete mode 100755 scripts/gcc-plugin.sh

diff --git a/scripts/gcc-plugin.sh b/scripts/gcc-plugin.sh
deleted file mode 100755
index b79fd0bea838..000000000000
--- a/scripts/gcc-plugin.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-# SPDX-License-Identifier: GPL-2.0
-
-set -e
-
-srctree=$(dirname "$0")
-
-gccplugins_dir=$($* -print-file-name=plugin)
-
-# we need a c++ compiler that supports the designated initializer GNU extension
-$HOSTCC -c -x c++ -std=gnu++98 - -fsyntax-only -I $srctree/gcc-plugins -I $gccplugins_dir/include 2>/dev/null <<EOF
-#include "gcc-common.h"
-class test {
-public:
-	int test;
-} test = {
-	.test = 1
-};
-EOF
diff --git a/scripts/gcc-plugins/Kconfig b/scripts/gcc-plugins/Kconfig
index ae19fb0243b9..ab9eb4cbe33a 100644
--- a/scripts/gcc-plugins/Kconfig
+++ b/scripts/gcc-plugins/Kconfig
@@ -9,7 +9,7 @@ menuconfig GCC_PLUGINS
 	bool "GCC plugins"
 	depends on HAVE_GCC_PLUGINS
 	depends on CC_IS_GCC
-	depends on $(success,$(srctree)/scripts/gcc-plugin.sh $(CC))
+	depends on $(success,test -e $(shell,$(CC) -print-file-name=plugin)/include/plugin-version.h)
 	default y
 	help
 	  GCC plugins are loadable modules that provide extra features to the
-- 
2.27.0

