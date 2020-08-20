Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFB824AD5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Aug 2020 05:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgHTDeX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 23:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHTDeW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 23:34:22 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CA1C061757;
        Wed, 19 Aug 2020 20:34:22 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 2so469783qkf.10;
        Wed, 19 Aug 2020 20:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rR24exBfQVkWtacavopzrmH6PxpvBA+Nf0yqd/BMG9E=;
        b=HJ9D3ITYMCvLAArz8DK8SGV59PkSSo29GqCB9Z9SJ6XraYNdLynVE691bcdGgMSDDN
         hxxLdJyCMuzmbOtjTKDRoGlRqt5vH8x39y2B/Se5AyD93apZP7ce4Qyj85d70i/cEkPy
         4IGmJneYPp0H3t+8UkWhwm6xBijIPn/+5zXLaIpW+DQ3qtlgGSwpjbSca8L5hWoVnI5y
         tl8EqNvSJjKx5W78/Sc1N9SDbg94vSZB0kJrpSH9onIdKswBLq5kEqaaptNxGhlvf0BB
         JuX1RPN/Uc7YH85ejg34Y6LPup/+D1xOGXN9TKU1uRuZDMq9wtYHZ/Z4M8ySdAvFaOIV
         oyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rR24exBfQVkWtacavopzrmH6PxpvBA+Nf0yqd/BMG9E=;
        b=EhjHwQ4WapOefVFIOO6YkLAFyzzoRtbIsoXrQYRAD/dh84BjkKigcnMByfC6h6vB6+
         prIF8KQb9L0s85X+wStnrilq3iCxSBvT1lPvbp0Dj+d54gKdbzWZLajCcJD5xtmkzdji
         HseqP71Yt/buLgqlho/2rl97IegJSqXwVwyaDlRqoSdAiOtfxP2wwtLsDeN/OF89cSI1
         fZFv7DpnyWOxVgf8J73u1+zQ3EoBfNqQHTrELOY3vX3yFfPxB+rw6M3pw6Sltk/MbC3P
         qFjmlg7/yd+aJg8FAZBTjgoYM4MwpG7CLKFI91ZSlezz9QrTka77uyOM8fy4DYQwjjNn
         O37A==
X-Gm-Message-State: AOAM53039z9XcU8D/rwe4orq/ky/6/N0QY1ufdz6/5T31FZYsZAZ9MhM
        86Zhx3Zw892zl4SA/X3kW0Q=
X-Google-Smtp-Source: ABdhPJzic2ynnUlv8fsvPVT9UW/uNizR8J71CrvkvSNpOU+Ea0IlZKCor7tcjK61capu5RqbLNkjpw==
X-Received: by 2002:a37:62cf:: with SMTP id w198mr1047965qkb.172.1597894461585;
        Wed, 19 Aug 2020 20:34:21 -0700 (PDT)
Received: from ubuntu-n2-xlarge-x86 ([2604:1380:45d1:2600::1])
        by smtp.gmail.com with ESMTPSA id o47sm1545390qtk.19.2020.08.19.20.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 20:34:20 -0700 (PDT)
Date:   Wed, 19 Aug 2020 20:34:19 -0700
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
Subject: Re: [PATCH v2 3/5] Revert "lib/string.c: implement a basic bcmp"
Message-ID: <20200820033419.GC2167124@ubuntu-n2-xlarge-x86>
References: <20200819191654.1130563-1-ndesaulniers@google.com>
 <20200819191654.1130563-4-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819191654.1130563-4-ndesaulniers@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 19, 2020 at 12:16:52PM -0700, Nick Desaulniers wrote:
> This reverts commit 5f074f3e192f10c9fade898b9b3b8812e3d83342.
> 
> An earlier commit in the series prevents the compiler from emitting
> calls to bcmp as part of "libcall optimization," and there are no
> explicit callers, so we can now safely remove this interface.
> 
> Suggested-by: Nathan Chancellor <natechancellor@gmail.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

> ---
>  include/linux/string.h |  3 ---
>  lib/string.c           | 20 --------------------
>  2 files changed, 23 deletions(-)
> 
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
> 2.28.0.297.g1956fa8f8d-goog
> 
