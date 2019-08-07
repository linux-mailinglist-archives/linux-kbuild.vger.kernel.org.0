Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F10FD84FC1
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 17:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbfHGPXs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Aug 2019 11:23:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:59102 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbfHGPXs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Aug 2019 11:23:48 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x77FNY1K003485;
        Thu, 8 Aug 2019 00:23:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x77FNY1K003485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565191415;
        bh=wFWSdnHhhR866OyYCPW9IWXeSZAAJvixLLy0jEH3CE0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lmAqeyU+QRcTgEl82MNkJq7VA9QTQkcBQJ/l5Ru2JMz8vypyZti/dtg9iftmgejkY
         XOdARYRlREF9DLQxNz4ORqw54VD/liXeUMVlWx/NYODfgv5Brk07QK13W22KtdS3s9
         bYSVCGtdlHI7BqxuH6sBtxmtk4L1jbZU9HIAuM843Fob5R4HO1JdOY8cFESTmZQbEw
         uTBdq4eb1vULFYjHnkznz5MgZI2cuRPsLcdxMMNnk+ViWn0jZ/6xIwqPQppSC5/Lxt
         sguKAw8Bc85I7z0looTBJRGEQ5GgVghN6c2u05LZe52zUFnjOp5eF+/qbcF04ce+le
         BWXLbYQX/It4A==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id r3so60914111vsr.13;
        Wed, 07 Aug 2019 08:23:34 -0700 (PDT)
X-Gm-Message-State: APjAAAWTzgBWSNdS9xMjvdAMMZ0Gar/kzzepDHaGJh18oUYAwA/7rx9T
        YDIhqNqaaFWPAGpEZlHnBuMluf95571XomEyWbE=
X-Google-Smtp-Source: APXvYqz4m8SEKmVKatmTXXMW930rk7p7FgeOrFskfw79bfFiwL8uO/9L662iCT7VtluawVIppxs6iCsR9gIeLe7J9ik=
X-Received: by 2002:a67:8e0a:: with SMTP id q10mr6284995vsd.215.1565191413811;
 Wed, 07 Aug 2019 08:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190806100323.22919-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 8 Aug 2019 00:22:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNASUNw8pdg3WYmoZzpz=9tu0c=O+Fyzu228kSLYOhUq81g@mail.gmail.com>
Message-ID: <CAK7LNASUNw8pdg3WYmoZzpz=9tu0c=O+Fyzu228kSLYOhUq81g@mail.gmail.com>
Subject: Re: [PATCH 1/3] kbuild: fix false-positive need-builtin
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 7:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> The current implementation of need-builtin is false-positive,
> for example, in the following Makefile:
>
>   obj-m := foo/
>   obj-y := foo/bar/
>
> ..., where foo/built-in.a is not required.
>
> Fixes: f7adc3124da0 ("kbuild: create built-in.o automatically if parent directory wants it")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Series, applied to linux-kbuild.


>
>  scripts/Makefile.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 0d434d0afc0b..3fe0c73e002c 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -487,7 +487,8 @@ targets += $(call intermediate_targets, .asn1.o, .asn1.c .asn1.h) \
>
>  PHONY += $(subdir-ym)
>  $(subdir-ym):
> -       $(Q)$(MAKE) $(build)=$@ need-builtin=$(if $(findstring $@,$(subdir-obj-y)),1)
> +       $(Q)$(MAKE) $(build)=$@ \
> +       need-builtin=$(if $(filter $@/built-in.a, $(subdir-obj-y)),1)
>
>  # Add FORCE to the prequisites of a target to force it to be always rebuilt.
>  # ---------------------------------------------------------------------------
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
