Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A7A2EA940
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2019 03:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726347AbfJaCdG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 30 Oct 2019 22:33:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47020 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfJaCdG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Oct 2019 22:33:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=gNHzY/slJV1OFQPWeiu4MtoA9eYahNCpK9kNgORibGM=; b=O9N4++GrNdYBF/lmRbyy0Rh/C
        3abUCgRChF0YrqMy8bj3g4BLVwBxx7Py7sOvOvnn1ZayRQmcR7/DUfuhFL8U4UM233JlBXdJCDlls
        06hCp2qCnUCjco5JIyp0OgYzbGGEcVjN4E9ug8I/SYuzZUmPGGTbrwR07qoic+mBsj3r6dRHTOrZk
        o2wgo51Y9l6KZ+93vTGOEsVHSjkhc3YKrsncqxKUyxOGY8BdOPd3HkfdRNpWpkyovXdTizaMhDVwT
        E0xY93nPl1uFLhBQaZb8qsdqiX3NKiTSNwAr6V4NmfttDiMJ01X0E6eZDouqD2yIdZpPZfM+0aRf5
        6YjbOC27Q==;
Received: from [2603:3004:32:9a00::f45c] (helo=dragon.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iQ0Gl-0006aJ-TD; Thu, 31 Oct 2019 02:33:03 +0000
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, bfields@fieldses.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
Date:   Wed, 30 Oct 2019 19:33:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030095445.912435-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On 10/30/19 2:54 AM, Bhaskar Chowdhury wrote:
> This patch will remove old kernels and modules directorey related
> to that kernel from the system by interactively and silently.Here
> are few interactions with the scripts
> 
> 1)
> 
> ✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
> 14:52 $ ./scripts/prune-kernel -h
> Usage: prune-kernel [ri]
> 
>  -r | --remove kernel_ver modules_dir_name
> 
>   -i | --interactive use as interactive way
>   ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>   
>   14:52 $ ./scripts/prune-kernel --help
>   Usage: prune-kernel [ri]

That "[ri]" is confusing to me.

> 
>    -r | --remove kernel_ver modules_dir_na]
> 
>     -i | --interactive use as interactive way
>    
>  2)
> 
>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>  14:52 $ ./scripts/prune-kernel -r 5.3.3
>  You need to provide kernel version and modules dir name
>  
>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>  14:53 $ ./scripts/prune-kernel -r
>  You need to provide kernel version and modules dir name
>  
>  ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
>  14:54 $ ./scripts/prune-kernel -r 5.3.3 5.3.3-foo

This one above didn't remove any kernel files.
Needs more testing.

> 3)
> 
> $ ./scripts/prune-kernel --remove
> You need to provide kernel version and modules dir name
> 
> ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
> 14:55 $ ./scripts/prune-kernel --remove 5.3.3
> You need to provide kernel version and modules dir name
> 
> ✘-1 ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
> 14:55 $ ./scripts/prune-kernel --remove 5.3.3 5.3.3-foo
> 
> 
> 4)14:55 $ ./scripts/prune-kernel -i
> 
> Enter kernel version to remove or blank/empty to exit:
> 
> 
> 5)14:57 $ ./scripts/prune-kernel --interactive
> 
> Enter kernel version to remove or blank/empty to exit:
> ✔ ~/git-linux/linux-kbuild [master|AM 1/1 ↑·59|✔]
> 
> 
> 6)14:59 $ ./scripts/prune-kernel --interactive
> 
> Enter kernel version to remove or blank/empty to exit:5.3.3
> Please give the full modules directory name to remove:5.3.3-foo
> 
> 
> 
> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
> 
> 
> 7)15:00 $ ./scripts/prune-kernel -i
> 
> Enter kernel version to remove or blank/empty to exit:5.3.3
> Please give the full modules directory name to remove:5.3.3-foo
> 
> 
> 
> Removed kernel version:5.3.3 and associated modules:5.3.3-foo ...Done.
> 
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index a25aa2160d47..a91010d0e2af 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -1,3 +1,66 @@
>  #!/bin/bash
>  # SPDX-License-Identifier: GPL-2.0
> +#This script will delete old kernels and modules directory related to it
> +#-h with the script will show you the help
> +#-r with the script take two parameter: kernel_ver and modules_dir_name
> +#-i with the script allow you do the removing interactive way
> 
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
> +	printf "Usage: $(basename $0) [ri] \n"
> +	printf "\n -r | --remove kernel_ver modules_dir_name \n"
> +	printf "\n -i | --interactive use as interactive way \n"
> +}
> +
> +for arg in "$@"

what is the purpose (use) of "arg" here?

what is the purpose of the for loop?

Is any 'shift' needed to consume (or discard) the first 3 positional
command line arguments?

> +do
> +	case "$flag" in
> +		-i | --interactive)
> +			printf "\nEnter kernel version to remove or blank/empty to exit:%s"
> +			read kernel_version
> +			if [[ $kernel_version != "" ]]; then
> +				remove_old_kernel
> +				printf "Please give the full modules directory name to remove:%s"
> +				read modules_version
> +				if [[ $modules_version != "" ]]; then
> +					remove_old_modules_dir
> +					printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ...Done. \n"

This message is only printed if $modules_version is non-empty.  If it is empty,
remove_old_kernel() has silently removed some kernel files (if they existed).

> +				else
> +					exit 1
> +				fi
> +			fi
> +			;;
> +		-h | --help)
> +			usage
> +			exit 1
> +			;;
> +		-r | --remove)
> +			if [[ $# -ne 3 ]]; then
> +				printf "You need to provide kernel version and modules dir name\n"
> +				exit 1
> +			else
> +				cd $boot_dir
> +				rm -f $kernel_ver

That 'rm' doesn't remove any files.  Compare what remove_old_kernel() does.

> +				cd $modules_dir
> +				rm -rf $modules_dir_name
> +			fi
> +			;;
> +	esac
> +done
> --

The script, after this patch is applied, still contains the old script's for-loop
at the end of the "new" prune-kernel script.

Nack.

-- 
~Randy
