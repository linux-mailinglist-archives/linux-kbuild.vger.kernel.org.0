Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28D5D14F689
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 Feb 2020 06:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725936AbgBAFMD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 Feb 2020 00:12:03 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:33998 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgBAFMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 00:12:03 -0500
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0115BqGs026208;
        Sat, 1 Feb 2020 14:11:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0115BqGs026208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1580533913;
        bh=k3awRdRyUr50VQbTPW9xxsK10pFPtgdyLvyNd7y8mtU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HrFKXkVlck8UnrDMX1J53oO/lhLJQA8BVauWgLJs3h5NhUZ6jXSpeVIP43EApmw2O
         49kaMV5AL3gyVLswmaPDN3rSvRtfpll18Q/azZToWROTCIKael8QWjIPK4qKYJelJe
         TM1gNJeLf9jELIy0ajvb+bTCT6WYQw765k+h0lnXNlH7GUk9SM6nUNSqYCDpnS6YxE
         rQ2kqHeSVLVslYS4Q+r+igCmVi4GsJXgGME/e1BOjwPyLoTkwFVzZuzR3fGKlCo1uC
         ef0THq8AzHtUlou9ggeAhpd0Pcty91WpbnxTgQ/ePZqp9NL2QDLkOdzuu7kLkYHNuU
         Z4OqUXrfM1UyA==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id w4so1092285vkd.5;
        Fri, 31 Jan 2020 21:11:52 -0800 (PST)
X-Gm-Message-State: APjAAAUtngLu3wWPdP60q3dV+Xl+x4kpL53rEWLZarYoe02VwSOXlTCV
        KOmV5jcThA3sdbAVAGK5ha0rgl1wzkX+6gg/LDI=
X-Google-Smtp-Source: APXvYqxgHs3TqjGGY3+bVXhkiITm9fOrkq2Zo6Tjso6PAzFx16jzKzXG1iENz06uZqk5SAj5oUu/EcrTjG9MEwXzpoM=
X-Received: by 2002:a1f:8cd5:: with SMTP id o204mr8415827vkd.66.1580533911481;
 Fri, 31 Jan 2020 21:11:51 -0800 (PST)
MIME-Version: 1.0
References: <20200201050311.3458-1-masahiroy@kernel.org>
In-Reply-To: <20200201050311.3458-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 1 Feb 2020 14:11:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNATTZGrJmh0CsR8eJUo3b13T9sjZPV4dh+2fCSZ9F4U0YA@mail.gmail.com>
Message-ID: <CAK7LNATTZGrJmh0CsR8eJUo3b13T9sjZPV4dh+2fCSZ9F4U0YA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: fix broken dependency in randconfig-generated .config
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Feb 1, 2020 at 2:03 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Running randconfig on arm64 using KCONFIG_SEED=0x40C5E904 (e.g. on v5.5)
> produces the .config with CONFIG_EFI=y and CONFIG_CPU_BIG_ENDIAN=y,
> which does not meet the !CONFIG_CPU_BIG_ENDIAN dependency.
>
> This is because the user choice for CONFIG_CPU_LITTLE_ENDIAN vs
> CONFIG_CPU_BIG_ENDIAN is set by randomize_choice_values() after the
> value of CONFIG_EFI is calculated.
>
> When this happens, the has_changed flag should be set.
>
> Currently, it takes the result from the last iteration. It should
> accumulate all the results of the loop.
>
> Reported-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Maybe, this could be tagged:

Fixes: 3b9a19e08960 ("kconfig: loop as long as we changed some symbols
in randconfig")





>  scripts/kconfig/confdata.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 99f2418baa6c..eb1efa3abdee 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -1353,7 +1353,7 @@ bool conf_set_all_new_symbols(enum conf_def_mode mode)
>
>                 sym_calc_value(csym);
>                 if (mode == def_random)
> -                       has_changed = randomize_choice_values(csym);
> +                       has_changed |= randomize_choice_values(csym);
>                 else {
>                         set_all_choice_values(csym);
>                         has_changed = true;
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
