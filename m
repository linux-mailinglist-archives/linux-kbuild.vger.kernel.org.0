Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A1D288D3B
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Oct 2020 17:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389252AbgJIPrC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Oct 2020 11:47:02 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:18570 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389144AbgJIPrC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Oct 2020 11:47:02 -0400
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 099Fkdow031281;
        Sat, 10 Oct 2020 00:46:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 099Fkdow031281
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602258400;
        bh=uPHqCtH8kBQ7ooTjgeJwJmEs8QwVySn7ud+lvCOesSw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nrjlfyFUFt3jPXO/bY1d3TpLjsyP24l4TetE1EaFUPVS06e/LCFER9MbUClHx88Vp
         5l8W5hj6Pon+XwVWPsezWmHqLk7zbqISpwyoYJHdUKFqygwbIzgd37Wm3Xm9TGWc1s
         KSZDwFyI9DjtX1hYD12snc/09SphcSm1kXlwiAizLMcXzXNxmr4OytkPW9B8pb6+XT
         /U8BAjaJdLb7T26H7LbcMW2XU2AoRUUQLQeJL9bQUdHi3F1GT+ZyPpc7WOLgq+1Yoo
         VLWAgtqH8/7cgRIStTryQEVMPKV1L6H7E10KZcuZXdLk3QSCoyrD0Az6GMDevhZXzr
         sOzrvx/Itwavg==
X-Nifty-SrcIP: [209.85.214.173]
Received: by mail-pl1-f173.google.com with SMTP id h2so4627166pll.11;
        Fri, 09 Oct 2020 08:46:39 -0700 (PDT)
X-Gm-Message-State: AOAM532FQ26RVAGPTjbtQECQWQKPB2tB4vVexaMka3NEfxSDSSvJXXXz
        0hogTneEQ1FgAK46fsRSPYItUVLsAgwesKdHRwQ=
X-Google-Smtp-Source: ABdhPJzp5vEo3+xl6wEj6qPaVl4cErLF6gu0zKH8TjHr4KR1KbxQsEK0tRKbguCjgRqc6IOjP4MSAk+n7esBZWo2YHY=
X-Received: by 2002:a17:902:c3d4:b029:d3:df24:1619 with SMTP id
 j20-20020a170902c3d4b02900d3df241619mr12143028plj.1.1602258398929; Fri, 09
 Oct 2020 08:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200920222556.10002-1-guillem@hadrons.org> <20200920222556.10002-5-guillem@hadrons.org>
In-Reply-To: <20200920222556.10002-5-guillem@hadrons.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Oct 2020 00:46:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvmvBVa25=bgobTTnKr7VLOFPqEjtBMUiDRsPb97XMaw@mail.gmail.com>
Message-ID: <CAK7LNARvmvBVa25=bgobTTnKr7VLOFPqEjtBMUiDRsPb97XMaw@mail.gmail.com>
Subject: Re: [PATCH 4/7] builddeb: Add support for all required debian/rules targets
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
> These have been required by the Debian policy for a while, even though
> the tooling can detect and workaround their omission, but are a hard
> requirement when using rootless builds.
>


Applied to linux-kbuild. Thanks.


I added a little more explanation about why this patch is needed.

[masahiro:
The following Debian policy is particularly important for rootless builds:
"Both binary-* targets should depend on the build target, or on the
 appropriate build-arch or build-indep target, so that the package is
 built if it has not been already."
]






> Signed-off-by: Guillem Jover <guillem@hadrons.org>
> ---
>  scripts/package/mkdebian | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 69f2a6d7f009..dae6c0ec0bd6 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -231,11 +231,15 @@ cat <<EOF > debian/rules
>
>  srctree ?= .
>
> -build:
> +build-indep:
> +build-arch:
>         \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
>         KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile
>
> -binary-arch:
> +build: build-arch
> +
> +binary-indep:
> +binary-arch: build-arch
>         \$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
>         KBUILD_BUILD_VERSION=${revision} -f \$(srctree)/Makefile intdeb-pkg
>
> --
> 2.28.0.297.g1956fa8f8d
>


-- 
Best Regards
Masahiro Yamada
