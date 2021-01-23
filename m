Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E34D301561
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Jan 2021 14:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725275AbhAWNTo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 Jan 2021 08:19:44 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:34188 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbhAWNTk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 Jan 2021 08:19:40 -0500
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 10NDIaIu009979;
        Sat, 23 Jan 2021 22:18:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 10NDIaIu009979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611407917;
        bh=BsXABPqSsfwyI8JjxHLwT894VXh5W81H6GxbMMgw6hQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S2Qg/F3EiYOyVc/okgqTrK+eF0j68FztPPPSWDaK+ANqes9k5Pmx5h69JX+OcX2Vg
         TiYVJNbaaxsJivTjna1ta2kWzyMDw+P7S+zV81NpI9oQCs3nkPVX/ERyHHm2al1br5
         LLCiFBdnZ5KfeNhNK+M8tiCgIYm2nCgtC3EjPQAHnXbLCOJprqVOesWMd6bx/GXJRC
         elrJbYzDUqEh0SLqW3uWDvTcA/ysgprL13iNi5hZopS63+rIgJllrqUKlcB5LKX92U
         TugkODq+U9+MwStH1HDlqXIfCrC1qDNttlDnsiUv3d7SdWqt73hiXd8QaUk/gi2clK
         lxl+PtSEyll/g==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id q2so2095943plk.4;
        Sat, 23 Jan 2021 05:18:36 -0800 (PST)
X-Gm-Message-State: AOAM530lMffXERp70eB/xTtwf1MOSYHpvL5vrcsueKLEc2MqWfikcynV
        IE9yphhT7VZ4soMjaUzAR0s65jqW0qsye2iAEQc=
X-Google-Smtp-Source: ABdhPJx2aWPg0u0hq0ZmOms1hWXB+FffylGFd92yC5K4zLQukQi3+ZDjGYOUeQ/5ybwiP6AzlhwPABZu9k9e6YVN6Ow=
X-Received: by 2002:a17:902:ed93:b029:de:84d2:9ce1 with SMTP id
 e19-20020a170902ed93b02900de84d29ce1mr56550plj.47.1611407916180; Sat, 23 Jan
 2021 05:18:36 -0800 (PST)
MIME-Version: 1.0
References: <1611338653-175404-1-git-send-email-r.karszniewicz@phytec.de>
In-Reply-To: <1611338653-175404-1-git-send-email-r.karszniewicz@phytec.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 Jan 2021 22:17:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNARn6yhYqA7bm_ExLH5HVvz0gsW_QonX-LXuqYP6q4SDeg@mail.gmail.com>
Message-ID: <CAK7LNARn6yhYqA7bm_ExLH5HVvz0gsW_QonX-LXuqYP6q4SDeg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/Kbuild: Remove references to gcc-plugin.sh
To:     Robert Karszniewicz <r.karszniewicz@phytec.de>
Cc:     Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Philipp Rudo <prudo@linux.ibm.com>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Robert Karszniewicz <avoidr@posteo.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 23, 2021 at 3:19 AM Robert Karszniewicz
<r.karszniewicz@phytec.de> wrote:
>
> gcc-plugin.sh has been removed in commit
> 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test").
>
> Signed-off-by: Robert Karszniewicz <r.karszniewicz@phytec.de>
> ---
>  Documentation/kbuild/gcc-plugins.rst |  6 ------
>  scripts/dummy-tools/gcc              | 15 ---------------
>  2 files changed, 21 deletions(-)
>
> diff --git a/Documentation/kbuild/gcc-plugins.rst b/Documentation/kbuild/gcc-plugins.rst
> index 4b1c10f88e30..63379d0150e3 100644
> --- a/Documentation/kbuild/gcc-plugins.rst
> +++ b/Documentation/kbuild/gcc-plugins.rst
> @@ -47,12 +47,6 @@ Files
>         This is a compatibility header for GCC plugins.
>         It should be always included instead of individual gcc headers.
>
> -**$(src)/scripts/gcc-plugin.sh**
> -
> -       This script checks the availability of the included headers in
> -       gcc-common.h and chooses the proper host compiler to build the plugins
> -       (gcc-4.7 can be built by either gcc or g++).
> -
>  **$(src)/scripts/gcc-plugins/gcc-generate-gimple-pass.h,
>  $(src)/scripts/gcc-plugins/gcc-generate-ipa-pass.h,
>  $(src)/scripts/gcc-plugins/gcc-generate-simple_ipa-pass.h,
> diff --git a/scripts/dummy-tools/gcc b/scripts/dummy-tools/gcc
> index 33487e99d83e..a484de576e6f 100755
> --- a/scripts/dummy-tools/gcc
> +++ b/scripts/dummy-tools/gcc
> @@ -74,18 +74,3 @@ if arg_contain -S "$@"; then
>                 exit 0
>         fi
>  fi
> -
> -# For scripts/gcc-plugin.sh
> -if arg_contain -print-file-name=plugin "$@"; then
> -       plugin_dir=$(mktemp -d)
> -
> -       sed -n 's/.*#include "\(.*\)"/\1/p' $(dirname $0)/../gcc-plugins/gcc-common.h |
> -       while read header
> -       do
> -               mkdir -p $plugin_dir/include/$(dirname $header)
> -               touch $plugin_dir/include/$header
> -       done
> -
> -       echo $plugin_dir
> -       exit 0
> -fi


Well, it is wrong to remove this hunk entirely.
It would break the ability to enable GCC_PLUGINS.

I will simplify this part.
https://lore.kernel.org/patchwork/patch/1369968/


I took the only change to Documentation/kbuild/gcc-plugins.rst
from your patch but this document contains more stale info.

https://lore.kernel.org/patchwork/patch/1370008/


-- 
Best Regards
Masahiro Yamada
