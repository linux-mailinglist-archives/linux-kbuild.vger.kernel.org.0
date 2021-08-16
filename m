Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62853EDE85
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231307AbhHPUVx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:21:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231203AbhHPUVx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:21:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3938960F22;
        Mon, 16 Aug 2021 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629145281;
        bh=ozav1COS+cnUYWjDVK9ITXmp/DIBcRtnXWwWHkf2Vyc=;
        h=From:To:Cc:Subject:Date:From;
        b=YvNzK5lmSESL+nuHXNiyL3EQSiME2AcEhkOpC8Dr406Tk+eL2ciRv7bJ3JL0w8Z2/
         TcVZwUjcr9iKP4nlsBVrtHOeFOdD2VqZVzs26/32S/KAmpfQN1iZVSfCAqvCzatXc0
         G/qNDTgLjV8yFKlYNe7lcWdnQY3wbufOMBT36T/Rg67B9pALEvNvIqMR1mlbGBYIV4
         8mVbxEC8eMadD5PQEUl3ewg2bKzl+mZ0ky1krSrsd+qLaqdLaPzmgsnu2b8u7WKNIn
         CtXz4swad1BXCcpW/EW9bgJ3K4536l4xncEB1t7d37O4wOEkeLRqrMBSzShP27a41M
         CXQAHbpvLOS3Q==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 1/3] kbuild: Remove -Wno-format-invalid-specifier from clang block
Date:   Mon, 16 Aug 2021 13:20:54 -0700
Message-Id: <20210816202056.4586-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Turning on -Wformat does not reveal any instances of this warning across
several different builds so remove this line to keep the number of
disabled warnings as slim as possible.

This has been disabled since commit 61163efae020 ("kbuild: LLVMLinux:
Add Kbuild support for building kernel with Clang"), which does not
explain exactly why it was turned off but since it was so long ago in
terms of both the kernel and LLVM so it is possible that some bug got
fixed along the way.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Makefile b/Makefile
index 891866af0787..3900f5824721 100644
--- a/Makefile
+++ b/Makefile
@@ -777,7 +777,6 @@ KBUILD_CFLAGS += $(stackp-flags-y)
 
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
-KBUILD_CFLAGS += -Wno-format-invalid-specifier
 KBUILD_CFLAGS += -Wno-gnu
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.

base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
-- 
2.33.0.rc2

