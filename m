Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A302825EC
	for <lists+linux-kbuild@lfdr.de>; Sat,  3 Oct 2020 20:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725819AbgJCSty (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 3 Oct 2020 14:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbgJCSty (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 3 Oct 2020 14:49:54 -0400
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087DAC0613D0;
        Sat,  3 Oct 2020 11:49:54 -0700 (PDT)
Received: by mail-io1-xd44.google.com with SMTP id d197so5082994iof.0;
        Sat, 03 Oct 2020 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=M+NTwkwx0N9yWO/wezg68AB6eVWtAoDDg6Kty2qKvP4=;
        b=hzBguYBkZBzqEmJuug5dfNrRgMRf6oBU/2R4G6OqH0ZlE8g5C+3cfL9s2NOAT7E/Hd
         hGQ67gOxjyqiarz6Gye17iQkaLwoBT/sPyZSRHeKfiP0YSqONZRVnTRbtTNRfzjfhJnp
         BdXbK+akhn7RNnn4nLegEW94W+Zo9gUZwPHkPNRmsAiBv/Oz7bgVLTxC6SmJT6CTPxT4
         I2Jtb8e1Kvv7Kc0TAqEEwJ6rO3kjFoRBLMDpb5va1XFFcIdDLBDJ0x/jdm9YyDOlrnZz
         0zLfHNnVDBY+qZLiVjh40pfXt4lqLMjjXCPT/stvkZQv94+Mc5NyvD8V7yjs4WfFwffA
         VrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=M+NTwkwx0N9yWO/wezg68AB6eVWtAoDDg6Kty2qKvP4=;
        b=a5O/XDBcE0fZOYVPAAvjSyyKYiuV86m0A05LHHuHejFV+CJkCKy6sKanJ+TvmReOhg
         7WdB3T3IYXzhcibFahGn0ENgShWrr9Y67JqEW/JPmL+xPJzwh/gF1QC2Y9VkCAE7T4a6
         bgkTY2I9xvRgjSRrLph+BXpmKQdyEBFVcU+VgVVqqc62iv3YEvJPGndhT5uHuwXccMvT
         atS4IuqTdoAIThwpdQneC6vPxUlXSikR/H2nXvD48CF2rbUJEyS/43d4dtrDtKl24C64
         dGrOv5IQTGy905AJOdkVYxQF21AIEZlbHjbnitNdVZapiG4oZDa/qfw7YOq1ZV+AgXxD
         b1tw==
X-Gm-Message-State: AOAM533CYk36fhjYHpHrDI001btjHXu8FxmC7hYq9SkaRu2LIEFM/X+Y
        20fGoittFq6HzLgWkb9zFjXmpnSQfgApqeFeWhk=
X-Google-Smtp-Source: ABdhPJzj/OwLvzGJH4oaINGM+2uNqD1w5q9P2e6hzirF/Lenr4xohEOk7v0GXYVGKoFkXkSfrsdpSwgsbgAXIK4EXL8=
X-Received: by 2002:a05:6638:1389:: with SMTP id w9mr7118360jad.138.1601750993142;
 Sat, 03 Oct 2020 11:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200928085505.GA22244@shbuild999.sh.intel.com>
 <74757C2A-7C09-4C2E-9828-E8D12EE4706B@fb.com> <996F1C01-3607-4643-817E-8318DFCE59A9@fb.com>
 <20200929054730.GA55377@shbuild999.sh.intel.com>
In-Reply-To: <20200929054730.GA55377@shbuild999.sh.intel.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 3 Oct 2020 20:49:41 +0200
Message-ID: <CA+icZUUu2Tv+EJ8FpkCxyNqRa3hRwutUrFCxY-RFZ5LACm9ieA@mail.gmail.com>
Subject: Re: PROBLEM: zstd bzImage decompression fails for some x86_32 config
 on 5.9-rc1
To:     Feng Tang <feng.tang@intel.com>
Cc:     Nick Terrell <terrelln@fb.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        X86 ML <x86@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "rong.a.chen@intel.com" <rong.a.chen@intel.com>,
        "philip.li@intel.com" <philip.li@intel.com>,
        Petr Malat <oss@malat.biz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 29, 2020 at 7:47 AM Feng Tang <feng.tang@intel.com> wrote:
>
> On Tue, Sep 29, 2020 at 05:15:38AM +0000, Nick Terrell wrote:
> >
> >
> > > On Sep 28, 2020, at 11:02 AM, Nick Terrell <terrelln@fb.com> wrote:
> > >
> > >
> > >
> > >> On Sep 28, 2020, at 1:55 AM, Feng Tang <feng.tang@intel.com> wrote:
> > >>
> > >> Hi Nick,
> > >>
> > >> 0day has found some kernel decomprssion failure case since 5.9-rc1 (=
X86_32
> > >> build), and it could be related with ZSTD code, though initially we =
bisected
> > >> to some other commits.
> > >>
> > >> The error messages are:
> > >>    Decompressing Linux...
> > >>
> > >>    ZSTD-compressed data is corrupt
> > >>
> > >> This could be reproduced by compiling the kernel with attached confi=
g,
> > >> and use QEMU to boot it.
> > >>
> > >> We suspect it could be related with the kernel size, as we only see
> > >> it on big kernel, and some more info are:
> > >>
> > >> * If we remove a lot of kernel config to build a much smaller kernel=
,
> > >> it will boot fine
> > >>
> > >> * If we change the zstd algorithm from zstd22 to zstd19, the kernel =
will
> > >> boot fine with below patch
> > >>
> > >> Please let me know if you need more info, and sorry for the late rep=
ort
> > >> as we just tracked down to this point.
> > >
> > > Thanks for the report, I will look into it today.
> >
> > CC: Petr Malat
> >
> > I=E2=80=99ve successfully reproduced, and found the issue. It turns out=
 that this
> > patch [0] from Petr Malat fixes the issue. As I mentioned in that threa=
d, his
> > fix corresponds to this upstream commit [1].
>
> Glad to know there is already a fix.
>
> > Can we get Petr's patch merged into v5.9?
> >
> > This bug only happens when the window size is > 8 MB. A non-kernel work=
around
> > would be to compress the kernel level 19 instead of level 22, which use=
s an
> > 8 MB window size, instead of a 128 MB window size.
> >
> > The reason it only shows up for large kernels, is that the code is only=
 buggy
> > when an offset > 8 MB is used, so a kernel <=3D 8 MB can't trigger the =
bug.
> >
> > Best,
> > Nick
> >
> > [0] https://lkml.org/lkml/2020/9/14/94
>
> With this patch, all the failed cases on my side could boot fine.
>
> Tested-by: Feng Tang <feng.tang@intel.com>
>

I applied this patch to see if it is OK with x86 64bit - Yes, it is.

Feel free to add my:

     Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

> Thanks,
> Feng
>
> > [1] https://github.com/facebook/zstd/commit/8a5c0c98ae5a7884694589d7a69=
bc99011add94d
>
>
