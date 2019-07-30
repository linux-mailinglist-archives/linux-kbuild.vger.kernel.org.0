Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD45A7AE69
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 18:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbfG3Qwj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 12:52:39 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:51079 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725889AbfG3Qwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 12:52:39 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6UGqRjc009430;
        Wed, 31 Jul 2019 01:52:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6UGqRjc009430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564505548;
        bh=PvSEBqZWfmwsN/sOjPp2xPA9GzkBwa9v1B0DUjIdaBk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FO4rYDDgNQdjdMPB1Kf1Co5ftlBbGAD7Q9jmf+xUEkyzn4kxR7HVkm8M/yXA1s9Nl
         +HR+WrptzqSKwNIcYTxZBxu+4sqPP4lF1vMBwbrQKiWOj14iPih0YkkR7r1Zf8cpKG
         rIncAbtkDs/bo/IVzJmKyyejNI/Wfs+HLhM5YEjkTDl2G7HgGvm8ZVVFcsV0WQJYyF
         6vWxzAKIjDq4L9bq6UQ9syHugUypiMGFZ6Uj4VkOqL8ZEPubawgwB2xzqmqsjuC7Ap
         cObi8YUSM4kcji0E0is94fmEwfzGBHI4XoHVlkChWXURb+Vw1dQGdAUbZYOvnXZAqC
         ZYm+qP06FvwDg==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id 130so12943280vkn.9;
        Tue, 30 Jul 2019 09:52:27 -0700 (PDT)
X-Gm-Message-State: APjAAAWzc90YQDZLIllhv6VNlvNvpAktP93DeBNQIZ4jeih4fhs/icnF
        xoz2+zuaKq+kFsGoPtgWqvQPj6VtbTgeYyY2Yec=
X-Google-Smtp-Source: APXvYqxKXL4lCm34XwhoiOA9tEsr2PPz0ouAza32ECX9cNfNWdNzuam/981BnQOJQn2NH1Lu/g4xi+CSshl0S2bSAQo=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr45007335vkc.84.1564505546515;
 Tue, 30 Jul 2019 09:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190730164803.45080-1-swboyd@chromium.org> <20190730164959.GA129059@archlinux-threadripper>
In-Reply-To: <20190730164959.GA129059@archlinux-threadripper>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 31 Jul 2019 01:51:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvyxzJa9CG-4uSoE7asdHp=Cbeh71_13dmuP8zMJtqSA@mail.gmail.com>
Message-ID: <CAK7LNARvyxzJa9CG-4uSoE7asdHp=Cbeh71_13dmuP8zMJtqSA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: Check for unknown options with cc-option usage
 in Kconfig and clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Smith <peter.smith@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 31, 2019 at 1:50 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Tue, Jul 30, 2019 at 09:48:03AM -0700, Stephen Boyd wrote:
> > If the particular version of clang a user has doesn't enable
> > -Werror=unknown-warning-option by default, even though it is the
> > default[1], then make sure to pass the option to the Kconfig cc-option
> > command so that testing options from Kconfig files works properly.
> > Otherwise, depending on the default values setup in the clang toolchain
> > we will silently assume options such as -Wmaybe-uninitialized are
> > supported by clang, when they really aren't.
> >
> > A compilation issue only started happening for me once commit
> > 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> > CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> > compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> > leads kbuild to try and test for the existence of the
> > -Wmaybe-uninitialized flag with the cc-option command in
> > scripts/Kconfig.include, and it doesn't see an error returned from the
> > option test so it sets the config value to Y. Then the Makefile tries to
> > pass the unknown option on the command line and
> > -Werror=unknown-warning-option catches the invalid option and breaks the
> > build. Before commit 589834b3a009 ("kbuild: Add
> > -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> > but any cc-option test of a warning option in Kconfig files silently
> > evaluates to true, even if the warning option flag isn't supported on
> > clang.
> >
> > Note: This doesn't change cc-option usages in Makefiles because those
> > use a different rule that includes KBUILD_CFLAGS by default (see the
> > __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> > variable already has the -Werror=unknown-warning-option flag set. Thanks
> > to Doug for pointing out the different rule.
> >
> > [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> > Cc: Peter Smith <peter.smith@linaro.org>
> > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
>
> > ---
> >  Makefile                | 1 +
> >  scripts/Kconfig.include | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9be5834073f8..517d0a3f6539 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -536,6 +536,7 @@ KBUILD_AFLAGS     += $(CLANG_FLAGS)
> >  export CLANG_FLAGS
> >  endif
> >
> > +
>
> Not sure it's worth sending a v4 for but I don't think this should be
> there.


I will remove it when I apply this.



-- 
Best Regards
Masahiro Yamada
