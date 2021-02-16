Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135AB31D227
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Feb 2021 22:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230362AbhBPVea (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Feb 2021 16:34:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:44208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230245AbhBPVeD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Feb 2021 16:34:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9420464E08;
        Tue, 16 Feb 2021 21:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613511202;
        bh=01cUIVJGwWx09GbAFg8jofdiRMyEa+J8ftvfZLNrxFA=;
        h=From:To:Cc:Subject:Date:From;
        b=KoFDnzHYfZVMEo1PpdZvHhT/MdR7cQwmpxCBE4HYwBElETG+lJZq2t7cVJbI2LQjo
         i7z0tuuPF3eqypqWbSSPomtzsi813VhvjWyOJa8y7N4EygNu6oWXaovQJjY0SfrOaq
         aHjIC+5lMd7ZD3vLkhNjwVy2W9JWQRM1yBld9uK8bKcvMt8QVe7BQxUR1jW15svgbM
         i4xHbxlUziXMi2ODe9oVWZg2TaHbTP3aJBZlXOZGrEt+b4m3G9P2qPUESgDjMEnaiP
         /MAqSVRoDhI2bvPheLU+QG9STFg2ecq4PuAEZJjCF+n+9GzhhT/DYfCVeuJHVCz6Gd
         4JesVb34za5tA==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>,
        Michael Fuckner <michael@fuckner.net>
Subject: [PATCH] Makefile: Remove # characters from compiler string
Date:   Tue, 16 Feb 2021 14:33:12 -0700
Message-Id: <20210216213312.30462-1-nathan@kernel.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When using AMD's Optimizing C/C++ Compiler (AOCC), the build fails due
to a # character in the version string, which is interpreted as a
comment:

$ make CC=clang defconfig init/main.o
include/config/auto.conf.cmd:1374: *** invalid syntax in conditional. Stop.

$ sed -n 1374p include/config/auto.conf.cmd
ifneq "$(CC_VERSION_TEXT)" "AMD clang version 11.0.0 (CLANG: AOCC_2.3.0-Build#85 2020_11_10) (based on LLVM Mirror.Version.11.0.0)"

Remove all # characters in the version string so that the build does not
fail unexpectedly.

Link: https://github.com/ClangBuiltLinux/linux/issues/1298
Reported-by: Michael Fuckner <michael@fuckner.net>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index de1acaefe87e..9bfe1307447e 100644
--- a/Makefile
+++ b/Makefile
@@ -581,7 +581,7 @@ endif
 # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
 # CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
 # and from include/config/auto.conf.cmd to detect the compiler upgrade.
-CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1)
+CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g')
 
 ifdef config-build
 # ===========================================================================

base-commit: f40ddce88593482919761f74910f42f4b84c004b
-- 
2.30.1

