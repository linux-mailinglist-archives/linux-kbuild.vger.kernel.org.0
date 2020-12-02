Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D57772CB2DB
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 03:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgLBCjV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 21:39:21 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64787 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgLBCjU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 21:39:20 -0500
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0B22cGcR001905;
        Wed, 2 Dec 2020 11:38:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0B22cGcR001905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606876697;
        bh=vuUMWsxXWrQ01Gfrdczxg27I9JGZI9RgaFpbn6oV8oY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tOIszf40xXMr7wl2vaTq0SdMqyYgNDISAPEKaMCWtPJc7Hp7VSpE9XQqWeo0wI8wa
         QJT9cmpmkD84Ula01K1MNeGpetZlJFnpGMbltg1LZRNMpk7tp87r4N6kGvOK73v+gA
         XZRLlx1I79vh+HoJvYM2zatzyPRtfXT6GA7Jr7gUbG8Ebdmh872/qj1hsRKNCkhZkR
         UzYmg9qt4B3+FXpvgo8oIQabd4iow6OW2vwHCf4IVCrJwGSqtiPxq0pwPp9aqoPKJ0
         FAGb/tPgifi/N/wKnqaYzE/FgNAfujPHc3ACXjfGSMFLaqZYu1BZbyWDZkypSc+7Yi
         BhBCJf137b8QA==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id ms7so130905pjb.4;
        Tue, 01 Dec 2020 18:38:16 -0800 (PST)
X-Gm-Message-State: AOAM532Zc/dw1FvkmpB6bQXGamHu98xRYZjlV/5KHjPprzOvlFIzdttP
        NI1hXP8TXNGK8o2NqXqttSqZzu0ElL65Sy6TaYc=
X-Google-Smtp-Source: ABdhPJwDC7vrgmZd87TnYojT5DQVV1p4zLlwe3QC9WsNK/LcmfS4g+CuJs+s5piItla/TVt9fXBTfy6W+2sB4RqB+n8=
X-Received: by 2002:a17:90a:fa0c:: with SMTP id cm12mr195096pjb.87.1606876696170;
 Tue, 01 Dec 2020 18:38:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com> <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook> <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
 <202012011255.9D677ED3@keescook>
In-Reply-To: <202012011255.9D677ED3@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 2 Dec 2020 11:37:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
Message-ID: <CAK7LNAQGqcCBBFbKwe_eTuBqtNwDn_q8c0nPBJVsEoHP6F+aKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1
To:     Kees Cook <keescook@chromium.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "kernelci . org bot" <bot@kernelci.org>,
        Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Dec 2, 2020 at 5:56 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Tue, Dec 01, 2020 at 10:31:37PM +0900, Masahiro Yamada wrote:
> > On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > > > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > > > <natechancellor@gmail.com> wrote:
> > > > >
> > > > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > > > along with a few others. Newer versions of ld.lld do not have these
> > > > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > > > >
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > > > Reported-by: Mark Brown <broonie@kernel.org>
> > > > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > > >
> > > > Thanks for the additions in v2.
> > > > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > >
> > > I'm going to carry this for a few days in -next, and if no one screams,
> > > ask Linus to pull it for v5.10-rc6.
> > >
> > > Thanks!
> > >
> > > --
> > > Kees Cook
> >
> >
> > Sorry for the delay.
> > Applied to linux-kbuild.
>
> Great, thanks!
>
> > But, I already see this in linux-next.
> > Please let me know if I should drop it from my tree.
>
> My intention was to get this to Linus this week. Do you want to do that
> yourself, or Ack the patches in my tree and I'll send it?
>
> -Kees
>
> --
> Kees Cook


I will send a kbuild pull request myself this week.




-- 
Best Regards
Masahiro Yamada
