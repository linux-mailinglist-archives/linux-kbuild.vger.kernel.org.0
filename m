Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58393DDFE5
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 21:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhHBTQd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 15:16:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:49444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229755AbhHBTQc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 15:16:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27F2860EE8;
        Mon,  2 Aug 2021 19:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627931783;
        bh=nB/idNrPLD9uz+xKPp20zN8CmDGUyr8ewkfN6nqYGFY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=CgZFdceTX69vnFjhfnfYTv7I4FmULK7iy/CMOih6trreL7q0juNhnieIc7iYd+CNn
         2PX5jLmfEzGY4XNe/ewlOh3xYCgl4zQclVtn44ttiuVH12INNhXD2vXsiQEn7OHEpS
         ZeomECrUbtFI49xxTJfKeOrGSN1aymV4jJHU3O9/tiM99/ptMqXFY4lT+gpUr4kpUQ
         CgXbVgZ2y19j1m8h1Tm5VLTRqoFg5CO8g5MBy1apPc33ZtfnmSFcjwHHQzCtcD2GDL
         P+oi46Iib+nOJnvnmlyYxx7Ps+6NPvoHNOMjqTV2NVC5dVcHwTHnGQXy0P82706KqV
         uCsl2Dd/FecZA==
Subject: Re: [PATCH v6 3/3] Documentation/llvm: update CROSS_COMPILE
 inferencing
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210802183910.1802120-1-ndesaulniers@google.com>
 <20210802183910.1802120-4-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <95712f4c-9da5-b7b6-f617-b6b686b6eadc@kernel.org>
Date:   Mon, 2 Aug 2021 12:16:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802183910.1802120-4-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/2/2021 11:39 AM, 'Nick Desaulniers' via Clang Built Linux wrote:
> As noted by Masahiro, document how we can generally infer CROSS_COMPILE
> (and the more specific details about --target and --prefix) based on
> ARCH.
> 
> Change use of env vars to command line parameters.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Thanks for the update, I think this is much easier for non-CBL folks to 
understand.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> Changes v5 -> v6:
> * Pick up Fangrui's RB tag.
> * Change use of env vars to command line parameters for consistency.
> 
>   Documentation/kbuild/llvm.rst | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
> index b18401d2ba82..f8a360958f4c 100644
> --- a/Documentation/kbuild/llvm.rst
> +++ b/Documentation/kbuild/llvm.rst
> @@ -38,7 +38,7 @@ Cross Compiling
>   A single Clang compiler binary will typically contain all supported backends,
>   which can help simplify cross compiling. ::
>   
> -	ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang
> +	make ARCH=arm64 CC=clang CROSS_COMPILE=aarch64-linux-gnu-
>   
>   ``CROSS_COMPILE`` is not used to prefix the Clang compiler binary, instead
>   ``CROSS_COMPILE`` is used to set a command line flag: ``--target=<triple>``. For
> @@ -63,6 +63,23 @@ They can be enabled individually. The full list of the parameters: ::
>   Currently, the integrated assembler is disabled by default. You can pass
>   ``LLVM_IAS=1`` to enable it.
>   
> +Omitting CROSS_COMPILE
> +----------------------
> +
> +As explained above, ``CROSS_COMPILE`` is used to set ``--target=<triple>``.
> +
> +Unless ``LLVM_IAS=1`` is specified, ``CROSS_COMPILE`` is also used to derive
> +``--prefix=<path>`` to search for the GNU assembler and linker.
> +
> +If ``CROSS_COMPILE`` is not specified, the ``--target=<triple>`` is inferred
> +from ``ARCH``.
> +
> +That means if you use only LLVM tools, ``CROSS_COMPILE`` becomes unnecessary.
> +
> +For example, to cross-compile the arm64 kernel::
> +
> +	make ARCH=arm64 LLVM=1 LLVM_IAS=1
> +
>   Supported Architectures
>   -----------------------
>   
> 
