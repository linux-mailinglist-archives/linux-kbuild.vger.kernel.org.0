Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 06D8215A9FA
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 14:23:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgBLNXI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 08:23:08 -0500
Received: from conssluserg-04.nifty.com ([210.131.2.83]:53801 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLNXI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 08:23:08 -0500
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 01CDN4ud027300;
        Wed, 12 Feb 2020 22:23:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 01CDN4ud027300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581513784;
        bh=LoNSUGEOpcC6+C5YLO+Kyo48Olrbu/yrYFZCVU6Mou0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=jdAYQ1y7Ve5XRhisC6H6g5SVhFZzr5vVRE33azttayU/ptqfhhtxPUY6TuC1hD7Xh
         FPplkTOWJsQ3kINHp4Cx9HbMKLF8L+j76xjjK5MWe+NdZdF9y+xswEDiR7aZGw4jQc
         VnVSPhwoqC0tEdzcV7Pl7ZHSSJ0NkB3w6vqadqCSOpOYXoDfN+dlBl3IMEvViyPk9m
         m5DNOP6VjmqkBTJD/FESbQlIzCi0rX1rcfY88oxFI7hvizkEANdmgnUJR9Js3jKJHq
         x/s8WAhpa5PjQ9eS/BJoQ2qj2lEROgoaDpJ9jSIUZSmVkSYEArXYFdcmWiGYildj7R
         KTh44X7xFYR9Q==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id c18so1100060vsq.7;
        Wed, 12 Feb 2020 05:23:04 -0800 (PST)
X-Gm-Message-State: APjAAAXen5DVXS/hweiSZRWiCCJNKG+5i5UBasi4ev/1Mn68RK0FnCZG
        V6/VznZEOMQ/7u0RG4shsaIY0FGxBfgj5K6rfgQ=
X-Google-Smtp-Source: APXvYqzsrUfrxM+SGnth+VRTUsfnKL7azpsfR1oe565OuXxNSQ9Ri3Dy3FMOrDbOj9ew/vkJdZV+3YDsRikCHnJdykw=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr11753579vsq.215.1581513783166;
 Wed, 12 Feb 2020 05:23:03 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
In-Reply-To: <20200210131925.145463-1-samitolvanen@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 Feb 2020 22:22:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
Message-ID: <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sami,

On Mon, Feb 10, 2020 at 10:19 PM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> With CONFIG_TRIM_UNUSED_SYMS, if a module has enough dependencies to
> exceed the default xargs command line size limit, the output is split
> into multiple lines, which can result in used symbols getting trimmed.
>
> This change removes duplicate dependencies, which will reduce the
> probability of this happening and makes .mod files smaller and easier
> to read.
>
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a1730d42e5f3..a083bcec19d3 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -257,7 +257,7 @@ endef
>
>  # List module undefined symbols (or empty line if not enabled)
>  ifdef CONFIG_TRIM_UNUSED_KSYMS
> -cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | xargs echo
> +cmd_undef_syms = $(NM) $< | sed -n 's/^  *U //p' | sort -u | xargs echo



In which case are undefined symbols duplicated?

Do you have a .config to reproduce it?



>  else
>  cmd_undef_syms = echo
>  endif
>
> base-commit: bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
> --
> 2.25.0.341.g760bfbb309-goog
>


-- 
Best Regards
Masahiro Yamada
