Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6589B4236C8
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Oct 2021 05:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbhJFEAY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 Oct 2021 00:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbhJFEAT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Oct 2021 00:00:19 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46B2BC08C5C0
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 20:56:46 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id m21so1225433pgu.13
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 20:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b84QyZzxdfWttrk72IQ61VKUmWrKjM777rszm24bGaM=;
        b=LURrqYKe8uPYHzUH11ppbTUR0uO0Bztb64979rnO6hUW73LrpVFSwWuNCl1NDlCDVZ
         Iytf4MzDURalEMfX8EvXzSF7Ab5BUKCl7UcOuTJdrmn4IL65AkFew6NB6iagqN/XzZ0Y
         C+9VMTGMKbmk+/Su+diio1PMQLNQ0YGZiwpNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b84QyZzxdfWttrk72IQ61VKUmWrKjM777rszm24bGaM=;
        b=K5kyVOIqxo1fdNepSo8C631rVAwMHcv9Awxda8xgCNMFSjQoLVYxkdIPDb3uxWSWxP
         NM77qkmlu1a+7hsjndbyaLGtOR+fWDfEab7uSMAlrB8+0QrADOaPH/uON1EiUUibs10o
         B6uz8M1GDY0CSbqiWv/dB9QnFiIYhIz8kiQcwg7D05HBF+ijs7tgbBBDLJ2C3obkbRB5
         sLKzT03kEx9MO9MgcwBYPR5X/XQqfYCsNHblNJY+BUq7vfWR+MLyyxzLsdsK8oHASlY1
         ombzv0YfBInnLDvEWXZ3gPrqBefZZ5RPvBF8S4oARPfYoNVR9uQP5J93buD5pxKxF8rX
         baeA==
X-Gm-Message-State: AOAM533R/qmPqXkdYfm31OwMsj220qDOkX8xahONUfUR1Uyno1PK1r7O
        6hM0oJh7ujNXylU/RQfVt0rBOg==
X-Google-Smtp-Source: ABdhPJxY0xeG5xlVDooWwmTdv3QhIZVaLpcWEFnuLL4tOLEdHX4A7rjnWkeJWxZVz6fUPOx3FAmCuw==
X-Received: by 2002:aa7:9209:0:b0:44b:e5d4:d8cb with SMTP id 9-20020aa79209000000b0044be5d4d8cbmr34958352pfo.65.1633492605823;
        Tue, 05 Oct 2021 20:56:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z23sm19421948pgv.45.2021.10.05.20.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 20:56:45 -0700 (PDT)
Date:   Tue, 5 Oct 2021 20:56:44 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jann Horn <jannh@google.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Andy Whitcroft <apw@canonical.com>,
        Dennis Zhou <dennis@kernel.org>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Joe Perches <joe@perches.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tejun Heo <tj@kernel.org>,
        Daniel Micay <danielmicay@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 4/8] slab: Add __alloc_size attributes for better
 bounds checking
Message-ID: <202110052056.F09CD8A@keescook>
References: <20210930222704.2631604-1-keescook@chromium.org>
 <20210930222704.2631604-5-keescook@chromium.org>
 <20211005184717.65c6d8eb39350395e387b71f@linux-foundation.org>
 <202110052002.34E998B@keescook>
 <CAG48ez19raco+s+UF8eiXqTvaDEoMAo6_qmW2KdO24QDpmZpFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG48ez19raco+s+UF8eiXqTvaDEoMAo6_qmW2KdO24QDpmZpFQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 06, 2021 at 05:22:06AM +0200, Jann Horn wrote:
> On Wed, Oct 6, 2021 at 5:06 AM Kees Cook <keescook@chromium.org> wrote:
> > On Tue, Oct 05, 2021 at 06:47:17PM -0700, Andrew Morton wrote:
> > > On Thu, 30 Sep 2021 15:27:00 -0700 Kees Cook <keescook@chromium.org> wrote:
> > >
> > > > As already done in GrapheneOS, add the __alloc_size attribute for regular
> > > > kmalloc interfaces, to provide additional hinting for better bounds
> > > > checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> > > > optimizations.
> > >
> > > x86_64 allmodconfig:
> >
> > What compiler and version?
> >
> > >
> > > In file included from ./arch/x86/include/asm/preempt.h:7,
> > >                  from ./include/linux/preempt.h:78,
> > >                  from ./include/linux/spinlock.h:55,
> > >                  from ./include/linux/mmzone.h:8,
> > >                  from ./include/linux/gfp.h:6,
> > >                  from ./include/linux/mm.h:10,
> > >                  from ./include/linux/mman.h:5,
> > >                  from lib/test_kasan_module.c:10:
> > > In function 'check_copy_size',
> > >     inlined from 'copy_user_test' at ./include/linux/uaccess.h:191:6:
> > > ./include/linux/thread_info.h:213:4: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
> > >   213 |    __bad_copy_to();
> > >       |    ^~~~~~~~~~~~~~~
> > > In function 'check_copy_size',
> > >     inlined from 'copy_user_test' at ./include/linux/uaccess.h:199:6:
> > > ./include/linux/thread_info.h:211:4: error: call to '__bad_copy_from' declared with attribute error: copy source size is too small
> > >   211 |    __bad_copy_from();
> > >       |    ^~~~~~~~~~~~~~~~~
> > > make[1]: *** [lib/test_kasan_module.o] Error 1
> > > make: *** [lib] Error 2
> >
> > Hah, yes, it caught an intentionally bad copy. This may bypass the
> > check, as I've had to do in LKDTM before. I will test...
> >
> > diff --git a/lib/test_kasan_module.c b/lib/test_kasan_module.c
> > index 7ebf433edef3..9fb2fb2937da 100644
> > --- a/lib/test_kasan_module.c
> > +++ b/lib/test_kasan_module.c
> > @@ -19,7 +19,12 @@ static noinline void __init copy_user_test(void)
> >  {
> >         char *kmem;
> >         char __user *usermem;
> > -       size_t size = 128 - KASAN_GRANULE_SIZE;
> > +       /*
> > +        * This is marked volatile to avoid __alloc_size()
> > +        * noticing the intentionally out-of-bounds copys
> > +        * being done on the allocation.
> > +        */
> > +       volatile size_t size = 128 - KASAN_GRANULE_SIZE;
> 
> Maybe OPTIMIZER_HIDE_VAR()? The normal version of that abuses an empty
> asm statement to hide the value from the compiler.

Oh! I hadn't seen that before. Is that better than volatile in this
case?

-- 
Kees Cook
