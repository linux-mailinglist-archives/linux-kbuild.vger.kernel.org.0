Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9BA0193A5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:04:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727849AbgCZIEF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:04:05 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:19078 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727773AbgCZIEE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:04:04 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wph002183;
        Thu, 26 Mar 2020 17:01:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wph002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209716;
        bh=LtWeUWp0ttfpJ5z1d5FhHMR2PikZUhMmjkf5NulQvsI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Szxs/tTCNMGXvp9dbnrJo7rWZIdoBHZyT5Fzo7Pbi8ZeffchxaXiSxAtzNtc+vHTz
         XKAG9pRATbl7MGvsSsrMosTS/bQbh8cH47qdZgh1HA+7jvNEhqT9l0Xmm57aTnS1tX
         bPIenYGKfU2CHGWFxGlJRrARUMJwDptpPPj4HX9QGYeiOKjNxdzcsCk/ocNjhQVbm6
         mmczgzkUY+RRFHWcTlnWpF3LOEjpWaAAIAHpeTlVDDNGDRxeua3gtVAU5mC0gk0d+4
         qXI0/uhC/tFy89Od7THEkZdphwBmfu7cxG3P2F6TVhVtEcz9QGjVe2rJ0ZUaHmDN6x
         518UG3b49nZXg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com, Borislav Petkov <bp@suse.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] Documentation/changes: Raise minimum supported binutils version to 2.23
Date:   Thu, 26 Mar 2020 17:01:02 +0900
Message-Id: <20200326080104.27286-15-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
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

Changes in v2: None

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

