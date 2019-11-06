Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AA18F0BE9
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2019 03:14:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730400AbfKFCOJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Nov 2019 21:14:09 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:29798 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbfKFCOJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:14:09 -0500
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id xA62DtoY011254;
        Wed, 6 Nov 2019 11:13:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com xA62DtoY011254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1573006436;
        bh=ZJeUWCediQ+i2mdCc9KzxgDJTysch34c1GmQ6o00QYg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VnoKrAySnF/jNA54RKo/nSGhYjBvwXGenML9Vjks6X2tk2eMMyhHeb+tuYbBwGJcg
         lL69zJ77HZp3Vt0K68UfGPpPZGTeRScAVLPYrhcwmCQSXyZaWTUZyvRO4ka5bnGVBb
         M4dDICojgHLN4phioYlT1sQLtf61sp4sfnHsPfiAbc01cZ1H+7p9cA+YWh7T4zob5C
         2BK2Yp8ZTqwR/WKKDE+eY9U17QPj6Z5gGl2WbWrbEfe657OMGXzgNpr0iwcxbbGQcF
         3mPHQd3nR/y6tR17M0iKu1tVE0/pH48ghVq5+8PKRPbfxddhkPPcQ0/7ZJM9Xlq1jN
         rPyoOiJH5lcWg==
X-Nifty-SrcIP: [209.85.222.52]
Received: by mail-ua1-f52.google.com with SMTP id 31so3145081uas.9;
        Tue, 05 Nov 2019 18:13:56 -0800 (PST)
X-Gm-Message-State: APjAAAWMnxWsh6uWhres+8JVQNO2wy2yn3ETqYTbnD7WzEyVR8Zd04QT
        p9osJd1hKNolkvCezpMN4lN0cG56ky7VdM3R3Fs=
X-Google-Smtp-Source: APXvYqx1mdIvXS9W6ici23UjeJXZJ9YQwf51cWIuWHpx6/tDLnQF/qf1Ljh6OJOnLusvezWiLazDAuOfj0xmHC5bl9Y=
X-Received: by 2002:a9f:262d:: with SMTP id 42mr128031uag.109.1573006434970;
 Tue, 05 Nov 2019 18:13:54 -0800 (PST)
MIME-Version: 1.0
References: <20191104131144.14333-1-mcroce@redhat.com>
In-Reply-To: <20191104131144.14333-1-mcroce@redhat.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 6 Nov 2019 11:13:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATmSxVkmoepVugds0x0fU+N=xE20Pfb28FG_eUb7XwoMA@mail.gmail.com>
Message-ID: <CAK7LNATmSxVkmoepVugds0x0fU+N=xE20Pfb28FG_eUb7XwoMA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Add make dir-pkg build option
To:     Matteo Croce <mcroce@redhat.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 4, 2019 at 10:12 PM Matteo Croce <mcroce@redhat.com> wrote:
>
> Add a 'dir-pkg' target which just creates the same directory structures
> as in tar-pkg, but doesn't package anything.
> Useful when the user wants to copy the kernel tree on a machine using
> ssh, rsync or whatever.
>
> Signed-off-by: Matteo Croce <mcroce@redhat.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/Makefile.package | 3 ++-
>  scripts/package/buildtar | 8 ++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 56eadcc48d46..36600ad1d5e6 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -103,7 +103,7 @@ snap-pkg:
>
>  # tarball targets
>  # ---------------------------------------------------------------------------
> -tar-pkgs := tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
> +tar-pkgs := dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
>  PHONY += $(tar-pkgs)
>  $(tar-pkgs):
>         $(MAKE) -f $(srctree)/Makefile
> @@ -147,6 +147,7 @@ help:
>         @echo '  deb-pkg             - Build both source and binary deb kernel packages'
>         @echo '  bindeb-pkg          - Build only the binary kernel deb package'
>         @echo '  snap-pkg            - Build only the binary kernel snap package (will connect to external hosts)'
> +       @echo '  dir-pkg             - Build the kernel as a plain directory structure'
>         @echo '  tar-pkg             - Build the kernel as an uncompressed tarball'
>         @echo '  targz-pkg           - Build the kernel as a gzip compressed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compressed tarball'
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 2f66c81e4021..77c7caefede1 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -2,7 +2,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>
>  #
> -# buildtar 0.0.4
> +# buildtar 0.0.5
>  #
>  # (C) 2004-2006 by Jan-Benedict Glaw <jbglaw@lug-owl.de>
>  #
> @@ -24,7 +24,7 @@ tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
>  # Figure out how to compress, if requested at all
>  #
>  case "${1}" in
> -       tar-pkg)
> +       dir-pkg|tar-pkg)
>                 opts=
>                 ;;
>         targz-pkg)
> @@ -125,6 +125,10 @@ case "${ARCH}" in
>                 ;;
>  esac
>
> +if [ "${1}" = dir-pkg ]; then
> +       echo "Kernel tree successfully created in $tmpdir"
> +       exit 0
> +fi
>
>  #
>  # Create the tarball
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
