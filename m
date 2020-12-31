Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE122E81D0
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Dec 2020 20:28:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgLaT17 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 31 Dec 2020 14:27:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725968AbgLaT17 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Dec 2020 14:27:59 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0914C061573;
        Thu, 31 Dec 2020 11:27:18 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id 75so18017253ilv.13;
        Thu, 31 Dec 2020 11:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=fty3BIEe/UPvAqoEJ68xkeG5aMRNnTOEFkIYO4/UqQU=;
        b=UUKSDWh6GHrViqGVdV3/AE14N6zXL5t1fC3ddL1nZY8jkRX5OttCxRcrmy9XDAxmk8
         7mA/aK3khq1CUfHBTiFIY1/B5MQaBQdwDWQ4boOOesEWZcYfT6Wu+dYvNTk6f1W/8bpo
         8t/hhtFvsb7HYTRU4gNqkRcq7nbhVAQb3zUVQc5lAm61Z/LZUAfn6HjAXZIX2eXdFNj0
         QiygMb94MjlkAoSGrRsKs3heZAn6kdNXXXIl4CVlAs2ul6O5mSv4iGPAZbAkKOC2PqAw
         fhsuLzXSTvz/l5VZZJ20GX4vlxq4tkFEJcsKOrK8S0LC2UKLYDjlbHb3Y4wC49xVeLPN
         ofwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=fty3BIEe/UPvAqoEJ68xkeG5aMRNnTOEFkIYO4/UqQU=;
        b=n/H581P3l61CdBSmgbBLAJeT1Z1idRHraiWCYGpY1D/KZei5wk2Ulz/+Ce/M1u81jS
         Pk44v8jzUzNAtswlpIBxTRihI4Hl5rzq361a+1y8n59OKagszkQHfqVpkJmdE+osK/W7
         wecV7xJuRNew/n6XsrP0qYQPBRZDtVhCx7ngdjvjQKowVyihZ3oNpWgKf4mTSWJSF06u
         2Y9691cWyCKyFam7GhsaMUwIMES8TClxMim+dZmtN/w4aP9pwEJ4vqBSVVv5DygtmE0u
         7HdtcdTnSyAwSt1g9rvnu7itkFEqI46tvRQUJwWAzoHPbSrDo8T4HcvA8S/FfKQ8blwA
         4i6Q==
X-Gm-Message-State: AOAM5337MHYIn/nptFjYfzWwUmjiYr5BOLOtV/LMMAPECVWfLOIfExaK
        s/EX/JAeZrARevkOiZolDCWG3pVVdy8jFBA0klE=
X-Google-Smtp-Source: ABdhPJzqXSouwf2BpNAYi8rzqX5V1tbj3Q7WGRBPzOofUVm12kCzKNtI29VFyb65jQJxNYKzbNi/m0duXf4CNo0Ee6w=
X-Received: by 2002:a05:6e02:1a6b:: with SMTP id w11mr58819980ilv.112.1609442838128;
 Thu, 31 Dec 2020 11:27:18 -0800 (PST)
MIME-Version: 1.0
References: <20201204011129.2493105-1-ndesaulniers@google.com>
 <20201204011129.2493105-3-ndesaulniers@google.com> <CAKwvOdkZEiHK01OD420USb0j=F0LcrnRbauv9Yw26tu-GRbYkg@mail.gmail.com>
 <CA+icZUW19o=bEcT6wOZ+9Yt6UtAoZ2-9ijNadC101_dMfn-VVA@mail.gmail.com> <CA+icZUWwNWVQDYUCoo6TQNBOtMqwwEuLJuNO2c8gvihs6jTGOA@mail.gmail.com>
