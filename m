Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60094DD98D
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2019 18:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbfJSQBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 19 Oct 2019 12:01:43 -0400
Received: from fieldses.org ([173.255.197.46]:39520 "EHLO fieldses.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbfJSQBn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Oct 2019 12:01:43 -0400
Received: by fieldses.org (Postfix, from userid 2815)
        id 5DF6A1C95; Sat, 19 Oct 2019 12:01:42 -0400 (EDT)
Date:   Sat, 19 Oct 2019 12:01:42 -0400
From:   "J. Bruce Fields" <bfields@fieldses.org>
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        rdunlap@infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: prune-kernel : prune kernels generalized way
Message-ID: <20191019160142.GA31839@fieldses.org>
References: <20191019130722.8067-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191019130722.8067-1-unixbhaskar@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Oct 19, 2019 at 06:37:22PM +0530, Bhaskar Chowdhury wrote:
> This patch will remove old kernel from the system in a selective way.

Please don't comment out code, just delete it, git's there to keep the
old code.

There's some redundant code that should be inside a loop.

A little more detail in the changelog might be useful to those of us who
are lazy about reading bash script....

Looks like this just prompts for each individual delete?  Actually it
looks like it requires the user to enter the module path and kernel
version for each one which makes it not much more convenient use than a
bare "ls" and "rm".

I personally use this in unattended scripts.  I mean, I don't really
care what we do with this, as I use my own copy of the script, so
whatever's useful to more people is fine.

But if somebody does actually use it as-is, it'd be nicer to keep the
current behavior and add an option ("-i" or something) for the
interactive behavior.

--b.

> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 86 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 72 insertions(+), 14 deletions(-)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index e8aa940bc0a9..9d839a4e4539 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -5,17 +5,75 @@
>  # again, /boot and /lib/modules/ eventually fill up.
>  # Dumb script to purge that stuff:
> 
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
> +#for f in "$@"
> +#do
> +#       if rpm -qf "/lib/modules/$f" >/dev/null; then
> +#                echo "keeping $f (installed from rpm)"
> +#        elif [ $(uname -r) = "$f" ]; then
> +#                echo "keeping $f (running kernel) "
> +#        else
> +#                echo "removing $f"
> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
> +#                rm -rf "/lib/modules/$f"
> +#                new-kernel-pkg --remove $f
> +#       fi
> +#done
> +boot_dir=/boot
> +modules_dir=/lib/modules
> +
> +function remove_old_kernel(){
> +	cd $boot_dir
> +	rm -If vmlinuz-$kernel_version System.map-$kernel_version config-$kernel_version
> +}
> +
> +function remove_old_modules_dir(){
> +	cd $modules_dir
> +	rm -rf $modules_version
> +}
> +
> +printf "\n\n Enlist the installed kernels \n\n"
> +
> +
> +find $boot_dir -name "vmlinuz-*" -type f -exec ls -1 {} \;
> +
> +printf "\n\n\n Please give the kernel version to remove: %s"
> +read kernel_version
> +
> +if [[ $kernel_version == "" ]];then
> +	exit 1
> +else
> +	remove_old_kernel
> +fi
> +
> +printf "\n\n Enlist the installed modules directory \n\n"
> +
> +find $modules_dir -maxdepth 0 -type d -exec ls -1 {} \;
> +
> +printf "\n\n Please give the full modules directory name to remove: %s"
> +read modules_version
> +
> +if [[ $modules_version == "" ]];then
> +	printf "You have forgotten to give the modules dir to remove"
> +else
> +	remove_old_modules_dir
> +fi
> +
> +printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ...Done \n"
> +
> +while :
> + do
> +    printf "\n\n Do you want to remove another?[YN]: %s"
> +    read response
> +       if [[ $response == "Y" ]];then
> +	 printf "Please give another version to remove: %s"
> +	 read kernel_version
> +	 remove_old_kernel
> +	 printf "Please give the full modules directory name to remove: %s"
> +	 read modules_version
> +	 remove_old_modules_dir
> +	 printf "\n\n\n Removed kernel version:$kernel_version and associated modules:$modules_version ..Done \n\n"
> +      elif [[ $response == "N" ]];then
> +	 exit 1
> +    fi
> + done
> --
> 2.21.0
