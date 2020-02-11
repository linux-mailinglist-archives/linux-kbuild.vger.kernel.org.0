Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5441D15951E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 17:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730907AbgBKQjT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 11:39:19 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:51178 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728049AbgBKQjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 11:39:19 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 01BGcrQs030668;
        Wed, 12 Feb 2020 01:38:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 01BGcrQs030668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581439134;
        bh=Fx7J1tLvigpB2TQEKEHL9mZZJiUbmOHvoP/GiGlFxss=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ml5vePaorXfWR1IkIk8aVOLkwlszo/+IPtOdpx3YlN/JlOhIDQ1811ZmaQg7TQzKf
         bcDqvAXL4TZhPPQP3QYuoomkHT+lEzdWKy0TWGCJ0+LapfKTzHltrwMTcheEu9mzYu
         SXLbW1/Bfmtc1F6G4cZifJzDpf35danf/c1FpWsQWYcMk6TOtRcAXpV+kFrgItqOz3
         YZUK/KUSpMN7kT6+3AhYk5oHM+exipqr+dgQ/12DV4pkfyT79UCk/jOU4rokh3E/DZ
         FgjL5ZyrIoqWGTRNUbmKU3Fx+yx4yPtBV+1cBl4SxehYVGl2Zr4PDx5okApw3FZt0F
         Kp2SnkqOUuqTQ==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id h32so4188299uah.4;
        Tue, 11 Feb 2020 08:38:53 -0800 (PST)
X-Gm-Message-State: APjAAAXjXLcxN7pwBgvcFvWjBouV4X8r9VfvNJ7+WGSqeYind4wQ1Q0m
        /J+C9JhESH2Qjh3YIxQ4di4X9NcTYs/NEgyrkAI=
X-Google-Smtp-Source: APXvYqwHm08bawF4IR7j/P5H17OzWDZmArcl2jYMsqSgfZ5kjpP6JGy/GtBXXkiRnojqD0Ml3k0SUtEHhHi7Machn7o=
X-Received: by 2002:ab0:2ea6:: with SMTP id y6mr2151127uay.25.1581439132256;
 Tue, 11 Feb 2020 08:38:52 -0800 (PST)
MIME-Version: 1.0
References: <20200207091351.18133-1-geert@linux-m68k.org> <CAK7LNAQGcw1jbb=fWd_CbWv5hQrkqG_QFCw3uY4LXroONGM6BA@mail.gmail.com>
 <20200211161905.GM4543@sirena.org.uk>
In-Reply-To: <20200211161905.GM4543@sirena.org.uk>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 Feb 2020 01:38:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNARCr8afvs=h5-ZWVs=Bkk7PSMNvX+M_SeBSF-L99UencA@mail.gmail.com>
Message-ID: <CAK7LNARCr8afvs=h5-ZWVs=Bkk7PSMNvX+M_SeBSF-L99UencA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] ASoC: Use imply for SND_SOC_ALL_CODECS
To:     Mark Brown <broonie@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 12, 2020 at 1:19 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 12, 2020 at 01:09:30AM +0900, Masahiro Yamada wrote:
>
> > Why does SND_SOC_ALL_CODECS exist in the first place?
> > Is this compile-test or run-test?
>
> It's for compile coverage.
>
> > If it is the former, allyesconfig / allmodconfig
> > covers all of them.
>
> No it doesn't.  Those only enable user selectable options, many CODEC
> drivers don't have user selectable options as they are selected by
> machine drivers some of which either have more platform specific
> dependencies that the CODEC drivers or aren't upstream.


Maybe, can you add a prompt which is only displayed
if COMPILE_TEST is enabled?



For example,

config SND_SOC_L3
        tristate "some prompt" if COMPILE_TEST




In normal use-cases, this CONFIG option is hidden
since we expect it to be selected by some machine options.

If COMPILE_TEST is enabled, we can toggle as you like.


If I run
 $ git grep  "if COMPILE_TEST"

I see many usages of this tip.


-- 
Best Regards
Masahiro Yamada
