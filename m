Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 091CE1E1FAA
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 May 2020 12:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388468AbgEZKa0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 May 2020 06:30:26 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59901 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388460AbgEZKaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 06:30:24 -0400
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 04QAU1Ii013487;
        Tue, 26 May 2020 19:30:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 04QAU1Ii013487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590489002;
        bh=N8ZWOkzOy09EUTZjKTvRi5l9vEvp7BQgSJmSVhDMZas=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gYC+cR9MYQZBQPVnXgRN+Ipb6w+fe8M/E0dSBLO9aQ0fLiUmZwbbUA0K1781m15DL
         HKIKCzwP9Gu6VGSH5XyOJ24bn6LF8L2nwC3lduTWQYF+HMqh4Ywncordjokimw9ehl
         dwF/zCzfn1Y1Zh67p/b7GQ2IUDlDhyYGy5/039UJw9T8gqpYEsrM/aHUF6H3WTTqsB
         KjbKYGt3qwYFCruqNKyQuXAV6KluW6ojnDWaXTdLZqSAUorTVQpLjBHE/746vYmCRr
         cnxo8OM5B1z3jfjZltpmRSP1IVZV4zLeTedqRQNheHmMTd9toVcFL0y09c41smhBUZ
         +eFnNnaWUcCLw==
X-Nifty-SrcIP: [209.85.217.48]
Received: by mail-vs1-f48.google.com with SMTP id u7so11489953vsp.7;
        Tue, 26 May 2020 03:30:02 -0700 (PDT)
X-Gm-Message-State: AOAM531NsluGmvVT7DILiIkFtRhEJSV1cYI9bYhg4AWKU2lHLPg8Uu6g
        08GjZy8ZGfuKm3BJO1Wt+ppZ5mWhjmI/2s0Ei+k=
X-Google-Smtp-Source: ABdhPJyutmwlompeqeL/lIxvpVNgyZgSzQfgChQBWObRC+YqQZrqTITS8qbDZQc6mySAk5JsPaOEm+1QYYJTmGgPLKg=
X-Received: by 2002:a67:f3c3:: with SMTP id j3mr299136vsn.155.1590489001177;
 Tue, 26 May 2020 03:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200522020002.504506-1-masahiroy@kernel.org>
In-Reply-To: <20200522020002.504506-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 May 2020 19:29:25 +0900
X-Gmail-Original-Message-ID: <CAK7LNARuxFq5NVR5xuD0vEVarQ8te-p1ZEj5990x7Wd3DesTjg@mail.gmail.com>
Message-ID: <CAK7LNARuxFq5NVR5xuD0vEVarQ8te-p1ZEj5990x7Wd3DesTjg@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: remove ifdef builtin-target / lib-target
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 22, 2020 at 11:00 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I do not see a good reason to add ifdef here.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---


Applied to linux-kbuild.



>  scripts/Makefile.build | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3665b1a0bc8e..9af88f4cacb8 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -384,16 +384,14 @@ $(obj)/%/built-in.a: $(obj)/% ;
>  #
>  # Rule to compile a set of .o files into one .a file (without symbol table)
>  #
> -ifdef builtin-target
>
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>
> -$(builtin-target): $(real-obj-y) FORCE
> +$(obj)/built-in.a: $(real-obj-y) FORCE
>         $(call if_changed,ar_builtin)
>
>  targets += $(builtin-target)
> -endif # builtin-target
>
>  #
>  # Rule to create modules.order file
> @@ -408,15 +406,11 @@ $(modorder-target): $(subdir-ym) FORCE
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
>  #
> -ifdef lib-target
> -
> -$(lib-target): $(lib-y) FORCE
> +$(obj)/lib.a: $(lib-y) FORCE
>         $(call if_changed,ar)
>
>  targets += $(lib-target)
>
> -endif
> -
>  # NOTE:
>  # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
>  # module is turned into a multi object module, $^ will contain header file
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
