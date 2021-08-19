Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CACB93F1403
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 09:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231831AbhHSHGx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 03:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231766AbhHSHGv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 03:06:51 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4C4C061757
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 00:06:15 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q2so4984555pgt.6
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 00:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d24so6mNChjsewh7oprUNrIXD8v7FslbdYVxKPyqYXE=;
        b=DyLqmt9LUhYdSkTem3sk80Ub972E9Yc34wRhRboTlhx4Wi197NhVlo9UIczj48j3G/
         T8LhjLSvY9bLxUXt5J8rfqL9ww45Z/xfGnuHCc+vO85k9hAriU/EMv40HMdb9qspahzo
         S2EfzmOod7IkH20hhWfU+uUep+/Q/ov0rdSZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d24so6mNChjsewh7oprUNrIXD8v7FslbdYVxKPyqYXE=;
        b=LLQ8WbDMP2U0J490gJhP+7VCXRbKsOTGLf3/wWqOpHLLqUqY5J0fPfRhvICuaRxueT
         EQoFLqakzbCZr0pixYfofpjhoC2yyveuvkqoDQhRZXpwGS5K9w5bObNZyRPyPMMyad+m
         Wz598YfT4X1j7DmdWRe0RyCBgXtNk0YlWrPevjxaOYM9/4JTC4/oHuse9/cpscMBeNrk
         szt6kpYuPVXXW5Rc0Q7rAnDcmpCQ2ma/yBHoHMjTJBJ0Kbp47W/OU3CEHYh6kaC//u+U
         d5pMEZimNvJ/2c0HPTTdGxaW+zRhLuaWwsVErW4coxHMfS2N/BOLlv69/lptNshcU0En
         CM+g==
X-Gm-Message-State: AOAM532JLbOQeGEmGO1bpgXIhvl47Vmr1+GDzyrV25JsRRCwRQgL2eji
        K42jABWAbfscjwiNaikqcRj2xQ==
X-Google-Smtp-Source: ABdhPJx1+T7gxYGQvh03cW7Q6zygQHgK4Kd6rH9nkFHFAtaDVXPPqWIrIytEky+POIK2WoZyqkUhwg==
X-Received: by 2002:a05:6a00:1a4f:b0:3e2:1f86:3235 with SMTP id h15-20020a056a001a4f00b003e21f863235mr13086054pfv.26.1629356775079;
        Thu, 19 Aug 2021 00:06:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a8sm2027703pfo.79.2021.08.19.00.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 00:06:14 -0700 (PDT)
Date:   Thu, 19 Aug 2021 00:06:13 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com, Joe Perches <joe@perches.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/7] Compiler Attributes: Add __alloc_size() for
 better bounds checking
Message-ID: <202108190003.37FF2F1D7@keescook>
References: <20210818214021.2476230-1-keescook@chromium.org>
 <20210818214021.2476230-2-keescook@chromium.org>
 <20210818161912.f14722707e06de1f046e948d@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818161912.f14722707e06de1f046e948d@linux-foundation.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 04:19:12PM -0700, Andrew Morton wrote:
> On Wed, 18 Aug 2021 14:40:15 -0700 Kees Cook <keescook@chromium.org> wrote:
> 
> > GCC and Clang can use the "alloc_size" attribute to better inform the
> > results of __builtin_object_size() (for compile-time constant values).
> > Clang can additionally use alloc_size to inform the results of
> > __builtin_dynamic_object_size() (for run-time values).
> > 
> > Because GCC sees the frequent use of struct_size() as an allocator size
> > argument, and notices it can return SIZE_MAX (the overflow indication),
> > it complains about these call sites may overflow (since SIZE_MAX is
> > greater than the default -Walloc-size-larger-than=PTRDIFF_MAX). This
> > isn't helpful since we already know a SIZE_MAX will be caught at run-time
> > (this was an intentional design). Instead, just disable this check as
> > it is both a false positive and redundant. (Clang does not have this
> > warning option.)
> > 
> > ...
> >
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1078,9 +1078,13 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
> >  # Another good warning that we'll want to enable eventually
> >  KBUILD_CFLAGS += $(call cc-disable-warning, restrict)
> >  
> > -# Enabled with W=2, disabled by default as noisy
> >  ifdef CONFIG_CC_IS_GCC
> > +# Enabled with W=2, disabled by default as noisy
> >  KBUILD_CFLAGS += -Wno-maybe-uninitialized
> > +
> > +# The allocators already balk at large sizes, so silence the compiler
> > +# warnings for bounds checks involving those possible values.
> > +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
> >  endif
> >  
> >  # disable invalid "can't wrap" optimizations for signed / pointers
> 
> Makefile has changed.  I did this:
> 
> --- a/Makefile~compiler-attributes-add-__alloc_size-for-better-bounds-checking
> +++ a/Makefile
> @@ -1003,6 +1003,12 @@ KBUILD_CFLAGS += $(call cc-disable-warni
>  # Enabled with W=2, disabled by default as noisy
>  KBUILD_CFLAGS += $(call cc-disable-warning, maybe-uninitialized)
>  
> +ifdef CONFIG_CC_IS_GCC
> +# The allocators already balk at large sizes, so silence the compiler
> +# warnings for bounds checks involving those possible values.
> +KBUILD_CFLAGS += -Wno-alloc-size-larger-than
> +endif
> +
>  # disable invalid "can't wrap" optimizations for signed / pointers
>  KBUILD_CFLAGS	+= -fno-strict-overflow

Oh, er, where did "Makefile: remove stale cc-option checks" go? Ah, I
see now:
https://lore.kernel.org/mm-commits/20210814215814.W_qqW%25akpm@linux-foundation.org/T/#u

Looks like I just happened to pick the wrong linux-next. ;)

Thanks for the fix-up!

-- 
Kees Cook
