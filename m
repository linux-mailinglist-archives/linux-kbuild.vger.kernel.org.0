Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3440F17067C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgBZRsf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:48:35 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:60357 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726151AbgBZRsf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:48:35 -0500
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01QHmRAn019310;
        Thu, 27 Feb 2020 02:48:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01QHmRAn019310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739308;
        bh=h9NrErXM+6+eBMvbXl3aSfyYmhnfosl79+blNXXgQf0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wd+jjP8exXG/Lm5ZPPw39GjYxteiB37EjHsalln/uFPHugkzkbbHmUQUJn6ZDozIL
         pDYj0XPTURnQb7tUM6rAGL5r/9gIV8bAya/pUKsi1tjF7Dd8NsS9yWk6B3muZsrI16
         +qhrD3koj75qQLArHOrk/u2DuE4dFZjESanrzyrPv9yHj9kAumkOwFZTtHd5h2yRGD
         isrljZdJoAOGSmJK8Yg1Zng2jFHVnnPlOuZUTpF5hXnyytdEdMJ4HOVuJYSHga/ThZ
         LPqurZ8tsCaS1lW1sRcAyjaOkP6nk3dx/2MipreaGcwyZo015/W4HoA+4Hp56SFDz1
         RhqOnNra/2Wxw==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id w142so661923vsw.9;
        Wed, 26 Feb 2020 09:48:28 -0800 (PST)
X-Gm-Message-State: APjAAAVHT9vrUflXBSotRfcjxsmunQ6AP6pzPZMgb2eLzFTlX7AMQt9P
        UKVpQdcTNdCXAHkklfYiBfSRWSAZ2t1Fh9nNiaY=
X-Google-Smtp-Source: APXvYqxw6zG20ytHyp9I1SkZfgSMyNrwk+pv/JYPoBdR2/Iiy7JXVxcnaARwIglQkMPPDtSSwQGU/ISlLD/w8h/BOhI=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr69691vsa.181.1582739307105;
 Wed, 26 Feb 2020 09:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-3-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-3-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 27 Feb 2020 02:47:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoBXfSpQQee1wjx6wXJ2Zeuit6K+qfZwKZBhOG1M1p1g@mail.gmail.com>
Message-ID: <CAK7LNAQoBXfSpQQee1wjx6wXJ2Zeuit6K+qfZwKZBhOG1M1p1g@mail.gmail.com>
Subject: Re: [PATCH 3/5] kbuild: add dtbs_check to PHONY
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 23, 2020 at 4:04 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The dtbs_check should be a phony target, but currently it is not
> specified so.
>
> 'make dtbs_check' works even if a file named 'dtbs_check' exists
> because it depends on another phony target, scripts_dtc, but we
> should not rely on it.
>
> Add dtbs_check to PHONY.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.


>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index aab38cb02b24..102710a9228c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
>  %.dtb: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> -PHONY += dtbs dtbs_install dt_binding_check
> +PHONY += dtbs dtbs_install dtbs_check dt_binding_check
>  dtbs dtbs_check: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
