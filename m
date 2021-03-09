Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99293333080
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 22:00:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbhCIVAM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 16:00:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:47250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231872AbhCIU7v (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 15:59:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23BB165243;
        Tue,  9 Mar 2021 20:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615323590;
        bh=xKnQy4lOzj4k8Ph2fNHWK9GUggtn0blvGQT07e7lvIA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nXv9MXb029siXwQLMe2V12871C4suockJUAGv/eXhEAWMj+msKfHzogm0ULDD5g8a
         P99tPVhQWnBHA3PtXSTGaHSmJtFKvp/h97ugEaWAIenX/VqKFlwAS9vXdiEDoc4fik
         kMwaycxfpgYa0ZxuBgBmuDeHzh8s2pY/3w0f4ZPuDiYADwXo4F4hFfHfpoZ3QVd9n4
         uDvOIP6YqpEm4djUbLfO/ZG7TYzNgT77zNaoqbxfxx3/2AK1CfKWXqSwMYE5VvmKz5
         lEkUO7crbbFBlfs93JyhzuccR9epGVWm81IICgloXg8KxD0M0ltKCmFWuaO0XaydyQ
         6+df88xFd/d/w==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 1/2] Makefile: Remove '--gcc-toolchain' flag
Date:   Tue,  9 Mar 2021 13:59:14 -0700
Message-Id: <20210309205915.2340265-1-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0.rc1
In-Reply-To: <20210302210646.3044738-1-nathan@kernel.org>
References: <20210302210646.3044738-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This flag was originally added to allow clang to find the GNU cross
tools in commit 785f11aa595b ("kbuild: Add better clang cross build
support"). This flag was not enough to find the tools at times so
'--prefix' was added to the list in commit ef8c4ed9db80 ("kbuild: allow
to use GCC toolchain not in Clang search path") and improved upon in
commit ca9b31f6bb9c ("Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang
cross compilation"). Now that '--prefix' specifies a full path and
prefix, '--gcc-toolchain' serves no purpose because the kernel builds
with '-nostdinc' and '-nostdlib'.

This has been verified with self compiled LLVM 10.0.1 and LLVM 13.0.0 as
well as a distribution version of LLVM 11.1.0 without binutils in the
LLVM toolchain locations.

Link: https://reviews.llvm.org/D97902
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2:

* Improve commit message (add history behind flag and link to Fangrui's
  documentation improvement).

I did not carry tags forward so that people could re-review and test.

 Makefile | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Makefile b/Makefile
index 31dcdb3d61fa..182e93d91198 100644
--- a/Makefile
+++ b/Makefile
@@ -568,10 +568,6 @@ ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
-GCC_TOOLCHAIN	:= $(realpath $(GCC_TOOLCHAIN_DIR)/..)
-endif
-ifneq ($(GCC_TOOLCHAIN),)
-CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
 ifneq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -no-integrated-as

base-commit: a38fd8748464831584a19438cbb3082b5a2dab15
-- 
2.31.0.rc1

