Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E35232C1FC
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387623AbhCCTcK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:32:10 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:63536 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1580824AbhCCSfQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 13:35:16 -0500
Received: from localhost.localdomain (122-103-140-163.kyoto.fdn.vectant.ne.jp [122.103.140.163]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 123IXcJc023524;
        Thu, 4 Mar 2021 03:33:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 123IXcJc023524
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614796418;
        bh=Ty6hgSJlEGo2TmgYh5EvVwMWKVKlHFxHVBQFp4A9PZc=;
        h=From:To:Cc:Subject:Date:From;
        b=sFQoLeT+Cy/QbM2/MnqVN+TuQNPtcVWeyhcf3Xy1BB/D2p/80WkwsuY9z0mhfMgHB
         OXmxQ/DkDEwMTZfIoNNBgy8mGaFyzbJXCeXH5b9WYVnrBP0VmRdZhfgGPerfwVP+32
         HIITkDOCAQognggVWcDp36CThUauLrtGhfI2zhkYRCXCxZGu4lBoAQq0VR5ecBUl7q
         S6ATFAQYnxWEFG+FkehkDedRPqP7jBvwfHCmMkQl2mDpeMM0OGjmMPAunV9KjqKqBI
         A1yyiE2L06Zu6OFAmGtzsCUtb8hPmaqmjl1BjDrErKQDyHFVfVgRS3B8VLRczYCzpj
         QZM+EHOY6cgOQ==
X-Nifty-SrcIP: [122.103.140.163]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
Date:   Thu,  4 Mar 2021 03:33:30 +0900
Message-Id: <20210303183333.46543-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This guarding is wrong. As Documentation/kbuild/llvm.rst notes, LLVM=1
switches the default of tools, but you can still override CC, LD, etc.
individually.

BTW, LLVM is not 1/0 flag. If LLVM is not passed in, it is empty.

Non-zero return code is all treated as failure anyway.

So, $(success,test $(LLVM) -eq 1) and $(success,test "$(LLVM)" = 1)
works equivalently in the sense that both are expanded to 'n' if LLVM
is not given. The difference is that the former internally fails due
to syntax error.

  $ test ${LLVM} -eq 1
  bash: test: -eq: unary operator expected
  $ echo $?
  2

  $ test "${LLVM}" -eq 1
  bash: test: : integer expression expected
  $ echo $?
  2

  $ test "${LLVM}" = 1
  echo $?
  1

  $ test -n "${LLVM}"
  $ echo $?
  1

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 2bb30673d8e6..2af10ebe5ed0 100644
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

