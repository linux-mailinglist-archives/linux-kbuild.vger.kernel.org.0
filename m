Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2AB31081A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Feb 2021 10:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhBEJoL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 5 Feb 2021 04:44:11 -0500
Received: from mail-oi1-f174.google.com ([209.85.167.174]:37902 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhBEJmK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Feb 2021 04:42:10 -0500
Received: by mail-oi1-f174.google.com with SMTP id h6so6846244oie.5;
        Fri, 05 Feb 2021 01:41:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X86OL3/hbCQrJ8xgX2v+ArjApLh9Q7Yw/+9Tlt92YD4=;
        b=aCagv7asn7nm+a121fo0W8uLqby0HKbV1clqy5cQ1flska21aSLQSmfsNcoGHdhCqy
         MwBydOl6yZADW77Fr3dPMF/hodJdHsPvkuW17Z0Lr+2VCuVeNzU1liBmk+eaXwado/MF
         IL8Iz9aWpSWAZ/cs/uo1JtzUaRRwcueV3iGAS2j37zdQWpH7IEw6p8kHWSWCkQVo6gpE
         QG36pY8j9LKCCoc9BvpaHHZ0kWugK+c9P5lYVoMp+yeyLegdADm/hHdSlVNFLnHzEEar
         E40ur1Sy5NL5adFfHD6ZkbA2sNtQrWvbp1Xj+a4/toOzN/J82pXpWKNy9et8K39RozEE
         kIog==
X-Gm-Message-State: AOAM532ke5hhC7viG0tufQCvgGN+KjCa+qaNCq0iS/bbV6sqJuonVtHH
        YYib1YYMZTCTZxxi4RL5svg4Ewp0Ii5cMqs5Euk=
X-Google-Smtp-Source: ABdhPJxSnoP8RioWsMCPBleqdC2yOoTIRmik+PHy9f6Y0fPuC7LwyXFU1vIvp1sFgMyAkM8McEHeeX3V7aq29nOG25I=
X-Received: by 2002:aca:d8c6:: with SMTP id p189mr350862oig.54.1612518089115;
 Fri, 05 Feb 2021 01:41:29 -0800 (PST)
MIME-Version: 1.0
References: <cover.1611904394.git.viresh.kumar@linaro.org> <434ba2467dd0cd011565625aeb3450650afe0aae.1611904394.git.viresh.kumar@linaro.org>
 <CAMuHMdVp0vGMqoEoP9A7Y7-ph-DYUWdddtChdq_eZcROYTBMHg@mail.gmail.com> <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
In-Reply-To: <20210205092507.fdxotdjlq5rjs2yh@vireshk-i7>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 5 Feb 2021 10:41:17 +0100
Message-ID: <CAMuHMdWUMcMcJxnC+oML8P0+r72_+d6RWGY50dOWCUECdJGWPA@mail.gmail.com>
Subject: Re: [PATCH V7 4/6] kbuild: Add support to build overlays (%.dtbo)
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        anmar.oueja@linaro.org, Bill Mills <bill.mills@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Viresh,

On Fri, Feb 5, 2021 at 10:25 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> On 05-02-21, 10:02, Geert Uytterhoeven wrote:
> > Thanks for your patch
> > (which I only noticed because it appeared in dt-rh/for-next ;-)
> >
> > On Fri, Jan 29, 2021 at 8:31 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > Add support for building DT overlays (%.dtbo). The overlay's source file
> > > will have the usual extension, i.e. .dts, though the blob will have
> >
> > Why use .dts and not .dtso for overlays?
> > Because you originally (until v5) had a single rule for building .dtb
> > and .dtbo files?
>
> I am fine with doing that as well if Rob and David agree to it. Rob
> did suggest that at one point but we didn't do much about it later on
> for some reason.
>
> FWIW, this will also require a change in the DTC compiler.

Care to explain why? I've been using .dtsi for ages in
https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
