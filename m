Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACEB2FADC5
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 00:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730086AbhARXaQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 18:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbhARXaN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 18:30:13 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 754FFC061573;
        Mon, 18 Jan 2021 15:29:32 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id e22so12357449iog.6;
        Mon, 18 Jan 2021 15:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=r6GhUyjBJryqxkAoJ8s2TX/9ptHi3eesMQhsJFMSBQ8=;
        b=sMYMSVO4r89wjawMeSRSrqW+MJLWdaohaSAXdRiRWdhv8DAEfAJYPgPw9hO7E/dESJ
         vu4m7IrOLqv6HH8Q5lEUPgg2+KP/0MrYn0FkoWpDcc0UxX7WzZ+7KXRCZHeSeMew+PTe
         CWK3OG1f+7yoZWHVGHtmPnCSDqidTtpVkgJfqXFDyb9M73BFMJH6ShN3qtAlj6YwQM2S
         aTI+VQhenjm+wZIcCOzz9944TwGFx83CrlMbohCFsxraaaGDMv4B7Z6oxF3FyhDsmEuG
         6S1Tw+SA+BGC9b3V1Y4pot3U8QmGf1vD9BGdArn0ADBuUsYbD4wPYJHOQkufGQVNf8bV
         3acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=r6GhUyjBJryqxkAoJ8s2TX/9ptHi3eesMQhsJFMSBQ8=;
        b=C4ApBcKX+MMjirioZP2ELwpOg/srYXpEP03y3UP1IuimkqXJE+T5oWnGkGGxS43riZ
         pG1IufEhQZMPiyj4pu6qhKKs2uvQLYeo7t+uXYWGQco+W6bPODYhPzFLo1ymGYHB3k/+
         ROCZBDTdIfOJ1CkgoR0W1YgPAy5Zp843dK8GZfTB/U8Kj2lmyK60yXcBa/y0z6kpoXS6
         b/Ze/KHb6bG/uWwmMgmTWwagYOvpuCnmXHbhlIDRra6iNwDUQg4cH4friE4U1SL7SJFq
         O04QvRHDRaN+DtPcWG0ejXSGqBqFlLFblVOlrHWdgvnzafgfrZvuZnyJddfizF6DLkoW
         Rhgw==
X-Gm-Message-State: AOAM531CoweGtJJcYUsgZTarDTx1ADZOOqWZVoic4cZc3Y93VPbv87J7
        Vx7BxggPvMLWAYDdgyoqYqcReULVLjN27/WjiQ0=
X-Google-Smtp-Source: ABdhPJyuCX/ePcfxvkCz+sX4s+ZEGG0u/bp2cI0TpjI908prPnh39uBWji4CyG38aw8IwOeDmOaR7ECXrSoo7GooEfM=
X-Received: by 2002:a92:d990:: with SMTP id r16mr1232898iln.10.1611012571781;
 Mon, 18 Jan 2021 15:29:31 -0800 (PST)
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
 <CA+icZUXa9wvSWe=21_gjAapoHpbgBmYzFpQjb=o_WRQgK+O4gA@mail.gmail.com> <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com>
In-Reply-To: <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 19 Jan 2021 00:29:19 +0100
Message-ID: <CA+icZUVTnH86M7=YkU_bQyK4wiRg7Oe46QTVD3AfZ2aNRFqD1g@mail.gmail.com>
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

On Mon, Jan 18, 2021 at 10:56 PM Bill Wendling <morbo@google.com> wrote:
>
> On Mon, Jan 18, 2021 at 9:26 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 1:39 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Mon, Jan 18, 2021 at 3:32 AM Bill Wendling <morbo@google.com> wrote:
> > > >
> > > > On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > > >
> > > > > [ big snip ]
> > > >
> > > > [More snippage.]
> > > >
> > > > > [ CC Fangrui ]
> > > > >
> > > > > With the attached...
> > > > >
> > > > >    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> > > > > undefined symbols
> > > > >
> > > > > ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> > > > > For details see ClangBuiltLinux issue #1250 "Unknown symbol
> > > > > _GLOBAL_OFFSET_TABLE_ loading kernel modules".
> > > > >
> > > > Thanks for confirming that this works with the above patch.
> > > >
> > > > > @ Bill Nick Sami Nathan
> > > > >
> > > > > 1, Can you say something of the impact passing "LLVM_IAS=1" to make?
> > > >
> > > > The integrated assembler and this option are more-or-less orthogonal
> > > > to each other. One can still use the GNU assembler with PGO. If you're
> > > > having an issue, it may be related to ClangBuiltLinux issue #1250.
> > > >
> > > > > 2. Can you please try Nick's DWARF v5 support patchset v5 and
> > > > > CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
> > > > >
> > > > I know Nick did several tests with PGO. He may have looked into it
> > > > already, but we can check.
> > > >
> > >
> > > Reproducible.
> > >
> > > LLVM_IAS=1 + DWARF5 = Not bootable
> > >
> > > I will try:
> > >
> > > LLVM_IAS=1 + DWARF4
> > >
> >
> > I was not able to boot into such a built Linux-kernel.
> >
> PGO will have no effect on debugging data. If this is an issue with
> DWARF, then it's likely orthogonal to the PGO patch.
>
> > For me worked: DWARF2 and LLVM_IAS=1 *not* set.
> >
> > Of course, this could be an issue with my system's LLVM/Clang.
> >
> > Debian clang version
> > 12.0.0-++20210115111113+45ef053bd709-1~exp1~20210115101809.3724
> >
> Please use the official clang 11.0.1 release
> (https://releases.llvm.org/download.html), modifying the
> kernel/pgo/Kconfig as I suggested above. The reason we specify clang
> 12 for the minimal version is because of an issue that was recently
> fixed.
>
> > Can you give me a LLVM commit-id where you had success with LLVM_IAS=1
> > and especially CONFIG_DEBUG_INFO_DWARF5=y?
> > Success means I was able to boot in QEMU and/or bare metal.
> >
> The DWARF5 patch isn't in yet, so I don't want to rely upon it too much.
>

That means to build the first PGO-enabled kernel with clang-11 and
rebuild in a second step again with the same clang-11.

Just FYI:
I was able to boot into a Linux-kernel  rebuild with *no  LLVM_IAS=1*
(means use "GNU AS 2.35.1") set and DWARF5 using LLVM=1 from
LLVM/Clang-12.

- Sedat -
