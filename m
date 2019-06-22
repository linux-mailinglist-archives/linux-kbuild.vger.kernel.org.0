Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD6B44F5BD
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 Jun 2019 14:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbfFVMbR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 Jun 2019 08:31:17 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:30710 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbfFVMbR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 Jun 2019 08:31:17 -0400
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x5MCV1Q7016356;
        Sat, 22 Jun 2019 21:31:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x5MCV1Q7016356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561206662;
        bh=m54BvUSyNYNL33mmnHMDkq+76aAFKf+BJdGvxLc/WI4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DLHR74rkAqZP3/MBBqZOM/tf+80ugRExZHoXIcUs8aFU5MwfvTFb9w+LUXwbrjihB
         q/xpGGtf6lpk+A2VoHUdvR8SLJDP5/DPGXuLVriD94CBDCH8218GW06mg40rByqkRn
         T33cCAiX23UXjydM3flMYDV2+gMZde4kPAQUXmRUgdJvrkOuPXWeDWCaRx7LkdpvU6
         D1jENLTUNzdTwqT8YpVRWTNl5RwCNzZoezg5CHvf3XZFt/NeVu/MvSPZ5Ax+f5W+f+
         Pq4BQCfOL0IddvlfurF/4Hea9T+jVbfKRjPSFju1HON8ah4S0DXMr8ZDq5CLKxVTUD
         ZakkBFHU9jL8g==
X-Nifty-SrcIP: [209.85.221.173]
Received: by mail-vk1-f173.google.com with SMTP id k1so1874647vkb.2;
        Sat, 22 Jun 2019 05:31:01 -0700 (PDT)
X-Gm-Message-State: APjAAAXEd20zln68DmBpScqaVZWu7hbClEFng2Luv4Dnv5ElP9qeJE7S
        XdxvvQc5DEX5htyhSFQA+mUtetlQiHOgmByUxUU=
X-Google-Smtp-Source: APXvYqyBMcX4VGPYKX3tfLIsaz7wkVCv1WB8vYa4Pvt6tJ+QqY3hMQYIWuARG2vUmbyjhfd7TSYdbMhHiQvJhvZdy/E=
X-Received: by 2002:a1f:728b:: with SMTP id n133mr15338535vkc.84.1561206660594;
 Sat, 22 Jun 2019 05:31:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190621163931.19397-1-yamada.masahiro@socionext.com> <20190621175134.GB16409@ravnborg.org>
In-Reply-To: <20190621175134.GB16409@ravnborg.org>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 22 Jun 2019 21:30:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
Message-ID: <CAK7LNATz1iuG0Moab60gMSbVU8PJAmrLn27K8HK_1zQ0qeh26w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: compile-test global headers to ensure they are self-contained
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam,

On Sat, Jun 22, 2019 at 2:51 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro.
>
> On Sat, Jun 22, 2019 at 01:39:31AM +0900, Masahiro Yamada wrote:
> > Make as many headers self-contained as possible so that they can be
> > included without relying on a specific include order.
> It is very nice finally to get some infrastructure to validate header
> files.
>
> But to avoid too many conflicts while including more and more headers
> that are selfcontained we really need something that is more
> distributed.
> So for example all header files in include/drm/* could be in one
> Makefile, incl. sub-directories, but the same Makefile would not include
> the files in include/soc/
>
> If you just show how ot do it, others can follow-up with the
> relevant directories.


At first, I tried to split Makefile per directory,
and add header-test-y one by one.

I think you expect they look like this:


include/Makefile:

subdir-y += drm
subdir-y += linux
subdir-y += media


include/drm/Makefile:

header-test-y += drm_cache.h
header-test-y += drm_file.h
header-test-y += drm_util.h
...


include/linux/Makefile:

header-test-y += io.h
header-test-y += list.h
header-test-y += kernel.h
header-test-y += types.h
...



This is a straightforward way,
but I see some disadvantages.

Currently, there are more than 4000 headers
under include/.

So, to cover (almost) all of them, we must
list out 4000 entries.

When somebody adds a new header,
he will be very likely to forget to add
header-test-y for it.
So, newly added headers will always
fall off the coverage.


So, I am trying to take an opposite approach.

Add all headers in include/ by wildcard, then
filter-out one that cannot be self-contained.

In my analysis, 70% of headers are already conf-contained.
After some fixups, 95% of headers can become self-contained.

At this moment, the wildcard only covers some directories
or patterns, but my plan is to extend the wildcard gradually.


Please feel free to suggest alternative ideas.


-- 
Best Regards
Masahiro Yamada
