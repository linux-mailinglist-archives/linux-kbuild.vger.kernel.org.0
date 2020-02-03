Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1A471505D0
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Feb 2020 13:04:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727736AbgBCMEX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 3 Feb 2020 07:04:23 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46919 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbgBCMEW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Feb 2020 07:04:22 -0500
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 013C4DAC003983;
        Mon, 3 Feb 2020 21:04:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 013C4DAC003983
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580731454;
        bh=HXRjoh3tOmENbndDq09lfWq2QoDEVUfSfWRoeiU288s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e8PBNT7o1EaIV1x6R3c1IE8A6VV9NkPXWPVNzS/JYRKWLbmSHR9q0vUiu75zrup1g
         MCgm4kkmhlRSZcn+r3y3VXRFluNpLWYsVIEmW+dixJht3ks4ghMAkd3yjox3yi6Svm
         wH6P4OVpHGO6E7hBQ7L+MJTVN6pRsSMVTW8ddmrnfqA59faoAyW+7+zncSueYlQKej
         N2yueC0BhY0BlUDA0jzYcoRpWkHvTEFZZX7+RNgBfliTb3U+rW/um6LMpaSJKPxra1
         tQVYKF9z7u7nG14BAivKMDuZVZN4wmUhdWEhwLtU90ciqugIC9AOUJESoRcRNpRs/w
         knULWhzxRK7tg==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id r18so8726128vso.5;
        Mon, 03 Feb 2020 04:04:13 -0800 (PST)
X-Gm-Message-State: APjAAAVdpb2P8+X6k50iyl7KGhcSiatQSLxpew5JXLupjjzCtvqMp5+K
        A1FhCLBnjhxLo9RA/tVGKn8p9RjWHNwiE/hl7ms=
X-Google-Smtp-Source: APXvYqynB2Rt8g+qb3LtFb7NupXFI56oEbUDrTHHiNxSyMsveD8dUomebpR+eC7PVuv/cz22AzjrpSJAxu9V2G/jvpI=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr14543979vsq.215.1580731452812;
 Mon, 03 Feb 2020 04:04:12 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAS625YwKpv4wfKO78+Rexe2fP5pLDbMD4r71wwiQfN0Ng@mail.gmail.com>
 <CAHk-=wiTEVwmj-PH98reZTibx+C_GLwAmXO0RFmJa9weZcg70g@mail.gmail.com>
 <CAK7LNAQwJVnVti4cX2GHdekD0mx1Kc2A3xvsE63WhHAGvgW2QA@mail.gmail.com> <CAHk-=wi2=8tYULPzHNZXLcMYr-zPpMchfhy4nyTjLBpvH5yHhg@mail.gmail.com>
In-Reply-To: <CAHk-=wi2=8tYULPzHNZXLcMYr-zPpMchfhy4nyTjLBpvH5yHhg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 3 Feb 2020 21:03:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARA9GmCE3fr4JiHKNBMnQ_D0yik2UHtPHXq621J8_satQ@mail.gmail.com>
Message-ID: <CAK7LNARA9GmCE3fr4JiHKNBMnQ_D0yik2UHtPHXq621J8_satQ@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Kbuild updates for v5.6-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,


On Mon, Feb 3, 2020 at 8:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
>
> On Mon, Feb 3, 2020, 01:16 Masahiro Yamada <masahiroy@kernel.org> wrote:
>>
>>
>> Generally, initramfs is passed from a boot-loader,
>> but some architectures embed initramfs into vmlinux
>> (perhaps due to poor boot-loader support??)
>
>
> You didn't answer my real question.
>
> Why do we give the user the choice, when it doesn't matter, and the user doesn't care?

I do not want that commit simply reverted.

Please let me clarify what you want to see:

[1] Remove this choice completely ?
    The build system will choose the best one.
    For example, CONFIG_RD_XZ  is enabled,
    '.xz' is _always_ preferred choice over '.gz'


[2] Hide this choice unless INITRAMFS_SOURCE!=""

    As Geert mentioned, we still could save
    a little more data size, but we assume
    people would not care about hundreds bytes.


Which one ?


[2] was the previous behavior.
I think you are complaining
because you noticed a new prompt showed up.


> The argument for the commit was "it's simpler".
>
> But that is simply not *true*.
>
> It's simpler only technically. It's more complexity for the only party that matters: the user.
>
> So I'm likely going to just revert that commit as incorrect and misleading. It's not simpler at all. It's more complex.
>
> The configuration code should care about the user interface more than it seems to do. Some complexity in order to make for less pointless questions is food m good.
>
>        Linus



--
Best Regards
Masahiro Yamada
