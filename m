Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7BB355A9E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Apr 2021 19:44:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347033AbhDFRoO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Apr 2021 13:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244866AbhDFRoM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Apr 2021 13:44:12 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2233AC06174A
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Apr 2021 10:44:03 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id h136so3371678vka.7
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Apr 2021 10:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EtQUUFH1idf1LCKyK4bnY5JsWaSl6wulsAadPAZ7yAY=;
        b=k44fY36vdgSsXvuMKXVH2LPUy3SZsyFWOTycUHNSmOyjQKKd2jYRXyVswoQDx+BXc/
         qbXVT6sU8A/aog8FxFGQmnA5OqijC8l7d4uKXWgAcKoYSY0f87EdOMdUKGccXRucONjM
         kQuT9XA70rCkKLQps0fdWPpH+vpwXbGFnuA1rBrLaowSoqzpHxTPvmWAgZWPwrwjiRCP
         EDsJHhTiPdQdRAMcx1879N1yM38qIuq7ue+gjrpg0ULB7XtmuX4WlsmNRC6gF7c8Oero
         5G+Qe4AzXmDuJRsj/DVfwuCngDmnz4A5oZH11YIIOMykr0JDwT+RxONPGTfNr6cno1SG
         C/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EtQUUFH1idf1LCKyK4bnY5JsWaSl6wulsAadPAZ7yAY=;
        b=C/aIZ1WXMVQBIeGu8BdRuQtZw8HhVnay+K8YTzD7mmCO0oLU0wxPxz6Dlo4sP5bzL3
         blNNG+MwsMBW+yS7kOqmTxJL8MatUMK0rt1xa34hz/fUdfWAyfS0HfSMY7T6jV6DT7JY
         Dg2EkJQxQ1MdlO7qfOv1M3/GEF3m18gY2WfEM1iyIqkL9/MWQh0BHfyHeFzqaQ/m31hp
         bnoBq17tcI32LiS8U0q32yE+YcAR9/HoftWNoTLd5mKoQAmVyApi7TEnQHPX4AdVSVmj
         OqZgzANrBUAF4jkLWFyW6xy24Pl2N/Gi6rMQHQml8Mc3qtsNZUxd+W/WrUUDyqJETA8f
         creg==
X-Gm-Message-State: AOAM531Ebk9P+2iNR60mGSssFXuenHK4EUa2Nn9InoxsKpnNmS0Y2hLa
        OsuNzmyq2e8DL4SC0d2VvJVI9olRzfV1Dr3VubdGjg==
X-Google-Smtp-Source: ABdhPJw/vL1B1lwxMga5y/GzF9RJd38fkIy6KReE2RxFlfigxn9W8Lc55czyHQX2OxWT1+hnyyz72VsWoaRuC/f5D4k=
X-Received: by 2002:a1f:9345:: with SMTP id v66mr18088483vkd.22.1617731041913;
 Tue, 06 Apr 2021 10:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210401233216.2540591-1-samitolvanen@google.com>
 <20210401233216.2540591-15-samitolvanen@google.com> <20210406115357.GE96480@C02TD0UTHF1T.local>
In-Reply-To: <20210406115357.GE96480@C02TD0UTHF1T.local>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 6 Apr 2021 10:43:50 -0700
Message-ID: <CABCJKuchDg74Md_He1nKgXKUf=pVEmiaVr_yJXB_yX+tKNhByA@mail.gmail.com>
Subject: Re: [PATCH v5 14/18] arm64: add __nocfi to functions that jump to a
 physical address
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        bpf <bpf@vger.kernel.org>, linux-hardening@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 6, 2021 at 4:54 AM Mark Rutland <mark.rutland@arm.com> wrote:
>
> [adding Ard for EFI runtime services bits]
>
> On Thu, Apr 01, 2021 at 04:32:12PM -0700, Sami Tolvanen wrote:
> > Disable CFI checking for functions that switch to linear mapping and
> > make an indirect call to a physical address, since the compiler only
> > understands virtual addresses and the CFI check for such indirect calls
> > would always fail.
>
> What does physical vs virtual have to do with this? Does the address
> actually matter, or is this just a general thing that when calling an
> assembly function we won't have a trampoline that the caller expects?

No, this is about the actual address. The compiler-generated runtime
checks only know about EL1 virtual addresses, so if we switch to a
different address space, all indirect calls will trip CFI.

> I wonder if we need to do something with asmlinkage here, perhaps?
>
> I didn't spot anything in the seriues handling EFI runtime services
> calls, and I strongly suspect we need to do something for those, unless
> they're handled implicitly by something else.
>
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> > ---
> >  arch/arm64/include/asm/mmu_context.h | 2 +-
> >  arch/arm64/kernel/cpu-reset.h        | 8 ++++----
> >  arch/arm64/kernel/cpufeature.c       | 2 +-
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> >https://www.cnbc.com/2021/04/06/donald-trump-save-america-pac-has-85-million-on-hand-ahead-of-midterms.html
> > diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> > index 386b96400a57..d3cef9133539 100644
> > --- a/arch/arm64/include/asm/mmu_context.h
> > +++ b/arch/arm64/include/asm/mmu_context.h
> > @@ -119,7 +119,7 @@ static inline void cpu_install_idmap(void)
> >   * Atomically replaces the active TTBR1_EL1 PGD with a new VA-compatible PGD,
> >   * avoiding the possibility of conflicting TLB entries being allocated.
> >   */
> > -static inline void cpu_replace_ttbr1(pgd_t *pgdp)
> > +static inline void __nocfi cpu_replace_ttbr1(pgd_t *pgdp)
>
> Given these are inlines, what's the effect when these are inlined into a
> function that would normally use CFI? Does CFI get supressed for the
> whole function, or just the bit that got inlined?

Just for the bit that gets inlined.

> Is there an attribute that we could place on a function pointer to tell
> the compiler to not check calls via that pointer? If that existed we'd
> be able to scope this much more tightly.

There isn't, but I do agree that this would be a useful feature.

Sami
