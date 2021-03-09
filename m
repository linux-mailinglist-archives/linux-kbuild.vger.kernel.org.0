Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9166533307D
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 22:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232062AbhCIVAN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 16:00:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:47274 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231906AbhCIU74 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 15:59:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A643365244;
        Tue,  9 Mar 2021 20:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615323596;
        bh=TYc2sxF9jlelu+yoQjVMheyf4gRhjMbLomqGl2trdgk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Lkve6UV0CSpybHVH2mF9r3f2goFOa59edwGzdalytdMeMwEt0HzOX601f4/jI/7nj
         b1U+puVzO9Bv8VT3u3oJgFmuVyL2Xsi6JvATd4cacUhLFVlhoS+uxQsZMRV/uRUQke
         gDBe8dEdUks5VEtVsW7RXowmas2i4SjFrfBLjC40BZ/BAk/F7O37iI73yiQK6gx1sL
         MySbqwPpbzxu3bahYUI79VSr4/YC+BGUKYnWeSwP26QK7T8n3uf/uwoZ2gPZ16G9b6
         Bi2OveewphjKRofUY6cmMG6+HisneW7GftmP0FML1Crp7EkoeOHnwGgj/61jZ+1KGV
         oUkcSwUTDOxLw==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 2/2] Makefile: Only specify '--prefix=' when building with clang + GNU as
Date:   Tue,  9 Mar 2021 13:59:15 -0700
Message-Id: <20210309205915.2340265-2-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0.rc1
In-Reply-To: <20210309205915.2340265-1-nathan@kernel.org>
References: <20210302210646.3044738-1-nathan@kernel.org>
 <20210309205915.2340265-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building with LLVM_IAS=1, there is no point to specifying
'--prefix=' because that flag is only used to find GNU cross tools,
which will not be used indirectly when using the integrated assembler.
All of the tools are invoked directly from PATH or a full path specified
via the command line, which does not depend on the value of '--prefix='.

Sharing commands to reproduce issues becomes a little bit easier without
a '--prefix=' value because that '--prefix=' value is specific to a
user's machine due to it being an absolute path.

Some further notes from Fangrui Song:

  clang can spawn GNU as (if -f?no-integrated-as is specified) and GNU
  objcopy (-f?no-integrated-as and -gsplit-dwarf and -g[123]).
  objcopy is only used for GNU as assembled object files.
  With integrated assembler, the object file streamer creates .o and
  .dwo simultaneously.
  With GNU as, two objcopy commands are needed to extract .debug*.dwo to
  .dwo files && another command to remove .debug*.dwo sections.

A small consequence of this change (to keep things simple) is that
'--prefix=' will always be specified now, even with a native build, when
it was not before. This should not be an issue due to the way that the
Makefile searches for the prefix (based on elfedit's location). This
ends up improving the experience for host builds because PATH is better
respected and matches GCC's behavior more closely. See the below thread
for more details:

https://lore.kernel.org/r/20210205213651.GA16907@Ryzen-5-4500U.localdomain/

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2:

* Fix position of -no-integrated-as flag to fix native build (thanks to
  Masahiro for catching it and sorry for the breakage).

* Add Fangrui's comments about what GNU binaries clang can spawn at
  Masahiro's request.

* Reword commit message.

I did not carry tags forward so that people could re-review and test.

 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 182e93d91198..15292a6d63f5 100644
--- a/Makefile
+++ b/Makefile
@@ -566,11 +566,11 @@ CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
-GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
-CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 endif
 ifneq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -no-integrated-as
+GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
+CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
-- 
2.31.0.rc1

