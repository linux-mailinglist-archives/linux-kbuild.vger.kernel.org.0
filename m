Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82E391E99D0
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2020 20:17:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728232AbgEaSRx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 May 2020 14:17:53 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20673 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbgEaSRx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 May 2020 14:17:53 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04VIHa98020285
        for <linux-kbuild@vger.kernel.org>; Mon, 1 Jun 2020 03:17:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04VIHa98020285
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590949057;
        bh=GnPB7AZ7/hnOJ6vFoG6enond++YKJL6YPC9b3Ght3R0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Hza0KpRs1zHw4+BDW2m7jhFRI78NzfJEbgUJHb1GqYlUImHfe2Ey3AtXbDg89yWSv
         l5I16HqOXz+6NqWANPI6M+14qUh0I5Z9Wukfrc/Eg0jKHcM4x4dvj0G4RWIX5AMNd0
         N/PAaK//VjuYBb5GRB9ijrsrXTsAZ9Wl9NIgKws0iNjlFQE5YGBOYWE696tbI026A+
         Ua5cqIENTAhfzv7/QypgUIjJpf+HF2DLm5YlKjdyV31fvxvyJCeAHZQIx4d4r5+i/P
         s1o/HLHMfBkAXNwYuTvydUIYP0TX7topEL0AOdn7JrQC8TpmMWdSMxw0evp5PwEnHw
         QTlWwGnfAP+zw==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id q2so148342vsr.1
        for <linux-kbuild@vger.kernel.org>; Sun, 31 May 2020 11:17:37 -0700 (PDT)
X-Gm-Message-State: AOAM533My9vHtRrIFbJcFKbg+rqrIY78xQAl5ZzyyYsNbtI66QrJ5yWV
        MC95z5oLlSAhDjfdvX9co/MU12VPer0JoNH+L5Q=
X-Google-Smtp-Source: ABdhPJztyWIuqbo6K3VWt7OYQcr+OVBbhi/KKF2fGzEYIIv+4fMbfnK/sJ2vIlGHxoqqLm5oTvuCQGLNfJFty2EVxuE=
X-Received: by 2002:a67:eb47:: with SMTP id x7mr11687241vso.179.1590949055866;
 Sun, 31 May 2020 11:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
In-Reply-To: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Jun 2020 03:16:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
Message-ID: <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: allow modules_install if CONFIG_MODULES=n
To:     Jonas Zeiger <jonas.zeiger@talpidae.net>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 28, 2020 at 1:44 PM Jonas Zeiger <jonas.zeiger@talpidae.net> wrote:
>
> Many applications check for available kernel features via:
>
>   * /proc/modules (loaded modules, present if CONFIG_MODULES=y)
>   * $(MODLIB)/modules.builtin (builtin modules)
>
> They fail to detect features if the kernel was built with
> CONFIG_MODULES=n
> and modules.builtin isn't installed.
>
> Therefore, allow the Makefile's modules_install target to be used
> always.
>
> Tested Makefile targets with different CONFIG_MODULES states:
>
>   * (CONFIG_MODULES=n) modules_install: install modules.builtin etc.
>   * (CONFIG_MODULES=y) modules_install: produce same result as before
>   * (CONFIG_MODULES=y) modules_install: still fail if no modules.order
>   * (CONFIG_MODULES=y) modules: build modules, as before
>   * (CONFIG_MODULES=n) modules: still fail and warn
>
> Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>


Maybe, module.builtin and module.builtin.modinfo should be
installed by 'make install' because they are byproducts of vmlinux.


-- 
Best Regards
Masahiro Yamada
