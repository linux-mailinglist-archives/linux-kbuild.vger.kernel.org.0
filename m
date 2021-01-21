Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E712FF828
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 23:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbhAUWpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 17:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbhAUWpX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 17:45:23 -0500
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A172DC06174A;
        Thu, 21 Jan 2021 14:44:43 -0800 (PST)
Received: by mail-io1-xd32.google.com with SMTP id x21so7376256iog.10;
        Thu, 21 Jan 2021 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=HvccmrfS5SgOEYdUs1blncI3hgFwaeqGnzFVcQFt3dc=;
        b=u1Qb7yOF9p/rb88qzEq4GviRLuH+MUSUAmAvzHLo5dvpmFP9zzB1w3jxT36IkT01MQ
         jitUXXbfbizxWQIi+aro8R5/RJaewpWWzpbgLwBMDylqZ8Sr2IWJESBKP7P/OKbJTY4N
         xLv7eyGHNVn7iv2If3D/zraYRTu67CNBtAaoV16zjOhdqrcgFa/sD2Qghn0LisjieqD0
         Kd4kDONo8FAvJkN4eYazTWOfQ/bSzE3G7PaJTrUNbGP3mHfVcREyhK53vgvKc1Dt2pRN
         RWePftjwHAWfexMa1aInBwqJ3oil0f6Qr70oIyp/l7IvVt4arfrZVrqV8kAfkDuTgLTO
         kLmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=HvccmrfS5SgOEYdUs1blncI3hgFwaeqGnzFVcQFt3dc=;
        b=YVgHCsH1FNNd4tSZ/s8X98eY7ijrbdrDCr56sgpIt5ctvyrt2BPGHnEXn7dLQne8E2
         J9AjZHGhhHs4On85SO9p0iayLhGYXsjv1ZSCnA+wNay17wguPvrz/1VwQv9NhIynyWlN
         QSVbCRJ2CYzjP2hzZj/uWDLHquRxb3YQ8JcsKOai3jcunbohDxtB38C16ovklU8BKSiQ
         UISEDFVkk4mJJvD5SVHqLDIvTBKRX5pI0RTKk6ClbobwqkzTLuhmn2R06TZpsyGIY0SW
         p2uvxhbJ5dsGZlgAXDpA0aY7bvYIlp9RDgIEB8rrb7kFnFHznq7Hp2XFFJYEEDW6tOv1
         jUAQ==
X-Gm-Message-State: AOAM531QUuS9k32IJIQ5zFt3jpEabrWTWz+OqFqO6otBklBWIQo2Asnc
        tezzRF58WfxLQmftbThdYc7XZkZkr0+KwqwvkGTS4qWxeevMJYN5
X-Google-Smtp-Source: ABdhPJz43mrrriVp8Cqor+enuQGh/IB1IH0yc1vlFlsHxQTDHV/y7F+MU5VgTHcPTlbl3EyCA2T/f/E5BRMe/AQgz7Y=
X-Received: by 2002:a6b:6a0e:: with SMTP id x14mr1296225iog.57.1611269083021;
 Thu, 21 Jan 2021 14:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20210113061958.886723-1-morbo@google.com> <20210116094357.3620352-1-morbo@google.com>
 <CA+icZUUgTuD6fO_AZFs9KoRFS8FUmyhezvYeeoRX2dveG_ifDA@mail.gmail.com>
 <CAGG=3QXZTR_f9pKzAR=LrALmMzdDqsvWM_zrTXOb2PpiDGB-+A@mail.gmail.com>
 <CA+icZUWf05ek+DFsJNyBc-4cg0s6cVrn=rNJDyL4RJ6=fMO5NA@mail.gmail.com>
 <CA+icZUVD1AHaXYu4Ne8JhzmtMR5DReL4C=ZxKfA0hjLtbC79qQ@mail.gmail.com>
 <CA+icZUUTJbwmTYCDJhyRtif3BdsB_yzQ3bSdLR62EmttJf3Row@mail.gmail.com>
 <CA+icZUUfWR1v3GStn6t_6MYDmwTdJ_zDwBTe2jmQRg7aOA1Q2A@mail.gmail.com>
 <CA+icZUU-3i7Of71C6XaNmee7xD4y_DeoWJFvUHnMUyBaMN3Ywg@mail.gmail.com>
 <CA+icZUXmn15w=kSq2CZzQD5JggJw_9AEam=Sz13M0KpJ68MWZg@mail.gmail.com>
 <CA+icZUWUPCuLWCo=kuPr9YZ4-NZ3F8Fv1GzDXPbDevyWjaMrJg@mail.gmail.com>
 <CAGG=3QW+ayBzCxOusLyQ0-y5K5C_3hNXjara_pYOcxK8MseN9g@mail.gmail.com>
 <CA+icZUU1HihUFaEHzF69+01+Picg8aq6HAqHupxiRqyDGJ=Mpw@mail.gmail.com>
 <CA+icZUUuzA5JEXyVzKbVX+T3xeOdRAU6-mntbo+VwwTxqmN7LA@mail.gmail.com>
 <CAGG=3QWmOA+yM2GJF+cHUb7wUq6yiBpHasa-ry9OhAdvciDm6Q@mail.gmail.com>
 <CA+icZUVwbWDtGUzMEkitxYn2UvbZPnFTxfJyDOY46j6BTK0deQ@mail.gmail.com>
 <CA+icZUXa9wvSWe=21_gjAapoHpbgBmYzFpQjb=o_WRQgK+O4gA@mail.gmail.com>
 <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com> <CA+icZUU+OWW46CVq4Co-y7hckGjoV5bbqxS-G+HDqUDci_AzHw@mail.gmail.com>
