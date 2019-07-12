Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF44E66733
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jul 2019 08:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbfGLGsJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Jul 2019 02:48:09 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39571 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbfGLGsJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jul 2019 02:48:09 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x6C6m24x022354
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Jul 2019 15:48:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x6C6m24x022354
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562914083;
        bh=HPGQVG0B/cUxR9f9UR49WV5hqRMhzWYgWU3132MmhyQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RwW74FM49M+/xwz0XX8rJTltwkfLQCTeWGmqzojCYYe8rLYoUKchCcDeWn8c3uJi9
         x+8b5o5G/mEKNdqABpHtYrSiWz2ShZQsn+LmZQWS3eum4dV4Sa8yZ/eJLfatM/YZDD
         PT1474hiYu46GTAYcKDLm3LYim29Zc5Q1Z+iu37DhMEkjuum4SsU/0Kbsjtsnqmi4f
         XFXdws2E5qS+9LA1Bu11bDFZnoJot2rlBr7lXtcwluorZR2vG3wSMhqMPaEodyrhbi
         JwJzm50Arb82bKLglQ5NrOraUssuJBKlDrdxTZTZqH2RBEBqgB2hm5vP8y7tcITCls
         a9KE/XBOgLw9g==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id g11so3605461uak.0
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Jul 2019 23:48:03 -0700 (PDT)
X-Gm-Message-State: APjAAAXMaTnbyqLvetQ6pDkOijr5kh4IkMWuWgBko1PkswgiXvfd/lQh
        xCjcA25ZMTfw3luSd5b0EdQR2LSOojPT0zkA7L4=
X-Google-Smtp-Source: APXvYqzSUflCWdIH+PTbUfgEiJZivoUHEToAmD6Kv8c8jmD0kmDXDLtscfEsKEPGDobqJkuLRFt+0KyTOBnIl6zGSp4=
X-Received: by 2002:a9f:25e9:: with SMTP id 96mr7668654uaf.95.1562914082099;
 Thu, 11 Jul 2019 23:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <ed43c836-bbb2-9283-67ce-4b59563ac327@iki.fi>
In-Reply-To: <ed43c836-bbb2-9283-67ce-4b59563ac327@iki.fi>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Fri, 12 Jul 2019 15:47:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQeWuCb+vRghwtB9-5T_j95e6mk5QcRpBv6AhYbJycHTA@mail.gmail.com>
Message-ID: <CAK7LNAQeWuCb+vRghwtB9-5T_j95e6mk5QcRpBv6AhYbJycHTA@mail.gmail.com>
Subject: Re: Issue/Bug report: auto.conf not generated correctly when
 CROSS_COMPILE environment var set
To:     =?UTF-8?B?Sm9vbmFzIEt5bG3DpGzDpA==?= <joonas.kylmala@iki.fi>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Denis 'GNUtoo' Carikli" <GNUtoo@cyberdimension.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Joonas

On Tue, Jul 9, 2019 at 6:58 PM Joonas Kylm=C3=A4l=C3=A4 <joonas.kylmala@iki=
.fi> wrote:
>
> Hi Masahiro and Michal,
>
> I'm having a build issue regarding auto.conf generation with the the
> latest master (commit 5ad18b2e60b7) plus this patch to use
> CONFIG_USB_FUNCTIONFS as built-in module:
>
> diff --git a/arch/arm/configs/imx_v6_v7_defconfig
> b/arch/arm/configs/imx_v6_v7_defconfig
> index 8116648a8efd..228098c64c48 100644
> --- a/arch/arm/configs/imx_v6_v7_defconfig
> +++ b/arch/arm/configs/imx_v6_v7_defconfig
> @@ -345,14 +345,7 @@ CONFIG_USB_CONFIGFS_F_MIDI=3Dy
>  CONFIG_USB_CONFIGFS_F_HID=3Dy
>  CONFIG_USB_CONFIGFS_F_UVC=3Dy
>  CONFIG_USB_CONFIGFS_F_PRINTER=3Dy
> -CONFIG_USB_ZERO=3Dm
> -CONFIG_USB_AUDIO=3Dm
> -CONFIG_USB_ETH=3Dm
> -CONFIG_USB_G_NCM=3Dm
> -CONFIG_USB_GADGETFS=3Dm
> -CONFIG_USB_FUNCTIONFS=3Dm
> -CONFIG_USB_MASS_STORAGE=3Dm
> -CONFIG_USB_G_SERIAL=3Dm
> +CONFIG_USB_FUNCTIONFS=3Dy
>  CONFIG_MMC=3Dy
>  CONFIG_MMC_SDHCI=3Dy
>  CONFIG_MMC_SDHCI_PLTFM=3Dy
>
> Here is a excerpt from my terminal so you can understand and reproduce
> the bug/issue easily:
>
> user@builder:~/linux$ export CROSS_COMPILE=3Darm-none-eabi-
> user@builder:~/linux$ export ARCH=3Darm
> user@builder:~/linux$ make mrproper && make clean && make
> imx_v6_v7_defconfig && rgrep USB_FUNCTIONFS | grep "auto.conf"
>   CLEAN   scripts/basic
>   CLEAN   scripts/kconfig
>   CLEAN   include/config include/generated
>   CLEAN   .config
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.h
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   YACC    scripts/kconfig/parser.tab.c
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTLD  scripts/kconfig/conf
> #
> # configuration written to .config
> #
> user@builder:~/linux$ make mrproper && make clean && make
> imx_v6_v7_defconfig && make syncconfig && rgrep USB_FUNCTIONFS | grep
> "auto.conf"
>   CLEAN   scripts/basic
>   CLEAN   scripts/kconfig
>   CLEAN   include/config include/generated
>   CLEAN   .config
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTCC  scripts/kconfig/confdata.o
>   HOSTCC  scripts/kconfig/expr.o
>   LEX     scripts/kconfig/lexer.lex.c
>   YACC    scripts/kconfig/parser.tab.h
>   HOSTCC  scripts/kconfig/lexer.lex.o
>   YACC    scripts/kconfig/parser.tab.c
>   HOSTCC  scripts/kconfig/parser.tab.o
>   HOSTCC  scripts/kconfig/preprocess.o
>   HOSTCC  scripts/kconfig/symbol.o
>   HOSTLD  scripts/kconfig/conf
> #
> # configuration written to .config
> #
> scripts/kconfig/conf  --syncconfig Kconfig
> include/config/auto.conf:CONFIG_USB_FUNCTIONFS=3Dy
> include/config/auto.conf:CONFIG_USB_FUNCTIONFS_GENERIC=3Dy
>
> As we can see in the first build command run CONFIG_USB_FUNCTIONFS=3Dy
> doesn't appear in the file include/config/auto.conf, it only appears
> after running "make syncconfig". Normally this is not a problem for me
> since for "make *_defconfig" I don't use CROSS_COMPILE in that step and
> I only use it in "make zImage". If I run "CROSS_COMPILE=3Dxxxx make
> zImage" then I think syncconfig is triggered because in the "make
> *_defconfig" stage the compiler was different [1] and so I don't hit
> this issue with auto.conf not being generated correctly.


This seems the (well-known?) "choice forgets user's input" issue.

This part is so complicated and badly-hacked.
I do not have enough time to fix this cleanly now
(if somebody sends a correct fix, that would be appreciated)

I just sent out an easy workaround.
https://patchwork.kernel.org/patch/11041571/

Hope it will fix the issue.



Joonas


--=20
Best Regards
Masahiro Yamada
