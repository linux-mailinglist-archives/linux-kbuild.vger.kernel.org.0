Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB63273941
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Sep 2020 05:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728680AbgIVD3F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Sep 2020 23:29:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbgIVD3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Sep 2020 23:29:05 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73A62C061755;
        Mon, 21 Sep 2020 20:29:05 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id i17so19486855oig.10;
        Mon, 21 Sep 2020 20:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UV9LYgvlr7nqZDgZi3jIcKJdwzfRvVah5SxtcsrnOGM=;
        b=KoKe73aFPikkUbG8GYe06ozeJAu4/2a25kb63aOfPdf90P/bCMwXrXxQNWEj/+BdMG
         emVMirahXvWmG4+kn7I/1OuV9dDo9AYiUjdXfevVkAto9uGr85XaCyu0wIp42YQdiyNS
         Cx9XPXV4VimluUOcyRQmXgBYYa7wTxxJLhBdRq17SJIPCZ6a+0POJPqTmgeziISK4Euu
         4kZLlxL748D/pYQcZAdrezzUnpdbcj4KkdUEGKOnCcJITH9/fJsbqBo/drmyFmc//utD
         MShls/2vlEp/Dz+iLZRVq9S6H/3RLcwHQ69617Fos5u/F/g0tvUZZstfQrrpXNTMpiLn
         kcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=UV9LYgvlr7nqZDgZi3jIcKJdwzfRvVah5SxtcsrnOGM=;
        b=E5ybhSFT2q90rsrBN8v64pHkf5XedI+l53jb9vouJHe6iw+IJt9Vf5IAOxkLJrtBdn
         dOey7h9HViNJ+dNqCS4L/FSsoJoqS2jKD8fq9Uz0hM5A8T+RyVTj9+xs6tAaV66daD09
         2LrLrzE3P8Zirg7OzkvJj6BR9XEu7j87VtjbSrV/bxjuMdNWW8X9lDcLRsY2hRiKSKoj
         2o74oq570L3c6ova3P74KNlG0yhvar1Z1nquq1ai+OqPvICzxogmTTgO+pb7K84nik8Z
         P6mKqyBZllTxxb3sXLLBEFJaB8xfhmDeGiS6TDgKGoxTjX+AYzdzxYiI6AVmv4+HvJLI
         YHcg==
X-Gm-Message-State: AOAM533DzFtzdeAdhLEaC71dMPAiDhf+xatw+UgE8La4M+0hj3DgaNm/
        KgktbpHkSHSuW1gw8NpCjtU=
X-Google-Smtp-Source: ABdhPJyCLJN/QaBzUgpC9F4GziOQoNNqGuKYPZbXVB7xkaiYJ+VN1C1N9URFbTPlRwyYFy9iFI/Utg==
X-Received: by 2002:aca:913:: with SMTP id 19mr1404267oij.169.1600745344779;
        Mon, 21 Sep 2020 20:29:04 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 34sm6355428otg.23.2020.09.21.20.29.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Sep 2020 20:29:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 21 Sep 2020 20:29:03 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] kbuild: Try up to eight kallsyms link passes
Message-ID: <20200922032903.GA222779@roeck-us.net>
References: <20200910153204.156871-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910153204.156871-1-linux@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 10, 2020 at 08:32:04AM -0700, Guenter Roeck wrote:
> Since v5.8, powerpc:allmodconfig often fails to build with the following
> error message.
> 
> 	Inconsistent kallsyms data
> 	Try make KALLSYMS_EXTRA_PASS=1 as a workaround
> 
> Setting KALLSYMS_EXTRA_PASS=1 does not help. As it turns out, the build
> currently needs up to four link passes to succeed.
> 
> Similar problems have been observed over time for other architectures.
> 
> Make the number of link passes dynamic to solve the problem. Try up to
> eight passes before giving up. If KALLSYMS_EXTRA_PASS is set, add one
> additional pass after succeeding.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I still see a build failure for powerpc:allmodconfig due to this problem.

Feedback/comments/thoughts ? Does anyone have a better idea ?

Thanks,
Guenter

> ---
>  scripts/link-vmlinux.sh | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index e6e2d9e5ff48..72abdee0e649 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -316,11 +316,10 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
>  	#     From here, we generate a correct .tmp_kallsyms2.o
>  	# 3)  That link may have expanded the kernel image enough that
>  	#     more linker branch stubs / trampolines had to be added, which
> -	#     introduces new names, which further expands kallsyms. Do another
> -	#     pass if that is the case. In theory it's possible this results
> -	#     in even more stubs, but unlikely.
> -	#     KALLSYMS_EXTRA_PASS=1 may also used to debug or work around
> -	#     other bugs.
> +	#     introduces new names, which further expands kallsyms. Try up
> +	#     to eight passes to handle that situation before giving up.
> +	#     KALLSYMS_EXTRA_PASS=1 may be used to add an extra step
> +	#     for debugging or to work around other bugs.
>  	# 4)  The correct ${kallsymso} is linked into the final vmlinux.
>  	#
>  	# a)  Verify that the System.map from vmlinux matches the map from
> @@ -329,13 +328,21 @@ if [ -n "${CONFIG_KALLSYMS}" ]; then
>  	kallsyms_step 1
>  	kallsyms_step 2
>  
> -	# step 3
> -	size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
> -	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
> -
> -	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
> -		kallsyms_step 3
> -	fi
> +	# step n
> +	step=3
> +	while [ $step -le 8 ]; do
> +		size1=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso_prev})
> +		size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
> +
> +		if [ $size1 -eq $size2 ]; then
> +			if [ -z "${KALLSYMS_EXTRA_PASS}" ]; then
> +				break
> +			fi
> +			KALLSYMS_EXTRA_PASS=""
> +		fi
> +		kallsyms_step $step
> +		step="$(expr $step + 1)"
> +	done
>  fi
>  
>  vmlinux_link vmlinux "${kallsymso}" ${btf_vmlinux_bin_o}
> -- 
> 2.17.1
> 
