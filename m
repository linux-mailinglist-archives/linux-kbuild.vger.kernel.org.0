Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 193EF1B83E3
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Apr 2020 08:07:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726035AbgDYGHd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 25 Apr 2020 02:07:33 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:33398 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725837AbgDYGHd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 02:07:33 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 03P66gJ2004452;
        Sat, 25 Apr 2020 15:06:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 03P66gJ2004452
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587794803;
        bh=yZzQTZNfAphRos2xirV3K5SgA+kD4qCWGx5IWcuZTkc=;
        h=From:To:Cc:Subject:Date:From;
        b=ImG0kqf43CToIiAoBUgYMeNCsOFp3lmMjVtce5RsO7gasWFGSGv/t+1CkQf7/Qkjp
         KtxUyTM9C6LrSZW5Paw5/MxFft9zjkaM/w51yo57xA270h7BRKCsMeZcUYeaitww9q
         e0ss6Eu7loxSxy9px2uCTLt3/2Cf0xO1Zr0Xs8wmYDCDR0JkwmQHmSN+kYEoRvPJXZ
         OHXWruX4LzlHvrTT9Udzn9wKLshj8SrVdxKVjB14gc04YdWKLVcSPBH1O9ZDhKqAx7
         FIvtmZBCHsmFAwyJ2x2dPvzV/X51U6q0P1gq+nRReKBwXUbP+5T5P9JTHUi1YmEIST
         0V6UuvmLj8COw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Guan Xuetao <gxt@pku.edu.cn>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] unicore32: do not evaluate compiler's library path when cleaning
Date:   Sat, 25 Apr 2020 15:06:40 +0900
Message-Id: <20200425060640.823362-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Since commit a83e4ca26af8 ("kbuild: remove cc-option switch from
-Wframe-larger-than="), 'make ARCH=unicore32 clean' emits error
messages as follows:

  $ make ARCH=unicore32 clean
  gcc: error: missing argument to '-Wframe-larger-than='
  gcc: error: missing argument to '-Wframe-larger-than='

We do not care compiler flags when cleaning.

Use the '=' operator for lazy expansion because we do not use
GNU_LIBC_A or GNU_LIBGCC_A when cleaning.

Fixes: a83e4ca26af8 ("kbuild: remove cc-option switch from -Wframe-larger-than=")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/unicore32/lib/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/unicore32/lib/Makefile b/arch/unicore32/lib/Makefile
index 098981a01841..5af06645b8f0 100644
--- a/arch/unicore32/lib/Makefile
+++ b/arch/unicore32/lib/Makefile
@@ -10,12 +10,12 @@ lib-y	+= strncpy_from_user.o strnlen_user.o
 lib-y	+= clear_user.o copy_page.o
 lib-y	+= copy_from_user.o copy_to_user.o
 
-GNU_LIBC_A		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
+GNU_LIBC_A		= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libc.a)
 GNU_LIBC_A_OBJS		:= memchr.o memcpy.o memmove.o memset.o
 GNU_LIBC_A_OBJS		+= strchr.o strrchr.o
 GNU_LIBC_A_OBJS		+= rawmemchr.o			# needed by strrchr.o
 
-GNU_LIBGCC_A		:= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
+GNU_LIBGCC_A		= $(shell $(CC) $(KBUILD_CFLAGS) -print-file-name=libgcc.a)
 GNU_LIBGCC_A_OBJS	:= _ashldi3.o _ashrdi3.o _lshrdi3.o
 GNU_LIBGCC_A_OBJS	+= _divsi3.o _modsi3.o _ucmpdi2.o _umodsi3.o _udivsi3.o
 
-- 
2.25.1

