Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA43B319447
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 21:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbhBKUU6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 15:20:58 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:24385 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhBKUUt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 15:20:49 -0500
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 11BKJbjV004020;
        Fri, 12 Feb 2021 05:19:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11BKJbjV004020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613074777;
        bh=3q85RvzHUnQVHf5EgSJ9LEngLtR72RZfrJmefS9Q5D0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=EC+iBNh4mWXICOT952zRC4y2rDrSRY/Dr7Hf5V39cRFXg9BoYILqZ0n8H4sxHTQUm
         pORJrWliZjy9acmlqzznYJQmi6kigO3vVV2W2IJiZymLH9+t7/s9TwATkI7CDZiTaB
         eK+aga71NOzerbD1i2ah0WxGWxvwEMGzcsHhTiEdNaauKD9azQ0cPyzJ6hlXaGDXiO
         0VKcoMGAoYCoTg2/HJ+4geAOAt7J5Yzwt+DA7mPKKv5MEFzOQa/3w6S6RbjvMlOmuR
         HuLqMk1W7kk+5UKPKOU8s2qsmMf8YkBPZbK+2yf7iLV/GARRU9LyOwWt/HpOicmKne
         6RJUcWcbfuvzg==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id 189so4403423pfy.6;
        Thu, 11 Feb 2021 12:19:37 -0800 (PST)
X-Gm-Message-State: AOAM533Wt+31ysTwsAt90wwVPNKLiTfywGWPPoxbNklNImQj4EpZqLoQ
        dbk9aA3XrrF0sLgpk2TCKl1STpo+hdyrLOYb05Y=
X-Google-Smtp-Source: ABdhPJyippLQMQoQfn+gej5CZpaJxuwzIoVtjaNY/P5e7I73ipSgTgYqmXOayMt5lndNN96IFx1ib4JpGB0OPXBWX6I=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr9890788pgi.175.1613074776790;
 Thu, 11 Feb 2021 12:19:36 -0800 (PST)
MIME-Version: 1.0
References: <20210207161352.2044572-1-sashal@kernel.org> <20210208175007.GA1501867@infradead.org>
 <20210208182001.GA4035784@sasha-vm>
In-Reply-To: <20210208182001.GA4035784@sasha-vm>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 12 Feb 2021 05:18:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
Message-ID: <CAK7LNAQtQTwGt4SCK88a=y4ydASXoR30cCCmcFFdsUk=WY7tfA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify access to the kernel's version
To:     Sasha Levin <sashal@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 9, 2021 at 3:20 AM Sasha Levin <sashal@kernel.org> wrote:
>
> On Mon, Feb 08, 2021 at 05:50:07PM +0000, Christoph Hellwig wrote:
> >On Sun, Feb 07, 2021 at 11:13:52AM -0500, Sasha Levin wrote:
> >> +            (u8)(LINUX_VERSION_MAJOR), (u8)(LINUX_VERSION_PATCHLEVEL),
> >> +            (u16)(LINUX_VERSION_SUBLEVEL));
> >
> >No need for the casts and braces.
> >


I agree.

Shall I remove the casts when I apply this?




> >Otherwise this looks good, but please also kill off KERNEL_VERSION
> >and LINUX_KERNEL_VERSION entirely while you're at it.
>
> I don't think there are in-tree users left?
>
> We can't remove it completely because userspace is still using it, so if
> we drop those userspace will be sad.


Right.
Once we export a macros to userspace, we cannot remove it.





> --
> Thanks,
> Sasha



-- 
Best Regards
Masahiro Yamada
