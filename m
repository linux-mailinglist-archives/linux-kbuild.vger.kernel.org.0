Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 784F0A6647
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 12:10:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728592AbfICKKl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 06:10:41 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:19248 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726840AbfICKKl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 06:10:41 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d6e3c210000>; Tue, 03 Sep 2019 03:10:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 03 Sep 2019 03:10:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 03 Sep 2019 03:10:40 -0700
Received: from [10.21.132.148] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Sep
 2019 10:10:38 +0000
Subject: Re: [PATCH v2] merge_config.sh: ignore unwanted grep errors
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@collabora.com>, <linux-tegra@vger.kernel.org>
References: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <3f5df041-ae53-8719-41f4-7b56a49a8bbc@nvidia.com>
Date:   Tue, 3 Sep 2019 11:10:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a60fe77a1475ba960ad9fc851f1ace2196b661b8.1567436778.git.guillaume.tucker@collabora.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1567505441; bh=yP6lqyVaco/w8M3HPHrreEiKuBrDXd5RtrVC6WjwWEc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=UGwCFRV0Ly2PlBdVSpRr7afLSTbHcab2B7bfyl79fab/T7BNnoy+vQnPz0bX1ckfn
         PSUPZalh4PZwiZakqR4lzs+LcCU5b5YaxdZRX3C3REDmqa98VOmD2eAQTd1QoGBqsi
         1SjQjmtki2yOkbidr8U6z/PEzCnE4Dx/pDXUri52W509E7wpR5yFEROE1YvEesxAiB
         hdJHcssoRksOKUTQzTBSKH4JkaEQN2wXOlPeg95ZNr9TdcFyH4EvNlbMzECBEQS7gf
         8Ny30rGUJ50mhG4XiVbQyAltLtnA+NxCX4lK0sacxmFpjPWyBIncyR7JzOMLYYBd67
         9Ot0b4PMKXSEA==
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 02/09/2019 16:18, Guillaume Tucker wrote:
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
> 
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
>  	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || true)
>  	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>  		echo "Value requested for $CFG not in final .config"
>  		echo "Requested value:  $REQUESTED_VAL"
> 

Thanks for fixing! Great if we could get this into -next as soon as
possible!

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
