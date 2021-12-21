Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9144C47C984
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Dec 2021 00:11:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235697AbhLUXLn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 21 Dec 2021 18:11:43 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:50389 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235616AbhLUXLm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Dec 2021 18:11:42 -0500
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 1BLNBQ9a032621
        for <linux-kbuild@vger.kernel.org>; Wed, 22 Dec 2021 08:11:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 1BLNBQ9a032621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1640128286;
        bh=+u45vcldtVPnNJ6wF5zGzY+YAtVUec3hLaKzgflcEQ0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zQaMVZNxvNy3S8vrlmuDuU4cnP3+q+F+MnD9q/Ciki3TX2ilsgnTj3iyjX6TdqIfW
         zsJY/fLS4vjJ35cffPqX/gZhuakI1kGltLPzGNMmDBW3ZJu2ac6vm4AnJMFlWXr8rR
         jQGKo4eBT2Ap29/nekF8r9fK/9W8Y30u7m7DGLCjGUK4JyhqCGKccSK1vTSy3opHe7
         GWqs66Hy7SFAy8lBJrctVqq1iHgQMNLKMiih47ngSB1DHEb7RfYvE8FuzjgHiGx8Gr
         xB94dE4iHgMSmqnygZYQ+iozV3tOIfzn9TXDs5QTeFFTo/b1n/Dt6z/okCOQ/pg90d
         g93StdO+ArWpg==
X-Nifty-SrcIP: [209.85.214.169]
Received: by mail-pl1-f169.google.com with SMTP id z3so410219plg.8
        for <linux-kbuild@vger.kernel.org>; Tue, 21 Dec 2021 15:11:26 -0800 (PST)
X-Gm-Message-State: AOAM532MPTnqAd4B8XQxO9fKdegI39dnC1w3melmtdzCwBIDCuDQOHIl
        BlJTmZcMw/5iRaQryvflJ8JSRu2Qccs5Mlfcm4g=
X-Google-Smtp-Source: ABdhPJxcijCNvrwvnM54VjGkvz/z0djtWVboIrnv02hha1oF1lmykXFXdBF2X1yUtNg5D/t9SbllPc9lOHlrWotORTM=
X-Received: by 2002:a17:902:9a47:b0:148:a2f7:9d69 with SMTP id
 x7-20020a1709029a4700b00148a2f79d69mr531218plv.136.1640128285682; Tue, 21 Dec
 2021 15:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20211220162925.14441-1-ysionneau@kalray.eu> <20211220162925.14441-2-ysionneau@kalray.eu>
In-Reply-To: <20211220162925.14441-2-ysionneau@kalray.eu>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 22 Dec 2021 08:10:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQdxcs61Nspf0b3tZa1NYqXGH_0DU=_1qd3EpHzKJ2J2w@mail.gmail.com>
Message-ID: <CAK7LNAQdxcs61Nspf0b3tZa1NYqXGH_0DU=_1qd3EpHzKJ2J2w@mail.gmail.com>
Subject: Re: [PATCH 1/1] Use target CPP to pre-process dts as supported flag
 checks are done on target toolchain
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Dec 21, 2021 at 1:36 AM Yann Sionneau <ysionneau@kalray.eu> wrote:
>
> If some flag is not supported by host toolchain but is supported by target toolchain, then
> using host toolchain will fail here because the checks are only done on target toolchain.


Then,
some flag is not supported by target toolchain but is supported by
host toolchain


> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>  scripts/Makefile.lib | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 94133708889d..1d11b7a23957 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -316,7 +316,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>         $(call if_changed,dt_S_dtb)
>
>  quiet_cmd_dtc = DTC     $@
> -cmd_dtc = $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
> +cmd_dtc = $(CC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \

This change is not sensible at all.


This is a partial revert of the following:

commit 37c8a5fafa3bb7dcdd51774be353be6cb2912b86
Author: Rob Herring <robh@kernel.org>
Date:   Wed Jan 10 15:19:37 2018 -0600

    kbuild: consolidate Devicetree dtb build rules





>         $(DTC) -O $(patsubst .%,%,$(suffix $@)) -o $@ -b 0 \
>                 $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>                 -d $(depfile).dtc.tmp $(dtc-tmp) ; \
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
