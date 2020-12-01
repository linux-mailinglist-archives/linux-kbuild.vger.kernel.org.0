Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4195A2CA3EA
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 14:34:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbgLANdU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 08:33:20 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:49427 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387578AbgLANdU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 08:33:20 -0500
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B1DWG8g009356;
        Tue, 1 Dec 2020 22:32:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B1DWG8g009356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606829537;
        bh=BCmIt+mXGDdopPkiBBw+3x1M8rDQB/5oH9HpU4uQ5qA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=THr+eUx4SWCPegG1uRLmRHq1mlzwZIBJZfMOhYfUi9PvS1ZmkPpZzJJvSBKEXI9sU
         hGC9IjavC/i0M1vYGEAMjvM98V1iWPC3aWRaEJSIOHHtzxpNfyiU+Xwd2P6gXrIQPS
         SBI2ODfn0nhkwR8fjb1OQE+Yjh/NV9bSiWHzDE2LI9RpqgZs+QdPfBpe51hHlxXvAJ
         RCvvpEU+nYui6Z2WZAO+0K3fgTe6V0Jz2Wi18KbjOr7S2LM8NCEoX5aV0ocxOflfoN
         1puiE9MAIrJw5ZvQfSeKd0GYgw0KCnvdZxS7Qn+x0fA5AwGdHaaXZErK79XdW2aK8u
         bNGE8JRlo2tXA==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id 4so1140537plk.5;
        Tue, 01 Dec 2020 05:32:16 -0800 (PST)
X-Gm-Message-State: AOAM530Gi31sgn5oXBL3YkiyqrPbHWceFo05ZdWsqGVM8Bl8yf7VxBn2
        WqmLJOj65504lMCLIX93Weui6VkEdW638itm2aE=
X-Google-Smtp-Source: ABdhPJxkfQ9oggzotEcl6XRa/pHYRdnHTVyaDTtBNoctn5AxYzZdCy2G1D8jd7raU+usum4j5kNizUmaOheYMGClFnM=
X-Received: by 2002:a17:902:402:b029:da:2cb9:56e8 with SMTP id
 2-20020a1709020402b02900da2cb956e8mr2703980ple.1.1606829536018; Tue, 01 Dec
 2020 05:32:16 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com> <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
 <202011241421.A2F3062A70@keescook>
In-Reply-To: <202011241421.A2F3062A70@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 22:31:37 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
Message-ID: <CAK7LNAR=_+1K7EtpvGzgyM+ans-iNOT0PBXdLRApnsyAzakQ3w@mail.gmail.com>
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

On Wed, Nov 25, 2020 at 7:22 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Nov 19, 2020 at 01:13:27PM -0800, Nick Desaulniers wrote:
> > On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> > > along with a few others. Newer versions of ld.lld do not have these
> > > warnings. As a result, do not add '--orphan-handling=warn' to
> > > LDFLAGS_vmlinux if ld.lld's version is not new enough.
> > >
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > > Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> > > Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> > > Reported-by: kernelci.org bot <bot@kernelci.org>
> > > Reported-by: Mark Brown <broonie@kernel.org>
> > > Reviewed-by: Kees Cook <keescook@chromium.org>
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > Thanks for the additions in v2.
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
> I'm going to carry this for a few days in -next, and if no one screams,
> ask Linus to pull it for v5.10-rc6.
>
> Thanks!
>
> --
> Kees Cook


Sorry for the delay.
Applied to linux-kbuild.

But, I already see this in linux-next.

Please let me know if I should drop it from my tree.


-- 
Best Regards
Masahiro Yamada
