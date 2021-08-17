Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02EF3EE42C
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 04:08:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234047AbhHQCIr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 22:08:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236138AbhHQCIq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 22:08:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E012360F55;
        Tue, 17 Aug 2021 02:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629166093;
        bh=4DKsW+Y254h0LIfiIDGc5btd1MDbS1Uf8FdQxVoju98=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sbdjdovsRi4sae2ELAiVUJV2tZURxq/e3Je9n7V0XpGmJVgnQVwckdNgF3S6aue4j
         PzCFObXebIbBhBU6lEo9OteCsjL5BgaOCoHYthG+gSSOCZ/cePbFm1kFQ2XO4v0uGL
         OrkjslGUEfVUPmTTQYFe7Q89NNH78BEPfJMs2PMYIVNSfxgLQoxNYYelQ/gN99pRfP
         XiqTmIgCOLPSLbo4jgLc9IjwJOuEQEN1altCeWs3vwIxHrX3S/YDdClO7yW4wGfInr
         Vw024cpmGcFHxHIq1iVudM4/CxLGV60ZoQhFLhoHk89zevJX5294SI9Rs30+MkmxG3
         4Iyp6Lo+2bwFA==
Subject: Re: [PATCH 5/7] x86: remove cc-option-yn test for -mtune=
To:     Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-6-ndesaulniers@google.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <7a39afcf-363b-9ee1-00d1-5adc9def231d@kernel.org>
Date:   Mon, 16 Aug 2021 19:08:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210817002109.2736222-6-ndesaulniers@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/2021 5:21 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> As noted in the comment, -mtune= has been supported since GCC 3.4. The
> minimum required version of GCC to build the kernel (as specified in
> Documentation/process/changes.rst) is GCC 4.9.
> 
> tune is not immediately expanded. Instead it defines a macro that will
> test via cc-option later values for -mtune=. But we can skip the test
> whether to use -mtune= vs. -mcpu=.
> 
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: x86@kernel.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Yay for removing stale checks!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>   arch/x86/Makefile_32.cpu | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/arch/x86/Makefile_32.cpu b/arch/x86/Makefile_32.cpu
> index cd3056759880..e7355f8b51c2 100644
> --- a/arch/x86/Makefile_32.cpu
> +++ b/arch/x86/Makefile_32.cpu
> @@ -2,13 +2,7 @@
>   # CPU tuning section - shared with UML.
>   # Must change only cflags-y (or [yn]), not CFLAGS! That makes a difference for UML.
>   
> -#-mtune exists since gcc 3.4
> -HAS_MTUNE	:= $(call cc-option-yn, -mtune=i386)
> -ifeq ($(HAS_MTUNE),y)
>   tune		= $(call cc-option,-mtune=$(1),$(2))
> -else
> -tune		= $(call cc-option,-mcpu=$(1),$(2))
> -endif
>   
>   cflags-$(CONFIG_M486SX)		+= -march=i486
>   cflags-$(CONFIG_M486)		+= -march=i486
> 
