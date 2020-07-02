Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE53F211A3E
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Jul 2020 04:42:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726285AbgGBCmx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 22:42:53 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:35206 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGBCmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 22:42:52 -0400
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0622gTPN016475;
        Thu, 2 Jul 2020 11:42:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0622gTPN016475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593657750;
        bh=mDVif8MiOGCjLLlZ8k21oCwqqxD9Plyy3x2UlM47NDM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mPwKLGhQ2fosA/zx9ft3qDN9ZYBXwYdIhqOK74QH+1I4Aqo5ioqzgVxKApQ5CQIv4
         sUyyPu4qK0o7EywlHvEkcPYoLawgLgoO6WE6Q9s72mYXSNH3USJULCWuyF/guZi7P2
         AgezzD9N3jkpeNo8c2upA0py5HI29+OFFPI7qplbuWHrbNzloUNRx+dEWcFpma+gOh
         +da6p4qnN04oyJqusFpJHWHam5gGadlsp2OtRmWAcmpy7DClvENC/8Hzoou5YswA8Z
         twLps9kM2P6CZYyg5bC1b9v05X0hdj6pXtz7CV6tZK6VbClTfGtMn/hBrBWS3iXg31
         011qrQ9SHW8qg==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id 64so8194802vsl.3;
        Wed, 01 Jul 2020 19:42:30 -0700 (PDT)
X-Gm-Message-State: AOAM532JhHXD5yuSAAM7Pq99bgb0SGiJYTYvtzG2hoFDUxr8OvGBS6WO
        twgztORL24rIusJhUafPSV1VknHxQ2jFsvGmrh4=
X-Google-Smtp-Source: ABdhPJwgdLfTp8ApgAzTWHhd+PoMDRZpPwRvMlt9tqC0CraL525IFfWskW5GLpHlUALcpvZ1CCpFRjSMX+TG2K5nJIM=
X-Received: by 2002:a67:694d:: with SMTP id e74mr22283923vsc.155.1593657749034;
 Wed, 01 Jul 2020 19:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org> <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
In-Reply-To: <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 2 Jul 2020 11:41:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6SdeWvXj7nNtzMBN2E-s4PmGg6gj7OZHug2_TBKTg1w@mail.gmail.com>
Message-ID: <CAK7LNAQ6SdeWvXj7nNtzMBN2E-s4PmGg6gj7OZHug2_TBKTg1w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not export LDFLAGS_vmlinux
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Chris Zankel <chris@zankel.net>,
        "open list:TENSILICA XTENSA PORT (xtensa)" 
        <linux-xtensa@linux-xtensa.org>, Guan Xuetao <gxt@pku.edu.cn>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 2, 2020 at 5:14 AM Max Filippov <jcmvbkbc@gmail.com> wrote:
>
> On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> [...]
>
> > diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> > index 12ae1e91cb75..c6538d3321b9 100644
> > --- a/arch/xtensa/boot/boot-elf/Makefile
> > +++ b/arch/xtensa/boot/boot-elf/Makefile
> > @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
> >                 $(OBJS) $@
> >
> >  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> > -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> > +       $(LD) $(KBUILD_LDFLAGS) \
>
> Can that $(Q) be retained, please?
> The rest LGTM.


Oops, I temporarily deleted $(Q) for debugging,
then accidentally committed it.

I will restore $(Q) when this patch is applied.

Thanks.





> >                 -T $(obj)/boot.lds \
> >                 --build-id=none \
> >                 -o $@ $(obj)/Image.o
>
> --
> Thanks.
> -- Max



-- 
Best Regards
Masahiro Yamada
