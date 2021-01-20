Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF952FCADF
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 07:04:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728454AbhATF4T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 00:56:19 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38356 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbhATFz4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 00:55:56 -0500
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 10K5seUL000772;
        Wed, 20 Jan 2021 14:54:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10K5seUL000772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611122081;
        bh=NpzinYBdCOfxfeDtyC8m64pA8a4VPs9BibEifcNqv7U=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=r+2HxawTca4qIdo/r3eLFaIU3Ujt7OFSZR8qbVnGqq21hdwxZ1rsz50gKiTsMviQe
         Ib/ByLhb5o6+nDaLF1W2U2m5ivnysXKnXx5Dj/noi1rtXSF2TsNGChyySdEE8XVdT4
         2IIkY8dkvdQayZ67WYMamGxgLKHXbc/c5YUuhIvfWJaaymO0Cx2P+K/RkOWhb2nIhB
         oANQWirJp06Ma7t03cNAjMxv+I7nYJo0K9XmXaPblf7M3imMLh/pWcKeh+F2T2t+cP
         YccU54ywW+0DixRvFEIBh2S9QSrALb3BhbhdXRKhwJM/p1t3G753jUZcc/R2WHehqe
         Si3LCf7adOKQQ==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id e9so7758925plh.3;
        Tue, 19 Jan 2021 21:54:40 -0800 (PST)
X-Gm-Message-State: AOAM532lEM0TjIHHeU5O1IXNuxoVFoUK1ZFvb4ic9Dq5+KrnRXWS+hBT
        z0BvEnj711Vhr0SbLxNVOHTUBg0B8uZW3Bsk+SU=
X-Google-Smtp-Source: ABdhPJzLVEq2v7Xgeq9j5t//4kJSg+O/GGPW9NsfSSaZbpo901uaVuC6JZVf9Kndy66yLzXeIl6DNlOcIXwO9tEahPM=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr3790275pjp.87.1611122079972;
 Tue, 19 Jan 2021 21:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20210117115156.2394975-1-masahiroy@kernel.org>
In-Reply-To: <20210117115156.2394975-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 20 Jan 2021 14:54:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPQhz2HxkPnYAEZpxnAmDgGXKBdfZCaXe-9aY7jFbrnQ@mail.gmail.com>
Message-ID: <CAK7LNASPQhz2HxkPnYAEZpxnAmDgGXKBdfZCaXe-9aY7jFbrnQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: remove "Objects which export symbols" section
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jan 17, 2021 at 8:52 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> EXPORT_SYMBOL is unrelated to makefiles. No need to mention it.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.

>
>  Documentation/kbuild/makefiles.rst | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 9f6a11881951..949f09ea3f1a 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -12,7 +12,7 @@ This document describes the Linux kernel Makefiles.
>            --- 3.1 Goal definitions
>            --- 3.2 Built-in object goals - obj-y
>            --- 3.3 Loadable module goals - obj-m
> -          --- 3.4 Objects which export symbols
> +          --- 3.4 <deleted>
>            --- 3.5 Library file goals - lib-y
>            --- 3.6 Descending down in directories
>            --- 3.7 Non-builtin vmlinux targets - extra-y
> @@ -247,12 +247,6 @@ more details, with real examples.
>         kbuild will build an ext2.o file for you out of the individual
>         parts and then link this into built-in.a, as you would expect.
>
> -3.4 Objects which export symbols
> ---------------------------------
> -
> -       No special notation is required in the makefiles for
> -       modules exporting symbols.
> -
>  3.5 Library file goals - lib-y
>  ------------------------------
>
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
