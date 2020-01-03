Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 503E712F975
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 16:03:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgACPDp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 10:03:45 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24433 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727686AbgACPDp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 10:03:45 -0500
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 003F3dFi015419;
        Sat, 4 Jan 2020 00:03:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 003F3dFi015419
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578063820;
        bh=IhDXEO07k6n70uEE3QtqxuHGBeItquntGAry9r1k5rA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0KZ/seAv8LHTRu9ILzAYefyYQqH1Ym/5QwjUFB/cat47biwQsWvbyQbakgu/uTiF9
         stu9Gd8XP2Ipvg2+1Dtsx7Y0NNqAJpxh6a0NSftHg1y0tFD0CAlCwOk6iCcPOIbSlA
         7Ds0nrhYk7U882wbvdBeQ7yw5+k7QQbVhlsxoSqSU5LOv3/Um3/vDm9/BR2E6TqVOW
         C5LUR9onLyyaljNEGhZZ9dFtXj6s/KcRdwkuKQyc78NSrg7bwcF67ttRoFKfnkIa15
         Txt/oe105pAGiyXLrah53FgOQyWR4f/x479q6WC7NcS536kIdvD35KMfVB2xOjtejt
         9VZhQLcS6Hqyg==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id c14so13565844uaq.11;
        Fri, 03 Jan 2020 07:03:40 -0800 (PST)
X-Gm-Message-State: APjAAAUeGsKbzU9IvD1iJXHscZ1dfYmx2jBYlCDGm4JgLEqMF2W/fwuc
        /s7QAk2V2LVtNDMGkuKluRxdDcGfKBo/S3PwyX8=
X-Google-Smtp-Source: APXvYqySISfnCbUOlz7G2gjwAobqS5qjcexrFKOkKqFS2+6u8hudCn7xoGu/DvK6iqxIfyiIpv6d6DnoXseZm6jZjk8=
X-Received: by 2002:ab0:6509:: with SMTP id w9mr51611068uam.121.1578063819075;
 Fri, 03 Jan 2020 07:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20191230140747.50415-1-ardb@kernel.org>
In-Reply-To: <20191230140747.50415-1-ardb@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 4 Jan 2020 00:03:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVcLMPVECckdeGKgtgNy=48ONUDyKcbEF6wtvzaQ+jEQ@mail.gmail.com>
Message-ID: <CAK7LNASVcLMPVECckdeGKgtgNy=48ONUDyKcbEF6wtvzaQ+jEQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild/deb-pkg: annotate libelf-dev dependency as :native
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Riku Voipio <riku.voipio@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 30, 2019 at 11:07 PM Ard Biesheuvel <ardb@kernel.org> wrote:
>
> Cross compiling the x86 kernel on a non-x86 build machine produces
> the following error when CONFIG_UNWINDER_ORC is enabled, regardless
> of whether libelf-dev is installed or not.
>
>   dpkg-checkbuilddeps: error: Unmet build dependencies: libelf-dev
>   dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; aborting
>   dpkg-buildpackage: warning: (Use -d flag to override.)
>
> Since this is a build time dependency for a build tool, we need to
> depend on the native version of libelf-dev so add the appropriate
> annotation.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Applied to linux-kbuild/fixes.
Thanks.


> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 7c230016b08d..357dc56bcf30 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -136,7 +136,7 @@ mkdir -p debian/source/
>  echo "1.0" > debian/source/format
>
>  echo $debarch > debian/arch
> -extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev)"
> +extra_build_depends=", $(if_enabled_echo CONFIG_UNWINDER_ORC libelf-dev:native)"
>  extra_build_depends="$extra_build_depends, $(if_enabled_echo CONFIG_SYSTEM_TRUSTED_KEYRING libssl-dev:native)"
>
>  # Generate a simple changelog template
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
