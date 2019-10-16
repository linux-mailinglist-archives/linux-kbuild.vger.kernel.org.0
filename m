Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8C9D9660
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 18:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390244AbfJPQIW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Oct 2019 12:08:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48576 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732188AbfJPQIV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Oct 2019 12:08:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=oiKEHdS8biAfxu8EaK2ZrXR0yySguU1MKB+SrQtNg8A=; b=e3y/nq3VKcddu+6AV5ybwVV3I
        lragupywXtbHyMts2l0QMhpi8FqPSmrFfE6dK3Zgq2jO3tCFU796uwAcHY7f/L2pM9ZuzzUvg/KIL
        JN51XQyLYslah0jjKCYR7hWJe4ahpbE6gId8x8CzlNzGLGMjoH0LkHqObxJy5U3cELoWfCaDBD7XJ
        soRoPyDSVpKSdJlCbBkyWfRzdITVJsj+7xusl3901N/lX82DO2IakkCEnaHnbBFUt7kt8ulRmerGx
        Qn605uMRNsH9eczyJGKcidjxSionSm+5JfqSzG5fd/+TuHt5P4y9wjKSSQSEe5PEYGjmbJhdeo3Pz
        DdA55wI4w==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKlqW-0007Gf-9c; Wed, 16 Oct 2019 16:08:20 +0000
Subject: Re: [PATCH] scripts : prune-kernel : prune kernels generalized way
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        bfields@fieldses.org
References: <20191016061312.10626-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <307349e6-69b0-b894-a2b9-edfd5b0fe4c7@infradead.org>
Date:   Wed, 16 Oct 2019 09:08:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191016061312.10626-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/15/19 11:13 PM, Bhaskar Chowdhury wrote:
> This patch will remove old kernel from the system in a selective way.
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> Thanks, a bunch to Randy for the hand holding . :)

Hi Bhaskar,

First problem is that patch complains:

checking file scripts/prune-kernel
Using Plan A...
patch: **** malformed patch at line 87: 2.21.0

IOW, this patch does not apply cleanly.

More comments below.


>  scripts/prune-kernel | 71 ++++++++++++++++++++++++++++++++++++--------
>  1 file changed, 59 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index e8aa940bc0a9..78dd4c854b2b 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -5,17 +5,64 @@
>  # again, /boot and /lib/modules/ eventually fill up.
>  # Dumb script to purge that stuff:
> 
> +#for f in "$@"
> +#do
> +#        if rpm -qf "/lib/modules/$f" >/dev/null; then
> +#                echo "keeping $f (installed from rpm)"
> +#        elif [ $(uname -r) = "$f" ]; then
> +#                echo "keeping $f (running kernel) "
> +#        else
> +#                echo "removing $f"
> +#                rm -f "/boot/initramfs-$f.img" "/boot/System.map-$f"
> +#                rm -f "/boot/vmlinuz-$f"   "/boot/config-$f"
> +#                rm -rf "/lib/modules/$f"
> +#                new-kernel-pkg --remove $f
> +#        fi
> +#done
> +boot_dir=/boot
> +modules_dir=/lib/modules
> +
> +function remove_old_kernel(){
> +	cd $boot_dir
> +	rm -If vmlinuz-$kenrel_version System.map-$kernel_version config-$kernel_verison

Typos:
	               $kernel_version                                   $kernel_version

I.e., you can't have tested this.

> +}
> +function remove_old_kernel_modules_dir(){
> +	cd $modules_dir
> +	rm -rf $modules_version
> +}
> +printf "\n\n Enlist the installed kernels \n\n"
> +
> +find $boot_dir -name "vmlinuz-*" -type f  -exec ls -1 {} \;
> +
> +printf "\n\n\n Please give the kernel version to remove: %s"
> +read kernel_version
> +

If I enter nothing here, no need to call remove_old_kernel.

> +remove_old_kernel
> +
> +printf "\n\n Enlist the installed modules directory \n\n"
> +
> +find $modules_dir  -maxdepth 0 -type d -exec ls -1 {} \;
> +
> +printf "\n\n Please give the full modules directory name to remove: %s"
> +read modules_version

If I enter nothing here, don't call remove_old_kernel_modules_dir.

> +
> +remove_old_kernel_modules_dir
> +
> +printf "\n\n Removed kernel version: $kernel_version and associcated modules: $modules_version ...Done \n"

       typo:                                                associated

> +while :
>  do

Why is the "do" line missing a '+'?  The only do/done in the current script
are already listed above as being commented out.

> +printf "\n\n Do you want to remove another?[YN] : %s"
> +read response
> +
> +if [[ $response == "Y" ]];then
> +	printf "Please give another version to remove : %s"
> +	read kernel_version
> +	remove_old_kernel
> +	printf "\n\n Please give the full modules directory name to remove: %s"
> +	read modules_version
> +	remove_old_kernel_modules_dir
> +elif [[ $response == "N" ]];then
> +	printf "\n\n Alright,no more. \n\n"

Just exit, no printf needed.

> +	exit 1
> +fi
>  done

Same comment for "done" as for "do" above.

> --
> 2.21.0


-- 
~Randy
