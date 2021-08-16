Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C6B83EDECE
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232845AbhHPUx5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:53:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:51512 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231783AbhHPUx5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:53:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DB2060F11;
        Mon, 16 Aug 2021 20:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629147205;
        bh=hEB1omXu3uSW9cAUcoOuqCfuVxjkIjwS4hpaz5dGLiE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EHq//jHvZU5bLHFr17x5m0h277ZrGuDRBh2JE5gdkfsSiDnpMxOfiy49iA7Uw22Fx
         /K9ZoQzj4zyeU6d8hzNPfQK82k3LoirjSW7yuHUjArPWXj3xuccWhrm1fkeNjYIOed
         zmnaAi/SNzjXtGxxtuL0pumb7Cw0wI0qd05J6HjEHUzWhdMZ69IGJLmy02elrrtgkK
         R6QpPRRz9V1BIDvpwidiZXZVi2x7bRNXmqvsGeOtkVob31UWRNzDldKmqlXFVzSeme
         lmJYlvItm+q2PkVPmQSuHXqpOl+e2mYPKKGpr2xrGX24aiUDlzxKDlSjT4cSLZDcuq
         TnUtmu3MJrq5w==
From:   Nathan Chancellor <nathan@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] kbuild: Switch to 'f' variants of integrated assembler flag
Date:   Mon, 16 Aug 2021 13:52:47 -0700
Message-Id: <20210816205246.57208-1-nathan@kernel.org>
X-Mailer: git-send-email 2.33.0.rc2
In-Reply-To: <20210816203635.53864-1-nathan@kernel.org>
References: <20210816203635.53864-1-nathan@kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

It has been brought up a few times in various code reviews that clang
3.5 introduced -f{,no-}integrated-as as the preferred way to enable and
disable the integrated assembler, mentioning that -{no-,}integrated-as
are now considered legacy flags.

Switch the kernel over to using those variants in case there is ever a
time where clang decides to remove the non-'f' variants of the flag.

Also, fix a typo in a comment ("intergrated" -> "integrated").

Link: https://releases.llvm.org/3.5.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v1 -> v2:

* Fix typo in comment in same area as patch.

* Add Nick's reviewed-by tag.

 scripts/Makefile.clang | 4 ++--
 scripts/as-version.sh  | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
index 3ae63bd35582..4cce8fd0779c 100644
--- a/scripts/Makefile.clang
+++ b/scripts/Makefile.clang
@@ -23,11 +23,11 @@ CLANG_FLAGS	+= --target=$(notdir $(CROSS_COMPILE:%-=%))
 endif # CROSS_COMPILE
 
 ifeq ($(LLVM_IAS),0)
-CLANG_FLAGS	+= -no-integrated-as
+CLANG_FLAGS	+= -fno-integrated-as
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
 CLANG_FLAGS	+= --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
 else
-CLANG_FLAGS	+= -integrated-as
+CLANG_FLAGS	+= -fintegrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
 KBUILD_CFLAGS	+= $(CLANG_FLAGS)
diff --git a/scripts/as-version.sh b/scripts/as-version.sh
index 8b9410e329df..1a21495e9ff0 100755
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -21,14 +21,14 @@ get_canonical_version()
 	echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
 }
 
-# Clang fails to handle -Wa,--version unless -no-integrated-as is given.
-# We check -(f)integrated-as, expecting it is explicitly passed in for the
+# Clang fails to handle -Wa,--version unless -fno-integrated-as is given.
+# We check -fintegrated-as, expecting it is explicitly passed in for the
 # integrated assembler case.
 check_integrated_as()
 {
 	while [ $# -gt 0 ]; do
-		if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
-			# For the intergrated assembler, we do not check the
+		if [ "$1" = -fintegrated-as ]; then
+			# For the integrated assembler, we do not check the
 			# version here. It is the same as the clang version, and
 			# it has been already checked by scripts/cc-version.sh.
 			echo LLVM 0

base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
-- 
2.33.0.rc2

