Return-Path: <linux-kbuild+bounces-8276-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADDAB194A6
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 19:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AA281706D5
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Aug 2025 17:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4645A1C831A;
	Sun,  3 Aug 2025 17:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9gWBdyC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105271B7F4;
	Sun,  3 Aug 2025 17:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754242361; cv=none; b=kshW18yx6wBLtbGWDnIfC9B/Lyx4yZ5z5cPyzYe7xnYqueh8WhkFhM8ScqkkDYcoGhnb8tkAtZDryV6b+5UwF5XRkHtPfn+oRnvImm8YUqCINhIKeCGZyXGWfe86hVKIGLwjRu/yr/4wVwkSSiK//UYbKDQZdhhrFl4OUEoMuyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754242361; c=relaxed/simple;
	bh=a/PRtos9q7kngXplGI6XaTjlncjPBJcYproElg3uWPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvlVcXGvmuFUAEU5C08pcanUnSF15PHqsJoKhpPzNy/gN7BDMqQepJT7x1wx1j1N3P2Vy4GGeJQQNv3TKH5GHfJt4CghnnZHeGMnGWK5kE4N5TJqToiD0RvrFBltEh4YRvIEjIJtHhqeSea1TYgggW4pXMdWjEkR+jX7EnA6Wvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9gWBdyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA36C4CEF7;
	Sun,  3 Aug 2025 17:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754242360;
	bh=a/PRtos9q7kngXplGI6XaTjlncjPBJcYproElg3uWPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F9gWBdyCGCHDk6wEjM3mMAo3HZOlf9fhUkOClREcZi8kEcA0ebGMLEF/t6WAkkqgf
	 i4tQT25yV2YBfWBt9NRWh7JeAGG8/75mRHevXDkoJk5uCopQvemAXb4rkPM0OaNVWW
	 hfgQBnwoeAV6DUpKKiSnZ8pz7LOZA6M/I7S3JmYU39Y+52Ps/gJuRH49QMa8d4qen4
	 rFrfjReNvsnp4vUjMIXklRlRygi+u2BcFbxAopwyLk5w+DZccSkVgd/3zZo13vOQ6R
	 UJ9CMpyOB2IGOVXJQ1UzXeH76Tf5EeK/gyIDi+m1SbccYRzvS/rbNpkeNkWffkZr1I
	 HXMaazhutZebg==
Date: Sun, 3 Aug 2025 10:32:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Re-enable -Wunterminated-string-initialization
Message-ID: <20250803173235.GA716998@ax162>
References: <20250802184328.it.438-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250802184328.it.438-kees@kernel.org>

On Sat, Aug 02, 2025 at 11:43:32AM -0700, Kees Cook wrote:
> With the few remaining fixes now landed, we can re-enable the option
> -Wunterminated-string-initialization (via -Wextra). Both GCC and Clang
> have the required multi-dimensional nonstring attribute support.
> 
> Build tested allmodconfig with:
> 	gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0
> 	gcc (GCC) 15.1.1 20250521 (Red Hat 15.1.1-2)
> 	clang version 20.1.8 (Fedora 20.1.8-1.fc42)
> 	ClangBuiltLinux clang version 21.1.0-rc2
> 	clang version 22.0.0git
> 
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  v2: Clang is fixed too! :) (Nathan)
>  v1: https://lore.kernel.org/lkml/20250802002733.work.941-kees@kernel.org/
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  scripts/Makefile.extrawarn | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index dca175fffcab..a1001377dcb2 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -78,9 +78,6 @@ KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
>  KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
>  KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
>  
> -# Currently, disable -Wunterminated-string-initialization as broken
> -KBUILD_CFLAGS += $(call cc-option, -Wno-unterminated-string-initialization)
> -
>  # The allocators already balk at large sizes, so silence the compiler
>  # warnings for bounds checks involving those possible values. While
>  # -Wno-alloc-size-larger-than would normally be used here, earlier versions
> -- 
> 2.34.1
> 

I threw this into my local -next tree and my matrix finds the following
remaining instances of this warning, mostly in driver code that may be
used on specific architectures (I am guessing it is only x86_64
allmodconfig that is clean?). I verified GCC 15 seems a couple of them
then I stopped double checking for time sake.

