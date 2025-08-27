Return-Path: <linux-kbuild+bounces-8627-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02560B37A60
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 08:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1177F7AAD82
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Aug 2025 06:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8392E8DFE;
	Wed, 27 Aug 2025 06:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VpKRZ7MP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dNCiLZL9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180302E7F2F;
	Wed, 27 Aug 2025 06:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756276267; cv=none; b=AQo8JXuRC6NACvjXqW3ci4QAVuKGwMffdTN8vO9dkuPiMfPz1SYsP6FLIirZasn0aRAIBlItMokVRMB92G/R4TTQDawV4b/NPdLWpK2kbexebOD2uF2Xj7ODTmQi9WtAOspu2/B0fHxJ+3FiEMxXaX5UrFwBJjdJstkAF1MFuUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756276267; c=relaxed/simple;
	bh=oRoxIceV7LTx6AmN9NO76jl7HMDW8euf2adJBTHuW+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oua9xKJgm7lO1Gch3d3kk5XVtDAmrUrKseaIWS4ltKA6CpQW1IdAySWN8MbwBZq3L4CEx+8r9Y/dUSa6Mjdev8uNFwAaqDnAyeZMbxOVBhvIbE2j1YtQ/c0VbvDHnVXq88gL6Ce4vnUKZw7HV5EHVSgQawKbmSKpwtftslEsBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VpKRZ7MP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dNCiLZL9; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Wed, 27 Aug 2025 08:31:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1756276262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8fEvGw02NawUgUfUQvj6MrhwcD5uPQ6uzaNBRQKmcA=;
	b=VpKRZ7MPMkJNfWuQYK8gKlpu7kcKbEtK5KnhFSoUoRhEvA/Ve3nezIZj0Z9NnurFBu/j72
	Vh/0Dukfn+J2opW5io05JjJcfJvQxQyz4YeZeiHt6qG6aWsy9kvGEj6/H3VHfpUWzG8acW
	wZADGWn1ugn1effPb3YZPPJIkfHiW/6nEOPhhORV5wnHpEd6FvliqQHb9IAFGr/jS/OE5b
	ga96t+69rEA3Fit5B+cMlRVNd1+pMOSX2K0WbhuaGkNi7bPs1YhEKPWTDpLfFb0m2OFLPK
	g6Y8mhB3eDMzN1M23vm/SkfwMbC+gddekVoAPvBo/u5Fj9geIghiVQkOk9c+8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1756276262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8fEvGw02NawUgUfUQvj6MrhwcD5uPQ6uzaNBRQKmcA=;
	b=dNCiLZL9IuVyfkB+FHD/I1vJRjT9UTcBsdHsV4mnQHz+vHYVXMoJ0E5QP8EMMG4dKrufI9
	L7vHyg3bNCzRLnCw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>

Hi!

On Wed, Aug 13, 2025 at 07:43:41AM +0200, Thomas Weiﬂschuh wrote:
> Make sure the byte order and ABI of the userprogs matches the one of the
> kernel, similar to how the bit size is handled.
> Otherwise the userprogs may not be executable.
> This happens for example on powerpc little endian, or riscv32.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nicolas Schier <n.schier@avm.de>
> Acked-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> ---
> Difference to original series:
> * Also handle -EL/-EB for MIPS
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index d0f5262a9c0f3b4aa79a91c20cc149d034ffa0b7..7d40f84d5efde18ed3a2f4d8cf7a9b1ec3610ed4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1137,8 +1137,8 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
>  LDFLAGS_vmlinux	+= --emit-relocs --discard-none
>  endif
>  
> -# Align the bit size of userspace programs with the kernel
> -USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
> +# Align the bit size, byte order and architecture of userspace programs with the kernel
> +USERFLAGS_FROM_KERNEL := -m32 -m64 -mlittle-endian -mbig-endian -EL -EB --target=% -march=% -mabi=%
>  KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
>  KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))

I looked some more at the breakage reported from -next [0].
For architectures with multiple possible byte orders or ABIs the toolchain
might be able to build the kernel for all combinations but might not have a
matching libc for them. Currently userprogs uses the default byteorder and
ABI from the compiler, which will match the included libcs if there is any.
However the resulting binary might not run on the built kernel.
CC_CAN_LINK can be extended to generically handle different byte orders, as
for those we have standard kconfig symbols. But handling ABIs would need to
be architecture specific and a bit more complex.

We can't use KBUILD_*FLAGS for CC_CAN_LINK, as they are not yet set during
the configuration stage.

I see the following options:

* Add byte order and architecture-specific ABI handling to CC_CAN_LINK
* Accept that userprogs might not be runnable on the built kernel
* Let the user manually set CC_CAN_LINK to override the autodetection
* Add separate handling for runnable userprogs
* Use tools/include/nolibc/ for userprogs instead of the toolchain libc
  (unlikely, but I wanted do mention the option)


Thomas

[0] https://lore.kernel.org/lkml/20250818140143.61b8c466@canb.auug.org.au/

