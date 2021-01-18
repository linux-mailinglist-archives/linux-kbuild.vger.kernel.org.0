Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CFC2FAD02
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 22:59:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732607AbhARV5e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 16:57:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732689AbhARV5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 16:57:33 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D41C0613D6
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Jan 2021 13:56:52 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id gx5so6484014ejb.7
        for <linux-kbuild@vger.kernel.org>; Mon, 18 Jan 2021 13:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oatfa8Uxac5y+QfNKWVhpzcqRMF9g7xn6+1Ypo2kSWs=;
        b=G9OuzfiKkq0Itr91GvGyb6IuOc32itpL5+ewRZfC6Nb2iA8ft7wxwZztrsWj0HGIjk
         9r44dpP8GQLoJIjc8ckScnATpIyG7Wwo0NyNO5dIowX0yhfAYwZ5aBRAmJzFxL/q6ffT
         gyhbSu21s3NRgcIaIrnY/Zbojeb4tttsPVADFPyGqmjCnm2Zlzk/9OhMaaYlmlh55+vj
         uQXshD/S9jx+efobBEnmEAg0k8+Vc9MQ5P39JR1EY9ERQ4joWJJwgSVlKgWCtiHkVRKX
         LOyD71QPCsUTDBwIBHdndIrPlZ7pNEmOHt+W/DqMxvehJHCvOw6HQnoTzIhXmUa/Uxa2
         QRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oatfa8Uxac5y+QfNKWVhpzcqRMF9g7xn6+1Ypo2kSWs=;
        b=oWbhMK9dSNwJ7DURBGqe3WVkfquCxBMNBnMVe3qQlmIyQK4XdeDjSiZt1R42YGTwct
         POIo1+46Mt/Gp616tYPGvEse/BBjJsWdHwCkmaiDEyg1Mgd8XPafAbyCUuFYkPRqlmT+
         JwDbbvxKgTV/APBnKs87q48iUk+C8qM3mLSjiKaZ3/8NiZAiNB44URRy0C9plhqYThdk
         WxBDnFMTlU2j4rxgvn+5glrAsvbD2Oz8R8Qie1p44NVchn0/i2fpuhF5lXisXsEdH6J9
         xf4o5rd/TY0eXkZFk5Lfa2aaSwXEXIWFIJCmYLRAe49tLOCoV6opu1NuOhBaD5Cmp1Vz
         YyXA==
X-Gm-Message-State: AOAM530SmCePdSM031WDES0f1KeZTtYJEvWxAeaRuYUX/YBh46cnBVY8
        ZmwQj3Q+lPMzLrA0Q9ILbELeJWN47jNpEnRaQabX
X-Google-Smtp-Source: ABdhPJwiTaEsKdexNKIoHB/eUfZQnzukIdscZm/if80Y4LpzPxBkFga14LG96UqrRR257lycf5KwAWK9fvWQ62ucVAY=
X-Received: by 2002:a17:907:e9e:: with SMTP id ho30mr1073618ejc.529.1611007011377;
 Mon, 18 Jan 2021 13:56:51 -0800 (PST)
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
 <CA+icZUVwbWDtGUzMEkitxYn2UvbZPnFTxfJyDOY46j6BTK0deQ@mail.gmail.com> <CA+icZUXa9wvSWe=21_gjAapoHpbgBmYzFpQjb=o_WRQgK+O4gA@mail.gmail.com>
In-Reply-To: <CA+icZUXa9wvSWe=21_gjAapoHpbgBmYzFpQjb=o_WRQgK+O4gA@mail.gmail.com>
From:   Bill Wendling <morbo@google.com>
Date:   Mon, 18 Jan 2021 13:56:39 -0800
Message-ID: <CAGG=3QUcaY1wzJhBD4ZGhPSNPik-kL0PuoE1SJqkFJEM_mkGYA@mail.gmail.com>
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

On Mon, Jan 18, 2021 at 9:26 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, Jan 18, 2021 at 1:39 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 18, 2021 at 3:32 AM Bill Wendling <morbo@google.com> wrote:
> > >
> > > On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > [ big snip ]
> > >
> > > [More snippage.]
> > >
> > > > [ CC Fangrui ]
> > > >
> > > > With the attached...
> > > >
> > > >    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> > > > undefined symbols
> > > >
> > > > ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> > > > For details see ClangBuiltLinux issue #1250 "Unknown symbol
> > > > _GLOBAL_OFFSET_TABLE_ loading kernel modules".
> > > >
> > > Thanks for confirming that this works with the above patch.
> > >
> > > > @ Bill Nick Sami Nathan
> > > >
> > > > 1, Can you say something of the impact passing "LLVM_IAS=1" to make?
> > >
> > > The integrated assembler and this option are more-or-less orthogonal
> > > to each other. One can still use the GNU assembler with PGO. If you're
> > > having an issue, it may be related to ClangBuiltLinux issue #1250.
> > >
> > > > 2. Can you please try Nick's DWARF v5 support patchset v5 and
> > > > CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
> > > >
> > > I know Nick did several tests with PGO. He may have looked into it
> > > already, but we can check.
> > >
> >
> > Reproducible.
> >
> > LLVM_IAS=1 + DWARF5 = Not bootable
> >
> > I will try:
> >
> > LLVM_IAS=1 + DWARF4
> >
>
> I was not able to boot into such a built Linux-kernel.
>
PGO will have no effect on debugging data. If this is an issue with
DWARF, then it's likely orthogonal to the PGO patch.

> For me worked: DWARF2 and LLVM_IAS=1 *not* set.
>
> Of course, this could be an issue with my system's LLVM/Clang.
>
> Debian clang version
> 12.0.0-++20210115111113+45ef053bd709-1~exp1~20210115101809.3724
>
Please use the official clang 11.0.1 release
(https://releases.llvm.org/download.html), modifying the
kernel/pgo/Kconfig as I suggested above. The reason we specify clang
12 for the minimal version is because of an issue that was recently
fixed.

> Can you give me a LLVM commit-id where you had success with LLVM_IAS=1
> and especially CONFIG_DEBUG_INFO_DWARF5=y?
> Success means I was able to boot in QEMU and/or bare metal.
>
The DWARF5 patch isn't in yet, so I don't want to rely upon it too much.

-bw
