Return-Path: <linux-kbuild+bounces-9777-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E11C7E20A
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 15:57:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA7773AA5D1
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 Nov 2025 14:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C6C22D7DE2;
	Sun, 23 Nov 2025 14:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuKqZjYN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7E2D6E6D
	for <linux-kbuild@vger.kernel.org>; Sun, 23 Nov 2025 14:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763909849; cv=none; b=sVRkqczkCuINky6XdpgEpfORirCBJF/zWaAI8C0GuIEJHI5JKlhn+9mrCJM/7iZU4d4y8nINKgGtcf1cUKTj/7kT8VbItODGwMU1HVmmBsCj/njMfcmup9Lcor6ZU/GUpELW2kAFpmXx3qe+e7+h90wP0QxFozViNMX2e8w3C/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763909849; c=relaxed/simple;
	bh=K3ub+XN+dK5BebXb5mWR26pjcLIx/qIluZdqNfZ1t+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucS3vzXm4K/pUjaD6o9HL4VZCgj3819UNF8rzXI7LGFyXXgKgS10eFiiDOWGgMhhsrOfoTF0853TymN/k5LFu5/2fu8WPjzoIxt/anY9TXSjMkQP+k5jh4L4yxKm4/Sh9vPnwlrkf7BIDFKTaRAzCL2P2qciEZDdBq2U1qbzUfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuKqZjYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4ABC113D0;
	Sun, 23 Nov 2025 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763909849;
	bh=K3ub+XN+dK5BebXb5mWR26pjcLIx/qIluZdqNfZ1t+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kuKqZjYNy9zZsGzAmW+DCx7ZL6pFdTlkY2Sr1vt0WEsR6UHdn1wWoreBt1bhiAT5p
	 BMxN69x+BPfEkoCBLGvuFIfsnxAp4aiWtumrcj+2neGxfxc5hg4VOWNr6NlQhHsTKh
	 +dtvqylXTj4n/+dSVrzvF/2aW3lVhCM66ALuuRCcELxlICgvdI2Z8c8i9dhFk5BSaI
	 0RNeuWy7ADL93Gmyf8oNMW7k3w+4D54LjGTKbG/xKbsFYCGh9tbba6q+PZvoQCBVhh
	 NAxYz4LWYU0dRaE+1IOoHV8DE0ExHZ9f1eQrY09PAYdm0x9T1akiYDaL+1eYmAdhCG
	 wHtVGTzhbDJaQ==
Message-ID: <d69d7167-00d1-49c5-90ee-6bc0b7e8295f@kernel.org>
Date: Sun, 23 Nov 2025 15:57:24 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] modpost: Amend ppc64 save/restfpr symnames for -Os
 build
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>,
 linux-kbuild@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20251123.131330.407910684435629198.rene@exactco.de>
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Content-Language: fr-FR
In-Reply-To: <20251123.131330.407910684435629198.rene@exactco.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 23/11/2025 à 13:13, René Rebe a écrit :
> Building a size optimized ppc64 kernel (-Os), gcc emits more FP
> save/restore symbols, that the linker generates on demand into the
> .sfpr section. Explicitly allow-list those in scripts/mod/modpost.c,
> too. They are needed for the amdgpu in-kernel floating point support.

Would have been interested to know with which version of GCC the problem 
started.

By the way you seem to fix the problem for modules, but does it also 
work when amdgpu is in kernel ? I would have expected a need to add 
functions in arch/powerpc/lib/crtsavres.S as well, just like following 
commits:

8fe9c93e7453 ("powerpc: Add vr save/restore functions")
7fca5dc8aa7a ("powerpc: Fix module building for gcc 4.5 and 64 bit")
da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc versions")


> 
> MODPOST Module.symvers
> ERROR: modpost: "_restfpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_26" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_27" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_25" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_28" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savegpr1_29" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_20" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_savefpr_22" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "_restfpr_15" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> WARNING: modpost: suppressed 56 unresolved symbol warnings because there were too many)
> 
> Signed-off-by: René Rebe <rene@exactco.de>
> ---
> V2: description
> Theoretically for -stable, but no previous commit that broke it.

In that case you have to add Cc: stable@vger.kernel.org
Add indeed it is likely a gcc upgrade that broke it, not a previous commit.

> ---
>   scripts/mod/modpost.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 47c8aa2a6939..133dfa16308a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -602,6 +602,10 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
>   		/* Special register function linked on all modules during final link of .ko */
>   		if (strstarts(symname, "_restgpr0_") ||
>   		    strstarts(symname, "_savegpr0_") ||
> +		    strstarts(symname, "_restgpr1_") ||
> +		    strstarts(symname, "_savegpr1_") ||
> +		    strstarts(symname, "_restfpr_") ||
> +		    strstarts(symname, "_savefpr_") ||
>   		    strstarts(symname, "_restvr_") ||
>   		    strstarts(symname, "_savevr_") ||
>   		    strcmp(symname, ".TOC.") == 0)


