Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E84C196DA8
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2020 15:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbgC2Na6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Mar 2020 09:30:58 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44360 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727903AbgC2Na6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Mar 2020 09:30:58 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 02TDUcuc019732
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 22:30:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 02TDUcuc019732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585488638;
        bh=SVRXm2cWsV5NcazdJ3j2AwZVTcwG8qiWpl+KlQXwtuk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PULFxwQ1UnsY7V1KLaVEP8gt5TbWQocPrS8ZXVEJZBFs1DBCvcq2a4j/d3+YH4nr5
         +7AZsZHTvT0qgye4mSzYaTTaWe4SEs4HiGwi5bvHSmMqtblxjG663fBuQMyOVgUA6u
         omGrXFbrXj6I48YEQm5fH0FG7h0rqglssPnf1ExdijJGdlwsE66wiobIg6Sh+ZWt6h
         2qr5iN6uBz7nw+nt87714uHTV2N+FUQn7O7SYjZcqDQsCZU+tH6yYqLrnrh3/VwL0A
         ROEfuW+oD2RV1i3HmtxI+ZbRwNLmAJHUPDYTakJtcb72kmOyGIomCxuQZih0C0QUuG
         8Uz/ow29p0BAw==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id v24so5307926uak.0
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2020 06:30:38 -0700 (PDT)
X-Gm-Message-State: AGi0PuZWhgsAMDPymiaanv64vxh9HAZizYz6MsNM5YrhmjBlDGVwNmpX
        GlSpGBRKuckvkfIxi8spEp4UzSC9KtI6RIgANlE=
X-Google-Smtp-Source: APiQypKlo2LCqdpAZWp6+wPz7GaNLQGX2cszTwCRUj1H03y3i5cLwNdG77aOvxXsrOSmSmuopnbqBLTA1RzZHVSRD98=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr4888655uak.95.1585488637302;
 Sun, 29 Mar 2020 06:30:37 -0700 (PDT)
MIME-Version: 1.0
References: <1966103.4dT7el1ifK@apollon> <158496310058.14061.15052560096291438066.reportbug@debian>
 <CAK7LNAQcMM_H41zXA++FOF=LJT+YKNfmwHMYqdF3r1uQT307Hw@mail.gmail.com> <2516578.0xqDLvIEN0@apollon>
In-Reply-To: <2516578.0xqDLvIEN0@apollon>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 29 Mar 2020 22:30:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
Message-ID: <CAK7LNAQBypq0QxUafH6f4k4d7wObjycK6eys2NKDZi8_Qdxb4A@mail.gmail.com>
Subject: Re: Bug#954778: Patch: Suppress irrelevant warning when generating a
 debian package
To:     Reinhard Karcher <reinhard.karcher@gmx.net>, 954778@bugs.debian.org
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 29, 2020 at 9:57 PM Reinhard Karcher
<reinhard.karcher@gmx.net> wrote:
>
> Am Sonntag, 29. M=C3=A4rz 2020, 14:01 schrieb Masahiro Yamada:
> >
> > > By making a contribution to this project, I certify that:
> > > The contribution was created in whole or in part by me and I have the
> > > right to submit it under the open source license indicated in the fil=
e.
> >
> > Please drop this.
> >
> > Signed-off-by implies this.
> > No need to explain this in an individual patch.
>
> Droped in attached new version.
>
> > > +if [ -n "$BUILD_DEBUG" ] ; then
> >
> > This file does not define BUILD_DEBUG.
> > So, this conditional is always false, isn't it?
> >
> > It should be:
> >
> > if is_enabled CONFIG_DEBUG_INFO; then
> >
>
> The definition of BUILD_DEBUG is copied from builddeb too.
> See attached patch.


No.

I want you to directly use

if is_enabled CONFIG_DEBUG_INFO; then
...
fi





I guess builddeb used BUILD_DEBUG
to avoid running grep twice.

It does not apply to mkdebian.



--=20
Best Regards
Masahiro Yamada
