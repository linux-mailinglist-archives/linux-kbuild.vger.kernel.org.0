Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF6482BB5
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Aug 2019 08:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731712AbfHFGem (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 02:34:42 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50060 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731594AbfHFGem (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 02:34:42 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x766YJmN030634;
        Tue, 6 Aug 2019 15:34:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x766YJmN030634
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565073260;
        bh=UGokPoCuS8qN/fxPDNu2v8bVJCHaN/v0oNhnNc1cF7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TRLgw0+7uw0zZ7PlR9yEqqXSDLPR4X3lErONbFPmFVT8vCTyfjojnAwpYhT+rQ4SR
         pOS4G8ynR6eFeHzXQHOOa5XsG/lgtDvKrxRF/jw1Pi4Y22Fe6MhbEkqdkckNtWQMxB
         Bb0+gE3dMrAff1SVqL9yXVAVNAlw3ueVW9MJA2zuNzKmr7SJ1Zkf/EwUaXK3rQks47
         ZYAi9W56VP8K5K4YaiwpX4sDZ71iK8OtE9BSttuOzQ5F9GBmb6uuOFoPhOclVRXw1L
         3mEWeW7Ma8L+reO2ZDv7Fq8V2Mt2HTLD0pSjYFggmtZqWXUdkGPptH334PgdD/oBdo
         /CeT2EkBXnzKA==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id v6so57659913vsq.4;
        Mon, 05 Aug 2019 23:34:19 -0700 (PDT)
X-Gm-Message-State: APjAAAUtSUpuG8HmxAX3ZP/4Abv6cx6/bV6puNblZBXYzGeCA/SrXYsO
        RskNWcDBvoEb4jX1pOSoZnYDNvOgSgwCvhL9axQ=
X-Google-Smtp-Source: APXvYqzT/sxk5Y/AIBMSRGngJRDWBnnGNlQatN1KHhWzxdTa81nmXb9Jwne9Ue7ooG/aVEBhyiiqF51LEeCk4sbzwzg=
X-Received: by 2002:a67:fc45:: with SMTP id p5mr1262675vsq.179.1565073258567;
 Mon, 05 Aug 2019 23:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190806062316.30784-1-ice_yangxiao@163.com>
In-Reply-To: <20190806062316.30784-1-ice_yangxiao@163.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 6 Aug 2019 15:33:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARVrBf2imEOdYv0zZxDZaQ2z83qKr=xSbrHHGEYHgRLuA@mail.gmail.com>
Message-ID: <CAK7LNARVrBf2imEOdYv0zZxDZaQ2z83qKr=xSbrHHGEYHgRLuA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove unused variable TMPO of ld-option
To:     Xiao Yang <ice_yangxiao@163.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        yangx.jy@cn.fujitsu.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 3:23 PM Xiao Yang <ice_yangxiao@163.com> wrote:
>
> ld-option implementation has been simplified so variable TMPO
> is no longer needed.
>
> Fixes: Commit 0294e6f4a000 ("kbuild: simplify ld-option implementation")
> Signed-off-by: Xiao Yang <ice_yangxiao@163.com>
> ---
>  scripts/Kbuild.include | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 4b0432e095ae..13a6f627351d 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -91,12 +91,11 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
>  # automatically cleaned up.
>  try-run = $(shell set -e;              \
>         TMP="$(TMPOUT).$$$$.tmp";       \
> -       TMPO="$(TMPOUT).$$$$.o";        \
>         if ($(1)) >/dev/null 2>&1;      \
>         then echo "$(2)";               \
>         else echo "$(3)";               \
>         fi;                             \
> -       rm -f "$$TMP" "$$TMPO")
> +       rm -f "$$TMP")
>
>  # as-option
>  # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
> --
> 2.21.0
>
>

Unfortunately, there is a user in arch/x86/Makefile.

masahiro@pug:~/ref/linux$ git grep TMPO
arch/x86/Makefile:                      $(OBJCOPY) -O elf32-x86-64
"$$TMP" "$$TMPO" && \
arch/x86/Makefile:                      $(LD) -m elf32_x86_64 "$$TMPO"
-o "$$TMP",y,n)
scripts/Kbuild.include:TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword
$(KBUILD_EXTMOD))/)
scripts/Kbuild.include: TMP="$(TMPOUT).$$$$.tmp";       \
scripts/Kbuild.include: TMPO="$(TMPOUT).$$$$.o";        \
scripts/Kbuild.include: rm -f "$$TMP" "$$TMPO")




-- 
Best Regards
Masahiro Yamada
