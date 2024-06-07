Return-Path: <linux-kbuild+bounces-2025-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 826CF9003FA
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 14:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F6A3287555
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2024 12:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322551922D2;
	Fri,  7 Jun 2024 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="O8v4kHDn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68862192B71;
	Fri,  7 Jun 2024 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717764179; cv=none; b=fqpPnsDwfiQV97F4HCeuq7OItNcPOnsDtdGY6DUNZsNofNmPu46LsDO1z9/Djl47YaqZ92sjVqdWKogudUvpU1acvJy6erGnbuFnbfVD2uMLG3BZrrriaB8GtWFdGaVY/qHb9KQZ0M5IyT+tpIQmIO2heg699MJKX92eXv+eBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717764179; c=relaxed/simple;
	bh=qEfoIYcUTsUg3gv//R+kNqg80au3Sr4sLIrkhTYVgf4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IdVcZ+Y+opF/62e6xYMFKj5YgetGdQHjmu2oPTcghL44dzX/SQNT37ABRB51iuQdIsgpxkiHbyfZMhVlQFvjN0STx5BzQGRYwFQ1Si6nCQ0nAS0phuJ9x421fuF6r1ld8U1cBJg+efT20rmHNLZkGooNRtmIog/+QhWDZdgcFHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=O8v4kHDn; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1717764169;
	bh=bqla57tOtU1mgzH0i+KepUx0yjfzWO1zi3pSk2wCH7k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O8v4kHDnEusUpfTKv+k9ca6+DKUiHrGwKXNLOEj5uQVJnWaRRdXzLXMDqDNJrndoj
	 J4JanOe0eVBq1cm+iF7iDDkGMR/NGrQwNm2N3ZCmN0Kj6X1dCwSNcjWxtKEoqOHW4A
	 jREgJLFAA9rgjPccpjHmRcwgIM5r9GC2CW3aYpl9Py4LXWixl11AiYe7h2cbF8R5ny
	 wMYQhVEF5bZV5JDI7n7Rkg5zmJYIKBw4dph5bKg+DdsT85S58graDqz4dF3GxZxzoL
	 zc3LEhEG40+eUz0kTjrV3F+4yK1Chlt1GwPBU0ZiXNSN2vL4p/jERZzpzt+2W5igEq
	 BWfVHkKqAZtaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VwgpG42nXz4wc3;
	Fri,  7 Jun 2024 22:42:46 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: vdso: fix building with wrong-endian toolchain
In-Reply-To: <20240607061629.530301-1-arnd@kernel.org>
References: <20240607061629.530301-1-arnd@kernel.org>
Date: Fri, 07 Jun 2024 22:42:44 +1000
Message-ID: <87frtoq5yz.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Arnd Bergmann <arnd@kernel.org> writes:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Building powerpc64le kernels with the kernel.org crosstool toolchains
> no longer works as the linker attempts to build a big-endian vdso:
>
> powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: arch/powerpc/kernel/vdso/sigtramp32-32.o: compiled for a little endian system and target is big endian
> powerpc-linux/lib/gcc/powerpc-linux/12.3.0/../../../../powerpc-linux/bin/ld: failed to merge target specific data of file arch/powerpc/kernel/vdso/sigtramp32-32.o
>
> Apparently creating the vdso.lds files from the lds.S files fails to
> pass the -mlittle-endian argument here, so the output format gets set
> wrong. Changing the conditional to check for CONFIG_CPU_LITTLE_ENDIAN
> instead still works, as the kernel configuration definitions are visible.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I'm fairly sure this worked in the past, but I did not try to bisect the
> issue.

It still works for me.

I use the korg toolchains every day, and kisskb uses them too.

What commit / defconfig are you seeing the errors with?

Is it just the 12.3.0 toolchain or all of them? I just tested 12.3.0
here and it built OK.

I guess you're building on x86 or arm64? I build on ppc64le, I wonder if
that makes a difference.

The patch is probably OK regardless, but I'd rather understand what the
actual problem is.

cheers

> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
> index 426e1ccc6971..5845ea2d1cba 100644
> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
> @@ -7,7 +7,7 @@
>  #include <asm/page.h>
>  #include <asm-generic/vmlinux.lds.h>
>  
> -#ifdef __LITTLE_ENDIAN__
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
>  #else
>  OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
> diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
> index bda6c8cdd459..82c418b18cce 100644
> --- a/arch/powerpc/kernel/vdso/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
> @@ -7,7 +7,7 @@
>  #include <asm/page.h>
>  #include <asm-generic/vmlinux.lds.h>
>  
> -#ifdef __LITTLE_ENDIAN__
> +#ifdef CONFIG_CPU_LITTLE_ENDIAN
>  OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>  #else
>  OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
> -- 
> 2.39.2

