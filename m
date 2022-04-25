Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E764750E804
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Apr 2022 20:22:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244300AbiDYSY6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 Apr 2022 14:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244272AbiDYSY5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 Apr 2022 14:24:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD5A10773D
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:21:52 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq30so27718906lfb.3
        for <linux-kbuild@vger.kernel.org>; Mon, 25 Apr 2022 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=da88Nu7vq7XE+J8Tfq4WUYeq5HXdHwOYLlI0FzHNI8I=;
        b=IDpo6ikWwvM+FaQcO+CIaSuMGHm/JZ3q4SIxY4sRzW0Jyg8HNlBWOW9UsCAdnaNy6g
         GQrN+3AbAfjDxqxng5pSy+A5fRamOcinx5CaBggk3VVsDLV09qhJOMGy7xi7oxMCKTrx
         4yEGTR7RIPGAtDBuymTlE4fC6tPmqorfhFuMRFu8WqEVDTj1Glsyn6PsgU/oC4Ea50Uu
         pTktpdVb88+KGiGuSD+NfiRIFN0oBu/j06GA8pemzdvIXOlD0uCSrmCbzd/l6y1hUzZo
         g9bv0wfyvQev97QBP/prvaS/npXYApavrvlKxJ2kLhRF1cEtrhw5Epyz7bIrhPOzxErk
         RKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=da88Nu7vq7XE+J8Tfq4WUYeq5HXdHwOYLlI0FzHNI8I=;
        b=tTcDomoWxUQxp4C+2wNfAE2xFwhS2uH0k3qUNilMBRA+GCnR4I/Qaws1P0jjz1jjUb
         P9YOhbYFIBmx11ksOvr70Cj5vSK9kYb+3NGK2pqEKIcgG00U/Fvl2jbC61V4N6chLQZz
         mPkBi/NnYMvhs3XhWk4N4/G3+sYBFTcOYP2NjHtLIJYj4n7OAHruFufqdX5xriyunVaX
         jz0rVQLyBIGyZ2KL+XVnxgFwMaVBrXbL2ji/dErQZZ8wf1tNhJmU2IfKcVhBVX81fMPV
         JFN88Yc/up0aVo5rqG09vc6513wxk1S0zIiRC95MJpGMrdNiT8Z0KOdLdn3eWd7DDDxy
         5HMg==
X-Gm-Message-State: AOAM532UMN6qFscKR3STHsbyi4Nbl2mj9yDIamVYzxWrOej64fI4Ka0T
        aMrdMiel5I7qQTKxYBRNnA96gRgF9ILoz/9k/sGesq8pphI=
X-Google-Smtp-Source: ABdhPJzVT4Ww3FyZ1/tzCoZ84eU4ZLq3do4Ia7/DX6eU9noDs3zWVOvLLGPOtU8KdI2xszEKyJGmmfN60DRhUlrY5Ks=
X-Received: by 2002:ac2:5223:0:b0:448:5100:e427 with SMTP id
 i3-20020ac25223000000b004485100e427mr14021593lfl.87.1650910910695; Mon, 25
 Apr 2022 11:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220424190811.1678416-1-masahiroy@kernel.org> <20220424190811.1678416-5-masahiroy@kernel.org>
In-Reply-To: <20220424190811.1678416-5-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 25 Apr 2022 11:21:39 -0700
Message-ID: <CAKwvOdk6WEz-408f_4m=9QeZGPveRX4hF6zxqtMVv1dCET0ruA@mail.gmail.com>
Subject: Re: [PATCH 04/27] modpost: add a separate error for exported symbols
 without definition
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Apr 24, 2022 at 12:09 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> It took me a while to understand the intent of "exp->module == mod".
>
> This code goes back to 2003 (pre-git era).
>
> The commit is not in this git repository, and might be worth a little
> explanation.
>
> You can add EXPORT_SYMBOL() with no definition in the same file (but you
> need to put a declaration).
>
>   int foo(void);
>   EXPORT_SYMBOL(foo);
>
> This is typical when EXPORT_SYMBOL() is defined in a C file, but the
> actual implementation is in a separate assembly file. In old days,
> EXPORT_SYMBOL() were only available in C files (but this limitation
> does not exist any more).
>
> Add a separate, clearer message if an exported symbol has no definition.
> It should be an error even if KBUILD_MODPOST_WARN is given.
>
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=2763b6bcb96e6a38a2fe31108fe5759ec5bcc80a

Differentiating between the two (and your explanation of how to reach
such a situation) is a nice touch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/mod/modpost.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index c7cfeeb088f7..969a081dba62 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2147,13 +2147,18 @@ static void check_exports(struct module *mod)
>         for (s = mod->unres; s; s = s->next) {
>                 const char *basename;
>                 exp = find_symbol(s->name);
> -               if (!exp || exp->module == mod) {
> +               if (!exp) {
>                         if (!s->weak && nr_unresolved++ < MAX_UNRESOLVED_REPORTS)
>                                 modpost_log(warn_unresolved ? LOG_WARN : LOG_ERROR,
>                                             "\"%s\" [%s.ko] undefined!\n",
>                                             s->name, mod->name);
>                         continue;
>                 }
> +               if (exp->module == mod) {
> +                       error("\"%s\" [%s.ko] was exported without definition\n",
> +                             s->name, mod->name);
> +                       continue;
> +               }
>                 basename = strrchr(mod->name, '/');
>                 if (basename)
>                         basename++;
> --
> 2.32.0
>


-- 
Thanks,
~Nick Desaulniers
