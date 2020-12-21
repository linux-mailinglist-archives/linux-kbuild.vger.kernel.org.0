Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADCD2DF891
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 06:16:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgLUFP5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 00:15:57 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46646 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726160AbgLUFP4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 00:15:56 -0500
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0BL5EeSX023952;
        Mon, 21 Dec 2020 14:14:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0BL5EeSX023952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608527681;
        bh=ec7zDCE2Dssaie5MJIXt/edY86azQA8fYkqB1mvUQRU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nDVovfx5qMpZt3zefhtaPGUOjQnfOm/YNvgykE0XFWP7RRIV+Cx4efNJKyN54UAvi
         t1u2VR8CwGBMz3x5kZC5oit5ID+vDaKtohduI82tGn9DfqKhiYdBCVhwr7Gut1Q2Rk
         ZGYSvENnV3w936KeVwaJy3jl/5hZgkQ/IneWqn0Wcx1URKBDx0O6mRKf5oPBKUtfqx
         ZnWhy2e0qeGu6tRrscrMkoKduyvLMtehrzx5tUXViOVyMqKzN1TfFQOVyHnDVjNywI
         zmz9titAC5EWmNR+XbwAe7kpnTC25ldhXKts7bWG0nWMvhOoisIhIeKy62BHnjOc40
         An9rtoj0xRBUQ==
X-Nifty-SrcIP: [209.85.210.175]
Received: by mail-pf1-f175.google.com with SMTP id t22so5821109pfl.3;
        Sun, 20 Dec 2020 21:14:41 -0800 (PST)
X-Gm-Message-State: AOAM533z5/ZQadyleJKKaVF/AelF7Q7ucNF+jZZhINOWT72/XUpWKVY8
        yg/ljoi4+H0L8cNmZ+3mGH2/ETMykDEq6/Z+ewE=
X-Google-Smtp-Source: ABdhPJwMPKvV6Pfj0mrBv31yEQ/gpjj5UdGwLmSKck4pffiVQMK5iIh27Qu0P+H9ae/P9zjIHaDlnZvrJFHjxgaA2P0=
X-Received: by 2002:aa7:9501:0:b029:155:3b11:d5c4 with SMTP id
 b1-20020aa795010000b02901553b11d5c4mr13893878pfp.76.1608527680375; Sun, 20
 Dec 2020 21:14:40 -0800 (PST)
MIME-Version: 1.0
References: <20201219162456.19790-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201219162456.19790-1-lukas.bulwahn@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 21 Dec 2020 14:14:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStP=W5fjO6RMck3+07VKqopBgYgACjryjEwin9kiABWA@mail.gmail.com>
Message-ID: <CAK7LNAStP=W5fjO6RMck3+07VKqopBgYgACjryjEwin9kiABWA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust GCC PLUGINS after gcc-plugin.sh removal
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org, Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 20, 2020 at 1:25 AM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
>
> Commit 1e860048c53e ("gcc-plugins: simplify GCC plugin-dev capability test")
> removed ./scripts/gcc-plugin.sh, but missed to adjust MAINTAINERS.
>
> Hence, ./scripts/get_maintainers.pl --self-test=patterns warns:
>
>   warning: no file matches    F:    scripts/gcc-plugin.sh
>
> Adjust entries in GGC PLUGINS section after this file removal.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>


Applied to linux-kbuild. Thanks.



> ---
> applies cleanly on next-20201218
>
> Masahiro-san, please pick this minor cleanup patch on your -next tree.
>
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f5eafee83bc6..fd3b06636c5b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7371,7 +7371,6 @@ L:        linux-hardening@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/kbuild/gcc-plugins.rst
>  F:     scripts/Makefile.gcc-plugins
> -F:     scripts/gcc-plugin.sh
>  F:     scripts/gcc-plugins/
>
>  GCOV BASED KERNEL PROFILING
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
