Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC033968D5
	for <lists+linux-kbuild@lfdr.de>; Mon, 31 May 2021 22:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbhEaUbT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 May 2021 16:31:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:48564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230505AbhEaUbT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 May 2021 16:31:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61F8561159;
        Mon, 31 May 2021 20:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622492979;
        bh=b+9t8ZSAkUu0i4emi5jWFTEZ6nDcEa0evRcKGC+0BRk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZbDNE7AgIo+YzT8EGL5IA9CLYrQArn5OGKAEJQ8HNCwNQWTMREGOxXU95M/fAicNF
         RPhJc9kynQxmyfQ8MJVb9qPhgMbwbO7V/kx7eeIRB30wScyEcM1oVQ7D3aZrnxqFKt
         zBIw1tuRPvLExAxXGvNm149Nvxu77hleqLPg5EJffG/jx5G0HlypK9r/dk2bhYlaE6
         g0EJInuboHlHCaCDaIYnImhJYb4KM8Efg30KwuXkbxbxkUsv2bDZcWwiCgilxJHOiH
         tA2FPbj854VJ0GokoQOoFXXO6Rk4l92DMA68g8+8Sqgu1sLKFXHwcx6q2rgkTVQZB0
         54utWvcJOsO3w==
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
To:     Bill Wendling <morbo@google.com>, Kees Cook <keescook@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>
References: <20210531202044.426578-1-morbo@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <e22afde4-e312-4589-cf2e-3c35219d7249@kernel.org>
Date:   Mon, 31 May 2021 13:29:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210531202044.426578-1-morbo@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/31/2021 1:20 PM, Bill Wendling wrote:
> Future PGO features may create other files in /sys/kernel/debug/pgo. So
> rename the kernel's raw profile data file to "vmlinux.profraw" to make
> which part of the kernel the file is for more explicit.
> 
> Note that future files in /sys/kernel/debug/pgo should follow a similar
> naming convention.
> 
> Signed-off-by: Bill Wendling <morbo@google.com>

Guess this clears up my confusion around the module patches :)

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   Documentation/dev-tools/pgo.rst | 6 +++---
>   kernel/pgo/Kconfig              | 7 ++++---
>   kernel/pgo/fs.c                 | 2 +-
>   3 files changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
> index b7f11d8405b7..0200449c4843 100644
> --- a/Documentation/dev-tools/pgo.rst
> +++ b/Documentation/dev-tools/pgo.rst
> @@ -76,7 +76,7 @@ The PGO kernel support creates the following files in debugfs:
>   ``/sys/kernel/debug/pgo/reset``
>   	Global reset file: resets all coverage data to zero when written to.
>   
> -``/sys/kernel/debug/profraw``
> +``/sys/kernel/debug/pgo/vmlinux.profraw``
>   	The raw PGO data that must be processed with ``llvm_profdata``.
>   
>   
> @@ -108,7 +108,7 @@ using the result to optimize the kernel:
>   
>      .. code-block:: sh
>   
> -      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> +      $ cp -a /sys/kernel/debug/pgo/vmlinux.profraw /tmp/vmlinux.profraw
>   
>   5) (Optional) Download the raw profile data to the HOST machine.
>   
> @@ -120,7 +120,7 @@ using the result to optimize the kernel:
>   
>      Note that multiple raw profile data files can be merged during this step.
>   
> -7) Rebuild the kernel using the profile data (PGO disabled)
> +7) Rebuild the kernel using the processed profile data (PGO disabled)
>   
>      .. code-block:: sh
>   
> diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
> index 76a640b6cf6e..d2053df1111c 100644
> --- a/kernel/pgo/Kconfig
> +++ b/kernel/pgo/Kconfig
> @@ -17,10 +17,11 @@ config PGO_CLANG
>   
>   	  Run a representative workload for your application on a kernel
>   	  compiled with this option and download the raw profile file from
> -	  /sys/kernel/debug/pgo/profraw. This file needs to be processed with
> -	  llvm-profdata. It may be merged with other collected raw profiles.
> +	  /sys/kernel/debug/pgo/vmlinux.profraw. This file needs to be
> +	  processed with llvm-profdata. It may be merged with other collected
> +	  raw profiles.
>   
> -	  Copy the resulting profile file into vmlinux.profdata, and enable
> +	  Copy the processed profile file into vmlinux.profdata, and enable
>   	  KCFLAGS=-fprofile-use=vmlinux.profdata to produce an optimized
>   	  kernel.
>   
> diff --git a/kernel/pgo/fs.c b/kernel/pgo/fs.c
> index 449f16beb2cf..ef985159dad3 100644
> --- a/kernel/pgo/fs.c
> +++ b/kernel/pgo/fs.c
> @@ -365,7 +365,7 @@ static int __init pgo_init(void)
>   	if (!directory)
>   		goto err_remove;
>   
> -	if (!debugfs_create_file("profraw", 0600, directory, NULL,
> +	if (!debugfs_create_file("vmlinux.profraw", 0600, directory, NULL,
>   				 &prf_fops))
>   		goto err_remove;
>   
> 
