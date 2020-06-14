Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A01F51F8963
	for <lists+linux-kbuild@lfdr.de>; Sun, 14 Jun 2020 16:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726962AbgFNOpW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Jun 2020 10:45:22 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:55629 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbgFNOpW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Jun 2020 10:45:22 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 05EEhjq1024323;
        Sun, 14 Jun 2020 23:43:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 05EEhjq1024323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592145827;
        bh=2tNBTLIrpjvalARV+ZKm1wYdYtOnuZzF6U2fUm+curc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0MkqVwFcLmqBEkbwbyIVa3kclqsXzYF/ckTbUtRz6QfEd/JnCZ9JnDydoLKUEFQ7s
         mpvI5rUGsxigQs2ynVeFgVee8i8Jqm3Azb2xyMBa7JHkrDi9zLimnrzziIm1xQXikg
         S63ZoDQwP5Omql9Wmz9guRCQKIxj3Eywm8Mbe4qE3BrW8zvcqNLn1jrQGP9IJZuzwR
         mT7SrcbjxR8uIERzDPERllhaV+/l//g3ktsutBTeKTACqI3HG69bjeKgumT3WgL6q5
         YUsXnYSBSXvNUQ6KkMAqtLZBoNuQ5DamQq5igzLXy2TXUd4xftlBGSADXsLfJDdSWk
         f+Nri5Ra+LB1w==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Changbin Du <changbin.du@intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] kconfig: unify cc-option and as-option
Date:   Sun, 14 Jun 2020 23:43:41 +0900
Message-Id: <20200614144341.1077495-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200614144341.1077495-1-masahiroy@kernel.org>
References: <20200614144341.1077495-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option and as-option are almost the same; both pass the flag to
$(CC). The main difference is the cc-option stops before the assemble
stage (-S option) whereas as-option stops after it (-c option).

I chose -S because it is slightly faster, but $(cc-option,-gz=zlib)
returns a wrong result (https://lkml.org/lkml/2020/6/9/1529).
It has been fixed by a separate patch, but using -c is more robust.

However, you cannot simply replace -S with -c because the following
code would break:

    depends on $(cc-option,-gsplit-dwarf)

The combination of -c and -gsplit-dwarf does not accept /dev/null as
output.

  $ cat /dev/null | gcc -gsplit-dwarf -S -x c - -o /dev/null
  $ echo $?
  0

  $ cat /dev/null | gcc -gsplit-dwarf -c -x c - -o /dev/null
  objcopy: Warning: '/dev/null' is not an ordinary file
  $ echo $?
  1

  $ cat /dev/null | gcc -gsplit-dwarf -c -x c - -o tmp.o
  $ echo $?
  0

There is another flag that creates an separate file based on the
object file path:

  $ cat /dev/null | gcc -ftest-coverage -c -x c - -o /dev/null
  <stdin>:1: error: cannot open /dev/null.gcno

So, we cannot use /dev/null to sink the output.

Align the cc-option implementation with scripts/Kbuild.include.

With -c option used in cc-option, as-option is unneeded.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/arm64/Kconfig      | 2 +-
 lib/Kconfig.debug       | 1 -
 scripts/Kconfig.include | 8 +-------
 3 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 31380da53689..6eb18f45258e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1564,7 +1564,7 @@ config CC_HAS_SIGN_RETURN_ADDRESS
 	def_bool $(cc-option,-msign-return-address=all)
 
 config AS_HAS_PAC
-	def_bool $(as-option,-Wa$(comma)-march=armv8.3-a)
+	def_bool $(cc-option,-Wa$(comma)-march=armv8.3-a)
 
 config AS_HAS_CFI_NEGATE_RA_STATE
 	def_bool $(as-instr,.cfi_startproc\n.cfi_negate_ra_state\n.cfi_endproc\n)
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 96999d4d2dda..9ad9210d70a1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -229,7 +229,6 @@ config DEBUG_INFO_COMPRESSED
 	bool "Compressed debugging information"
 	depends on DEBUG_INFO
 	depends on $(cc-option,-gz=zlib)
-	depends on $(as-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
 	  Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index c264da2b9b30..a5fe72c504ff 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -25,18 +25,12 @@ failure = $(if-success,$(1),n,y)
 
 # $(cc-option,<flag>)
 # Return y if the compiler supports <flag>, n otherwise
-cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /dev/null)
+cc-option = $(success,mkdir .tmp_$$$$; trap "rm -rf .tmp_$$$$" EXIT; $(CC) -Werror $(CLANG_FLAGS) $(1) -c -x c /dev/null -o .tmp_$$$$/tmp.o)
 
 # $(ld-option,<flag>)
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(success,$(LD) -v $(1))
 
-# $(as-option,<flag>)
-# /dev/zero is used as output instead of /dev/null as some assembler cribs when
-# both input and output are same. Also both of them have same write behaviour so
-# can be easily substituted.
-as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -c -x assembler /dev/null -o /dev/zero)
-
 # $(as-instr,<instr>)
 # Return y if the assembler supports <instr>, n otherwise
 as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
-- 
2.25.1

