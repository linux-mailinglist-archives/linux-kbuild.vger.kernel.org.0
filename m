Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C615232C1E9
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 01:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351445AbhCCTak (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 14:30:40 -0500
Received: from mail-ua1-f48.google.com ([209.85.222.48]:34256 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382890AbhCCKub (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 05:50:31 -0500
Received: by mail-ua1-f48.google.com with SMTP id 101so1344718uag.1;
        Wed, 03 Mar 2021 02:50:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a0+HkE5rtrnOh+ccD8NRQ5/6SNLmd9DNab9IejVPu54=;
        b=SfA++LFKRaZu+0PtzMr1Fb39BxI8lydptkXIIWN+1uzr9fUuqPLjTIfZGTAk+ihj8c
         +AxYHFHLd9Q1XUaY+zLVs5K6dS9DmnuypBTbJK1lVcVuEHH3pcxel9j2gnO3M1wriYQR
         92TqbIn5Z9g7PSvaxVtgVtQpll4hranx23f6JWd4WwhQgb5JhmHu5MJXRKC8m2oOCD53
         oFvgUeCS8/5DtZ+Pxnrlkkd6Qv21p3mYrDbsh0prmU4RqLapNqovXtpX4iq04ya0xBur
         ij/BeVkvZcdZhyEGBA0fHYMZ01MpGDQeBeBtB8tULISh3/ih0qwS42rFzAT5ZkS7QT5g
         4k6Q==
X-Gm-Message-State: AOAM530X2tQtuPfHTEgJRxnNp7xN2k10M828q+r+8rnRMvkmlagjO+UG
        wtke/yp2SMew3OOgXNTn0QgvLbq0S4G779A11J4=
X-Google-Smtp-Source: ABdhPJz9D+WZjSD7bEl/38vLCndzHs1KGmiF+4G2RXI1YLNZG+Axye8gNs8RAQ41dNONvR2LuYsjxlJhr6W+tpDflkE=
X-Received: by 2002:ab0:3c8:: with SMTP id 66mr6728610uau.4.1614768590299;
 Wed, 03 Mar 2021 02:49:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1614745266.git.viresh.kumar@linaro.org> <263ac0777bee9384b66fb4e74ed3abdc45a1bb82.1614745266.git.viresh.kumar@linaro.org>
In-Reply-To: <263ac0777bee9384b66fb4e74ed3abdc45a1bb82.1614745266.git.viresh.kumar@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 3 Mar 2021 11:49:39 +0100
Message-ID: <CAMuHMdUMn4qDLE4z98vDwgBZ5pUAk40o4A4A5JG3bOpPNZj9mg@mail.gmail.com>
Subject: Re: [PATCH V9 2/4] kbuild: Add generic rule to apply fdtoverlay
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Rob Herring <robh@kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On Wed, Mar 3, 2021 at 5:36 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> From: Rob Herring <robh@kernel.org>
>
> Add a generic rule to apply fdtoverlay in Makefile.lib, so every
> platform doesn't need to carry the complex rule.
>
> The platform's Makefile only needs to have this now:
>
>  DTC_FLAGS_foo_base += -@
>  foo-dtbs := foo_base.dtb foo_overlay1.dtbo foo_overlay2.dtbo
>  dtb-y := foo.dtb

Is there a way to autogenerate the DTC_FLAGS_foo_base rule, based on
the foo-dtbs rule?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
