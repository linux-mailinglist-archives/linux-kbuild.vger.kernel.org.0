Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FAE035B397
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 13:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235431AbhDKLiR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 07:38:17 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:36912 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235234AbhDKLiR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 07:38:17 -0400
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 13BBbetI031964;
        Sun, 11 Apr 2021 20:37:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 13BBbetI031964
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618141061;
        bh=fjh52QpwYUJ5A8J1bzqqBjLyVWgcab/+mm+we0HOatI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GHjy5CgmozWWGxPvb+klPi1CXUomnJOny9OnxExJuc0LiMPgo3zDtLwtnacB4kac4
         9XWbnyt649w9/NJaimfIycTZXkAYnYjkuPP8W7BBfRvJWkVEu1yMLwmTB52uUKxs+3
         qvS49znxVWu9rx52yRMRxdp4Pz0VBgDqi8oxEwKVtYWksdwnPTS7B7Or2SYd6HBhCc
         ryC84j/k/Be7MnYjMPSijKbl41ZbfCatuX6x3RPAYZmHm9DM/0PpJIu7yVwf+6uugZ
         u8zLiAuPRrtEhrtlNzyU68Maa2AsqNHd5Kr07ubnHirJky18iia0nYUcu82TeJTTnn
         /0wjCCCoiujwA==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id y16so7312931pfc.5;
        Sun, 11 Apr 2021 04:37:41 -0700 (PDT)
X-Gm-Message-State: AOAM531SFLJ0RkqhLW9IveSks5oT2CatIjgOAOKLPCKH+m8+4vISf6vg
        FfYs5/BDA9vM8XtUN9hWUVIwTC2X+1ZcENP2nuU=
X-Google-Smtp-Source: ABdhPJwkoA8Q7R5xoRJ5m6iyipw+qHRbuOOjJdBx6fCQFqKFW2IUazaKaPP+lmjm0YHFyTE7Lacpm+DefVTfJ+assQw=
X-Received: by 2002:a63:181c:: with SMTP id y28mr22574933pgl.175.1618141060274;
 Sun, 11 Apr 2021 04:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <f6218ac526a04fa4d4406f935bcc4eb4a7df65c4.1617917438.git.msuchanek@suse.de>
 <CAK7LNAR-zdHLpp7eQ_PUG6PQMKUKh2m0b80NGSxnxuXhjyT=3g@mail.gmail.com> <20210411101829.GR6564@kitsune.suse.cz>
In-Reply-To: <20210411101829.GR6564@kitsune.suse.cz>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 11 Apr 2021 20:37:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASycuqb2wyizXgVs4aN33LOrxCBikLbSXs+anWJ0-SW_Q@mail.gmail.com>
Message-ID: <CAK7LNASycuqb2wyizXgVs4aN33LOrxCBikLbSXs+anWJ0-SW_Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: dummy-tools: Add elfedit.
To:     =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 7:18 PM Michal Such=C3=A1nek <msuchanek@suse.de> wr=
ote:
>
> On Sun, Apr 11, 2021 at 03:12:40AM +0900, Masahiro Yamada wrote:
> > On Fri, Apr 9, 2021 at 6:31 AM Michal Suchanek <msuchanek@suse.de> wrot=
e:
> > >
> > > elfedit is used in Makefile
> > >
> > >  Makefile:GCC_TOOLCHAIN_DIR :=3D $(dir $(shell which $(CROSS_COMPILE)=
elfedit))
> > >
> > > which causes this error getting printed
> > >
> > >  which: no elfedit in (./scripts/dummy-tools)
> >
> >
> > I am OK with this patch, but how did you reproduce it?
>
> make ARCH=3Darm CROSS_COMPILE=3Dscripts/dummy-tools/ allmodconfig
>
> it possibly depends on the config you already have, too.
>
> Thanks
>
> Michal


Maybey, are you working on linux-next?


[1]
$ git checkout  add74f8473^
$ make ARCH=3Darm CROSS_COMPILE=3Dscripts/dummy-tools/ allmodconfig

[2]
$ git checkout  add74f8473
$ make ARCH=3Darm CROSS_COMPILE=3Dscripts/dummy-tools/ allmodconfig



If [1] is OK, but [2] is NG,
commit add74f8473 is the root cause.

At least, I do not think this would happen
in the mainline kernel.

--=20
Best Regards
Masahiro Yamada
