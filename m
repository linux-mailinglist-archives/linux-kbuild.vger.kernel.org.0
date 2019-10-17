Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25942DB178
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 17:48:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394496AbfJQPsG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 11:48:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58480 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732271AbfJQPsG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 11:48:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=t/4nriyqxwybxWS8nhC3dQP2EfSOy3yClE/DGRe068o=; b=eD+xx+nm6Z1uXd+bLUaE2KfyD
        NjBhQu8FqV0bJq7YLOItjTd6TP+fj/AZELYB4E80AgJs3JtLTz5ax2Iju7fDcboVGp6CK0ZNU/QVg
        Pby/2/Sajej5gnMqdlvOkYpBrC+qElqgKRtBvcyuYtgE20Sgpv3IpqfXeiab2aGKzITomHyWXUOgc
        gB0wdbJSk6/sKZFfef06+awBH3qh62penrG4+nBC+ZN3TD1lX2aaQI38iD/TNMNVyuqUFxc+YN7xG
        oxeQjslGXvUfKXCAODn5NFOvjLa7YSfTg6gwD9I+B5FR50K4K4QoR8jrHav0dBusEsQ/e618CxWze
        ceYFIlzcw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iL80T-0007tw-0o; Thu, 17 Oct 2019 15:48:05 +0000
Subject: Re: [PATCH] scripts : mksysmap : NM variable missed the value,so
 fixed
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        torvalds@linux-foundation.org
References: <20191017102506.22192-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
Date:   Thu, 17 Oct 2019 08:48:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191017102506.22192-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 10/17/19 3:25 AM, Bhaskar Chowdhury wrote:
> This patch will provide the missing value for NM variable.
> 

Hi,

Does this patch fix some build error that you have encountered?
If so, please describe it and how to cause it.


> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
> TO all,
> Adjusted the subject line, missed in previous one,sorry
> 
>  scripts/mksysmap | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mksysmap b/scripts/mksysmap
> index a35acc0d0b82..4b2f45c45f14 100755
> --- a/scripts/mksysmap
> +++ b/scripts/mksysmap
> @@ -40,5 +40,5 @@
>  # 'W' or 'w'. __crc_ are 'A' and placed in the middle
>  # so we just ignore them to let readprofile continue to work.
>  # (At least sparc64 has __crc_ in the middle).
> -
> +NM=$(which nm)

That's not the POSIX way to do that.  It should be

NM=$(command -v nm)

But why is this needed at all?
The top-level Makefile exports the NM variable (and many more) to scripts
that it calls.

>  $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
> --
> 2.21.0
> 


-- 
~Randy

