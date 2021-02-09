Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7A383145F8
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Feb 2021 03:01:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBICAD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Feb 2021 21:00:03 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58418 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbhBICAB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Feb 2021 21:00:01 -0500
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1191x2xo032373;
        Tue, 9 Feb 2021 10:59:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1191x2xo032373
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1612835944;
        bh=rkuFABRQ1YCSp/qNK4UblSQCDbPbTo38udmlFYYW5l0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hwGEI5xNO1wf/5Zquiz3x3xBNMGppVm1NAat+25eX4mhCaOEF7075PtVFRpX1/1V+
         MROQh84R52cfwNrpItBUnk9Vc2+zf+eFKtxcdTksd/Rt//XFAzem69fVDEl16Da2Nf
         HCpiepOgS6xRqpcjcTGqRaLyLBpqCCyQdqU7Q9UATSMfLA1qV/JmrDXqp1jCf+Nq25
         CR2NtIePCDYNCURASOHsoQGD2pPMV00rPz6JgowcDTl53uCKFBCwUDLd4tBHSPLQeo
         7A7+9lJ4CmZy/J8DsH8+kK2PITE30BksU/N3I1p3t4xNc0ToiA2w7FqZIKsQaDQGge
         4We4Aj00/W3yw==
X-Nifty-SrcIP: [209.85.167.50]
Received: by mail-lf1-f50.google.com with SMTP id r65so2547812lff.6;
        Mon, 08 Feb 2021 17:59:03 -0800 (PST)
X-Gm-Message-State: AOAM5317Lyl57fHt+7HEvvLOE2j3mI8UW7YluYXdUJdhSwoMxDwHg6Ra
        XwQADzzkx3TPk7DkdwQswZEVLvLth0Bk99/ABXU=
X-Google-Smtp-Source: ABdhPJwZCPVt7aSG/IAG6aD42AKXKWfZkFsl9WcFbcFQa+g1MvNb8wUgw7RX9fwee8xhlBaZdXr3suSCTkqBuJk/szE=
X-Received: by 2002:a19:f20f:: with SMTP id q15mr8398441lfh.227.1612835942027;
 Mon, 08 Feb 2021 17:59:02 -0800 (PST)
MIME-Version: 1.0
References: <20210206035033.2036180-1-sashal@kernel.org> <20210206035033.2036180-2-sashal@kernel.org>
 <f8aa21157d0848cda0775a174bba05b2@AcuMS.aculab.com>
In-Reply-To: <f8aa21157d0848cda0775a174bba05b2@AcuMS.aculab.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 9 Feb 2021 10:58:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNATDts980vwwUOHV4V-HcrYgXMZueFCYzL6ayP3LZegqNA@mail.gmail.com>
Message-ID: <CAK7LNATDts980vwwUOHV4V-HcrYgXMZueFCYzL6ayP3LZegqNA@mail.gmail.com>
Subject: Re: [PATCH 2/3] kbuild: clamp SUBLEVEL to 255
To:     David Laight <David.Laight@aculab.com>
Cc:     Sasha Levin <sashal@kernel.org>,
        "michal.lkml@markovi.net" <michal.lkml@markovi.net>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 8, 2021 at 10:48 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Sasha Levin
> > Sent: 06 February 2021 03:51
> >
> > Right now if SUBLEVEL becomes larger than 255 it will overflow into the
> > territory of PATCHLEVEL, causing havoc in userspace that tests for
> > specific kernel version.
> >
> > While userspace code tests for MAJOR and PATCHLEVEL, it doesn't test
> > SUBLEVEL at any point as ABI changes don't happen in the context of
> > stable tree.
> >
> > Thus, to avoid overflows, simply clamp SUBLEVEL to it's maximum value in
> > the context of LINUX_VERSION_CODE. This does not affect "make
> > kernelversion" and such.
> >
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Makefile | 12 +++++++++---
> >  1 file changed, 9 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 49ac1b7fe8e99..157be50c691e5 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1258,9 +1258,15 @@ define filechk_utsrelease.h
> >  endef
> >
> >  define filechk_version.h
> > -     echo \#define LINUX_VERSION_CODE $(shell                         \
> > -     expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> > -     echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> > +     if [ $(SUBLEVEL) -gt 255 ]; then                                 \
> > +             echo \#define LINUX_VERSION_CODE $(shell                 \
> > +             expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 255); \
> > +     else                                                             \
> > +             echo \#define LINUX_VERSION_CODE $(shell                 \
> > +             expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + $(SUBLEVEL)); \
> > +     fi;                                                              \
> > +     echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) +  \
> > +     ((c) > 255 ? 255 : (c)))'
> >  endef
>
> Why not use KERNEL_VERSION to define LINUX_VERSION_CODE ?
> Basically just:
>         echo '#define LINUX_VERSION_CODE KERNEL_VERSION($(VERSION), $(PATCHLEVEL)+0, $(SUBLEVEL)+0)'




It was not possible to macrofy LINUX_VERSION_CODE.
(build error when CONFIG_KALLSYMS is disabled)


Presumably, this restriction will go away
with the following commit in linux-next.



commit e06af0b2ba02fc0cc2219a14c4c04ff0296a6f9f
Author: Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu Jan 28 18:42:30 2021 +1100

    init/version.c: remove Version_<LINUX_VERSION_CODE> symbol





My plan is to refactor LINUX_VERSION_CODE in the next
development cycle.






> If PATCHLEVEL and SUBLEVEL are guaranteed to be non-empty the +0
> can be removed.
> The patch assumes they are non-empty, the original pre-prended 0
> to stop syntax error for empty version strings.
>
> Note that the expr version will process 08 and 09.
> gcc will treat them as octal, and may error them.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
>
--
Best Regards
Masahiro Yamada
