Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8483163C2
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 May 2019 14:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEGMaK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 May 2019 08:30:10 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:46861 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbfEGMaK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 May 2019 08:30:10 -0400
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x47CU59h011539;
        Tue, 7 May 2019 21:30:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x47CU59h011539
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557232206;
        bh=S9/8lhDno6D4EANrcBZaiY2Z1TQ8zl11sZWmBF1vn94=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=n9KgtbkopwyREvmdFmFcC8/ru+R2GvodWxkEV+IId4AZZZ0CkmXtVaXEydatW1TK2
         0nnXC+LC3Ehgeg4h6eU/l1Ku3unyHF94M7NGs3OnaRc9B+eUsJFQ1tFZOFV2MGm/K2
         MDNfoTvqoHWKsF3cGV8t5T8dUUGnfL7SdbinfdHieVIhyno29y7MNDtccdBqL1/W+R
         8qcU4YVJjFG4nrHgjrhppcPOtgiTm3NR69uaxU/Rf6mqgaNKZXpFXLsV1WqL+i6Xtm
         Ip9/wgW098JPFJeKW/IvdHjK9sHaktoS2ijh/Ui9EMwmQFqfT6hq6zzRrRNz6eQrZt
         sxyK1BXngfQiQ==
X-Nifty-SrcIP: [209.85.217.50]
Received: by mail-vs1-f50.google.com with SMTP id c24so3344382vsp.7;
        Tue, 07 May 2019 05:30:06 -0700 (PDT)
X-Gm-Message-State: APjAAAXQ9JgdywgXuT510Rgd+8XOnKA+14zcMkARK/Qsj8MVbMpeLbYg
        AeVEqfdahgT9UdfQbgPjg0mlMSWldJt7XpHOQnU=
X-Google-Smtp-Source: APXvYqyut/YDuudi5pcfAcZWqm21pFqA2cMBf7RyotL0zXKfb6+s2BTSVnv60dqXjD4t4kIjAEBpaVjwZSCzAbaXRh0=
X-Received: by 2002:a67:fd89:: with SMTP id k9mr4357306vsq.54.1557232205149;
 Tue, 07 May 2019 05:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <1556107369-7655-1-git-send-email-alex.popov@linux.com> <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com>
In-Reply-To: <ce9c3689-86f3-eda7-8c3d-4af834ee750d@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 7 May 2019 21:29:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
Message-ID: <CAK7LNAQUMZ4QHeYin16P-NJq77CgxuR96R46wgbf5jkpYhYP8Q@mail.gmail.com>
Subject: Re: [v2 1/1] kconfig: Terminate menu blocks with a comment in the
 generated config
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 1, 2019 at 10:01 PM Alexander Popov <alex.popov@linux.com> wrote:
>
> On 24.04.2019 15:02, Alexander Popov wrote:
> > Currently menu blocks start with a pretty header but end with nothing in
> > the generated config. So next config options stick together with the
> > options from the menu block.
> >
> > Let's terminate menu blocks in the generated config with a comment and
> > a newline if needed. Example:
> >
> > ...
> > CONFIG_BPF_STREAM_PARSER=y
> > CONFIG_NET_FLOW_LIMIT=y
> >
> > #
> > # Network testing
> > #
> > CONFIG_NET_PKTGEN=y
> > CONFIG_NET_DROP_MONITOR=y
> > # end of Network testing
> > # end of Networking options
> >
> > CONFIG_HAMRADIO=y
> > ...
> >
> > Signed-off-by: Alexander Popov <alex.popov@linux.com>
>
> Hello!
>
> Just a friendly ping.
>
> Would you like to take this patch?
> Can I improve anything?


This patch breaks "make testconfig".

Please get rid of the "endof" for the rootmenu
at the end of the .config file.

Thanks.




> Best regards,
> Alexander



-- 
Best Regards
Masahiro Yamada
