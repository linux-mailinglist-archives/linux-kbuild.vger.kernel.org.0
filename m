Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AAF9BD4CF3
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2019 06:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfJLE0W (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Oct 2019 00:26:22 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49627 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbfJLE0V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Oct 2019 00:26:21 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x9C4QARl002225;
        Sat, 12 Oct 2019 13:26:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x9C4QARl002225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1570854370;
        bh=u9wmT/Hdot8DTpUJdxXrIyO9KPNJrJCevfN1MDnU3f8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nYyD0KjmUXXABcj9S78TlxMjTQmnh//Ytn2VsWmK2ZketQ1H6SVxWvy1QWX0tQNWg
         hQkBvFNV+hMZbBR87NecBfH0KV2hPCqFleW4zF52rRfNPxULkb+HRbBbbrg7qcSNuc
         6kR45j0wNBsSFV0bNVTfbuD4U+wtNnRWsVT7S/h4/lMW5v7ha0fUfkD5r/SFD6Bc4T
         JoujFjUpPoajxAMe1CQakP/HS/dnANgvOBWb6sP79jx+5yuAwyHBZsXOi9n1x1AKI3
         7+2C0vTVJf5uRgJwufpkUCc4zM8vRk8iFHwDmazS3pia4gCzjeF1O2xrSveJPglr4Y
         wEkuxrum6Mu4w==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id v19so7575794vsv.3;
        Fri, 11 Oct 2019 21:26:10 -0700 (PDT)
X-Gm-Message-State: APjAAAVkzPklTOOEf/N/4SE9p86OmFKdJT97rjMTAY97pOB1RAX2jay7
        HoOk9Hsj8LuRd9i2OFgca76Fp8j1c6ZxAJ9siiA=
X-Google-Smtp-Source: APXvYqyJCP1RZpKZxR61EaQLFEnhVwEqC60uotPeRKxZ2pZZOMM2TgalafsILrZufd2nJyMNHWQkyhs2H+F8UOY8ryM=
X-Received: by 2002:a67:e354:: with SMTP id s20mr11212403vsm.54.1570854369388;
 Fri, 11 Oct 2019 21:26:09 -0700 (PDT)
MIME-Version: 1.0
References: <20191010151443.7399-1-maennich@google.com> <20191010151443.7399-5-maennich@google.com>
 <20191011153127.GA1283883@kroah.com> <20191011154311.GA192647@google.com>
In-Reply-To: <20191011154311.GA192647@google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 12 Oct 2019 13:25:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvQd8C4UE3Zm9tsSH48w3QKwskyTKn2P8tegBMrV0_ww@mail.gmail.com>
Message-ID: <CAK7LNASvQd8C4UE3Zm9tsSH48w3QKwskyTKn2P8tegBMrV0_ww@mail.gmail.com>
Subject: Re: [PATCH 4/4] export: avoid code duplication in include/linux/export.h
To:     Matthias Maennich <maennich@google.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Martijn Coenen <maco@android.com>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Shaun Ruffell <sruffell@sruffell.net>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-modules <linux-modules@vger.kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 12, 2019 at 12:43 AM Matthias Maennich <maennich@google.com> wrote:
>
> On Fri, Oct 11, 2019 at 05:31:27PM +0200, Greg Kroah-Hartman wrote:
> >On Thu, Oct 10, 2019 at 04:14:43PM +0100, Matthias Maennich wrote:
> >> Now that the namespace value is not part of the __ksymtab entry name
> >> anymore, we can simplify the implementation of EXPORT_SYMBOL*. By
> >> allowing the empty string "" to represent 'no namespace', we can unify
> >> the implementation and drop a lot redundant code.  That increases
> >> readability and maintainability.
> >>
> >> As Masahiro pointed out earlier,
> >> "The drawback of this change is, it grows the code size. When the symbol
> >> has no namespace, sym->namespace was previously NULL, but it is now am
> >> empty string "". So, it increases 1 byte for every no namespace
> >> EXPORT_SYMBOL. A typical kernel configuration has 10K exported symbols,
> >> so it increases 10KB in rough estimation."
> >
> >10Kb of non-swapable memory isn't good.  But if you care about that, you
> >can get it back with the option to compile away any non-used symbols,
> >and that shouldn't be affected by this change, right?
>
> Rasmus suggested to put the 'aMS' flags on the __ksymtab_strings section
> to mitigate this:
> https://lore.kernel.org/lkml/f2e28d6b-77c5-5fe2-0bc4-b24955de9954@rasmusvillemoes.dk/
>
> I was not yet able to properly test this, so I did not include it in
> this series. As I said in the cover letter, this 4th patch might be
> optional for 5.4. So, we could defer it to a later time when we have
> addressed that properly.


This looks the same as my patch, though.

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada
