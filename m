Return-Path: <linux-kbuild+bounces-7126-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F83AB8F19
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 20:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB3731B6059B
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 May 2025 18:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F988263F59;
	Thu, 15 May 2025 18:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OMZ8K0Lo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624125DB14;
	Thu, 15 May 2025 18:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333690; cv=none; b=O+XjTrsaQc0LRMORFW5jjsqCxLmS4XKrUe3YUVUS4vN2YoguW0628E5xK5WW4gkvXtZzc1+Gfw7rc0IqcJ3lvslv3kMWyDQjfvrqHbO6PW6YU2YZb0dc47r1+AivU+bJqB+QBy2qJdQQlY36a791fTmOrxI2KxWW9IsNBVCj3Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333690; c=relaxed/simple;
	bh=YGInIQcg7bEfVfDW2Nf5dYzwwNKPK10uDMpf45f1d7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4OW9xdcksf9rjlNTuG0zlkAQKQf5Cjv8caIHA9MvoGCYYbu2WlvmGzLCiuU4MDklHOchC9BbK85jIKKjb4TLZM3Bp5hWZLUM47cEz0brPMmD3fcivCidSKH5KkpC40q4oW8MpVl2ywRqh+oUu88MWHRkQXuKy7xayVQyeov6pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OMZ8K0Lo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49F07C4CEE7;
	Thu, 15 May 2025 18:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747333689;
	bh=YGInIQcg7bEfVfDW2Nf5dYzwwNKPK10uDMpf45f1d7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OMZ8K0LouaSIhDJ9eyhsLxTag1NTaaYDJVcV/HbTS+yy0lRFW/bvKAEFSc1ccSFB8
	 iF4Jln8u1TO5rtFHsN9WxhppohWgTbP4H2uYfQhwt804pkjsqoU5cVUgMbY/8IP5IH
	 FPlA+XKGoDvRvJUWuZhLuAKmZm3tXvtoj+BbM0YqlAaeU2ImMJbyM96PNSeboVOxJ7
	 dl4seT24XaKmWx6rI/lyCl+f6Nn9YobkiT6vX9y8LarBZ3oD90GRrBxuHhy4G82HPZ
	 wmmAKbKp6F17WazFgLrAv3kRtyT+y1YfBompgVHKp531BZrcHY2hTPrQKwFjrCwWXI
	 otqbYn3GmdOYA==
Date: Thu, 15 May 2025 11:28:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Brian Gerst <brgerst@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ingo Molnar <mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Takashi Iwai <tiwai@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uros Bizjak <ubizjak@gmail.com>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 1/4] kbuild: require gcc-8 and binutils-2.30
Message-ID: <20250515182806.GD1411@quark>
References: <20250407094116.1339199-1-arnd@kernel.org>
 <20250407094116.1339199-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-2-arnd@kernel.org>

On Mon, Apr 07, 2025 at 11:41:13AM +0200, Arnd Bergmann wrote:
> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
> index d564362773b5..41b1431f5a6b 100644
> --- a/Documentation/process/changes.rst
> +++ b/Documentation/process/changes.rst
> @@ -29,13 +29,13 @@ you probably needn't concern yourself with pcmciautils.
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
> -GNU C                  5.1              gcc --version
> +GNU C                  8.1              gcc --version
>  Clang/LLVM (optional)  13.0.1           clang --version
>  Rust (optional)        1.78.0           rustc --version
>  bindgen (optional)     0.65.1           bindgen --version
>  GNU make               4.0              make --version
>  bash                   4.2              bash --version
> -binutils               2.25             ld -v
> +binutils               2.30             ld -v
>  flex                   2.5.35           flex --version
>  bison                  2.0              bison --version
>  pahole                 1.16             pahole --version

Later in this file, there's another mention of the binutils version that needs
to be updated.  (Or maybe removed since it's redundant with the table?)

    Binutils
    --------

    Binutils 2.25 or newer is needed to build the kernel.

