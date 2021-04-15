Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8073602EB
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbhDOHGH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:06:07 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:31236 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhDOHGG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:06:06 -0400
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13F75MUT007464;
        Thu, 15 Apr 2021 16:05:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13F75MUT007464
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618470323;
        bh=xgvwbjObDxVYEnbqckmHfXupWuFRZDZ4a2MAfr30jYk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qz7QXJPkgE27tukb7oqV966xFpPpVD5gY7+BXfwXlL86MzJWxwncRNggNeYmzO27q
         Dl3NIsWon9PCUbEWDHvO5zoijT541iE7kUHpvOVhUVHE3M8RitmGBtjAbsDnWko4vS
         BPXxwNZ7JhLrmA6tGvkxYrgAVQgP84ZnVpcneR11UMlWIfW6W4wqFFCxEujDHHhA23
         aIBsTIl0M9AS8BQAiZ3OrC1mk13v5xGWInuZOt0S2mDZJHN/GGankkIBJ15MU4V8op
         LPWSTUeMoEkT5XGGAVtD6yN3DhXc8Ree9+0v3V8era/kQMd7/aVvw1hUcCYeW2JcGo
         CMzNUVIS83dpw==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id w8so9198442plg.9;
        Thu, 15 Apr 2021 00:05:22 -0700 (PDT)
X-Gm-Message-State: AOAM532657kUdA4oN7EspyIs8w3QrS2JC0TlA3736j/47g0EEmMKOX/v
        Di3d5RJLCPbPoUYunRPjrEnkFd5OzUhRt/pVc6A=
X-Google-Smtp-Source: ABdhPJwe3AQPMSLCBMcKYrsnaTgC67jKGZTlBsKzbOKW2Sb5z8Idsd4p+wOvWoaC/MfmhOhY5Uj4cPR3+H+5g0b4s7U=
X-Received: by 2002:a17:90b:1955:: with SMTP id nk21mr2343931pjb.198.1618470322208;
 Thu, 15 Apr 2021 00:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210414192657.17764-1-rdunlap@infradead.org> <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
 <c3d41808-111c-c4dd-43fb-459ae56fc9ab@infradead.org>
In-Reply-To: <c3d41808-111c-c4dd-43fb-459ae56fc9ab@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Apr 2021 16:04:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2C1drA+v9q-mYHAbO3+4zjEdF_SJkBDtCXRExLX9u6w@mail.gmail.com>
Message-ID: <CAK7LNAS2C1drA+v9q-mYHAbO3+4zjEdF_SJkBDtCXRExLX9u6w@mail.gmail.com>
Subject: Re: [PATCH] uml: fix W=1 missing-include-dirs warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 4:02 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 4/14/21 11:52 PM, Masahiro Yamada wrote:
> > On Thu, Apr 15, 2021 at 4:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> Currently when using "W=1" with UML builds, there are over 700 warnings
> >> like so:
> >>
> >>   CC      arch/um/drivers/stderr_console.o
> >> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
> >>
> >> but arch/um/ does not have include/uapi/ at all, so don't
> >> include arch/um/include/uapi/ in USERINCLUDE for UML.
>
>
> >> Option 4: simply mkdir arch/um/include/uapi
> >>         That's what I did first, just as a test, and it works.
> >
> >
> > I like Option 4.
> >
> > But, you cannot do "mkdir -p arch/um/include/uapi" at build-time
> > because the build system should not touch the source tree(, which
> > might be read-only)
> > for O= building.
> >
> > How about adding
> >
> >   arch/um/include/uapi/asm/Kbuild,
> >
> > which is just having a SPDX one-liner?
>
> Wow!  :)
> That's what Al Viro suggested also.
> I'll submit that patch later today (Thursday my time).
>
> thanks.
> --
> ~Randy
>


BTW, after fixing this UML problem,
can we move -Wmissing-include-dirs to the top Makefile?

Is there any other source of -Wmissing-include-dirs
warnings?





-- 
Best Regards
Masahiro Yamada
