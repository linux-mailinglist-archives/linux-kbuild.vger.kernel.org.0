Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF32137C10
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Jan 2020 08:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgAKHVp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 Jan 2020 02:21:45 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48559 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728501AbgAKHVp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Jan 2020 02:21:45 -0500
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 00B7LeVi022965;
        Sat, 11 Jan 2020 16:21:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 00B7LeVi022965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578727301;
        bh=3vETektI0YDiqAdPfJor9k69rygp1blybs+5Rx/5jok=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=PFJmnRVDK9PSHUTsX4/drj/vVRoyM+72czBkfUzC9sh0grXF7KcE7tx3i8go6OQKk
         MY2l0/dGs51DXBToSvT4KpA4fxj4HEQX2s6qiaKPYDnOGMH0MwY+Tec8WBhGDOnP+a
         PWOKL8j8xeyaUIOTSJhyPeVIY2gNurB16MpNg+TRoL1RHqo7PI4dfI4NUf7SKRT0xf
         H7g0Y6xhcdzjE2QnM/qJXafVvcAxzsSJ8dLCoX3SD0K5LVz72Lv4qFzKDtiBQdFh8h
         5X3DwV6FJyklKN8h3wLIPxjF7+UNjsFFWHbKvchRYpShFdRvZHJQck9MLCYajduBlw
         +CPo6IJwedEsg==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id k188so2748041vsc.8;
        Fri, 10 Jan 2020 23:21:41 -0800 (PST)
X-Gm-Message-State: APjAAAXEFfRZTCAXQDkjN9MyFR+UiVeMdhc6sjhKOW7G5YOfw5TEampi
        iTsDJmxN6rn/V44O3Nr8rgFUpHNyH+xz4RSBc5M=
X-Google-Smtp-Source: APXvYqzPyaubez0e5DOcJPsB9K80w3P1t/cZXcJDEcG9Xgn5XgVIWvuW8+Dsv9lx92ahRfyX3qHcmVEnhwf0cr2QYX0=
X-Received: by 2002:a67:f8ca:: with SMTP id c10mr1448922vsp.54.1578727300461;
 Fri, 10 Jan 2020 23:21:40 -0800 (PST)
MIME-Version: 1.0
References: <20200106083628.29729-1-masahiroy@kernel.org>
In-Reply-To: <20200106083628.29729-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Jan 2020 16:21:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAST-9NUg0zeUny7YU+ihjNMihYAxAUfJy7MU2v11OMFhQ@mail.gmail.com>
Message-ID: <CAK7LNAST-9NUg0zeUny7YU+ihjNMihYAxAUfJy7MU2v11OMFhQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove PYTHON2 variable
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 6, 2020 at 5:36 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Python 2 has retired. There is no user of this variable.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.


> ---
>
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4f01de6cd43c..4a0796b05324 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -423,7 +423,6 @@ INSTALLKERNEL  := installkernel
>  DEPMOD         = /sbin/depmod
>  PERL           = perl
>  PYTHON         = python
> -PYTHON2                = python2
>  PYTHON3                = python3
>  CHECK          = sparse
>  BASH           = bash
> @@ -474,7 +473,7 @@ CLANG_FLAGS :=
>
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE AS LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
> -export PERL PYTHON PYTHON2 PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
