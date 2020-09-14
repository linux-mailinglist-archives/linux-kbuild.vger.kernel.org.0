Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8F0268B82
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Sep 2020 14:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726561AbgINMzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Sep 2020 08:55:00 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:17902 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbgINMwt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Sep 2020 08:52:49 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 08ECq8GV011982;
        Mon, 14 Sep 2020 21:52:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 08ECq8GV011982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600087929;
        bh=AANCansO4f2OQwh1V7EIeJev25Fm+ij4Oyg5MtSWhG0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=InQnywGFmtgMc2L6uJH8qzb+0+s9k5VBJW7cQHQ8Z+w6LZd6cIsePRTkKBMw+Rnmk
         VObaXaRkG/f7ovSxM8hr875QcVH7U1G9kf0BxGJi+ly/AdurZIuE0utepzLQf4gY2f
         c/8k3b3YLPJZAOqWRMjn6EPbsqdMbbIbkXif/40GwjmQoEUG4HzuGrIkZKAKyDzdGh
         cSWb5BkmFwZ+Laqf9kshX4PruLwk9xELi9JFC1anPjjd2VPsgV7W+Jt2C7CekSRVYn
         LrM9NrqHHJA+Pd9KPV86yTzdibEr9t4xI3A9h4PfocdK+tg0C6v5C/h4u5eXA/EXEx
         sBXPFrgbr/3QQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id gf14so5316811pjb.5;
        Mon, 14 Sep 2020 05:52:08 -0700 (PDT)
X-Gm-Message-State: AOAM532yOF2XhzR7ILVFYuvXCXXz+xQuAysLWMw5d8YyoMosZzuGa7EQ
        xMUoGEAunv1L2hjx0k4gE+g1sJMWCXGwdt/yxIQ=
X-Google-Smtp-Source: ABdhPJwgJOYHw1L3yX/BIwQso0Z1rc3QjvxT2sPrKrR3d97kn9XxdD5cGvNrsj7bYD9TY3gyDNcoo2pdjD5BFvg++WM=
X-Received: by 2002:a17:90b:1211:: with SMTP id gl17mr14246762pjb.87.1600087927887;
 Mon, 14 Sep 2020 05:52:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200910135120.3527468-1-masahiroy@kernel.org> <20200911152225.GB20374@willie-the-truck>
In-Reply-To: <20200911152225.GB20374@willie-the-truck>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 14 Sep 2020 21:51:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASijUXVmZ+AfuGOnAFnbfUpr3S2ncSxABt4bGF+agxg+A@mail.gmail.com>
Message-ID: <CAK7LNASijUXVmZ+AfuGOnAFnbfUpr3S2ncSxABt4bGF+agxg+A@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: remove cc-option test of -fno-strict-overflow
To:     Will Deacon <will@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Will,

On Sat, Sep 12, 2020 at 12:22 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, Sep 10, 2020 at 10:51:17PM +0900, Masahiro Yamada wrote:
> > The minimal compiler versions, GCC 4.9 and Clang 10 support this flag.
> >
> > Here is the godbolt:
> > https://godbolt.org/z/odq8h9
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  Makefile                          | 2 +-
> >  arch/arm64/kernel/vdso32/Makefile | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> This, and the other patch (4/4 -- I didn't see 2 or 3), look good to me.
> Are you taking them via the kbuild tree, or shall I queue them in the arm64
> tree? Please just let me know what you prefer.
>
> Will


I will apply all to the kbuild tree.
Your Ack is appreciated.

Thanks.



-- 
Best Regards
Masahiro Yamada
