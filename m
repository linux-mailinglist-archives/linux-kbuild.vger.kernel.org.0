Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAF72303F35
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 14:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404939AbhAZNnp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 08:43:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:46498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404748AbhAZNnm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 08:43:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7816A2223D;
        Tue, 26 Jan 2021 13:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611668581;
        bh=gZmSYgI/wa2/JnuwHcpAdHOfBP02jfH9AVoTNyQbgPc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nWwXoa8f5j/f3gLzJfb7C9m7/sFDrLHniZrrgAr3k2Zu3c66CVjRNMxSWU5xSb82l
         xkhszdemIvKTLDQEn/CA3Prn09unXNPsfylBVtz0NWF3xhFUXP6/xNwbeEb4x2nHAm
         iEauYN0wy4xpv3vvbtmFWBixLfgryqrihSe9YIGeNFLbszkFD3WISoI/eGC8gN77VG
         WP4VXgt+jg3IslYG6sSXafeRZvIxj6IdlyD/5lzQ6XslXEZR/dLn9wP5PzVInhrUds
         8U6PrAPO0jaaVWObpmUklbMTVpVSiUKZG5E1AhSmm3pWa2M4cGUKOq5gdYy0zEysqE
         mKV/13nCeXk+Q==
Received: by mail-ed1-f50.google.com with SMTP id s11so19790292edd.5;
        Tue, 26 Jan 2021 05:43:01 -0800 (PST)
X-Gm-Message-State: AOAM531ztYVgbFC7mYXKPFi4ClaRRBRgZz4lns3RNcteLNyVkKNB0CQe
        vZgzmJK1dZgaGHU5l0iYB/vtSIv6T7hpTadaJA==
X-Google-Smtp-Source: ABdhPJyedjeaKb7Y7yFDeXhCNsA7wEgX8BmR5Dj0sgd1WrT81hG16uP3pAjOTds7G2dy9MdFeUk38Ykxu3sHpbfk3lQ=
X-Received: by 2002:a50:fc04:: with SMTP id i4mr4670026edr.137.1611668580145;
 Tue, 26 Jan 2021 05:43:00 -0800 (PST)
MIME-Version: 1.0
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com> <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
In-Reply-To: <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 26 Jan 2021 07:42:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJQjnNULke5uyNbrj5kkS=3MSxug2BFXAia1ucyaDhx5Q@mail.gmail.com>
Message-ID: <CAL_JsqJQjnNULke5uyNbrj5kkS=3MSxug2BFXAia1ucyaDhx5Q@mail.gmail.com>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        cyril@debamax.com, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 1:27 AM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> Hello Masahiro,
>
> On 1/25/21 10:53 PM, Masahiro Yamada wrote:
> > On Mon, Jan 25, 2021 at 8:07 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koeni=
g.org> wrote:
> >>
> >> Adding the -@ switch to dtc results in the binary devicetrees containi=
ng
> >> a list of symbolic references and their paths. This is necessary to
> >> apply device tree overlays e.g. on Raspberry Pi as described on
> >> https://www.raspberrypi.org/documentation/configuration/device-tree.md=
.
> >>
> >> Obviously the downside of this change is an increas of the size of the
> >> generated dtbs, for an arm out-of-tree build (multi_v7_defconfig):
> >>
> >>          $ du -s arch/arm/boot/dts*
> >>          101380  arch/arm/boot/dts-pre
> >>          114308  arch/arm/boot/dts-post
> >>
> >> so this is in average an increase of 12.8% in size.
> >>
> >> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>
> >
> >
> > (CCing DT ML.)
>
> makes sense, thanks.
>
> > https://www.spinics.net/lists/linux-kbuild/msg27904.html
> >
> > See Rob's comment:
> >
> > "We've already rejected doing that. Turning on '-@' can grow the dtb
> > size by a significant amount which could be problematic for some
> > boards."
>
> The patch was created after some conversation on irc which continued
> after I sent the patch. I added the participating parties to Cc:.
>
> The (relevant) followups were:
>
> Geert suggested to always generate the symbols and provide a way to
> strip the symbols for installation if and when they are not needed.
>
> Rob said: "I'm less concerned with the size increases, but rather that
> labels go from purely source syntax to an ABI. I'd rather see some
> decision as to which labels are enabled or not."

I've also said move the arm32 dts files to family subdirectories and
enable '-@' per directory. I've posted a script to do the whole thing,
but I think the preference is one-by-one. This is needed anyways if
we're going to start adding overlays which Viresh is working on.

Rob
