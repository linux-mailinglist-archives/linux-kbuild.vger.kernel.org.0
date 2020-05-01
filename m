Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B463D1C0DC1
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 May 2020 07:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgEAFfz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 May 2020 01:35:55 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:39466 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgEAFfy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 May 2020 01:35:54 -0400
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0415ZSNW006889;
        Fri, 1 May 2020 14:35:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0415ZSNW006889
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588311329;
        bh=31DBd/mXUZa+m3TiqIc+hhFrzhJrWOhK+9SoxSmucic=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DE39kGw/3eE0/5mohQJj1bJF0neC1gCJT05CMsuq7fJvsMOExvRNiJuD3hpZ5TwYj
         pkEXe8e+I0LVpS+TfIi4pEY7yIEykK2ckuKoEq1HgBUm7y27T7hjsKbYz598+3z1yP
         +9GFJD7U98ZDFuS7EZoBepokjXCEEx80q4lz2cWRyQ/YXx3uF84/f9gsDHr98l4UNV
         bm1RSnvB2UUGBSeergWIuuQSabadGshIW2R2n9BWTfu6PEbakOhrsq21yHSCq2EQER
         RnZp/JCoUI9r4hWN7Seq/ycdw9Dc7VJVanm/SjgGVSNRMy744l+shpBt7PM9Lb7uD+
         eo0n5otTFNX4g==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id u12so2773018vsq.0;
        Thu, 30 Apr 2020 22:35:29 -0700 (PDT)
X-Gm-Message-State: AGi0PuZZZBP+3hB9rKHbjIIvWja4HkIlomi1RGyXPqldD0IdZ+WZ913h
        YRzGuDEqyM2833DL2uZZ6NXoIxSnPire4xeLs3k=
X-Google-Smtp-Source: APiQypK6enxpAbJhGfOCa2LBPEefy+b/1C4o2t1Tcq/ypEGw908iAR035umB2Fmplimyzy9FGU444fFL01LIU87rsrE=
X-Received: by 2002:a67:e94d:: with SMTP id p13mr1990003vso.215.1588311328315;
 Thu, 30 Apr 2020 22:35:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200425051816.791423-1-masahiroy@kernel.org>
In-Reply-To: <20200425051816.791423-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 1 May 2020 14:34:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMbv2cyEyjZCuXM3emmOOkwGwTreKyx-XzjU4vbt0Pjw@mail.gmail.com>
Message-ID: <CAK7LNASMbv2cyEyjZCuXM3emmOOkwGwTreKyx-XzjU4vbt0Pjw@mail.gmail.com>
Subject: Re: [PATCH] h8300: suppress error messages for 'make clean'
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "moderated list:H8/300 ARCHITECTURE" 
        <uclinux-h8-devel@lists.sourceforge.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 25, 2020 at 2:18 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> 'make ARCH=h8300 clean' emits error messages as follows:
>
>   $ make ARCH=h8300 clean
>   gcc: error: missing argument to '-Wframe-larger-than='
>   gcc: error: unrecognized command line option '-mint32'
>
> You can suppress the second one by setting the correct CROSS_COMPILE=,
> but we should not require any compiler for cleaning.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.


>
>  arch/h8300/boot/compressed/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/h8300/boot/compressed/Makefile b/arch/h8300/boot/compressed/Makefile
> index 9e2701069bbe..5942793f77a0 100644
> --- a/arch/h8300/boot/compressed/Makefile
> +++ b/arch/h8300/boot/compressed/Makefile
> @@ -18,7 +18,7 @@ CONFIG_MEMORY_START     ?= 0x00400000
>  CONFIG_BOOT_LINK_OFFSET ?= 0x00280000
>  IMAGE_OFFSET := $(shell printf "0x%08x" $$(($(CONFIG_MEMORY_START)+$(CONFIG_BOOT_LINK_OFFSET))))
>
> -LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> +LIBGCC := $(shell $(CROSS-COMPILE)$(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name 2>/dev/null)
>  LDFLAGS_vmlinux := -Ttext $(IMAGE_OFFSET) -estartup -T $(obj)/vmlinux.lds \
>         --defsym output=$(CONFIG_MEMORY_START)
>
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
