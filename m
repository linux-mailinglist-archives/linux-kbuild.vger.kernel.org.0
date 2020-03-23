Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065F71900BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2020 22:58:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgCWV6Y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Mar 2020 17:58:24 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:42945 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbgCWV6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Mar 2020 17:58:24 -0400
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02NLvX4u010884;
        Tue, 24 Mar 2020 06:57:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02NLvX4u010884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585000654;
        bh=QJRuxjA1adnz8HlTmZr3rif6p3iCZLo6NIxaBlhHutA=;
        h=From:To:Cc:Subject:Date:From;
        b=UohJXRGP+Ak+syMR8ZEtPtnc7gHFx+cgIXLCCtvkZ4sqr7LVcfQON6VZw2INRbYpu
         NlkSSq7X78ynNVKQuOWznwpLaDqhJW2p60qUG4AYEdPSCr4KqmLxoK+hdDOAbhjNEw
         GKK2aLGzQj1K164yTpqG5WYPyau6ZBeZuvQLT4CTe74m4i/hfxCK0vEqt+Wav0zF9z
         mBHR2zFymc3y8SmQMPbC5VQ/qWb5/vFogjjztz/xengoF04Iy5iU9Dc4Rvjme9ydDR
         8Rr6TotHgzjq4HYCLYQm88ipMf0P/V5ttz0MiTiEHv0Jf3gQ2yYw8jIwRxOtR7tfc+
         h96Vmcv+4Znjg==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        clang-built-linux@googlegroups.com
Subject: [PATCH] kconfig: allow to pass optional flag into as-instr macro
Date:   Tue, 24 Mar 2020 06:57:31 +0900
Message-Id: <20200323215732.13339-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Commit 42d519e3d0c0 ("kbuild: Add support for 'as-instr' to be used in
Kconfig files") introduced the Kconfig variant of as-instr.

It is currently used in arch/arm64/Kconfig.

arm and arm64 are simple cases because they are separated by directory,
and GCC also provides a single architecture.

Such architectures as x86, powerpc, sparc, etc. support both 32 and
64 bit kernel in the unified arch directory, and GCC can be biarch.
On such architectures, Kbuild passes -m32 / -m64 flag (or a proper
target triple for Clang) to select the target machine bit.

This commit adds the second parameter to as-instr so you can optionally
pass a compiler flag to evaluate the instruction with.

One example usage of this is for the conversion of the following code
in arch/x86/Makefile:

  adx_instr := $(call as-instr,adox %r10$(comma)%r10,-DCONFIG_AS_ADX=1)

This instruction code should be evaluated by the 64-bit assembler
(r10 is a 64-bit register).

If you use compiler that defaults to 32-bit for building the 64-bit
kernel, -m64 should be passed to invoke the 64-bit assembler.

  config AS_ADX
          def_bool $(as-instr,adox %r10$(comma)%r10,$(m64-flags))

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/Kconfig.include | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
index 496d11c92c97..9b8c98168ba9 100644
--- a/scripts/Kconfig.include
+++ b/scripts/Kconfig.include
@@ -31,9 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -S -x c /dev/null -o /de
 # Return y if the linker supports <flag>, n otherwise
 ld-option = $(success,$(LD) -v $(1))
 
-# $(as-instr,<instr>)
+# $(as-instr,<instr>,[<flag>])
 # Return y if the assembler supports <instr>, n otherwise
-as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
+# You can pass optional <flag> to evaluate <instr> with
+as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) $(2) -c -x assembler -o /dev/null -)
 
 # check if $(CC) and $(LD) exist
 $(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
-- 
2.17.1

