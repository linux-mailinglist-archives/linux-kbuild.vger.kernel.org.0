Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53CFF137BD2
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 07:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726272AbgAKGOd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 01:14:33 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54081 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbgAKGOd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 01:14:33 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 00B6EK7q001698;
        Sat, 11 Jan 2020 15:14:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 00B6EK7q001698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578723261;
        bh=rJ5BVpkXZQCo8x5/o3SzV3TqMwMFfNchUjRcU1NXVnA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NtrNnAxkQJ9FAAnCpt5QvBcnpiqZs4I9Wgk23v4GtBQDw1hT1ey3Us/PD7MiT7cPG
         Qvtne6pWf8fcXO1E1o3opfC0/fCnVRsn/TLqiI3PyGtaliUUK3ghUu/rz7Wnjp9axh
         FlIakvRPu2+8OXJ/oiM1f7O53I/kGphtSnQPSSBYZ5KHcsotOACj3cWlM7hykl+e9W
         juPdXjsrvS+1EjdbqFvms4H27tmkzNDLh4As/g/4wMBHiE4Hv7llyOPC3OBlzPSE8p
         ELdd7zG5y5QKcekmghAH0TakZM/Obxtnf2y3l6ZOarUk25AwBBH39Q5uAAeFDDfzo7
         5QK4WeldpsUPA==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id c129so1236329vkh.7;
        Fri, 10 Jan 2020 22:14:20 -0800 (PST)
X-Gm-Message-State: APjAAAWnGOoeoWk8vZCABEPzHKhFppN6SXczW/87skcVQxQQpXn8+MpG
        r3/EgRQw28Mg/+LgMVcWj2VHEhqVvCIkkpVVMAI=
X-Google-Smtp-Source: APXvYqyH8SDvfD+WgFe5NKWQAPb5CJP9Cwu4NUYGjzYIUS+hG+AYGls8Jiy9Wg6n2X/uuI5WTxxe7dHfAZqUs7QhWoI=
X-Received: by 2002:a1f:18b:: with SMTP id 133mr1525181vkb.73.1578723259745;
 Fri, 10 Jan 2020 22:14:19 -0800 (PST)
MIME-Version: 1.0
References: <09f5b36d9c64b4e6d1d235f84a7333b7802b2866.1578131485.git.mirq-linux@rere.qmqm.pl>
 <081640c81d3c89707fdbb8869ae5f54aaea5064e.1578131485.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <081640c81d3c89707fdbb8869ae5f54aaea5064e.1578131485.git.mirq-linux@rere.qmqm.pl>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 15:13:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ6TuyRvtDww-CeKweJR7wEnOPyGFRFbDCv+xVEXRp0FQ@mail.gmail.com>
Message-ID: <CAK7LNAQ6TuyRvtDww-CeKweJR7wEnOPyGFRFbDCv+xVEXRp0FQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] builddeb: make headers package thinner
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 4, 2020 at 6:56 PM Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.q=
mqm.pl> wrote:
>
> Remove a bunch of files not used during external module builds:
>  - foreign architecture headers
>  - subtree Makefiles
>  - Kconfig files
>  - perl scripts
>
> On amd64 system this looses a third of the resulting .deb size.
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>

Applied to linux-kbuild.
Thanks.


> ---
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index d289c4ebc891..fb68916d5898 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -165,8 +165,8 @@ EOF
>  done
>
>  # Build kernel header package
> -(cd $srctree; find . -name Makefile\* -o -name Kconfig\* -o -name \*.pl)=
 > "$objtree/debian/hdrsrcfiles"
> -(cd $srctree; find arch/*/include include scripts -type f -o -type l) >>=
 "$objtree/debian/hdrsrcfiles"
> +(cd $srctree; find . arch/$SRCARCH -maxdepth 1 -name Makefile\*) > "$obj=
tree/debian/hdrsrcfiles"
> +(cd $srctree; find include scripts -type f -o -type l) >> "$objtree/debi=
an/hdrsrcfiles"
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platfo=
rms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -=
type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  if is_enabled CONFIG_STACK_VALIDATION; then
> --
> 2.20.1
>


--=20
Best Regards
Masahiro Yamada
