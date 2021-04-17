Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25B4D362E8B
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 10:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhDQIfZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 04:35:25 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51826 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbhDQIfY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 04:35:24 -0400
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13H8Yib7004559
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 17:34:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13H8Yib7004559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618648484;
        bh=47WKMFhIK0VZNE85zzigNp6j+zvkbA4qS/mFI8sgibs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aTL6lbc0AIjiQNdRk3aYv+ZDv8Q62+/rabiD8TFE/jfZjld1eIHub4Xgzm46PCtHH
         wAw3f6dsXALhY9GUYMm8ZvdlAgRi4G79GsD2Cq+LdQjwE3DX3LZBnNIfz+I6m704Cd
         gVTGo9IJaAJZDoTanOdsDwPwNrRwZqHNXe/wZSkrRkZ6U+MdskvlK+5Q3Odeki0y6/
         PCE8ih/aBh02CMfrn29PrLSVbXS0Z8jfHVK/5jMCpF4Ppb8SQIWM3eeG+AJSUgZuaJ
         Y4MvCQrzhGt5sfeqiOrvAFBlBj/cTUY5X/WHC7CIJWAsj4UjW1cZ9P2ovMhD4l2Y4y
         GSDlrgNOYt3JA==
X-Nifty-SrcIP: [209.85.210.174]
Received: by mail-pf1-f174.google.com with SMTP id w6so5347231pfc.8
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 01:34:44 -0700 (PDT)
X-Gm-Message-State: AOAM530NmKMGSUC/sERUosTivX/afJG678169rtbOH4AVPytAgf9DDdY
        HgIEBZzvWR/oqfepO2i6KjVCq+y46cKslby+1x0=
X-Google-Smtp-Source: ABdhPJzdw5Ysnoau3FTSBe9sm7z1NUwnzg6+e71vyPBs3bCYTjgC1VIrre02Z5WtGGPFnzGPZioX1X/Kva4jcrOpzO8=
X-Received: by 2002:aa7:946b:0:b029:24c:57ea:99bf with SMTP id
 t11-20020aa7946b0000b029024c57ea99bfmr11426257pfq.63.1618648483872; Sat, 17
 Apr 2021 01:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210411101422.7092-1-bage@linutronix.de> <20210411101422.7092-2-bage@linutronix.de>
 <CAK7LNAQFZqp+DDWf5OV03vTrr9SaOhosbTeyMJQ3MwZHL6qA5A@mail.gmail.com>
In-Reply-To: <CAK7LNAQFZqp+DDWf5OV03vTrr9SaOhosbTeyMJQ3MwZHL6qA5A@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 17 Apr 2021 17:34:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxxrqzXKK3BAC-OwMH1=gEJWxuRY-K2810O3Bw2cGiAg@mail.gmail.com>
Message-ID: <CAK7LNARxxrqzXKK3BAC-OwMH1=gEJWxuRY-K2810O3Bw2cGiAg@mail.gmail.com>
Subject: Re: [PATCH 1/6] builddeb: diff-ignore unexported top-level files
To:     bage@linutronix.de
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 5:29 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sun, Apr 11, 2021 at 7:14 PM <bage@linutronix.de> wrote:
> >
> > From: Bastian Germann <bage@linutronix.de>
> >
> > scripts/Makefile.package's TAR_CONTENT lists the files to include in orig
> > tarballs while the deb-pkg make target only ignores .git. This results in
> > the other top-level files ending up in the .diff.gz.
> >
> > Let dpkg-source ignore .git with the default diff-ignore and list the other
> > top-level files in extend-diff-ignore. Use the debian/source/options to
> > always have those available on building the package.
> >
> > Signed-off-by: Bastian Germann <bage@linutronix.de>
> > ---
> >  scripts/Makefile.package | 2 +-
> >  scripts/package/mkdebian | 2 ++
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> > index f952fb64789d..280f3a2fa334 100644
> > --- a/scripts/Makefile.package
> > +++ b/scripts/Makefile.package
> > @@ -75,7 +75,7 @@ deb-pkg:
> >         $(call cmd,src_tar,$(KDEB_SOURCENAME))
> >         origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
> >                 mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
> > -       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
> > +       +dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
> >
> >  PHONY += bindeb-pkg
> >  bindeb-pkg:
> > diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> > index 60a2a63a5e90..3d2d4b033e44 100755
> > --- a/scripts/package/mkdebian
> > +++ b/scripts/package/mkdebian
> > @@ -134,6 +134,8 @@ fi
> >
> >  mkdir -p debian/source/
> >  echo "1.0" > debian/source/format
> > +echo diff-ignore > debian/source/options
> > +echo 'extend-diff-ignore = ".clang-format|.cocciconfig|.config.old|.*ignore|.mailmap|.version|CREDITS|MAINTAINERS|README"' >> debian/source/options
>
> Please add
> .clang-format, .cocciconfig, .mailmap, CREDITS, MAINTAINERS, README
> to TAR_CONTENTS.
>
> These are real source files.
>



.*ignore

is difficult to understand.

Please add  .gitignore to TAR_CONTENTS
and .git to diff-ignore.





-- 
Best Regards
Masahiro Yamada
