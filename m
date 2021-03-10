Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C311C333FBA
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Mar 2021 14:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbhCJN4O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 10 Mar 2021 08:56:14 -0500
Received: from conuserg-08.nifty.com ([210.131.2.75]:18469 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbhCJN4F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 10 Mar 2021 08:56:05 -0500
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-08.nifty.com with ESMTP id 12ADtCAI025968;
        Wed, 10 Mar 2021 22:55:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com 12ADtCAI025968
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615384513;
        bh=9XvoYcFtafIRd7rGLHERUKU/O6dLqZIhlkxuvCI8qjM=;
        h=From:To:Cc:Subject:Date:From;
        b=qnEIu3bs9ZFkgsz4CObu0g5EBcM1CNbUlCGXudGIqdnj2AdNOH2DNW94CMpKANzCU
         KcqZz2L4hBgIO4JgA5MMuY9bIuCf9bhZByedohWBhrOPhfj5kf8fePPXuNE0E5QasT
         Fs8xh0J83xnmfW0yx/Io8Tr8P5ZtODX10mI5bQoo7jLmru3GdhxZ3jLmNnCzrMW8hZ
         Vv9YiTL3Rsf4Vmi2qHhjpsKsQk6HEQ5kXXm3jOWeD23tnn32PJzd1kjUp/5LWQUjAy
         JENYNB1B9kWpQJN+9TOZirOpDijCTGTW/m5+BE32gS8mCvvGufeLsQIvqyuplHgPlc
         ZUoixJSrW+Fzw==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
Date:   Wed, 10 Mar 2021 22:54:22 +0900
Message-Id: <20210310135423.813041-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As Documentation/kbuild/llvm.rst notes, LLVM=1 switches the default of
tools, but you can still override CC, LD, etc. individually. This LLVM=1
check is unneeded because each tool is already checked separately.

"make CC=clang LD=ld.lld NM=llvm-nm AR=llvm-ar LLVM_IAS=1 menuconfig"
should be able to enable Clang LTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
---

 arch/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2e7139b39e8f..ecfd3520b676 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -632,7 +632,6 @@ config HAS_LTO_CLANG
 	def_bool y
 	# Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
 	depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
-	depends on $(success,test $(LLVM) -eq 1)
 	depends on $(success,test $(LLVM_IAS) -eq 1)
 	depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
 	depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
-- 
2.27.0

