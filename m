Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE70EECCDA
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2019 03:04:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726932AbfKBCEp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Nov 2019 22:04:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43154 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726229AbfKBCEo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 22:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6AcKh7bcLqCzJSUuW0dX9kUURS5rjuJAhVd4nPUBnME=; b=lsX25X19dLzZfCwkW15H4ElOL
        V+Lsg0X1JevZgQrQdPtkikhpkhQxzDLfF+BrvaZXGGdPJLG25cJZTSj+nXg9k1z8gZAgd+UeuDuO/
        ERi1CyzkbN1WU9TrzbXUMeREzwW64l06/MhRRQtqkjCry1d1xKrgaNWgUHU8uL6acP+5gxTGUotiI
        md9rfOF4Px4k3m9PCQT3JQhtG9xo4onUMlysMsBFyuUv64z/at6wAlg3UovE9xKTRLMDInWi9oN2J
        1TUxcqg9tkvArRa6OLlCs+Ame3XEqTO9NgIkJ6ht69CCIeRbIjm6FvmouyXRq78ClgvnQ5kL4Yyxt
        WKnssP/yg==;
Received: from [2601:1c0:6280:3f0::4ba1]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iQimR-0004fi-08; Sat, 02 Nov 2019 02:04:43 +0000
Subject: Re: [PATCH] scripts:prune-kernel:Removed old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     bfields@fieldses.org, yamada.masahiro@socionext.com,
        michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191101080510.26247-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <180b82ba-f90d-e3de-9ce1-c77a79d014d2@infradead.org>
Date:   Fri, 1 Nov 2019 19:04:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191101080510.26247-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/1/19 1:05 AM, Bhaskar Chowdhury wrote:
> This patch allow you to remove old kernels and associated modules
> directory from the system.You can do it at once with the -r flag
> and interactively with the -i flag.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Hi Bhaskar,

I think that you are getting a lot closer with this patch, but
there are still a few issues.  And of course, it's not up to me
whether the patch is applied.

See below.

> ---
>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index a25aa2160d47..373a845792e6 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -1,3 +1,66 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
> +#This script will remove old kernels and modules directory related to it.
> +# "-h" or "--help" show how to use this script or show without parameter.
> +#"-r" or "--remove" show how to silently remove old kernel and modules dir.
> +#"-i" or "--interactive" show how to remove interactively.
> 
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
> +	printf "Usage: $(basename $0) [-ri] \n"
> +	printf "\n -r or --remove  kernel_version modules_version \n"
> +	printf "\n -i or --interactive do as interactive way \n"

In those 3 printf's, drop the ending space before the \n.

> +	return 0
> +}
> +
> +	case "$flag" in
> +		-i | --interactive)
> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"

Drop the %s - it's not needed.

> +			read kernel_version
> +			if [[ $kernel_version != "" ]]; then
> +				remove_old_kernel
> +				printf "Please give the full modules directory name to remove:%s"

Drop the %s here also.

> +				read modules_version
> +				if [[ $modules_version != "" ]]; then
> +					remove_old_modules_dir
> +					printf "\n\nRemoved kernel version:$kernel_version and associated modules directory:$modules_version ...Done \n"
> +				else
> +					exit 1
> +				fi
> +			fi

There is still a small problem here: if I enter a kernel_version and then
remove_old_kernel() is called, and then I enter "" for modules_version,
the script exits without that printf line.  I guess that it is possible
that someone only wants to remove the kernel_version files and not the modules.

Perhaps the thing to do is just make the prompts and calls and printf totally
separate and repeated for kernel_version and modules_version.  Do you see
what I mean?  or do you have other ideas about this?

> +			;;
> +		-h | --help)
> +			usage
> +			exit 1
> +			;;
> +		-r | --remove)
> +			if [[ $# -ne 3 ]]; then
> +				printf "You need to provide kernel version and modules directory name \n"

Drop the space before the \n.

> +				exit 1
> +			else
> +				remove_old_kernel
> +				remove_old_modules_dir
> +			fi
> +			;;
> +		*)
> +			usage
> +			exit 1
> +			;;
> +	esac
> --

Same comment as before: after applying this patch, the "new" scripts/prune-kernel file
still contains the previous script's for-loop at the end of the "new" script.


-- 
~Randy

