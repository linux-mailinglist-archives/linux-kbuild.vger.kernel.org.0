Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C6D442B847
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 09:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhJMHDp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Oct 2021 03:03:45 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:54890 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231346AbhJMHDo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Oct 2021 03:03:44 -0400
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 19D71OH4011797;
        Wed, 13 Oct 2021 16:01:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 19D71OH4011797
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634108485;
        bh=dW44K0fonPJ8UjFfN6cGem0R0vP/XKyHNFnnWHXMbnc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Zncc5dLu2xeH+46pjkKIRt34hQ9VBLzBu0+5ZwmfuE7ESzeBVV6yspRIM4AyyFOUj
         c0wqq5Hm1jQ8ZeIBw0QmkwKGJnu4NqN5E959fk/SBseKQaLG4beiRqBQ+HVuaWlXOi
         1g8sbbp/R/nQXMYVCprnvrddL+PomMPfyDEGCNDgftVBsvpn2sg497LwvcEwgn/knQ
         5us+qVTq6FExT/k98APkPL5uK87DR1/JrCYy0gOfk8punPH72iHbCLDYWLZNJ3MQS/
         7jbbZEZQOu3sAgbPINfCLcDYfxEcjW1I3WqxnkYMk010ltdYSrO8wk94vGsegtut/N
         tP2+A7FOxbGiw==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id g9so1142626plo.12;
        Wed, 13 Oct 2021 00:01:25 -0700 (PDT)
X-Gm-Message-State: AOAM533yZTevl441fDPv4pwYRMt/FkKPwzosU5LfYgkSuwy1AAH/fzYZ
        ZB/2Z0T8Z5YFWwyjEoiLz2gdu3wdy0nHPgTqx7A=
X-Google-Smtp-Source: ABdhPJyg9Bv04HQDJ7uIQbpcQ+Bkz8Yt7hWnrXOix9Ihwb1fVIQEpqQA1RUaMRuT6GTBhmw2frKE51aJe+EWtiUVDxU=
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr11361427pjb.144.1634108483842;
 Wed, 13 Oct 2021 00:01:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211012170121.31549-1-vegard.nossum@oracle.com>
 <CAK7LNAT_0PnW0opWQoCiF5mWH4YEKxXHbdiTrSGqGFRv5nhY=w@mail.gmail.com> <68df3063-1dda-4736-27b4-8716321620c7@oracle.com>
In-Reply-To: <68df3063-1dda-4736-27b4-8716321620c7@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 13 Oct 2021 16:00:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNARsA8P=OmRzMqc9Xa3TWw=zk+Fi7WUGENdOCYaF6fYMrw@mail.gmail.com>
Message-ID: <CAK7LNARsA8P=OmRzMqc9Xa3TWw=zk+Fi7WUGENdOCYaF6fYMrw@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: only prompt for compressors that are actually usable
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 13, 2021 at 2:39 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 10/13/21 3:34 AM, Masahiro Yamada wrote:
> > On Wed, Oct 13, 2021 at 2:01 AM Vegard Nossum <vegard.nossum@oracle.com> wrote:
> >>
> >> If a given compression algorithm for the kernel image is not usable on
> >> the host system, there is no point prompting for it.
> >>
> >> We can use the kconfig preprocessing feature to check if the command is
> >> available or not. I've chosen to test this using "which", which exits
> >> with success if the given command exists in PATH (or it is an absolute
> >> path), which mimics exactly how it would be found in the kernel's
> >> Makefiles.
> >>
> >> This uses the make variables that are set in Makefile and/or the
> >> command line, so you can do e.g.
> >>
> >>   make KGZIP=pigz menuconfig
> >>
> >> and it will test for the correct program.
> >>
> >> I am intentionally adding these dependencies to e.g. KERNEL_LZ4, as
> >> opposed to HAVE_KERNEL_LZ4, since the latter are "select"-ed
> >> unconditionally by the architectures that use them, so they are not
> >> suitable for depending on anything else.
> >>
> >> I've put RFC in the subject as maybe there are downsides to this that
> >> I'm not aware of.
> >>
> >> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> >> ---
> >
> >
> > I think we should keep the host-tools dependency open in general.
> > You can easily install necessary packages.
>
> So just to be clear, you object to the patch because it hides the
> possibility of using a different compression algorithm from the user and
> doesn't give them a chance to know that it exists when it's not already
> installed?

Yes, I object to it.



> I don't really think this is much different from any other choice block
> in the config where the visibility of the choices have dependencies on
> other config options.

Kconfig checks some compiler features, otherwise we have no way
to avoid build errors.


> In my case, the reason for doing this patch was that I was seeing build
> failures during randomized testing (satrandconfig) due to missing
> programs, and these build failures appear only at the end of potentially
> very time-consuming builds.

I do not know Oracle's case, but
I think other CI systems install all needed packages for randconfig.

Similar discussions happened a couple of times in the past.
We keep the tools dependency open since it is just a matter of
"apt install" or "dnf install" basically.



"and equally importantly, your build servers will actually do a better
job of covering the different build options."  (Linus Torvalds) [1]

[1]: https://lore.kernel.org/all/CAHk-=wjjiYjCp61gdAMpDOsUBU-A2hFFKJoVx5VAC7yV4K6WYg@mail.gmail.com/




> Maybe we can introduce a new option similar to COMPILE_TEST (or
> ADVANCED_OPTIONS) so that the options are showed by default, even when
> the host program is not available?


I do not think it is worth it.




> +config UNAVAILABLE_COMPRESSORS
> +       bool "Prompt for compressors that are not available"
> +       help
> +         Note: Enabling this option can lead to build failures if
> +         the chosen compressor is not available on the host machine.
>
>  config KERNEL_GZIP
>         bool "Gzip"
>         depends on HAVE_KERNEL_GZIP
> +       depends on UNAVAILABLE_COMPRESSORS || $(success,which $(KGZIP))
>         help
>           The old and tried gzip compression. It provides a good balance
>           between compression ratio and decompression speed.
>
>
> Vegard



-- 
Best Regards
Masahiro Yamada
