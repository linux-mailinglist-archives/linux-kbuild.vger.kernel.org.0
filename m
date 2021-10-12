Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDFF9429B52
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Oct 2021 04:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhJLCN7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Oct 2021 22:13:59 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:62931 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbhJLCN7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Oct 2021 22:13:59 -0400
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 19C2BTTZ009734;
        Tue, 12 Oct 2021 11:11:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 19C2BTTZ009734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634004690;
        bh=eGW6T4VJlT52JcnIFl4q6FgJvMhLi7Ij7bqrkiVx/Sk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0YnaHWPlQVOJvbJwUUGUFQ4bBHOVpbi3em9M80y45paEP25PO/5ASR4YagahFt+YM
         lJuavrlYvlia5mAG047OGuwNvCx8a2R8MyJSOIAcLKYgJKxrnF7Nrkb4S/xpVxrBhV
         y+1iZwIXMnSZCG+DxnFigeiXlH12u7fGFtzWWZKNTvPvK3gVJtSWzPDgUhaJs/pjPW
         evG2j4zbCKEJIHypXgVgZ/cPJZGSkoEPek6IEV7eVEwE+2HmXoeyDAwiIJUAcU9BT1
         ZjZBjA6E/vW2Yqgpf4qWQLkyLCEgOPPC/zO8xqJrMwnLcFTD6pbzpF8fpKBNYsffaU
         Aox759g8L2dTA==
X-Nifty-SrcIP: [209.85.216.49]
Received: by mail-pj1-f49.google.com with SMTP id ls14-20020a17090b350e00b001a00e2251c8so1348832pjb.4;
        Mon, 11 Oct 2021 19:11:30 -0700 (PDT)
X-Gm-Message-State: AOAM532gXpUZx+fg1trpx7IwpMi8/PtKFmLPLUP9+Ig4ObPAjRX2UjOm
        eW+7fy0MOwUM0GYiDwOCQvxvu9glDPvXE92yOvk=
X-Google-Smtp-Source: ABdhPJzxBTT/SvWzURVQRplBhLfCCDo3bYohh30l2YZgPu6I/gv0RAHjVZH9g4t9sPFmi4NBAQFbHySaHXKYyLKFScc=
X-Received: by 2002:a17:902:f703:b029:12c:982:c9ae with SMTP id
 h3-20020a170902f703b029012c0982c9aemr27861383plo.20.1634004689469; Mon, 11
 Oct 2021 19:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211008113800.85155-1-pawel@jasiak.dev>
In-Reply-To: <20211008113800.85155-1-pawel@jasiak.dev>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 Oct 2021 11:10:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASH2EaZ=SyxQ-xhmUn_0GXuvOJDRU3e=LVvTLdYruM=Bw@mail.gmail.com>
Message-ID: <CAK7LNASH2EaZ=SyxQ-xhmUn_0GXuvOJDRU3e=LVvTLdYruM=Bw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Add make tarzst-pkg build option
To:     =?UTF-8?Q?Pawe=C5=82_Jasiak?= <pawel@jasiak.dev>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Oct 8, 2021 at 8:48 PM Pawe=C5=82 Jasiak <pawel@jasiak.dev> wrote:
>
> Add tarzst-pkg and perf-tarzst-src-pkg targets to build zstd compressed
> tarballs.
>
> Signed-off-by: Pawe=C5=82 Jasiak <pawel@jasiak.dev>


Applied to linux-kbuild. Thanks.


> ---
>  scripts/Makefile.package | 10 +++++++---
>  scripts/package/buildtar |  4 ++++
>  2 files changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index b74c65284fb2..77b612183c08 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -103,7 +103,7 @@ snap-pkg:
>
>  # tarball targets
>  # ----------------------------------------------------------------------=
-----
> -tar-pkgs :=3D dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg
> +tar-pkgs :=3D dir-pkg tar-pkg targz-pkg tarbz2-pkg tarxz-pkg tarzst-pkg
>  PHONY +=3D $(tar-pkgs)
>  $(tar-pkgs):
>         $(MAKE) -f $(srctree)/Makefile
> @@ -130,10 +130,12 @@ $(if $(findstring tar-src,$@),,                    =
                 \
>  $(if $(findstring bz2,$@),$(KBZIP2),                                 \
>  $(if $(findstring gz,$@),$(KGZIP),                                  \
>  $(if $(findstring xz,$@),$(XZ),                                     \
> -$(error unknown target $@))))                                       \
> +$(if $(findstring zst,$@),$(ZSTD),                                  \
> +$(error unknown target $@)))))                                      \
>         -f -9 $(perf-tar).tar)
>
> -perf-tar-pkgs :=3D perf-tar-src-pkg perf-targz-src-pkg perf-tarbz2-src-p=
kg perf-tarxz-src-pkg
> +perf-tar-pkgs :=3D perf-tar-src-pkg perf-targz-src-pkg perf-tarbz2-src-p=
kg \
> +                perf-tarxz-src-pkg perf-tarzst-src-pkg
>  PHONY +=3D $(perf-tar-pkgs)
>  $(perf-tar-pkgs):
>         $(call cmd,perf_tar)
> @@ -153,9 +155,11 @@ help:
>         @echo '  targz-pkg           - Build the kernel as a gzip compres=
sed tarball'
>         @echo '  tarbz2-pkg          - Build the kernel as a bzip2 compre=
ssed tarball'
>         @echo '  tarxz-pkg           - Build the kernel as a xz compresse=
d tarball'
> +       @echo '  tarzst-pkg          - Build the kernel as a zstd compres=
sed tarball'
>         @echo '  perf-tar-src-pkg    - Build $(perf-tar).tar source tarba=
ll'
>         @echo '  perf-targz-src-pkg  - Build $(perf-tar).tar.gz source ta=
rball'
>         @echo '  perf-tarbz2-src-pkg - Build $(perf-tar).tar.bz2 source t=
arball'
>         @echo '  perf-tarxz-src-pkg  - Build $(perf-tar).tar.xz source ta=
rball'
> +       @echo '  perf-tarzst-src-pkg - Build $(perf-tar).tar.zst source t=
arball'
>
>  .PHONY: $(PHONY)
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 221aa7df008d..cb54c7f1aa80 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -39,6 +39,10 @@ case "${1}" in
>                 opts=3D"-I ${XZ}"
>                 tarball=3D${tarball}.xz
>                 ;;
> +       tarzst-pkg)
> +               opts=3D"-I ${ZSTD}"
> +               tarball=3D${tarball}.zst
> +               ;;
>         *)
>                 echo "Unknown tarball target \"${1}\" requested, please a=
dd it to ${0}." >&2
>                 exit 1
> --
> 2.33.0
>


--=20
Best Regards
Masahiro Yamada
