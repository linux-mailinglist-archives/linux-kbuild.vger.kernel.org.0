Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89742DBB31
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Dec 2020 07:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgLPG3H (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Dec 2020 01:29:07 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:39937 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725812AbgLPG3H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Dec 2020 01:29:07 -0500
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BG6Rpx8005555;
        Wed, 16 Dec 2020 15:27:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BG6Rpx8005555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608100071;
        bh=gpPjJysJvaYX+2trqIsbs8noZs8c0RM6aINeItaGmPw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0c+nKeAQjjbSB++0kQUYMHQpU9UW2GCAGu7KnG9yXVMEE6ezXEq3ujrRSicv4tuqL
         HZi8cKRd6RKRTKeZj9pAmKQJbvuWU9Ul6RzEvhONegK3zJARWxard8pLxUun/cvEWr
         2YOQsTea3NmpjNryFqPEoBhxVai/1jaHnTcKXh/tAnBIrPPznwuDxG7L4vhKcy+P4h
         VvFwU3vTZsKNk1mVP20lX21kvwXaaF7VUuMG6N4a5Rlw3c4WVpOTY6NZURgB49/HPX
         H8dGCCOxIPYpO6tz1DEwY2N2DQMyBGZKyF81Op5vAaA2jE7BuXvjV+aVKaIX+dmRfl
         f7RypZy50cWjQ==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id h186so5492939pfe.0;
        Tue, 15 Dec 2020 22:27:51 -0800 (PST)
X-Gm-Message-State: AOAM530aGKc8C9xIBB3IEIEK0uZsD1VQnoY6pxk735ykaj+Jq/ns9Ihq
        NXZPKsP+1ogii0ZQ/FZRDP+ud6J6REHvY6zGgmI=
X-Google-Smtp-Source: ABdhPJwth77/SETECJKEfVmNAa0dfNH92VGQl4pH/8wML5QfD2H392sTXSa/KkknYFgE4i1vMyDcAxRaS93kJVAUNxE=
X-Received: by 2002:a62:e519:0:b029:197:bcec:7c0c with SMTP id
 n25-20020a62e5190000b0290197bcec7c0cmr31336197pff.63.1608100070724; Tue, 15
 Dec 2020 22:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20201201103418.675850-1-masahiroy@kernel.org>
In-Reply-To: <20201201103418.675850-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 16 Dec 2020 15:27:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQQwFY75fqfzU4EFJLbTP1KUmAAnL8iJfSMwV7pjhvF+A@mail.gmail.com>
Message-ID: <CAK7LNAQQwFY75fqfzU4EFJLbTP1KUmAAnL8iJfSMwV7pjhvF+A@mail.gmail.com>
Subject: Re: [PATCH 1/5] modpost: rename merror() to error()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Quentin Perret <qperret@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 1, 2020 at 7:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> The log function names, warn(), merror(), fatal() are inconsistent.
>
> Commit 2a11665945d5 ("kbuild: distinguish between errors and warnings
> in modpost") intentionally chose merror() to avoid the conflict with
> the library function error(). See man page of error(3).
>
> But, we are already causing the conflict with warn() because it is also
> a library function. See man page of warn(3). err() would be a problem
> for the same reason.
>
> The common technique to work around name conflicts is to use macros.
>
>     #define error __error
>     void __error(const char *fmt, ...)
>     {
>             <our own implementation>
>     }
>
>     #define warn __warn
>     void __warn(const char *fmt, ...)
>     {
>             <our own implementation>
>     }
>
> In this way, we can implement our own warn() and error(), still we can
> include <error.h> and <err.h> with no problem.
>
> And, commit 93c95e526a4e ("modpost: rework and consolidate logging
> interface") already did that.
>
> Since the log functions are all macros, we can use error() without
> causing "conflicting types" errors.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

This series, applied to linux-kbuild.


> ---
>
>  scripts/mod/modpost.c | 10 +++++-----
>  scripts/mod/modpost.h |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index f882ce0d9327..337f6ca4bda3 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -403,8 +403,8 @@ static void sym_update_namespace(const char *symname, const char *namespace)
>          * actually an assertion.
>          */
>         if (!s) {
> -               merror("Could not update namespace(%s) for symbol %s\n",
> -                      namespace, symname);
> +               error("Could not update namespace(%s) for symbol %s\n",
> +                     namespace, symname);
>                 return;
>         }
>
> @@ -2226,7 +2226,7 @@ static int check_modname_len(struct module *mod)
>         else
>                 mod_name++;
>         if (strlen(mod_name) >= MODULE_NAME_LEN) {
> -               merror("module name is too long [%s.ko]\n", mod->name);
> +               error("module name is too long [%s.ko]\n", mod->name);
>                 return 1;
>         }
>
> @@ -2319,8 +2319,8 @@ static int add_versions(struct buffer *b, struct module *mod)
>                         continue;
>                 }
>                 if (strlen(s->name) >= MODULE_NAME_LEN) {
> -                       merror("too long symbol \"%s\" [%s.ko]\n",
> -                              s->name, mod->name);
> +                       error("too long symbol \"%s\" [%s.ko]\n",
> +                             s->name, mod->name);
>                         err = 1;
>                         break;
>                 }
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 3aa052722233..f453504ad4df 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -202,5 +202,5 @@ enum loglevel {
>  void modpost_log(enum loglevel loglevel, const char *fmt, ...);
>
>  #define warn(fmt, args...)     modpost_log(LOG_WARN, fmt, ##args)
> -#define merror(fmt, args...)   modpost_log(LOG_ERROR, fmt, ##args)
> +#define error(fmt, args...)    modpost_log(LOG_ERROR, fmt, ##args)
>  #define fatal(fmt, args...)    modpost_log(LOG_FATAL, fmt, ##args)
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
