Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31E57EF32E
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Nov 2019 03:03:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729899AbfKECDP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Nov 2019 21:03:15 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:36334 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbfKECDP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 21:03:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Lv6yerxMciLJWR+oLBIAbVir7+PH5W017iQgkhnlSeQ=; b=u1sa6//REVpmLHZyonlnyJGe7
        BFdrc1DF4ovjJuCw0A63kSuWFbhfPRdEAayLHltGUf58HCXWJhcGiwuGkTEwScSJu6hOHTZIOplJx
        O/VQ9WX7MBF2mIVG5TCoBoCrK3fcazky+IvFeCk4hBQi41UEtX1lESdTNCiVY+A6lr1arLfsCrPix
        9n5ZMm+LWPdedFd/Q/zD9gGoaplSeQdjlJipmqcSdCebhTAa1svM9pHP9CVDrsPB4Lu1QDE4zNwBt
        qYXBQq5dkqh1RcntoZ7b2cnxxEieYdrHb6sO7zQYLQhyJX4z4dtPMkaTDM4dFslVFp+G0xl2Njok0
        O5K07EqtA==;
Received: from [2601:1c0:6280:3f0::4ba1]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iRoBe-00036U-Bf; Tue, 05 Nov 2019 02:03:14 +0000
Subject: Re: [PATCH] scripts:prune-kernel:remove old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191102063036.28601-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <50680c37-9e85-0050-c1e1-700260a0471c@infradead.org>
Date:   Mon, 4 Nov 2019 18:03:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191102063036.28601-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/1/19 11:30 PM, Bhaskar Chowdhury wrote:
> This patch allow you to remove old kernels and associated modules
> directory from the system.You can do it at once with the -r flag
> and interactively with the -i flag.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 82 +++++++++++++++++++++++++++++++++++---------
>  1 file changed, 65 insertions(+), 17 deletions(-)

Hi,
I believe that this script now does what the patch author intends it to do.
It does have a few whitespace issues, but no big deals.  (see below)

Tested-by: Randy Dunlap <rdunlap@infradead.org>


> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index e8aa940bc0a9..01d0778db71f 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -1,21 +1,69 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
> +#This script will remove old kernels and modules directory related to it.
> +#"-r" or "--remove" show how to silently remove old kernel and modules dir.
> +# "-h" or "--help" show how to use this script or show without parameter.
> +#"-i" or "--interactive" show how to remove interactively.
> +
> +flag=$1
> +kernel_version=$2
> +modules_version=$3
> +boot_dir=/boot
> +modules_dir=/lib/modules
> +
> +remove_old_kernel() {
> +	cd $boot_dir
> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
> +	return 0
> +}
> +
> +remove_old_modules_dir() {
> +	cd $modules_dir
> +	rm -rf $modules_version
> +	return 0
> +}
> +
> +usage() {
> +	printf "Usage: $(basename $0) [-ri]\n"
> +	printf "\n -r or --remove  kernel_version modules_version\n"
> +	printf "\n -i or --interactive do as interactive way\n"
> +	return 0
> +}
> +
> +case "$flag" in
> +	-i | --interactive)
> +		printf "\nEnter kernel version to remove or blank/empty to exit:"
> +		read kernel_version
> +		if [[ $kernel_version != "" ]]; then
> +			remove_old_kernel
> +			printf "\nRemoved kernel version:$kernel_version from the system.\n\n"

space after ':'

drop one \n above.

> +			printf "Please give the full modules directory name to remove:"
> +			read modules_version
> +			if [[ $modules_version != "" ]]; then
> +				remove_old_modules_dir
> +				printf "\n\nRemoved modules directory:$modules_version from the system.\n\n"

space after ':'

drop one \n above.

> +			else
> +				exit 1
> +			fi
> +		fi
> +		;;
> +	-h | --help)
> +		usage
> +		exit 0
> +		;;
> +	-r | --remove)
> +		if [[ $# -ne 3 ]]; then
> +			 printf "You need to provide kernel version and modules directory name.\n"
> +			 exit 1
> +		 else
> +			 remove_old_kernel
> +			 remove_old_modules_dir
> +		fi
> +		;;
> +	*)
> +		usage
> +		exit 1
> +		;;
> +esac
> 
> -# because I use CONFIG_LOCALVERSION_AUTO, not the same version again and
> -# again, /boot and /lib/modules/ eventually fill up.
> -# Dumb script to purge that stuff:
> 

OK, the former script's loop is removed.. good.
But the 2 preceding blank lines are not removed, so the script
now ends with 2 unnecessary blank lines.

> -for f in "$@"
> -do
> -        if rpm -qf "/lib/modules/$f" >/dev/null; then
> -                echo "keeping $f (installed from rpm)"
> -        elif [ $(uname -r) = "$f" ]; then
> -                echo "keeping $f (running kernel) "
> -        else
> -                echo "removing $f"
> -                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
> -                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
> -                rm -rf "/lib/modules/$f"
> -                new-kernel-pkg --remove $f
> -        fi
> -done
> --


-- 
~Randy

