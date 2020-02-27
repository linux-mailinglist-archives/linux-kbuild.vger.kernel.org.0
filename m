Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9655E1723C8
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2020 17:45:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730379AbgB0QpG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Feb 2020 11:45:06 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:53132 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730420AbgB0QpG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:45:06 -0500
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01RGitMm029840;
        Fri, 28 Feb 2020 01:44:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01RGitMm029840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582821896;
        bh=QoZtAtgAqRAkKXxlxSngjsc6R6InFotjoOk35rOFKdA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MJaFBMSLTbNeFRrmfS/YdzQf4KVLPrKJbmkcoh+EDlK2wQvco7gYhJt4mIKTc13CT
         q2b+uCV00nUrJ6UNiWZW8lA98+aWgK1Fqqjfu0Xx4HB/BkgV9l04NYr6sufeO/8uKR
         lTvJNrJ7hV7wCVCNKR5vJEF5/BXb0QWyuA0ZFqXArTJmqcmPrGsaXufKoXTQclReO2
         DcvItUdV2u9gV413Kfm7RTgPiPJH0F7+52JRl9xzTpG6ReUV0cXbRUfL+6VSenxRVI
         mfJWdQPCg+0O0HydObgZ3cbdopfJA7UqxG685wIxEDGb1qYVnlXE5H/b3KlU30hO7F
         Cxw42nC5T7X+Q==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id i78so85312vke.0;
        Thu, 27 Feb 2020 08:44:56 -0800 (PST)
X-Gm-Message-State: ANhLgQ0j9KdjN0Snj91Lau+npr1usQ7pAijTPP/41gNPSg2bnNXrfTga
        4QwnwDVyRLY3Wc7nzAWKU1Phpv6F+RHfdhqFjiU=
X-Google-Smtp-Source: ADFU+vt7mju6iysoK1Pjsu+r3uD9pJPKkQz09HLKvUkZgp/B8is5NTbwLbAvviP3iFdp/vRucYRlpuyRr4k/eLVrIew=
X-Received: by 2002:a1f:2f4c:: with SMTP id v73mr76527vkv.12.1582821894871;
 Thu, 27 Feb 2020 08:44:54 -0800 (PST)
MIME-Version: 1.0
References: <20200218095859.9725-1-masahiroy@kernel.org>
In-Reply-To: <20200218095859.9725-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 01:44:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATVao=FodbS2y8ECqNVPQ7gdPN8f=AzpbmACyjiiVJSXQ@mail.gmail.com>
Message-ID: <CAK7LNATVao=FodbS2y8ECqNVPQ7gdPN8f=AzpbmACyjiiVJSXQ@mail.gmail.com>
Subject: Re: [PATCH] fixdep: remove unneeded code and comments about *.ver files
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 18, 2020 at 6:59 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is probably stale code. In old days (~ Linux 2.5.59), Kbuild made
> genksyms generate include/linux/modules/*.ver files.
>
> The currenct Kbuild does not generate *.ver files at all.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.

>
>  scripts/basic/fixdep.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/scripts/basic/fixdep.c b/scripts/basic/fixdep.c
> index 9ba47b0a47b9..ad2041817985 100644
> --- a/scripts/basic/fixdep.c
> +++ b/scripts/basic/fixdep.c
> @@ -77,11 +77,6 @@
>   * dependencies on include/config/my/option.h for every
>   * CONFIG_MY_OPTION encountered in any of the prerequisites.
>   *
> - * It will also filter out all the dependencies on *.ver. We need
> - * to make sure that the generated version checksum are globally up
> - * to date before even starting the recursive build, so it's too late
> - * at this point anyway.
> - *
>   * We don't even try to really parse the header files, but
>   * merely grep, i.e. if CONFIG_FOO is mentioned in a comment, it will
>   * be picked up as well. It's not a problem with respect to
> @@ -299,8 +294,7 @@ static void *read_file(const char *filename)
>  static int is_ignored_file(const char *s, int len)
>  {
>         return str_ends_with(s, len, "include/generated/autoconf.h") ||
> -              str_ends_with(s, len, "include/generated/autoksyms.h") ||
> -              str_ends_with(s, len, ".ver");
> +              str_ends_with(s, len, "include/generated/autoksyms.h");
>  }
>
>  /*
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
