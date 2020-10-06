Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264542845BC
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Oct 2020 08:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgJFGBs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Oct 2020 02:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgJFGBs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Oct 2020 02:01:48 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D73CC0613A7
        for <linux-kbuild@vger.kernel.org>; Mon,  5 Oct 2020 23:01:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id j8so1084406pjy.5
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Oct 2020 23:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BXyFah0M1LT/tl5rtZLB+bxtBhQm6vlhUicSg4mgrDQ=;
        b=i7jY2Ub8O4E9K5Uy2G0aoxmbLQOHzuk/xBVomiMp12FFKTjg3+9qTj5PxCMyyYHXXX
         zwAw4LfEFBA71A9Zff5encg5+n1PCd1YRVUcCqKAGUvsg6eEBLYYvU1N5bxjwC6VCgmG
         13Z8BICaPxVomWnc6imPzaYRvOfE+MM5x/CI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BXyFah0M1LT/tl5rtZLB+bxtBhQm6vlhUicSg4mgrDQ=;
        b=e8snE5sObuCZdiJwa4EuMIjnpZeldVGnmXB3ZHPe9cP8n+pU82bqyU0lS15pMSQYu+
         q4FusC0BhIbLH5AwoBcxQm3XJsQvTgI8P0OSUJzZoOgRntEmdGW5goH7jQF9m0S++faK
         31LsCgkh23DO4g3lwN6RXzE0Mw/jBlZzdwlQGPi56sCpxi9jh89MGisPlokYDlvF1nlx
         C8iirzvBcSHYmP0IBo7dgZRktjs0nKw1tSkeXMJ4T/51wN6Iqav1YRiH0Kg4/ny5nSMD
         0+UY03OrRarOdXqdyrm6jiiNrFI8Hmp02OeWeXF4ju9zZ2LWefGShsPV6gWX853PX0X2
         mjrA==
X-Gm-Message-State: AOAM530hMFTDVcukDKjTxCT3p5qL7aLCOegaKLX27pPNLzJ89WVQwii2
        XGAlK+f0OW4dBHrMvthtVQsRQw==
X-Google-Smtp-Source: ABdhPJyrC+5WoAylplQ4k13T2QFC5W3m5sU9r2cx3dLVztKhLdvY0R60Htd0Phr92a+jRZCNEaKAfg==
X-Received: by 2002:a17:902:9008:b029:d3:b4d2:9a2 with SMTP id a8-20020a1709029008b02900d3b4d209a2mr1824586plp.15.1601964107582;
        Mon, 05 Oct 2020 23:01:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id h2sm2060779pfk.90.2020.10.05.23.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 23:01:45 -0700 (PDT)
Date:   Mon, 5 Oct 2020 23:01:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marco Elver <elver@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        George Popescu <georgepope@android.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] ubsan: Move cc-option tests into Kconfig
Message-ID: <202010052258.96765BC83@keescook>
References: <20201002221527.177500-1-keescook@chromium.org>
 <20201002221527.177500-2-keescook@chromium.org>
 <20201004070847.GA1650@Ryzen-9-3900X.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201004070847.GA1650@Ryzen-9-3900X.localdomain>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 04, 2020 at 12:08:47AM -0700, Nathan Chancellor wrote:
> On Fri, Oct 02, 2020 at 03:15:24PM -0700, Kees Cook wrote:
> > Instead of doing if/endif blocks with cc-option calls in the UBSAN
> > Makefile, move all the tests into Kconfig and use the Makefile to
> > collect the results.
> > 
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > Link: https://lore.kernel.org/lkml/CAHk-=wjPasyJrDuwDnpHJS2TuQfExwe=px-SzLeN8GFMAQJPmQ@mail.gmail.com/
> 
> I tested menuconfig to make sure all the flags when CONFIG_UBSAN_MISC is
> flipped.
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>

Awesome, thank you!

> One comment below.
> 
> > [...]
> > diff --git a/scripts/Makefile.ubsan b/scripts/Makefile.ubsan
> > index 9716dab06bc7..72862da47baf 100644
> > --- a/scripts/Makefile.ubsan
> > +++ b/scripts/Makefile.ubsan
> > @@ -1,37 +1,21 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > -export CFLAGS_UBSAN :=
> > +# -fsanitize=* options makes GCC less smart than usual and
> > +# increases the number of 'maybe-uninitialized' false-positives.
> > +ubsan-cflags-$(CONFIG_UBSAN) += $(call cc-disable-warning, maybe-uninitialized)
> 
> Is this just to force -Wno-maybe-uninitialized even when W=2?
> -Wmaybe-uninitialized is already disabled globally after
> commit 78a5255ffb6a ("Stop the ad-hoc games with
> -Wno-maybe-initialized"). I feel like it might be worth a comment in
> case that changes in the future but maybe that is a bit much.
> 
> > [...]
> > -      # -fsanitize=* options makes GCC less smart than usual and
> > -      # increase number of 'maybe-uninitialized false-positives
> > -      CFLAGS_UBSAN += $(call cc-option, -Wno-maybe-uninitialized)

It's just a direct copying of the existing logic, but into the new
"ubsan-cflags-y" style. But yes, AFAICT, that was the intent when it was
added in commit a76bcf557ef4 ("Kbuild: enable -Wmaybe-uninitialized
warning for "make W=1"").

So for this patch, I kept the logic as it was.

-- 
Kees Cook
