Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5F4398586
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 11:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbhFBJst (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 05:48:49 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:32151 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229878AbhFBJss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 05:48:48 -0400
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1529kZ1C017965;
        Wed, 2 Jun 2021 18:46:36 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1529kZ1C017965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622627196;
        bh=UEDxt3jZPt9klPDmU39//NrKGutiTGckdZnlTH1N5sM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vOZHJHDH3VVo4HdclwyskErC5mbk3B1QsyLWtq5l0FTYuY0aHnhu4JMiF/UcV/QpC
         6GukLYjbc7y7Af9nUJrHtLLiRtRIP7mCTjpk+lOlVrOUFbXQvXAnZFn5OW51cOqUtT
         oGT75OwPmWDxtSwCQxgTi6XtIIfZyV45YJjmHOSolprIOB9zCRWnFBUSLs+c2et+Fo
         TVfgUU/KJNZeXEt9BVvGmZ0JuDZ6fLLq+9+SZeTeZvkXkKNcrzbPR+Yrf1cOozhhC+
         43hwXd/onAYP7nEtniptCsMfrin/iKdLffBEfC0vpGsrkSdyKkakOaRDaQzPKPEiCt
         +rw5iEWdQiczw==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id 29so1760598pgu.11;
        Wed, 02 Jun 2021 02:46:35 -0700 (PDT)
X-Gm-Message-State: AOAM530Nxb8aX66OK0h9AlHexOY8iraTqJ0m1khnVpHIvYRriTjv5JzK
        lEA42SDrkRV+/FljODr9fg7Z3F/hMRT/Rvs25Yc=
X-Google-Smtp-Source: ABdhPJxhHUfN1WBjX/moBViUe1m6uCMKtmPdM5NhGVKxthtvAbl7itTvDqL900U2cxvpWyI6AJsL3ZyGUsdxxLR/FSg=
X-Received: by 2002:a63:6841:: with SMTP id d62mr17816633pgc.7.1622627195120;
 Wed, 02 Jun 2021 02:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173855.5963-1-msuchanek@suse.de> <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz> <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz>
In-Reply-To: <20210529053512.GT8544@kitsune.suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 2 Jun 2021 18:45:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
Message-ID: <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
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

On Sat, May 29, 2021 at 2:35 PM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > On Thu, May 27, 2021 at 5:28 AM Michal Such=C3=A1nek <msuchanek@suse.de=
> wrote:
> > >
> > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de>=
 wrote:
> > > > >
> > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > > > >
> > > > > When packaging the kernel it is built in different place from the=
 one in
> > > > > which it will be installed. After build the makefile needs to be
> > > > > regenerated with the target location but with mkmakefile merged i=
nto
> > > > > Makefile tehre is no way to do that.
> > > > >
> > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > >
> > > > My patch was not working as expected
> > > > regardless of packaging.
> > > >
> > > > Does the following fix-up work for you?
> > >
> > > For the packaging I need some way to regenerate the Makefile and fake
> > > the directory where the Makefile will be on the user system (ie DESTD=
IR)
> > >
> > > Without the mkmakefile I do not see any way to do it.
> > >
> > > If the kernel makefile is no longer location dependent there is no ne=
ed
> > > any more, of course.
> > >
> > > Thanks
> > >
> > > Michal
> >
> > Sorry, I do not understand this.
> >
> > IIUC, this patch does not change any functionality.
> > The generated Makefile is still the same.
> > Why is it a problem?
>
> It cannot be regenerated.

This is an issue regardless of your packaging.
That is why I suggested a patch in my previous reply.

https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_f=
S=3DsVDaZrwBPBQ@mail.gmail.com/


Anyway, please try next-20210602
and see if you still have a problem.






>
> During package build you have four directories
>
>  - the source directory
>  - the build directory
>  - the staging directory where files are installed to be included in the
>    package
>  - the target directory where files will be installed on the target
>    system once the package is installed by the user
>
> The makefile is generated for the build directory, not the target
> directory. What is needed is a way to generate a makefile in the staging
> directory that will work when installed in the target directory.
> When mkmakefile is folded into makefile the makefile can no longer be
> regenerated because it is up-to-date, and it can no longer be specified
> that it should be generated for the target directory, not the staging
> directory.
>
> Thanks
>
> Michal



--=20
Best Regards
Masahiro Yamada
