Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCB41A6BA1
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 16:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbfICOgM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 10:36:12 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52847 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbfICOgM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 10:36:12 -0400
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id x83EZwT2022252;
        Tue, 3 Sep 2019 23:35:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com x83EZwT2022252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567521359;
        bh=9ktFv0qZHrNLdzrwjcOGtLvCO084ibPuQ/N0Fl+gU7A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=pwupB7wsJBDjVzey/sEx5VW86n2PROIGMQzx4U5hbo4a2h1b5xQ3WdE1N979d6J9F
         DR+sWBkxx1pqUQpBr95IPreqDLj+oXd5PXqzsJlDGkLnuyh+1JGmEUSG+cx/Yr6T9M
         8XXa7wb/o+/xYDFkxQQNQRPAxmiZ7zn/zGSIl3V7eJ5e8O3p1rQ8/LHhzq1UbOgOXy
         o8ZjOCmMkgfHGvJJ4Y4jgYQNLYt9m48u54KLC/kBtr3wn9wl2uncITqiOjZFA7vPdS
         uANvM0rSylpeKXcguYLy5cNM41i00pNLod0U4A8YGBQQTI9B+j/wUMTHmvbdidQQnh
         CTVSmoc3uvgjg==
X-Nifty-SrcIP: [209.85.221.181]
Received: by mail-vk1-f181.google.com with SMTP id q186so2377422vkb.0;
        Tue, 03 Sep 2019 07:35:59 -0700 (PDT)
X-Gm-Message-State: APjAAAV4FuSRzkv9Azw5gmRvFJzevb9Qz9Nf3l28VgFj+68j0aeojXOu
        COmHAOxt1jTEGPmYzymf4qZGviU2leW3Ze8jN10=
X-Google-Smtp-Source: APXvYqy0zd0XCOiNJxfynAjeoj6yEDocIr/Bo5zsIY6FWiw85VvyTZZTmXSZF7V1YGMIunqTucAAB2GBOylGzkFGOFU=
X-Received: by 2002:a1f:294a:: with SMTP id p71mr10414923vkp.74.1567521358284;
 Tue, 03 Sep 2019 07:35:58 -0700 (PDT)
MIME-Version: 1.0
References: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
In-Reply-To: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 3 Sep 2019 23:35:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS5eYnsuaZ2XxCb1HXmV=QqfgPZNz_E=Ad+CZnDdLdO8A@mail.gmail.com>
Message-ID: <CAK7LNAS5eYnsuaZ2XxCb1HXmV=QqfgPZNz_E=Ad+CZnDdLdO8A@mail.gmail.com>
Subject: Re: [PATCH v2] merge_config.sh: ignore unwanted grep errors
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kernel@collabora.com, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 3, 2019 at 12:19 AM Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> The merge_config.sh script verifies that all the config options have
> their expected value in the resulting file and prints any issues as
> warnings.  These checks aren't intended to be treated as errors given
> the current implementation.  However, since "set -e" was added, if the
> grep command to look for a config option does not find it the script
> will then abort prematurely.
>
> Handle the case where the grep exit status is non-zero by setting
> ACTUAL_VAL to an empty string to restore previous functionality.
>
> Fixes: cdfca821571d ("merge_config.sh: Check error codes from make")
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied to linux-kbuild.
Thanks.



> Notes:
>     v2: use true rather than echo as per Jon Hunter's suggestion
>
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index d924c51d28b7..f2cc10b1d404 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -177,7 +177,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>  for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>
>         REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
>         if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>                 echo "Value requested for $CFG not in final .config"
>                 echo "Requested value:  $REQUESTED_VAL"
> --
> 2.20.1
>


-- 
Best Regards
Masahiro Yamada
