Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECCB4A79D2
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Feb 2022 21:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347289AbiBBU4D (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Feb 2022 15:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbiBBU4D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Feb 2022 15:56:03 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DA4BC06173D
        for <linux-kbuild@vger.kernel.org>; Wed,  2 Feb 2022 12:56:03 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id z10-20020a17090acb0a00b001b520826011so7969145pjt.5
        for <linux-kbuild@vger.kernel.org>; Wed, 02 Feb 2022 12:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MOwEsZXX1JZ92aEsSTA+4bQ9fwXO7uqj6443Uicqb0=;
        b=Mb5OwFKvf8tT0DvmVkSF03zpcm3XzqSHtUtuMB8JAyioHdfW8f1uw1h2J6Oi+HuZLb
         3LH+5wQkRmNadqvUPytAJvY42l3NtWc5K9Qh9vU1oRYmBEQ2jlHROGDTkZ7g2fyV3Rvv
         xhWjglkXHBLAiS2L/bD5rGfl/Mrf6dN2i0eFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MOwEsZXX1JZ92aEsSTA+4bQ9fwXO7uqj6443Uicqb0=;
        b=4AG+UBlWLX2nMM5Vbbz1F4G0iiAgSEJnmD/Dm4QtnPD1MZxAIqC4opsEZYo2/g+CNR
         nci7rwN9NQZvtC54qgWwhKTVjRCjyu+St+e9T+JP5TtN25eYcsPZJlm7AQvQSU+8wsGD
         gHCg6Hm6pcP8mb0jRw1NtLQZWruT1WLk1eUtM+Wg5mYnKL3kleNQCbxL1jAExIwFJqX4
         zPf6eQddt/FToXjRLcbeV9WCcIVKFVXOFjg8FxuV5Z55pa3pFvk41OabSjwNdBcJav8v
         RQQ7fexSB+84qSkpo2MfVuA0RYyYUTRsmKq6mtCNd7eWtqgADW2uMC7I4yD8h27XlJ4c
         2XKg==
X-Gm-Message-State: AOAM530T0j7yok6MECaJIUmm+LQL0x12WI7RGm2fi+bxnSvVvCV50duZ
        /P9rdUkHE0/AeUKww5NyZuvM7Q==
X-Google-Smtp-Source: ABdhPJyfeZdi8A1JowZl63xE7cjRteRe2f/EQsWsDnneOxd/1gPZEhtH8tPe/EVOXmca0ssZNZc69w==
X-Received: by 2002:a17:90a:548:: with SMTP id h8mr10099210pjf.109.1643835362724;
        Wed, 02 Feb 2022 12:56:02 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a14sm28023672pfv.212.2022.02.02.12.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 12:56:02 -0800 (PST)
Date:   Wed, 2 Feb 2022 12:56:01 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
Subject: Re: [PATCH 4/5] Makefile: Enable -Warray-bounds
Message-ID: <202202021254.5A1FD4FFBF@keescook>
References: <20210818081118.1667663-1-keescook@chromium.org>
 <20210818081118.1667663-5-keescook@chromium.org>
 <20220202160903.GA2337834@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220202160903.GA2337834@roeck-us.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 02, 2022 at 08:09:03AM -0800, Guenter Roeck wrote:
> On Wed, Aug 18, 2021 at 01:11:17AM -0700, Kees Cook wrote:
> > With the recent fixes for flexible arrays and expanded FORTIFY_SOURCE
> > coverage, it is now possible to enable -Warray-bounds. Since both
> > GCC and Clang include -Warray-bounds in -Wall, we just need to stop
> > disabling it.
> > 
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Co-developed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Makefile | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index a4aca01a4835..af22b83cede7 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1072,7 +1072,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
> >  
> >  # We'll want to enable this eventually, but it's not going away for 5.7 at least
> >  KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
> > -KBUILD_CFLAGS += -Wno-array-bounds
> >  KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
> >  
> >  # Another good warning that we'll want to enable eventually
> 
> alpha:defconfig:
> 
> In function '__memset',
>     inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
> In function '__memset',
>     inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
> ./arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>    37 |                         return __builtin_memset(s, c, n);

Thanks! I'll take a look. Every instance of the "[0, 0]" bounds means
the compiler believes there's a way for the destination to be determined
at compile-time to be NULL.

> xtensa:allmodconfig:
> --------------
> Error log:
> In file included from include/linux/uaccess.h:11,
>                  from include/linux/sched/task.h:11,
>                  from arch/xtensa/kernel/process.c:21:
> arch/xtensa/kernel/process.c: In function 'copy_thread':
> arch/xtensa/kernel/process.c:262:52: error: array subscript 53 is above array bounds of 'long unsigned int[16]'

I assume this is a weird cast. I will also check this one out.

Thanks!

-- 
Kees Cook
