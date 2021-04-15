Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41BE3602BD
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 08:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbhDOGxW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 02:53:22 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:64536 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhDOGxW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 02:53:22 -0400
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 13F6qfpq015976;
        Thu, 15 Apr 2021 15:52:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 13F6qfpq015976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618469561;
        bh=ASLMD/Isn3hyU3AH6rc2TBLrCxFcTFf8y3b9byejf+k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QwDQByczDp2Ixc5lmb0fTUY0fURBptlbXVYbFrJk7tr0V2WT1I+xMW1fy/nuaSm3A
         eVZ1lykXl438BMO7IHX+FvjX+ANuPxqUd6f0YdG7iN3yb7r+vYML21Zem9K3kFWqih
         AnCzn/WgRJRIdEwi3hZbOZoTh4uOe6mNGwQ4G+sUkgdXyznrOwrD6pBKLIOJbQZRJS
         TsnKY4xVw1G98JyH+5om3gtB4Q5tlWLHQLkJiJKbZ4Dfq1ElZvrduxL9F5EZ6dKgth
         oyY72QksPOPWSQPwF1qsBqKddCpkr0IGzu6ipz7tjm99JFEOTsGhQjQf2iRfKfz4Zl
         a6Um2KxZ/t1XQ==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso12163663pje.0;
        Wed, 14 Apr 2021 23:52:41 -0700 (PDT)
X-Gm-Message-State: AOAM532CNR4sIMkZS3Lo4Wh3ZU5z2nfooz0cEsz9T5IIPbRZC9XkzuXr
        2poS7tREx1MiGmKGb9M8X1XzN4sR1/ChYA9vFmA=
X-Google-Smtp-Source: ABdhPJyMNCwpzerAzacYrJrcWqFcuKBK68TQWYjfjdGIIUUg6XX5GJzX3WcOY63EAoqh8uq6kpikN+HHEWtCfQmbYCE=
X-Received: by 2002:a17:90a:1056:: with SMTP id y22mr2109954pjd.153.1618469560457;
 Wed, 14 Apr 2021 23:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210414192657.17764-1-rdunlap@infradead.org>
In-Reply-To: <20210414192657.17764-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 15 Apr 2021 15:52:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
Message-ID: <CAK7LNARSK2YspYvKkUKTp-aG2nqKnvdMr7B_6Am-u1-mt2XBNg@mail.gmail.com>
Subject: Re: [PATCH] uml: fix W=1 missing-include-dirs warnings
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jeff Dike <jdike@addtoit.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 4:27 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Currently when using "W=1" with UML builds, there are over 700 warnings
> like so:
>
>   CC      arch/um/drivers/stderr_console.o
> cc1: warning: ./arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
>
> but arch/um/ does not have include/uapi/ at all, so don't
> include arch/um/include/uapi/ in USERINCLUDE for UML.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: Jeff Dike <jdike@addtoit.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Cc: linux-um@lists.infradead.org
> ---
>  Makefile |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> Option 2: change the setting of USERINCLUDE. This could alter
>         (a) build times and
>         (b) which header files get used: if there are multiple
>             header files named foobar.h in the $(USERINCLUDE)
>             subdirectories, this Option changes the order in which
>             they would be found.
>
> - linux-next-20210413.orig/Makefile
> + linux-next-20210413/Makefile
> @@ -501,13 +501,16 @@ LDFLAGS_vmlinux =
>
>  # Use USERINCLUDE when you must reference the UAPI directories only.
>  USERINCLUDE    := \
> -               -I$(srctree)/arch/$(SRCARCH)/include/uapi \
>                 -I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
>                 -I$(srctree)/include/uapi \
>                 -I$(objtree)/include/generated/uapi \
>                  -include $(srctree)/include/linux/compiler-version.h \
>                  -include $(srctree)/include/linux/kconfig.h
>
> +ifneq ($(ARCH),um)
> +USERINCLUDE    += -I$(srctree)/arch/$(SRCARCH)/include/uapi
> +endif
> +
>  # Use LINUXINCLUDE when you must reference the include/ directory.
>  # Needed to be compatible with the O= option
>  LINUXINCLUDE    := \
>
> Option 3: modify scripts/Makefile.extrawarn not to set
>         -Wmissing-include-dirs for arch=um. I think that this is not
>         a good idea: it could cause valid problem reports not to be
>         reported.
>
> Option 4: simply mkdir arch/um/include/uapi
>         That's what I did first, just as a test, and it works.


I like Option 4.

But, you cannot do "mkdir -p arch/um/include/uapi" at build-time
because the build system should not touch the source tree(, which
might be read-only)
for O= building.

How about adding

  arch/um/include/uapi/asm/Kbuild,

which is just having a SPDX one-liner?












>
> --- linux-next-20210413.orig/Makefile
> +++ linux-next-20210413/Makefile
> @@ -500,6 +500,15 @@ AFLAGS_KERNEL      =
>  LDFLAGS_vmlinux =
>
>  # Use USERINCLUDE when you must reference the UAPI directories only.
> +# Note: arch/um/ does not have an include/uapi/ subdir.
> +ifeq ($(ARCH),um)
> +USERINCLUDE    := \
> +               -I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
> +               -I$(srctree)/include/uapi \
> +               -I$(objtree)/include/generated/uapi \
> +                -include $(srctree)/include/linux/compiler-version.h \
> +                -include $(srctree)/include/linux/kconfig.h
> +else
>  USERINCLUDE    := \
>                 -I$(srctree)/arch/$(SRCARCH)/include/uapi \
>                 -I$(objtree)/arch/$(SRCARCH)/include/generated/uapi \
> @@ -507,6 +516,7 @@ USERINCLUDE    := \
>                 -I$(objtree)/include/generated/uapi \
>                  -include $(srctree)/include/linux/compiler-version.h \
>                  -include $(srctree)/include/linux/kconfig.h
> +endif
>
>  # Use LINUXINCLUDE when you must reference the include/ directory.
>  # Needed to be compatible with the O= option



-- 
Best Regards
Masahiro Yamada
