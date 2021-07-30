Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134FA3DBD77
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jul 2021 19:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhG3RIW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 30 Jul 2021 13:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbhG3RIV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 30 Jul 2021 13:08:21 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9107CC061765
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 10:08:16 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x8so5857495lfe.3
        for <linux-kbuild@vger.kernel.org>; Fri, 30 Jul 2021 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IV0tGa4+rpa0rWOKVy/RYqy1amnye8o4Jt6/b1EaRas=;
        b=C6FDsp9eo10MPB7h8sanJV5aN6A87Y6zvnhf4hLt8eXrk78vLYzMazC5TtOgLlOPY3
         q6Wjzc5G5DyLh+vBan4K/J3UkTpZk9Zz/tHyBwnmFN/5EodvKdl6FgMiGT62DUfWqlrJ
         CFHjvaoGeKrAtFractG9IPE4H024PaEN1hckYzkwZnlXcachhpXtQresnwHmLQ0ksg0x
         p4P3NNHOEMKY3qWIjd6qDKsCUDG0PnpKpr+TSZhFKtwgJbg2c8ef3I8Cpfsg3xrToL0H
         UgZn5Pr4DGCnZ1C0lX3+OMlNp5SKFXq2/hs7zv3T1TgDMiYGIhUNHql1vz9SGCm5BHse
         xWjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IV0tGa4+rpa0rWOKVy/RYqy1amnye8o4Jt6/b1EaRas=;
        b=TL5NuOgE5h1ff4tF4H3aFAM4B5HwyLFagzqhpZJq/qXRpp2F3bVMgSzWCrqQ38Hkeu
         l01EvtMFgZOBJUEAtl5kO/MiMaXhWi4zonXNiHPydVSfJFwo/6x6/GFeBq+svZdBcSnr
         UdM4aFiTbgickBQn7Ny1DHtDkrO+qoE61eu/7n7kwUydNLCmyOA1gb9P6awjIN9T1Rd2
         EQ12IdGTxJyrlPsG00pBwMFNO0dST3DqTXUbk3VsQcTotfQ64PU8SH5tDWBaI2lj8585
         O7HL29Gx3uJKt3ULV3V4OnxNJRKenwrU4Rj68vlYGJ+3ts6EFws82BZVlcBMr35MDlfF
         kE0A==
X-Gm-Message-State: AOAM533KFCktqGn62koVO0XomsGDtZ4SMqSAHsm6fLWCKC8dJWfwJtHg
        54kCrkyh9Rp9ZUsOBGg+cq1HNNSiHWVpM+dS68M0uA==
X-Google-Smtp-Source: ABdhPJzj9IdxPOohHA8FDaGlITftqmCvtv1eT7HQAjqzz+pi/C9CDaOH613bJIBrdNXKsY/3pslb8syNjswLKo9CXgk=
X-Received: by 2002:a05:6512:32aa:: with SMTP id q10mr2512533lfe.368.1627664894662;
 Fri, 30 Jul 2021 10:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210727205855.411487-2-keescook@chromium.org>
 <20210728085921.GV5047@twin.jikos.cz> <20210728091434.GQ1931@kadam>
 <c52a52d9-a9e0-5020-80fe-4aada39035d3@acm.org> <20210728213730.GR5047@suse.cz>
 <YQJDCw01gSp1d1/M@kroah.com> <20210729082039.GX25548@kadam>
 <202107291952.C08EAE039B@keescook> <20210730083845.GD5047@suse.cz>
 <20210730090054.GX1931@kadam> <202107300937.C7016A82@keescook>
In-Reply-To: <202107300937.C7016A82@keescook>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 30 Jul 2021 10:08:03 -0700
Message-ID: <CAKwvOdmtKszUS0-OyGMHuhqjyXQC_283KOQOouWWtimYCvsAoA@mail.gmail.com>
Subject: Re: [PATCH 01/64] media: omap3isp: Extract struct group for memcpy() region
To:     Kees Cook <keescook@chromium.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, dsterba@suse.cz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bart Van Assche <bvanassche@acm.org>,
        linux-hardening@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Keith Packard <keithpac@amazon.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        nborisov@suse.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 9:44 AM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jul 30, 2021 at 12:00:54PM +0300, Dan Carpenter wrote:
> > On Fri, Jul 30, 2021 at 10:38:45AM +0200, David Sterba wrote:
> > > Then is explicit memset the only reliable way accross all compiler
> > > flavors and supported versions?
> > >
> >
> > The = { } initializer works.  It's only when you start partially
> > initializing the struct that it doesn't initialize holes.
>
> No, partial works. It's when you _fully_ initialize the struct where the
> padding doesn't get initialized. *sob*

I'm pretty sure that this has more to do with whether or not the
compiler applies SROA then observes uses of the individual members or
not.

>
> struct foo {
>         u8 flag;
>         /* padding */
>         void *ptr;
> };
>
> These are fine:
>
> struct foo ok1 = { };
> struct foo ok2 = { .flag = 7 };
> struct foo ok3 = { .ptr = NULL };
>
> This is not:
>
> struct foo bad = { .flag = 7, .ptr = NULL };
>
> (But, of course, it depends on padding size, compiler version, and
> architecture. i.e. things remain unreliable.)
>
> --

-- 
Thanks,
~Nick Desaulniers
