Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A602F5FBD0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Oct 2022 23:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJKVgh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Oct 2022 17:36:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiJKVgf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Oct 2022 17:36:35 -0400
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C087A536
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Oct 2022 14:36:34 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 29BLaJI8016109
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Oct 2022 06:36:19 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 29BLaJI8016109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1665524179;
        bh=FG7FIrINJLDG1C9EQ7AOLrV21jlfq/ZPPC77vWXwuPM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Jbou0Z0cjemKrF5WSPQyqxxB2pWhljvCFsPb/E+RJY8XXaDPu+ccAEuE8mcqSN0sW
         Dm0b/OdlvwuisOC/nLGnYUG5k8uqQyHLZH44xT1nedhvYEM4iF2xMArL0n4yrSzhhj
         XV9blMOtXnrRO5nQoHA6izomECTyr1hDPLvhKVeWDdzfqgfKAtbkAn1G741B9n2vPw
         uYcnPSomJoPEjgdDSRnbJcdaUyFXq1H0Hl/lzcPZ6R4xlF7Okm+AmilZQiIke0Z2xs
         j9qEomOCnSD3R1sauOTMNtMx+wzDfbouhH4ewRD0aqKNroignh+2+7oacAfPSTbTco
         YVK/ORg2muh2Q==
X-Nifty-SrcIP: [209.85.167.178]
Received: by mail-oi1-f178.google.com with SMTP id w74so9081676oie.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Oct 2022 14:36:19 -0700 (PDT)
X-Gm-Message-State: ACrzQf1ykvZzKDZaEgsxcON6eTAQNMnAt5wuM5UE8QA2AMIvGjt5Npfk
        teGMb9a8EgCfT7Q1RuE0C0HNzc+KyZcH2fNHExs=
X-Google-Smtp-Source: AMsMyM7wqiXu6svoaV7RAGhNyOiJnq1m3RJdTOSSdZ7DKolhUiNKDV8GVgMpz1Jeqn4TQ6i5AoF+NrO6NxaTO9njcO0=
X-Received: by 2002:a05:6808:1b85:b0:34d:8ce1:d5b0 with SMTP id
 cj5-20020a0568081b8500b0034d8ce1d5b0mr596590oib.194.1665524178327; Tue, 11
 Oct 2022 14:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20221011013828.267658-1-mailingradian@gmail.com>
In-Reply-To: <20221011013828.267658-1-mailingradian@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 12 Oct 2022 06:35:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNARg2F66LrgU4AxT08HEabayW5k+2oQpgcbPhMHBx9R3zA@mail.gmail.com>
Message-ID: <CAK7LNARg2F66LrgU4AxT08HEabayW5k+2oQpgcbPhMHBx9R3zA@mail.gmail.com>
Subject: Re: [PATCH] modpost: put modpost options before argument
To:     Richard Acayan <mailingradian@gmail.com>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 11, 2022 at 10:38 AM Richard Acayan <mailingradian@gmail.com> wrote:
>
> The musl implementation of getopt stops looking for options after the
> first non-option argument. Put the options before the non-option
> argument so environments using musl can still build the kernel and
> modules.
>
> Fixes: f73edc8951b2 ("kbuild: unify two modpost invocations")
> Link: https://git.musl-libc.org/cgit/musl/tree/src/misc/getopt.c?h=dc9285ad1dc19349c407072cc48ba70dab86de45#n44
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Applied to linux-kbuild. Thanks.


>  scripts/Makefile.modpost | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
> index 7740ce3b29e8..8489a3402eb8 100644
> --- a/scripts/Makefile.modpost
> +++ b/scripts/Makefile.modpost
> @@ -119,7 +119,7 @@ quiet_cmd_modpost = MODPOST $@
>                 echo >&2 "WARNING: $(missing-input) is missing."; \
>                 echo >&2 "         Modules may not have dependencies or modversions."; \
>                 echo >&2 "         You may get many unresolved symbol warnings.";) \
> -       sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) $(vmlinux.o-if-present) -T -
> +       sed 's/ko$$/o/' $(or $(modorder-if-needed), /dev/null) | $(MODPOST) $(modpost-args) -T - $(vmlinux.o-if-present)
>
>  targets += $(output-symdump)
>  $(output-symdump): $(modorder-if-needed) $(vmlinux.o-if-present) $(moudle.symvers-if-present) $(MODPOST) FORCE
> --
> 2.38.0
>


-- 
Best Regards
Masahiro Yamada
