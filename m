Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D63483F6E92
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhHYEvH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:51:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60105 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhHYEvG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:51:06 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 17P4nxPc013179
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Aug 2021 13:49:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 17P4nxPc013179
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629866999;
        bh=JwIWlEDPz/77+8/mkqKPc5WcajlmGXuNMNbSgEa2+8U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RHWNy3TyZdtZ0XrzQiji0aT4Oa20L3oTdoGpsDF7RPzqKzr1YK1aaTfK7OE5UhSIt
         nGlO/fmYIenwLTU5vqxhXSYmc45nUM8ni/QCZCimKkBjZtTKq5C1MHjpPlEDsHbZhb
         aTlZCcHjYB0hKfihmRzFapiErk/IUUMr3+Pb6vjGmCVQIHvCDoB1QOOj4uo+eA1v7E
         NePFdhb/aG46ZAicqomf0phRu/6I1SpP5Ib/7/MuO2WJbKXSXBkeMY8ewGzVjwaiAL
         HYzJJkAtj6sx93eRNHRyn2qe/p4T+Q+g0W89MTS0vMqbI8UtdQz08CgZqGvhLmWEnU
         r6ywF/JMbJdLA==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id q3so1756964plx.4
        for <linux-kbuild@vger.kernel.org>; Tue, 24 Aug 2021 21:49:59 -0700 (PDT)
X-Gm-Message-State: AOAM532g8SEi27q35DUezdp/nbBoRNlu4VPAvMDCK1dPZxAiZ3wXggpS
        NNt0aUcUVjfUOhx4Myp41selX2gDJzVJ4pbJx4s=
X-Google-Smtp-Source: ABdhPJxilnlpwJUi4blbH219OAAG+QjC5sNdKndlwA/L/RT7xePiAZqIzxdElI7pEoSeBJt64LNl5nDaDSOdozFRWaU=
X-Received: by 2002:a17:902:f552:b029:12d:3d11:4ff1 with SMTP id
 h18-20020a170902f552b029012d3d114ff1mr36077046plf.1.1629866998882; Tue, 24
 Aug 2021 21:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-7-ndesaulniers@google.com> <CAK7LNAS7E9uMJfCGsFPkP_z9y0Y_PrXXzMTRRiwsbj66bTi8SQ@mail.gmail.com>
In-Reply-To: <CAK7LNAS7E9uMJfCGsFPkP_z9y0Y_PrXXzMTRRiwsbj66bTi8SQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:49:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNATM0JVqdAYNtfc5k9vMyDW0PvTnMZT29WY7+1sM5NgWnQ@mail.gmail.com>
Message-ID: <CAK7LNATM0JVqdAYNtfc5k9vMyDW0PvTnMZT29WY7+1sM5NgWnQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] Makefile: replace cc-option-yn uses with cc-option
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 25, 2021 at 1:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Tue, Aug 17, 2021 at 9:21 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > cc-option-yn can be replaced with cc-option. ie.
> > Checking for support:
> > ifeq ($(call cc-option-yn,$(FLAG)),y)
> > becomes:
> > ifneq ($(call cc-option,$(FLAG)),)
> >
> > Checking for lack of support:
> > ifeq ($(call cc-option-yn,$(FLAG)),n)
> > becomes:
> > ifeq ($(call cc-option,$(FLAG)),)
> >
> > This allows us to pursue removing cc-option-yn.
> >
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 72f9e2b0202c..f76be5f62d79 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -967,7 +967,7 @@ ifdef CONFIG_FUNCTION_TRACER
> >  ifdef CONFIG_FTRACE_MCOUNT_USE_CC
> >    CC_FLAGS_FTRACE      += -mrecord-mcount
> >    ifdef CONFIG_HAVE_NOP_MCOUNT
> > -    ifeq ($(call cc-option-yn, -mnop-mcount),y)
> > +    ifneq ($(call cc-option, -mnop-mcount),)
> >        CC_FLAGS_FTRACE  += -mnop-mcount
> >        CC_FLAGS_USING   += -DCC_USING_NOP_MCOUNT
> >      endif
> > --
> > 2.33.0.rc1.237.g0d66db33f3-goog
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210817002109.2736222-7-ndesaulniers%40google.com.
>
>
>
> I am fine with this change, but
> is there any reason why you did not touch the following hunk?
>
>
>
> ifdef CONFIG_HAVE_FENTRY
>   # s390-linux-gnu-gcc did not support -mfentry until gcc-9.
>   ifeq ($(call cc-option-yn, -mfentry),y)
>     CC_FLAGS_FTRACE     += -mfentry
>     CC_FLAGS_USING      += -DCC_USING_FENTRY
>   endif
> endif
>


Ah, I just recalled that this hunk was restored
after a build error was reported:

https://lore.kernel.org/lkml/CAKwvOdkckey1=VUHApTcJYufyhdRJ=jb4qYs52f59g6ha7qphw@mail.gmail.com/



So, please send v2, changing -mfentry part in the same way.





-- 
Best Regards
Masahiro Yamada
