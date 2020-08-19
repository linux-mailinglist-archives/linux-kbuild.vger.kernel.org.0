Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7302624A6E5
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 21:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbgHST3h (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 15:29:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHST3h (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 15:29:37 -0400
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com [IPv6:2607:f8b0:4864:20::f44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB9A2C061757;
        Wed, 19 Aug 2020 12:29:36 -0700 (PDT)
Received: by mail-qv1-xf44.google.com with SMTP id x6so11855391qvr.8;
        Wed, 19 Aug 2020 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Vw4+xoevL6HCqwb25tJE3ItRuXy/EdPOYs2kBLSbjws=;
        b=TxMAtY5Lk67k/57yY8ZQaT7UTKGeCtgnJAejc7o/H6pCqyR64aJJmHf6xRznjPMchp
         JdyWYSTwnE8vLtLX9MJsi3sf7wns4KdlU2kcoBpSEcSe27acmnFwgT6s7c4P28DPChq4
         8Nrsk19y+hvEXg8DWyDS+AusgkUVd6YnnE15coaloaCsQ9ap82jDYwylHBhWm60GY2os
         AXB1dZfn9Su0j9HOvz2c+HyWPmjHKycbRT2FlsZam3p78VZdcaDeB1i6d0tm9U0bF/Ms
         0uTmN92Ntx3b11FJWIIM+RnnQkSmRnag2lfxIHlmvyOMS4c1QTwAfdHNxy1XDneviA1j
         Rknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=Vw4+xoevL6HCqwb25tJE3ItRuXy/EdPOYs2kBLSbjws=;
        b=ccwHrJWYvjs7f3vy9Y0eMU7xB7zbArngvHMTjbPrxgKzkKVeOf5LxtXKsVf+lLsnDA
         9pBZYF/HQufl/LKAIjgBb9TuHGVPtcQHxpq6KcBIsIxGLiiiCwKU7DE2G5GFg0v1oLK1
         wq7AZQDdY6z5OCbwR/m58JVhM565oWMGhmvR7YZQQKzXMxEMDodQuLp9g6IJG44mdYAo
         NjFr/QOvoRjx7dx7W8HzcQ0E6V8aqtaZXMZ0SNkYpBRaqCTGlPHQdyO5y19DQiDV9Dqk
         D4VcyGBG6wBfge55C2hW5TkVLELk4ASxC/dh1kzxplgJ5duDYJMihxHwbEpWOBgyjwwL
         rI2Q==
X-Gm-Message-State: AOAM5312mYevlUwXCpSjlcXcldkuJpgkCYOKq6kchd90VbfqBpqB9c9Q
        jis+2WEk82tOBjgZeUSd3Yk=
X-Google-Smtp-Source: ABdhPJxCwQflOM2eMeXREkpqyufZuZMseZYIsr6gWhc+I5qllV+5bet1IGAIgu2S4tsYX/20laJHSA==
X-Received: by 2002:ad4:4a29:: with SMTP id n9mr25182148qvz.50.1597865376078;
        Wed, 19 Aug 2020 12:29:36 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id o48sm29816825qtf.14.2020.08.19.12.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 12:29:35 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Wed, 19 Aug 2020 15:29:32 -0400
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Joe Perches <joe@perches.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Daniel Axtens <dja@axtens.net>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexandru Ardelean <alexandru.ardelean@analog.com>,
        Yury Norov <yury.norov@gmail.com>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Daniel Kiper <daniel.kiper@oracle.com>,
        Bruce Ashfield <bruce.ashfield@gmail.com>,
        Marco Elver <elver@google.com>,
        Vamshi K Sthambamkadi <vamshi.k.sthambamkadi@gmail.com>,
        Andi Kleen <ak@suse.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        =?utf-8?B?RMOhdmlkIEJvbHZhbnNrw70=?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH v2 4/5] x86/boot: use -fno-builtin-bcmp
Message-ID: <20200819192932.GA58968@rani.riverdale.lan>
References: <20200819191654.1130563-1-ndesaulniers@google.com>
 <20200819191654.1130563-5-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200819191654.1130563-5-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 19, 2020 at 12:16:53PM -0700, Nick Desaulniers wrote:
> We're reverting
> commit 5f074f3e192f ("lib/string.c: implement a basic bcmp")
> in favor of -fno-builtin-bcmp. Remove the additional definition here,
> too.
> 
> arch/x86/purgatory/Makefile uses -ffreestanding, so there's no risk of
> this libcall optimization occurring for arch/x86/boot/purgatory.ro.
> 
> arch/x86/boot/Makefile resets KBUILD_CFLAGS, so make sure to reset this
> flag that was set for the top level Makefile.
> 
> Fixes: 4ce97317f41d ("x86/purgatory: Do not use __builtin_memcpy and __builtin_memset")
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  arch/x86/boot/Makefile | 1 +
>  arch/x86/boot/string.c | 8 --------
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/x86/boot/Makefile b/arch/x86/boot/Makefile
> index fe605205b4ce..ef7f15bfceab 100644
> --- a/arch/x86/boot/Makefile
> +++ b/arch/x86/boot/Makefile
> @@ -70,6 +70,7 @@ KBUILD_CFLAGS	:= $(REALMODE_CFLAGS) -D_SETUP
>  KBUILD_AFLAGS	:= $(KBUILD_CFLAGS) -D__ASSEMBLY__
>  KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
>  KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables
> +KBUILD_CFLAGS	+= -fno-builtin-bcmp
>  GCOV_PROFILE := n
>  UBSAN_SANITIZE := n
>  

This should be unnecessary: KBUILD_CFLAGS in arch/x86/boot/Makefile is
set to REALMODE_CFLAGS (defined in arch/x86/Makefile), which includes
-ffreestanding.
