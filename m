Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0D230469B
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 19:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391380AbhAZRWV convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Tue, 26 Jan 2021 12:22:21 -0500
Received: from mail-oi1-f169.google.com ([209.85.167.169]:36004 "EHLO
        mail-oi1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390459AbhAZIoc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 03:44:32 -0500
Received: by mail-oi1-f169.google.com with SMTP id d18so8399842oic.3;
        Tue, 26 Jan 2021 00:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EXJh9ZT/mvfwax+nixCrjPTJXYuqqPBVeOG7xO3uNAk=;
        b=P5kjfsXF4eVwNN/x2V9svoy/RVQENJ7Gb7+MvcdHorkEVvtocxifZ3RyLCZZWWLClA
         Fc+lBo2S/p6uwWJ39uoc28hvtfI5Q3DgMvnBPhLm/Qsrgjzo5bxUdqK0s3nINY9ld23r
         9jLSvNSCx8DZ0EG4WVwoBKy1Of9zkI+6BLdi+gO8jPHY9RLoVSbIlPer0ZfjdbST19YG
         h2pMjQ0/Poo/eTOX10lRXMw4u0xrQ+o03kxYMANAPriVkWjFibYQpVQA5w2DLrElmZM+
         EN/BSiBPAJznKsMMNOR8TcabzJS8QsDczShuIxaxShSYDMhlErGGy1iBsu4h/lNP4tWC
         eUvg==
X-Gm-Message-State: AOAM532VItrCX/llp7lHdWE5g2aMejmGDfX55u7KOAySHF4orc7/wAJD
        kulsk+PvetQK7auZ0NxKthVDhVV/3xSJMREMr+I=
X-Google-Smtp-Source: ABdhPJz69UTE8gkwG80/J5ZbUiyydKm7p5q+Aw+6h4wCZBltJqGhh7YnurqET0vyfKoWa/Kgs60FxF84yB88WrQBhmk=
X-Received: by 2002:aca:1219:: with SMTP id 25mr2591995ois.54.1611650632111;
 Tue, 26 Jan 2021 00:43:52 -0800 (PST)
MIME-Version: 1.0
References: <20210125105757.661240-1-uwe@kleine-koenig.org>
 <CAK7LNAS5t1wew0MMFjdB5HGCAMerhU7pAGiFhcTtCRUAAjGLpw@mail.gmail.com> <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
In-Reply-To: <9d9bb0f6-d4f4-b1b9-a4c4-786987578085@kleine-koenig.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Jan 2021 09:43:41 +0100
Message-ID: <CAMuHMdUmtMxucQ9DWvROVPVv2uGEzpRmtv1=jrjm09xU=gHHyw@mail.gmail.com>
Subject: Re: [PATCH] cmd_dtc: Enable generation of device tree symbols
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        cyril@debamax.com, Arnd Bergmann <arnd@arndb.de>,
        Maxime Ripard <mripard@kernel.org>,
        DTML <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Uwe,

On Tue, Jan 26, 2021 at 8:21 AM Uwe Kleine-König <uwe@kleine-koenig.org> wrote:
> And then I learned with hints from Rob and Geert that symbols are not
> really necessary for overlays, you just cannot use named labels. But
> using
>
>         target-path = "/soc/i2c@23473245";
>
> or
>
>         target = <&{/soc/i2c@23473245}>;
>
> instead of
>
>         target = <&i2c1>;
>
> works fine. (And if you need to add a phandle the &{/path/to/node}
> construct should work, too (but I didn't test).) Using labels is a tad
> nicer, but the problem I wanted to address with my patch now has a known
> different solution.

Please don't use "target" and "target-path".  Since the introduction of
sugar syntax support in v4.15[1], you can just use "&label", like in a normal
DTS file.  Paths do need the special "&{/path/to/node}" syntax instead
of "/path/to/node", though.

As usual, you can find lots of examples of DT overlays in my repo[2].

[1] commit 4201d057ea91c3d6 ("scripts/dtc: Update to upstream version
v1.4.5-3-gb1a60033c110")
[2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
