Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D2927B090
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Sep 2020 17:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgI1PMh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Sep 2020 11:12:37 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:51373 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgI1PMh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Sep 2020 11:12:37 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08SFCCel008406;
        Tue, 29 Sep 2020 00:12:13 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08SFCCel008406
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1601305933;
        bh=zxHJNkozk3fuYzsAQpLs+DasX+zD+m0TZGMot9gOZ8g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QZRJzpGVk8TpYLdJ5TnywGum9e2totGLKKiOZROdNAIGL0ZtzA2QmItZAl+0+eujw
         F2jsDBARR57xc7qXr1Kiv4dnYsLh1572tzVJ3DCa5XrXcirA+EaqahjsH+vn4jSm0B
         tnQIgkux0DSKRuxbNVvRWTAc7YuevVC/ltmHpmTK3AJLuoxSyQ1wz078isizQWj//W
         buf6NoY5PNcs5qqVRFH2q2HpES1HdhVp1CPJF1zQ7gxkbBcKnf/z6iX5fw+C0KGzV+
         imCZdkDHni4X2YctF1eom7itqUQegy4W49fCo4WARtOz4CNfpBcTr2ha/80LcEtER7
         ZVd8YtZj9J1Zg==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id a9so859283pjg.1;
        Mon, 28 Sep 2020 08:12:13 -0700 (PDT)
X-Gm-Message-State: AOAM531kitkKOkH9oSIKFv9fwbUN63p9/NJXZj5PvOhQxJrd9MSfcGAe
        CPvFe1Tzum8IGevqc8tl7HfRz/ceOZwvi8+GMTs=
X-Google-Smtp-Source: ABdhPJx737VzF6/TWm26shaqcfzNGOENA4JzXvyADdXRU/peg+3bKDZO7DLY5wgdFEg0gmJ1JdRtT6Hy1an22QkDBYw=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr1681057pjb.198.1601305932190;
 Mon, 28 Sep 2020 08:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200920222556.10002-1-guillem@hadrons.org> <20200920222556.10002-4-guillem@hadrons.org>
In-Reply-To: <20200920222556.10002-4-guillem@hadrons.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 29 Sep 2020 00:11:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQqHR5T0D+ThsDJ-QpBTzxt9PDWn1M8G8uurv5LC_SKSg@mail.gmail.com>
Message-ID: <CAK7LNAQqHR5T0D+ThsDJ-QpBTzxt9PDWn1M8G8uurv5LC_SKSg@mail.gmail.com>
Subject: Re: [PATCH 3/7] builddeb: Switch to a machine readable copyright file
To:     Guillem Jover <guillem@hadrons.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Hutchings <ben@decadent.org.uk>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

(+CC ben)

On Mon, Sep 21, 2020 at 7:48 AM Guillem Jover <guillem@hadrons.org> wrote:
>
> This format makes it possible to automatically process the licenses
> within a system for compatibility or compliance checks, for example.
> Update the copyright years.


Not all kernel developers are familiar with the
background info.
I think the commit description can describe a little more about
the rationale.


For example,

This was accepted as DEP-5
(https://dep-team.pages.debian.net/deps/dep5/)

and the debian kernel package switched to
the machine-readable debian/copyright by [1].

[1]: https://salsa.debian.org/kernel-team/linux/-/commit/d4f730e3ba9c76aff4c522b1a87aeb617f2f655e







> Signed-off-by: Guillem Jover <guillem@hadrons.org>
> ---
>  scripts/package/mkdebian | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index cd2c8c39aa54..69f2a6d7f009 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -157,19 +157,29 @@ EOF
>
>  # Generate copyright file
>  cat <<EOF > debian/copyright
> -This is a packacked upstream version of the Linux kernel.
> -
> -The sources may be found at most Linux archive sites, including:
> -https://www.kernel.org/pub/linux/kernel
> -
> -Copyright: 1991 - 2018 Linus Torvalds and others.
> -
> -    This program is free software; you can redistribute it and/or modify
> -    it under the terms of the GNU General Public License as published by
> -    the Free Software Foundation; version 2 dated June, 1991.
> -
> -On Debian GNU/Linux systems, the complete text of the GNU General Public
> -License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Source: https://www.kernel.org/pub/linux/kernel
> +
> +Files: *
> +Copyright:
> + 1991-2020 Linus Torvalds and others.
> +License: GPL-2

This specifies GPL-2 for 'Files: *'.

This is wrong because not all files in the kernel are GPL-2.



The debian-kernel maintains the large list of
exceptional files:

https://salsa.debian.org/kernel-team/linux/-/blob/debian/5.8.7-1/debian/copyright

But, I doubt it is maintainable.


I wonder if it is a good thing to convert it
to machine-interpretable, but apparently wrong information.


I am reluctant to maintain the huge debian/copyright...


Ben,
Do you have any idea how to handle this?




> +License: GPL-2
> + This program is free software; you can redistribute it and/or modify
> + it under the terms of the GNU General Public License as published by
> + the Free Software Foundation; version 2 dated June, 1991.
> + .
> + This program is distributed in the hope that it will be useful,
> + but WITHOUT ANY WARRANTY; without even the implied warranty of
> + MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + GNU General Public License for more details.
> + .
> + You should have received a copy of the GNU General Public License
> + along with this program.  If not, see <https://www.gnu.org/licenses/>.
> +Comment:
> + On Debian systems, the complete text of the GNU General Public License
> + version 2 can be found in '/usr/share/common-licenses/GPL-2'.
>  EOF
>
>  # Generate a control file
> --
> 2.28.0.297.g1956fa8f8d
>


--
Best Regards
Masahiro Yamada
