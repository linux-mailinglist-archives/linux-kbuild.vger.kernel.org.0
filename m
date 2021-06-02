Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BC583992A9
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Jun 2021 20:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhFBSiG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Jun 2021 14:38:06 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28370 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbhFBSiG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Jun 2021 14:38:06 -0400
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 152Ia13v008012;
        Thu, 3 Jun 2021 03:36:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 152Ia13v008012
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622658963;
        bh=4rjqEYty1xRucIxhdoYP7TQh4oZHpVT0ZE4vGRSQlX0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=feZYW9awkmO4vA2dWCEJRRiEZrWJ4sCV/aprRmv/HMoyS6KmNWWWrPSd8BMe6Qlx0
         Lgwkhb2XeW3Yhmx/3RuaQCdb2YohiEujPIjJJe+4+fc0ZWUGO4jRdCm9jyTDkvmqRP
         U1PHANkA8xz8o7vB0KJY7y4llIykhY5S4D1p9ZRAyCqj18u0UQ6NZhN/VUYKDzF41p
         fUzQFDpJ8LHoOatS3PKgqYVo2jDiM5XrxdqVmVLKRsMRPPWkBeJPN4KQmCCnVfM6DB
         0dsUio0GXLFLuqDJhoC+ruND62DDC4KwNYVW9Ht5rWXuhOWEANP7xEwb+qgieL9trG
         GfVbEBL6cug6g==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id u18so2863186pfk.11;
        Wed, 02 Jun 2021 11:36:02 -0700 (PDT)
X-Gm-Message-State: AOAM532FnVUWgrrLhBTMZktIX++EGekpyJjiqWywkuJayHaXwD/mzqnO
        zzjQUghWZO5p/50dgCimlGHZQklRi5w7m9etYEE=
X-Google-Smtp-Source: ABdhPJx62CPmFW4UZmubLRwjlJHMz1KrzuAvxFpd8XF2qptlSfiVKtnVYjUZYACBoTtRx4Sf+t2NJHxdB9VKNjJpxE4=
X-Received: by 2002:a63:36c1:: with SMTP id d184mr35339938pga.47.1622658961444;
 Wed, 02 Jun 2021 11:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173855.5963-1-msuchanek@suse.de> <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz> <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
 <20210529053512.GT8544@kitsune.suse.cz> <CAK7LNAT-78qWBa-TzTTQ-PN7Cr5DdaAEgKzUiVkkB=uOgcAsDQ@mail.gmail.com>
 <20210602100315.GL8544@kitsune.suse.cz> <CAK7LNAT0AfTb=SVp+iO0rGkLm8__=O+uW-20_iuPvvNkxkbpuA@mail.gmail.com>
 <20210602175929.GN8544@kitsune.suse.cz>
In-Reply-To: <20210602175929.GN8544@kitsune.suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 3 Jun 2021 03:35:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQLC4VFzcgx90T7w-sew0EJmhYOzmuG+AMNLgWMJxRO=A@mail.gmail.com>
Message-ID: <CAK7LNAQLC4VFzcgx90T7w-sew0EJmhYOzmuG+AMNLgWMJxRO=A@mail.gmail.com>
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

On Thu, Jun 3, 2021 at 2:59 AM Michal Such=C3=A1nek <msuchanek@suse.de> wro=
te:
>
> On Thu, Jun 03, 2021 at 12:44:48AM +0900, Masahiro Yamada wrote:
> > On Thu, Jun 3, 2021 at 12:18 AM Michal Such=C3=A1nek <msuchanek@suse.de=
> wrote:
> > >
> > > On Wed, Jun 02, 2021 at 06:45:58PM +0900, Masahiro Yamada wrote:
> > > > On Sat, May 29, 2021 at 2:35 PM Michal Such=C3=A1nek <msuchanek@sus=
e.de> wrote:
> > > > >
> > > > > On Sat, May 29, 2021 at 02:15:55AM +0900, Masahiro Yamada wrote:
> > > > > > On Thu, May 27, 2021 at 5:28 AM Michal Such=C3=A1nek <msuchanek=
@suse.de> wrote:
> > > > > > >
> > > > > > > On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wro=
te:
> > > > > > > > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@=
suse.de> wrote:
> > > > > > > > >
> > > > > > > > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1=
f9d.
> > > > > > > > >
> > > > > > > > > When packaging the kernel it is built in different place =
from the one in
> > > > > > > > > which it will be installed. After build the makefile need=
s to be
> > > > > > > > > regenerated with the target location but with mkmakefile =
merged into
> > > > > > > > > Makefile tehre is no way to do that.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > > > > > >
> > > > > > > > My patch was not working as expected
> > > > > > > > regardless of packaging.
> > > > > > > >
> > > > > > > > Does the following fix-up work for you?
> > > > > > >
> > > > > > > For the packaging I need some way to regenerate the Makefile =
and fake
> > > > > > > the directory where the Makefile will be on the user system (=
ie DESTDIR)
> > > > > > >
> > > > > > > Without the mkmakefile I do not see any way to do it.
> > > > > > >
> > > > > > > If the kernel makefile is no longer location dependent there =
is no need
> > > > > > > any more, of course.
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > Michal
> > > > > >
> > > > > > Sorry, I do not understand this.
> > > > > >
> > > > > > IIUC, this patch does not change any functionality.
> > > > > > The generated Makefile is still the same.
> > > > > > Why is it a problem?
> > > > >
> > > > > It cannot be regenerated.
> > > >
> > > > This is an issue regardless of your packaging.
> > > > That is why I suggested a patch in my previous reply.
> > > >
> > > > https://lore.kernel.org/linux-kbuild/CAK7LNASEqKwQeLPXedyut+ykSJGPu=
q3CO1g_fS=3DsVDaZrwBPBQ@mail.gmail.com/
> > > >
> > > >
> > > > Anyway, please try next-20210602
> > > > and see if you still have a problem.
> > >
> > > Yes, I still have a problem.
> > >
> > > My packaging script calls mkmakefile which no longer exists.
> >
> >
> > So, we are not talking about the functionality any more.
> >
> > What is important for you is, you have a separate file.
> >
> > You overwrite scripts/mkmakefile for doing
> > whatever hacks you like.
> >
> > If the code is moved into the Makefile,
> > it will be more difficult to insert hacks.
> >
> > This is what I understood from your statement.
>
> I did not insert hacks. I called the script that your patch removes.


You can copy scripts/mkmakefile
to your packaging project if it is needed.

It is a very short code that generates two lines.

cat << EOF > Makefile
# Automatically generated by $0: don't edit
include $1/Makefile
EOF

You can also copy-paste it to your packaging script.







> That's functionality that is lost.
>
> Now without the script separate from the makefile inserting hacks will
> be required.
>
> I would like to avoid that.
>
> Thanks
>






--
Best Regards
Masahiro Yamada
