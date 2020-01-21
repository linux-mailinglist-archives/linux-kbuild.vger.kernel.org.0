Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E62761440D9
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Jan 2020 16:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729017AbgAUPt0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Jan 2020 10:49:26 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51283 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgAUPt0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Jan 2020 10:49:26 -0500
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00LFmxvB032152;
        Wed, 22 Jan 2020 00:48:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00LFmxvB032152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579621740;
        bh=QNy0J9485PLVj/lWu2K2Q/r3Oo4wCpQoR9+3n4LqspA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pmhsxpcLCJkot4Y/dFz2ZHYTHsnzNrxvgpbuVoOtozHdZPefPl0qiowRemdbE9WP6
         a4ChluKbuYL8aFy2q+ewNPlHOXIFeqOpCX9tK4GlTSZJ1sxG/dBmf3nRYDFPEgT2U5
         vywe1Dq8sL9mWetSRCl/52lbhv9d2gAboKBmeD0iW7h++15Dp7GvdovWHO8EjoaA1g
         vg8Ef/6vBbonRRUcmGSeTojyfaja1QzBAUd75k3DFXEFXyJRjiHyU26+zB7wdAkVsX
         XPFf+PFW+A2PiyQ1NWKIZhN70iQcmBSD/dHp3wb575QFFEtP6rXnbzFtrKJHAJ+PXc
         v5K8mUFvPXrow==
X-Nifty-SrcIP: [209.85.217.46]
Received: by mail-vs1-f46.google.com with SMTP id v12so2109484vsv.5;
        Tue, 21 Jan 2020 07:48:59 -0800 (PST)
X-Gm-Message-State: APjAAAXly78N/wTIkV+fSJX2r0AAKoVawqu2RTNXQ/+jSYFyGsXSeCHf
        C9R7SSqTFYQxty73bcfEm3Qq9mwOuSUT67m0wCk=
X-Google-Smtp-Source: APXvYqxh9HCpa/NiNQMPWap5CNoXnetuXPH667PmUfNWUH3xezMWQjnmUZ7bRtA6AwhifZrYF9d9G2Urt4VhxrLAxK0=
X-Received: by 2002:a05:6102:2334:: with SMTP id b20mr3167894vsa.155.1579621738736;
 Tue, 21 Jan 2020 07:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20200115162529.11089-1-masahiroy@kernel.org>
In-Reply-To: <20200115162529.11089-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Jan 2020 00:48:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj0X-F+9p_M40BXVH3XdpoRcy_Rwk7NGL5au2EKS4gjQ@mail.gmail.com>
Message-ID: <CAK7LNATj0X-F+9p_M40BXVH3XdpoRcy_Rwk7NGL5au2EKS4gjQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] builddeb: remove unneeded files in hdrobjfiles for
 headers package
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 16, 2020 at 1:26 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - We do not need tools/objtool/fixdep or tools/objtool/sync-check.sh
>    for building external modules. Including tools/objtool/objtool is
>    enough.
>
>  - gcc-common.h is a check-in file. I do not see any point to search
>    for it in objtree.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v2: None


Series, applied to linux-kbuild.


>
>  scripts/package/builddeb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b60388051c7f..eb067d6f1370 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -170,11 +170,11 @@ done
>  (cd $srctree; find arch/$SRCARCH -name module.lds -o -name Kbuild.platforms -o -name Platform) >> "$objtree/debian/hdrsrcfiles"
>  (cd $srctree; find $(find arch/$SRCARCH -name include -o -name scripts -type d) -type f) >> "$objtree/debian/hdrsrcfiles"
>  if is_enabled CONFIG_STACK_VALIDATION; then
> -       (cd $objtree; find tools/objtool -type f -executable) >> "$objtree/debian/hdrobjfiles"
> +       echo tools/objtool/objtool >> "$objtree/debian/hdrobjfiles"
>  fi
>  (cd $objtree; find arch/$SRCARCH/include Module.symvers include scripts -type f) >> "$objtree/debian/hdrobjfiles"
>  if is_enabled CONFIG_GCC_PLUGINS; then
> -       (cd $objtree; find scripts/gcc-plugins -name \*.so -o -name gcc-common.h) >> "$objtree/debian/hdrobjfiles"
> +       (cd $objtree; find scripts/gcc-plugins -name \*.so) >> "$objtree/debian/hdrobjfiles"
>  fi
>  destdir=$kernel_headers_dir/usr/src/linux-headers-$version
>  mkdir -p "$destdir"
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
