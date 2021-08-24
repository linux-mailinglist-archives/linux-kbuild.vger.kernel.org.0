Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035C83F55FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 04:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhHXC5h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Aug 2021 22:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233646AbhHXC5g (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Aug 2021 22:57:36 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20909C061575
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Aug 2021 19:56:53 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id q21so2371952plq.3
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Aug 2021 19:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=29Fb0DQb3lLM1RT0ONfW5Rl3roBtF0uhGZi6Clr4PQ8=;
        b=GDUCXarovw3ukF3RwAsETeElR5eGZPBu70ayB2wBQ/TkJiUQsrK/LrueDGJCxotLKi
         ONJSxgXeWrngVIsd79smxVSF174v3ocrKyIRx2FpMXOk9kzCNFVH2niEcM+R+iqNEmI7
         ZlvmjevY3GS6Hme6xtZ3+Ptx+FnFMI9Yq/daLTAA4UCGxALn/6hgG5JG2QLb1sp4M1em
         kl2plY0zoiACgUQbnHH2YRDzcEhkPyZQdD+mbfmlKIV9Vtf7FbLGrEhvgfrzAiF0T/Ex
         QkqbMid4GkGvIAcMfdK7VJ5jWqv1njIol6NTXXsAqKIUXQJuVN0TAmsN7MSk3SSdFPmG
         d1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=29Fb0DQb3lLM1RT0ONfW5Rl3roBtF0uhGZi6Clr4PQ8=;
        b=KnvW28Nq/YyCJx/zpSsNKUVxkAJH3AIaldijpIUVdB31jq35pn99QriqILt8wfiDZ7
         fnYlv+1AaeSrIlt5JWP02F5YV/g85VahXZ9oUEUr/wOA1L5yi2zg0wa2Kjk21XBq+gCg
         4gqG1617olrfpCfEVS321z9DocQTLD3XSmT05ELE1mO+kB3elvT+xQj0CsQWGBOUyce0
         7BGzpCQcRjyebiI8O2cBGS//9SvHq6GTLfuEL43rTPHPZhkqp70LJdjcwQQ7B62swWQN
         9+u3OHhqaBudHoyXRFXcfi+F9mlmxDSFZLeqb8qA6vMZBlcyMUgdREOBkK4M/9+TFv2d
         vLlg==
X-Gm-Message-State: AOAM533Si/plF+P0Xtr7qYh1MQ07/GE1b28LLR8jA1jAeHnucYNIWCus
        0v5JH/UkuXezZZSQAc0UsJnSxQ==
X-Google-Smtp-Source: ABdhPJwXFrQMieCMh9x9c+mtDLu/YP/iQ36j1IknXDrvOvDegeb32ZiTPGsKdkfnQ8HYxv43bwJgqw==
X-Received: by 2002:a17:903:310a:b0:133:9bb6:98bd with SMTP id w10-20020a170903310a00b001339bb698bdmr9300777plc.19.1629773812408;
        Mon, 23 Aug 2021 19:56:52 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:196f:5297:b0e8:1313])
        by smtp.gmail.com with ESMTPSA id y12sm18770264pgl.65.2021.08.23.19.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 19:56:51 -0700 (PDT)
Date:   Mon, 23 Aug 2021 19:56:47 -0700
From:   Fangrui Song <maskray@google.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/2] x86: Do not add -falign flags unconditionally for
 clang
Message-ID: <20210824025647.tssnp7qtccbgvdq7@google.com>
References: <20210824022640.2170859-1-nathan@kernel.org>
 <20210824022640.2170859-2-nathan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210824022640.2170859-2-nathan@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-08-23, Nathan Chancellor wrote:
>clang does not support -falign-jumps and only recently gained support
>for -falign-loops. When one of the configuration options that adds these
>flags is enabled, clang warns and all cc-{disable-warning,option} that
>follow fail because -Werror gets added to test for the presence of this
>warning:

