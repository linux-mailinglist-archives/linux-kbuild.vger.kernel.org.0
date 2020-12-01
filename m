Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1C32CA3E4
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 14:32:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391138AbgLANaU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 08:30:20 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44554 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387677AbgLANaU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 08:30:20 -0500
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B1DT7KD007726;
        Tue, 1 Dec 2020 22:29:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B1DT7KD007726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606829348;
        bh=zMmj+GVqjUXMVH8pNvSfsy5XEgzhkJMYROtJdnMN3pY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iWwW+u7AL0wi0eiCli/wxrySa1Ui0X2/+q040eqPUcBUg0OpAQVTSbNkrpTlbQiVo
         y2Gn/lLQ1NrrOj1Epa0ZR4DXlxVXAFSrPi4LKHY+1m4cT1RatL/mDTpnbQ27Ft5UuS
         ZMSkRtKi179h2FVxV4/ywcJJshTUC5dXcO92eRfmcU/1V5/YvOC1i8q21I/RYslapR
         QaFcRUytmzIvxKR5E/N1DgSrDcIg3y6JhOHkTmoUQg+ghDvEF0otzPtYF2XQdXmWcS
         +5igzk5l1lvtycWphzgOoIDGHXH9pH+UJfdQBtyfPJDLWbpG6+CR9kmQhskO3eBaIA
         QNDTwavPoQk6w==
X-Nifty-SrcIP: [209.85.215.181]
Received: by mail-pg1-f181.google.com with SMTP id t37so1193127pga.7;
        Tue, 01 Dec 2020 05:29:08 -0800 (PST)
X-Gm-Message-State: AOAM530sgs5smY12zI0S1bx15OVJCzGD5Fb2ONo4vxDnm9V/tgAqjkph
        yGeirDcZ8BHNnUSXxzI1wqbSPtz4fnhCsF3C+Rc=
X-Google-Smtp-Source: ABdhPJwLhVrfKiBGqZeTDEx8ocu6LlfKlsT/3v235qiU0r8c0WZO0DqBqtiJr5jMPBwrzY0PYOy/XUJP6+BhtIdsI3s=
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id
 q6-20020aa796060000b029019814c44f44mr2478107pfg.80.1606829347544; Tue, 01 Dec
 2020 05:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-1-natechancellor@gmail.com> <202011201607.75FA476@keescook>
In-Reply-To: <202011201607.75FA476@keescook>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 1 Dec 2020 22:28:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNASmiWkw3+F1_AJWYDAXntcpcNQmdX0d_hVQq7oxQ_m74A@mail.gmail.com>
Message-ID: <CAK7LNASmiWkw3+F1_AJWYDAXntcpcNQmdX0d_hVQq7oxQ_m74A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Hoist '--orphan-handling' into Kconfig
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        X86 ML <x86@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 21, 2020 at 9:08 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Nov 19, 2020 at 01:46:56PM -0700, Nathan Chancellor wrote:
> > Currently, '--orphan-handling=warn' is spread out across four different
> > architectures in their respective Makefiles, which makes it a little
> > unruly to deal with in case it needs to be disabled for a specific
> > linker version (in this case, ld.lld 10.0.1).
> >
> > To make it easier to control this, hoist this warning into Kconfig and
> > the main Makefile so that disabling it is simpler, as the warning will
> > only be enabled in a couple places (main Makefile and a couple of
> > compressed boot folders that blow away LDFLAGS_vmlinx) and making it
> > conditional is easier due to Kconfig syntax. One small additional
> > benefit of this is saving a call to ld-option on incremental builds
> > because we will have already evaluated it for CONFIG_LD_ORPHAN_WARN.
> >
> > To keep the list of supported architectures the same, introduce
> > CONFIG_ARCH_WANT_LD_ORPHAN_WARN, which an architecture can select to
> > gain this automatically after all of the sections are specified and size
> > asserted. A special thanks to Kees Cook for the help text on this
> > config.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> > Acked-by: Kees Cook <keescook@chromium.org>
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> > Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> > Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Masahiro, do you want to take these to get them to Linus for v5.10? I
> can send them if you'd prefer.
>



Sorry for the delay.

Applied to linux-kbuild.





> -Kees
>
> --
> Kees Cook
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/202011201607.75FA476%40keescook.



-- 
Best Regards
Masahiro Yamada
