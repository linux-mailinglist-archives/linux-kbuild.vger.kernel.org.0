Return-Path: <linux-kbuild+bounces-9092-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57662BCF248
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Oct 2025 10:30:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20D86426931
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Oct 2025 08:30:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C13D41547CC;
	Sat, 11 Oct 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lliM7r31"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3432C8B;
	Sat, 11 Oct 2025 08:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760171414; cv=none; b=E2Sa2e+r1v3pJvwri0wSCb8G/SfQTV43V97/U8kYB+8MXadEvIJeQ11Cw/l9wFVaYEyhtuIMBcUK5sHSOyy3cSZoSOe6zjavqTDFo0dkjr1Lu9zZAVms5cK5MDpjZyteZBNrHtR5tjiJz7YkgYJfBYrEuA3XLbLzovRyIVBlpJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760171414; c=relaxed/simple;
	bh=PHPzm3VsWx0Dprezg3T1hCIxsLLGjo2O6wDxFCClzK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkA4ArA3FD3TzIiE9VmrolZ+hKLXpjys5/e29Qz9NX6mp3nZA5i1NteZ3Y4rCrAZ76WIqTZ35YH90d5LUTuPcdjnRYQqqSC3eQmH9cVkkdtaJXpxLmqxzti9jmDuVviqrOOnfJERgIoEByAHWR0e98Ap9eRrA4Ikr1Spuzp7Y9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lliM7r31; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A57C4CEF4;
	Sat, 11 Oct 2025 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760171414;
	bh=PHPzm3VsWx0Dprezg3T1hCIxsLLGjo2O6wDxFCClzK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lliM7r31yuxBtXbJJobzwci7kz93ZjzqsONYRrVArtF5oLtiWiMsAXSNzleW7UJNN
	 qUF4i3ykubWAR3ybtOAm1KEicKgtyRCN3G/LqFNQ8j5gTbgu2KKqVtd3XWiEXAGec0
	 HhtHPCiOUbKRzeA2wuB+aJ3cUW+ta6HNCT21Xur03SS0dNeYBYLTivOcgSWLWN666K
	 xUv3nxDDMZkzP7OmD95uQe/76MEB8jx1nDMOea0bOOmoK1qKjjQRMKcCA3q6P/jFvD
	 XEfqo+9j7Rx+1/6KEzbTEJ3jlHtBjcYmeiAymUQS8DwKl409JfoSVpFt2XDc0xM2wH
	 P5YqO4xryYxnA==
Date: Sat, 11 Oct 2025 10:12:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexey Gladkov <legion@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	Charles Mirabile <cmirabil@redhat.com>
Subject: Re: [PATCH] kbuild: Use '--strip-unneeded-symbol' for removing
 module device table symbols
Message-ID: <aOoRhgzntzk2YKYP@levanger>
References: <20251010-kbuild-fix-mod-device-syms-reloc-err-v1-1-6dc88143af25@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010-kbuild-fix-mod-device-syms-reloc-err-v1-1-6dc88143af25@kernel.org>

On Fri, Oct 10, 2025 at 02:49:27PM -0700, Nathan Chancellor wrote:
> After commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules"), relocatable RISC-V kernels with CONFIG_KASAN=y start failing
> when attempting to strip the module device table symbols:
> 
>   riscv64-linux-objcopy: not stripping symbol `__mod_device_table__kmod_irq_starfive_jh8100_intc__of__starfive_intc_irqchip_match_table' because it is named in a relocation
>   make[4]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1
> 
> The relocation appears to come from .LASANLOC5 in .data.rel.local:
> 
>   $ llvm-objdump --disassemble-symbols=.LASANLOC5 --disassemble-all -r drivers/irqchip/irq-starfive-jh8100-intc.o
> 
>   drivers/irqchip/irq-starfive-jh8100-intc.o:   file format elf64-littleriscv
> 
>   Disassembly of section .data.rel.local:
> 
>   0000000000000180 <.LASANLOC5>:
>   ...
>        1d0: 0000          unimp
>                   00000000000001d0:  R_RISCV_64   __mod_device_table__kmod_irq_starfive_jh8100_intc__of__starfive_intc_irqchip_match_table
>   ...
> 
> This section appears to come from GCC for including additional
> information about global variables that may be protected by KASAN.
> 
> There appears to be no way to opt out of the generation of these symbols
> through either a flag or attribute. Attempting to remove '.LASANLOC*'
> with '--strip-symbol' results in the same error as above because these
> symbols may refer to (thus have relocation between) each other.
> 
> Avoid this build breakage by switching to '--strip-unneeded-symbol' for
> removing __mod_device_table__ symbols, as it will only remove the symbol
> when there is no relocation pointing to it. While this may result in a
> little more bloat in the symbol table in certain configurations, it is
> not as bad as outright build failures.
> 
> Fixes: 5ab23c7923a1 ("modpost: Create modalias for builtin modules")
> Reported-by: Charles Mirabile <cmirabil@redhat.com>
> Closes: https://lore.kernel.org/20251007011637.2512413-1-cmirabil@redhat.com/
> Suggested-by: Alexey Gladkov <legion@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> I am Cc'ing KASAN folks in case they have any additional knowledge
> around .LASANLOC symbols or how to remove/avoid them.
> 
> I plan to send this to Linus tomorrow.
> ---
>  scripts/Makefile.vmlinux | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Thanks!

Tested-by: Nicolas Schier <nsc@kernel.org>

