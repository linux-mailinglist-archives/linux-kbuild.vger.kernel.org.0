Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDF5C3EDD07
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 20:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhHPSYJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 14:24:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhHPSYJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 14:24:09 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E9F6C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:23:37 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id i28so9566281lfl.2
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 11:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXNEBxrdRbaW0Zvj9MoErhLjqBG//qAZColhvKB/ENU=;
        b=jWiF3VDph9SCQ7Z9TWhCBKY7M4MxDINi1f9q51QNR6NlxmXmrVgobbVvJDEQDOBFFw
         vrQCBsjpqSjyDNrB9Oe6GBTwnTuE7I2TY0V11+O/YpkP/M+0mdK8zXTUa3D7wGe3iQEl
         yRKnC0DrJ56G3HYURyQ61EIG7nMHK02ISMY90WJ63a7Alx4qg82rRlXBpLnahl/Sn8YF
         TZnF+44omfJnCvWDZk0+aXT91MC3A8uVkEaVW0ZrDTeOrLe0ZzSMfE4XxEP16hZhD+2q
         c0lupGivadoXOvmBa5dhmPiZF02iQsgYQRUm4Rh/50ZvFZxOkO8fofYrf6OPbA4MoIeC
         BYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXNEBxrdRbaW0Zvj9MoErhLjqBG//qAZColhvKB/ENU=;
        b=ic4IB6pPuMQDcKEejv+auf55clYTaJjLkkWrxoJVSdsHKvx4S9FTgpNzGpV8M8nSex
         ZptjWUeoOw1g12gfG+cYeBBPIesYSOOQGuCjQBDoZK0gPvvsHbHSXWwUtb5ctWnw2K2s
         t/KPMK7xljHcUC0lTiiwCyPvStki0mi5NKQxNZ578qHPaVYRFf+KzYtVrgkQHq2zYDBv
         ArEbRQkBxKiYsEqjRQpIW8aeZVyI5aIq8Te/CqvX9dLrhH+Nb/URwQpMM1kb6p9NrHnA
         B8QpI7TAqJdB3CLpH85+zEGQGDm8J47C67klVMPpss6E+BXHXW+IsnbTwW7/Hwon1pYB
         x05w==
X-Gm-Message-State: AOAM5334ZVp8Xt1nRYBrvFHHUdMdNPZmPJZ3+ZXzXYrsUJNGVZD08pAN
        w/mlGqD463OUUju7Ja51K4/ZJ8Qr24f+uC5B0oeLBQ==
X-Google-Smtp-Source: ABdhPJx29dpsm62whVHg2TLbCN1NCHzvOehsnCbFttsXFejNnRpyUhhYa6o1V3PMI4Vghz8JxPO81Zer/jhXfmHTLb8=
X-Received: by 2002:a05:6512:39ca:: with SMTP id k10mr12931757lfu.547.1629138215110;
 Mon, 16 Aug 2021 11:23:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210810205611.4013424-1-ndesaulniers@google.com> <CAK7LNAT0KR_xjPNzdB1aJ9nj3=A-ktU-aoP0CWvAnMJ91djfyA@mail.gmail.com>
In-Reply-To: <CAK7LNAT0KR_xjPNzdB1aJ9nj3=A-ktU-aoP0CWvAnMJ91djfyA@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 16 Aug 2021 11:23:23 -0700
Message-ID: <CAKwvOdn4DvH_S3wgk49E=mCgwKhErhf8BDVzPXLTmB74GDQBKw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add Nick to Kbuild reviewers
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Linux kbuild, Michal

On Fri, Aug 13, 2021 at 6:08 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Aug 11, 2021 at 5:56 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > Kees' post inspired me to get more involved. I still have a long way to
> > go in terms of mastery of GNU make, but at the least I can help with
> > more code review. It's also helpful for me to pick up on what's missing
> > from the LLVM ecosystem.
>
>
> Reviews and tests are always appreciated.
> Of course, not only from those who are listed in
> the MAINTAINERS file, but everybody can provide
> reviews to any patches in their interests.
>
> Applied to linux-kbuild. Thanks.
>
>
> BTW, one struggle about being a maintainter
> of this entry is I need to take a look
> into random stuff.
>
> KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>
>
> Another BTW, this patch reminds me of Michal.
> He is inactive for a long time.
> I should ask him if he wants to continue
> to be a kbuild maintainer.

I was going to ask if there was handling for "emeritus status?"  The
last meaningful commit seems to be from Nov 2016, though it seems they
were the maintainer since 2009 (5ce45962b26a)!

>
>
>
>
>
> > Link: https://security.googleblog.com/2021/08/linux-kernel-security-done-right.html
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  MAINTAINERS | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index efac6221afe1..9768e4a19662 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -10091,6 +10091,7 @@ F:      fs/autofs/
> >  KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
> >  M:     Masahiro Yamada <masahiroy@kernel.org>
> >  M:     Michal Marek <michal.lkml@markovi.net>
> > +R:     Nick Desaulniers <ndesaulniers@google.com>
> >  L:     linux-kbuild@vger.kernel.org
> >  S:     Maintained
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> > --
> > 2.32.0.605.g8dce9f2422-goog
> >
>
>
> --
> Best Regards
> Masahiro Yamada

-- 
Thanks,
~Nick Desaulniers
