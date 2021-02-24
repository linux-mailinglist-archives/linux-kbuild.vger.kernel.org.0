Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB9232354A
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Feb 2021 02:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhBXB2O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 20:28:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234721AbhBXBNk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 20:13:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8706864E21;
        Wed, 24 Feb 2021 01:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614129177;
        bh=JFnQ3bb+wnAj7HzoQ/Fn/HxO/sGQmfJkEGR1zWzpolY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MSAbZVQxAbYYn4KFo0ArmP+j/CKXVz1eOM4OLRefrvvDBHN1OAfMPIFqcJjC3ea+y
         ogNYvIcHYhv2ZODFyNFXsg8faZSmcQbCr4LgtuS6TPDOzAk40ghD77/T1yh4kRdok6
         IOI4lrwrLdUImIyYXax/r+blYeJIx7DBQF+z4diJTr0E+xpKFKzXjde58+BJe8Y/YL
         RnE6WM2qD0UHHYZYpyj+vSDkKQhotSNWta1OtlVJgDrZUZMllfxg9/MEzAdvCSc6mA
         kJvcAwZdal5y5eB3RJgxBwaR/elcH4VyIZh41OCUy+rYwAEy2Pvse2O/6jGEgfJGQX
         SNjE9ha2kG2sg==
Received: by mail-ej1-f51.google.com with SMTP id a22so379270ejv.9;
        Tue, 23 Feb 2021 17:12:57 -0800 (PST)
X-Gm-Message-State: AOAM533FfWGCsZq98PVtPZy7YDrTy+E17TNJBJvqK1gMPQHUfRC2ERbS
        jUVznMtgbyfDj1bcby7GfbSVTIIAwNbTNDYE6g==
X-Google-Smtp-Source: ABdhPJwCNU83csDKizJJdn8VnkjOBODoHDNXI9O6GZO3FhL6itS5fa3tQ+gCRTuFG4rw/YZPFm4Ho8SEEzxDTKb51sc=
X-Received: by 2002:a17:906:f18a:: with SMTP id gs10mr256348ejb.341.1614129176104;
 Tue, 23 Feb 2021 17:12:56 -0800 (PST)
MIME-Version: 1.0
References: <20210223181425.4010665-1-robh@kernel.org> <20210223181425.4010665-2-robh@kernel.org>
 <CAK7LNAQYfMGTUehk4-=UGcT4Tc66fZ67vbJKr36YDpxB52mDJQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQYfMGTUehk4-=UGcT4Tc66fZ67vbJKr36YDpxB52mDJQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 23 Feb 2021 19:12:44 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+4a3KrZpQ-RoN2+RU2iwNGj6aEipfegC4dFW6RyiT2cw@mail.gmail.com>
Message-ID: <CAL_Jsq+4a3KrZpQ-RoN2+RU2iwNGj6aEipfegC4dFW6RyiT2cw@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: Make old-atomics and missing-syscalls phony targets
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 23, 2021 at 6:47 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Feb 24, 2021 at 3:14 AM Rob Herring <robh@kernel.org> wrote:
> >
> > The old-atomics and missing-syscalls targets are not files, so they
> > should be marked as PHONY.
> >
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Kbuild | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Kbuild b/Kbuild
> > index fa441b98c9f6..032157c3ffd2 100644
> > --- a/Kbuild
> > +++ b/Kbuild
> > @@ -44,6 +44,7 @@ always-y += missing-syscalls
> >  quiet_cmd_syscalls = CALL    $<
> >        cmd_syscalls = $(CONFIG_SHELL) $< $(CC) $(c_flags) $(missing_syscalls_flags)
> >
> > +PHONY += missing-syscalls
> >  missing-syscalls: scripts/checksyscalls.sh $(offsets-file) FORCE
> >         $(call cmd,syscalls)
> >
> > @@ -55,5 +56,6 @@ always-y += old-atomics
> >  quiet_cmd_atomics = CALL    $<
> >        cmd_atomics = $(CONFIG_SHELL) $<
> >
> > +PHONY += old-atomics
>
>
> I do not think this is the right fix.
>
> always-y (specified a few lines above) adds $(obj)/ prefix,
> and is not supposed to work with PHONY.
>
>
> It is wrong to blindly eliminate
> the errors detected by your 3/3

What about checking just hostprogs and userprogs? That's what I
initially had, but thought we could widen the net a little.

Rob