In-Reply-To: <CA+icZUU+OWW46CVq4Co-y7hckGjoV5bbqxS-G+HDqUDci_AzHw@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 21 Jan 2021 23:44:31 +0100
Message-ID: <CA+icZUV17FxhopdQhDCW6vBaSfgU-86vAE5QpoaW1iLxtsg5HA@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 3:03 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 10:56 PM Bill Wendling <morbo@google.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 9:26 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Mon, Jan 18, 2021 at 1:39 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > On Mon, Jan 18, 2021 at 3:32 AM Bill Wendling <morbo@google.com> wrote:
> > > > >
> > > > > On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > > >
> > > > > > [ big snip ]
> > > > >
> > > > > [More snippage.]
> > > > >
> > > > > > [ CC Fangrui ]
> > > > > >
> > > > > > With the attached...
> > > > > >
> > > > > >    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> > > > > > undefined symbols
> > > > > >
> > > > > > ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> > > > > > For details see ClangBuiltLinux issue #1250 "Unknown symbol
> > > > > > _GLOBAL_OFFSET_TABLE_ loading kernel modules".
> > > > > >
> > > > > Thanks for confirming that this works with the above patch.
> > > > >
> > > > > > @ Bill Nick Sami Nathan
> > > > > >
> > > > > > 1, Can you say something of the impact passing "LLVM_IAS=1" to make?
> > > > >
> > > > > The integrated assembler and this option are more-or-less orthogonal
> > > > > to each other. One can still use the GNU assembler with PGO. If you're
> > > > > having an issue, it may be related to ClangBuiltLinux issue #1250.
> > > > >
> > > > > > 2. Can you please try Nick's DWARF v5 support patchset v5 and
> > > > > > CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
> > > > > >
> > > > > I know Nick did several tests with PGO. He may have looked into it
> > > > > already, but we can check.
> > > > >
> > > >
> > > > Reproducible.
> > > >
> > > > LLVM_IAS=1 + DWARF5 = Not bootable
> > > >
> > > > I will try:
> > > >
> > > > LLVM_IAS=1 + DWARF4
> > > >
> > >
> > > I was not able to boot into such a built Linux-kernel.
> > >
> > PGO will have no effect on debugging data. If this is an issue with
> > DWARF, then it's likely orthogonal to the PGO patch.
> >
> > > For me worked: DWARF2 and LLVM_IAS=1 *not* set.
> > >
> > > Of course, this could be an issue with my system's LLVM/Clang.
> > >
> > > Debian clang version
> > > 12.0.0-++20210115111113+45ef053bd709-1~exp1~20210115101809.3724
> > >
> > Please use the official clang 11.0.1 release
> > (https://releases.llvm.org/download.html), modifying the
> > kernel/pgo/Kconfig as I suggested above. The reason we specify clang
> > 12 for the minimal version is because of an issue that was recently
> > fixed.
> >
>
> I downgraded to clang-11.1.0-rc1.
> ( See attachment. )
>
> Doing the first build with PGO enabled plus DWARF5 and LLVM_IAS=1 works.
>
> But again after generating vmlinux.profdata and doing the PGO-rebuild
> - the resulting Linux-kernel does NOT boot in QEMU or on bare metal.
> With GNU/as I can boot.
>
> So this is independent of DWARF v4 or DWARF v5 (LLVM_IAS=1 and DWARF
> v2 is not allowed).
> There is something wrong (here) with passing LLVM_IAS=1 to make when
> doing the PGO-rebuild.
>
> Can someone please verify and confirm that the PGO-rebuild with
> LLVM_IAS=1 boots or boots not?
>
> Thanks.
>
> - Sedat -
>
> > > Can you give me a LLVM commit-id where you had success with LLVM_IAS=1
> > > and especially CONFIG_DEBUG_INFO_DWARF5=y?
> > > Success means I was able to boot in QEMU and/or bare metal.
> > >
> > The DWARF5 patch isn't in yet, so I don't want to rely upon it too much.
> >

I passed LLVM_IAS=1 with KAFLAGS=-fprofile-use=vmlinux.profdata:

/usr/bin/perf_5.10 stat make V=1 -j4 HOSTCC=clang HOSTCXX=clang++
HOSTLD=ld.lld CC=clang LD=ld.lld PAHOLE=/opt/paho
le/bin/pahole LOCALVERSION=-2-amd64-clang11-pgo KBUILD_VERBOSE=1
KBUILD_BUILD_HOST=iniza KBUILD_BUILD_USER=sedat.dilek@gmail.com
KBUILD_BUILD_TIMESTAMP=2021-01-21 bind
eb-pkg KDEB_PKGVERSION=5.11.0~rc4-2~bullseye+dileks1 LLVM=1
KCFLAGS=-fprofile-use=vmlinux.profdata LLVM_IAS=1
KAFLAGS=-fprofile-use=vmlinux.profdata

The resulting Linux-kernel does not boot.

But I see in the build-log these warnings:

warning: arch/x86/platform/efi/quirks.c: Function control flow change
detected (hash mismatch) efi_arch_mem_reserve Hash = 73770966985
[-Wbackend-plugin]
warning: arch/x86/platform/efi/efi.c: Function control flow change
detected (hash mismatch) efi_attr_is_visible Hash = 57959232386
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) memcmp Hash = 12884901887
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) bcmp Hash = 12884901887
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) strcmp Hash = 44149752232
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) strnlen Hash = 29212902728
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) simple_strtoull Hash =
288230479369728480 [-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) strstr Hash = 76464046323
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) strchr Hash = 30948479515
[-Wbackend-plugin]
warning: arch/x86/boot/compressed/string.c: Function control flow
change detected (hash mismatch) kstrtoull Hash = 288230543187488006
[-Wbackend-plugin]

What does "Function control flow change detected (hash mismatch)" mean?
Related with my boot problems?

- Sedat -
