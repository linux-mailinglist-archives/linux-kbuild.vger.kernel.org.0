Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24A29EE79E
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 19:47:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729436AbfKDSro (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 13:47:44 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:43096 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbfKDSro (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 13:47:44 -0500
Received: by mail-ot1-f66.google.com with SMTP id l14so990949oti.10
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Nov 2019 10:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAScZrMfcRjQQzWjos/ItVtsj2/Z80jqafi9Q8Gdat4=;
        b=jMQA21nktp7RKopIBS9wqFi6i1U/MgPY5om64JS4h+GGqMA1oI7IlIGbqbfdfrqdIA
         saCXi155JGBspLMG3er88AVUNsSmcsmIrx3Rav1KuF7BAVQDk1/UtICpwtaJeNyn9lpN
         zv7tUe2iDUpaiQ/lqfsdmsnlFBr2CFbMzBl+xVYpZUv4idw/1LM1jFM8OFJEqOKzAJHY
         LQ0Td6Y4IYI6qCqDnpk/+1znuoijhf3k3Umd2uq7wjPCm6RcGCgZXjVOYnmE7u/3h7WO
         bI1st2WpH0q9W/DyZwwx/RNqbWoMWwui8IsU8NhzYfZxOmVl9QynvfalKGl80BKpI4Vj
         x6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAScZrMfcRjQQzWjos/ItVtsj2/Z80jqafi9Q8Gdat4=;
        b=sIJkYwWZ+Xzx5tjxqYivo617PN45jsWj1GHz8zmKlAevrl06FkU5gLu1q80koUK4k8
         dgNUXTe8js03SVkYMWXu+ESl6vNMlFsxoF/LiWXU4o0TMpsxO9XQUgRYq6/O+Mq8IIOk
         spOwclzRE3rBIJYk+e1BXCAEtojuTYNQfDyPP/U0QDx7ccp/1n4pyhxtP1dXtX5SGASK
         5z9ol1E4o6Fg5H9h9Pu3vbrlxby8VFFMDe0zDaOG2NMln0/yypaB58ROpm++7ptTD9Rx
         nsv83MV5JLY7alc1nUrBnyMnhOYcd64bKV+5qzfyO4VFw6PlSWEqLTCP7fZvTtZ9fQsd
         4g3A==
X-Gm-Message-State: APjAAAXUg284r1ARBMIezguP7P9aSOSbivL0GjDkpK1XjNdlavhhgv3n
        9F7Mn+FJi0vY93XqPSND8cNm2S4/fTIz/tjitCsP9w==
X-Google-Smtp-Source: APXvYqxMRWfUR8/8l4v/V1zDDPZJXYUW0sZlQfmt7b99qT10zFVdxsT5JqBY5W/7oDGnO9lc4SylLnvGzYiFdEHrW8M=
X-Received: by 2002:a05:6830:1e5a:: with SMTP id e26mr3118340otj.71.1572893263132;
 Mon, 04 Nov 2019 10:47:43 -0800 (PST)
MIME-Version: 1.0
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
 <20191003102915.28301-4-yamada.masahiro@socionext.com> <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
 <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
 <x494kznctuc.fsf@segfault.boston.devel.redhat.com> <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
 <CAPcyv4gFO=4EmObucuYyPNCS91y1H7d-M=0LebBK72YuD=ekNQ@mail.gmail.com>
In-Reply-To: <CAPcyv4gFO=4EmObucuYyPNCS91y1H7d-M=0LebBK72YuD=ekNQ@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 4 Nov 2019 10:47:30 -0800
Message-ID: <CAPcyv4iWifdYsrrcs0TQ0Fd0Eoa5uXwe3CP-VzGCWAL6yKT3WA@mail.gmail.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jeff Moyer <jmoyer@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-nvdimm <linux-nvdimm@lists.01.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Nov 3, 2019 at 10:43 PM Dan Williams <dan.j.williams@intel.com> wrote:
>
> On Sun, Nov 3, 2019 at 7:12 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > On Sat, Nov 2, 2019 at 3:52 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> > >
> > > Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > >
> > > > On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> > > >>
> > > >> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > > >>
> > > >> > Now that there is no overwrap between symbols from ELF files and
> > > >> > ones from Module.symvers.
> > > >> >
> > > >> > So, the 'exported twice' warning should be reported irrespective
> > > >> > of where the symbol in question came from. Only the exceptional case
> > > >> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> > > >> > typically occurs for EXPORT_SYMBOL in .S files.
> > > >>
> > > >> Hi, Masahiro,
> > > >>
> > > >> After apply this patch, I get the following modpost warnings when doing:
> > > >>
> > > >> $ make M=tools/tesing/nvdimm
> > > >> ...
> > > >>   Building modules, stage 2.
> > > >>   MODPOST 12 modules
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
> > > >> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
> > > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
> > > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
> > > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
> > > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > > >> ...
> > > >>
> > > >> There are a lot of these warnings.  :)
> > > >
> > > > These warnings are correct since
> > > > drivers/nvdimm/Makefile and
> > > > tools/testing/nvdimm/Kbuild
> > > > compile the same files.
> > >
> > > Yeah, but that's by design.  Is there a way to silence these warnings?
> > >
> > > -Jeff
> > >
> >
> > "rm -f Module.symvers; make M=tools/testing/nvdimm" ?
> >
> > I'd like the _design_ fixed though.
>
> This design is deliberate. The goal is to re-build the typical nvdimm
> modules, but link them against mocked version of core kernel symbols.
> This enables the nvdimm unit tests which have been there for years and
> pre-date Kunit. That said, deleting Module.symvers seems a simple
> enough workaround.

This workaround triggers:

  WARNING: Symbol version dump ./Module.symvers
           is missing; modules will have no dependencies and modversions.

Which is a regression from the previous working state.
