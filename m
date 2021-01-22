Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3092FFA15
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:46:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbhAVBnq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbhAVBnm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:43:42 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9163C061756
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:43:01 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id m6so2690531pfk.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JHmsyWW/3ORqzCCxIgYU3HZ6BJYN5rvOhQgY5Vhnihs=;
        b=Cn+/rff9XjSf2PVRZ9I1XCBKIEto0f9KuoUnZTnmqqD1QOlEhW9ZnZite85Ce738Wi
         8tocw6/MX2KaI+LYQUBK+8KNwsMiya4AOtiAzmjUNZCcjnW+pXKesWB7j7oaqfA8fmPn
         f5q6fZzknZHyEX/A3sV1Q8bl3TaHZeOaxDmwfwOoSyMGENEcreRpMKO4hR8qNAZdyEN+
         Nlzqmhi+G9ajLzflu/7YuqZZ8AIxDh7OgmCKeK0onxi5FroP4jZNtoUqnSGO6iZu/VWj
         B/uvlnOmQJ1KmO8gg4jWUSWeN2NiBYX4wtlWKHETI+zFZPGwsA/PmAG6t9Qd1MXUNWsq
         vlJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JHmsyWW/3ORqzCCxIgYU3HZ6BJYN5rvOhQgY5Vhnihs=;
        b=TMTC+3FnH6m8RCF4hDwyIc/kWrchH9BbRzwteY1GWAI/JdKDBP7IIp9SRtCOqw0ErT
         oCnD5bi4IEY9re/bUfEllk0Y0fLUld5XICC4UEamsUI4XuQXKkCVKXckA7VIgSrFrXSg
         jHXpnkn/elpwBUmwIT2dsTIwCR0nVBeCZY/O8rHqGCJdkWn2kepI8DX77olrKySE4WcT
         7jLjex17Y76scmdBTvTv6hcnvi29DNZfF/BggFJk1Ndh0rYc7Pnh53+nWWFhMbJBZ0Hn
         i6ZVIUiBVqN4e4yeDpUIdx/qHqZXC7q2X+Eo5F5l3PbhEMbHr0Ukf5PLJb6mutKcBHi0
         FDwA==
X-Gm-Message-State: AOAM531JFQoobVx+E1hRKcpcg+CTx993Ha+KB5wT5PXjvmfyH8REVaQ7
        XcL6tpCNg0Q95KgGoP6cuW5KqLVnGf0XqhIJhVj4LQ==
X-Google-Smtp-Source: ABdhPJzJ1LehAQj3g0Au/DgMI3UZP7gu00iy/KoX+nhTCsE9nhsnY2k0RFL9OMEBX0CuzoXmdzNFrF1liYbS5euVww4=
X-Received: by 2002:a62:7896:0:b029:1b6:7319:52a7 with SMTP id
 t144-20020a6278960000b02901b6731952a7mr2450111pfc.30.1611279780913; Thu, 21
 Jan 2021 17:43:00 -0800 (PST)
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
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 Jan 2021 17:42:49 -0800
Message-ID: <CAKwvOdkOOjDo+zFFz_T63FphZn2Lg7MW8vd7qd-yS_eB_yYdmA@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 6:03 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
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

I was able to build+boot with LLVM_IAS=1 on my personal laptop (no
dwarf 5, just mainline+v5).

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

I agree, providing test results with patches that haven't landed yet
can cloud the interpretation of results.  It would be helpful to drop
local patch sets before trying this.

If the resulting image still isn't working for you, can you please
provide your config? Surely we'd be able to reproduce boot failures in
QEMU?  Nothing comes to mind about a change of assemblers causing an
issue; I would assume assembly cannot be instrumented by the compiler
(even though the compiler is the "driver" of the assembler).

The hash warnings are certainly curious.
IndexedInstrProfReader::getInstrProfRecord() is the only place in LLVM
sources that can emit that.
-- 
Thanks,
~Nick Desaulniers
