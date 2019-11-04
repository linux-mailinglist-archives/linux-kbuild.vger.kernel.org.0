Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D43E0ED920
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Nov 2019 07:43:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfKDGnn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 01:43:43 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37776 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfKDGnn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 01:43:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id y194so13179349oie.4
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Nov 2019 22:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RVi5iAn9z9FIX4+R36z5iyM84YAlie4p4vOr8JLkA9Q=;
        b=HAFK9ZBNpKvG2W2+y1NYoDvTHPz0Ih82Jqp011X6KSmbJ1OgFdZTIc4d0/6vIbvxKL
         gs/6jFk8EYz5eDiKziCqdb7/8/dAzil45O7dvO+dDXp1z5/y2wIH43iLURPE4+F9d1Ka
         mztxNJCXNFIRQQLB4EtiifXijLtOJUcrUf3I7WhhP2AW4eD5w9B3bk0JQ3llROT4jdoA
         K3QGqKi6NCewRfVYH9qcFMvofHFLFTzqhx4DdXaDWK7X6EFm6mycQxkpgjQor9zzncoS
         Sb1Brgwghyca3G1DkJhJE3T9uHRx0/LMuWdW1Al8/QtDZSxZrlahzzw4tkVhcjvNCEfH
         ObHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RVi5iAn9z9FIX4+R36z5iyM84YAlie4p4vOr8JLkA9Q=;
        b=k91FTs5rttOXNWNWohoMbDnkR/N416cFdSDBMr8A68aK7IT1lgpbw+jCeROGdmYgPD
         xVwME9pDp6wIKrCXMDybBT/x/xXnWw/yQNE/zbw3Mss5lN0xOWmKVhpS+aAVLwY/aKRO
         HvdAe8qYZXCwfX0ywIB5yo89A9Muzbldfv4lxL7JUNbvLtINMVlizOXSYG+Rj/3g+oj8
         IRKc00wQ/vPAnpa4J0zrURECz4VUFZc+bKV1b2/QVmXK0uRsIZV5APm2yomGIIljcPTy
         EDlL4fL2noza0YPBufZ86SvvXix4OM6GT2eP1aB7RmxQkbc/tpcO6nW8LoJyObuyOuGQ
         UsSQ==
X-Gm-Message-State: APjAAAWhHTgWbTot65VwP6RyBUwvzOcQUw5hstG88AFsIc7AB0aS7PDR
        vw28lv6oOBf2R591bvoe2pX9+QxzJ7rI+eb6DxvOTA==
X-Google-Smtp-Source: APXvYqzYYiSRCLzgJDin99LR5fIfz6VmH9pke67vQaykCEY2cIpBFhjcU9jQxFNcNlHYIOGijfZuC9W/totY10rVFTU=
X-Received: by 2002:aca:ead7:: with SMTP id i206mr2880755oih.0.1572849822071;
 Sun, 03 Nov 2019 22:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
 <20191003102915.28301-4-yamada.masahiro@socionext.com> <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
 <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
 <x494kznctuc.fsf@segfault.boston.devel.redhat.com> <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
In-Reply-To: <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Sun, 3 Nov 2019 22:43:31 -0800
Message-ID: <CAPcyv4gFO=4EmObucuYyPNCS91y1H7d-M=0LebBK72YuD=ekNQ@mail.gmail.com>
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

On Sun, Nov 3, 2019 at 7:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Nov 2, 2019 at 3:52 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> >
> > Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> >
> > > On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> > >>
> > >> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > >>
> > >> > Now that there is no overwrap between symbols from ELF files and
> > >> > ones from Module.symvers.
> > >> >
> > >> > So, the 'exported twice' warning should be reported irrespective
> > >> > of where the symbol in question came from. Only the exceptional case
> > >> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> > >> > typically occurs for EXPORT_SYMBOL in .S files.
> > >>
> > >> Hi, Masahiro,
> > >>
> > >> After apply this patch, I get the following modpost warnings when doing:
> > >>
> > >> $ make M=tools/tesing/nvdimm
> > >> ...
> > >>   Building modules, stage 2.
> > >>   MODPOST 12 modules
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
> > >> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> ...
> > >>
> > >> There are a lot of these warnings.  :)
> > >
> > > These warnings are correct since
> > > drivers/nvdimm/Makefile and
> > > tools/testing/nvdimm/Kbuild
> > > compile the same files.
> >
> > Yeah, but that's by design.  Is there a way to silence these warnings?
> >
> > -Jeff
> >
>
> "rm -f Module.symvers; make M=tools/testing/nvdimm" ?
>
> I'd like the _design_ fixed though.

This design is deliberate. The goal is to re-build the typical nvdimm
modules, but link them against mocked version of core kernel symbols.
This enables the nvdimm unit tests which have been there for years and
pre-date Kunit. That said, deleting Module.symvers seems a simple
enough workaround.
