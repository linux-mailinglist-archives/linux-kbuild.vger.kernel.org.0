Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D0641E412
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 00:42:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344223AbhI3Wnm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 18:43:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:43104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343554AbhI3Wnm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 18:43:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2FA9F6109E;
        Thu, 30 Sep 2021 22:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633041719;
        bh=FxgCKikKkujaOhD0GKVlpovh2JSLoa6S3E3sVjKqxC0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dGDIR4AzX+Adf/hTKvFpvU2ysWfztQWbBPb450/GzHL/nYyM8pG7uXYQYO12ToIq2
         xMKbS51LnW3DeCWgI0ym0sVJmtBukbSZD+0dBOOasLaRHQJIA7FaNiMuACQ5wYwB8V
         8j+HRERUIGt2XhvbB1QlWrIoPTq2o0lx20nz3rgnLIZLVRu7+JwQji2xmeMYCTzgI9
         UxEfz0qKXBWOLn7s7naVQhz4rSnaxOFOBqeZfHb5lH6nrR7K6Oh92eTs/XD9zZDGxn
         6UTM7U0bFFjrV5VD3HDtQfKq2IrpJw1Yak+ptLBONhPTdK+IYmMKbAbE+BZV2t5ovW
         MKarUjHBFvcog==
Date:   Thu, 30 Sep 2021 17:46:04 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        kernel test robot <lkp@intel.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Alexandre Bounine <alex.bou9@gmail.com>,
        Jing Xiangfeng <jingxiangfeng@huawei.com>,
        Ira Weiny <ira.weiny@intel.com>,
        Souptick Joarder <jrdr.linux@gmail.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Joe Perches <joe@perches.com>, Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Andy Whitcroft <apw@canonical.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Daniel Micay <danielmicay@gmail.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 1/8] rapidio: Avoid bogus __alloc_size warning
Message-ID: <20210930224604.GA906353@embeddedor>
References: <20210930222704.2631604-1-keescook@chromium.org>
 <20210930222704.2631604-2-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930222704.2631604-2-keescook@chromium.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 30, 2021 at 03:26:57PM -0700, Kees Cook wrote:
> After adding __alloc_size attributes to the allocators, GCC 9.3 (but not
> later) may incorrectly evaluate the arguments to check_copy_size(),
> getting seemingly confused by the size being returned from array_size().
> Instead, perform the calculation once, which both makes the code more
> readable and avoids the bug in GCC.
> 
>    In file included from arch/x86/include/asm/preempt.h:7,
>                     from include/linux/preempt.h:78,
>                     from include/linux/spinlock.h:55,
>                     from include/linux/mm_types.h:9,
>                     from include/linux/buildid.h:5,
>                     from include/linux/module.h:14,
>                     from drivers/rapidio/devices/rio_mport_cdev.c:13:
>    In function 'check_copy_size',
>        inlined from 'copy_from_user' at include/linux/uaccess.h:191:6,
>        inlined from 'rio_mport_transfer_ioctl' at drivers/rapidio/devices/rio_mport_cdev.c:983:6:
>    include/linux/thread_info.h:213:4: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
>      213 |    __bad_copy_to();
>          |    ^~~~~~~~~~~~~~~
> 
> But the allocation size and the copy size are identical:
> 
> 	transfer = vmalloc(array_size(sizeof(*transfer), transaction.count));
> 	if (!transfer)
> 		return -ENOMEM;
> 
> 	if (unlikely(copy_from_user(transfer,
> 				    (void __user *)(uintptr_t)transaction.block,
> 				    array_size(sizeof(*transfer), transaction.count)))) {
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-mm/202109091134.FHnRmRxu-lkp@intel.com/
> Cc: Matt Porter <mporter@kernel.crashing.org>
> Cc: Alexandre Bounine <alex.bou9@gmail.com>
> Cc: Jing Xiangfeng <jingxiangfeng@huawei.com>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Cc: Souptick Joarder <jrdr.linux@gmail.com>
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: John Hubbard <jhubbard@nvidia.com>

Reviewed-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Thanks
--
Gustavo

> ---
>  drivers/rapidio/devices/rio_mport_cdev.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rapidio/devices/rio_mport_cdev.c b/drivers/rapidio/devices/rio_mport_cdev.c
> index 94331d999d27..7df466e22282 100644
> --- a/drivers/rapidio/devices/rio_mport_cdev.c
> +++ b/drivers/rapidio/devices/rio_mport_cdev.c
> @@ -965,6 +965,7 @@ static int rio_mport_transfer_ioctl(struct file *filp, void __user *arg)
>  	struct rio_transfer_io *transfer;
>  	enum dma_data_direction dir;
>  	int i, ret = 0;
> +	size_t size;
>  
>  	if (unlikely(copy_from_user(&transaction, arg, sizeof(transaction))))
>  		return -EFAULT;
> @@ -976,13 +977,14 @@ static int rio_mport_transfer_ioctl(struct file *filp, void __user *arg)
>  	     priv->md->properties.transfer_mode) == 0)
>  		return -ENODEV;
>  
> -	transfer = vmalloc(array_size(sizeof(*transfer), transaction.count));
> +	size = array_size(sizeof(*transfer), transaction.count);
> +	transfer = vmalloc(size);
>  	if (!transfer)
>  		return -ENOMEM;
>  
>  	if (unlikely(copy_from_user(transfer,
>  				    (void __user *)(uintptr_t)transaction.block,
> -				    array_size(sizeof(*transfer), transaction.count)))) {
> +				    size))) {
>  		ret = -EFAULT;
>  		goto out_free;
>  	}
> @@ -994,8 +996,7 @@ static int rio_mport_transfer_ioctl(struct file *filp, void __user *arg)
>  			transaction.sync, dir, &transfer[i]);
>  
>  	if (unlikely(copy_to_user((void __user *)(uintptr_t)transaction.block,
> -				  transfer,
> -				  array_size(sizeof(*transfer), transaction.count))))
> +				  transfer, size)))
>  		ret = -EFAULT;
>  
>  out_free:
> -- 
> 2.30.2
> 
