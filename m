Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ECDA2FA01E
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 13:43:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404219AbhARMlL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 07:41:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404070AbhARMjz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 07:39:55 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA48BC061573;
        Mon, 18 Jan 2021 04:39:13 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id e22so32431953iom.5;
        Mon, 18 Jan 2021 04:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=/0ekt6oq+WlNqCRvHUlDFjjWLqrVQZ0WTiXLJub6TII=;
        b=EuJrgbYOcyXpDYrS4gzh38ZbG5H31XHAgl/f+bwdQYi02raaP0x2yOu6thClppbaGe
         176k2GtIJQRIuIclnFzmJSRQdqDlHVKvhReRhVrbV1zX7HH2N2wESKsI5hqjhK+XJojE
         9/yxOMvHX3lSwzATnj5aThd5cuieVDGQp1+eDFc63NldL0Zkxig1aGSNpnt4CvODWPxs
         R5Dtcl1cXF9rLBYFlUKGUcuqSuZbMHPCFCMNSNnRkfWZ95LuPgUXyFoAHZMxTBPsupdU
         N3Fual2nqFL6cSPLndFT5VlETMfoO8fussQJymQ0ZdKP6TEEwLlzHVdmc2WDFuE5VsFV
         DtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=/0ekt6oq+WlNqCRvHUlDFjjWLqrVQZ0WTiXLJub6TII=;
        b=nnR7oelH22vb1zr+Z1xyG4xeUp9M2Ux9H7nQPiKJSqhBLn1phMPVsoDBw3mr5cTJmT
         N95YDFHop30F+gWWrEGYiDDVPlYS/me/IOYhEzFZ7yHsV+6ptcgnDqpkMfl9NHlBsZL9
         qwy6rCs03Z/FH91qTTz1t1Jj+SGiYYWgDVoQ58UUUcvgPhzoa3cQwnJW3lgozhkwmZeT
         GeW2bylM92P+riuY698KY1+kL3OizjvHFlM5yY8kUyLSeaWc4E7dnfSLGV/gu+XFeDA+
         Rp1U20KSOGua7K0VsX4jTKN0BXReBvT7CCwd7WSdpl9DE8mbqq6crapLNvLyWbFq+B3L
         ExoA==
X-Gm-Message-State: AOAM530OB5XFTyiaBMzo01Lf3aiGxVDwPWUyhSknn12xkSNFzbDlUg04
        mGJTqPfZdkKg1Y11oAMVTUN8GVq7FvMLc++kTxxXtnqiA1GFHw==
X-Google-Smtp-Source: ABdhPJyKFkgMRRtDcUlteA7Z7Cb43j3RGyiiF4/1dj6xu/OkHFbEaMvPpMtTWNcJqIXXEtubJXeZ02fXeaYlgg9oMmE=
X-Received: by 2002:a05:6e02:d0:: with SMTP id r16mr6888410ilq.112.1610973553097;
 Mon, 18 Jan 2021 04:39:13 -0800 (PST)
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
 <CA+icZUUuzA5JEXyVzKbVX+T3xeOdRAU6-mntbo+VwwTxqmN7LA@mail.gmail.com> <CAGG=3QWmOA+yM2GJF+cHUb7wUq6yiBpHasa-ry9OhAdvciDm6Q@mail.gmail.com>
In-Reply-To: <CAGG=3QWmOA+yM2GJF+cHUb7wUq6yiBpHasa-ry9OhAdvciDm6Q@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 18 Jan 2021 13:39:01 +0100
Message-ID: <CA+icZUVwbWDtGUzMEkitxYn2UvbZPnFTxfJyDOY46j6BTK0deQ@mail.gmail.com>
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

On Mon, Jan 18, 2021 at 3:32 AM Bill Wendling <morbo@google.com> wrote:
>
> On Sun, Jan 17, 2021 at 4:27 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > [ big snip ]
>
> [More snippage.]
>
> > [ CC Fangrui ]
> >
> > With the attached...
> >
> >    [PATCH v3] module: Ignore _GLOBAL_OFFSET_TABLE_ when warning for
> > undefined symbols
> >
> > ...I was finally able to boot into a rebuild PGO-optimized Linux-kernel.
> > For details see ClangBuiltLinux issue #1250 "Unknown symbol
> > _GLOBAL_OFFSET_TABLE_ loading kernel modules".
> >
> Thanks for confirming that this works with the above patch.
>
> > @ Bill Nick Sami Nathan
> >
> > 1, Can you say something of the impact passing "LLVM_IAS=1" to make?
>
> The integrated assembler and this option are more-or-less orthogonal
> to each other. One can still use the GNU assembler with PGO. If you're
> having an issue, it may be related to ClangBuiltLinux issue #1250.
>
> > 2. Can you please try Nick's DWARF v5 support patchset v5 and
> > CONFIG_DEBUG_INFO_DWARF5=y (see attachments)?
> >
> I know Nick did several tests with PGO. He may have looked into it
> already, but we can check.
>

Reproducible.

LLVM_IAS=1 + DWARF5 = Not bootable

I will try:

LLVM_IAS=1 + DWARF4

- Sedat -

> > I would like to know what the impact of the Clang's Integrated
> > Assembler and DWARF v5 are.
> >
> > I dropped both means...
> >
> > 1. Do not pass "LLVM_IAS=1" to make.
> > 2. Use default DWARF v2 (with Nick's patchset: CONFIG_DEBUG_INFO_DWARF2=y).
> >
> > ...for a successfull build and boot on bare metal.
> >
>
> [Next message]
>
> > On each rebuild I need to pass to make ...?
> >
> >   LLVM=1 -fprofile-use=vmlinux.profdata
> >
> Yes.
>
> > Did you try together with passing LLVM_IAS=1 to make?
>
> One of my tests was with the integrated assembler enabled. Are you
> finding issues with it?
>
> The problem with using top-of-tree clang is that it's not necessarily
> stable. You could try using the clang 11.x release (changing the
> "CLANG_VERSION >= 120000" in kernel/pgo/Kconfig/ to "CLANG_VERSION >=
> 110000").
>
> -bw
