Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 684D86383F
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jul 2019 16:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbfGIOyJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jul 2019 10:54:09 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56538 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726115AbfGIOyI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 10:54:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=weOuI78HmXrJES/Fz6rOOsfYQ8aeJH/DEMsQ8pHbDzg=; b=fVEQecKj8xz460Juv5NaWWdQn
        puVmwf1WuTljW4yGPmaJqQ00rUv1OejZbtUmMe4zTE4RBXUo3svipzq0y9oQHYq3di6x0m1GWc262
        ukf9I2Oa0MOfN5wnaMZe6X7mm7k1e9QKD9slqq7JQnuVCL4plSLFuZNvb3mNOo8eBPJLs7Sxq4auu
        SprOfMUiWjRi7ZLLWR1Fv/hLnHxJttFd4/42UjTH3YKnygCOvwdPAf1moFk1se1qeOnjznWe7DDhq
        qB5uAR6SZDyHxjTkkmWZ0eoVkarCENtFNBMaThQ1u7NjT3yUORJjCX/vLXJeQjKbcBnuuaYi9sYRK
        rW+EiVb8w==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hkrVP-0000De-BE; Tue, 09 Jul 2019 14:54:07 +0000
Subject: Re: [PATCH 1/4] Makefile: rules for printing kernel architecture and
 localversion
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org
Cc:     yamada.masahiro@socionext.com, michal.lkml@markovi.net,
        apw@canonical.com, joe@perches.com, linux-kbuild@vger.kernel.org,
        linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
References: <1562664759-16009-1-git-send-email-info@metux.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3d4da301-618e-e348-2a6a-144b802d240f@infradead.org>
Date:   Tue, 9 Jul 2019 07:54:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1562664759-16009-1-git-send-email-info@metux.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/9/19 2:32 AM, Enrico Weigelt, metux IT consult wrote:
> trivial rule to print out the kernel arch and localversion, so
> external tools, like distro packagers, can easily get it.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Hi,
If accepted, these targets should be added to the top level Makefile's
"make help" output also.

Thanks.

> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 3e4868a..5afc3de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1706,6 +1706,12 @@ kernelrelease:
>  kernelversion:
>  	@echo $(KERNELVERSION)
>  
> +kernellocalversion:
> +	@$(CONFIG_SHELL) $(srctree)/scripts/setlocalversion $(srctree) | sed -e 's~^\-~~'
> +
> +kernelarch:
> +	@echo $(ARCH)
> +
>  image_name:
>  	@echo $(KBUILD_IMAGE)
>  
> 


-- 
~Randy
