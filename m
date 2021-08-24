Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7E43F5F24
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Aug 2021 15:26:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237467AbhHXN1N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 24 Aug 2021 09:27:13 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:24724 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbhHXN1L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Aug 2021 09:27:11 -0400
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17ODPpiK025487;
        Tue, 24 Aug 2021 22:25:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17ODPpiK025487
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629811552;
        bh=+41Zxm2FsAgrjPQ3e1GsD+XrDE0aYWFGzJ6F++bMS28=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P7HcYpM9h14HNuFw4i4FvcoQ9qOGmyJw39IU01QGI8hpP80D/ccbARkRpA9ivH0Th
         rjay7EmsSaZdrR2DLxey1URes5WOY3gIQfE8b6sTRqB7Ir1WYu5K770/BZRTzKgiiQ
         Q4Na5ANvzuY7HH5XX+s3q92sIXZ9tQ8iBjrCWgoCQuXr+KencatxcVH5D4GkRTa6wX
         Ec2bCG+pL8oPng6BAjJ+OHDp9RP4RSCR9Ld2XI8rmaLMNdMTssd3h/7sgrWPDIkwew
         QDee0cTLTnZ9njLV3KdecN95Jj04Khwz/B2qUVZ34NbN5t6u3GaoYnf91zqMYHttwv
         8HY8BALQ0USSg==
X-Nifty-SrcIP: [209.85.216.50]
Received: by mail-pj1-f50.google.com with SMTP id j10-20020a17090a94ca00b00181f17b7ef7so1791620pjw.2;
        Tue, 24 Aug 2021 06:25:52 -0700 (PDT)
X-Gm-Message-State: AOAM531jVWOwrfGyrxD4jGQC+uXojEUR9KnzWTDdUdOUkRuI0j/YyA5X
        KXoemaRRU0EuQjgWCj/7hfop89WgfajMvuQtWXc=
X-Google-Smtp-Source: ABdhPJzOH8og1gJqsSjiudYLR2AeLqtdW+Fz1Q/zdpuBSl9JwIxVz3okV6p02LFD9dfsoorF0W6DxT31qPnbVKEC55w=
X-Received: by 2002:a17:90b:3545:: with SMTP id lt5mr4462196pjb.198.1629811551463;
 Tue, 24 Aug 2021 06:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210822192205.43210-1-arielmarcovitch@gmail.com> <20210822192205.43210-2-arielmarcovitch@gmail.com>
In-Reply-To: <20210822192205.43210-2-arielmarcovitch@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 24 Aug 2021 22:25:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASw7pX9ROtOq5FKQuoOqxi4opwef-jB_348TkCsfhoeDQ@mail.gmail.com>
Message-ID: <CAK7LNASw7pX9ROtOq5FKQuoOqxi4opwef-jB_348TkCsfhoeDQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] checkkconfigsymbols.py: Fix the '--ignore' option
To:     Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 23, 2021 at 4:22 AM Ariel Marcovitch
<arielmarcovitch@gmail.com> wrote:
>
> It seems like the implementation of the --ignore option is broken.
>
> In check_symbols_helper, when going through the list of files, a file is
> added to the list of source files to check if it matches the ignore
> pattern. Instead, as stated in the comment below this condition, the
> file should be added if it doesn't match the pattern.
>
> This means that when providing an ignore pattern, the only files that
> will be checked will be the ones we want the ignore, in addition to the
> Kconfig files that don't match the pattern (the check in
> parse_kconfig_files is done right)
>
> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
> ---
>  scripts/checkkconfigsymbols.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
> index 1548f9ce4682..b9b0f15e5880 100755
> --- a/scripts/checkkconfigsymbols.py
> +++ b/scripts/checkkconfigsymbols.py
> @@ -329,7 +329,7 @@ def check_symbols_helper(pool, ignore):
>          if REGEX_FILE_KCONFIG.match(gitfile):
>              kconfig_files.append(gitfile)
>          else:
> -            if ignore and not re.match(ignore, gitfile):
> +            if ignore and re.match(ignore, gitfile):
>                  continue

This fix seems correct.
Applied to linux-kbuild.



>              # add source files that do not match the ignore pattern
>              source_files.append(gitfile)
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
