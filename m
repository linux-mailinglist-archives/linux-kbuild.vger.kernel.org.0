Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA8B302EED
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Jan 2021 23:26:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732769AbhAYV6t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Jan 2021 16:58:49 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:16863 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733030AbhAYV4r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Jan 2021 16:56:47 -0500
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10PLtVuv010003;
        Tue, 26 Jan 2021 06:55:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10PLtVuv010003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611611732;
        bh=MveyNhX/Q55BK5TLqNfAZkfF+yHw/qazmwfJNs3YUFQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K1q4ibmji9cgyLczPPDOd/kGDPeGCQnoaywDs3oY2NNKJsfjHRAAd2qK1JXBfh+Y1
         VxUnxk6h08mNQG7v7rF+B4GlWFzBNYvhEMVQrw+PG2gylCkWuCDESv/3X9wU/Tr4z4
         UZaFvqgs3hDdpYsY3OWchNBscpqSVKSptywk4B/LtjHvEBBF348FVTYg8mp1pigcsd
         svz4zOybb9sdQal8cFns8vvHAVldiegt9xYUGIvSu1YCpZfsOo7SnaC2yZgOIamAt4
         apQSovqzXiBMaUyUlwU+b92rSiDTZMVcIoEinauPOjUYlnCKUVOlWBATnhGoS6z9Ws
         a3X+RAudXzf3A==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id kx7so440916pjb.2;
        Mon, 25 Jan 2021 13:55:31 -0800 (PST)
X-Gm-Message-State: AOAM530bsZXWj9ZXKGX26pLfYkJGv9WIiLfN2Lsi2CKEJZmlxtQF+aYQ
        6Ff4QalWK3cPHjmm8w6q4HcO8s88QZEnwxyH8+k=
X-Google-Smtp-Source: ABdhPJwhZb6x1b4UxKLwPs9cja3rm1ktMGQrT/2LvmPOdOPBPLNVG1bEO2b/KFoRx721rPIVTVOZ0zSXnvJGyvP+g3M=
X-Received: by 2002:a17:903:248e:b029:de:b329:ffaa with SMTP id
 p14-20020a170903248eb02900deb329ffaamr2685673plw.71.1611611730923; Mon, 25
 Jan 2021 13:55:30 -0800 (PST)
MIME-Version: 1.0
References: <20210123091631.716794-1-masahiroy@kernel.org>
In-Reply-To: <20210123091631.716794-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 06:54:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsEURRtV0Rcmm3KctA6je5yRfYAhe10Y4Gj5rbwULxNQ@mail.gmail.com>
Message-ID: <CAK7LNATsEURRtV0Rcmm3KctA6je5yRfYAhe10Y4Gj5rbwULxNQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: simplify GCC_PLUGINS enablement in dummy-tools/gcc
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Philipp Rudo <prudo@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 23, 2021 at 6:16 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> With commit 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev
> capability test") applied, this check can be way simpler because
> now scripts/gcc-plugins/Kconfig only checks plugin-version.h
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/dummy-tools/gcc | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> index 33487e99d83e..5c113cad5601 100755
> --- a/scripts/dummy-tools/gcc
> +++ b/scripts/dummy-tools/gcc
> @@ -75,16 +75,12 @@ if arg_contain -S "$@"; then
>         fi
>  fi
>
> -# For scripts/gcc-plugin.sh
> +# To set GCC_PLUGINS
>  if arg_contain -print-file-name=plugin "$@"; then
>         plugin_dir=$(mktemp -d)
>
> -       sed -n 's/.*#include "\(.*\)"/\1/p' $(dirname $0)/../gcc-plugins/gcc-common.h |
> -       while read header
> -       do
> -               mkdir -p $plugin_dir/include/$(dirname $header)
> -               touch $plugin_dir/include/$header
> -       done
> +       mkdir -p $plugin_dir/include
> +       touch $plugin_dir/include/plugin-version.h
>
>         echo $plugin_dir
>         exit 0
> --
> 2.27.0
>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
