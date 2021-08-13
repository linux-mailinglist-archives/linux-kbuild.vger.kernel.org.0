Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F32A23EB17D
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Aug 2021 09:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239415AbhHMH3f (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 03:29:35 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:32656 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238816AbhHMH3f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 03:29:35 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 17D7SX08005023;
        Fri, 13 Aug 2021 16:28:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 17D7SX08005023
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628839714;
        bh=BV8wnGfpU0adexwE48wxaMnANp7xHb9xXsYRk1N/H18=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Wv4bUS5DC5jMTBHGvc+v/2dW0yUAhx2C+vVmHRxcKO0FCnXTMbyfr+1kYaPLgsdmb
         AP8MkQY25tURaJfMeMLWoHXModJ1xvNbovHw1LwfoDwxzwQ0QZcA6WMpHBPlrz/PzW
         8pMYW2ou/pAtxqGmZG1/trSXXAFJkwvrfU+Zt4diwVYcotLBQfF3VCngLvke/aYuZr
         idCzI9IhobsRo3C9RDNZLgoYPGkzZTjAruIftr1v9cU/AznvCg7APk4Q0d1jiZdX/A
         C8lT50sItK11iJWza+Ot/5wbjAQiUq8UqEtgLwpWHako41bNM1yrCX0xC84Eq5OdNo
         5l6C+LwCi/zKQ==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id bo18so14171538pjb.0;
        Fri, 13 Aug 2021 00:28:34 -0700 (PDT)
X-Gm-Message-State: AOAM531vw/gAV0yRVmhLy/1WD4XoyGkmE1pV7aoOqhCCU/wGwtKAkd9N
        13Rv/p6oa7wSQyZVHcIjczct7weFXsW+w/NkwtM=
X-Google-Smtp-Source: ABdhPJyx44tl9Uqj/H6tA+h95icpAvU0tmj4P0oIKNOx0eYC/VoDpCvWHbGhx2UZQAkDxdiox5Mt6fBk1kYZ8MIeF5o=
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr1212507pjg.153.1628839713522;
 Fri, 13 Aug 2021 00:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210811225442.9537-1-rdunlap@infradead.org>
In-Reply-To: <20210811225442.9537-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 13 Aug 2021 16:27:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNASJi3HWY9ut8+mkSOAWD=QxB7ftnkHdqZRW0fLbO5NDhg@mail.gmail.com>
Message-ID: <CAK7LNASJi3HWY9ut8+mkSOAWD=QxB7ftnkHdqZRW0fLbO5NDhg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow "make" targets 'versioncheck' and
 'includecheck' withoug .config file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 12, 2021 at 7:54 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Top-level Makefile targets 'versioncheck' and 'includecheck' don't
> need a configured kernel (i.e., don't need a .config file), so add
> them the the list of "no-dot-config-targets".
> This eliminates the 'make' error:
>
> ***
> *** Configuration file ".config" not found!
> ***
> *** Please run some configurator (e.g. "make oldconfig" or
> *** "make menuconfig" or "make xconfig").
> ***
> Makefile:759: include/config/auto.conf.cmd: No such file or directory
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---
> Fixes: I couldn't determine this.
>
>  Makefile |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> --- linux-next-20210811.orig/Makefile
> +++ linux-next-20210811/Makefile
> @@ -274,7 +274,8 @@ no-dot-config-targets := $(clean-targets
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
>                          %asm-generic kernelversion %src-pkg dt_binding_check \
> -                        outputmakefile rustfmt rustfmtcheck
> +                        outputmakefile rustfmt rustfmtcheck \
> +                        versioncheck includecheck
>  # Installation targets should not require compiler. Unfortunately, vdso_install
>  # is an exception where build artifacts may be updated. This must be fixed.
>  no-compiler-targets := $(no-dot-config-targets) install dtbs_install \



There is no good reason to invoke checkincludes.pl via GNU Make
in the first place.



A better solution is to do it by a shell script
or to make checkincludes.pl traverse the
subdirectories by itself.



[1] An easy solution

Add scripts/checkincludes-all:


#!/bin/sh
find . -name '*.[hcS]' -type f -print | sort \
  | xargs $(dirname $0)/checkincludes.pl


Then, remove the 'includecheck' target from the Makefile.

You can do 'scripts/checkincludes-all'
instead of 'make includecheck'.



[2] A better solution

Extend scripts/checkincludes.pl so that it checks
all *.[hcS] files under the current directory
when no argument is passed.

You can simply do 'scripts/checkincludes.py'



-- 
Best Regards
Masahiro Yamada
