Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DB6E61124
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 16:38:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfGFOi0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 10:38:26 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28682 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbfGFOi0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 10:38:26 -0400
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x66EcKkt000659;
        Sat, 6 Jul 2019 23:38:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x66EcKkt000659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562423901;
        bh=PVCFVmyvT9EjILIv3Kkv4dgmBeJ8MNfOpTsOuaznyq4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qnCXUPNXNGSEmzhaBqa6BtS3Qsngwd+3SkaZRZDyVIbBIc89wP8T482xmFnk54qHn
         69VUChZpoyGGKrrTrKPvLL/pXF7oOX3XWHveA9UtVHH4cRH55cMaUzaqZ7oeLR7PR8
         mPTrAG4rTBFa2U0KJ0lJkiYvw70Atw/akVmPP1UKviYgs8Po6oeQd3MOfITv+wgG0C
         q2EUFrXcZQjppAmNPE9kv0/orYJ2tX7Le0d/oLFLWFQK5ZNJEeBFxzRq33EhXVTeXi
         owetfSsdeWVhyxgiFo7xHGnHNKgK9XXxM/uKun/2esEs+WG4n/yIQP/zKpqnNj8HhA
         6/ca8wFfqDIcw==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id m8so5512102vsj.0;
        Sat, 06 Jul 2019 07:38:20 -0700 (PDT)
X-Gm-Message-State: APjAAAUMZ1NgKZBUSwI920aPSte06d/Ae6CF2X3T61OLQijmLoD2HKMK
        nMG7v1vnNHhEa/UvHzrFGHqZalduBbCyjDcBSd8=
X-Google-Smtp-Source: APXvYqz/0CW3uSWzYLP0qJaZZfTTulvrddvSBI1PPL8hvcZkBfYdco9ohdL/wybUc7dPXzoEe2XVFJQF2dXRFskUk6U=
X-Received: by 2002:a67:f495:: with SMTP id o21mr5369277vsn.54.1562423899788;
 Sat, 06 Jul 2019 07:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190628051300.30678-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190628051300.30678-1-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 6 Jul 2019 23:37:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
Message-ID: <CAK7LNAQ8M_z-z8tp-OiU=n13iggqEyY084S5HNS3p8LwM3qc1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -E instead of -c for __cc-option
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jun 28, 2019 at 2:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Use -E instead of -c like scripts/Kconfig.include
> This makes the compiler flag evaluation slightly faster.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.



>  scripts/Kbuild.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index f641bb0aa63f..e4329b92d165 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -113,7 +113,7 @@ as-instr = $(call try-run,\
>  # __cc-option
>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
>  __cc-option = $(call try-run,\
> -       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +       $(1) -Werror $(2) $(3) -E -x c /dev/null -o "$$TMP",$(3),$(4))
>
>  # Do not attempt to build with gcc plugins during cc-option tests.
>  # (And this uses delayed resolution so the flags will be up to date.)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
