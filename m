Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5833E34880E
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Mar 2021 05:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbhCYEsz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Mar 2021 00:48:55 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54528 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhCYEsZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Mar 2021 00:48:25 -0400
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12P4mAOE031060;
        Thu, 25 Mar 2021 13:48:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12P4mAOE031060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616647691;
        bh=/uaZX3bCHOhFgcOqswzfVAViushV7RuOF8pV66D1nrg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q8OTIEn9NFEfW46vVlA3Gy5OryaGw1dFcr0YmQ8octAuFAqWoT8nPfvup/gwjXAmG
         9ZWRde5n0Ct/LJgx+9XpazLWnwL62/ynhmb+nVPCZWtUOxh+4JxkDK+pu327A7X97H
         Rlfn64ZyqAGl6Gv3Alcq/VGh3EibG3hXWXvCfpWLBKCuAmp6K5pDbGSuwxM94MHpNl
         l6MFp5sJElnyXz54qqzNqiCoAyBYple2PhKc1Xh0vHvHUGqTQL+JudYYxRVuOFsi2O
         5gTihHS/Kp82q/EGrHjiA6dpxVEma9iDQPnXJ+WIDe0ZKEFNxEYllUk2gWh1YBODQs
         4k7Ku/Fibed1w==
X-Nifty-SrcIP: [209.85.216.53]
Received: by mail-pj1-f53.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so402530pjg.5;
        Wed, 24 Mar 2021 21:48:10 -0700 (PDT)
X-Gm-Message-State: AOAM530OoO05615gt0LXBM8HKL/ktP5pIGybdNFiQoWDYh89nJDwQ/78
        fQrt3Z0VdfWn5w7MZSYaYN71DYh4PCrBLgWAZLU=
X-Google-Smtp-Source: ABdhPJzQ4olnrldKlvYZdZkbfK800ZGmJQ6jon4C54m8CM+h+8pA+VuQT3T8IBjM3dm+RKXXaiF+D02hDVLye7GEbAg=
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr6924507pjb.87.1616647690109;
 Wed, 24 Mar 2021 21:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194836.372585-1-masahiroy@kernel.org>
In-Reply-To: <20210313194836.372585-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 25 Mar 2021 13:47:33 +0900
X-Gmail-Original-Message-ID: <CAK7LNARk6rZbJtCM50zx6XyPbWJrL8zPvCQU74jmMbLFvO-cpA@mail.gmail.com>
Message-ID: <CAK7LNARk6rZbJtCM50zx6XyPbWJrL8zPvCQU74jmMbLFvO-cpA@mail.gmail.com>
Subject: Re: [PATCH 01/13] kconfig: split randconfig setup code into set_randconfig_seed()
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Mar 14, 2021 at 4:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This code is too big to be placed in the switch statement.
>
> Move the code into a new helper function. I slightly refactor the code
> without changing the behavior.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

All applied to linux-kbuild/kconfig.




>  scripts/kconfig/conf.c | 54 ++++++++++++++++++++++++------------------
>  1 file changed, 31 insertions(+), 23 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 957d2a0832f7..063c9e7a34c1 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -82,6 +82,36 @@ static void xfgets(char *str, int size, FILE *in)
>                 printf("%s", str);
>  }
>
> +static void set_randconfig_seed(void)
> +{
> +       unsigned int seed;
> +       char *env;
> +       bool seed_set = false;
> +
> +       env = getenv("KCONFIG_SEED");
> +       if (env && *env) {
> +               char *endp;
> +
> +               seed = strtol(env, &endp, 0);
> +               if (*endp == '\0')
> +                       seed_set = true;
> +       }
> +
> +       if (!seed_set) {
> +               struct timeval now;
> +
> +               /*
> +                * Use microseconds derived seed, compensate for systems where it may
> +                * be zero.
> +                */
> +               gettimeofday(&now, NULL);
> +               seed = (now.tv_sec + 1) * (now.tv_usec + 1);
> +       }
> +
> +       printf("KCONFIG_SEED=0x%X\n", seed);
> +       srand(seed);
> +}
> +
>  static int conf_askvalue(struct symbol *sym, const char *def)
>  {
>         if (!sym_has_value(sym))
> @@ -515,30 +545,8 @@ int main(int ac, char **av)
>                         defconfig_file = optarg;
>                         break;
>                 case randconfig:
> -               {
> -                       struct timeval now;
> -                       unsigned int seed;
> -                       char *seed_env;
> -
> -                       /*
> -                        * Use microseconds derived seed,
> -                        * compensate for systems where it may be zero
> -                        */
> -                       gettimeofday(&now, NULL);
> -                       seed = (unsigned int)((now.tv_sec + 1) * (now.tv_usec + 1));
> -
> -                       seed_env = getenv("KCONFIG_SEED");
> -                       if( seed_env && *seed_env ) {
> -                               char *endp;
> -                               int tmp = (int)strtol(seed_env, &endp, 0);
> -                               if (*endp == '\0') {
> -                                       seed = tmp;
> -                               }
> -                       }
> -                       fprintf( stderr, "KCONFIG_SEED=0x%X\n", seed );
> -                       srand(seed);
> +                       set_randconfig_seed();
>                         break;
> -               }
>                 case oldaskconfig:
>                 case oldconfig:
>                 case allnoconfig:
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
