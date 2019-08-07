Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51EE28427B
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2019 04:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfHGCdH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 6 Aug 2019 22:33:07 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:37472 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727653AbfHGCdH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Aug 2019 22:33:07 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x772WfV2001484;
        Wed, 7 Aug 2019 11:32:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x772WfV2001484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565145162;
        bh=73kK1zWf1zgSwM0Qiy8U03aVhSxNqlnQVY5Ux1NQO3A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xsA3mEa4VKVjPFBbXOP85KOSrfs+Bwd2wmwDOml+JjQXbQsJhB/4gfZIebQt5HXH/
         g0RKLJvLgNv76ZVCPkzUk0KZ5ZxAFR3HY1BXndORyxLdZ9LK0wWJlWZy/HKwkcv+e0
         7g7I58QEg5f7BAktz8piEvE9f9KLO7VWn8vwFhQzKZVg38O+jnRdRbynI+Pb6Y39sH
         OFIuTYFuFyMRW8EyXlwpGERtyzGPbBqFu+Y6liuSaIipKhdFD0Bc+t2JcoHi9yhW9m
         Rl27ELwBUzSxtTzZi3sp+F9M7jFC7xglVsk8AD1IiD/8pAaV4lWe/+fgowDo0ajmVz
         Uf3baqUm1y9tA==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id w186so9337225vkd.11;
        Tue, 06 Aug 2019 19:32:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWv6ZGuNbakw17NyLZEw78644vtRzK3MdO7Md+W2fhdmvedvxjK
        OzQQEkDmf6aiV85IJBk48CYq3FV8x0TXXJ/TO4Y=
X-Google-Smtp-Source: APXvYqyGqId2Qj7KwwDJabGigaJ8qRGHoZt3xyNuEqSZQt8KtGUb4MqYlY+M0DddltyN4T2Qox3VF0ncm0dd4N4vlCc=
X-Received: by 2002:a1f:4107:: with SMTP id o7mr2629240vka.34.1565145160504;
 Tue, 06 Aug 2019 19:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
In-Reply-To: <patch-1.thread-2257a1.git-188f5a3d81d5.your-ad-here.call-01565088755-ext-5120@work.hours>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 7 Aug 2019 11:32:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
Message-ID: <CAK7LNATL8aGReDm+BYk74tH1EdK1NKVgaWF6sJ7m1NtBL1kqkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: add OBJSIZE variable for the size tool
To:     Vasily Gorbik <gor@linux.ibm.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

On Tue, Aug 6, 2019 at 7:56 PM Vasily Gorbik <gor@linux.ibm.com> wrote:
>
> Define and export OBJSIZE variable for "size" tool from binutils to be
> used in architecture specific Makefiles (naming the variable just "SIZE"
> would be too risky). In particular this tool is useful to perform checks
> that early boot code is not using bss section (which might have not been
> zeroed yet or intersects with initrd or other files boot loader might
> have put right after the linux kernel).
>
> Signed-off-by: Vasily Gorbik <gor@linux.ibm.com>

I think you want to apply both to the s390 tree. If so,

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Thanks.

> ---
>  Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index fa0fbe7851ea..ff4cff29fe46 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -419,6 +419,7 @@ NM          = $(CROSS_COMPILE)nm
>  STRIP          = $(CROSS_COMPILE)strip
>  OBJCOPY                = $(CROSS_COMPILE)objcopy
>  OBJDUMP                = $(CROSS_COMPILE)objdump
> +OBJSIZE                = $(CROSS_COMPILE)size
>  PAHOLE         = pahole
>  LEX            = flex
>  YACC           = bison
> @@ -474,9 +475,9 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
> -export CPP AR NM STRIP OBJCOPY OBJDUMP PAHOLE KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
> -export MAKE LEX YACC AWK INSTALLKERNEL PERL PYTHON PYTHON2 PYTHON3 UTS_MACHINE
> -export HOSTCXX KBUILD_HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
> +export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE PAHOLE LEX YACC AWK INSTALLKERNEL
> +export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
