Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 243EC308F04
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 22:11:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhA2VIk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 16:08:40 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:57874 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbhA2VIj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 16:08:39 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 10TL7k75010691;
        Sat, 30 Jan 2021 06:07:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10TL7k75010691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611954466;
        bh=MoEJilFaLzSKvHTw5e08yZQI2j3F21oKcR5gUJEkaX0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fKeVJxheosdV+7JexPehOgHRV07rsT1lxrds87cQfJF6jEoWPU2jKrHm/S6mcTu8A
         xGvzLeGH/4K5wf7J2oARwMYZodFpEU2UGyAY+5xlUjDOPZdeWl2GdiR0DxyGW7NwFA
         vLVykxO0qeRAe+Y8Nk9Y20UHP0RytrpstNwKvtHgXJFYYP8UavxTuFKGOc2RCIvulX
         GVweqFgQcLNAFA6STV6ZenMTg2MvXkG7JPGCYSkH8rEjPrxEB7N3jlue3VXC8/y855
         1UBUjD0wpLC5d/X7YLcrR/nqvMj32koQbEHeeeNhPAuLUAGWS/Vh82sO/ZavmNCpjB
         IqQikMFcuNkSA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id t25so7509020pga.2;
        Fri, 29 Jan 2021 13:07:46 -0800 (PST)
X-Gm-Message-State: AOAM533odsotM41sKbRAmjmA0SOE1AzYb4q+Kd2HwKeRiS2YzrZeug4n
        NgEajSPmTSkwYc56IKMbOF9IB20nf2hnJNMV2d4=
X-Google-Smtp-Source: ABdhPJzJbdhdkX3krl65PfrTjoe+/JaOQHdXZimYhG2bctSkBAVv4JyDk8LxYSPB3+lRZJHfkNhS+DKYJRLQsIvvw2E=
X-Received: by 2002:a63:575e:: with SMTP id h30mr6319221pgm.7.1611954465639;
 Fri, 29 Jan 2021 13:07:45 -0800 (PST)
MIME-Version: 1.0
References: <20210114003447.7363-1-natechancellor@gmail.com> <20210129203106.GA2658360@localhost>
In-Reply-To: <20210129203106.GA2658360@localhost>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 30 Jan 2021 06:07:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS28W+rjC=Y-6AusFynMGLX_RWPZPo37gGr=WRdR+TkkA@mail.gmail.com>
Message-ID: <CAK7LNAS28W+rjC=Y-6AusFynMGLX_RWPZPo37gGr=WRdR+TkkA@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: Add a section about supported architectures
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 30, 2021 at 5:31 AM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Jan 13, 2021 at 05:34:47PM -0700, Nathan Chancellor wrote:
> > The most common question around building the Linux kernel with clang is
> > "does it work?" and the answer has always been "it depends on your
> > architecture, configuration, and LLVM version" with no hard answers for
> > users wanting to experiment. LLVM support has significantly improved
> > over the past couple of years, resulting in more architectures and
> > configurations supported, and continuous integration has made it easier
> > to see what works and what does not.
> >
> > Add a section that goes over what architectures are supported in the
> > current kernel version, how they should be built (with just clang or the
> > LLVM utilities as well), and the level of support they receive. This
> > will make it easier for people to try out building their kernel with
> > LLVM and reporting issues that come about from it.
> >
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
>
> Jonathan, did you need anything else from me on this, or does Masahiro
> need to pick this up?
>
> Cheers,
> Nathan


Now I applied to linux-kbuild.
Thanks for the reminder.



-- 
Best Regards
Masahiro Yamada
