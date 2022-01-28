Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D2C4A043C
	for <lists+linux-kbuild@lfdr.de>; Sat, 29 Jan 2022 00:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344504AbiA1XaB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Jan 2022 18:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbiA1X37 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jan 2022 18:29:59 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAC6BC061714
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 15:29:58 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id e9so11198979ljq.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Jan 2022 15:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i321YKyDsRK0btGUb/fjVY8h2mIEqZCos2XNM/JjnFw=;
        b=qFMSnkB/pzMTJLJplSHVcYU1saiukEFW8xraxGaLExeC1AAMl0n2XMcm3aoEEMiTwM
         zji2oSEuFStGWrzkFqZN6yDr0YU+xA/eTp+CxveOXQwqGT9SNlR8e2cc4piZ8M+whbE9
         4p7ziIwZuLxqCrPE1kb7dj/GuKurAUe1PVIUIlppAoEZwuNz/XDcgbtTzfpHLcXsMNwy
         N332MH6mSy0h0ZWARDyEUQUd5IfR1E/OmQsj/p+pwg5/KQ2+bprFYelA+1314ThJE1CN
         zGNsK6KSztz7tg6Yc0sE0T4rHKUiVq5ln3jH5fvedRRT4MKrLj9RvA7MjBxHclujUOL8
         20FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i321YKyDsRK0btGUb/fjVY8h2mIEqZCos2XNM/JjnFw=;
        b=wpg2Y+MfHH5hoLIjgGLB7e9TfXiIahip5GBfswrf1HqKnar0t7KUAo8QZ4w5uf0yNw
         hANJ/mKXtD1cE6eC631CDjlxy7BrR+j8MaV1vBKWcLXNZso0ZcgSwk19JL/Lknpbio3A
         rexHgQGbw1ER/hjqw7wpjDwYJQsbvHnQk1PakNxUeqHpzWjoBf7lAWcoDTPrH3pKiFeW
         Qebwy6h4DR6HaGtNbhxWnL3/c5cIw3PiF3zioqF+HOwVSMZxCaQW0EkJ4Rw8WRRoSJZa
         PQ7eeBdyFBznqEfZakwGA04Wb/H2uU7ei+X80wTrmWgeJTgkL0txU1RLZo3hN0l4W/3O
         XM2g==
X-Gm-Message-State: AOAM532JNQd/bISo/2tXo7Cy7vbACtzT1bPdYusq+msu62FZLtDVxUM3
        ajwW22c2Rhb2QSFxJUPKzd5LhkAqDvaqTB9z3EifQQ==
X-Google-Smtp-Source: ABdhPJyEmbWFCdyMKn2hzT4GP9wF9nEf2Sld8Uyy7Us3WjksoEfiWszRlnIzTxTDiMhM9MtZqBF4MKyjE0pnac0nsxQ=
X-Received: by 2002:a2e:bd15:: with SMTP id n21mr7203379ljq.128.1643412596849;
 Fri, 28 Jan 2022 15:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20220112224342.958358-1-quic_eberman@quicinc.com>
 <20220128220841.3222637-1-quic_eberman@quicinc.com> <20220128224528.f7ejzw55t6kfefmm@google.com>
 <CAKwvOd=Ab+GWNzSC6eaDWTVDF6gJQ9fDDMT3hep-DzhrEA6DpQ@mail.gmail.com> <094ab4eb-b877-2a14-d6c8-1d9e28335d7d@quicinc.com>
In-Reply-To: <094ab4eb-b877-2a14-d6c8-1d9e28335d7d@quicinc.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 28 Jan 2022 15:29:44 -0800
Message-ID: <CAKwvOd=J=84vad_cR06NFDauMXbXsC2o=X4RbPj2cqA1280D=A@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add environment variables for userprogs flags
To:     Elliot Berman <quic_eberman@quicinc.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Matthias Maennich <maennich@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 28, 2022 at 3:26 PM Elliot Berman <quic_eberman@quicinc.com> wrote:
>
>
>
> On 1/28/2022 2:49 PM, Nick Desaulniers wrote:
> >   On Fri, Jan 28, 2022 at 2:45 PM Fangrui Song <maskray@google.com> wrote:
> >>
> >> On 2022-01-28, Elliot Berman wrote:
> >>> Allow additional arguments be passed to userprogs compilation.
> >>> Reproducible clang builds need to provide a sysroot and gcc path to
> >>> ensure same toolchain is used across hosts. KCFLAGS is not currently
> >>> used for any user programs compilation, so add new USERCFLAGS and
> >>> USERLDFLAGS which serves similar purpose as HOSTCFLAGS/HOSTLDFLAGS.
> >>>
> >>> Specifically, I'm trying to force CC_CAN_LINK to consistently fail in
> >>> an environment where a user sysroot is not specifically available.
> >>> Currently, Clang might automatically detect GCC installation on hosts
> >>> which have it installed to a default location in /. With addition of
> >>> these environment variables, you can specify flags such as:
> >>>
> >>> $ make USERCFLAGS=--sysroot=/dev/null USERLDFLAGS=-Wl,--sysroot=/dev/null
> >>>
> >>> to force sysroot detection to fail.
> >>
> >> -Wl,--sysroot=/dev/null => --sysroot
> >>
> >> As I mentioned in
> >> https://lore.kernel.org/all/20220128031549.w5a4bilxbkppagfu@google.com/
> >> -Wl,--sysroot=/dev/null does not suppress search paths like -L/lib .
> >
> > In that case, Elliot, can you please test whether USERLDFLAGS is
> > necessary to be specified AT ALL? Maybe we can drop that addition from
> > this patch if so?
>
> USERLDFLAGS as --sysroot=/dev/null isn't necessary and not needed for
> the Android kernel usecase. I've included here since we have HOSTLDFLAGS
> and LDFLAGS for host programs and kernel respectively.
>

Ok, for symmetry it's ok to keep HOSTLDFLAGS, consider dropping it
from the "example" in the commit message. The note about -Wl, prefixes
exists in the docs now which is good enough for me.
-- 
Thanks,
~Nick Desaulniers
