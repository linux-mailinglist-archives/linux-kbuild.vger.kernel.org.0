Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50A6A193A39
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 09:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbgCZIDn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 04:03:43 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:18420 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726138AbgCZIDn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 04:03:43 -0400
Received: from pug.e01.socionext.com (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id 02Q81Wpb002183;
        Thu, 26 Mar 2020 17:01:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com 02Q81Wpb002183
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585209708;
        bh=wgorDE+vuGrrNUy/MBlmElwy0rVwDu2lUfcQoJ7WdJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i1RAe6MWq0MbOIMo6iw8A45d72zOQX8JgToxfZZh9LlPJ5GIMGYer91+Z6PVKkwAu
         rmFxdO1ArjMEbnFRK3u/4/ZvLTxu4o4QExRbhHrG3xDDSzFkHVA+e2v91zeTTuaepG
         tKd6WmaEnA6OJqi4ANX1id/gnHVsHLSZji/QLm7pV0oY64NWpib/k6sF7kNWSG1TGL
         i2wGyH9PXI72dRnX6ywd13U6copo7Mmheo2iSh3yIDK8rRfmnZ6eVy0QoBA5tIee7X
         JqOpJvjVLKDw1JcqKP/81xNNHvq6RtDVAYefbzyp10AZ3QVE5NK9sQzQZchhGPqJCx
         /EdJ8dLCa8ogg==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        clang-built-linux@googlegroups.com,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/16] x86: replace arch macros from compiler with CONFIG_X86_{32,64}
Date:   Thu, 26 Mar 2020 17:00:56 +0900
Message-Id: <20200326080104.27286-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326080104.27286-1-masahiroy@kernel.org>
References: <20200326080104.27286-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

If the intention is to check i386/x86_64 excluding UML, testing
CONFIG_X86_{32,64} is simpler.

The reason for checking __i386__ / __x86_64__ was perhaps because
lib/raid6/algos.c is built not only for the kernel but also for
testing the library code from userspace.

However, lib/raid6/test/Makefile passes -DCONFIG_X86_{32,64} for
this case. So, I do not see a reason to not use CONFIG option here.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: H. Peter Anvin (Intel) <hpa@zytor.com>
---

Changes in v2: None

 kernel/signal.c   | 2 +-
 lib/raid6/algos.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 5b2396350dd1..db557e1629e5 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1246,7 +1246,7 @@ static void print_fatal_signal(int signr)
 	struct pt_regs *regs = signal_pt_regs();
 	pr_info("potentially unexpected fatal signal %d.\n", signr);
 
-#if defined(__i386__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_32
 	pr_info("code at %08lx: ", regs->ip);
 	{
 		int i;
diff --git a/lib/raid6/algos.c b/lib/raid6/algos.c
index df08664d3432..b5a02326cfb7 100644
--- a/lib/raid6/algos.c
+++ b/lib/raid6/algos.c
@@ -29,7 +29,7 @@ struct raid6_calls raid6_call;
 EXPORT_SYMBOL_GPL(raid6_call);
 
 const struct raid6_calls * const raid6_algos[] = {
-#if defined(__i386__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_32
 #ifdef CONFIG_AS_AVX512
 	&raid6_avx512x2,
 	&raid6_avx512x1,
@@ -45,7 +45,7 @@ const struct raid6_calls * const raid6_algos[] = {
 	&raid6_mmxx2,
 	&raid6_mmxx1,
 #endif
-#if defined(__x86_64__) && !defined(__arch_um__)
+#ifdef CONFIG_X86_64
 #ifdef CONFIG_AS_AVX512
 	&raid6_avx512x4,
 	&raid6_avx512x2,
-- 
2.17.1

