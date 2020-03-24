Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FF11190831
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2020 09:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgCXIv1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Mar 2020 04:51:27 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:17668 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727388AbgCXIv0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 04:51:26 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02O8mgsl011219;
        Tue, 24 Mar 2020 17:49:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02O8mgsl011219
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585039742;
        bh=s0I5SOuN4Cdii5q1Bnu+2uo8oY7Phl6nmh/yFk4bv3o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=db6hzkHI/NUH249ZqcRDYDfDe7GjyhgWCZVEEqEZfEZI3S6EwdYG1NtOgjiK171el
         MjI3tcpwCT0daxXBK+R/TOqQzVneYQsbupnIcxgg2QCaB7ZzDGOzLCDxr8rMTUUFXa
         B3UBz9H/dfpDiBg64mTb2KNZZOHa85gzYOvTQCyDQ2Yf8CEdnNfKhDbXMhXnTlme5T
         /vwMJ9P7KSCRdM8GtxROlB105f7gzUPGdScoGbm6cf/CFMcios3IkyOf+f8QRAHZG+
         NKByMqsLhIOfmKaV0z6CaT+GIjfDMUF/whvLdFouvk7Zjffqz5Aw24Sn/M5pdVEQMU
         crRjI6Rw5wUNg==
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
        linux-kbuild@vger.kernel.org, Borislav Petkov <bp@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH 14/16] Documentation/changes: Raise minimum supported binutils version to 2.23
Date:   Tue, 24 Mar 2020 17:48:19 +0900
Message-Id: <20200324084821.29944-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200324084821.29944-1-masahiroy@kernel.org>
References: <20200324084821.29944-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

The currently minimum-supported binutils version 2.21 has the problem of
promoting symbols which are defined outside of a section into absolute.
According to Arvind:

  binutils-2.21 and -2.22. An x86-64 defconfig will fail with
          Invalid absolute R_X86_64_32S relocation: _etext
  and after fixing that one, with
          Invalid absolute R_X86_64_32S relocation: __end_of_kernel_reserve

Those two versions of binutils have a bug when it comes to handling
symbols defined outside of a section and binutils 2.23 has the proper
fix, see: https://sourceware.org/legacy-ml/binutils/2012-06/msg00155.html

Therefore, up to the fixed version directly, skipping the broken ones.

Currently shipping distros already have the fixed binutils version so
there should be no breakage resulting from this.

For more details about the whole thing, see the thread in Link.

Signed-off-by: Borislav Petkov <bp@suse.de>
Link: https://lkml.kernel.org/r/20200110202349.1881840-1-nivedita@alum.mit.edu
Acked-by: Kees Cook <keescook@chromium.org>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/process/changes.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index e47863575917..91c5ff8e161e 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
 GNU C                  4.6              gcc --version
 GNU make               3.81             make --version
-binutils               2.21             ld -v
+binutils               2.23             ld -v
 flex                   2.5.35           flex --version
 bison                  2.0              bison --version
 util-linux             2.10o            fdformat --version
@@ -76,7 +76,7 @@ You will need GNU make 3.81 or later to build the kernel.
 Binutils
 --------
 
-Binutils 2.21 or newer is needed to build the kernel.
+Binutils 2.23 or newer is needed to build the kernel.
 
 pkg-config
 ----------
-- 
2.17.1

