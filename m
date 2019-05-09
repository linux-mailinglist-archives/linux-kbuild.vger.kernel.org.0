Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7308D1892C
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 May 2019 13:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfEILkf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 May 2019 07:40:35 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:43205 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbfEILkf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 07:40:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id w33so1713948edb.10;
        Thu, 09 May 2019 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FSGip4z/KWPVhsGKvSPgIq1lTytmruK7XInlkHDILPQ=;
        b=G/utyUsDGRbuwFw0aoATcV1Xs4hDEh6HtyvdbaS9GevdPOcc3EAjTiEIo4dx+BuNnh
         TORxF4jXdIFxvm3gGPOAzvcHBEW61kVc5dAlLgTC8tBKh4NF1PPRjsezvGRiE68l8W03
         cuU6NvlzFHbZCnFcMqZWje++5pVuDqs8fbUAJ2TH6RhQrPrYG47lCUNWI1S0+hhA9b6H
         c11R/rKzyeXHQ/8SWLK1l2xo1/rvpL6rWyHRaMmjAu1tymoUB7udpUET1HOHzZ2bT4Y7
         SM1NMAyOCDdSwPaGeNRl4ziFQf9NsD3T0y4cAL2F6ttfXfnXmt255lONKHwVGTA1ItJu
         8H6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FSGip4z/KWPVhsGKvSPgIq1lTytmruK7XInlkHDILPQ=;
        b=Xs7rzd1iCo9PjaC6lOZ+QPgnd4oNHJ7nr37UpR5+Mnme+enuC5wVTulAat0cNz7WW0
         rre3coFFqfaeNiFG7KcByI+DZnfx1OgTEkIa1iafqWy7XlFbQEVl4GQzD7ynk/2qz/LN
         uNYQ/aYS8tSQvznLTSWccGC/jCtjVqJqeLaI/RNZxfxIdrqqWnppV8UEoLxOxQ+SDLh0
         LvdkQ3bnJkbRSTyOOBW3bsEIWm/EtiypDydwEuFF8ZntQwvb8U1vGLgmmpxllAvq0tbm
         VMW54s25v8nVLcDAffCSE0f4la3X3zUpX2M79qDdQa/26gS80i2/Em2ct6iLJ9sCSpOI
         ajqA==
X-Gm-Message-State: APjAAAU0Hx09/mEexgrtM1sm8Li5MPyddUUIXFIPLmdvyRJj726n69zq
        oOLn8mEcdGa06giRRZ7nDiE=
X-Google-Smtp-Source: APXvYqzzlDI8hv5Fkj2ZDSYXOri3/NCIu89/EmxXrDVN/5b4RJLnpbK1VQ4uXtluq50oNcsLlvJXwg==
X-Received: by 2002:a50:991d:: with SMTP id k29mr3253480edb.29.1557402033554;
        Thu, 09 May 2019 04:40:33 -0700 (PDT)
Received: from archlinux-i9 ([2a01:4f9:2b:2b84::2])
        by smtp.gmail.com with ESMTPSA id w10sm294057eja.30.2019.05.09.04.40.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 09 May 2019 04:40:32 -0700 (PDT)
Date:   Thu, 9 May 2019 04:40:30 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arnd Bergmann <arnd@arndb.de>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: add most of Clang-specific flags unconditionally
Message-ID: <20190509114030.GA7556@archlinux-i9>
References: <20190509064455.1173-1-yamada.masahiro@socionext.com>
 <20190509111534.GA32696@archlinux-i9>
 <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASpsid7_sh4rdRNSTwZ1YtW_+uH2eoarJNNUttntQZ-kg@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 09, 2019 at 08:35:05PM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Thu, May 9, 2019 at 8:15 PM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Thu, May 09, 2019 at 03:44:55PM +0900, Masahiro Yamada wrote:
> > > We do not support old Clang versions. Upgrade your clang version
> > > if any of these flags is unsupported.
> > >
> > > Let's add flags within ifdef CONFIG_CC_IS_CLANG unconditionally,
> > > except -fcatch-undefined-behavior.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > > ---
> > >
> > >  Makefile                   | 10 +++++-----
> > >  scripts/Makefile.extrawarn | 12 ++++++------
> > >  2 files changed, 11 insertions(+), 11 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index bd7ae11947cb..c71ffb6f55b5 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -731,15 +731,15 @@ stackp-flags-$(CONFIG_STACKPROTECTOR_STRONG)      := -fstack-protector-strong
> > >  KBUILD_CFLAGS += $(stackp-flags-y)
> > >
> > >  ifdef CONFIG_CC_IS_CLANG
> > > -KBUILD_CPPFLAGS += $(call cc-option,-Qunused-arguments,)
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
> > > +KBUILD_CPPFLAGS += -Qunused-arguments
> > > +KBUILD_CFLAGS += -Wno-format-invalid-specifier
> > > +KBUILD_CFLAGS += -Wno-gnu
> > >  # Quiet clang warning: comparison of unsigned expression < 0 is always false
> > > -KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
> > > +KBUILD_CFLAGS += -Wno-tautological-compare
> > >  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
> > >  # source of a reference will be _MergedGlobals and not on of the whitelisted names.
> > >  # See modpost pattern 2
> > > -KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
> > > +KBUILD_CFLAGS += -mno-global-merge
> > >  KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
> >
> > I think we should just remove this, I'm fairly confident the kernel
> > can't be reliably compiled with anything earlier than Clang 4 (Pixel 2
> > was shipped with it but had some hacks, this commit is from Clang 3.5):
> >
> > https://github.com/llvm/llvm-project/commit/cb3f812b6b9fab8f3b41414f24e90222170417b4
> 
> 
> Oh, I did not know this was deprecated.
> 
> Could you send a patch to remove it
> with filling the commit log ?

Sure!

> 
> 
> Thanks.
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
> To post to this group, send email to clang-built-linux@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNASpsid7_sh4rdRNSTwZ1YtW_%2BuH2eoarJNNUttntQZ-kg%40mail.gmail.com.
> For more options, visit https://groups.google.com/d/optout.
