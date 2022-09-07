Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997015AFBB2
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Sep 2022 07:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbiIGF0t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Sep 2022 01:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbiIGF0r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Sep 2022 01:26:47 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FBE8606B
        for <linux-kbuild@vger.kernel.org>; Tue,  6 Sep 2022 22:26:40 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id c131-20020a1c3589000000b003a84b160addso10358642wma.2
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Sep 2022 22:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=NvEpawVU43CQEPdiD+maS4WjEIU7TgNeblzpXWOWBNY=;
        b=HCcE5eP2qPdnk062hSf9HlpaG09HiztTaFaYb4j/c1Hz9nmApKsg95kcWca54vnD5F
         hQK1kRvc55xN7cePiHH5npOX2mTnAW8Zt+yrEjdSkEQtKdWYhLB9bBllcEpguqQUkjX8
         NKwPg80PVvwbCVszLKq7/6pjBQvvVMZnULg8yYESyzcTrq8zlJGfGcUDjq/OmkU/Q9DX
         tA26zdRck1inI6Nn5XAOoFZz2aNVGV0hOnxmDDtycuU5ChKVPnJD1EAcf7WljD1e6/fq
         ywG4SLny7UGRxJm7LwgBP67iKXIeHn45RMjb3zCxT7f9P4Jh+B811seZcHnLZeqRv6tC
         w/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=NvEpawVU43CQEPdiD+maS4WjEIU7TgNeblzpXWOWBNY=;
        b=YRIGhljoG0yO2AbkBYzLKOYD0j15Va0EnxacoDPDYrPAyjKoLadg1h+pHddj0TpsiF
         LcibS4Qoywd/zed61r7YNgejsPBxTNp5rnj0955z9fw0Gb3dM3II1drY6n7Rda7zIl9P
         DREKTBUFjwYdvF7J2MDOxX/grU4TiN0fXblMOMKhonQ17ZJtpstTMsthe8TgUPwg8DsS
         1Iu0JDxSynJ8Sf1ARwjKlvec0H5UTfbCoHhSIPI8PUdjqZq2aRaYmB1FTnOp8uTVjKaL
         +94kfJBlTDOwGywoSGM6BtgEUfK3rt7MhLaCKQIFqiXRjiN2v3OXr5QfUyxEKLFPoT5f
         h1VA==
X-Gm-Message-State: ACgBeo3F9LrLeHiYcCIvzueNFuRUhQoa8DI0CkNg85inmDErNC4CWOtF
        U3uYpxCC5IFUwNMSD9vYcyQQxkaIG3586Z0Cgp3C3x/GYW3otw==
X-Google-Smtp-Source: AA6agR4EPA7+UWeDj+Gy86ZrDnQptPDyahAhsG2cq7AB7r9o1zP1h3/iBpCwwjrGwQMoBjBdJ+AzKyUZc7yKPRQkY5A=
X-Received: by 2002:a05:600c:4ca3:b0:3a6:1616:e591 with SMTP id
 g35-20020a05600c4ca300b003a61616e591mr809365wmp.99.1662528398751; Tue, 06 Sep
 2022 22:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220906193436.2135744-1-masahiroy@kernel.org>
In-Reply-To: <20220906193436.2135744-1-masahiroy@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 6 Sep 2022 22:26:27 -0700
Message-ID: <CAKwvOdnhW7j0y_DH5W42VBsODH1BN01hSGiTXFF1KiW1w__twA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: use modpost-args-y to clean up modpost arguments
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 6, 2022 at 12:35 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Separate the modpost executable (scripts/mod/modpost) and the command
> parameters for the next commit.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile                 |  2 +-
>  scripts/Makefile.modpost | 22 +++++++++++-----------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index aee4f0769d9d..e07236209606 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1908,7 +1908,7 @@ tags TAGS cscope gtags: FORCE
>  # ---------------------------------------------------------------------------
>
>  PHONY += nsdeps
> -nsdeps: export KBUILD_NSDEPS=1
> +nsdeps: export KBUILD_NSDEPS=y
>  nsdeps: modules
>         $(Q)$(CONFIG_SHELL) $(srctree)/scripts/nsdeps
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index ceb1d78140e7..87821a5fe16b 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -38,17 +38,17 @@ __modpost:
>  include include/config/auto.conf
>  include $(srctree)/scripts/Kbuild.include
>
> -MODPOST = scripts/mod/modpost                                                          \
> -       $(if $(CONFIG_MODVERSIONS),-m)                                                  \
> -       $(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)                                        \
> -       $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)                                  \
> -       $(if $(KBUILD_NSDEPS),-d $(MODULES_NSDEPS))                                     \
> -       $(if $(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)$(KBUILD_NSDEPS),-N)       \
> -       -o $@
> +MODPOST = scripts/mod/modpost
> +
> +modpost-args-$(CONFIG_MODVERSIONS)                             += -m
> +modpost-args-$(CONFIG_MODULE_SRCVERSION_ALL)                   += -a
> +modpost-args-$(CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS)  += -N
> +modpost-args-$(KBUILD_NSDEPS)                                  += -N -d $(MODULES_NSDEPS)

Was it intentional that you included -N for KBUILD_NSDEPS? That seems
like a change in behavior.  Everything else LGTM but that.

> +modpost-args-y += $(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)

Ugh, your pattern kind of falls apart for the above ^.  Maybe this is
the most concise way to express this, but boy I sure do sometimes wish
for a programming language that had booleans and simple negation.
Maybe I would regret that in a build system...
-- 
Thanks,
~Nick Desaulniers
