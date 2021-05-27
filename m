Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A672339286C
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 May 2021 09:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233918AbhE0HWx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 May 2021 03:22:53 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:43706 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbhE0HWw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 May 2021 03:22:52 -0400
Received: by mail-ua1-f51.google.com with SMTP id f1so2263302uaj.10;
        Thu, 27 May 2021 00:21:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ctS9u0jsZQr4KW7/dJULIa6O2FuRfeRXjZqJYliGf+Q=;
        b=flVHFRVz+YfFXlsEGfkNm98RcqudZgegLwumivLNF/JHMGHRBfpr7QLufM62gDrAti
         IJmP6nSBtSXPVugtpie/xRgcNY4S2bqQCteJ9O6hlCZ7TFiLUMJE1l+FB5KGO0GKBA/V
         4pxxvGWuR3XoWvrchPmy31uFsM9ftnuKrNKoQTopvuqYDazGiaAg4/XjVbX814TuOTnq
         AGFwsR3des13/6Xf3MDjdWlnivhj/9HbmH256Qni0/YzWXnw9mUTB2yxZYkESDJfHfPq
         9oLg8mKO0YDfyIa/3D9bosOn7ILTGNVU+V8TeJlxQBLwbVPA1nkBtVROpGEIofBuL/oM
         Tejw==
X-Gm-Message-State: AOAM5323GJhrlJt0QmsvWQZjwW3nSvDnGMRTp/pKCU3qNuc8vFRuFvXR
        AZR7yxWGkhSY2FV9DIqJL9LDZBC348ISwYKHKaw=
X-Google-Smtp-Source: ABdhPJzoaOgrz/kP8u4wbn3KqKgXdiO1OmHoXxwf6Yw/aVAKPlN/CAoWmh6enr1z2yxWUn/SLyCiYVDvgAyUYDP5q7Y=
X-Received: by 2002:ab0:3d1:: with SMTP id 75mr195694uau.106.1622100077438;
 Thu, 27 May 2021 00:21:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org> <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
 <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
 <d1aefaae-7b12-b5fb-4b97-7230bd52c1be@gmail.com> <20210526061144.yvoaurpz75a3bsjr@vireshk-i7>
 <f651e95b-feef-5c86-edba-d6008bc80b34@gmail.com> <YK70Xsl1oXeEQpWZ@yekko>
In-Reply-To: <YK70Xsl1oXeEQpWZ@yekko>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 27 May 2021 09:21:05 +0200
Message-ID: <CAMuHMdWdb2s08a=axC+m88gARSA3enOBnczsN59XL2F9yHXXYA@mail.gmail.com>
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     David Gibson <david@gibson.dropbear.id.au>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 27, 2021 at 3:48 AM David Gibson
<david@gibson.dropbear.id.au> wrote:
> On Wed, May 26, 2021 at 04:21:48PM -0500, Frank Rowand wrote:
> > On 5/26/21 1:11 AM, Viresh Kumar wrote:
> > > On 22-04-21, 13:54, Frank Rowand wrote:
> > >> On 4/22/21 3:44 AM, Geert Uytterhoeven wrote:
> > >>> On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
> > >>>> On 3/27/21 12:40 PM, Rob Herring wrote:
> > >>>>> On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
> > >>>>>> From: Frank Rowand <frank.rowand@sony.com>
> > >>>>>>
> > >>>>>> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
> > >>>>>> source file.
> > >>>>>>
> > >>>>>> Rename unittest .dts overlay source files to use .dtso suffix.
> > >>>>>
> > >>>>> I'm pretty lukewarm on .dtso...
> > >>>>
> > >>>> I was originally also, but I'm warming up to it.
> > >>>
> > >>> What's the status of this?
> > >>
> > >> I was planning to resend on top of the upcoming -rc1.
> > >
> > > Ping.
> > >
> >
> > Thanks for the prod...
> >
> > The .dtso convention was added to the dtc compiler, then a patch was
> > accepted to revert one mention of .dtso ,though there still remains
> > two location where .dtbo is still recognized (guess_type_by_name() in
> > dtc and the help text of the fdtoverlay program).
> >
> > It seems that the general .dtso and .dtbo were not popular, so I'm
> > going to drop this patch instead of continuing to try to get it
> > accepted.
>
> AFAICT .dtbo is moderately well established, and I think it's a good
> convention, since it matters whether a blob is an overlay or base
> tree, and it's not trivial to tell which is which.

Indeed.

> .dtso is much more recent,

Is it? The oldest reference I could find is from May 2015:
"[PATCH/RFC] kbuild: Create a rule for building device tree overlay objects"
https://lore.kernel.org/linux-devicetree/1431431816-24612-1-git-send-email-geert+renesas@glider.be/
I have always used dtbo/dtso in my published overlays branches,
referred from https://elinux.org/R-Car/DT-Overlays, and used by
various people.

> and I think there's much less value to it.

IMHO the same reasoning as for dtb vs. dtbo applies to dts vs. dtso.
It matters if the resulting blob will be an overlay or base tree,
as the blob will have to be called .dtb or .dtbo.
As dtc outputs to stdout by default, the caller has to provide the
output filename, and thus needs to know.
Even if dtc would name the output file based on the presence of
"/plugin/" in the input file, the build system still needs to know
for dependency tracking.
We also do have .dts vs. .dtsi.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
