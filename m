Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768BD447221
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Nov 2021 08:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233694AbhKGIBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Nov 2021 03:01:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:43622 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhKGIBm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Nov 2021 03:01:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E7556108E
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Nov 2021 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636271940;
        bh=CKhYmJHn79rq11/Sia7dXrLRf49DKTEqCuYyYy84tYY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Oab7u+jU3bTnGyRfeSfVII3jpkBVK9FZCMLc4u7EmiBtu2hF9Tw/fMRcQJi7d2LMI
         uSyVHJgQdibTZV9B7cE0rhC9bUvB/fO3LYMMCmL70ykuUHXTEhuYWBIv2j/z1rGLLF
         6DC4/YmjtJ4s3lRaOTvMu2cMtHbhrFpJYeppGp+T/dejWhQE3gzUbM0jG5po3cizTo
         0m/+vZJgeZK8ok/cUkC+5CRw5tZ78bcgbkMjVLiTpqycVvnGsqdleDAdb6va15x12O
         vJwPTyVd8QVwCDQevJRNjiEAb3AZJ2NdUdmyrdykSOmasz63lYTkC2k47ZwcTvOMTY
         P390rG8iuagdg==
Received: by mail-ot1-f51.google.com with SMTP id b5-20020a9d60c5000000b0055c6349ff22so9645859otk.13
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Nov 2021 00:59:00 -0700 (PDT)
X-Gm-Message-State: AOAM5327Jbr+kU8V5oS4zrjx8osR4nPfXVatAnUd1QZ4cwR9AIoZnygs
        YqI+6B3STRnuGYvMQRQ3zp/2ItmtPsN2eeqBg5c=
X-Google-Smtp-Source: ABdhPJxTk/ReFPmiYjGZU0ASPtTyqbB4fXYEU1ZqaqNuLQAuovcpZDMvDqkt99dSM7TM+R1aSyG8kb3IIxXYJVMzXoQ=
X-Received: by 2002:a9d:5911:: with SMTP id t17mr56363875oth.30.1636271939484;
 Sun, 07 Nov 2021 00:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <560695744.1785825.1636169664203.ref@mail.yahoo.com>
 <560695744.1785825.1636169664203@mail.yahoo.com> <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
 <CAMj1kXH=R45ovS43z9uDMJsMKwwv9E8M2LwKYmY7W4jNF6_sBg@mail.gmail.com> <1604600353.1975912.1636259046097@mail.yahoo.com>
In-Reply-To: <1604600353.1975912.1636259046097@mail.yahoo.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sun, 7 Nov 2021 08:58:48 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFC=SNp7aqbOm9qdYrJ2+ubgDfpRzYL344A7CgX37Hh5w@mail.gmail.com>
Message-ID: <CAMj1kXFC=SNp7aqbOm9qdYrJ2+ubgDfpRzYL344A7CgX37Hh5w@mail.gmail.com>
Subject: Re: Given an x32 userspace with a gcc to match (ie defaults to -mx32)
 then CONFIG_EFI_STUB is unavailable
To:     Seed Of Onan <seedofonan@yahoo.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 7 Nov 2021 at 05:24, Seed Of Onan <seedofonan@yahoo.com> wrote:
>
> > IIUC, the issue is in
> > config EFI_STUB
> >  :
> >    depends on $(cc-option,-mabi=ms) || X86_32
> > where the cc-option check is failing due to the use of
> > -mx32 for the core kernel, whereas the EFI stub will be
> > built with -m64 regardless.
> Yes, except, the kernel can't be built with -mx32, only -m32 or -m64. The -m64 option gets added to the compile flags in arch/x86/Makefile on 64bit builds.
>

Right, so it is just the compiler default

> > Given that __attribute__((ms_abi)) should be supported on any
> > GCC versions 4.8 or newer, I think we can just drop this
> > depends line entirely. Would that solve your issue?
> Yes it would, but it sure seems to me to be the wrong way -- gcc is not the only compiler, and the ms calling convention isn't required to build the kernel otherwise, is it?
>

I don't follow. All compilers that we support implement this so why test for it?

> I found in scripts/Kconfig.include a variable that is "-m64 if the compiler supports it, or an empty string otherwise":
>     depends on $(cc-option,$(m64-flag) -mabi=ms) || X86_32
>
> I don't get the "|| X86_32" part -- can it really be that when building an x86_32 kernel, there is no concern about the support for the calling convention needed by the efi stub? But whatever.

Of course we care about the calling convention. Why would you think
that we don't?
