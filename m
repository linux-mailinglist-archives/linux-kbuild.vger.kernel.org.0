Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E835394644
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 May 2021 19:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233296AbhE1RSr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 May 2021 13:18:47 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:35876 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbhE1RSr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 May 2021 13:18:47 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 14SHGWaK005858;
        Sat, 29 May 2021 02:16:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 14SHGWaK005858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1622222193;
        bh=6tBRoAU0JAL0auk78MYvHYjCc/y/kzmdxvTDhaug0A0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=u8yPVCL5wApWwhgUCySQ7/ahofz/JU1DW7X/fDaJPgvuuUeepHuuRUKo5uOCcEelz
         IUb85VQ154GZVwx5EevGPgVRAgSF0uCd/duPg75ZUiLtCzHoWkss5z94VD+tYBFUdZ
         a4ZssPh/LqCrM4X/Zo8r1TAzhQzgvqflcMSVcCI3kKYLZLGabDtyYAhguxhb8ei/Z2
         FtTIOEc06pWfa0SENF7ScHtyovnWBV6e3CrmErua9AVehTVhZPBUFmzp73NVbhbwyq
         1QqGbPEeSJLTUMFfeKJiREtoghoBvOhhJlEKRzjr8o+pymjFsWsOlB5DWPsrJu0dj3
         nhZCE3CXQZbMQ==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id lr4-20020a17090b4b84b02901600455effdso3758219pjb.5;
        Fri, 28 May 2021 10:16:33 -0700 (PDT)
X-Gm-Message-State: AOAM530RJNS/wn89b0pY8R+w+MSgAf9jew0aEZEscEqGgiwCU5BzHh2p
        7RJQD9TDn+daB/sXpiNdhSy0jHPE3y5f4SM1wMk=
X-Google-Smtp-Source: ABdhPJzoXjbufwGL6iBohvWWPajVfsDf/sr1fvRUONAhRlt85B8s/vFOJM7Ioii36hJJ8pZZc9ZTe1heBeLC30iU/oU=
X-Received: by 2002:a17:90b:384:: with SMTP id ga4mr1261206pjb.0.1622222192405;
 Fri, 28 May 2021 10:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210526173855.5963-1-msuchanek@suse.de> <CAK7LNASEqKwQeLPXedyut+ykSJGPuq3CO1g_fS=sVDaZrwBPBQ@mail.gmail.com>
 <20210526202825.GB8544@kitsune.suse.cz>
In-Reply-To: <20210526202825.GB8544@kitsune.suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 29 May 2021 02:15:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
Message-ID: <CAK7LNAQ=DiayZ8YqgMTrTWyP_fuEpPL80+BSzj9VB+RQDKD27g@mail.gmail.com>
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

On Thu, May 27, 2021 at 5:28 AM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> On Thu, May 27, 2021 at 03:56:41AM +0900, Masahiro Yamada wrote:
> > On Thu, May 27, 2021 at 2:39 AM Michal Suchanek <msuchanek@suse.de> wro=
te:
> > >
> > > This reverts commit 243b50c141d71fcf7b88e94474b3b9269f0b1f9d.
> > >
> > > When packaging the kernel it is built in different place from the one=
 in
> > > which it will be installed. After build the makefile needs to be
> > > regenerated with the target location but with mkmakefile merged into
> > > Makefile tehre is no way to do that.
> > >
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> >
> > My patch was not working as expected
> > regardless of packaging.
> >
> > Does the following fix-up work for you?
>
> For the packaging I need some way to regenerate the Makefile and fake
> the directory where the Makefile will be on the user system (ie DESTDIR)
>
> Without the mkmakefile I do not see any way to do it.
>
> If the kernel makefile is no longer location dependent there is no need
> any more, of course.
>
> Thanks
>
> Michal

Sorry, I do not understand this.

IIUC, this patch does not change any functionality.
The generated Makefile is still the same.
Why is it a problem?



--=20
Best Regards
Masahiro Yamada
