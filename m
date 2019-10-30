Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAE34E93FF
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2019 01:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfJ3AF1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 29 Oct 2019 20:05:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42954 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725974AbfJ3AF0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 29 Oct 2019 20:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4eLWX4aGGrtYqinzHW7T2fJxD73XVQJfUWvqDtu77Mk=; b=Rz8J7E1NZ62orPlNUgDL4VGtl
        GiiMK3iBW654P7JbjDO4lzW99hLccBQWLcskHIrohxfuyqdK8gbW5gASgbg6zpcn9WsVKvBdigDs5
        GS4AamLX9zys/aSrtjVBRj4+lfoq0ugyevY+DLVq8p77QfJgT3rU6PQ38iEfMLGgHdAobvbuTszZK
        P0vW9qo/prQxuJfON8ZwL6pW2oWaA8P6oHGyD4NlSWctTLwFucN4Y7sI1TIIuY34FT/6yHp1vAfdF
        YT1MEqjQfpRYB8T6So8fROW8gL5MaCQtfU0PhKsgmQV5mPQaw+k0z3YUqOwrnMZHMqPz8k+Zu+Iqa
        CG2uZlIow==;
Received: from [2603:3004:32:9a00::f45c] (helo=dragon.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iPbUL-0006ry-53; Wed, 30 Oct 2019 00:05:25 +0000
Subject: Re: [PATCH] scripts:prune-kernel:prune kernel and modules dir from
 the system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, bfields@fieldses.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191029030030.31659-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <de2a4604-e3ba-dab1-c72c-a0ff451541cf@infradead.org>
Date:   Tue, 29 Oct 2019 17:05:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191029030030.31659-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 10/28/19 8:00 PM, Bhaskar Chowdhury wrote:
> This patch will remove old kernel and modules directory from 
> the system interactive way and also at once ,provied the parameter
> given to the invoking script.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 58 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index 58a7650ce592..a6c990450ddc 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -1,2 +1,60 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
> +#This script will delete old kernels and modules directory related to it,both
> +#automated and interactive way, if you choose -i or --interactive as parameter.
> +#For normal operation you have to invoke this script like below
> +#prune-kernel -r kernel_ver modules_dir_name
> +flag=$1
> +kernel_ver=$2
> +modules_dir_name=$3
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
> +	printf "\n -r | --remove kernel_ver modules_dir_name \n"
> +	printf "\n -i | --interactive use as interactive way \n"
> +}
> +
> +while getopts :hir opt;do

what is the purpose of "opt" above?
It is not used AFAICT.

My internet searching says that 'getopts' does not support "--options" (long options).
But then $flag is used below, not $opt, so the long options are just supported
by "flag=$1" at the beginning of the script.


> +	case "$flag" in
> +		-i | --interactive)
> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
> +			read kernel_version
> +			if [[ $kernel_version != "" ]]; then
> +				remove_old_kernel
> +				printf "Please give the full modules directory name to remove:%s"
> +				read modules_version

Need to handle modules_version = "" here.

> +				remove_old_modules_dir
> +				printf "\n\n\n Removed kernel version:$kernel_version and associated modules directory:$modules_version ..Done.\n"
> +			else
> +				exit 1
> +			fi
> +			;;
> +		-h | --help)
> +			usage
> +			exit 1
> +			;;
> +		-r | --remove)

What happens if a user enters:

./scripts/prune-kernel -r
and no kernel_ver or modules_dir_name after -r?


> +			shift $(( OPTIND -1 ))

What is the purpose of the 'shift' since there is no loop to process more options?

> +			cd $boot_dir
> +			rm -f $kernel_ver
> +			cd $modules_dir
> +			rm -rf $modules_dir_name
> +			printf "Removed kernel version:$kernel_ver and modules directory:$modules_dir_name from the system. \n\n"
> +			exit 0
> +			;;
> +	esac
> +done

This patch does not delete the original script loop, so that still follows
after the 'done' above.  Was that intentional?

-- 
~Randy
