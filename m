Return-Path: <linux-kbuild+bounces-6668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 170BBA90CA8
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 21:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 055387B0301
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Apr 2025 19:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14D92253F2;
	Wed, 16 Apr 2025 19:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q28ERErF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C115141C63;
	Wed, 16 Apr 2025 19:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744833392; cv=none; b=chYhCkYfTVT5m1/1b395Wc/bhNIIZ38VwS+qufgC5Tk93n0WGPG8L7vFuf+Mq/apgAbh3zFrrwJLVb6xWMb+2v1spPUiXSl83ZXSJskDBu/YOT1I5SWP+VtD05fQA+Lmk3KKaoRObKtqagvaopEWq63nMe5QDhuK0LM1EHiqCKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744833392; c=relaxed/simple;
	bh=1cQoQQDK1oUmzfGtTT0gHZLgQczHjt8gR3Q1A0MnmOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pktrB38AGnXoflbeyXAJqVfEmXE3dZe0NW9hTInDA6VbfNAlB/K/ku5p6lJealwXs30gvpx2co7zwySla4zvnMctmNPlj2nnhJ924C+0AQigY/krfwnPMRyrY2CbHm/V0ySWADbx/EV9+pVUXGyFZRnYo2vP8LHOHqg6436ujWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q28ERErF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33C56C4CEE2;
	Wed, 16 Apr 2025 19:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744833391;
	bh=1cQoQQDK1oUmzfGtTT0gHZLgQczHjt8gR3Q1A0MnmOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q28ERErFjTirg5FUFEx+Iimn+lOIgFKU4pP7Jsh6gye4h50ZrKR4GIJQBzK7g5s1E
	 dcbLn1pWLhIxir6ST0Mu+HWAamcjHWZFCg0M2So4Hx9AS5wxB6Q4HD4aUbUnSQ/4IE
	 7MHmdtk3WaybPtA8sZDNcqw0EP/b74DLV1SLDmtVeYCLblOIhuzbUEDFE+CarRDK4A
	 BgumN+7BBFgQsd5ZmOqC8v7TI/GIVitcxQL8pO71OE8Mb8OMZ8iIbvZyCTcjPs3aH/
	 lX9POmoH+s4icmxYYQVVLemtGQ+EH8oNU1SVMH76A2Tedqe3mbdoCaIKxjAK8ECKWJ
	 j89csIZJMglSw==
Date: Wed, 16 Apr 2025 12:56:28 -0700
From: Kees Cook <kees@kernel.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com,
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, elver@google.com,
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com,
	akpm@linux-foundation.org, yuzenghui@huawei.com,
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas.schier@linux.dev
Subject: Re: [PATCH 0/4] KVM: arm64: UBSAN at EL2
Message-ID: <202504161255.7583BC11@keescook>
References: <20250416180440.231949-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416180440.231949-1-smostafa@google.com>

On Wed, Apr 16, 2025 at 06:04:30PM +0000, Mostafa Saleh wrote:
> Many of the sanitizers the kernel supports are disabled when running
> in EL2 with nvhe/hvhe/proctected modes, some of those are easier
> (and makes more sense) to integrate than others.
> Last year, kCFI support was added in [1]
> 
> This patchset adds support for UBSAN in EL2.
> UBSAN can run in 2 modes:
>   1) “Normal” (CONFIG_UBSAN_TRAP=n): In this mode the compiler will
>   do the UBSAN checks and insert some function calls in case of
>   failures, it can provide more information(ex: what is the value of
>   the out of bound) about the failures through those function arguments,
>   and those functions(implemented in lib/ubsan.c) will print a report with
>   such errors.
> 
>   2) Trap (CONFIG_UBSAN_TRAP=y): This is a minimal mode, where similarly,
>   the compiler will do the checks, but instead of doing function calls,
>   it would do a “brk #imm” (for ARM64) with a unique code with the failure
>   type, but without any extra information (ex: only print the out-bound line
>   but not the index)
> 
> For nvhe/hvhe/proctected modes, #2 would be suitable, as there is no way to
> print reports from EL2, so similarly to kCFI(even with permissive) it would
> cause the hypervisor to panic.
> 
> But that means that for EL2 we need to compile the code with the same options
> as used by “CONFIG_UBSAN_TRAP” independently from the kernel config.
> 
> This patch series adds a new KCONFIG for ARM64 to choose to enable UBSAN
> separately for the modes mentioned.
> 
> The same logic decoding the kernel UBSAN is reused, so the messages from
> the hypervisor will look similar as:
> [   29.215332] kvm [190]: nVHE hyp UBSAN: array index out of bounds at: [<ffff8000811f2344>] __kvm_nvhe_handle___pkvm_init_vm+0xa8/0xac!
> 
> In this patch set, the same UBSAN options(for check types) are used for both
> EL1/EL2, although a case can be made to have separate options (leading to
> totally separate CFLAGS) if we want EL2 to be compiled with stricter checks
> for something as protected mode.
> However, re-using the current flags, makes code re-use easier for
> report_ubsan_failure() and  Makefile.ubsan
> 
> [1] https://lore.kernel.org/all/20240610063244.2828978-1-ptosi@google.com/
> 
> 
> Mostafa Saleh (4):
>   arm64: Introduce esr_is_ubsan_brk()
>   ubsan: Remove regs from report_ubsan_failure()
>   KVM: arm64: Introduce CONFIG_UBSAN_KVM_EL2
>   KVM: arm64: Handle UBSAN faults
> 
>  arch/arm64/include/asm/esr.h     | 5 +++++
>  arch/arm64/kernel/traps.c        | 4 ++--
>  arch/arm64/kvm/handle_exit.c     | 6 ++++++
>  arch/arm64/kvm/hyp/nvhe/Makefile | 6 ++++++
>  arch/x86/kernel/traps.c          | 2 +-
>  include/linux/ubsan.h            | 6 +++---
>  lib/Kconfig.ubsan                | 9 +++++++++
>  lib/ubsan.c                      | 8 +++++---
>  scripts/Makefile.ubsan           | 5 ++++-
>  9 files changed, 41 insertions(+), 10 deletions(-)

Nice! I assume this will go via the arm64 tree? I could carry it also,
if I get arm64 maintainer Acks...

-Kees

-- 
Kees Cook

