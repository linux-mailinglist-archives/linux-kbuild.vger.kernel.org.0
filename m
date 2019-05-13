Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C90961AEE0
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 May 2019 04:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbfEMC1A (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 12 May 2019 22:27:00 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29424 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727311AbfEMC07 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:26:59 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4D2Qng3007679;
        Mon, 13 May 2019 11:26:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4D2Qng3007679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557714409;
        bh=BUvN4890igL4SkCKpgJGtl2jB6AWFTho2H58sM9+3GI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XyUl+gzlLzzxgDyEohjUjK08dmeRSfYEg8VvAhgelHApIThCF1ljMJ0lGvBByyF9D
         TwkFWL1yDtKHLstHPAhQyPGFTjAEiFz80nEqotU/PW4+39i4ZwlnJmA3ZI/x9K2Tzq
         qlkepXwbKsWSRPTtv1bzFDbhvYz9HN/AH4FHC9vULrZvIv4VgREr+k2XUBEQS2rYhU
         oShahz6l8bOEVmLKQdIML+IB2OR3ja0b2YrEwWz4lrGuhZwI227eg+NNcB7sk/bV3Z
         tPmZKEUdn8dI2FunMZdLVN/+Omk6zBJMPtYafc6+Bma7eWX3BQU6j5aq4L6D+YDV8A
         ViI3JMqT64mHA==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id p13so4203492uaa.11;
        Sun, 12 May 2019 19:26:49 -0700 (PDT)
X-Gm-Message-State: APjAAAWD9mQ/Zz5F/QJGNuzuDxWPgiw/D5pUIAnpviekmjckGIQKIQ7b
        lWdJ3AOy2PoG9JQtJyQbAFg4dtMEiX+mUx3o8x8=
X-Google-Smtp-Source: APXvYqyLlaeaG/ush61nYkscWrGAkuF3p+DXnN+BGUhRhq43pwomV4HO2vTYkUCvpBPT0UrDr5shj22a5kBPOGX44VE=
X-Received: by 2002:a9f:3381:: with SMTP id p1mr4321694uab.40.1557714408490;
 Sun, 12 May 2019 19:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <1557363481-27178-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557363481-27178-1-git-send-email-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 13 May 2019 11:26:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrrJD-7j-P8===Y4ZG5_--=35QQ4R1HALkvUZE_BO1Ow@mail.gmail.com>
Message-ID: <CAK7LNARrrJD-7j-P8===Y4ZG5_--=35QQ4R1HALkvUZE_BO1Ow@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: re-enable int-in-bool-context warning
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 9:58 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> This warning was disabled by commit bd664f6b3e37 ("disable new
> gcc-7.1.1 warnings for now") just because it was too noisy.
>
> Thanks to Arnd Bergmann, all warnings have been fixed. Now, we are
> ready to re-enable it.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to linux-kbuild.



> Changes in v2:
>   - rebase
>
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index a61a95b..2896518 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -692,7 +692,6 @@ KBUILD_CFLAGS       += $(call cc-option,-fno-delete-null-pointer-checks,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning,frame-address,)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-truncation)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, format-overflow)
> -KBUILD_CFLAGS  += $(call cc-disable-warning, int-in-bool-context)
>  KBUILD_CFLAGS  += $(call cc-disable-warning, address-of-packed-member)
>
>  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
