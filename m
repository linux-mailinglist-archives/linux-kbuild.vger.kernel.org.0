Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0F4D842B
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2019 01:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727314AbfJOXDG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 15 Oct 2019 19:03:06 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53186 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbfJOXDF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 19:03:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OtCYlM8isC9H7iiEH4f9zuX3dOr3VOjtUmlOfrr5EVI=; b=i6n/DyDn0t/omhOc6pAC/DjYK
        qllKuMC69f32AQ4Q88CJg9MKwCGA3Gcwgt2JeJAob48Q6A7pEbkQ8YxeeCTYRwiaZkWYvucpgbseI
        tRbtIqK3Jbhw8Pi18x2YN8jIqyxzdP2mqbHnHf01ulbygqe8SlVDix03zw1ZOSkE3KvRSs/P9Gqlw
        taSSbmG+fNfBW5GO+ioyMyA8XH1L9LTBIk51G8pCJfTNW6j/0uFUytIYy1IEQtGdcr2VTHAyyLmCd
        wUMNLjun13p3+2+yY7eGqg6Yrh7IYW7pcg+GeQhA3vFqEap33r7A0J7+hE42qV84ouHIdm9OpxKK8
        v0jCSrnCQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKVqK-0003VY-LB; Tue, 15 Oct 2019 23:03:04 +0000
Subject: Re: [PATCH] :scripts: prune-kernel : prunning kernel generalize way
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191015145548.24165-1-unixbhaskar@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c075bcce-0d6d-abee-7fb5-80821f2ae3a2@infradead.org>
Date:   Tue, 15 Oct 2019 16:03:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015145548.24165-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Subject: s/prunning/pruning/
Subject:  s/:scripts:/scripts:/

On 10/15/19 7:55 AM, Bhaskar Chowdhury wrote:
> This patch will remove old kernels from system selective way.

                                                 in a selective way.

> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/prune-kernel | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/scripts/prune-kernel b/scripts/prune-kernel
> index 74143f229f84..28fae6c91218 100755
> --- a/scripts/prune-kernel
> +++ b/scripts/prune-kernel
> @@ -33,7 +33,7 @@ printf "\t\n Enlist the installed kernels \n\n\n"
>  cd $boot_dir && pwd
> 
>  #Bash experts not recomend to run ls inside script,but you can by running that too
> -# ls -1 vmlinuz-*
> +# ls -1 vmlinuz-*
> 
>  #This is the recommended way , little complex but that's what people want to see!
> 
> @@ -42,10 +42,10 @@ find $boot_dir -name "vmlinuz-*" -type f -print0 -exec ls -1 {} \;
>  printf "\n\n\n Well, we need to purge some kernel to gain some space.\n\n\n"
> 
> 
> -printf "Please give the kernel version to remove: %s"
> +printf "Please give the kernel version to remove: %s"
>  read kernel_version
> 
> -remove_old_kernel
> +remove_old_kernel
> 
>  printf "\n\n Remove associated modules too ... \n\n"
> 
> @@ -54,7 +54,7 @@ cd $modules_dir && pwd
>  printf "\n\n\n Enlist the installed modules \n\n\n"
> 
>  #This is (-1) minus one not l(el)
> -# ls -1
> +# ls -1
> 
>  find $modules_dir -name "$kernel_version-*" -type f -print0 -exec ls -1 {} \;
> 
> @@ -66,14 +66,14 @@ rm -rf $modules_version
>  printf "\n\n Done \n\n"
> 
>  printf "\n\n Want to remove another?[Yn] : %s"
> -read response
> +read response
> 
> 
>  if [[ $response == "Y" ]]; then
> - printf "Please give another version to remove : %s"
> + printf "Please give another version to remove : %s"
>   read kernel_version
> 
> -remove_old_kernel
> +remove_old_kernel
> 
>  elif [[ $response == "n" ]]; then
> 
> @@ -81,4 +81,4 @@ elif [[ $response == "n" ]]; then
> 
>  fi
> 
> -exit 0
> +exit 0
> --
> 2.21.0
> 

Trying to apply this patch with 'patch --verbose' says:

checking file scripts/prune-kernel
Using Plan A...
Hunk #1 FAILED at 33.
Hunk #2 FAILED at 42.
Hunk #3 FAILED at 54.
Hunk #4 FAILED at 66.
Hunk #5 FAILED at 81.
5 out of 5 hunks FAILED
Hmm...  Ignoring the trailing garbage.
done


Those + and - lines with the same content don't make any sense.

And probably Cc: the author of the script:
J. Bruce Fields <bfields@fieldses.org>

-- 
~Randy
