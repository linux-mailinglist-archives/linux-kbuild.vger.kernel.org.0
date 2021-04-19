Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2437C363BC2
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 08:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbhDSGmK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 02:42:10 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54210 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhDSGmI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 02:42:08 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 13J6fA6E027199
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Apr 2021 15:41:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 13J6fA6E027199
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618814470;
        bh=fQu0yvooL8uc2tCj7VQOErl+qt23AJ3UBrne8Xc5/r4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=fKuH5kfdjHdahh+SflLXFnoL465Ssy6kGeb/WLnO4Ty4KSe1dmHzeKUz0g+2u0TcJ
         v+Is+XuG1GBpOly3wkWN+brPV0Zgan7xW5HEs5OKHhH966QtSeO5sdzaFHjQRnZZRf
         tFXdUe13iV7ZdFuS3KIAyEMjVvusHANMz4pYXCpNtQktPhvMXVRlwC+dUJZ3Cvd65x
         dUCuB5W74ASGRsks08uHd8ROg8zBfbUoDLrtd4S/NKeqD8F90soG6NLFrt/EbmLWLU
         HnBjAbYW+950vxI/OsFgTDfxbJ4rZRakkSlZAmuZuo12mDXSpkZW+yV453ByGIwvsh
         N+d06NYVjnhQA==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id y22-20020a17090a8b16b0290150ae1a6d2bso999236pjn.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Apr 2021 23:41:10 -0700 (PDT)
X-Gm-Message-State: AOAM531ZD2WuwhFX2l2doUFSOx3fBNuFh31TldHCy9ZkLVC0ZP43WhPq
        5XhVkMY+w59mt2LjKIxz/D+t4QVr1J+mFAt+0is=
X-Google-Smtp-Source: ABdhPJyX/LFRbQrwj7n0P1FeY2OvcQbSK2hYkpFEUgfQt05GlvLvXEycrgMkDWJXub8guTFqQ1YCDruPfyx+5NCtbGM=
X-Received: by 2002:a17:90b:1955:: with SMTP id nk21mr23615778pjb.198.1618814469965;
 Sun, 18 Apr 2021 23:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210411101422.7092-1-bage@linutronix.de> <20210411101422.7092-5-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-5-bage@linutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 19 Apr 2021 15:40:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNATLna+ecXUo1NdnLJSVpCFMOJ4eDJkkPd1j=Uoz==6rQw@mail.gmail.com>
Message-ID: <CAK7LNATLna+ecXUo1NdnLJSVpCFMOJ4eDJkkPd1j=Uoz==6rQw@mail.gmail.com>
Subject: Re: [PATCH 4/6] builddeb: use standard format for copyright file
To:     bage@linutronix.de
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 11, 2021 at 7:14 PM <bage@linutronix.de> wrote:
>
> From: Bastian Germann <bage@linutronix.de>
>
> Convert the minimal copyright file to the DEP-5 standard format that is
> commonly used in Debian.
>
> Link: https://trends.debian.net/#copyright-format-machine-readable-dep-5-vs-old-format
> Signed-off-by: Bastian Germann <bage@linutronix.de>

This is equivalent to this patch:
https://lore.kernel.org/linux-kbuild/20200920222556.10002-4-guillem@hadrons.org/


> ---
>  scripts/package/mkdebian | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 717223ef6b03..bb5c19735345 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -152,22 +152,23 @@ EOF
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
> -The git repository for mainline kernel development is at:
> -git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> -
> +Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
> +Upstream-Name: Linux
> +Source: https://www.kernel.org/pub/linux/kernel
> +Comment: This is a packaged upstream version of the Linux kernel.
> +
> +Files: *
> +Copyright: 1991 - 2021 Linus Torvalds and others.
> +License: GPL-2

My concern is this license info is wrong
since not all files are GPL-2.

Is it better to make apparently wrong license info
machine-interpretable?

That is a question.



-- 
Best Regards
Masahiro Yamada
