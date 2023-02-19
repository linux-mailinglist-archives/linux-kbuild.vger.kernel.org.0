Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32AB369BFEE
	for <lists+linux-kbuild@lfdr.de>; Sun, 19 Feb 2023 11:14:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjBSKOy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 Feb 2023 05:14:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjBSKOy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Feb 2023 05:14:54 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA7A10A95;
        Sun, 19 Feb 2023 02:14:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 82A8A60C11;
        Sun, 19 Feb 2023 10:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4710C4339B;
        Sun, 19 Feb 2023 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676801691;
        bh=sNN8c94qA1yZlc1KlOz29fi1nBuqPs8632wXKj46328=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FfJrHOHfOvghJdnBIVi7Gv5Kc3EfdZScmpsLIdZzWpMEyASmseEaBmseo+jBmi9jJ
         YAtaOnumjPIGafXsq9KNDOttsyzvX1CgryuHjxsNH8eyLWECliB21Z3upGRol+QNm0
         KiyFp+6pHY13mCMe8sRSmPsJFR4CTDn//elx9KuuuS6Nk2waKUMtTDLutbwIS+JlDI
         oSUQ8M2pKUWG41CDlPsh7FY0iIgr49eA1W3Lr5zfbpVXBAVvLx246KucZxLdZJWmQf
         yX5jeDQ4p6N9uwn6Oxs3FTHiIL4xCHhvfiJw/TPvc2jI/cuDRCLktjk13l4Ncq6MOO
         c9lK23AX2iVjw==
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-171d57fcba3so634595fac.11;
        Sun, 19 Feb 2023 02:14:51 -0800 (PST)
X-Gm-Message-State: AO0yUKW78xCFfczao6dc5i5ehWVgq14kLnJxNrH8G+GKEIXMKtReqelm
        ghoKeEsaSQHQ7cFKNI79rbS5TOmpr8ZZ6c/qSpY=
X-Google-Smtp-Source: AK7set+zyV+dD80XZnkrT+/dXopUSPLMEroAOP2bmUZGlzQqg5q2AvNWCeKql6sz5q5oOygGHV4gggGRiFn7s2R1sIE=
X-Received: by 2002:a05:6870:c1ce:b0:16e:9431:5c2e with SMTP id
 i14-20020a056870c1ce00b0016e94315c2emr443762oad.56.1676801690999; Sun, 19 Feb
 2023 02:14:50 -0800 (PST)
MIME-Version: 1.0
References: <20230217065246.31641-1-rdunlap@infradead.org>
In-Reply-To: <20230217065246.31641-1-rdunlap@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 19 Feb 2023 19:14:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT4KW=SiWSYyC7fZYcpX5-6FFsPsHCVNbTvvgdKCXSctw@mail.gmail.com>
Message-ID: <CAK7LNAT4KW=SiWSYyC7fZYcpX5-6FFsPsHCVNbTvvgdKCXSctw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: save the KCONFIG_SEED value in the config file
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 17, 2023 at 3:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Save (print) the randconfig seed value in the kernel .config file.
> This enables someone to see easily that the .config file is a
> randconfig file.


I still do not understand why this is useful.

Who cares if it was generated by randconfig or menuconfig?
They are the same.




If I run "make randconfig" followed by "make olddefconfig",
I get the same .config file, except that "KCONFIG_SEED=..."
has disappeared.

So, you cannot carry this kind of information, anyway.



$ make  randconfig
KCONFIG_SEED=0x69256B40
#
# configuration written to .config
#

$ make olddefconfig
#
# configuration written to .config
#

$ diff -u .config.old .config
--- .config.old 2023-02-19 19:03:16.831931359 +0900
+++ .config 2023-02-19 19:03:37.147477826 +0900
@@ -1,7 +1,6 @@
 #
 # Automatically generated file; DO NOT EDIT.
 # Linux/x86 6.2.0-rc5 Kernel Configuration
-# KCONFIG_SEED=0x69256B40
 #
 CONFIG_CC_VERSION_TEXT="gcc (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
 CONFIG_CC_IS_GCC=y







>
> It also allows the randconfig file to be recreated by using the
> KCONFIG_SEED environment variable, as long as KCONFIG_PROBABILITY
> was not specified (the default probability values were used) and
> as long as the file was not edited.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> ---
>  scripts/kconfig/conf.c     |    3 +++
>  scripts/kconfig/confdata.c |    2 ++
>  scripts/kconfig/lkc.h      |    2 ++
>  3 files changed, 7 insertions(+)
>
> diff -- a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -83,6 +83,8 @@ static void xfgets(char *str, int size,
>                 printf("%s", str);
>  }
>
> +unsigned int rand_seed;
> +
>  static void set_randconfig_seed(void)
>  {
>         unsigned int seed;
> @@ -109,6 +111,7 @@ static void set_randconfig_seed(void)
>                 seed = (now.tv_sec + 1) * (now.tv_usec + 1);
>         }
>
> +       rand_seed = seed;
>         printf("KCONFIG_SEED=0x%X\n", seed);
>         srand(seed);
>  }
> diff -- a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -621,6 +621,8 @@ static void conf_write_heading(FILE *fp,
>                 cs->decoration);
>
>         fprintf(fp, "%s %s\n", cs->decoration, rootmenu.prompt->text);
> +       if (rand_seed)
> +               fprintf(fp, "%s KCONFIG_SEED=0x%X\n", cs->decoration, rand_seed);


If 'rand_seed' just happens to become zero,
this does not print it, which is weird.


The seed is generated by:

     seed = (now.tv_sec + 1) * (now.tv_usec + 1);


This is very rare, but it may become zero.







-- 
Best Regards
Masahiro Yamada
