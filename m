Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 526B9130F4B
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jan 2020 10:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgAFJSv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 04:18:51 -0500
Received: from lhrrgout.huawei.com ([185.176.76.210]:2228 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725996AbgAFJSv (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 04:18:51 -0500
Received: from lhreml703-cah.china.huawei.com (unknown [172.18.7.108])
        by Forcepoint Email with ESMTP id 6D602A401906294B73BE;
        Mon,  6 Jan 2020 09:18:49 +0000 (GMT)
Received: from lhreml724-chm.china.huawei.com (10.201.108.75) by
 lhreml703-cah.china.huawei.com (10.201.108.44) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 6 Jan 2020 09:18:49 +0000
Received: from [127.0.0.1] (10.202.226.43) by lhreml724-chm.china.huawei.com
 (10.201.108.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 6 Jan 2020
 09:18:48 +0000
Subject: Re: [PATCH] merge_config.sh: Add option for allmodconfig
To:     <masahiroy@kernel.org>
CC:     <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <anders.roxell@linaro.org>
References: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
From:   John Garry <john.garry@huawei.com>
Message-ID: <7e769634-eb22-5827-e2d8-df68134056c0@huawei.com>
Date:   Mon, 6 Jan 2020 09:18:47 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <1575979754-184896-1-git-send-email-john.garry@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.43]
X-ClientProxiedBy: lhreml729-chm.china.huawei.com (10.201.108.80) To
 lhreml724-chm.china.huawei.com (10.201.108.75)
X-CFilter-Loop: Reflected
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/12/2019 12:09, John Garry wrote:

Hi Masahiro,

Could you please consider this patch?

Thanks,
John

> Recently there has been some work in reporting and fixing bugs in booting
> an allmodconfig kernel - here are a few examples:
> 
> https://lore.kernel.org/linux-edac/304df85b-8b56-b77e-1a11-aa23769f2e7c@huawei.com/T/#t
> https://lore.kernel.org/linux-ide/bdf02e03-86a1-3d35-2908-28187f504495@huawei.com/T/#t
> https://lore.kernel.org/netdev/CADYN=9LCPfbpwdTWKw03B22-y3Text=RWXW7XP7wJBHYsMOgrA@mail.gmail.com/
> https://sourceforge.net/p/openipmi/mailman/message/36871567/
> 
> If we want to boot an allmodconfig kernel we may still want to force some
> loadable modules built-in, like UART drivers. Or just still turn off some
> configs.
> 
> So add an option to add add fragments to an allmodconfig kernel.
> 
> Signed-off-by: John Garry <john.garry@huawei.com>
> 
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index 63c8565206a4..01697fb6dfbe 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -23,6 +23,7 @@ clean_up() {
>   usage() {
>   	echo "Usage: $0 [OPTIONS] [CONFIG [...]]"
>   	echo "  -h    display this help text"
> +	echo "  -a    use allmodconfig instead of alldefconfig"
>   	echo "  -m    only merge the fragments, do not execute the make command"
>   	echo "  -n    use allnoconfig instead of alldefconfig"
>   	echo "  -r    list redundant entries when merging fragments"
> @@ -41,6 +42,11 @@ CONFIG_PREFIX=${CONFIG_-CONFIG_}
>   
>   while true; do
>   	case $1 in
> +	"-a")
> +		ALLTARGET=allmodconfig
> +		shift
> +		continue
> +		;;
>   	"-n")
>   		ALLTARGET=allnoconfig
>   		shift
> @@ -171,6 +177,7 @@ fi
>   
>   # Use the merged file as the starting point for:
>   # alldefconfig: Fills in any missing symbols with Kconfig default
> +# allmodconfig: Fills in any missing symbols with =m when loadable
>   # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>   make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>   
> 

