Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A1E3AA86A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jun 2021 03:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbhFQBIu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Jun 2021 21:08:50 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64184 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhFQBIu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jun 2021 21:08:50 -0400
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 15H16Lwn013084;
        Thu, 17 Jun 2021 10:06:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 15H16Lwn013084
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1623891982;
        bh=2Y38ZCk0TETfIc0Ql7zsn6BJq/4SuRpneVn+LfAqnv0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NbiMgU/vZoyzx6xr2nR4YCWoYCeIwbccFI5/yxS6auSTwEnjVNKVe9VtG6bfc7OSP
         oxd2dtQgE64/NL8SOMZFLlk1O0uqgs79kO+vF7KRok57M26DaAkSMGwvL+Pn4wGjx8
         +AGAaiF3cYd2uJkP+rmbOvAAEy2emxj75XKNNgcoxwgcK10fge5xTl4CPHVpw29tlM
         LM7UHCYOVaNDRnGPIKIWyQrtpVA2TGpRwFP4svt/rouRX2eSjuAfNnO9MK3ME1pE5T
         yhM5ipz2fjPvzMmfNkfq4Hmxg5FZW0cZMpDpLmFNx3/Qhq4+I/pcyo22DXDVmHI9/P
         sYmKegZgBbEOw==
X-Nifty-SrcIP: [209.85.210.182]
Received: by mail-pf1-f182.google.com with SMTP id q25so3616678pfh.7;
        Wed, 16 Jun 2021 18:06:22 -0700 (PDT)
X-Gm-Message-State: AOAM533178FBd8yNZmV3ov3KFYUMx4sSZ6j8SWIjVRf8KhcO5N44hXlQ
        zW7ALT0LT+jEZOsETquFIjeJIhJ5yyB/fbHLjfA=
X-Google-Smtp-Source: ABdhPJzp0lHNc1wg7g5jthFWFycjy4dyKSQccg5ummzfvosqJuqyldZDOD4o2kgBuywyPT5n1Wm6rjiixvBY+flEK5c=
X-Received: by 2002:a63:d403:: with SMTP id a3mr2450010pgh.175.1623891981526;
 Wed, 16 Jun 2021 18:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210607140206.38131-1-broonie@kernel.org>
In-Reply-To: <20210607140206.38131-1-broonie@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 17 Jun 2021 10:05:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT7cy8Kn1w2ceRdH_O4P8PMut4Bivcyas88gVa+wu7HGA@mail.gmail.com>
Message-ID: <CAK7LNAT7cy8Kn1w2ceRdH_O4P8PMut4Bivcyas88gVa+wu7HGA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: modpost: Explicitly warn about unprototyped symbols
To:     Mark Brown <broonie@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 7, 2021 at 11:02 PM Mark Brown <broonie@kernel.org> wrote:
>
> One common cause of modpost version generation failures is a failure to
> prototype exported assembly functions - the tooling requires this for
> exported functions even if they are not and should not be called from C
> code in order to do the version mangling for symbols. Unfortunately the
> error message is currently rather abstruse, simply saying that "version
> generation failed" and even diving into the code doesn't directly show
> what's going on since there's several steps between the problem and it
> being observed.
>
> Provide an explicit hint as to the likely cause of a version generation
> failure to help anyone who runs into this in future more readily diagnose
> and fix the problem.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied to linux-kbuild. Thanks.


>
> v2:
>  - Reword and reformat error message.
>  - Fix duplicated is.
>
>  scripts/mod/modpost.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3e623ccc020b..270a7df898e2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -660,8 +660,11 @@ static void handle_modversion(const struct module *mod,
>         unsigned int crc;
>
>         if (sym->st_shndx == SHN_UNDEF) {
> -               warn("EXPORT symbol \"%s\" [%s%s] version generation failed, symbol will not be versioned.\n",
> -                    symname, mod->name, mod->is_vmlinux ? "" : ".ko");
> +               warn("EXPORT symbol \"%s\" [%s%s] version ...\n"
> +                    "Is \"%s\" prototyped in <asm/asm-prototypes.h>?\n",
> +                    symname, mod->name, mod->is_vmlinux ? "" : ".ko",
> +                    symname);
> +
>                 return;
>         }
>
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
