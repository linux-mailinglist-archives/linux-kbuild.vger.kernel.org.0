Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4826325615B
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Aug 2020 21:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgH1TgL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Aug 2020 15:36:11 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:18247 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725969AbgH1TgH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Aug 2020 15:36:07 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 07SJZWoU003549
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Aug 2020 04:35:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 07SJZWoU003549
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598643333;
        bh=xgmwy7cXJBn84ChINx2/CLieJlmPGv6ak8AivbILyM8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JOx6ZHV+vu9EzAf57eO3yBoWxO1Okw1WBl2dJEbXOcKCb+f7G8rDEFyYP0uKzF914
         IE65YEx3kF4er8Ihe7+LgBbxXHsB35RlS5Mp/sN/te/wzPr2wXoN0k4VKfhmAwrOCk
         5iV8gs+kaYl232oeT2v4Jw8ybOeJV/Rwla2KqOv4gWdIwhOSpRUqPZLYiRgsyvx6ho
         nAjUvihGs34nKJCmPrYoExHjMN48m5fBfIbsf9luZelN5pkKCxtITzdcogDBLeU6II
         VfTFvOSKn0mUV6o5xkZ/6HKpzdQB/Bqz+lVg0YIb9ZXanOD7ClqN08Tm+HFZVelNfj
         ya/iMRdZZTkmw==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id q1so65950pjd.1
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Aug 2020 12:35:32 -0700 (PDT)
X-Gm-Message-State: AOAM532ayDqS5j4i11ie5zmqZULxh+P2dhhGHCNqrOxH2MJ3EaX5hsI2
        VQrBCrobzDrOsurE6WoM7YIydLsbWt8OnTxGN9Q=
X-Google-Smtp-Source: ABdhPJyJJTRfk94IRe4z4kipIZlc51MK3Ires9A7Js8GKloSwXZcozSITyH0aAQvyJo8xNLeqVm4HotNYg88TbuH9Js=
X-Received: by 2002:a17:90a:6f01:: with SMTP id d1mr462046pjk.198.1598643332059;
 Fri, 28 Aug 2020 12:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <9c333a75-a851-a055-e879-0967c32e2300@infradead.org> <CAK7LNAQ25mHHZJaShczfiS=YiZ77EqhjX5QaYubpyPE2Axw4vw@mail.gmail.com>
In-Reply-To: <CAK7LNAQ25mHHZJaShczfiS=YiZ77EqhjX5QaYubpyPE2Axw4vw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 Aug 2020 04:34:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQidMqfmECAGu-2aVNCcLkV0iuV-ZHkCZG++t5v2KRyGQ@mail.gmail.com>
Message-ID: <CAK7LNAQidMqfmECAGu-2aVNCcLkV0iuV-ZHkCZG++t5v2KRyGQ@mail.gmail.com>
Subject: Re: ia64 kbuild warning message
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Aug 29, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Aug 29, 2020 at 1:34 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi Yamada-san,
> >
> > I am seeing this on ia64 builds:
> >
> > ../scripts/Makefile.build:68: 'arch/ia64/kernel/palinfo.ko' will not be built even though obj-m is specified.
> > ../scripts/Makefile.build:69: You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.
> >
> > with CONFIG_IA64_PALINFO=y
> >
> > Can you explain, please?
> >
>
>
> This warning is emitted in the archprepare stage.
>
>
> The following code in arch/ia64/Makefile:
>
> make_nr_irqs_h:
>         $(Q)$(MAKE) $(build)=arch/ia64/kernel include/generated/nr-irqs.h
>
>
>
> I am wondering if we could merge
> arch/ia64/kernel/nr-irqs.c into
> arch/ia64/kernel/asm-offsets.c



OK, I figured out how to clean this up.

I will send a patch set tomorrow.
For now, I need some sleep.


-- 
Best Regards
Masahiro Yamada
