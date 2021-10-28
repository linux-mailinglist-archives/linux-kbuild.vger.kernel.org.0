Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7825243D981
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Oct 2021 04:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhJ1CwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Oct 2021 22:52:06 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:50388 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbhJ1CwG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Oct 2021 22:52:06 -0400
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 19S2nKQa013659
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Oct 2021 11:49:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 19S2nKQa013659
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1635389361;
        bh=NEE86w6ZlqoOCmKqsOnIbDQrnTfXESHLbnBkUVjZ+Ig=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lJ6uoFaFkMEFU6IIjyXqFBoYNFNuXBrulKanOcVF0VQJCMEpOZBZQC2MFTNmi1Por
         yNWICCDe78gqZDGnI5ng3GFVsiP8vcgSWGwtjZhauzS1nxgD7wD7N984TKkTRe8e50
         cWcj9i4Vfb3lupCBh7rje/BQoJAkLpzzhMQvBW5iIkqeacJ9/kW2yrOA/ejpDI53iF
         DhqgC0zFOYWo2/iMTgtVEEuyzY1J3wE6M8fSROZWhHzF0m/9ngDZ7ScMnozUks0J4Q
         dZCgZtGfBglTI0kBqQddJJC2GsrVfl8a/f4H6Xbrwbg3e5BWzKAa3Vd3Z7Exw8GIba
         2bPIZSivYAqkA==
X-Nifty-SrcIP: [209.85.216.48]
Received: by mail-pj1-f48.google.com with SMTP id nn3-20020a17090b38c300b001a03bb6c4ebso3563688pjb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Oct 2021 19:49:21 -0700 (PDT)
X-Gm-Message-State: AOAM5309mfjMblCoqNg38BZp9wWzrjO8ZUZjpRtMGAbhkIugU3pbPIDh
        /lnghc9HXWO0sMAweE/BFTbrgCdS6Z3aruuCmJg=
X-Google-Smtp-Source: ABdhPJyKNMjixOOwitMak3ow4qWVQvkeOAOP9em2jBntijCYY6ZTFGKFolNfQG7BIEqnnQ4RMAQrBeixFcgpMxGKOiM=
X-Received: by 2002:a17:90a:bf04:: with SMTP id c4mr1609322pjs.77.1635389360176;
 Wed, 27 Oct 2021 19:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <c2b36549-5c9e-2314-bc68-b81b7c77a561@rub.de> <fdbbc1a6-5806-85a0-5b37-206558facaab@rub.de>
In-Reply-To: <fdbbc1a6-5806-85a0-5b37-206558facaab@rub.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Oct 2021 11:48:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNARvsoNBxvMMD5+kszX+2T+RFaixNrd++xzvbUv5zQTASA@mail.gmail.com>
Message-ID: <CAK7LNARvsoNBxvMMD5+kszX+2T+RFaixNrd++xzvbUv5zQTASA@mail.gmail.com>
Subject: Re: [RFC 12/12] Simplify dependencies for MODULE_SIG_KEY_TYPE_RSA & MODULE_SIG_KEY_TYPE_ECDSA
To:     Thorsten Berger <thorsten.berger@rub.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, deltaone@debian.org,
        phayax@gmail.com, Eugene Groshev <eugene.groshev@gmail.com>,
        Sarah Nadi <nadi@ualberta.ca>, Mel Gorman <mgorman@suse.de>,
        "Luis R. Rodriguez" <mcgrof@suse.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 20, 2021 at 6:49 PM Thorsten Berger <thorsten.berger@rub.de> wrote:
>
> Co-developed-by: Patrick Franz <deltaone@debian.org>
> Signed-off-by: Patrick Franz <deltaone@debian.org>
> Co-developed-by: Ibrahim Fayaz <phayax@gmail.com>
> Signed-off-by: Ibrahim Fayaz <phayax@gmail.com>
> Reviewed-by: Luis Chamberlain <mcgrof@suse.com>
> Tested-by: Evgeny Groshev <eugene.groshev@gmail.com>
> Suggested-by: Sarah Nadi <nadi@ualberta.ca>
> Suggested-by: Thorsten Berger <thorsten.berger@rub.de>
> Signed-off-by: Thorsten Berger <thorsten.berger@rub.de>
>



I had sent an equivalent patch before, (with commit description).

https://lore.kernel.org/all/20211001040126.1200230-1-masahiroy@kernel.org/




> ---
>  certs/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/certs/Kconfig b/certs/Kconfig
> index ae7f2e876a31..f69c92e5bc30 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -17,6 +17,7 @@ config MODULE_SIG_KEY
>
>  choice
>      prompt "Type of module signing key to be generated"
> +    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
>      default MODULE_SIG_KEY_TYPE_RSA
>      help
>       The type of module signing key type to generate. This option
> @@ -24,14 +25,12 @@ choice
>
>  config MODULE_SIG_KEY_TYPE_RSA
>      bool "RSA"
> -    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
>      help
>       Use an RSA key for module signing.
>
>  config MODULE_SIG_KEY_TYPE_ECDSA
>      bool "ECDSA"
>      select CRYPTO_ECDSA
> -    depends on MODULE_SIG || (IMA_APPRAISE_MODSIG && MODULES)
>      help
>       Use an elliptic curve key (NIST P384) for module signing. Consider
>       using a strong hash like sha256 or sha384 for hashing modules.
> --
> 2.33.0
>
>


-- 
Best Regards
Masahiro Yamada
