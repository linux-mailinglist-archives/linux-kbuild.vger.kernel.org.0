Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE35137BE6
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 07:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgAKGwD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 01:52:03 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:44272 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728432AbgAKGwD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 01:52:03 -0500
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 00B6pvsa000504;
        Sat, 11 Jan 2020 15:51:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 00B6pvsa000504
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578725518;
        bh=OlrKDXE4Lubzhxdxm7bFeDqmZzH9BVlU/DaWPg7f2Ow=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rIwke7reRkhK9Chys451XaCQY1CqP5TPzuVqsOPe9wYMAOF/vRe8DhTszECEa+8NR
         8HFWxaAZl/mNg7mxsQ0WvGyzvacATJpgGcXsucsFHIew8BR4op6wInHf0rjw49Kq4a
         mqGM4daC6jc/7+OENIMqMKng+/7zt5mr6hBWZaaSCVG2cDr/sITtZ59l9v5bEpcI6P
         Z+C1T55ycq9frjgOESnM6zqp+cTzzDBXUm5ZI09Pj6uem3tvdVpSzINqw3pv0/Kogi
         OF8Oc1pa8Wl6UHkDa80D50zhnpbnoYH6Lo4+dxPwFeji7Ssr6g1Nadn+yJiZCkHgEB
         wDtLVf24avfXg==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id x123so2739826vsc.2;
        Fri, 10 Jan 2020 22:51:57 -0800 (PST)
X-Gm-Message-State: APjAAAXvfGiIgzmLcAv1skkhnp3iQwvxwU62oi96yfM4Fe60lmBxiSmM
        7nst0j0vxZ2bIMU9Fdmyw9cJoZL8jV8hAyUi/qE=
X-Google-Smtp-Source: APXvYqz2x+Uxm+3+HujMB6p8b6Jw9Xi9SKEWemrmgaptxAexM2qfSurkw8KIc7YE3u63lp17nLe/MTyRGKUY5POcEOw=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr1355277vsa.181.1578725516419;
 Fri, 10 Jan 2020 22:51:56 -0800 (PST)
MIME-Version: 1.0
References: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 15:51:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNYQY=Z6TqacifFi-ycnHgSdWtD+YBQAGWPZA52RQm0w@mail.gmail.com>
Message-ID: <CAK7LNAQNYQY=Z6TqacifFi-ycnHgSdWtD+YBQAGWPZA52RQm0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] builddeb: allow selection of .deb compressor
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC: Ben Hutchings, Riku Voipio)

On Sat, Jan 4, 2020 at 6:56 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.q=
mqm.pl> wrote:
>
> Select deb compression using KPKG_COMPRESS make variable. This allows to
> use gzip compression for local or test builds, and that's way faster
> than now-default xz compression.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index c4c580f547ef..d289c4ebc891 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,7 @@ create_package() {
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> -       dpkg --build "$pdir" ..
> +       dpkg-deb ${KPKG_COMPRESS:+-Z$KPKG_COMPRESS} --build "$pdir" ..
>  }
>
>  version=3D$KERNELRELEASE
> --
> 2.20.1
>

I have not seen any comment on this,
but using gzip is indeed way faster.


Some minor comments:

I see some variables staring "KDEB_",
but nothing starting "KPKG_".



masahiro@grover:~/workspace/linux-kbuild$ git grep KDEB_
scripts/Makefile.package:KDEB_SOURCENAME ?=3D linux-$(KERNELRELEASE)
scripts/Makefile.package:export KDEB_SOURCENAME
scripts/Makefile.package:       $(call cmd,src_tar,$(KDEB_SOURCENAME))
scripts/Makefile.package:               mv $(KDEB_SOURCENAME).tar.gz
../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
scripts/package/builddeb:# specified in KDEB_HOOKDIR) that will be
called on package install and
scripts/package/builddeb:debhookdir=3D${KDEB_HOOKDIR:-/etc/kernel}
scripts/package/mkdebian:if [ -n "$KDEB_PKGVERSION" ]; then
scripts/package/mkdebian:       packageversion=3D$KDEB_PKGVERSION
scripts/package/mkdebian:sourcename=3D$KDEB_SOURCENAME
scripts/package/mkdebian:if [ -n "$KDEB_CHANGELOG_DIST" ]; then
scripts/package/mkdebian:        distribution=3D$KDEB_CHANGELOG_DIST
scripts/package/mkdebian:        echo >&2 "Install lsb-release or set
\$KDEB_CHANGELOG_DIST explicitly"
masahiro@grover:~/workspace/linux-kbuild$ git grep KPKG_


Maybe starting KDEB_ seems to be better for consistency?




--=20
Best Regards
Masahiro Yamada
