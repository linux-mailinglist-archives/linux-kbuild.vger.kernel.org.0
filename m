Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC85132B036
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Mar 2021 04:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236415AbhCCBd3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Mar 2021 20:33:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:36554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1448121AbhCBVHt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Mar 2021 16:07:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0078F64F21;
        Tue,  2 Mar 2021 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614719228;
        bh=kO8DfkWWn8yJyBWkrJ8uGc4QnsuaOIDHHPdOvD5JeW4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aSncCNNaLdk307eMDzS91kz/dO8BB50d+1ffmwITyoSBQOgxtYbGPkxPHi8o+O/W3
         09QiRD0vjRa8NNXVGdZdrZ7PDLsUQR+m5Aw8w9I+ynfIR7ErnwzkmG6wLrYrIF88Oc
         wDCvTd4uFXCbd8j8m4iZQ+SZHf/nYbpIVx3wW1Xq7MWVWlPLq750+ukhdTndRAvAfH
         ZFYLhBv/4NRNehjYEqFPvSYe6A81OLbXwihh7MYxWY4BBTQgfTjSoetlVQ+Kiq3ctZ
         s1APws0lg2lBVOeKKctgV8B+FBipATUzkqGO2BQCV72sv3XO4wF40bCbAHzQ63vDyE
         6+rNEfLNqkUFA==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 2/2] Makefile: Only specify '--prefix=' when building with clang + GNU as
Date:   Tue,  2 Mar 2021 14:06:46 -0700
Message-Id: <20210302210646.3044738-2-nathan@kernel.org>
X-Mailer: git-send-email 2.31.0.rc0.75.gec125d1bc1
In-Reply-To: <20210302210646.3044738-1-nathan@kernel.org>
References: <20210302210646.3044738-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

When building with LLVM_IAS=1, there is no point to specifying
'--prefix=' because that flag is only used to find the cross assembler,
which is clang itself when building with LLVM_IAS=1. All of the other
tools are invoked directly from PATH or a full path specified via the
command line, which does not depend on the value of '--prefix='.

Sharing commands to reproduce issues becomes a little bit easier without
a '--prefix=' value because that '--prefix=' value is specific to a
user's machine due to it being an absolute path.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index c20f0ad8be73..0413b8c594cd 100644
--- a/Makefile
+++ b/Makefile
@@ -566,12 +566,12 @@ CC_VERSION_TEXT = $(shell $(CC) --version 2>/dev/null | head -n 1 | sed 's/\#//g
 ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
+ifneq ($(LLVM_IAS),1)
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
-endif
-ifneq ($(LLVM_IAS),1)
 CLANG_FLAGS	+= -no-integrated-as
 endif
+endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
 KBUILD_AFLAGS	+= $(CLANG_FLAGS)
-- 
2.31.0.rc0.75.gec125d1bc1

