Return-Path: <linux-kbuild+bounces-6492-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22847A7E717
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 18:47:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66F051885A1C
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 16:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DBF20E6FC;
	Mon,  7 Apr 2025 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jx56oOeJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0236620E30C;
	Mon,  7 Apr 2025 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044115; cv=none; b=m2kblExlD3511+FZdWrCc/DcW/Rf6pcLlvyucxe/Av5QcHaf9bM6bL2b9uHShgRwRly1fWbzqHjEqxFjY9Iy13WsFY8FLQHlnBpt/tAN5BGDLt22kdFFN1vkARrRroRrDFxnjjnojaV4baKfJZpH7kTmNyGLCFCHIxkWfFiOG+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044115; c=relaxed/simple;
	bh=2DZaBdiIWfRi2cZXVupSLX8P1kQDQE1JN+1+Y8S2N2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJ0N0By+HDGtINQcAFHco8ma/ct3oSB61NIN27FTXpX81VWuMJrMRPFVzfNej1cXOiddKYTYsmm9ua6xjjkfBEkzFFa/JnDSJCxSvnX8WVxZz2z0KZK9G8K0rGSUPA5KA5Jjzz4IAlvV2GFTVrysg8MBPv0v7mc9/6JLE7mXJxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jx56oOeJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B715DC4CEDD;
	Mon,  7 Apr 2025 16:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044113;
	bh=2DZaBdiIWfRi2cZXVupSLX8P1kQDQE1JN+1+Y8S2N2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jx56oOeJKQbuRt2tp4+Xt6FIXUoZzIU/0LeM+CA9psDCzTxiRu73kTHMT8QNjQzxj
	 NeJABgeGL2rOuTieaPWkit/Ti5qv6ZStUTbHWHH3sGmNBPrWvZZ5jFTC5/Y5G/Q5io
	 csCPtwRcv7BVxCHj9xNP8nZc9ibQFOSwLZNMC44ARnPnjs2YZRo9CNfe5XgXv4ts97
	 bOV/tzzCrGy41yMfhpifKnNcb9JXzPXg+YKSZZjjpPNJIrfhpHY8d5IZ8b8K+ND4sX
	 OwjRJYyUZVeLpVEwwNRlqVAYJWUxvA00mDxRjqHnFU1wv5uh8MEYjIdA1XX5fWDld1
	 X+TPrxdxwu2Aw==
Date: Mon, 7 Apr 2025 09:41:51 -0700
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
Subject: Re: [PATCH 0/4] Make gcc-8.1 and binutils-2.30 the minimum version
Message-ID: <20250407164151.GB2536@sol.localdomain>
References: <20250407094116.1339199-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407094116.1339199-1-arnd@kernel.org>

On Mon, Apr 07, 2025 at 11:41:12AM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> x86 already requires gcc-8.1 since linux-6.15-rc1, which led me to
> actually go through all  version checks and make this is the minimum
> for all architectures.
> 
> Most of the actual resulting changes are actually for raising the
> binutils version, which eliminates version checks on x86 and arm64.
> 
> Arnd Bergmann (4):
>   kbuild: require gcc-8 and binutils-2.30
>   raid6: skip avx512 checks
>   x86: remove checks for binutils-2.30 and earlier
>   arm64: drop binutils version checks

This is intended to supersede the patches from Uros that removed checks for
binutils < 2.25, right?  See:

* https://lore.kernel.org/linux-crypto/20250404074135.520812-1-ubizjak@gmail.com/
* https://lore.kernel.org/linux-crypto/20250404074135.520812-2-ubizjak@gmail.com
* https://lore.kernel.org/linux-crypto/20250404074135.520812-3-ubizjak@gmail.com/

If we can indeed bump up the requirement to 2.30, that would be great.

Just a note though: I recently added VAES and VPCLMULQDQ instructions to
BoringSSL, which increased the binutils requirement of building BoringSSL to
2.30, and this caused issues in a downstream project; e.g. see
https://github.com/briansmith/ring/issues/2463.  Specifically people complained
about being unable to build on Amazon Linux 2 and CentOS/RHEL/Oracle Linux 7.

So I just thought I'd mention that, based on past experience with this sort of
thing, those are the specific cases where it seems people are most likely to be
trying to use binutils < 2.30.

But if those distros are not going to be supported any longer (without
installing newer tools on them), or even are already unsupported due to the gcc
requirement, bumping up the binutils requirement to 2.30 sounds good to me.

- Eric

