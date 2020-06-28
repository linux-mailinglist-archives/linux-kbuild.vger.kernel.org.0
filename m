Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE2FE20C649
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 07:51:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgF1Fv5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 01:51:57 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:53856 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgF1Fv5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 01:51:57 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 05S5pfls003704;
        Sun, 28 Jun 2020 14:51:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 05S5pfls003704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593323502;
        bh=61tWKKIMFN6BaEeg9Bqklk+Fh8IwDai3TVuH1BHG+lI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HEgYa2hkn0bH+szXSenlSokKdVuetPO9DycBvSD0gWz68dz1ikpNjtKZno/Km+4Wj
         h5pn4uNEZB1duyUCjx07MLqpFPjQlqznkQQIa+lFC8JPVNyJ56vXGk/I67WZQhicO5
         uZgu7N1TP7IYd1QrSOZ2rpXJHYrfU4mkTpmHFUb0GCVTDFa1fzozxyKQUiWIjQviCo
         2IkEDlRp3UkeO+gcm9Ox0AL7MqOmdk9GQvJ4W9NIJ2p+UOwxffCJFr3rVdZ27bI8rE
         y+7npqjZzXnBwtiBPIQO2lLeo0xV9VKCDADUQ+fyGoD0b4REgA3Op/ARst1GJ3+PqB
         ksspt9s3QeSFg==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id y7so3058211vkf.9;
        Sat, 27 Jun 2020 22:51:42 -0700 (PDT)
X-Gm-Message-State: AOAM533TkW8+Ncuqab8NipC+YGOXkb3a17UhsYyHX7GCjod72vClt8EF
        sgXf6Z/guNXyQi4+czD5w4QOw+BWQPPkFL7NWCY=
X-Google-Smtp-Source: ABdhPJxJsdNQVxtQy0O7PSUiBuJ/syUyeaOJthSfcnROM4FOd29vGVghnOfNA3mHALdoVZCPdG0z0G/Lssy9tgIA/zQ=
X-Received: by 2002:a1f:1f04:: with SMTP id f4mr6785741vkf.73.1593323500842;
 Sat, 27 Jun 2020 22:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com>
In-Reply-To: <11c1e65b393b4c3ca6118515c77bbf19524dab11.1593074472.git.hns@goldelico.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 28 Jun 2020 14:51:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com>
Message-ID: <CAK7LNATCLscXNDZ1RUmbnM5BeV-tvKjz9kQB8eo0SNp10WbjFQ@mail.gmail.com>
Subject: Re: [PATCH] modpost: remove use of non-standard strsep() in HOSTCC code
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

On Thu, Jun 25, 2020 at 5:47 PM H. Nikolaus Schaller <hns@goldelico.com> wrote:
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
> So let's add some lines of code separating the string at the
> next newline character instead of using strsep(). It does not
> hurt kernel size or speed since this code is run on the build host.
>
> Fixes: ac5100f5432967 ("modpost: add read_text_file() and get_line() helpers")
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  scripts/mod/modpost.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 6aea65c65745..8fe63989c6e1 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -138,11 +138,16 @@ char *read_text_file(const char *filename)
>
>  char *get_line(char **stringp)
>  {
> +       char *p;
>         /* do not return the unwanted extra line at EOF */
>         if (*stringp && **stringp == '\0')

This check does not make sense anymore.

Previously, get_line(NULL) returns NULL.

With your patch, get_line(NULL) crashes
due to NULL-pointer dereference.



>                 return NULL;
>
> -       return strsep(stringp, "\n");
> +       p = *stringp;
> +       while (**stringp != '\n')
> +               (*stringp)++;


Is this a safe conversion?

If the input file does not contain '\n' at all,
this while-loop continues running,
and results in the segmentation fault
due to buffer over-run.



> +       *(*stringp)++ = '\0';
> +       return p;
>  }



How about this?

char *get_line(char **stringp)
{
        char *orig = *stringp;
        char *next;

        /* do not return the unwanted extra line at EOF */
        if (!orig || *orig == '\0')
                return NULL;

        next = strchr(orig, '\n');
        if (next)
                *next++ = '\0';

        *stringp = next;

        return orig;
}




>  /* A list of all modules we processed */
> --
> 2.26.2
>


--
Best Regards
Masahiro Yamada