In-Reply-To: <CA+icZUWwNWVQDYUCoo6TQNBOtMqwwEuLJuNO2c8gvihs6jTGOA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 31 Dec 2020 20:27:07 +0100
Message-ID: <CA+icZUX3WRUfnOsLrSpdGHSR8B=+Nj23wB47-FDYeSkaKneLSA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Kbuild: DWARF v5 support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Clifton <nickc@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 28, 2020 at 4:15 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sun, Dec 27, 2020 at 7:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Fri, Dec 4, 2020 at 2:13 AM 'Nick Desaulniers' via Clang Built
> > Linux <clang-built-linux@googlegroups.com> wrote:
> > >
> > > sigh...I ran a broken script to send the series which doesn't cc folks properly.
> > > + lkml, linux-kbuild
> > > (Might just resend, properly)
> > >
> > > On Thu, Dec 3, 2020 at 5:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > > >
> > > > DWARF v5 is the latest standard of the DWARF debug info format.
> > > >
> > > > DWARF5 wins significantly in terms of size when mixed with compression
> > > > (CONFIG_DEBUG_INFO_COMPRESSED).
> > > >
> > > > Link: http://www.dwarfstd.org/doc/DWARF5.pdf
> > > >
> > > > Patch 1 is a cleanup that lays the ground work and isn't DWARF
> > > > v5 specific.
> > > > Patch 2 implements Kconfig and Kbuild support for DWARFv5.
> > > >
> > > > Changes from v2:
> > > > * Drop two of the earlier patches that have been accepted already.
> > > > * Add measurements with GCC 10.2 to commit message.
> > > > * Update help text as per Arvind with help from Caroline.
> > > > * Improve case/wording between DWARF Versions as per Masahiro.
> > > >
> > > > Changes from the RFC:
> > > > * split patch in 3 patch series, include Fangrui's patch, too.
> > > > * prefer `DWARF vX` format, as per Fangrui.
> > > > * use spaces between assignment in Makefile as per Masahiro.
> > > > * simplify setting dwarf-version-y as per Masahiro.
> > > > * indent `prompt` in Kconfig change as per Masahiro.
> > > > * remove explicit default in Kconfig as per Masahiro.
> > > > * add comments to test_dwarf5_support.sh.
> > > > * change echo in test_dwarf5_support.sh as per Masahiro.
> > > > * remove -u from test_dwarf5_support.sh as per Masahiro.
> > > > * add a -gdwarf-5 cc-option check to Kconfig as per Jakub.
> > > >
> >

[ ... ]

Some more numbers with Linux v5.10.4.

GCC v10.2.1
GNU/ld BFDd v2.35.1
LLD v11.0.1-rc2
LLVM toolchain v11.0.1-rc2

So using GCC with LLD together with DWARF v5 reduces the binary sizes.

Looks like Gmail makes the tabella look ugly...

          | gcc10-bfd | gcc10-lld | gcc10-llvm | clang-ias
----------------------------------------------------------
vmlinux.o | 580212    | 504508    | 504508     | 353864
----------------------------------------------------------
vmlinux   | 503172    | 509944    | 509944     | 358500
----------------------------------------------------------
dbg deb   | 701576    | 606348    | 607656     | 506816

...so I add the lines below.

580212  5.10.4-1-amd64-gcc10-bfd/vmlinux.o
504508  5.10.4-2-amd64-gcc10-lld/vmlinux.o
504508  5.10.4-3-amd64-gcc10-llvm/vmlinux.o
353864  5.10.4-4-amd64-clang-ias/vmlinux.o

503172  5.10.4-1-amd64-gcc10-bfd/vmlinux
509944  5.10.4-2-amd64-gcc10-lld/vmlinux
509944  5.10.4-3-amd64-gcc10-llvm/vmlinux
358500  5.10.4-4-amd64-clang-ias/vmlinux

701576  5.10.4-1-amd64-gcc10-bfd/linux-image-5.10.4-1-amd64-gcc10-bfd-dbg_5.10.4-1~bullseye+dileks1_amd64.deb
606348  5.10.4-2-amd64-gcc10-lld/linux-image-5.10.4-2-amd64-gcc10-lld-dbg_5.10.4-2~bullseye+dileks1_amd64.deb
607656  5.10.4-3-amd64-gcc10-llvm/linux-image-5.10.4-3-amd64-gcc10-llvm-dbg_5.10.4-3~bullseye+dileks1_amd64.deb
506816  5.10.4-4-amd64-clang-ias/linux-image-5.10.4-4-amd64-clang-ias-dbg_5.10.4-4~bullseye+dileks1_amd64.deb

- Sedat -

> >
> > > > Nick Desaulniers (2):
> > > >   Kbuild: make DWARF version a choice
> > > >   Kbuild: implement support for DWARF v5
> > > >
> > > >  Makefile                          | 15 +++++++------
> > > >  include/asm-generic/vmlinux.lds.h |  6 +++++-
> > > >  lib/Kconfig.debug                 | 35 ++++++++++++++++++++++++++-----
> > > >  scripts/test_dwarf5_support.sh    |  9 ++++++++
> > > >  4 files changed, 53 insertions(+), 12 deletions(-)
> > > >  create mode 100755 scripts/test_dwarf5_support.sh
> > > >
> > > > --
> > > > 2.29.2.576.ga3fc446d84-goog
> > > >
> > >
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> > >
> > > --
> > > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkZEiHK01OD420USb0j%3DF0LcrnRbauv9Yw26tu-GRbYkg%40mail.gmail.com.
