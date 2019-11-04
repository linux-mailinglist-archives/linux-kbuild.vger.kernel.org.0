Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2EBD9ED7FD
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 04:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbfKDDLy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Nov 2019 22:11:54 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:65049 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728781AbfKDDLy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 22:11:54 -0500
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id xA43BhWn032610;
        Mon, 4 Nov 2019 12:11:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com xA43BhWn032610
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1572837104;
        bh=vMxuYwRHws4tNFRGpfPUy5dZwjFqOGxlu03uplhO42I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0IRR4RPwZy4jcyYgVusaI75xZRM4AJnRPCkB2lfNEfnvBFx0h8CrgePHX1j8rBGEF
         Fa8BkImtgeKPFA6Ij87E8I/00N4wBt7zgbmK6VSshNPrf5qn8jNjmm3rJD6GdB/Q/H
         DrSHQscW8AEJ4g4sSNCyHUNYC6XGn3NQ7hcgX3Q3oVj+6RsqF6egBaFfwWoodocZCD
         KoFXwzmjI+dvpTWPzxgwrvOlanfU8DqrNdwcblpnADUBoBp8p6aybg+7MHIzX3uhoM
         1lQbbwC3yF0ojU36UDnRI4R0oL7vw7/0eVio3u9MdJuhiBlqVxsXBU57JxRAVdOIz5
         ZHcrS7LDvbZQw==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id s25so136094uap.1;
        Sun, 03 Nov 2019 19:11:43 -0800 (PST)
X-Gm-Message-State: APjAAAUOKds9oet/Zg81aBPsAhE0SvgGK22fxLv6sSEJnVN8dKvqPysm
        ZnmMPIYgZtAcw0579Sm+6ccLDySqBMF+el3vV3M=
X-Google-Smtp-Source: APXvYqyE0nGV98neToXAe5hLXzbDObfhFlg/QKkxKcBsziWl3jP01hIXqHPwXSYx8xzJ5vABi98f/kqIE5zvSf0Ea7U=
X-Received: by 2002:ab0:3395:: with SMTP id y21mr3558264uap.25.1572837102044;
 Sun, 03 Nov 2019 19:11:42 -0800 (PST)
MIME-Version: 1.0
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
 <20191003102915.28301-4-yamada.masahiro@socionext.com> <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
 <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com> <x494kznctuc.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x494kznctuc.fsf@segfault.boston.devel.redhat.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 4 Nov 2019 12:11:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
Message-ID: <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
To:     Jeff Moyer <jmoyer@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 2, 2019 at 3:52 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
> > On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> >>
> >> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> >>
> >> > Now that there is no overwrap between symbols from ELF files and
> >> > ones from Module.symvers.
> >> >
> >> > So, the 'exported twice' warning should be reported irrespective
> >> > of where the symbol in question came from. Only the exceptional case
> >> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> >> > typically occurs for EXPORT_SYMBOL in .S files.
> >>
> >> Hi, Masahiro,
> >>
> >> After apply this patch, I get the following modpost warnings when doing:
> >>
> >> $ make M=tools/tesing/nvdimm
> >> ...
> >>   Building modules, stage 2.
> >>   MODPOST 12 modules
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
> >> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
> >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
> >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
> >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
> >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> >> ...
> >>
> >> There are a lot of these warnings.  :)
> >
> > These warnings are correct since
> > drivers/nvdimm/Makefile and
> > tools/testing/nvdimm/Kbuild
> > compile the same files.
>
> Yeah, but that's by design.  Is there a way to silence these warnings?
>
> -Jeff
>

"rm -f Module.symvers; make M=tools/testing/nvdimm" ?

I'd like the _design_ fixed though.


-- 
Best Regards
Masahiro Yamada
