Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40282BC78
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 May 2019 02:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727018AbfE1Ae0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 May 2019 20:34:26 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:50687 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726979AbfE1Ae0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 May 2019 20:34:26 -0400
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x4S0YKiD004921;
        Tue, 28 May 2019 09:34:20 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x4S0YKiD004921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559003661;
        bh=3P73O5gTOiUhunX8XgHHSHMUBPQ/EkadM91CCTlh3Ps=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HDu3Om1qj0yk7VWuOix7b9vG9xFHwsMDadl04+sBwbso/nn2xOVBuVZKl0YzPA+UB
         lCV2lsA/lDotypaQ5L5MeMw/dT9EKIGH0cAakq/RHhuIcCIPTPsrVTpRdP6l0rXW0F
         wuyA2m5ZK8jIj0pjSFhgJ5R/ZtRuXRqWmnBbukGMgXw+ZchwlUId6FXqw2u4lrOh9k
         rhnyd8tJH7j6J0h6ELCdruZqBU0fuPD0SXUIW+58r4wq/mQQlBHRsE0IigNEI438xA
         MEKUMYL57NtrFlc/BXP6KAE/H2XvIkiGFKO/PNHirnSRmSrUCToG7GPTW75AVmJRuD
         ADnvwpKlNfz8g==
X-Nifty-SrcIP: [209.85.221.171]
Received: by mail-vk1-f171.google.com with SMTP id j124so4247735vkb.4;
        Mon, 27 May 2019 17:34:20 -0700 (PDT)
X-Gm-Message-State: APjAAAUKSrWD76GNEWrl6S/TAe4pJ2S2NLYSUqhTsWS8ir8uiAnDpvk5
        lLP8JzvswwMWSUm7hs/PUTs+1NSigC+S2TxY6xY=
X-Google-Smtp-Source: APXvYqwpp7mFy3Xgm3KfJTDPN/UrdFLQq2EaP+/9BTd0pLh/eUfA/NqSpIzpfGTeQa1bZBRmDWcleusmsE581OAkAzs=
X-Received: by 2002:ac5:c215:: with SMTP id m21mr397308vkk.84.1559003659644;
 Mon, 27 May 2019 17:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190527235423.153853-1-tgb.kernel@gmail.com>
In-Reply-To: <20190527235423.153853-1-tgb.kernel@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 28 May 2019 09:33:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARj12T2vtBmVcDLoF2Z7G-TiDhXc0JZ7yRqAwMZCo47mQ@mail.gmail.com>
Message-ID: <CAK7LNARj12T2vtBmVcDLoF2Z7G-TiDhXc0JZ7yRqAwMZCo47mQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: tar-pkg: enable communication with jobserver
To:     Trevor Bourget <tgb.kernel@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 28, 2019 at 8:55 AM Trevor Bourget <tgb.kernel@gmail.com> wrote:
>
> The buildtar script might want to invoke a make, so tell the parent
> make to pass the jobserver token pipe to the subcommand by prefixing
> the command with a +.
>
> This addresses the issue seen here:
>
>         /bin/sh ../scripts/package/buildtar tar-pkg
>         make[3]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
>
> See https://www.gnu.org/software/make/manual/html_node/Job-Slots.html
> for more information.
>
> Signed-off-by: Trevor Bourget <tgb.kernel@gmail.com>
> ---

Applied to linux-kbuild/fixes. Thanks.

>  scripts/package/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 27b42d5b6c4f..ca7f46b562a4 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -104,7 +104,7 @@ clean-dirs += $(objtree)/snap/
>  # ---------------------------------------------------------------------------
>  tar%pkg: FORCE
>         $(MAKE) -f $(srctree)/Makefile
> -       $(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
> +       +$(CONFIG_SHELL) $(srctree)/scripts/package/buildtar $@
>
>  clean-dirs += $(objtree)/tar-install/
>
> --
> 2.22.0.rc1.257.g3120a18244-goog
>


-- 
Best Regards
Masahiro Yamada
