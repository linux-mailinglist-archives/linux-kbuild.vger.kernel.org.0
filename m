Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797F52F97DA
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 03:33:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730919AbhARCdT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 21:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbhARCdS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 21:33:18 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117A5C061573
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2021 18:32:38 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id g1so15213216edu.4
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2021 18:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iw3qguMN2HQw0dg4Ex4c2c9WaYKPlQtajPSFcrfomWk=;
        b=fu01MN1RBBEK4GjqxdZtdRWsxoe0l9gdxKc7VAXhfUw+tqXVYw6Oq+GVUbZqZioYee
         N9PAsxghkj2YFg/oY2Kfd/aPAMevD0MMkPFwZVCRANgHNcOdnY9IYshUJI2yRtFJ64hW
         Gkza/6nurwrZt6HTmS4djj7qoivCSpusIfO5NOPpDqePuVN+rSCRwwJ9ohen352cj+bR
         LTuMgBLYNGITa5YwWJarpdUlAoXhDOrb8/ZjE5lwtaUmUPsdgglKrX+aendAxoUyz1L5
         uBmgzrjKmHlNFy/MSMTacEjHvNPV+Ajgz13VDTg1/a5kATrlpS3NpWIivAhwrRC9XCY5
         e4ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iw3qguMN2HQw0dg4Ex4c2c9WaYKPlQtajPSFcrfomWk=;
        b=a95l9JfNoVr/yrZa0VqgyXeC+cDj6ER3yQfGjX2oVusphbsct02Dw49SFPfJEXD6Tj
         6FZrN+4qmSo7PPlSxZBbM8b0WW1XFmh7qgUEzaGCr6pIIrP4iMPR/USnau/ZGXs1up2S
         JALRzT/IRQdnmolJfjkzqS4JxV11N4dlDAAAileBW+zLIslD+Y3cHsWJuVO7/t9sOXIW
         ne4RQfVWVPj4uC3wB6FFqyR08tfLnIOG83GdOnAlj2uBFODHKsRJZOKqdwvO06pzuB2W
         OVni2mBRw7JNhQOaAWP0+u0cdVSi0ctRZtU5zcXYyWJcbberJyVHtlEVjvn8DvfcL/zt
         8rMA==
X-Gm-Message-State: AOAM532DomnmvpW+e7M+rhn86LL6VDWlCVay5XB69z/w2iVSSnpqOowI
        kP4/P05iXfhwtZ1ShYTe/bLr2hLIPS6LPpSI9HHY
X-Google-Smtp-Source: ABdhPJxghPKKFZfXRuqyf/ln2g2Vde9pBNxDQQMA4R+VxhCfUyDEYpwL6BrmysI20US1jRAcr454zHk78k+JbFhQuRg=
X-Received: by 2002:aa7:c719:: with SMTP id i25mr13208470edq.197.1610937156426;
 Sun, 17 Jan 2021 18:32:36 -0800 (PST)
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
 <CA+icZUU1HihUFaEHzF69+01+Picg8aq6HAqHupxiRqyDGJ=Mpw@mail.gmail.com> <CA+icZUUuzA5JEXyVzKbVX+T3xeOdRAU6-mntbo+VwwTxqmN7LA@mail.gmail.com>
In-Reply-To: <CA+icZUUuzA5JEXyVzKbVX+T3xeOdRAU6-mntbo+VwwTxqmN7LA@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Sun, 17 Jan 2021 18:32:25 -0800
Message-ID: <CAGG=3QWmOA+yM2GJF+cHUb7wUq6yiBpHasa-ry9OhAdvciDm6Q@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
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

On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> [ big snip ]

[More snippage.]

> [ CC Fangrui ]
>
> With the attached...
>
>    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> undefined symbols
>
> ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> For details see ClangBuiltLinux issue #1250 "Unknown symbol
> _GLOBAL_OFFSET_TABLE_ loading kernel modules".
>
Thanks for confirming that this works with the above patch.

> @ Bill Nick Sami Nathan
>
> 1, Can you say something of the impact passing "LLVM_IAS=1" to make?

The integrated assembler and this option are more-or-less orthogonal
to each other. One can still use the GNU assembler with PGO. If you're
having an issue, it may be related to ClangBuiltLinux issue #1250.

> 2. Can you please try Nick's DWARF v5 support patchset v5 and
> CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
>
I know Nick did several tests with PGO. He may have looked into it
already, but we can check.

> I would like to know what the impact of the Clang's Integrated
> Assembler and DWARF v5 are.
>
> I dropped both means...
>
> 1. Do not pass "LLVM_IAS=1" to make.
> 2. Use default DWARF v2 (with Nick's patchset: CONFIG_DEBUG_INFO_DWARF2=y).
>
> ...for a successfull build and boot on bare metal.
>

[Next message]

> On each rebuild I need to pass to make ...?
>
>   LLVM=1 -fprofile-use=vmlinux.profdata
>
Yes.

> Did you try together with passing LLVM_IAS=1 to make?

One of my tests was with the integrated assembler enabled. Are you
finding issues with it?

The problem with using top-of-tree clang is that it's not necessarily
stable. You could try using the clang 11.x release (changing the
"CLANG_VERSION >= 120000" in kernel/pgo/Kconfig/ to "CLANG_VERSION >=
110000").

-bw
