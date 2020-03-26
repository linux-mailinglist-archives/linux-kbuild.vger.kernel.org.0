Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB3F719383F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 06:58:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCZF6N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 01:58:13 -0400
Received: from conuserg-10.nifty.com ([210.131.2.77]:47422 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgCZF6N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 01:58:13 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-10.nifty.com with ESMTP id 02Q5ve97008573;
        Thu, 26 Mar 2020 14:57:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 02Q5ve97008573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585202263;
        bh=C9kzZXmIKqsEqPxkq+FbEJxlP3ux1NGhl1py0BoTGlk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AHhLn/XRtP8sD0q07kdk58SES4vmIs1eXRovc6LDLMQ5MO562Uc5dbWRykxdNbghp
         bURcmlECASN65vcqh8B3E0hWQJk8OFtulL9qrnRlAUGFb+m81eBADDxE5p7phXMGyp
         C2+60u4hm5nNijZVoWOjwdgtJeeRw4vOg14ZQy0wG+fFFup3mmbf2tm/ujQ/11RMnY
         I6P+9XOLRd2uY0j4v4kVH6OmyoPWk793sJTagWTxgdQ57/K41ciEbhh4mgDvKF+gAP
         wBfpfTAfVvoCQjDqUEZ/XrJhfRVGqMbCBpuP0wS2rSfqS5+4EbjYaX+lmAt70YzLnO
         jdDVmeEl1pUog==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] kbuild: remove AS variable
Date:   Thu, 26 Mar 2020 14:57:18 +0900
Message-Id: <20200326055719.16755-4-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326055719.16755-1-masahiroy@kernel.org>
References: <20200326055719.16755-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

As commit 5ef872636ca7 ("kbuild: get rid of misleading $(AS) from
documents") noted, we rarely use $(AS) directly in the kernel build.

Now that the only/last user of $(AS) in drivers/net/wan/Makefile was
converted to $(CC), $(AS) is no longer used in the build process.

You can still pass in AS=clang, which is just a switch to turn on
the LLVM integrated assembler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
---

Changes in v2:
  - Fix breakage of CC=clang build

 Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index fcec84681e4e..2e12fa1cc8f3 100644
--- a/Makefile
+++ b/Makefile
@@ -405,7 +405,6 @@ KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
 KBUILD_HOSTLDLIBS   := $(HOST_LFS_LIBS) $(HOSTLDLIBS)
 
 # Make variables (CC, etc...)
-AS		= $(CROSS_COMPILE)as
 LD		= $(CROSS_COMPILE)ld
 CC		= $(CROSS_COMPILE)gcc
 CPP		= $(CC) -E
@@ -535,7 +534,7 @@ endif
 ifneq ($(GCC_TOOLCHAIN),)
 CLANG_FLAGS	+= --gcc-toolchain=$(GCC_TOOLCHAIN)
 endif
-ifeq ($(shell $(AS) --version 2>&1 | head -n 1 | grep clang),)
+ifeq ($(if $(AS),$(shell $(AS) --version 2>&1 | head -n 1 | grep clang)),)
 CLANG_FLAGS	+= -no-integrated-as
 endif
 CLANG_FLAGS	+= -Werror=unknown-warning-option
-- 
2.17.1

