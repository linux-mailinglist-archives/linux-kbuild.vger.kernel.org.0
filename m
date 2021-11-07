Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1A6F44722A
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Nov 2021 09:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234210AbhKGIZ6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 7 Nov 2021 03:25:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:45148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229966AbhKGIZ5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 Nov 2021 03:25:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F4F46137C
        for <linux-kbuild@vger.kernel.org>; Sun,  7 Nov 2021 08:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636273395;
        bh=aGsadPP5l1YvS1H+CB9wiuvRdHKzA2EZwp0tSjEqfpM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aJmjNN3Yg1/BIWupSZEAFIUxoJu35LKUUeIFPl2CVfVVHt9x/p1MBpOEqWwUT+EoO
         arScxDjupUFU7AQBH3I5KGA4VCmikQSi0AHjwQiPFC+/qupuaXHR77RgKzPCgA+7I9
         aBBf+FCuBSZD9xUMKjOMqkG6E5S6Xcfd1RHkh/kmy2KwdWoo9g+OGh9u+IxMb4hMXo
         Q/Do0igGakmieyGeENenceQ8Ab8WsaCGtzYHLODhniYUOeLc6KAcpu42z1AlH5H8+L
         FUem9JF4tPJsjfggK8vsiIj14M84Vdz54OU0e5bkzDCE7X/lLfNZm3HNodc8llhvag
         00f9rWikby39w==
Received: by mail-ot1-f44.google.com with SMTP id h12-20020a056830034c00b0055c8458126fso1556467ote.0
        for <linux-kbuild@vger.kernel.org>; Sun, 07 Nov 2021 01:23:15 -0700 (PDT)
X-Gm-Message-State: AOAM531bXcFowyd0pijCW/kfheKiKgfkC+Bv628yFLxYdlDy2nCLGLa4
        wJKwoBrwpLXTMU7ODslWfJm4vJ0lZ8dsAj/eZVc=
X-Google-Smtp-Source: ABdhPJzCFwhgLGrsckz9mR7uf3HQk1pjTuH8jiwnd45Z3dAi0EgtMITwverxApHO/WJ7O453I8o7urX/GhFAjgQ4RLI=
X-Received: by 2002:a9d:830:: with SMTP id 45mr29165833oty.112.1636273394851;
 Sun, 07 Nov 2021 01:23:14 -0700 (PDT)
MIME-Version: 1.0
References: <560695744.1785825.1636169664203.ref@mail.yahoo.com>
 <560695744.1785825.1636169664203@mail.yahoo.com> <CAK7LNASUeUxDcfA-C9vFC6y7J=YzO7K7RbS99mxGguAFwKhTnA@mail.gmail.com>
 <CAMj1kXH=R45ovS43z9uDMJsMKwwv9E8M2LwKYmY7W4jNF6_sBg@mail.gmail.com>
 <1604600353.1975912.1636259046097@mail.yahoo.com> <CAMj1kXFC=SNp7aqbOm9qdYrJ2+ubgDfpRzYL344A7CgX37Hh5w@mail.gmail.com>
In-Reply-To: <CAMj1kXFC=SNp7aqbOm9qdYrJ2+ubgDfpRzYL344A7CgX37Hh5w@mail.gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Sun, 7 Nov 2021 09:23:03 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF18CSvDZQZT5ZnyoJEnrLmDgaahZUdD90wxFbv4iCDPA@mail.gmail.com>
Message-ID: <CAMj1kXF18CSvDZQZT5ZnyoJEnrLmDgaahZUdD90wxFbv4iCDPA@mail.gmail.com>
Subject: Re: Given an x32 userspace with a gcc to match (ie defaults to -mx32)
 then CONFIG_EFI_STUB is unavailable
To:     Seed Of Onan <seedofonan@yahoo.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 7 Nov 2021 at 08:58, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sun, 7 Nov 2021 at 05:24, Seed Of Onan <seedofonan@yahoo.com> wrote:
> >
> > > IIUC, the issue is in
> > > config EFI_STUB
> > >  :
> > >    depends on $(cc-option,-mabi=ms) || X86_32
> > > where the cc-option check is failing due to the use of
> > > -mx32 for the core kernel, whereas the EFI stub will be
> > > built with -m64 regardless.
> > Yes, except, the kernel can't be built with -mx32, only -m32 or -m64. The -m64 option gets added to the compile flags in arch/x86/Makefile on 64bit builds.
> >
>
> Right, so it is just the compiler default
>
> > > Given that __attribute__((ms_abi)) should be supported on any
> > > GCC versions 4.8 or newer, I think we can just drop this
> > > depends line entirely. Would that solve your issue?
> > Yes it would, but it sure seems to me to be the wrong way -- gcc is not the only compiler, and the ms calling convention isn't required to build the kernel otherwise, is it?
> >
>
> I don't follow. All compilers that we support implement this so why test for it?
>
> > I found in scripts/Kconfig.include a variable that is "-m64 if the compiler supports it, or an empty string otherwise":
> >     depends on $(cc-option,$(m64-flag) -mabi=ms) || X86_32
> >
> > I don't get the "|| X86_32" part -- can it really be that when building an x86_32 kernel, there is no concern about the support for the calling convention needed by the efi stub? But whatever.
>
> Of course we care about the calling convention. Why would you think
> that we don't?

Note that 32-bit UEFI code uses __attribute__((regparm(0))) as the
calling convention not ms_abi
