Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0638F7D36F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2019 04:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726931AbfHAC5k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Jul 2019 22:57:40 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:25321 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726626AbfHAC5k (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Jul 2019 22:57:40 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x712vKs3017242;
        Thu, 1 Aug 2019 11:57:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x712vKs3017242
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564628241;
        bh=XuEZx9KL8vPGiZUdkIWpRAE9VOsgYYJ1v/yggHWObxg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=riNql9ZzrcPC6iMP4ab6Ms3k8YmOJaNEIiBou9lIaWeRyZujvSeHeuoLB+8VIZLxJ
         wT0WQOA/D7Xde7f93KmH96SO0rhwndJ298fDuFWDA1/a6q0uLZSDY90/DYxOGfQekN
         PYcHZS9ULsGnzvDCRD69HG0kUP/SVq3+nMh0lswhmnev/8yfwnzF276hHIiPcS2R7V
         Ii8PdXlyLbkeuMxWUTGA99IiAbpFcuumNe03EklPITbvRfLsrvKqocUg794U6cgEGX
         GqrIkdkuqFvhxu9r0AB1Bn1l8SCNEeiBvIrRig9+pmHA47E4KvqIjN+MA9k5qC3Lbh
         JNC7vgnhYcNpg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id v6so47863943vsq.4;
        Wed, 31 Jul 2019 19:57:21 -0700 (PDT)
X-Gm-Message-State: APjAAAUi993QD44em/wC7Mb78sSx/BJYqLlfV1aoGk1/ilABaVtNoCtQ
        LYC/WczSjnDkiuivuaEIN/NJyGTQB1esF/mqtx8=
X-Google-Smtp-Source: APXvYqxyzK4p9kMB94A2SuClr+PFLUQZBK0sic/kJfGaOShDgKQem92Jkd/1tmuRzBeZuXTzy+xmBfS3RjXKWL5lXGQ=
X-Received: by 2002:a67:f495:: with SMTP id o21mr80697696vsn.54.1564628240326;
 Wed, 31 Jul 2019 19:57:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190730164803.45080-1-swboyd@chromium.org> <20190730164959.GA129059@archlinux-threadripper>
 <CAK7LNARvyxzJa9CG-4uSoE7asdHp=Cbeh71_13dmuP8zMJtqSA@mail.gmail.com>
In-Reply-To: <CAK7LNARvyxzJa9CG-4uSoE7asdHp=Cbeh71_13dmuP8zMJtqSA@mail.gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 1 Aug 2019 11:56:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNASNxKzhO3cKXBTxcLWNoEX2pMdO6MFScyu3wprdtH2rzw@mail.gmail.com>
Message-ID: <CAK7LNASNxKzhO3cKXBTxcLWNoEX2pMdO6MFScyu3wprdtH2rzw@mail.gmail.com>
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

On Wed, Jul 31, 2019 at 1:51 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Wed, Jul 31, 2019 at 1:50 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Tue, Jul 30, 2019 at 09:48:03AM -0700, Stephen Boyd wrote:
> > > If the particular version of clang a user has doesn't enable
> > > -Werror=unknown-warning-option by default, even though it is the
> > > default[1], then make sure to pass the option to the Kconfig cc-option
> > > command so that testing options from Kconfig files works properly.
> > > Otherwise, depending on the default values setup in the clang toolchain
> > > we will silently assume options such as -Wmaybe-uninitialized are
> > > supported by clang, when they really aren't.
> > >
> > > A compilation issue only started happening for me once commit
> > > 589834b3a009 ("kbuild: Add -Werror=unknown-warning-option to
> > > CLANG_FLAGS") was applied on top of commit b303c6df80c9 ("kbuild:
> > > compute false-positive -Wmaybe-uninitialized cases in Kconfig"). This
> > > leads kbuild to try and test for the existence of the
> > > -Wmaybe-uninitialized flag with the cc-option command in
> > > scripts/Kconfig.include, and it doesn't see an error returned from the
> > > option test so it sets the config value to Y. Then the Makefile tries to
> > > pass the unknown option on the command line and
> > > -Werror=unknown-warning-option catches the invalid option and breaks the
> > > build. Before commit 589834b3a009 ("kbuild: Add
> > > -Werror=unknown-warning-option to CLANG_FLAGS") the build works fine,
> > > but any cc-option test of a warning option in Kconfig files silently
> > > evaluates to true, even if the warning option flag isn't supported on
> > > clang.
> > >
> > > Note: This doesn't change cc-option usages in Makefiles because those
> > > use a different rule that includes KBUILD_CFLAGS by default (see the
> > > __cc-option command in scripts/Kbuild.incluide). The KBUILD_CFLAGS
> > > variable already has the -Werror=unknown-warning-option flag set. Thanks
> > > to Doug for pointing out the different rule.
> > >
> > > [1] https://clang.llvm.org/docs/DiagnosticsReference.html#wunknown-warning-option
> > > Cc: Peter Smith <peter.smith@linaro.org>
> > > Cc: Nathan Chancellor <natechancellor@gmail.com>
> > > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > > Cc: Douglas Anderson <dianders@chromium.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > > ---
> > >  Makefile                | 1 +
> > >  scripts/Kconfig.include | 2 +-
> > >  2 files changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 9be5834073f8..517d0a3f6539 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -536,6 +536,7 @@ KBUILD_AFLAGS     += $(CLANG_FLAGS)
> > >  export CLANG_FLAGS
> > >  endif
> > >
> > > +
> >
> > Not sure it's worth sending a v4 for but I don't think this should be
> > there.
>
>
> I will remove it when I apply this.
>

Applied to linux-kbuild/fixes. Thanks.

-- 
Best Regards
Masahiro Yamada
