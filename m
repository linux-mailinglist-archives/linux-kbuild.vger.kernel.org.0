Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 191B6288D3D
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 17:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389235AbgJIPrd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 11:47:33 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19249 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389144AbgJIPrd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 11:47:33 -0400
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 099Fl85a031515;
        Sat, 10 Oct 2020 00:47:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 099Fl85a031515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602258429;
        bh=9BONNUlHhf6AE+4W2DzN6J68ojMcRVO/ShsdhtHkyp0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GrDgLVmVUiLbDO/hk0RVgv+GFj7HMOThHWoZ7BtDmYwwGnstTXL+XY+HqxNnBxlHd
         gLbcu5yzeictjqbcfMX8Lst7xlMnKSkYHqXom+VUwanVZINR9oquDj4j1UBGHr37Jz
         qd0UhtR0ifH6UMnlgrgdd4JmmUxPZy1xRe/dILvTmQureAIha9vyp7WT4R/tiRNlGW
         ATJMB2qlom0Z1Ssnq5eYm5gNu1vwWLBUHFtljucBi3qd1QNN0GK3DsSXXIMyVIR7fY
         oSwOLbzI9nPDM0r385HYE60rBP9bXR/JLT8NZmn+Z+TsyGCedJaQ+gxSI/Bhsj1gSy
         rmqYhbH4zD+tQ==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id h6so7488271pgk.4;
        Fri, 09 Oct 2020 08:47:09 -0700 (PDT)
X-Gm-Message-State: AOAM531XszrkKLYItaGeVkSqxSvg9RuvkQsol7+5/wr3dJ/eOm624hek
        i8qXRMfLJZFDFaKOuUOipx6U3XHEAGq5rI9lA+o=
X-Google-Smtp-Source: ABdhPJzqCLMraLOEhUmHp20XOxqk7furZLn5IGmqXBR7Y33xMcM50z2WKCkxvY4zxXgKg1ni/LKAeoq//lStBDHrj14=
X-Received: by 2002:a17:90b:1b12:: with SMTP id nu18mr4273823pjb.153.1602258428293;
 Fri, 09 Oct 2020 08:47:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200920222556.10002-1-guillem@hadrons.org> <20200920222556.10002-6-guillem@hadrons.org>
In-Reply-To: <20200920222556.10002-6-guillem@hadrons.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Oct 2020 00:46:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQu3VZZ4F7UkMTM5P86zaKqTeWSpXy=xjPafC5ceP+XTQ@mail.gmail.com>
Message-ID: <CAK7LNAQu3VZZ4F7UkMTM5P86zaKqTeWSpXy=xjPafC5ceP+XTQ@mail.gmail.com>
Subject: Re: [PATCH 5/7] builddeb: Enable rootless builds
To:     Guillem Jover <guillem@hadrons.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 21, 2020 at 7:48 AM Guillem Jover <guillem@hadrons.org> wrote:
>
> This makes it possible to build the Debian packages without requiring
> (pseudo-)root privileges, when the build drivers support this mode
> of operation.
>
> See-Also: /usr/share/doc/dpkg/rootless-builds.txt.gz
> Signed-off-by: Guillem Jover <guillem@hadrons.org>
> ---


Applied to linux-kbuild. Thanks.


>  scripts/package/builddeb | 9 +++++++--
>  scripts/package/mkdebian | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index b14abbe5afbb..d428c0945d4b 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -26,6 +26,7 @@ if_enabled_echo() {
>
>  create_package() {
>         local pname="$1" pdir="$2"
> +       local dpkg_deb_opts
>
>         mkdir -m 755 -p "$pdir/DEBIAN"
>         mkdir -p "$pdir/usr/share/doc/$pname"
> @@ -36,14 +37,18 @@ create_package() {
>                 | xargs -r0 md5sum > DEBIAN/md5sums"
>
>         # Fix ownership and permissions
> -       chown -R root:root "$pdir"
> +       if [ "$DEB_RULES_REQUIRES_ROOT" = "no" ]; then
> +               dpkg_deb_opts="--root-owner-group"
> +       else
> +               chown -R root:root "$pdir"
> +       fi
>         chmod -R go-w "$pdir"
>         # in case we are in a restrictive umask environment like 0077
>         chmod -R a+rX "$pdir"
>
>         # Create the package
>         dpkg-gencontrol -p$pname -P"$pdir"
> -       dpkg-deb ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
> +       dpkg-deb $dpkg_deb_opts ${KDEB_COMPRESS:+-Z$KDEB_COMPRESS} --build "$pdir" ..
>  }
>
>  deploy_kernel_headers () {
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index dae6c0ec0bd6..b98c382f967a 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -188,6 +188,7 @@ Source: $sourcename
>  Section: kernel
>  Priority: optional
>  Maintainer: $maintainer
> +Rules-Requires-Root: no
>  Build-Depends: bc, rsync, kmod, cpio, bison, flex | flex:native $extra_build_depends
>  Homepage: https://www.kernel.org/
>
> --
> 2.28.0.297.g1956fa8f8d
>


-- 
Best Regards
Masahiro Yamada
