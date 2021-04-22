Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D35367CC1
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Apr 2021 10:44:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235463AbhDVIpX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Apr 2021 04:45:23 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:39500 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235075AbhDVIpX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Apr 2021 04:45:23 -0400
Received: by mail-vs1-f45.google.com with SMTP id u22so11531682vsu.6;
        Thu, 22 Apr 2021 01:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T0fU5qslefbtid2ADh8Sf4KN4eXAD2ag5kzSkHvSWVs=;
        b=XZ1r11NOvoJj8SphJkOS16XjykcZS5cSMggFU5OItapEyUZQvDNsN/ZKAKlZOJNuG0
         IuoY5C5sBay2neWiOzV40aeUOyGuYE5242+Wdm++h7KUbgdbHc+HtaZttdLAhIEv9eyR
         /4MaOirF+L72PzRSQ6JvHZdCts2P8ABVBGr1ofFrJLp9tKeCoA1ZkUUBr95ZDqkB+lVP
         SZWFDmIgyynGziKPzPmIkwGtNJTnR/LIp3w3VWDEtgIugsVA2lyj5sJIwPNG+WmTTLDe
         +6v2W/o6Fv8z3HCv0aQlRovGXlmZpAnacDdojTgCHKA4A49ox2jOXuAgcfr/yIQEFKQm
         6PCQ==
X-Gm-Message-State: AOAM532zUUc+rHIu5dmN5Y8uZOJebGnXMCZc+ETl5gKCS/3QP2C7cbuQ
        n11rSSnubVcxkg5RDmHcKLIn7BDBBPSYDfgMo1I=
X-Google-Smtp-Source: ABdhPJyJ9IDw6C8EF+yN8bZlEKCyggiRyM4LIMEj26kwBUuNghgY/w9zZKt2qR2VGPo69/FnaG3z4yNdcuqEoJzxPeI=
X-Received: by 2002:a05:6102:814:: with SMTP id g20mr1445671vsb.42.1619081086781;
 Thu, 22 Apr 2021 01:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210324223713.1334666-1-frowand.list@gmail.com>
 <20210327174035.GA291160@robh.at.kernel.org> <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
In-Reply-To: <3e6710e7-08ac-7d1b-aa69-bcd36f0d932a@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Apr 2021 10:44:35 +0200
Message-ID: <CAMuHMdXpGKMi-xv6hZQmmEw0JO=Q0WuvUzwJ2v0O28Tx5uW+sg@mail.gmail.com>
Subject: Re: [PATCH 1/1] of: unittest: rename overlay source files from .dts
 to .dtso
To:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh@kernel.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
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

Hi Frank, Rob,

On Mon, Mar 29, 2021 at 9:23 PM Frank Rowand <frowand.list@gmail.com> wrote:
> On 3/27/21 12:40 PM, Rob Herring wrote:
> > On Wed, Mar 24, 2021 at 05:37:13PM -0500, frowand.list@gmail.com wrote:
> >> From: Frank Rowand <frank.rowand@sony.com>
> >>
> >> Add Makefile rule to build .dtbo.o assembly file from overlay .dtso
> >> source file.
> >>
> >> Rename unittest .dts overlay source files to use .dtso suffix.
> >
> > I'm pretty lukewarm on .dtso...
>
> I was originally also, but I'm warming up to it.

What's the status of this?
v5.12 (introducing the concept of dtbo) is around the corner, and it
would be best to decide on dts or dtso before its release.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
