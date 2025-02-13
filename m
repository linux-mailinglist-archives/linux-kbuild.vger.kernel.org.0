Return-Path: <linux-kbuild+bounces-5736-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E293A338BA
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 08:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0CFCA7A2158
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 07:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A23FD208977;
	Thu, 13 Feb 2025 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="OHgeQudZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090632080D2;
	Thu, 13 Feb 2025 07:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739431241; cv=none; b=KioYGiwgm6fuMhkJeCRt1m1aqaPJ9CJTYiHUEW0Ie45PPBA0ljCE2B+27dLWB6dX1uxvD/rYlmZVYYb/9PBqwI8xYjTsN/WQYwai82Q2989k8vXC8unPIluNz96uCEo57sPbNnLQc0ijRcjQd2hC4N+I+A8DTCFpKHW/Uw18yNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739431241; c=relaxed/simple;
	bh=+UmDyGFYqbRGqxiUXDzk0wYia4DEJ/qtggUagtruh1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/g0UPOzXzj81+/sLY+uDBkBiGRzip4yA1ndUWX73gOyq4vsgM4jGBgt12TrhR97Woclf1C5F7bXEn0d8dTuAcGKpVP3R7pUShsVi2j9uF95bWLCft/WpVqRTFksEKoDxxW9A9cji3ocTBGs+/bKoNwI0k0rME0xGOdsuQDEupk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=OHgeQudZ; arc=none smtp.client-ip=212.42.244.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1739431188; bh=+UmDyGFYqbRGqxiUXDzk0wYia4DEJ/qtggUagtruh1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OHgeQudZxxT0wgi5FGAagv7q2QLFdFIkd0t7eygA7wxw/marKM8WnD45X7azm8HUM
	 31EnxHXdDNyET2f/Y/k98z4tGVCY2lYF5djVeG+CkfRgpvh9dAeohwS1GgQ4F+LZK3
	 zzyqrcRmkF8IiVKSYPI8wXg1bR22JFIxo0Lypzwg=
Received: from [212.42.244.71] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 67ad9d14-038b-7f0000032729-7f0000018ad4-1
	for <multiple-recipients>; Thu, 13 Feb 2025 08:19:48 +0100
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 13 Feb 2025 08:19:48 +0100 (CET)
Received: from buildd.core.avm.de (buildd-sv-01.avm.de [172.16.0.225])
	by mail-auth.avm.de (Postfix) with ESMTPA id 39DA480175;
	Thu, 13 Feb 2025 08:19:49 +0100 (CET)
Received: by buildd.core.avm.de (Postfix, from userid 1000)
	id 2A47B182D0A; Thu, 13 Feb 2025 08:19:49 +0100 (CET)
Date: Thu, 13 Feb 2025 08:19:49 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH] kbuild: rust: add rustc-min-version support function
Message-ID: <20250213-masked-wombat-of-painting-8afb53@buildd>
References: <20250210164245.282886-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210164245.282886-1-ojeda@kernel.org>
X-purgate-ID: 149429::1739431188-4EA08E17-E08D2BED/0/0
X-purgate-type: clean
X-purgate-size: 3033
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean

On Mon, Feb 10, 2025 at 05:42:45PM +0100, Miguel Ojeda wrote:
> Introduce `rustc-min-version` support function that mimics
> `{gcc,clang}-min-version` ones, following commit 88b61e3bff93
> ("Makefile.compiler: replace cc-ifversion with compiler-specific macros").
> 
> In addition, use it in the first use case we have in the kernel (which
> was done independently to minimize the changes needed for the fix).
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> This is based on top of the fix so that the fix remains as simple as
> possible:
> 
>     https://lore.kernel.org/rust-for-linux/20250210163732.281786-1-ojeda@kernel.org/
> 
>  Documentation/kbuild/makefiles.rst | 14 ++++++++++++++
>  arch/arm64/Makefile                |  2 +-
>  scripts/Makefile.compiler          |  4 ++++
>  3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index d36519f194dc..2608aa32c762 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -670,6 +670,20 @@ cc-cross-prefix
>              endif
>      endif
> 
> +$(RUSTC) support functions
> +--------------------------
> +
> +rustc-min-version
> +  rustc-min-version tests if the value of $(CONFIG_RUSTC_VERSION) is greater
> +  than or equal to the provided value and evaluates to y if so.
> +
> +  Example::
> +
> +    rustflags-$(call rustc-min-version, 108500) := -Cfoo
> +
> +  In this example, rustflags-y will be assigned the value -Cfoo if
> +  $(CONFIG_RUSTC_VERSION) is >= 1.85.0.
> +
>  $(LD) support functions
>  -----------------------
> 
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 2b25d671365f..1d5dfcd1c13e 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -48,7 +48,7 @@ KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
>  KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
>  KBUILD_AFLAGS	+= $(compat_vdso)
> 
> -ifeq ($(call test-ge, $(CONFIG_RUSTC_VERSION), 108500),y)
> +ifeq ($(call rustc-min-version, 108500),y)
>  KBUILD_RUSTFLAGS += --target=aarch64-unknown-none-softfloat
>  else
>  KBUILD_RUSTFLAGS += --target=aarch64-unknown-none -Ctarget-feature="-neon"
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index 8c1029687e2e..8956587b8547 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -67,6 +67,10 @@ gcc-min-version = $(call test-ge, $(CONFIG_GCC_VERSION), $1)
>  # Usage: cflags-$(call clang-min-version, 110000) += -foo
>  clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
> 
> +# rustc-min-version
> +# Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
> +rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
> +
>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> --
> 2.48.1

Reviewed-by: Nicolas Schier <n.schier@avm.de>

