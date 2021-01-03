Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD412E8DBA
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Jan 2021 19:21:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727147AbhACSVC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 3 Jan 2021 13:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbhACSVB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Jan 2021 13:21:01 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 013A8C0613C1
        for <linux-kbuild@vger.kernel.org>; Sun,  3 Jan 2021 10:20:20 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id v3so13189392plz.13
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Jan 2021 10:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=apUPhe8XGFmm+Bi43EU6C/xYFjQp2KMTqbnzxE/Prgo=;
        b=Hx7USmsWC6rsYBwFOAOs3KB4jnSIdXfa1hxNJgxQnIRTiKPsNOQ20ub3xbGhGtvFFe
         z4CAxghIGF+Dyi+skjVLYGw5M0fFf/ZuTfVHrBUQ8QWPXBZOfrsxUPXGLutzXg0y1yr7
         AV/0FK2Kd2eRm/wjnygRqY+I8zTGl/FfBf+z+4osxlnEXR5j7jTrNCoz7MIkcblT1hm0
         t5nszwGrARVOMQfo3yyZEKytwP56uVdLirCgrS4YfYEBd4IbMpTZIOBXAs5oKFoZUmkd
         iVOhAjMd5ZXVvrrYWDwi8ygUfGz5jrhS2y+ilw/9Ij8t2Qy2mJKOo2xwypqdr/plcI/y
         Sh8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=apUPhe8XGFmm+Bi43EU6C/xYFjQp2KMTqbnzxE/Prgo=;
        b=ZwJ3ZOmhLkH9+slb/4165YzSpX19I/Fy2+1iRWX6Tuoj1A5LjNGRxhIzxgll0EKfma
         7olLU0LgCX8TK6MNbWMVUNXDSO7+vhFjF5xvEL0Kv4Hdt8ocVWpyAnAU8gx9h3RlE5SG
         2DztQhV3KJ/UdQOsfkEXp6GNSLLR7ds3j+6irZqN4b4MCN3V7jmqAltD7wy0Ld9jZpQH
         SVBPq1pw1z7NP6SepFJYFkDyKFbuH7/dI+d7Qc806f3Gc4hgh652xUTwuoqL1RYwVvEc
         QpDVNv8uxO4LU0+/TIHf9nmzUrDGUL6VML63Ts5JANN/1mPkNZaotkGbBcE3NvwCaSn0
         Qo8w==
X-Gm-Message-State: AOAM533FUHVYxxhBo+Qls0VWu+yC+S0On9wEMMHWlnzay2sr3w7TKM1f
        AljvJsdxU/pS5gtXUYq1TxzyVw==
X-Google-Smtp-Source: ABdhPJwXW4yEo4w8egwTb3K4A3pdigp+VHONUW2bOiDCwEGCqE724OK97nQ+XP6vrLf2zgic7GYmug==
X-Received: by 2002:a17:90a:d790:: with SMTP id z16mr26805961pju.88.1609698020326;
        Sun, 03 Jan 2021 10:20:20 -0800 (PST)
Received: from hermes.local (204-195-22-127.wavecable.com. [204.195.22.127])
        by smtp.gmail.com with ESMTPSA id f64sm55342846pfb.146.2021.01.03.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 10:20:19 -0800 (PST)
Date:   Sun, 3 Jan 2021 10:20:11 -0800
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Valdis =?UTF-8?B?S2zEk3RuaWVrcw==?= <valdis.kletnieks@vt.edu>,
        Michal Marek <michal.lkml@markovi.net>,
        "David S. Miller" <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Kconfig, DEFAULT_NETSCH, and shooting yourself in the foot..
Message-ID: <20210103102011.444ecaa4@hermes.local>
In-Reply-To: <CAK7LNAQU61eccDfh_jX_cnZHnyxfbfgBGu1845QM8XbBTJPnsw@mail.gmail.com>
References: <16871.1609618487@turing-police>
        <CAK7LNAQU61eccDfh_jX_cnZHnyxfbfgBGu1845QM8XbBTJPnsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, 3 Jan 2021 15:30:30 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> On Sun, Jan 3, 2021 at 5:14 AM Valdis Kl=C4=93tnieks <valdis.kletnieks@vt=
.edu> wrote:
> >
> > Consider the following own goal I just discovered I scored:
> >
> > [~] zgrep -i fq_codel /proc/config.gz
> > CONFIG_NET_SCH_FQ_CODEL=3Dm
> > CONFIG_DEFAULT_FQ_CODEL=3Dy
> > CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> >
> > Obviously, fq_codel didn't get set as the default, because that happens
> > before the module gets loaded (which may never happen if the sysadmin
> > thinks the DEFAULT_NET_SCH already made it happen)
> >
> > Whoops. My bad, probably - but....
> >
> > The deeper question, part 1:
> >
> > There's this chunk in net/sched/Kconfig:
> >
> > config DEFAULT_NET_SCH
> >         string
> >         default "pfifo_fast" if DEFAULT_PFIFO_FAST
> >         default "fq" if DEFAULT_FQ
> >         default "fq_codel" if DEFAULT_FQ_CODEL
> >         default "fq_pie" if DEFAULT_FQ_PIE
> >         default "sfq" if DEFAULT_SFQ
> >         default "pfifo_fast"
> > endif
> >
> > (And a similar chunk right above it with a similar issue)
> >
> > Should those be "if (foo=3Dy)" so =3Dm can't be chosen? (I'll be
> > happy to write the patch if that's what we want)
> >
> > Deeper question, part 2:
> >
> > Should there be a way in the Kconfig language to ensure that
> > these two chunks can't accidentally get out of sync?  There's other
> > places in the kernel where similar issues arise - a few days ago I was
> > chasing a CPU governor issue where it looked like it was possible
> > to set a default that was a module and thus possibly not actually loade=
d.
> > =20
>=20
>=20
> If there is a restriction where a modular discipline cannot be the defaul=
t,
> I think you can add 'depends on FOO =3D y'.
>=20
>=20
>=20
> For example,
>=20
>=20
> choice
>            prompt "Default"
>=20
>            config DEFAULT_FOO
>                   bool "Use foo for default"
>                   depends on FOO =3D y
>=20
>            config DEFAULT_BAR
>                   bool "Use bar for default"
>                   depends on BAR =3D y
>=20
>            config DEFAULT_FALLBACK
>                   bool "fallback when nothing else is builtin"
>=20
> endchoice
>=20
>=20
>=20
>=20
>=20

You can use a qdisc that is a module, it just has to be available when devi=
ce
is loaded. Typically that means putting it in initramfs.
