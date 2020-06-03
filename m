Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E951EC842
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Jun 2020 06:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgFCEWv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 00:22:51 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:63276 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgFCEWu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 00:22:50 -0400
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0534MVnr030768
        for <linux-kbuild@vger.kernel.org>; Wed, 3 Jun 2020 13:22:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0534MVnr030768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591158152;
        bh=hLQU5I5G1z7xXcMSjDUTgGGgS3AgVbtPzPgXCbwF92Q=;
        h=References:In-Reply-To:From:Date:Subject:To:From;
        b=L/4Kn+1ryPZ8CAMhBJKPW3eej/v1bPackKpy/SSFr/7M9/w5jRSk7OfmWf3codiOg
         gIo7+2cog2bfGcK1XZkHZqEH4sMfGOb6vqFeekP+NpVzXjDVl5HDn4CFCkLoV4QLgr
         oWVPb+gvhedoPXOeKlJakgEDHzyP+hDDxkjHQOC9pLeDpgRgPAISYpAuJhGxI0B9ZG
         IQmPsZulz6a19wdZXqqpaGfTH3cOypNqV7PY8Ya+upiv2o+mZn353eLxIXJXVSzYa6
         8gCAGILG74SqKQy3UoIf/ohN6B7gsjOQ3wGb3S5Bm6YaP/LYJqvPdyeMm+AyXWt/ZU
         FTwkVl1f3kbGg==
X-Nifty-SrcIP: [209.85.221.179]
Received: by mail-vk1-f179.google.com with SMTP id u15so145272vkk.6
        for <linux-kbuild@vger.kernel.org>; Tue, 02 Jun 2020 21:22:31 -0700 (PDT)
X-Gm-Message-State: AOAM530gV43IOE5luW34gddkYVDVeaWmKuhdYZwCSebIuPmWazskMEgh
        bgkD5fRbQgfrVQv7ScpK4jYraddnLQDMp1RGCYM=
X-Google-Smtp-Source: ABdhPJyTZfi8gyLVEnyXjSqeH9dcAP6oOi46iIU5LNad5ClsYq53Mi+VpI8GDWELRKAXLcX6zStODFSRu46/jauzOhg=
X-Received: by 2002:a05:6122:34:: with SMTP id q20mr6740348vkd.66.1591158150490;
 Tue, 02 Jun 2020 21:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200601055731.3006266-1-masahiroy@kernel.org> <20200601055731.3006266-5-masahiroy@kernel.org>
In-Reply-To: <20200601055731.3006266-5-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 3 Jun 2020 13:21:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYmRbYH0O=4P3ce26OMNtTk_Zz2YhAUPLGkQib+UpWWA@mail.gmail.com>
Message-ID: <CAK7LNATYmRbYH0O=4P3ce26OMNtTk_Zz2YhAUPLGkQib+UpWWA@mail.gmail.com>
Subject: Re: [PATCH 05/37] kbuild: refactor KBUILD_VMLINUX_{OBJS,LIBS} calculation
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 1, 2020 at 2:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Do not overwrite core-y or drivers-y. Remove libs-y1 and libs-y2.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

To mend ARCH=arm64 build error,
I will fix up as follows.

diff --git a/Makefile b/Makefile
index 0416760aeb28..24cf37c21cba 100644
--- a/Makefile
+++ b/Makefile
@@ -1070,7 +1070,7 @@ build-dirs        := $(vmlinux-dirs)
 clean-dirs     := $(vmlinux-alldirs)

 # Externally visible symbols (used by link-vmlinux.sh)
-KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
+KBUILD_VMLINUX_OBJS := $(head-y) $(patsubst %/,%/built-in.a, $(core-y))
 KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
 ifdef CONFIG_MODULES
 KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
@@ -1078,7 +1078,7 @@ KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 else
 KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
 endif
-KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(drivers-y))
+KBUILD_VMLINUX_OBJS += $(patsubst %/,%/built-in.a, $(drivers-y))

 export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds




>
>  Makefile | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index c0c086d06753..0416760aeb28 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1069,19 +1069,18 @@ vmlinux-alldirs := $(sort $(vmlinux-dirs) Documentation \
>  build-dirs     := $(vmlinux-dirs)
>  clean-dirs     := $(vmlinux-alldirs)
>
> -core-y         := $(patsubst %/, %/built-in.a, $(core-y))
> -drivers-y      := $(patsubst %/, %/built-in.a, $(drivers-y))
> -libs-y2                := $(patsubst %/, %/built-in.a, $(filter %/, $(libs-y)))
> +# Externally visible symbols (used by link-vmlinux.sh)
> +KBUILD_VMLINUX_OBJS := $(head-y) $(addsuffix built-in.a, $(core-y))
> +KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(filter %/, $(libs-y)))
>  ifdef CONFIG_MODULES
> -libs-y1                := $(filter-out %/, $(libs-y))
> -libs-y2                += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
> +KBUILD_VMLINUX_OBJS += $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
> +KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
>  else
> -libs-y1                := $(patsubst %/, %/lib.a, $(libs-y))
> +KBUILD_VMLINUX_LIBS := $(patsubst %/,%/lib.a, $(libs-y))
>  endif
> +KBUILD_VMLINUX_OBJS += $(addsuffix built-in.a, $(drivers-y))
>
> -# Externally visible symbols (used by link-vmlinux.sh)
> -export KBUILD_VMLINUX_OBJS := $(head-y) $(core-y) $(libs-y2) $(drivers-y)
> -export KBUILD_VMLINUX_LIBS := $(libs-y1)
> +export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
>  export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
>  export LDFLAGS_vmlinux
>  # used by scripts/Makefile.package
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