[I implemented clang -falign-loops :) It doesn't affect LTO, though.
LTO ld.lld may use -Wl,-mllvm,-align-loops=32 for now.  ]

>clang-14: warning: optimization flag '-falign-jumps=0' is not supported
>[-Wignored-optimization-argument]

grub made a similar mistake:) It thought the availability of -falign-X
implies the availability of other -falign-*
https://lists.gnu.org/archive/html/grub-devel/2021-08/msg00076.html

>To resolve this, add a couple of cc-option calls when building with
>clang; gcc has supported these options since 3.2 so there is no point in
>testing for their support. -falign-functions was implemented in clang-7,
>-falign-loops was implemented in clang-14, and -falign-jumps has not
>been implemented yet.
>
>Link: https://lore.kernel.org/r/YSQE2f5teuvKLkON@Ryzen-9-3900X.localdomain/
>Reported-by: kernel test robot <lkp@intel.com>
>Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>---
> arch/x86/Makefile_32.cpu | 12 +++++++++---
> 1 file changed, 9 insertions(+), 3 deletions(-)
>
>diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
>index cd3056759880..e8c65f990afd 100644
>--- a/arch/x86/Makefile_32.cpu
>+++ b/arch/x86/Makefile_32.cpu
>@@ -10,6 +10,12 @@ else
> tune		= $(call cc-option,-mcpu=$(1),$(2))
> endif
>
>+ifdef CONFIG_CC_IS_CLANG
>+align		:= -falign-functions=0 $(call cc-option,-falign-jumps=0) $(call cc-option,-falign-loops=0)
>+else
>+align		:= -falign-functions=0 -falign-jumps=0 -falign-loops=0
>+endif
>+
> cflags-$(CONFIG_M486SX)		+= -march=i486
> cflags-$(CONFIG_M486)		+= -march=i486
> cflags-$(CONFIG_M586)		+= -march=i586
>@@ -25,11 +31,11 @@ cflags-$(CONFIG_MK6)		+= -march=k6
> # They make zero difference whatsosever to performance at this time.
> cflags-$(CONFIG_MK7)		+= -march=athlon
> cflags-$(CONFIG_MK8)		+= $(call cc-option,-march=k8,-march=athlon)
>-cflags-$(CONFIG_MCRUSOE)	+= -march=i686 -falign-functions=0 -falign-jumps=0 -falign-loops=0
>-cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) -falign-functions=0 -falign-jumps=0 -falign-loops=0
>+cflags-$(CONFIG_MCRUSOE)	+= -march=i686 $(align)
>+cflags-$(CONFIG_MEFFICEON)	+= -march=i686 $(call tune,pentium3) $(align)
> cflags-$(CONFIG_MWINCHIPC6)	+= $(call cc-option,-march=winchip-c6,-march=i586)
> cflags-$(CONFIG_MWINCHIP3D)	+= $(call cc-option,-march=winchip2,-march=i586)
>-cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) -falign-functions=0 -falign-jumps=0 -falign-loops=0
>+cflags-$(CONFIG_MCYRIXIII)	+= $(call cc-option,-march=c3,-march=i486) $(align)
> cflags-$(CONFIG_MVIAC3_2)	+= $(call cc-option,-march=c3-2,-march=i686)
> cflags-$(CONFIG_MVIAC7)		+= -march=i686
> cflags-$(CONFIG_MCORE2)		+= -march=i686 $(call tune,core2)
>-- 
>2.33.0

https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html says
"If n is not specified or is zero, use a machine-dependent default."

Unless some other files specify -falign-loops=N and expect 0 to reset to
the machine default, -falign-jumps=0 -falign-loops=0 -falign-functions=0 should just be dropped.

BTW: I believe GCC 8 (likely when fixing another issue with a large refactor
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84100) introduced a bug
that -falign-X=0 was essentially -falign-X=1.
GCC 11.0 (https://gcc.gnu.org/bugzilla/show_bug.cgi?id=96247) fixed the bug.
