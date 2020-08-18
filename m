Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6172490BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 00:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgHRWZt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 18:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgHRWZr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 18:25:47 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5407C061389;
        Tue, 18 Aug 2020 15:25:46 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id m7so19856435qki.12;
        Tue, 18 Aug 2020 15:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=E0QpYwyGeyQNgnfTu+fVlzDEmX7vUQ4dpPBQoUXRMU8=;
        b=LiDJx6Af77Yfx/KOJmUbrwaOM0pjIOPBgSqafLu8msU038FAz1lgQYc13goXLwmnGS
         PRtWZSoyuxX8ADBJiQEXDfMZyJQXOw5Iwbftk1JCbDvAomejgCwxZZvAE62+LiITbHu3
         MY96GJbmo65Am2iPZd7VO7O49qkMLI7/b2XVyW3ZFn31Wc8UWMOGM6Bkv2YY5Yy2kclL
         VEKepqX2qE4CtFkYWF9ckJJLreQiFKQmyQqAd/i0wq3063wbn/tjrL1+Q8aOtQa0Jz/9
         AT5MwDuglFViEJBhhwATLWA20UY7zdcCmqn9fFMdSZ4BlCdKWp54f0SEP5EBCGcjoCYQ
         Yv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=E0QpYwyGeyQNgnfTu+fVlzDEmX7vUQ4dpPBQoUXRMU8=;
        b=MXU4yDIijzUdOE3/H8gYphdlBjSbnNlpNRzvbe85hLgQDZRo+kDgLKVtGYo2UBqdRl
         a+susrLNtZk41NxBTAR+AfJ8Rge/Ypj9fKd81FOfN4EVpoI8E7PRLRicn8/HjIaiIsmG
         RCSLN+vfj239MJikM6E/UEjjJMobgrHIHzssqF0xcnTcWlT3z/hv/mn837M72zP2EcUC
         S9cnAPu66l2MJy+s8Yth9F4Y2Rv81zZGcpx5ynscPygzq8hkvr9wkqlKm5dMzg0aVeV5
         Qjx9zqPAEPw85lh2egMwKcXReo3va87ElD1Esj71I8SDL3tHdrfMQ8SYG2/CDkhmxFsS
         KSKQ==
X-Gm-Message-State: AOAM530p1uRvB5Xmn4d96bTqcxZxQZWbETlId144Ef7+mREfKXbw0kT0
        BfNePpia20eBmrjVuO8cVEw=
X-Google-Smtp-Source: ABdhPJz1BvS1mecTszCrz26nQmYNf0KrJygAksbrsrMDxgHR0Qb2LBxMo9Ydj9TwYEngt+9ARsmIhQ==
X-Received: by 2002:a05:620a:b8d:: with SMTP id k13mr19606873qkh.450.1597789545799;
        Tue, 18 Aug 2020 15:25:45 -0700 (PDT)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id d196sm22358541qkg.96.2020.08.18.15.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 15:25:45 -0700 (PDT)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 18 Aug 2020 18:25:42 -0400
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
Subject: Re: [PATCH 0/4] -ffreestanding/-fno-builtin-* patches
Message-ID: <20200818222542.GA3254379@rani.riverdale.lan>
References: <20200817220212.338670-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200817220212.338670-1-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 17, 2020 at 03:02:08PM -0700, Nick Desaulniers wrote:
> -ffreestanding typically inhibits "libcall optimizations" where calls to
> certain library functions can be replaced by the compiler in certain
> cases to calls to other library functions that may be more efficient.
> This can be problematic for embedded targets that don't provide full
> libc implementations.
> 
> -ffreestanding inhibits all such optimizations, which is the safe
> choice, but generally we want the optimizations that are performed. The
> Linux kernel does implement a fair amount of libc routines. Instead of
> -ffreestanding (which makes more sense in smaller images like kexec's
> purgatory image), prefer -fno-builtin-* flags to disable the compiler
> from emitting calls to functions which may not be defined.
> 
> If you see a linkage failure due to a missing symbol that's typically
> defined in a libc, and not explicitly called from the source code, then
> the compiler may have done such a transform.  You can either implement
> such a function (ie. in lib/string.c) or disable the transform outright
> via -fno-builtin-* flag (where * is the name of the library routine, ie.
> -fno-builtin-bcmp).
> 
> Patch 1 unbreaks the build with ToT clang, which has been red all
> weekend, by adding -fno-builtin-stpcpy.
> Patch 2 is a revert but adds -fno-builtin-bcmp.
> Patch 3 does the same for x86 purgatory.
> Patch 4 removes -ffreestanding from i386.
> 
> The first patch makes sense for Kbuild, the second maybe akpm@, the
> third and forth for x86.  Not sure who should pick up the series (they
> can be merged out of order, technically) but I really need the first
> patch soon. The 3 latter patches are cleanups.
> 
> Nick Desaulniers (4):
>   Makefile: add -fno-builtin-stpcpy
>   Revert "lib/string.c: implement a basic bcmp"
>   x86/boot: use -fno-builtin-bcmp
>   x86: don't build CONFIG_X86_32 as -ffreestanding
> 
>  Makefile               |  7 +++++++
>  arch/x86/Makefile      |  3 ---
>  arch/x86/boot/Makefile |  1 +
>  arch/x86/boot/string.c |  8 --------
>  include/linux/string.h |  3 ---
>  lib/string.c           | 20 --------------------
>  6 files changed, 8 insertions(+), 34 deletions(-)
> 
> -- 
> 2.28.0.220.ged08abb693-goog
> 

Another thing that needs to be fixed is that at least lib/string.c needs
to be compiled with -ffreestanding.

gcc-10 optimizes the generic memset implementation in there into a call
to memset. Now that's on x86 which doesn't use the generic
implementation, but this is just waiting to bite us.

https://godbolt.org/z/6EhG15
