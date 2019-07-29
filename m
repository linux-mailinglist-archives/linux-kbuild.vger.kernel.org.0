Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F37778350
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 04:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfG2CXG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jul 2019 22:23:06 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38742 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfG2CXG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jul 2019 22:23:06 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x6T2MvFL019173;
        Mon, 29 Jul 2019 11:22:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x6T2MvFL019173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564366979;
        bh=k2QLRiQDkuWaSKfcHfJ1y09U5DDhg6N4MqdklqLha/I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ee8L3ueOLqVby60tIJw+TDcauMGJFvheuTaNbuXD9dRtTxAZaFgu6+Q/qgiJx/ZNc
         x+JD2oNc6kLR0OWp3qNXxW3IXG5LobU5VZdhUmStKkpwMs3DyI5tr5JlkN11t886Yc
         wOLWyVfFwO/emKp0h1deW4FcC+PxS2qdSXH7xeG12AwVFHBMBLvXCRF/sWmNxU8e7Q
         nTw7/RfB5R92txlZcNNJzQBPxgdvlSljojahtCzHWDWEDyVd+r8r+X6VIU031cjQhA
         EZ08CyrDp24x9T0kEaHM2cMttE20IVV/tb3dBjhjaBQvnqd0jf/KAvZOcIgyO8Pt7X
         3O+HzaEeEzHSw==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id j26so39775871vsn.10;
        Sun, 28 Jul 2019 19:22:58 -0700 (PDT)
X-Gm-Message-State: APjAAAV9tzxbIyAJEOMiO3DlK/2s8yCOjWT8HhSM/fZbyVELmYYCMZjH
        8tnUHyCXTsJvFTx2E75kRnN5Cna+DaOgyIotwn4=
X-Google-Smtp-Source: APXvYqyrZPLPyFW53wQOZQgQ0oT2otDrFG15Cv/CAdpu7iC9TYlGMBeCiJhYHC3Ji46UZTXdksVnhaNeNiAO3551DHI=
X-Received: by 2002:a67:f495:: with SMTP id o21mr65883672vsn.54.1564366977087;
 Sun, 28 Jul 2019 19:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.21.1907262245320.1791@nanos.tec.linutronix.de>
 <CAK7LNAS1=+OccAd3asj9P9JMWnhimRWR+dPQREOyK3y=Dx2odg@mail.gmail.com>
 <alpine.DEB.2.21.1907281111570.1791@nanos.tec.linutronix.de> <alpine.DEB.2.21.1907282026320.1791@nanos.tec.linutronix.de>
In-Reply-To: <alpine.DEB.2.21.1907282026320.1791@nanos.tec.linutronix.de>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 29 Jul 2019 11:22:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTNzxHg4G0jxdNcNhwxtSbBRYNKgYSeFfR1edMw5DrwQ@mail.gmail.com>
Message-ID: <CAK7LNARTNzxHg4G0jxdNcNhwxtSbBRYNKgYSeFfR1edMw5DrwQ@mail.gmail.com>
Subject: Re: [PATCH V2] Kbuild: Handle PREEMPT_RT for version string and magic
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sebastian Sewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 29, 2019 at 3:27 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Update the build scripts and the version magic to reflect when
> CONFIG_PREEMPT_RT is enabled in the same way as CONFIG_PREEMPT is treated.
>
> The resulting version strings:
>
>   Linux m 5.3.0-rc1+ #100 SMP Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #101 SMP PREEMPT Fri Jul 26 ...
>   Linux m 5.3.0-rc1+ #102 SMP PREEMPT_RT Fri Jul 26 ...
>
> The module vermagic:
>
>   5.3.0-rc1+ SMP mod_unload modversions
>   5.3.0-rc1+ SMP preempt mod_unload modversions
>   5.3.0-rc1+ SMP preempt_rt mod_unload modversions
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
> V2: Simplify the ifdeffery as pointed out by Masahiro


Applied to linux-kbuild.
Thanks.

-- 
Best Regards
Masahiro Yamada