ARCH=arm multi_v5_defconfig:

  drivers/cpufreq/kirkwood-cpufreq.c:98:10: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     98 |         .name   = "kirkwood-cpufreq",
        |                   ^~~~~~~~~~~~~~~~~~

ARCH=arm allmodconfig:

  drivers/soc/ti/pm33xx.c:77:22: warning: initializer-string for character array is too long, array size is 10 but initializer has size 11 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     77 |         .irq_nr = 0, .src = "Ext wakeup",
        |                             ^~~~~~~~~~~~

  drivers/cpuidle/cpuidle-mvebu-v7.c:69:13: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     69 |                 .name                   = "MV CPU DEEP IDLE",
        |                                           ^~~~~~~~~~~~~~~~~~

  drivers/firmware/efi/libstub/vsprintf.c:121:33: warning: initializer-string for character array is too long, array size is 16 but initializer has size 17 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
    121 |         static const char digits[16] = "0123456789ABCDEF"; /* "GHIJKLMNOPQRSTUVWXYZ"; */
        |                                        ^~~~~~~~~~~~~~~~~~

  drivers/net/ethernet/ti/netcp_ethss.c:1049:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
   1049 |         GBENU_STATS_HOST(ale_unknown_ucast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:1051:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
   1051 |         GBENU_STATS_HOST(ale_unknown_mcast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:1053:2: warning: initializer-string for character array is too long, array size is 32 but initializer has size 33 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
   1053 |         GBENU_STATS_HOST(ale_unknown_bcast_bytes),
        |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  drivers/net/ethernet/ti/netcp_ethss.c:956:2: note: expanded from macro 'GBENU_STATS_HOST'
    956 |         "GBE_HOST:"#field, GBENU_STATS0_MODULE,                 \
        |         ^~~~~~~~~~~~~~~~~

ARCH=riscv allmodconfig:

  In file included from arch/riscv/kernel/kgdb.c:13:
  arch/riscv/include/asm/gdb_xml.h:9:46: warning: initializer-string for character array is too long, array size is 31 but initializer has size 32 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
      9 | static const char gdb_xfer_read_target[31] = "qXfer:features:read:target.xml:";
        |                                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  arch/riscv/include/asm/gdb_xml.h:13:4: warning: initializer-string for character array is too long, array size is 39 but initializer has size 40 (including the null terminating character); did you mean to use the 'nonstring' attribute? [-Wunterminated-string-initialization]
     13 |                         "qXfer:features:read:riscv-64bit-cpu.xml";
        |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

These seem like obvious fixes from my brief investigations but I am not
sure about the other ones. The RISC-V instances seem problematic because
kgdb_arch_handle_qxfer_pkt() uses strcpy() to copy those strings?

Cheers,
Nathan

diff --git a/drivers/firmware/efi/libstub/vsprintf.c b/drivers/firmware/efi/libstub/vsprintf.c
index 71c71c222346..7f7bbdb2a507 100644
--- a/drivers/firmware/efi/libstub/vsprintf.c
+++ b/drivers/firmware/efi/libstub/vsprintf.c
@@ -118,7 +118,7 @@ char *number(char *end, unsigned long long num, int base, char locase)
 	 */
 
 	/* we are called with base 8, 10 or 16, only, thus don't need "G..."  */
-	static const char digits[16] = "0123456789ABCDEF"; /* "GHIJKLMNOPQRSTUVWXYZ"; */
+	static const char digits[16] __nonstring = "0123456789ABCDEF"; /* "GHIJKLMNOPQRSTUVWXYZ"; */
 
 	switch (base) {
 	case 10:
diff --git a/drivers/net/ethernet/ti/netcp_ethss.c b/drivers/net/ethernet/ti/netcp_ethss.c
index 55a1a96cd834..05d4323c6a13 100644
--- a/drivers/net/ethernet/ti/netcp_ethss.c
+++ b/drivers/net/ethernet/ti/netcp_ethss.c
@@ -771,7 +771,7 @@ static struct netcp_module xgbe_module;
 
 /* Statistic management */
 struct netcp_ethtool_stat {
-	char desc[ETH_GSTRING_LEN];
+	char desc[ETH_GSTRING_LEN] __nonstring;
 	int type;
 	u32 size;
 	int offset;

