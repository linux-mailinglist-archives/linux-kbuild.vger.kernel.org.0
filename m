Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AC3A06C6
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 17:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfH1P5H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 11:57:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26895 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726400AbfH1P5H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 11:57:07 -0400
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x7SFujdT012309;
        Thu, 29 Aug 2019 00:56:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7SFujdT012309
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567007806;
        bh=WOq24sipo81zCaadKOitrcTEmGWmhSf63Aseozcvth4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s/mlgRFC8JlsS8RKx3q5gkPZ/FgEQlIglWZ4C7FhPI61Tj14OfoMCV52TNuKgtLWD
         +dmB5dnaNueaTeD8jQNlSAA9QqNNaz4tRwibip3yERyacGjoKUF4KO6abpn/FYaWyn
         kVOG+MmBjbD7YQBm8WQVZFqm/+C8EfIqIo1OpfUU3aI4edfqrdubrJyDnh1MeR9Zao
         8dimoJHA3G4c5+8GMI5fIXcpGPNSPybOxeiL6+2KrlsFBa+jQDd/pfOwR2kw5lmWka
         dUS2Zpdi33q+Tr1aeNv32xfXAtwGFCmW6kxKmHuUUMWR8GK7pUQJjQjWpawPQhPOY4
         sxPlkKRTRjl6g==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id m8so150445uap.2;
        Wed, 28 Aug 2019 08:56:45 -0700 (PDT)
X-Gm-Message-State: APjAAAXsI4USpKHh1gUVMpqDKyKhr+I4Oi/JwILDDE5ceGzDx0bk42KL
        r43kc8CfXRpUhYSmdJLCf+/sjx3V8HBvlUdMpUA=
X-Google-Smtp-Source: APXvYqxCJTJMwAgad/wrd/Erm8vHTvEsfUwENUJFnK5ZpZbjks9UMh0JTq4OWQ3PDFeaiZLvIccFWiEl4uydZut6vsI=
X-Received: by 2002:a9f:31cb:: with SMTP id w11mr2358004uad.40.1567007804525;
 Wed, 28 Aug 2019 08:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190827122023.15086-1-efremov@linux.com>
In-Reply-To: <20190827122023.15086-1-efremov@linux.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 29 Aug 2019 00:56:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNASMc058_R4ewCQQ9KZJcZDckDw9EjJo-YyVne6hYGm-Zw@mail.gmail.com>
Message-ID: <CAK7LNASMc058_R4ewCQQ9KZJcZDckDw9EjJo-YyVne6hYGm-Zw@mail.gmail.com>
Subject: Re: [PATCH] modpost: add NOFAIL to strndup
To:     Denis Efremov <efremov@linux.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 27, 2019 at 9:20 PM Denis Efremov <efremov@linux.com> wrote:
>
> Add NOFAIL check for the strndup call, because the function
> allocates memory and can return NULL. All calls to strdup in
> modpost are checked with NOFAIL.
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mod/modpost.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f277e116e0eb..0255538528fe 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -795,9 +795,9 @@ static int match(const char *sym, const char * const pat[])
>
>                 /* "*foo*" */
>                 if (*p == '*' && *endp == '*') {
> -                       char *here, *bare = strndup(p + 1, strlen(p) - 2);
> +                       char *bare = NOFAIL(strndup(p + 1, strlen(p) - 2));
> +                       char *here = strstr(sym, bare);
>
> -                       here = strstr(sym, bare);
>                         free(bare);
>                         if (here != NULL)
>                                 return 1;
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
