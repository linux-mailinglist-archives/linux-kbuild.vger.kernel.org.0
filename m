Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6AE132E1FB
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Mar 2021 07:07:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbhCEGHE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Mar 2021 01:07:04 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:35590 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhCEGHD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Mar 2021 01:07:03 -0500
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12566f6G027079;
        Fri, 5 Mar 2021 15:06:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12566f6G027079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614924402;
        bh=axtBVNcIKru8BTiupCH9xPKdR4trfvDzg7QV+dWIl84=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UnkXThtIV0P6A/Qzd4zEc4txigdJdqvV4LMYz7RB4w8evjXA7uK9k7JKeDmrgkx0l
         V7qFVyxGKYTsB8OOm0EjA9GNgxLGN/h7rU3WnQ7B4Vd9OMFcisej3JRDlhmd4RWIjG
         oN4NI9c8IGZSpbVin9dKx8ffN3piql5iEkxqTc5HDJJJGbkoIl6lMMPsUy03rV5Y09
         /HqahoJxUNGrJnWbYS5pgbyPpkgy7KoY6Oux/ed3+931R7hSo+Dsd7hGogTxDZVW2b
         pQ22CoI+r/TCEglDS3IPq+YbUC9+vNd23u38ZHy1RGm+Rp8ZVTxz4pLZRpuSqK72qy
         DksjTPPFDfPEQ==
X-Nifty-SrcIP: [209.85.216.52]
Received: by mail-pj1-f52.google.com with SMTP id jx13so1216621pjb.1;
        Thu, 04 Mar 2021 22:06:41 -0800 (PST)
X-Gm-Message-State: AOAM531Q/O1oVqNVs3utaBHgWY3eaoh9/pjdccq2bhgrBjeGYyGVtRuM
        nZGtUFtxo2yEQMc8qEKC3fU7xzCTrAu8GCvSVrM=
X-Google-Smtp-Source: ABdhPJwsJvOTmO9gWuAKFbnHPgtJ8A5SPQ6B2s5Gmeeb4KSBm+FsOxMLNtRfxzOSwYcqKTZZw+RUEWLWM6oVz1NxHrg=
X-Received: by 2002:a17:90a:dc08:: with SMTP id i8mr8206973pjv.153.1614924401138;
 Thu, 04 Mar 2021 22:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E+GL3SyOk-jQ0kdXtMzg@mail.gmail.com>
In-Reply-To: <CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E+GL3SyOk-jQ0kdXtMzg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Mar 2021 15:06:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ4SibwSONO8io5_b1d-ELmfTYTpwfwJk=ABcfsNhEU3g@mail.gmail.com>
Message-ID: <CAK7LNAQ4SibwSONO8io5_b1d-ELmfTYTpwfwJk=ABcfsNhEU3g@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 5:47 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> + Sami
>
> On Wed, Mar 3, 2021 at 10:34 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > This guarding is wrong. As Documentation/kbuild/llvm.rst notes, LLVM=1
> > switches the default of tools, but you can still override CC, LD, etc.
> > individually.
> >
> > BTW, LLVM is not 1/0 flag. If LLVM is not passed in, it is empty.
>
> Do we have the same problem with LLVM_IAS?  LGTM otherwise, but wanted
> to check that before signing off.

3/4 will replace this LLVM_IAS check with AS_IS_LLVM.

We do not need to add a noise change.




>
> (Also, the rest of the patches in this series seem more related to
> DWARFv5 cleanups; this patch seems orthogonal while those are a
> visible progression).

Kind of orthogonal, but I am touching the same code hunk,
which would cause a merge conflict.


> >
> > Non-zero return code is all treated as failure anyway.
> >
> > So, $(success,test $(LLVM) -eq 1) and $(success,test "$(LLVM)" = 1)
> > works equivalently in the sense that both are expanded to 'n' if LLVM
> > is not given. The difference is that the former internally fails due
> > to syntax error.
> >
> >   $ test ${LLVM} -eq 1
> >   bash: test: -eq: unary operator expected
> >   $ echo $?
> >   2
> >
> >   $ test "${LLVM}" -eq 1
> >   bash: test: : integer expression expected
> >   $ echo $?
> >   2
> >
> >   $ test "${LLVM}" = 1
> >   echo $?
> >   1
> >
> >   $ test -n "${LLVM}"
> >   $ echo $?
> >   1
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/Kconfig | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 2bb30673d8e6..2af10ebe5ed0 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -632,7 +632,6 @@ config HAS_LTO_CLANG
> >         def_bool y
> >         # Clang >= 11: https://github.com/ClangBuiltLinux/linux/issues/510
> >         depends on CC_IS_CLANG && CLANG_VERSION >= 110000 && LD_IS_LLD
> > -       depends on $(success,test $(LLVM) -eq 1)
>
> IIRC, we needed some other LLVM utilities like llvm-nm and llvm-ar,
> which are checked below. So I guess we can still support CC=clang
> AR=llvm-ar NM=llvm-nm, and this check is redundant.

Yes, I think so.


>
> >         depends on $(success,test $(LLVM_IAS) -eq 1)
> >         depends on $(success,$(NM) --help | head -n 1 | grep -qi llvm)
> >         depends on $(success,$(AR) --help | head -n 1 | grep -qi llvm)
> > --
> > 2.27.0
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E%2BGL3SyOk-jQ0kdXtMzg%40mail.gmail.com.



-- 
Best Regards
Masahiro Yamada
