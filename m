Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB6C247DFC
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Aug 2020 07:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726588AbgHRFod (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Aug 2020 01:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726228AbgHRFod (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Aug 2020 01:44:33 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49683C061389;
        Mon, 17 Aug 2020 22:44:31 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id m7so17224575qki.12;
        Mon, 17 Aug 2020 22:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QntzPrOLLfJzsd4iLjQzQgU+MiMIJO0uA0wns6X4c7E=;
        b=eL7dtsSMDWjrZxIuwHIPBo3xk60D7EtZRCBpQNsZqEUQOk0cIiE9DztISG54k/kQHj
         7qhLA66zMTr/eGlkShLIvRH4WQdsVwY2purFz2BTUsc7246BAgb0ISXC/mu/LfdqPvqo
         JH2yYRUoufiZNiq6h5Pu/EKAlL8GLXqy4R69udndLq4gxu11Lb83xsuSEwDYyQW6zaUb
         o7RmoLz0mtB+yNAV++PqOQG5zJiwHFMrF7i+W0lN/OhWHE+cEFU7vaok04IP7gwOimTJ
         92jldJojQt45UW27pUrLyyk6xjP5VyOiX9UgZEJoUk9r6EvUcgdWgnH4EYmM41U8TJTO
         uOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QntzPrOLLfJzsd4iLjQzQgU+MiMIJO0uA0wns6X4c7E=;
        b=cAYQs9Lt3N93F/lWoP1s5Rt9fdBhtTnlwzplBOj1cHbicBTndcldhNRI7GYmG2KDPS
         Q+kFRr0DxHfT3k8AhPW8EZGT1lTeINPXklmu5si9dRUDbHV+kKvZeeqV/isqttUKuuNJ
         yMEqrteG9lWbm11AG+U48nDGeiOgQMsOC5U4M1iYGc26AxOtIp/TSy49tV9PyVeUhxak
         Z7NgRxW6M2Xash8C7YvSIH+z+6MfKhpt3LNcUjWjrbjHLBtvV1mOtxbVntpKNuADv3b4
         kzjKlXblxqRphVHavCP7zIAT6WBLwqvYip4bpFdxUw2W+EwU1r/ZxinMPhOj4DsvXF2F
         PyoA==
X-Gm-Message-State: AOAM533E5HE1SMBEFi+lMpUKxQQulzWTdUECBYgjt4fgKcnzEgLbxWP+
        /Hns1IvtuWgLVnq+f1D/E2o=
X-Google-Smtp-Source: ABdhPJy9kXKHV7x0YjcquAFP2t6zaotOsmnqnzEy1FUZph04XGpTnQfSXqiTbGVrkaBrdeywxlMtgg==
X-Received: by 2002:a37:61ce:: with SMTP id v197mr16077683qkb.44.1597729470594;
        Mon, 17 Aug 2020 22:44:30 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id i20sm19279855qka.17.2020.08.17.22.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 22:44:29 -0700 (PDT)
Date:   Mon, 17 Aug 2020 22:44:28 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
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
        =?iso-8859-1?Q?D=E1vid_Bolvansk=FD?= <david.bolvansky@gmail.com>,
        Eli Friedman <efriedma@quicinc.com>
Subject: Re: [PATCH 2/4] Revert "lib/string.c: implement a basic bcmp"
Message-ID: <20200818054428.GA2540870@ubuntu-n2-xlarge-x86>
References: <20200817220212.338670-1-ndesaulniers@google.com>
 <20200817220212.338670-3-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200817220212.338670-3-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 17, 2020 at 03:02:10PM -0700, Nick Desaulniers wrote:
> This reverts commit 5f074f3e192f10c9fade898b9b3b8812e3d83342.
> 
> Use `-fno-builtin-bcmp` instead.
> 
> The issue with using `-fno-builtin-*` flags was that they were not
> retained during an LTO link with LLVM.  This was fixed in clang-11 by
> https://reviews.llvm.org/D71193
> (0508c994f0b14144041f2cfd3ba9f9a80f03de08), which is also the minimum
> supported version of clang for LTO.
> 
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
>  Makefile               |  1 +
>  include/linux/string.h |  3 ---
>  lib/string.c           | 20 --------------------
>  3 files changed, 1 insertion(+), 23 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 211a1b6f6478..722ff5864275 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -964,6 +964,7 @@ endif
>  # to provide implementations of these routines, then prevent the compiler from
>  # emitting calls to what will be undefined symbols.
>  KBUILD_CFLAGS	+= -fno-builtin-stpcpy
> +KBUILD_CFLAGS	+= -fno-builtin-bcmp

I personally think that this hunk should be its own patch before this
one then have this patch just be the revert, that way there is no
regression across a bisect (if one were to ever occur) and so the revert
is a straight 'git revert', rather than have something else mixed in
that requires reading the actual changelog text.

No objections if you disagree though.

>  # include additional Makefiles when needed
>  include-y			:= scripts/Makefile.extrawarn
> diff --git a/include/linux/string.h b/include/linux/string.h
> index b1f3894a0a3e..f3bdb74bc230 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -155,9 +155,6 @@ extern void * memscan(void *,int,__kernel_size_t);
>  #ifndef __HAVE_ARCH_MEMCMP
>  extern int memcmp(const void *,const void *,__kernel_size_t);
>  #endif
> -#ifndef __HAVE_ARCH_BCMP
> -extern int bcmp(const void *,const void *,__kernel_size_t);
> -#endif
>  #ifndef __HAVE_ARCH_MEMCHR
>  extern void * memchr(const void *,int,__kernel_size_t);
>  #endif
> diff --git a/lib/string.c b/lib/string.c
> index 6012c385fb31..69328b8353e1 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -922,26 +922,6 @@ __visible int memcmp(const void *cs, const void *ct, size_t count)
>  EXPORT_SYMBOL(memcmp);
>  #endif
>  
> -#ifndef __HAVE_ARCH_BCMP
> -/**
> - * bcmp - returns 0 if and only if the buffers have identical contents.
> - * @a: pointer to first buffer.
> - * @b: pointer to second buffer.
> - * @len: size of buffers.
> - *
> - * The sign or magnitude of a non-zero return value has no particular
> - * meaning, and architectures may implement their own more efficient bcmp(). So
> - * while this particular implementation is a simple (tail) call to memcmp, do
> - * not rely on anything but whether the return value is zero or non-zero.
> - */
> -#undef bcmp
> -int bcmp(const void *a, const void *b, size_t len)
> -{
> -	return memcmp(a, b, len);
> -}
> -EXPORT_SYMBOL(bcmp);
> -#endif
> -
>  #ifndef __HAVE_ARCH_MEMSCAN
>  /**
>   * memscan - Find a character in an area of memory.
> -- 
> 2.28.0.220.ged08abb693-goog
> 

Cheers,
Nathan
