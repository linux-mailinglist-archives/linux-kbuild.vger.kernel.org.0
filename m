Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C8E170683
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 18:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgBZRtF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 12:49:05 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:61090 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBZRtF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 12:49:05 -0500
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01QHmoRs019557;
        Thu, 27 Feb 2020 02:48:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01QHmoRs019557
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582739331;
        bh=1/ZhEn3pZ4+ffU0OSvfYlMG4vlP59VfIW5+kOBMX3+4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=yLzouqQDFK7uYAF+jJ8jIowv3kAb14sgQ28WvibY9ckxZrMPtngEZLLPzsYVLBxB2
         FCUu1p8EITbysIWpl1Vfa9XbYR754Uxn8rkwuPUyL5H91fplLsMpr1XAtdQOpxBEWS
         ZiuYuhAjlnnYZPKf5SSliJPUur58hDuC3W6tSy0w2f2+jEe3GBiPV4vSboklYijMrq
         D2YDNdJXlo2id3/S8ZhzGTFVjG0i9QG58jVsJAnU7BM9EU/veQFnpogZ5ez5BvZZQc
         f1IzRlnazrGwOyHi3SQtXr+mx1nnFGkY+bHUAvhR3T9l+ct3uGH2SXjIBSov6vICPP
         +cq92Sj8qBueg==
X-Nifty-SrcIP: [209.85.221.169]
Received: by mail-vk1-f169.google.com with SMTP id c15so1038903vko.9;
        Wed, 26 Feb 2020 09:48:51 -0800 (PST)
X-Gm-Message-State: APjAAAXfFqjJPX2oaP0YuQ3cfHqO9F8ytn8/KfPCTB17Iy4R1aDzfURh
        jdEeCn6nuIcosleFCQkfP6/4cCsLdqxp6CjrPHA=
X-Google-Smtp-Source: APXvYqxAMLGkl39HYylbpCaRzjv7ukiX0CPN213B2oqyHbykIkCxsDhH/0sMENpsBb8WOat5xVSk/acHZv6d0xYmmrk=
X-Received: by 2002:a1f:ee82:: with SMTP id m124mr252328vkh.12.1582739330132;
 Wed, 26 Feb 2020 09:48:50 -0800 (PST)
MIME-Version: 1.0
References: <20200222190435.11767-1-masahiroy@kernel.org> <20200222190435.11767-4-masahiroy@kernel.org>
In-Reply-To: <20200222190435.11767-4-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 27 Feb 2020 02:48:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBj30rmh8XCO_QGY6JbMcyBWx2e=1CxoWNJ_t4mPecJA@mail.gmail.com>
Message-ID: <CAK7LNATBj30rmh8XCO_QGY6JbMcyBWx2e=1CxoWNJ_t4mPecJA@mail.gmail.com>
Subject: Re: [PATCH 4/5] kbuild: add dt_binding_check to PHONY in a correct place
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
> The dt_binding_check is added to PHONY, but it is visible only
> when $(dtstree) is not empty. So, it is not specified as phony
> for ARCH=x86 etc.
>
> Add it to PHONY outside the ifneq ... endif block.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied with Rob's Ack.



>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 102710a9228c..83f9b8f6fbaf 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1238,7 +1238,7 @@ ifneq ($(dtstree),)
>  %.dtb: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> -PHONY += dtbs dtbs_install dtbs_check dt_binding_check
> +PHONY += dtbs dtbs_install dtbs_check
>  dtbs dtbs_check: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
> @@ -1258,6 +1258,7 @@ PHONY += scripts_dtc
>  scripts_dtc: scripts_basic
>         $(Q)$(MAKE) $(build)=scripts/dtc
>
> +PHONY += dt_binding_check
>  dt_binding_check: scripts_dtc
>         $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
