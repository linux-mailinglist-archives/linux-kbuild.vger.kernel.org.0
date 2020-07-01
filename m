Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C802E210FB9
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Jul 2020 17:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731382AbgGAPvf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Jul 2020 11:51:35 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:64755 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728105AbgGAPvf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:51:35 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 061Fp4HD006031;
        Thu, 2 Jul 2020 00:51:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 061Fp4HD006031
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593618665;
        bh=uFvZWWCKfl6kOkY+xy0MtHVpT6RGeLIKyJx1ia6JzGE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=bI5ngztq3zyUqAKwjQHDH5zTeQmDN2ksTvef2m/eZmMThptcqhtmqbypZZuyAgiqb
         SBTnwbzn9Izf+Bnq0VuCmatxM0LvNAACAg4kTTgCbNHmMSA3B0BsdDG4pNi/RXEwgG
         c2+TJ6bX60x6hGzSlXynbRvvZmcJvj5Gwxx0WuLwOg3kcettSzQR5KJbdyBcTTlGJB
         nv0PtmtGWICK9JJnR+9cYMYXcy9DRCZeDyUuojHoX4G9NsL7hHoagxdEoHSQWD0Swn
         UugDck9/GFwwpcrmIqwwaqfSADhtBT7aVk/YAoH8xTZt36ENd73dllGKV4pKj9kay5
         fqVVd+1YZg9yw==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id i8so7872375uak.9;
        Wed, 01 Jul 2020 08:51:05 -0700 (PDT)
X-Gm-Message-State: AOAM532CODwTrKqvtSOBBXyFMhqD5JQShf0VHjON49bfFjrBgWmtXUM3
        gh5apvhL78zAbnfTAgIKEY82jcSOQX0mgagak2o=
X-Google-Smtp-Source: ABdhPJzdt7MfUc5u1GeTqWH4GYdQ0BHc26iyGBX+SBlxXJ6y5nxOP8qSdR7NSlrI1EYDOXmOnTka03Q3FUMC+rqgN/o=
X-Received: by 2002:ab0:48:: with SMTP id 66mr5478934uai.40.1593618663924;
 Wed, 01 Jul 2020 08:51:03 -0700 (PDT)
MIME-Version: 1.0
References: <60381408622ebbb7d205b2cf6edcf8c6acecf1d7.1593584306.git.hns@goldelico.com>
In-Reply-To: <60381408622ebbb7d205b2cf6edcf8c6acecf1d7.1593584306.git.hns@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 2 Jul 2020 00:50:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASY18tKarE8gtmRd8o9uRPtF-7QAh_CLwrj8yvT_fEi0Q@mail.gmail.com>
Message-ID: <CAK7LNASY18tKarE8gtmRd8o9uRPtF-7QAh_CLwrj8yvT_fEi0Q@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: remove use of non-standard strsep() in HOSTCC code
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 1, 2020 at 3:18 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> strsep() is neither standard C nor POSIX and used outside
> the kernel code here. Using it here requires that the
> build host supports it out of the box which is e.g.
> not true for a Darwin build host and using a cross-compiler.
> This leads to:
>
> scripts/mod/modpost.c:145:2: warning: implicit declaration of function 'strsep' [-Wimplicit-function-declaration]
>   return strsep(stringp, "\n");
>   ^
>
> and a segfault when running MODPOST.
>
> See also: https://stackoverflow.com/a/7219504
>
> So let's replace this by strchr() instead of using strsep().
> It does not hurt kernel size or speed since this code is run
> on the build host.
>
> Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
> Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/mod/modpost.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6aea65c657454..45f2ab2ec2d46 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -138,11 +138,19 @@ char *read_text_file(const char *filename)
>
>  char *get_line(char **stringp)
>  {
> +       char *orig = *stringp, *next;
> +
>         /* do not return the unwanted extra line at EOF */
> -       if (*stringp && **stringp == '\0')
> +       if (!orig || *orig == '\0')
>                 return NULL;
>
> -       return strsep(stringp, "\n");
> +       next = strchr(orig, '\n');
> +       if (next)
> +               *next++ = '\0';
> +
> +       *stringp = next;
> +
> +       return orig;
>  }
>
>  /* A list of all modules we processed */
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
