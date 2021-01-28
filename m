Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2A530807F
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbhA1VZv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:25:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231534AbhA1VZh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:25:37 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A1E5C061574
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:24:57 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id kx7so4627324pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+JZFKkCox+l0s0cYd1+INkB1kfXhbwYrbrUbWWmGMmM=;
        b=XlHyfmsBLjkC6HEbUdiSOn2+lcw3fDoeSJzv2lYEZCWf1ufRUTD94lMNIJR+I0X4cp
         OofJfFesGtFUq+g5Kmbkt5S1ohNInCZC+KoT2bmbB7iXGSnDrLSDN+Lw73ZcHOpvRAMt
         tssW1WwRYiT9kaLLRpwFhWCuUbE6wend/Fttna03yu7MisdR7FguuSxHhOpTX893gSfn
         ofGdhO1XjfsxbniHVJq+hLA+gho7YSpy4E+AauYEiGcALugLvowo4HgzExY9R60X1uiA
         h0GZZhIBu98oMPpBn/FewBlx0zBFohHMr4d/Krs5EKoSafTzzFT01CIVxYRnSzJrP9kI
         CwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+JZFKkCox+l0s0cYd1+INkB1kfXhbwYrbrUbWWmGMmM=;
        b=P1KiUhkFtQ0IWp5D3rRg3DdYyiNoTHDrMomEilOzujckiKk/uU9j4jjw5JeH3mbUus
         c9ryBOUFkVcL/TNGJC1se6KSYO+kYkCv/CarudJOjOA0Kii8LA1igvNgVjEm0QbLpi7R
         /tbpEHxs9k1eVYBP6SSHQAhsAqpCSZHswkb8uXmYZwXGCkpTh3IIBETIeJNadxSjZoCN
         CLXvfVE1wHvMaE0pwSMboT9zCGPzi+yUiBkXL1qKrSSHyeEot/P4DVDK76NH+Zn7QKF7
         bk+BkyMdXb9jz9wrVo3Cgr4nlMxr/0ac7nRIiJUPFbKeO66gR658zBfo0uWASsbBzOZF
         whlw==
X-Gm-Message-State: AOAM532648xT81nj8uIWqb3i8wuThGL2ObfGb/Gk2Ss9QqDRjLLdWYTe
        3o/EU+wwbmzGiJJjq6Zice9UeFiYlGc23rCaAOVX5w==
X-Google-Smtp-Source: ABdhPJyWiCtGwsHmupM0W5sMCXtdW8j4OTEFq9xPSmEQ4t759OvDc0XCIimKRB+ANsrIhNf5Yp5XcfvbeAJqgZqjV9E=
X-Received: by 2002:a17:902:ed94:b029:de:8844:a650 with SMTP id
 e20-20020a170902ed94b02900de8844a650mr1307260plj.56.1611869096670; Thu, 28
 Jan 2021 13:24:56 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com>
 <CA+icZUU=XfwqMcXYonQKcD4QgqTBW-mA+d_84b7cU2R3HYPOSQ@mail.gmail.com>
 <CAKwvOdnUm2FqC0CEF3qFuMCaWoqiUMqr7ddMjA2UNsJugA9DNQ@mail.gmail.com> <CA+icZUWJu0FWdRY0DMQxpYwjqq1WTB87y9u1-6t3YMmkR3UsBQ@mail.gmail.com>
