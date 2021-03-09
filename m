Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD29332A77
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Mar 2021 16:31:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbhCIPbS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Mar 2021 10:31:18 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54958 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231819AbhCIPbN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Mar 2021 10:31:13 -0500
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 129FUcdn018321;
        Wed, 10 Mar 2021 00:30:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 129FUcdn018321
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1615303838;
        bh=duaVjO6ZT9w3WdK0Ejkic79qcK1IWR5fB/TZDf76FGA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qgM9NFwMiLY47ay6AZVLPl12PZ16k7tMoEC4jOirg2Q556CR9IVNEayLHEsX96iHg
         z2vIdkeX66iopgC/rKnB/V3drNeqJMZ02q7ZdkOykQwXe1fmQJdptphUd5U/FOzP8f
         O+SYC5sgdCw7huTniJEp5fWce79kEb8eocxZnzMYaISEj85T8uA5dzNvmLBQ15TSOe
         CrRyBA7GzDRGJc+gyebsJ+uYgmnSs3HYphNge77KDioK3/y4QIbeg2ygDcr6UznoZH
         wYKUVlcPe+dNIf/Y/B7Gtk5Hm4wcxJoOda3bfJWNQi149t5XuLzyGz+3HF5Py547JE
         RrAGzO0hDuGcg==
X-Nifty-SrcIP: [209.85.210.177]
Received: by mail-pf1-f177.google.com with SMTP id t85so4409241pfc.13;
        Tue, 09 Mar 2021 07:30:38 -0800 (PST)
X-Gm-Message-State: AOAM532P79lgEG4iqDUotU4Y/A8TaqvEr/R/H/UJ7p+5jBQzSRVkg6XY
        dgXZxdG/VdHO7D1H00xEsRtRaiqkn4n1A64m4/I=
X-Google-Smtp-Source: ABdhPJyLsPDnmD2y2htemNUFNTD3CKccrm7a07/ky8tR1jO6hHrNhdi3f+3km8/+c3tYh8GKZEI34XL1WNiXXYuYd64=
X-Received: by 2002:aa7:8d84:0:b029:1f8:3449:1bc6 with SMTP id
 i4-20020aa78d840000b02901f834491bc6mr6900507pfr.76.1615303835416; Tue, 09 Mar
 2021 07:30:35 -0800 (PST)
MIME-Version: 1.0
References: <20210302142614.505888-1-masahiroy@kernel.org>
In-Reply-To: <20210302142614.505888-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 10 Mar 2021 00:29:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNARcrGJnoBuzC8mSJqAXPQjdTt-bC8EZEwNBTCTb=o3yQA@mail.gmail.com>
Message-ID: <CAK7LNARcrGJnoBuzC8mSJqAXPQjdTt-bC8EZEwNBTCTb=o3yQA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: show warning for 'make headers_check'
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 2, 2021 at 11:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Since commit 7ecaf069da52 ("kbuild: move headers_check rule to
> usr/include/Makefile"), the headers_check target is no-op.
>
> This stub target is remaining here in case some scripts still invoke
> 'make headers_check'. In order to prompt people to remove stale code,
> show a noisy warning message if used. The stub will be really removed
> after the Linux 5.15 release.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



>
>  Makefile | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f9b54da2fca0..a3336d9b4a22 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1339,7 +1339,11 @@ headers: $(version_h) scripts_unifdef uapi-asm-generic archheaders archscripts
>  # Deprecated. It is no-op now.
>  PHONY += headers_check
>  headers_check:
> -       @:
> +       @echo >&2 "=================== WARNING ==================="
> +       @echo >&2 "Since Linux 5.5, 'make headers_check' is no-op,"
> +       @echo >&2 "and will be removed after Linux 5.15 release."
> +       @echo >&2 "Please remove headers_check from your scripts."
> +       @echo >&2 "==============================================="
>
>  ifdef CONFIG_HEADERS_INSTALL
>  prepare: headers
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
