Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D01331701
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Mar 2021 20:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhCHTLp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Mar 2021 14:11:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCHTLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Mar 2021 14:11:40 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B493C06175F
        for <linux-kbuild@vger.kernel.org>; Mon,  8 Mar 2021 11:11:40 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id d25so5438843vsr.11
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Mar 2021 11:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i+YqN6/BonSiVeAMXE6BrX07AcSfEu2bZuI4K6dyeGs=;
        b=tFRWlYBz4jdkgSvYUFFKinpnZ3qnIXEvIzqUU35H9pO1jXTOZwk8RP5RrRgFBeNEJv
         sAO470V+mT9+QqFSC8x2BZq9U5lR+ZlXRHRQv/rJEPEJvZzj7ZIuTTkddFZccZY9wQwy
         KXH8ouKYfrsPaZOTXgc/oMGxcefX66NNvbDBOdS5nbsoX0VjAKwPuLErSGCfumOb/u4M
         cysthcPnmqyBN+WGFLMu7IAkPecQZdLoHC8IW1Wk2WqNuuETiFuJW6HuewYBashgATr2
         zJwMK7I52szFFGyrNJnEbIxKE0dlyepaDoWOiKIAhgmNk7ZOrM+Cmapbz7Rv7WGCsJNd
         blpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i+YqN6/BonSiVeAMXE6BrX07AcSfEu2bZuI4K6dyeGs=;
        b=FI5IhMI4BM+5Dzc68WdaxBXLbfq4fnmobL506zeWmPQShcJ6HJ84nrlv2hIlecjhN/
         Bu/Zqrh0/tVNkDwoZa/lk75ndX3HKhr+zy+fv9TiPIUgxty1zMk5ermBkOw5WeYrRGkz
         rgeFMQrJbffusYgkYnoCyfWK4CiR/Ssl9BtvwvX3HoRCqKYl3csSSLbGZHX950EXhvqd
         pajqW7kzcVtBY1PV5zvk6n3AHJQO0Xt6kdS+IlWvciHlJm8vKPxytCKUg9sABRVFIIB5
         rmZ0aAyGc/Lwit9mVfwmRYBMfesxcAdTqIixddjhlRj7Mi6rL5/hfegKh+kWf6kqClyB
         JsnA==
X-Gm-Message-State: AOAM532NLYGUeiEhKEeot+PUccVZc8KaL7biJrbmebZ4GPstQiYM8JVp
        2Lhz5xlXRpDusD/yyRrGRfz7+Ph3HkhCmW85ekH79Q==
X-Google-Smtp-Source: ABdhPJwnBwBvByMLaIc5q/vWlaZhIdfejCcE6Rc7+VJQZPrDZSWBcMhnJFLT4Ta/n0CH+Z1KOLJAyR6HbDJ4B2g+v2s=
X-Received: by 2002:a67:5ec1:: with SMTP id s184mr13870317vsb.36.1615230699312;
 Mon, 08 Mar 2021 11:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20210303183333.46543-1-masahiroy@kernel.org> <CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E+GL3SyOk-jQ0kdXtMzg@mail.gmail.com>
In-Reply-To: <CAKwvOdkhZGv_q9vgDdYY44OrbzmMD_E+GL3SyOk-jQ0kdXtMzg@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Mon, 8 Mar 2021 11:11:28 -0800
Message-ID: <CABCJKudmzK=AhtMpZt6X3BDG7NHmf9C6ncEt9JJAv+uto14qXQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: remove LLVM=1 test from HAS_LTO_CLANG
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <nathan@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 3, 2021 at 12:47 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
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
>
> (Also, the rest of the patches in this series seem more related to
> DWARFv5 cleanups; this patch seems orthogonal while those are a
> visible progression).
>
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

I'm fine with removing the check, but the idea here was to just make
it slightly harder for people to accidentally use a mismatched
toolchain, even though checking for LLVM=1 doesn't stop them from
doing so anyway. But yes, the only LLVM tools required in addition to
the compiler and the linker are llvm-ar and llvm-nm.

Sami
