Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB5620C12F
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Jun 2020 14:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgF0MDu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 27 Jun 2020 08:03:50 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39838 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbgF0MDu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jun 2020 08:03:50 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 05RC3ThK013965;
        Sat, 27 Jun 2020 21:03:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 05RC3ThK013965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593259410;
        bh=c/VsgKgSlWCQfyzv1PNM2LD7gd0/8O7/m9SgdNerqsI=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=AWXLF1RdYr1QW/2I50aqEncB4fP/quVnz5owYjU5LAKPRFvmthQg67sONzIxC+aRW
         3RoZHUaTJr5SUXTTGWJ++5s28MQjJL8nFQbt5n64dt/oex7BE45tl0oQrc8sYcGoNs
         SBCRsYKHNcnADpEH131ub2aQmLrpHwJZ9NESmJ+gJQH/5aoyqeaqcixvgTk3v17X2s
         DKaWgWKboTtlUhyiltx+JylLyJwDNyJDRTxbMXizEjmbLwG/zqbSyFM5bhlku3+4ad
         I46pqMxi2lwK7KW+DnXaaDkcKAyglCp/OiuLuKa4IWJotKnG6skRErxfAna+6IbB5O
         I6/XCdyRFu04w==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id l24so3853545uar.10;
        Sat, 27 Jun 2020 05:03:30 -0700 (PDT)
X-Gm-Message-State: AOAM531dol+MR6lPT3AFtM7x1f2ACs9sgajBCCTBs5WMAxvSXR552q+6
        SgGvw/xAC1xPM5mikV2g81jM62rd/32JmXa5fUA=
X-Google-Smtp-Source: ABdhPJz861TMEjAxXG+vbsRXa3PDIlG7VGZSRsFR8/Y7+8ZngpgR3aMpoaj6yMuD9Vke62cHLzOjJX4c37wQTaYYSTs=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr5385395uae.121.1593259409050;
 Sat, 27 Jun 2020 05:03:29 -0700 (PDT)
MIME-Version: 1.0
References: <5ef50e52.1c69fb81.b6cbd.bd8e@mx.google.com> <CAK7LNASta=UfbK-C=6R+tT2nug8_MYyr9515J4CN8odWCh0CpA@mail.gmail.com>
 <20200626214026.GB25753@dumbo>
In-Reply-To: <20200626214026.GB25753@dumbo>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Jun 2020 21:02:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
Message-ID: <CAK7LNASRL6jaaxZreFK+iDmFHuw6QLSS0n08gZNkyhcsNunAnw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: buildtar: add arm64 dtbs support
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 27, 2020 at 6:40 AM Domenico Andreoli
<domenico.andreoli@linux.com> wrote:
>
> On Fri, Jun 26, 2020 at 03:16:58PM +0900, Masahiro Yamada wrote:
> > On Fri, Jun 26, 2020 at 5:51 AM Domenico Andreoli
> > <domenico.andreoli@linux.com> wrote:
> > >
> > > From: Domenico Andreoli <domenico.andreoli@linux.com>
> > >
> > > Make 'make tar-pkg' install dtbs on arm64.
> > >
> > > Signed-off-by: Domenico Andreoli <domenico.andreoli@linux.com>
> > >
> > > v2:
> > >  - Destination path includes the kernel version, as expected
> > >
> > > ---
> > >  scripts/package/buildtar |    9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > Index: b/scripts/package/buildtar
> > > ===================================================================
> > > --- a/scripts/package/buildtar
> > > +++ b/scripts/package/buildtar
> > > @@ -125,6 +125,15 @@ case "${ARCH}" in
> > >                 ;;
> > >  esac
> > >
> > > +#
> > > +# Install dtbs
> > > +#
> > > +case "${ARCH}" in
> >
> > Instead of checking ${ARCH},
> > can you you do
> >
> >      if grep -q '^CONFIG_OF_EARLY_FLATTREE=y' include/config/auto.conf; then
> >
> > ?
>
> Done in v3.
>
> >
> > This is what the deb package build does:
> > https://github.com/masahir0y/linux/blob/v5.7/scripts/package/builddeb#L145
> >
> >
> > > +       arm64)
> > > +               make ARCH="${ARCH}" -f ${srctree}/Makefile INSTALL_DTBS_PATH="${tmpdir}/boot/dtbs/${KERNELRELEASE}" dtbs_install
> > > +               ;;
> > > +esac
> > > +
> >
> >
> > Or, you can use INSTALL_PATH="${tmpdir}/boot"
> > to make it shorter.
>
> This does not work, INSTALL_DTBS_PATH gets somehow defined along the
> twisted path to buildtar and therefore needs to be explicitly specified
> for the new destination.

It works.

See line 1002 of the top Makefile

export INSTALL_DTBS_PATH ?= $(INSTALL_PATH)/dtbs/$(KERNELRELEASE)





> > --
> > Best Regards
> > Masahiro Yamada
>
> Thank you for the review.
>
> Regards,
> Domenico
>
> --
> rsa4096: 3B10 0CA1 8674 ACBA B4FE  FCD2 CE5B CF17 9960 DE13
> ed25519: FFB4 0CC3 7F2E 091D F7DA  356E CC79 2832 ED38 CB05



-- 
Best Regards
Masahiro Yamada
