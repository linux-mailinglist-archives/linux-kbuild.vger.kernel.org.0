Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 043431EA42F
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jun 2020 14:46:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbgFAMqh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 1 Jun 2020 08:46:37 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:54480 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgFAMqg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 1 Jun 2020 08:46:36 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 051CkMR6010873;
        Mon, 1 Jun 2020 21:46:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 051CkMR6010873
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591015583;
        bh=zW/eDN4oYyGU+zWVezHBOUGB9Sg+zk7frAFV94qZ3oI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2QazGNKgB0ydnRl2S944Znai3dj3Nl4srDHS9zEt7gH6SKlUlpRnXW6O3UrFwFpAD
         UOUkavqWkv1APIhP+GgxiK6P94oZmfyUEas//5VbtwHaX8/fqwSRcUi1f6at40l8qF
         Lya9UUx1XPFk4Pq8aKDPEJz0peIJIY2OF4nJ6n2dFIo+7NWW4kkz9hjPy/NGPfjC6p
         o4MH1Bl8Uig3iHSgO6PZa4LSvPXKqDiw+v22Dih/6SaIrA7+ioHIne0FeFhA+aQVXA
         Xnx+nmquZ876UdnjaLLy42z/ZDJi8rfKAP8Z+6FH1NjPK+fpb5A0XQdm/8nuxInknr
         Clu6I4r89kz6Q==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id a10so1709806uan.8;
        Mon, 01 Jun 2020 05:46:22 -0700 (PDT)
X-Gm-Message-State: AOAM531YNrYGXn5T76ttmCmDW8FzX8Q/KC4j+zaYLkuA9sdKSog4zLyu
        U+2pc27OPi0qNGaKJE7B9MTHdbeKTm7pbjHNJ6I=
X-Google-Smtp-Source: ABdhPJwsYiYvLE0SIb1do6nm5doMLyJ7ytdENKum55NmZMlIn2vRWDOt9UNQ2KZqVEly5tT9d1wuQQyX/QpKZPTXm08=
X-Received: by 2002:a9f:2204:: with SMTP id 4mr14488085uad.40.1591015581425;
 Mon, 01 Jun 2020 05:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200530134415.239427-1-efremov@linux.com>
In-Reply-To: <20200530134415.239427-1-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Jun 2020 21:45:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATYLE6=gY4UN3wZ5V83eYXsiP0S7TpenvTBJ+UUVrXhzA@mail.gmail.com>
Message-ID: <CAK7LNATYLE6=gY4UN3wZ5V83eYXsiP0S7TpenvTBJ+UUVrXhzA@mail.gmail.com>
Subject: Re: [RFC PATCH v3] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 30, 2020 at 10:44 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
>
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>
> The credit goes to @grsecurity.
>
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
> Changes in v2:
>   - _GZIP used instead of GZIP
>   - tar commands altered to use tools from the vars
> Changes in v3:
>   - _BZIP2 used instead of BZIP2
>   - _LZOP used instead of LZOP
>

> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 6cabf20ce66a..b3b49fe7f25f 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -2,6 +2,11 @@
>  ####
>  # kbuild: Generic definitions
>
> +# GZIP, BZIP2, LZOP env vars are used by the tools
> +unexport GZIP
> +unexport BZIP2
> +unexport LZOP
> +
>  # Convenient variables
>  comma   := ,
>  quote   := "


I do not like unexport in Kbuild.include



One idea is to use MAKEOVERRIDES to
implement this all in top Makefile.




diff --git a/Makefile b/Makefile
index e0aeeedbef55..4b7e7496c904 100644
--- a/Makefile
+++ b/Makefile
@@ -458,6 +458,26 @@ PYTHON             = python
 PYTHON3                = python3
 CHECK          = sparse
 BASH           = bash
+GZIP           = gzip
+BZIP2          = bzip2
+LZMA           = lzma
+LZO            = lzop
+LZ4            = lz4c
+XZ             = xz
+
+# GZIP, BZIP2, LZOP env vars are used by the tools. Support them as the command
+# line interface, but use _GZIP, _BZIP2, _LZOP internally.
+_GZIP          := $(GZIP)
+_BZIP2         := $(BZIP2)
+_LZOP          := $(LZOP)
+
+# Reset GZIP, BZIP2, LZOP in this Makefile
+override GZIP=
+override BZIP2=
+override LZOP=
+
+# Reset GZIP, BZIP2, LZOP in recursive invocations
+MAKEOVERRIDES += GZIP= BZIP2= LZOP=

 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
                  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
@@ -506,6 +526,7 @@ CLANG_FLAGS :=
 export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
CROSS_COMPILE LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX
YACC AWK INSTALLKERNEL
 export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
+export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
 export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE

 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS





Another solution is to use 'KGZIP' etc. as in v1.





> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 77c7caefede1..165826c12da9 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -19,6 +19,15 @@ set -e
>  tmpdir="${objtree}/tar-install"
>  tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
>
> +if [ x$_GZIP = "x" ]; then
> +       _GZIP=gzip
> +fi
> +if [ x$_BZIP2 = "x" ]; then
> +       _BZIP2=bzip2
> +fi
> +if [ x$XZ = "x" ]; then
> +       XZ=xz
> +fi
>

Is this necessary?
These shell scripts are not intended to be run
stand-alone.


--
Best Regards
Masahiro Yamada
