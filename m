Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EB453A70C1
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 22:51:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhFNUxh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 16:53:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:48818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234143AbhFNUxh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 16:53:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96C18601FC;
        Mon, 14 Jun 2021 20:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623703894;
        bh=2oU74hjcRqThcFY4oNU2s/iu8tePVS5oYVjszOv3j2o=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=orDVM1NohWNe5iInXuYjxY5KW1ruvRwlSqIAJrGfsPyjcSsBRsQUlr3k3XPLr0O9V
         xA/siP+W7sETt8a65zhVnVBWYWQ8jTKQPBHTgtCK0DxB5OhXLdLLVPi8GSmCfo08B0
         PchdC+Q4X162Y4JdWRHVWh5cjC23IdQwj4UEqbhe9lGHvz/tYMjAGsv2dvC3YpORoU
         YwNaScsx+fMG0hoDDV3PjjCxCYLUJXU603idOgP+tEQelq7ZJJCk+HW4rx8up9Pxc/
         ZElwSV+AEBGjuPQB7W4S4hCWUh1TjmDQlENUGcsfysT+rJ11nYdfAFTZrWNj+SN1K7
         WSTjQrbu145ng==
Subject: Re: [PATCH 1/1] Makefile: Pass -warn-stack-size only on LLD < 13.0.0
To:     Tor Vic <torvic9@mailbox.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org,
        "ndesaulniers@google.com" <ndesaulniers@google.com>,
        keescook@chromium.org
Cc:     "clang-built-linux@googlegroups.com" 
        <clang-built-linux@googlegroups.com>, linux-kbuild@vger.kernel.org
References: <7631bab7-a8ab-f884-ab54-f4198976125c@mailbox.org>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <51c33b62-1e91-7c69-5b77-75ffe0ad6e77@kernel.org>
Date:   Mon, 14 Jun 2021 13:51:32 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <7631bab7-a8ab-f884-ab54-f4198976125c@mailbox.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/13/2021 6:07 AM, 'Tor Vic' via Clang Built Linux wrote:
> Since LLVM commit fc018eb, the '-warn-stack-size' flag has been dropped
> [1], leading to the following error message when building with Clang-13
> and LLD-13:
> 
>      ld.lld: error: -plugin-opt=-: ld.lld: Unknown command line argument
>      '-warn-stack-size=2048'.  Try: 'ld.lld --help'
>      ld.lld: Did you mean '--asan-stack=2048'?
> 
> In the same way as with commit 2398ce80152a ("x86, lto: Pass
> -stack-alignment only on LLD < 13.0.0") , make '-warn-stack-size'
> conditional on LLD < 13.0.0.
> 
> [1] https://reviews.llvm.org/D103928
> 
> Fixes: 24845dcb170e ("Makefile: LTO: have linker check -Wframe-larger-than")
> Cc: stable@vger.kernel.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/1377
> Signed-off-by: Tor Vic <torvic9@mailbox.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

The commit that this fixes went into 5.13-rc4 and our CI builds are 
currently failing without this so it would be nice if it could go into 
5.13 but I understand it is getting late in the cycle and there has 
already been a fixes pull request with a similar fix.

Cheers,
Nathan

> ---
>   Makefile | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 144d4f8b7eb3..51a1b6b2c2ab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -929,11 +929,14 @@ CC_FLAGS_LTO	+= -fvisibility=hidden
>   # Limit inlining across translation units to reduce binary size
>   KBUILD_LDFLAGS += -mllvm -import-instr-limit=5
> 
> -# Check for frame size exceeding threshold during prolog/epilog insertion.
> +# Check for frame size exceeding threshold during prolog/epilog insertion
> +# when using lld < 13.0.0.
>   ifneq ($(CONFIG_FRAME_WARN),0)
> +ifeq ($(shell test $(CONFIG_LLD_VERSION) -lt 130000; echo $$?),0)
>   KBUILD_LDFLAGS	+= -plugin-opt=-warn-stack-size=$(CONFIG_FRAME_WARN)
>   endif
>   endif
> +endif
> 
>   ifdef CONFIG_LTO
>   KBUILD_CFLAGS	+= -fno-lto $(CC_FLAGS_LTO)
> 

