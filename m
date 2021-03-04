Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A21A532CAE2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Mar 2021 04:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232671AbhCDDhB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Mar 2021 22:37:01 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:43488 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232582AbhCDDgd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Mar 2021 22:36:33 -0500
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1243Zbd8025528;
        Thu, 4 Mar 2021 12:35:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1243Zbd8025528
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614828937;
        bh=9xlyy3Pf9ec/TJfLoVRw1xhcBXuHNCdaC+6iRdmoiN0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ArOUi1Y+M6d+Cd5N8OVt3uLfBXKXkmKZ0t2HZBSHXScOiGOdfTTSi7RKUSofExYNq
         JNtpZl9uMKAcv1Lfg9VecWd0BoC73mYcW4/0tFwAShqwmJaz55vL1wCtzQ51mAKHoN
         jnhj1soXpnoxl6WiRGCJDpqiyNzJ84WxF/QeN0acRDIUQRkMyYwgTQNDbVAKWEDlpP
         t5zykTEGZzdKkg/WCwgc7ml/UFwItLxO2rl0hScQCs/xAY5+0CU19oC5cfCJXckfHb
         VcHlLriAtUFbhjL8N0snowTgTqpyKnUSaeaBn2wxVbNOi3xoWyJblDo8ykuBWwCCs5
         H1VrVAfyzYLqw==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id g20so15358631plo.2;
        Wed, 03 Mar 2021 19:35:37 -0800 (PST)
X-Gm-Message-State: AOAM531YJa+eHIcUHJR/bpp55QhLAwc0BTnwQoqeQzTx8Yaf2wGHxwOi
        Gbt4egQPfZltC56d+dc9JOm5Y1cp4ipasZduHDE=
X-Google-Smtp-Source: ABdhPJzHl3UvH2nM6cZC6OtFHZiuQomT5wqG7MZgVdfRTTscSwxjXACOEV4exOvk7bNRCaAmPUeWKI/fcOpRAfAd6Cs=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr2299989pji.87.1614828936712;
 Wed, 03 Mar 2021 19:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20210302221211.1620858-1-bero@lindev.ch>
In-Reply-To: <20210302221211.1620858-1-bero@lindev.ch>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Mar 2021 12:34:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARA3uKsW_G+gnCX6dvSwgXWzqgZON7pc6gBWdw9gimq1A@mail.gmail.com>
Message-ID: <CAK7LNARA3uKsW_G+gnCX6dvSwgXWzqgZON7pc6gBWdw9gimq1A@mail.gmail.com>
Subject: Re: [PATCH] Fix ld-version.sh script if LLD was built with LLD_VENDOR
To:     =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 4, 2021 at 9:18 AM Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch> =
wrote:
>
> If LLD was built with -DLLD_VENDOR=3D"xyz", ld.lld --version output
> will prefix LLD_VENDOR. Since LLD_VENDOR can contain spaces, the
> LLD identifier isn't guaranteed to be $2 either.
>
> Adjust the version checker to handle such versions of lld.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@lindev.ch>
> ---


Bernhard,

Could you senv v2
with the suggested code change?

Please make sure to add
linux-kbuild@vger.kernel.org
in the To:







>  scripts/ld-version.sh | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/scripts/ld-version.sh b/scripts/ld-version.sh
> index a463273509b5..4c042a306e22 100755
> --- a/scripts/ld-version.sh
> +++ b/scripts/ld-version.sh
> @@ -49,6 +49,18 @@ elif [ "$1" =3D LLD ]; then
>         min_version=3D$lld_min_version
>         name=3DLLD
>         disp_name=3DLLD
> +elif echo "$@" |grep -q ' LLD '; then
> +       # if LLD was built with -DLLD_VENDOR=3D"xyz", it ld.lld --version
> +       # says "xyz LLD [...]". Since LLD_VENDOR may contain spaces, we
> +       # don't know the exact position of "LLD" and the version info
> +       # at this point
> +       while [ "$1" !=3D "LLD" ]; do
> +               shift
> +       done
> +       version=3D$2
> +       min_version=3D$lld_min_version
> +       name=3DLLD
> +       disp_name=3DLLD
>  else
>         echo "$orig_args: unknown linker" >&2
>         exit 1
> --
> 2.30.1
>


--=20
Best Regards
Masahiro Yamada