In-Reply-To: <CA+icZUWJu0FWdRY0DMQxpYwjqq1WTB87y9u1-6t3YMmkR3UsBQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Jan 2021 13:24:45 -0800
Message-ID: <CAKwvOdnVic2MiVSkiTQGGKPFKtJrf=kt1LgjWejOK6mMtMiX3Q@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 1:19 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Thu, Jan 28, 2021 at 10:12 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Thu, Jan 28, 2021 at 12:46 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > [ LLVM ]
> > >
> > > Today, I switched over to LLVM version 12.0.0-rc1.
> > >
> > >
> > > [ Step #1: 5.11.0-rc5-5-amd64-clang12-pgo ]
> > >
> > > My first kernel was built with CONFIG_PGO_CLANG=y and LLVM=1 plus LLVM_IAS=1.
> > >
> > > [ start-build_5.11.0-rc5-5-amd64-clang12-pgo.txt ]
> > > dileks    193090  193065  0 06:54 pts/2    00:00:00 /usr/bin/perf_5.10
> > > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > > LD=ld.lld LLVM=1 LLVM_IAS=1 PAHOLE=/opt/pahole/bin/pahole
> > > LOCALVERSION=-5-amd64-clang12-pgo KBUILD_VERBOSE=1
> > > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > > KDEB_PKGVERSION=5.11.0~rc5-5~bullseye+dileks1
> > >
> > > Config: config-5.11.0-rc5-5-amd64-clang12-pgo
> > >
> > >
> > > [ Step #2: x86-64 defconfig & vmlinux.profdata ]
> > >
> > > Booted into 5.11.0-rc5-5-amd64-clang12-pgo and built an x86-64
> > > defconfig to generate/merge a vmlinux.profdata file.
> > >
> > > [ start-build_x86-64-defconfig.txt ]
> > > dileks     18430   15640  0 11:15 pts/2    00:00:00 make V=1 -j4
> > > HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang LD=ld.lld LLVM=1
> > > LLVM_IAS=1
> > >
> > > Script: profile_clang-pgo.sh
> > > Config: dot-config.x86-64-defconfig
> > >
> > >
> > > [ Step #3.1: 5.11.0-rc5-6-amd64-clang12-pgo & GNU-AS ]
> > >
> > > The first rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> > > KCFLAGS=-fprofile-use=vmlinux.profdata".
> > > I was able to boot into this one.
> > > Used assembler: GNU-AS 2.35.1
> > >
> > > [ start-build_5.11.0-rc5-6-amd64-clang12-pgo.txt ]
> > > dileks     65734   65709  0 11:54 pts/2    00:00:00 /usr/bin/perf_5.10
> > > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > > LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> > > LOCALVERSION=-6-amd64-clang12-pgo KBUILD_VERBOSE=1
> > > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > > KDEB_PKGVERSION=5.11.0~rc5-6~bullseye+dileks1 LLVM=1
> > > KCFLAGS=-fprofile-use=vmlinux.profdata
> > >
> > > Config: config-5.11.0-rc5-6-amd64-clang12-pgo
> > >
> > >
> > > [ Step #3.2: 5.11.0-rc5-7-amd64-clang12-pgo & Clang-IAS ]
> > >
> > > The second rebuild with CONFIG_PGO_CLANG=n and "LLVM=1
> > > KCFLAGS=-fprofile-use=vmlinux.profdata" plus LLVM_IAS=1.
> > > Compilable but NOT bootable in QEMU and on bare metal.
> > > Used assembler: Clang-IAS v12.0.0-rc1
> > >
> > > [ start-build_5.11.0-rc5-7-amd64-clang12-pgo.txt ]
> > > dileks      6545    6520  0 16:31 pts/2    00:00:00 /usr/bin/perf_5.10
> > > stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++ HOSTLD=ld.lld CC=clang
> > > LD=ld.lld PAHOLE=/opt/pahole/bin/pahole
> > > LOCALVERSION=-7-amd64-clang12-pgo KBUILD_VERBOSE=1
> > > KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
> > > KBUILD_BUILD_TIMESTAMP=2021-01-28 bindeb-pkg
> > > KDEB_PKGVERSION=5.11.0~rc5-7~bullseye+dileks1 LLVM=1
> > > KCFLAGS=-fprofile-use=vmlinux.profdata LLVM_IAS=1
> > >
> > > Config: config-5.11.0-rc5-7-amd64-clang12-pgo
> > >
> > >
> > > [ Conclusion ]
> > >
> > > The only statement I can tell you is a "PGO optimized" rebuild with
> > > LLVM_IAS=1 is compilable but NOT bootable.
> >
> > Thanks for the extensive testing and report. Can you compress, upload,
> > and post a link to your kernel image? I would like to take it for a
> > spin in QEMU and see if I can find what it's doing, then work
> > backwards from there.
> >
>
> Which files do you need?
> For QEMU: bzImage and initrd.img enough?

bzImage should be enough; I'll use my own initrd.  If that boots for
me, maybe then I'll take a look with the initrd added.
-- 
Thanks,
~Nick Desaulniers
