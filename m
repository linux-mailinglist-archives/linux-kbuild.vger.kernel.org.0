Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8132F190843
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 09:52:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbgCXIvW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 04:51:22 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17573 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727261AbgCXIvV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:21 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02O8mgsY011219;
        Tue, 24 Mar 2020 17:48:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsY011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585039725;
        bh=Zh5UxR06uJCD24GzekHGCCPt3LyuPsfIaph9vVkw9LY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=L4sWk0ZSK1bL75s+iro4Oe0VKEyW1SvlGGCTKWdN1nBVsPxmYqwrxQfyjFxQaETHM
         go03QH7hFsgQLyNun1Hz2mW/RPsnUeXbeweeUBW0foMKkvHNbVWyPT1gUjsPX3Ym4w
         yoCNo1MgEG49wUjpbkm9r669Va9PeMEEWC9twGMDdT5wZdQTrEYY+fjO8mHKXpz3y9
         Eh8xTWXNFDQM2txV7oyU/uNRFx1UAlJw68aPnpBwB7TJtn1mSaw8GKY44cp3u3cLP1
         mgGQaGH7gF4qWq5cyw+LvzJjpbA8KA97NAGmwzXWt2KF3pqTbL5IkiP9uB9Tb5jVDQ
         s3/1a5k0KcYDw==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     "David S . Miller" <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        clang-built-linux@googlegroups.com,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-crypto@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        NeilBrown <neilb@suse.de>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>
Subject: [PATCH 01/16] lib/raid6/test: fix build on distros whose /bin/sh is not bash
Date:   Tue, 24 Mar 2020 17:48:06 +0900
Message-Id: <20200324084821.29944-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

You can test raid6 library code from user-space, like this:

  $ cd lib/raid6/test
  $ make

The command in $(shell ...) function is evaluated by /bin/sh by default.
(or, you can change the default shell by setting 'SHELL' in Makefile)

Currently '>&/dev/null' is used to sink both stdout and stderr. Because
this code is bash-ism, it only works when /bin/sh is a symbolic link to
bash (this is the case on RHEL etc.)

This does not work on Ubuntu where /bin/sh is a symbolic link to dash.

I see lots of

  /bin/sh: 1: Syntax error: Bad fd number

and

  warning "your version of binutils lacks ... support"

Replace it with portable '>/dev/null 2>&1'.

Fixes: 4f8c55c5ad49 ("lib/raid6: build proper files on corresponding arch")
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---

 lib/raid6/test/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/raid6/test/Makefile b/lib/raid6/test/Makefile
index 3ab8720aa2f8..b9e6c3648be1 100644
--- a/lib/raid6/test/Makefile
+++ b/lib/raid6/test/Makefile
@@ -35,13 +35,13 @@ endif
 ifeq ($(IS_X86),yes)
         OBJS   += mmx.o sse1.o sse2.o avx2.o recov_ssse3.o recov_avx2.o avx512.o recov_avx512.o
         CFLAGS += $(shell echo "pshufb %xmm0, %xmm0" |		\
-                    gcc -c -x assembler - >&/dev/null &&	\
+                    gcc -c -x assembler - >/dev/null 2>&1 &&	\
                     rm ./-.o && echo -DCONFIG_AS_SSSE3=1)
         CFLAGS += $(shell echo "vpbroadcastb %xmm0, %ymm1" |	\
-                    gcc -c -x assembler - >&/dev/null &&	\
+                    gcc -c -x assembler - >/dev/null 2>&1 &&	\
                     rm ./-.o && echo -DCONFIG_AS_AVX2=1)
 	CFLAGS += $(shell echo "vpmovm2b %k1, %zmm5" |          \
-		    gcc -c -x assembler - >&/dev/null &&        \
+		    gcc -c -x assembler - >/dev/null 2>&1 &&	\
 		    rm ./-.o && echo -DCONFIG_AS_AVX512=1)
 else ifeq ($(HAS_NEON),yes)
         OBJS   += neon.o neon1.o neon2.o neon4.o neon8.o recov_neon.o recov_neon_inner.o
-- 
2.17.1

