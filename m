Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0328B264A16
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Sep 2020 18:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgIJQoL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 12:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIJQnu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 12:43:50 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89479C061757;
        Thu, 10 Sep 2020 09:43:32 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f142so6680724qke.13;
        Thu, 10 Sep 2020 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3BNUww9/1V/edxdYConYkSugtndkLik3doexYMvLDMU=;
        b=K+Agj25OfS7jnopwKfDlTq510BD9rZmww7eKHfUIVJO9KMvg+LuWWBkViC/W6KaVZF
         eMApdxaLbCGJJy56W3o2RbdU1dxDhrWb4tbajIGLRmhyuY00KrXkdAVlGCjB7pevULkD
         UMPGdVcKh39bRqAYBxBjyT/or63Uel7WZtV20NTe7RPKYxGun/j5JOWE1W0uqX4SZpfn
         pp1Bvf0lU/t0sP86BTcao8wLaOP9H1fXen/aRlI7sPZ2tTQS113fwle4j07o3P8OSmBv
         S23DvHepf0rpS6rUmpUiYsJGPGqjoTQVOIw+NxXG/KFCabgR17CgBqELVPMs1QjxpL5C
         Mdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3BNUww9/1V/edxdYConYkSugtndkLik3doexYMvLDMU=;
        b=leQGU/aGR0PWhTliBVxDrfhdTMIZJ4QAtUg8kMKQI9ur2sd6rpVSMVIfXt63Bt47hq
         SjM493ziHLEVWs3p3lP8SI9KozGQmFakR/CqDxVDP2fRei8ZxSagtO/k62usr3X26AHD
         DsVXzW25JxKi4L6hh423rxqtGRMUe5zY9jaUkImGzN7kA05L0nJ4S/abs3P8R1bk4jaE
         PDlNLUo3odjxGpEoJIMbqZuIneo+aFJ6X5zq50XXksDGxX9N7n39aP6xtikTtOXLEwdn
         CZf4J5/zU10jNE2KixeDXg7WPo8VbzqV7wVEq71hat21OZhKUgjLd2gnnnoRxfmFCwfq
         cHEQ==
X-Gm-Message-State: AOAM531w4oMQgwxblfHg0D/OhJsOmjHPhGF2gi6snUj3mKtdxqymeEsE
        yY/NhItNqnGX/T7B6zCUB5c=
X-Google-Smtp-Source: ABdhPJxVbc8a6vlWQlbZ8mkuXKtPhwScCC4mrhFLmXahuFar/1Uo1ZEA9M+HwGhpdYF4VMn08ZvP4w==
X-Received: by 2002:a05:620a:211c:: with SMTP id l28mr8443893qkl.395.1599756211766;
        Thu, 10 Sep 2020 09:43:31 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id o13sm6729211qkm.16.2020.09.10.09.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 09:43:30 -0700 (PDT)
Date:   Thu, 10 Sep 2020 09:43:29 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] kbuild: remove cc-option test of -Werror=date-time
Message-ID: <20200910164329.GD3119896@ubuntu-n2-xlarge-x86>
References: <20200910135120.3527468-1-masahiroy@kernel.org>
 <20200910135120.3527468-4-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910135120.3527468-4-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 10:51:20PM +0900, Masahiro Yamada wrote:
> The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> 
> Here is the godbolt:
> https://godbolt.org/z/xvjcMa
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Introduced in clang 3.5.0, see commit
4f43e554081ecac149fe360bee6eef2ed7dab8ea in LLVM.

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
> 
>  Makefile                          | 2 +-
>  arch/arm64/kernel/vdso32/Makefile | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5102c89d3167..1d7c58684fda 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -940,7 +940,7 @@ KBUILD_CFLAGS  += -fno-stack-check
>  KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
>  
>  # Prohibit date/time macros, which would make the build non-deterministic
> -KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
> +KBUILD_CFLAGS   += -Werror=date-time
>  
>  # enforce correct pointer usage
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
> diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
> index dfffd55175a3..1feb4f8e556e 100644
> --- a/arch/arm64/kernel/vdso32/Makefile
> +++ b/arch/arm64/kernel/vdso32/Makefile
> @@ -92,7 +92,7 @@ VDSO_CFLAGS += $(call cc32-option,-Wdeclaration-after-statement,)
>  VDSO_CFLAGS += $(call cc32-option,-Wno-pointer-sign)
>  VDSO_CFLAGS += -fno-strict-overflow
>  VDSO_CFLAGS += $(call cc32-option,-Werror=strict-prototypes)
> -VDSO_CFLAGS += $(call cc32-option,-Werror=date-time)
> +VDSO_CFLAGS += -Werror=date-time
>  VDSO_CFLAGS += $(call cc32-option,-Werror=incompatible-pointer-types)
>  
>  # The 32-bit compiler does not provide 128-bit integers, which are used in
> -- 
> 2.25.1
> 
