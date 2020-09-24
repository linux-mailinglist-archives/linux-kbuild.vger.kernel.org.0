Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12AA8277793
	for <lists+linux-kbuild@lfdr.de>; Thu, 24 Sep 2020 19:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727364AbgIXRTR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 24 Sep 2020 13:19:17 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49960 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727216AbgIXRTR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 24 Sep 2020 13:19:17 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08OHIv4W025975;
        Fri, 25 Sep 2020 02:18:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08OHIv4W025975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600967938;
        bh=BfAZ+Kz7r7qkfo61OgHPAKHCGchfZtW7vHgqjvU1wtA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gzUzODYzGZROgaPKme/ZxGF1T1p2u0+Gk0Icanw35xumvgnhXNEPvfTneb0XOTaKO
         R1bxDdSTcjE4who+FJRA8ue3SKIfB8kFsfRWtRY87QNBsbjSq6zL4ZcD4wu65rZJ2M
         D9VYNlJiDP1uOetE1wCmPD//IiwTTQKH1IQb6Mah5RuLd0YJsbt5fA1UPXrmzTFvP6
         OTpXsPuV9FIEUk1knJ4K37DMqrSy2xuhxOzGEcQRetTWRsLmDQ2rKvk/PT9EjEJNI2
         +jjAZBjkqAHiVKIaieOAxKSPqrPurdeQL2WUFIE2J8oVPfH7tVmFEZiDeVotu7elbo
         /U7x4O2LKHWNA==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id md22so73093pjb.0;
        Thu, 24 Sep 2020 10:18:58 -0700 (PDT)
X-Gm-Message-State: AOAM530rVAYnEPqRf/ygvdKIWiKOpuDZLfbmUDigtkHHi/LAeSnzRWHr
        9zqXB46lXAzVISa8R0rBovf/D/vuPaGWUCm1I/8=
X-Google-Smtp-Source: ABdhPJyppqf08NAt+YyrDOfGu2DQLKWibZWlzvtz71d9DDV+hjcfQ33wSQ3LVzss7uz/MdI4Ehb6/qbdxTyg9shqbC4=
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr187544pjb.153.1600967937296;
 Thu, 24 Sep 2020 10:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200922155341.17906-1-James.Bottomley@HansenPartnership.com> <20200922155341.17906-2-James.Bottomley@HansenPartnership.com>
In-Reply-To: <20200922155341.17906-2-James.Bottomley@HansenPartnership.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 25 Sep 2020 02:18:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNATg2MG4xSoHiEa5CvB0x+LYS9ZOGKWz0ytBhBRcvCogoQ@mail.gmail.com>
Message-ID: <CAK7LNATg2MG4xSoHiEa5CvB0x+LYS9ZOGKWz0ytBhBRcvCogoQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] Makefile.build: Add an explicit error for missing
 ASN.1 compiler
To:     James Bottomley <James.Bottomley@hansenpartnership.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 23, 2020 at 12:55 AM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> The current dependency rules mean that the build breaks if the ASN.1
> compiler is required but CONFIG_ASN1 isn't set.  However, it isn't
> obvious from the error message about missing files what the actual
> problem is, so make the build system give an explicit error.
>
> Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/Makefile.build | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a467b9323442..bca7003beac8 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -382,6 +382,11 @@ quiet_cmd_asn1_compiler = ASN.1   $(basename $@).[ch]
>        cmd_asn1_compiler = $(objtree)/scripts/asn1_compiler $< \
>                                 $(basename $@).c $(basename $@).h
>
> +ifndef CONFIG_ASN1
> +$(objtree)/scripts/asn1_compiler:
> +       $(error CONFIG_ASN1 must be defined for the asn1_compiler)
> +endif
> +
>  $(obj)/%.asn1.c $(obj)/%.asn1.h: $(src)/%.asn1 $(objtree)/scripts/asn1_compiler
>         $(call cmd,asn1_compiler)
>
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
