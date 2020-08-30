Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A38E256D30
	for <lists+linux-kbuild@lfdr.de>; Sun, 30 Aug 2020 12:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgH3KAb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 30 Aug 2020 06:00:31 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18128 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgH3KAa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 30 Aug 2020 06:00:30 -0400
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 07UA07wn012491;
        Sun, 30 Aug 2020 19:00:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 07UA07wn012491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1598781607;
        bh=AmQbryS++Fw4i9u5pbHkdaDrivt7AeziREnHYA7ycsg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=evvc/WaVIy2k9E2t+lxInsoBuoLM0/g2XMZHXUz4ixux2iIFIMx6KqCI6qlPCWaKG
         DbXpFLpDKYn44L02+9N4XNUDsMTSZJeRvu64oobRDE8CJZFgt9Nq2oqMVeeoUv2ywn
         d7+lRyarwziE74lHIIz+RYHkbpalvOzfLYUWV6Sdc/tlUOThMrhOsIyBMhzJRuvWSy
         cPlodpIXmHwlsVamMn6A0yYtMDvDGC7egmyhNqqdwqWoNlWRdzRnaXo9t/cF7vvBOW
         fqHMgdP17Po4gsfK83JQ4pN+HTLAPzXb4OGvYRjVEl/hUm0Zx6B4pXeWK+XBu5fouM
         u3tvye/SYnAbA==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id v16so1670091plo.1;
        Sun, 30 Aug 2020 03:00:07 -0700 (PDT)
X-Gm-Message-State: AOAM532lEqGIIjPHrsIQ5p1gYhqPmlXtU1AOtPXE4alW+1EMyM3Wbntb
        fehW0xsNgD3AbrV1K2m6cAg9PfpoJM7nLXLroic=
X-Google-Smtp-Source: ABdhPJzepc/ee7wevUkzgBvlKwgo3wRx0XQMZkaQ3J/+cOjFteDd3VIoaRrYnOJVBS9+mYzgUAxXgEtytsoq3KyfiZ4=
X-Received: by 2002:a17:902:b60b:: with SMTP id b11mr4920718pls.268.1598781606646;
 Sun, 30 Aug 2020 03:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200829081417.725978-1-masahiroy@kernel.org> <20200829081417.725978-5-masahiroy@kernel.org>
 <25add4c8-fc8d-9874-2e34-b45cc7ae675e@infradead.org>
In-Reply-To: <25add4c8-fc8d-9874-2e34-b45cc7ae675e@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 30 Aug 2020 18:59:29 +0900
X-Gmail-Original-Message-ID: <CAK7LNARgG=SWfCDgwVST-fuYGZ-sxdh_W_=bAWqXbmw67+Qg2g@mail.gmail.com>
Message-ID: <CAK7LNARgG=SWfCDgwVST-fuYGZ-sxdh_W_=bAWqXbmw67+Qg2g@mail.gmail.com>
Subject: Re: [PATCH 05/11] kconfig: qconf: show data column all the time
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Aug 30, 2020 at 1:54 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 8/29/20 1:14 AM, Masahiro Yamada wrote:
> > The next commit will allow users to edit "int", "hex", "string"
> > menus in-place from the data column.
> >
> > The data column should be always displayed.
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/kconfig/qconf.cc | 29 +----------------------------
> >  scripts/kconfig/qconf.h  |  5 +----
> >  2 files changed, 2 insertions(+), 32 deletions(-)
> >
>
> I am trying to edit LOG_BUF_SHIFT, which has a value of 17
> (this is x86_64).


My goal is to use Qt gadgets with least modification
and align with the standard behavior as much as possible.



> I want to change the 7 to 9, making it 19, so I double-click on the "17"
> (single-click won't give me an edit cursor).


Yes. You need to double-click the cell
to open up the editor.
Single-click is not enough.

It is the same for a simple example
program using QTreeWidgetItem.
So, it is the standard behavior of the Qt library.



> The edit cursor is
> immediately after the "17", so it's like
>                                                 17|
> with the | cursor blinking.


Same for me.
And the "17" is highlighted.

> What I expect to be able to do is
> Backspace, enter 9, press Enter, and the new value is 19.
> But Backspace does nothing.

That is different from what I see on my machine
(matacity of Ubuntu).

After I double-clicked the cell, the entire "17" is high-lighted.
Backspace deleted "17" entirely for me.

The same behavior for a simple example,
and it makes sense since Backspace should delete the selected characters.

If Backspace does not work at all for you,
was it perhaps captured somewhere else on your machine?


> I just have to enter the complete new
> value: 19. So IMO it does not act like an edit box so much as a
> replacement box.

I am re-implementing a new way to edit values.
It does not need to act as before.


> Also, the new value that I enter is displayed/written over the old value,
> so I see 17 in white-on-blue and over that I see 19 in black until I
> press Enter, then I see only 19 in white-on-blue.

I do not see such a weirdness either on my machine.
I see only the new value I am entering.


I have no idea what makes it work differently
for you.



>
> BTW, if I edit DEFAULT_HOSTNAME, which begins as "(none)" and I change it
> to "xyz" and then change it to <empty string>, it becomes
> CONFIG_DEFAULT_HOSTNAME=""
> Should I have to enter "(none)" to get it back to (none)?  I guess so.


It is a text string, "(none)",
which is not an empty string.

See init/Kconfig.


config DEFAULT_HOSTNAME
        string "Default hostname"
        default "(none)"


--
Best Regards
Masahiro Yamada
