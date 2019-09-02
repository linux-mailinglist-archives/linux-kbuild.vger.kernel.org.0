Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2A9A58F0
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2019 16:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730417AbfIBOOL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Sep 2019 10:14:11 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:50256 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729865AbfIBOOL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Sep 2019 10:14:11 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: gtucker)
        with ESMTPSA id 94EAD283C9B
Subject: Re: [PATCH 1/1] merge_config.sh: ignore unwanted grep errors
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Mark Brown <broonie@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com, linux-tegra <linux-tegra@vger.kernel.org>
References: <4f92e9b3a88e60c8b5962504d77bc596442b0a40.1567023309.git.guillaume.tucker@collabora.com>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <b1dc3c40-b658-211e-811c-e13083303d48@collabora.com>
Date:   Mon, 2 Sep 2019 15:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4f92e9b3a88e60c8b5962504d77bc596442b0a40.1567023309.git.guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+ Jon Hunter who hit a similar issue

On 28/08/2019 21:19, Guillaume Tucker wrote:
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
> ---
>  scripts/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index d924c51d28b7..d673268d414b 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -177,7 +177,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>  for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
>  
>  	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> -	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> +	ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG" || echo)
>  	if [ "x$REQUESTED_VAL" != "x$ACTUAL_VAL" ] ; then
>  		echo "Value requested for $CFG not in final .config"
>  		echo "Requested value:  $REQUESTED_VAL"
> 
