Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1D97398F2C
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 17:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhFBPr2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 11:47:28 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:42666 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231837AbhFBPr2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 11:47:28 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 152FjPNp006288;
        Thu, 3 Jun 2021 00:45:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 152FjPNp006288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622648726;
        bh=MnGRRKvbqmuVLLBWpwwf/rFkG2bdE9Xa6VH1ZiplG8Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dWiag1R1/kPIMviwRzD0KBKqGittAlI5LNgZjTlufYyXFoz+rUMHvp5CppR2G/Ip2
         qLd5xGvFeHVrypCPDom6PnylViU1GiJWBfAoDNifdcIufxRV2hU3UHbmCtyJ9O9XB8
         +T4zwpFgvSV7yXnET2pjX0jX8FCSJSmODy4sMrU6nYmyE3fo2u3uFmEF64TWnZuEhE
         EMYm94slRiUyREszBbun3yeXht49uPRjawfzNWfcgRRE7IBOsm5cw8jhOpo+MIcw06
         WFPRtB0gefF+KN76DWwBbU6u+4kJIbhvTNYNY9GMujdfWzIgQeFT1xQnfnPZekZqv7
         hZoddLEEuWinQ==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id e1so1291980pld.13;
        Wed, 02 Jun 2021 08:45:26 -0700 (PDT)
X-Gm-Message-State: AOAM531UYLV3xIbwRqxW0dD5nqsy1+ICU8vbeMhDOYThR4tuZWIia+WJ
        zPq2LU7wTYmw9K3r2261WUrMkMDZOglEQKtUm00=
X-Google-Smtp-Source: ABdhPJwdKfLZG9z1Ym+yv3UrG8mLXS+N3stsVfyITLR0iRMmFAPiLTSCQDa365qxtV5ORpDEq91/4+J/syNP+QobMFQ=
X-Received: by 2002:a17:903:22cf:b029:105:2b81:3915 with SMTP id
 y15-20020a17090322cfb02901052b813915mr15342294plg.71.1622648725367; Wed, 02
 Jun 2021 08:45:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173855.5963-1-msuchanek@suse.de> <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz> <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz> <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
 <20210602100315.GL8544@kitsune.suse.cz>
In-Reply-To: <20210602100315.GL8544@kitsune.suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Jun 2021 00:44:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
Message-ID: <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
Subject: Re: [PATCH] Revert "kbuild: merge scripts/mkmakefile to top Makefile"
To:     =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 3, 2021 at 12:18 AM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> On Wed, Jun 02, 2021 at 06:45:58PM +0900, Masahiro Yamada wrote:
> > On Sat, May 29, 2021 at 2:35 PM Michal Such=C3=A1nek <msuchanek@suse.de=
> wrote:
> > >
> > > On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > > > On Thu, May 27, 2021 at 5:28 AM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
> > > > >
> > > > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse=
.de> wrote:
> > > > > > >
> > > > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > > > > >
> > > > > > > When packaging the kernel it is built in different place from=
 the one in
> > > > > > > which it will be installed. After build the makefile needs to=
 be
> > > > > > > regenerated with the target location but with mkmakefile merg=
ed into
> > > > > > > Makefile tehre is no way to do that.
> > > > > > >
> > > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > > >
> > > > > > My patch was not working as expected
> > > > > > regardless of packaging.
> > > > > >
> > > > > > Does the following fix-up work for you?
> > > > >
> > > > > For the packaging I need some way to regenerate the Makefile and =
fake
> > > > > the directory where the Makefile will be on the user system (ie D=
ESTDIR)
> > > > >
> > > > > Without the mkmakefile I do not see any way to do it.
> > > > >
> > > > > If the kernel makefile is no longer location dependent there is n=
o need
> > > > > any more, of course.
> > > > >
> > > > > Thanks
> > > > >
> > > > > Michal
> > > >
> > > > Sorry, I do not understand this.
> > > >
> > > > IIUC, this patch does not change any functionality.
> > > > The generated Makefile is still the same.
> > > > Why is it a problem?
> > >
> > > It cannot be regenerated.
> >
> > This is an issue regardless of your packaging.
> > That is why I suggested a patch in my previous reply.
> >
> > https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO=
1g_fS=3DsVDaZrwBPBQ@mail.gmail.com/
> >
> >
> > Anyway, please try next-20210602
> > and see if you still have a problem.
>
> Yes, I still have a problem.
>
> My packaging script calls mkmakefile which no longer exists.


So, we are not talking about the functionality any more.

What is important for you is, you have a separate file.

You overwrite scripts/mkmakefile for doing
whatever hacks you like.

If the code is moved into the Makefile,
it will be more difficult to insert hacks.

This is what I understood from your statement.







>
> Regardless of whther the new code works correctly or not in the usual
> case it removes the ability to regenearte the makefile for a specific
> target location.
>
> Thanks
>
> Michal
>
> > >
> > > During package build you have four directories
> > >
> > >  - the source directory
> > >  - the build directory
> > >  - the staging directory where files are installed to be included in =
the
> > >    package
> > >  - the target directory where files will be installed on the target
> > >    system once the package is installed by the user
> > >
> > > The makefile is generated for the build directory, not the target
> > > directory. What is needed is a way to generate a makefile in the stag=
ing
> > > directory that will work when installed in the target directory.
> > > When mkmakefile is folded into makefile the makefile can no longer be
> > > regenerated because it is up-to-date, and it can no longer be specifi=
ed
> > > that it should be generated for the target directory, not the staging
> > > directory.
> > >
> > > Thanks
> > >
> > > Michal
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada



--=20
Best Regards
Masahiro Yamada
