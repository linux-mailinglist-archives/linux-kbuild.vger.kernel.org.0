Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 720742FFA30
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:52:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbhAVBwC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:52:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbhAVBwC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:52:02 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 071FAC06174A;
        Thu, 21 Jan 2021 17:51:22 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id h11so8070680ioh.11;
        Thu, 21 Jan 2021 17:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=grVgArCmTIAFQO1QKDjtcwkARpJ8eBaT94p20yxbsvg=;
        b=DabjZlnKfWoofVqepdiYLZ/1My5YEEStpBr2i8KFzQaWspPeINHpgHBZzaysppi5RG
         /1tklEpkDL+6wVNSevfGIAOjcy+W5nuPEjoNT9kr6odPArvWA2wAlNbbEvFlPBYNozTD
         AW6mh/UrewKeRck6RS93GcKnDbG94GxOUYm/ZRhC/5pSAILTuuGBuggfimkrTf5OjnQc
         zmJw2VTj1kh1m4HRaqa7CEMk4flgE4ENPQ4FyV933x2XxahrYW1ln078ct1ktLek2Rn/
         lvWQ9AF3HrJZYaQCcfeo5SfxlMGDRXV4EOnD3KuBpAO41bl3Odgy/BTPYG+CvHl40drG
         OAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=grVgArCmTIAFQO1QKDjtcwkARpJ8eBaT94p20yxbsvg=;
        b=jMHf6aUZviNJ/czi561HyRmxTmRDhJdVdXEkqjDBiIOXr13AFWFoYNfcBH4HZuMbPq
         xLi8zx88kH9qH+KwcgFmB87p+lCF/nSFR//kDt+tMpTZx9yrqAxU5RfWwC+tSeFvqZ8h
         GnzQLyhoCz35nZqpgB8gVLG0u9qW9D2/Src/X+Pfe5jR4KtORM/DwriPFmL1AZyYkkIA
         QHh9EWa9GAoVTpxW2mRg0opZGuFJICznN04xmscV8K74ufuBwzyNF6PttGgynZXAR+Ta
         83ZxTIs9tIY6kYkooHyveL4/Fm7oGnHEv1Bm88s7Utn/jHw5P37hwdOXMKgEjwcvWU35
         QL0Q==
X-Gm-Message-State: AOAM531/XZhV9v8eK4tIR++xgCrbnk/85wvl6z+JCdDbJDqexBxOP9rV
        4p1stOeML+Hr6eUWXxFpNa40We0HHfmTMXNr0cM=
X-Google-Smtp-Source: ABdhPJyXzUylsj3qVg34JRZeUP/HqR0K2bjR1saediGLnArI1ovQERVLdyXHYsKLVtdb31ASwce7WU5wWWQsOSLn1EU=
X-Received: by 2002:a6b:6a0e:: with SMTP id x14mr1750003iog.57.1611280281435;
 Thu, 21 Jan 2021 17:51:21 -0800 (PST)
MIME-Version: 1.0
References: <20210116094357.3620352-1-morbo@google.com> <20210121082451.2240540-1-morbo@google.com>
 <CA+icZUWiXMbZe5d5h6KdoHUSiaHwv7z6Rf_C2Gstmx0rbszT+Q@mail.gmail.com> <CAKwvOdmmhW36Zbkc0aPLAOrP8UXsX5vKkrfWYH89sCKLmE5vuw@mail.gmail.com>
In-Reply-To: <CAKwvOdmmhW36Zbkc0aPLAOrP8UXsX5vKkrfWYH89sCKLmE5vuw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 22 Jan 2021 02:51:09 +0100
Message-ID: <CA+icZUVdM_mOMwp6V=jwj0422uaRUMHKQMkSkFScgbWqynS+iA@mail.gmail.com>
Subject: Re: [PATCH v6] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 2:44 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Thu, Jan 21, 2021 at 2:35 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Thanks for v6.
> >
> > Small Changelog nits:
> > * Can you reverse-order the changelog - latest v6 first.
> > * v4: s/Makfile changes and se/Ma*k*efile changes and *u*se
> >
> > Can you add a hint to this "Clang-PGO" patch requiring Clang >= 12?
> >
> > Can you please add a comment for people using Clang >= 12 (ToT) and
> > have kernel-modules enabled, they will need the patch from CBL issue
> > #1250?
> > Otherwise they cannot boot and follow the next steps in the workflow.
> >
> > Can you put a comment about value "1" to reset the profiling counter?
> > That there is no "0" value stopping it.
> >
> > Can you add an example for the workload test?
> > Here I do a x86-64 defconfig build.
> > See attached script.
> >
> > Usually, I download this patch from LORE.
> >
> > link="https://lore.kernel.org/r/20210111081821.3041587-1-morbo@google.com"
> > b4 -d am $link
> >
> > This downloads v6.
> >
> > What if I want a previous version (compare)?
> > Again, I will love to see a "clang-pgo" branch and maybe tags for the
> > several versions in your personal GitHub.
> > Come on, Bill :-).
>
> That's quite a long list, Sedat!  Do you think some of these can be
> follow ups, once the core lands?  I'd much prefer to land the meat of
> this and follow up quickly, than tire out poor Bill! :P
>

Poor Bill - he lost his hairs :-)?

I hoped that the documentation gets a bit improved and clearer at some places.

- Sedat -
