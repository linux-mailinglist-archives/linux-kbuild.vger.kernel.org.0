Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9A73FF8B2
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 03:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbhICBuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 21:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232902AbhICBuP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 21:50:15 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E5DC061757
        for <linux-kbuild@vger.kernel.org>; Thu,  2 Sep 2021 18:49:10 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so2790524pjc.3
        for <linux-kbuild@vger.kernel.org>; Thu, 02 Sep 2021 18:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OLp//nfnQVqKYRvh8OZNt358NVX3SdBTMM+ZOiaxVfg=;
        b=icoXZUReGTQ7lEr9cZ0I26LxdVGqZ54aSk+xBU5w2nnNMD493KzB0Yz2198DRG9PBo
         DHkvxfesmBKcjCbYi2+kN4/qJLp6VhNwBR8V0X3VKTNJcY18e2XEnVwqzWYonmxSQ8jb
         spI/14REaZ1AjL532LRncW7QaNRhYJlaJjQ9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OLp//nfnQVqKYRvh8OZNt358NVX3SdBTMM+ZOiaxVfg=;
        b=AfHOHIm0FwHMO6pc6+5kDsERGqcx9RueN4UJHqC5wv9p97vJWLKLWCsYiyX7XG2R3E
         hsSuxp1ALvXRcku0rT9K4EUqNrnIFwLEhtGhlRv6LX8MSmK4xFLtsxsCDRe6JYqCYwts
         thD9H3W/UxOXD3nLqcK2EmjWRSm6V0en7P7Eb3grX9cOi32eDWdYrcliUFupGnBjJ+EX
         vAkI2TmssuMyqG6HsyNdtTQQyz4lQDFXKiohQX9vbsIzqsowVkU1t11/ISdqC9PZPlsZ
         Iox9sno4FBo53uwC4YpKuEbM4uZnvgwd51/voNwV13z3O3sgiJBfv9fCKENUP0uBOV3/
         1c4w==
X-Gm-Message-State: AOAM531A8eZ68Qj0m96tU6w1aNG05Xl81A0S+iS8pfwgkn4edhHw8Sqd
        +yRZcizZvfn9yyF55cMkbZnV+A==
X-Google-Smtp-Source: ABdhPJyWLWaXLTttMAZByvv5dedUtS0gJxKHWvs9CYHdcMGWAQcn6BoBGdRMJ44GpU1GtC93XwL//w==
X-Received: by 2002:a17:90a:4148:: with SMTP id m8mr1088901pjg.185.1630633748778;
        Thu, 02 Sep 2021 18:49:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n24sm3909040pgv.60.2021.09.02.18.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 18:49:08 -0700 (PDT)
Date:   Thu, 2 Sep 2021 18:49:07 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 06/13] kbuild: reuse $(cmd_objtool) for
 cmd_cc_lto_link_modules
Message-ID: <202109021848.48ED7384C@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-7-masahiroy@kernel.org>
 <202108311034.D4B1410@keescook>
 <CAK7LNATkducKiw8==u4477JGfyb5vnvbp2gM2s9ndZ_8owXfeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNATkducKiw8==u4477JGfyb5vnvbp2gM2s9ndZ_8owXfeg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 03, 2021 at 09:39:14AM +0900, Masahiro Yamada wrote:
> On Wed, Sep 1, 2021 at 2:35 AM Kees Cook <keescook@chromium.org> wrote:
> >
> > On Tue, Aug 31, 2021 at 04:39:57PM +0900, Masahiro Yamada wrote:
> > > For CONFIG_LTO_CLANG=y, the objtool processing is not possible at the
> > > compilation, hence postponed by the link time.
> > >
> > > Reuse $(cmd_objtool) for CONFIG_LTO_CLANG=y by defining objtool-enabled
> > > properly.
> > >
> > > For CONFIG_LTO_CLANG=y:
> > >
> > >   objtool-enabled is off for %.o compilation
> > >   objtool-enabled is on  for %.lto link
> > >
> > > For CONFIG_LTO_CLANG=n:
> > >
> > >   objtool-enabled is on for %.o compilation
> > >       (but, it depends on OBJECT_FILE_NON_STANDARD)
> > >
> > > Set part-of-module := y for %.lto.o to avoid repeating --module.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > > ---
> > >
> > >  scripts/Makefile.build | 28 +++++++++++++++++-----------
> > >  1 file changed, 17 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> > > index 21b55f37a23f..afc906cd7256 100644
> > > --- a/scripts/Makefile.build
> > > +++ b/scripts/Makefile.build
> > > @@ -236,20 +236,26 @@ objtool_args =                                                          \
> > >       $(if $(CONFIG_X86_SMAP), --uaccess)                             \
> > >       $(if $(CONFIG_FTRACE_MCOUNT_USE_OBJTOOL), --mcount)
> > >
> > > -ifndef CONFIG_LTO_CLANG
> > > +cmd_objtool = $(if $(objtool-enabled), ; $(objtool) $(objtool_args) $@)
> > > +cmd_gen_objtooldep = $(if $(objtool-enabled), { echo ; echo '$@: $$(wildcard $(objtool))' ; } >> $(dot-target).cmd)
> > > +
> > > +endif # CONFIG_STACK_VALIDATION
> > > +
> > > +ifdef CONFIG_LTO_CLANG
> > > +
> > > +# Skip objtool for LLVM bitcode
> > > +$(obj)/%o: objtool-enabled :=
> >
> > Is this intentionally "%o" instead of "%.o"?
> 
> Good catch.
> 
> No, it is not intentional.
> 
> I will fix "%o" to "%.o"

Ah-ha, okay, excellent. :) With that:

Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks!

-Kees

> 
> 
> > (And it later overridden by the "%.lto.o" rule?
> 
> No, opposite.
> 
> While building %.lto.o, we want to set objtool-enabled.
> But, we want to cancel it for %.o
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 
> -- 
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNATkducKiw8%3D%3Du4477JGfyb5vnvbp2gM2s9ndZ_8owXfeg%40mail.gmail.com.

-- 
Kees Cook
