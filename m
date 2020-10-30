Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA8F29FAA9
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Oct 2020 02:39:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725771AbgJ3Bjz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 21:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ3Bjz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 21:39:55 -0400
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D922CC0613CF
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2020 18:39:54 -0700 (PDT)
Received: by mail-il1-x12b.google.com with SMTP id g7so5117432ilr.12
        for <linux-kbuild@vger.kernel.org>; Thu, 29 Oct 2020 18:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V958ZyTN1p6gJ00+JwBE3K6tYpjufiw0XznD9MNyE4A=;
        b=j2mMXk5WSxrAZMv4q6/NGNqr4kSMId1iVd6ZAJk9iVhAnZaqiAZ9OD5QvIKlbdKESw
         Hq38tpp3JkVEvOkwVZ5YYpe+1xrqNnHnPqPb1GkBcLO0kQm4N26ja9Tlihfh9QLxQ9iL
         hJNEs2JZKnp4X5gTxaJqK3mvRTr0tTyTbK5Jm1VAGoauZ4YLB4kz10aP4aErDZOnz5g8
         ZH1c51xpTnGtfMABbZQ2Mlk3QRhZXXKynwVWU4gPF/YvYLzRoqLMmgaZIrBXedgEPJJW
         I7/aDM5T3Tn4qWNfWHsBkHXSjierfqTiwf1+UYwMwmqrWaZfRDgD4I6zZd0DFmn5nAZU
         UA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V958ZyTN1p6gJ00+JwBE3K6tYpjufiw0XznD9MNyE4A=;
        b=f0VzWurxCYno+6OSMtehkTdtr7V71cZPa9kVsYRxRtQyI+HeANGNVz7JZUZtszNVSg
         1URq39wGP+xwItnfXKbTD8CHlQSE+7koyayC9KDayrQ9VxTIQQAPSWQCHjCGKvl3Mh4p
         jDEBUwRgiCkvsCC3i8sSsJhmODxMQhuxyXO9my+eJzNbZ9xPeyaoGB0jfnvY5N2Y0Pzj
         Z17y8JyJMkrK37cgaZ+fYrAjB+2tpONQs4ghdaDy/+TfwX7MVXO2AovcC7EMp5r6Lsca
         +T9gj8i2nESV3y3TOor7AYEqmFbJwvh1WWp4A6DPTwwT62F/Wl5T/+ZWsrAugCRCqULO
         u5pg==
X-Gm-Message-State: AOAM533zQjCqv8eaaHLE5He+3YX6pxzb+MWqf65jyB1ZfcW4megHu5PJ
        cx18s3lnJIwzaAR7oTNLpDtjMPOFS0tcwin3zCBgeoag3RU=
X-Google-Smtp-Source: ABdhPJxqi17V4H/3gp3NQRAXHXczxl7SEZB9D3G4Av6jRfZBaXNOQmJKFVQ+hwx6zt1UAVIR2iENvmGI9x4MC4qJaEI=
X-Received: by 2002:a92:c8c8:: with SMTP id c8mr202288ilq.21.1604021994023;
 Thu, 29 Oct 2020 18:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMFOmUUJ4C95J3psPBgfaFX=VCqAZEcRrf2Y0pzR+C=xxNMyg@mail.gmail.com>
 <CAK7LNARAPLxx5_NEgopyXOouQ0QWP0B3L6UsuuEL7FNNdrLa=g@mail.gmail.com>
In-Reply-To: <CAK7LNARAPLxx5_NEgopyXOouQ0QWP0B3L6UsuuEL7FNNdrLa=g@mail.gmail.com>
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
Date:   Thu, 29 Oct 2020 18:39:32 -0700
Message-ID: <CAOMFOmUGNzNa9mAUeC7sLYEafeMTaECvE=GcjH1U=F5TMdusZw@mail.gmail.com>
Subject: Re: "Permission denied" when using system-installed kernel headers
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello

On Thu, Oct 29, 2020 at 6:21 PM Masahiro Yamada <masahiroy@kernel.org> wrot=
e:
>
> On Fri, Oct 30, 2020 at 2:35 AM Anatol Pomozov <anatol.pomozov@gmail.com>=
 wrote:
> >
> > Hi folks
> >
> > Here is a follow-up for this issue
> > https://github.com/Open-CAS/open-cas-linux/issues/540
> >
> > opencas project builds an out-of-tree kernel module and uses
> > system-level kernel header. In my case these headers are installed to
> > /lib/modules/5.9.1-arch1-1/build
> >
> > So if I do
> >
> > $ cd /lib/modules/5.9.1-arch1-1/build
> > $ make kernelversion
> >
> > I get following output:
> >
> > mkdir: cannot create directory =E2=80=98.tmp_86541=E2=80=99: Permission=
 denied
> > mkdir: cannot create directory =E2=80=98.tmp_86543=E2=80=99: Permission=
 denied
> > mkdir: cannot create directory =E2=80=98.tmp_86545=E2=80=99: Permission=
 denied
> > mkdir: cannot create directory =E2=80=98.tmp_86547=E2=80=99: Permission=
 denied
> > .......
> > mkdir: cannot create directory =E2=80=98.tmp_86626=E2=80=99: Permission=
 denied
> > mkdir: cannot create directory =E2=80=98.tmp_86628=E2=80=99: Permission=
 denied
> > mkdir: cannot create directory =E2=80=98.tmp_86630=E2=80=99: Permission=
 denied
> > 5.9.1-arch1
>
>
>
> This is because you did not pass M=3D option.
>
>
>
> /lib/modules/$(uname -r)/build
> is used for building external modules.
>
> You cannot work in that directory
> since it is usually read-only.
>
>
> You need to pass M=3D<path-to-your-module>
>
>
> This may work for you.
>
>
>
> $ cd  /lib/modules/$(uname -r)/build
> $ mkdir $HOME/foo
> $ make M=3D$HOME/foo  kernelversion

Thanks a lot, it works!
