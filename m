Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 690A91DEF08
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 20:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730813AbgEVSRo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 14:17:44 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27085 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726373AbgEVSRo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 14:17:44 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 04MIHPFT017391;
        Sat, 23 May 2020 03:17:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 04MIHPFT017391
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590171446;
        bh=K3rGYVbuX5itC10Uy7MCO78NVqbVQ6AyydvbG4IPunc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dhexHP4r5UqBuJyFcetL7gZMMeLBW26NawGnk14bzmlelLVztkIDN1E0gLMszC8iN
         LfNAqpZeYKV+IeNfOaLaqZvhSN3mqfXxrGu5xsfzdnHN5Zo6ZCY0xBV+wP/5n2E1JK
         KjVIkJSMIO8yTKTRjacARUmWXPShANGo/FvPtKiJ45Z/qz/o4G2zqbdaz0hm8NjcDJ
         lVVgK1Xfu8Kc4G8M12/SabtFxb8ZlMw0eyEF1uNRTe5iT31KoNOJVzAMEgwrt8HPq6
         p0tfWgoGNNeKesnh5O7g9PBkxtcVthZrEZERBCLHkt+9bpTQmI/mZ1YZxgfQsYwon9
         hkwaiuS8woBfA==
X-Nifty-SrcIP: [209.85.217.49]
Received: by mail-vs1-f49.google.com with SMTP id w65so6555458vsw.11;
        Fri, 22 May 2020 11:17:26 -0700 (PDT)
X-Gm-Message-State: AOAM533oGn99TT1pavUP+Sf44Nf1QwSo/v0bJfEiVd8xSVYQKEH+aBHY
        40ZrXEb0voCmCwmW+vL/gv+8yvHA00Wnhk1BVtQ=
X-Google-Smtp-Source: ABdhPJyegX+5hSC8vQtFsfk2gsG8jhLEllAduD0C3D9DpxotRifsVoWTIhA0Kp06+8I7BRCrvI4FLB9S1OKqCcRKAk4=
X-Received: by 2002:a05:6102:3231:: with SMTP id x17mr250058vsf.181.1590171445169;
 Fri, 22 May 2020 11:17:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com> <202005211506.2700F86@keescook>
In-Reply-To: <202005211506.2700F86@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 May 2020 03:16:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ1HTTSq-yp0t6Z4V-Z9PHg+O2n=NC89FJJFNQnhaOcSA@mail.gmail.com>
Message-ID: <CAK7LNAQ1HTTSq-yp0t6Z4V-Z9PHg+O2n=NC89FJJFNQnhaOcSA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Kees Cook <keescook@chromium.org>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 22, 2020 at 7:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> > Instead of linking all compilation units again each time vmlinux_link is
> > called, reuse vmlinux.o from modpost_link.
> >
> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> > in the time spent in vmlinux_link).
>
> Nice! Any time savings at final link is a big cumulative win.
>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > ---
> >  scripts/link-vmlinux.sh | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> > index d09ab4afbda4..c6cc4305950c 100755
> > --- a/scripts/link-vmlinux.sh
> > +++ b/scripts/link-vmlinux.sh
> > @@ -77,11 +77,8 @@ vmlinux_link()
> >
> >       if [ "${SRCARCH}" != "um" ]; then
> >               objects="--whole-archive                        \
> > -                     ${KBUILD_VMLINUX_OBJS}                  \
> > +                     vmlinux.o                               \
> >                       --no-whole-archive                      \
> > -                     --start-group                           \
> > -                     ${KBUILD_VMLINUX_LIBS}                  \
> > -                     --end-group                             \
> >                       ${@}"
> >
> >               ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
>
> I think the "um" case can be updated as well too, yes?

I agree.

I changed the um part, then ARCH=um build is successful.







> Also, I think the comment above modpost_link() needs to be updated now
> to reflect the nature of how vmlinux.o gets used after this patch.
>
> --
> Kees Cook



-- 
Best Regards
Masahiro Yamada
