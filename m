Return-Path: <linux-kbuild+bounces-9422-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD858C37A32
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 21:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6160434D12F
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 20:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D56CC2D0C60;
	Wed,  5 Nov 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dr4HrivG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB5E262FF6;
	Wed,  5 Nov 2025 20:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373368; cv=none; b=ddo45R+tvIWLpdmJ1yAN8DwKec184cTOs+AcCE1hgyOq8LtGlrVZoQVljWYjhzmtOfVVhXAe4lH7Pv5QZaTzqZeiyUV32hJEbPx9qZoRc4n00Q2iOLemse/n/UHMwnV9Ald6exAXtvf9SkT5SXQQBoNwW7FhlYR3UCNrYdzb/6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373368; c=relaxed/simple;
	bh=b/UD5oSKNK4B76zMcgpHBcxjM71i6ykzsxfcy0wD20Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/XAXFgLgWn2Gc5zB+bn/sGDuTeGvOvJ6ifLbUNxy2v4/USJVF/nlrDdK3+lHU/8GhzmL50Qan7O+R4ILtjna8bjZ0URh1qdWWLcJGQUc8/1sgTabXHXLjEh9omA6/Z2beRINxfiDlCQAvw+aSDZc2F9/wyu+tM1MEhXTQvr8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dr4HrivG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FA0C4CEF5;
	Wed,  5 Nov 2025 20:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373368;
	bh=b/UD5oSKNK4B76zMcgpHBcxjM71i6ykzsxfcy0wD20Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dr4HrivG+0BdtlyuK+g6XDUhDGzN0aISWnb8lxEQjTKhxb3TKjxj4Pg1wXm3Mdoxz
	 OeZXdeFPbni7rSWj89xHI+fpPQ+tnXMcYpg2Ycc3fqowsoZLJaQYxUNSgswEzSSSoA
	 6aIiVF74QRAH/96v9ayeocvs6kZUgDHPOOB+iS+cALEnbhJdTKjZROnUDcEXeBtQzA
	 Xx0E5vYHD+l3URNY/m42rRP2CZV6yxudNC23haaSNBJevsjViXJr0FrT3JOXQydH3J
	 G+/6tWUyicEmKj/6tHPo7qCciWtnoyK9b9rSyTNkb9reKJomLOqslmHDrQQf2e28He
	 7mxwfYfPW7NkQ==
Date: Wed, 5 Nov 2025 13:09:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-kbuild@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: linux-next: new objtool warnings
Message-ID: <20251105200923.GA3787308@ax162>
References: <20251103091006.GV3245006@noisy.programming.kicks-ass.net>
 <20251103203256.5ac39302@canb.auug.org.au>
 <20251103093804.GY3245006@noisy.programming.kicks-ass.net>
 <20251105143027.214f491c@canb.auug.org.au>
 <20251105085637.GO4067720@noisy.programming.kicks-ass.net>
 <20251105100014.GY4068168@noisy.programming.kicks-ass.net>
 <20251105100202.GZ4068168@noisy.programming.kicks-ass.net>
 <20251105101010.GA4068168@noisy.programming.kicks-ass.net>
 <20251105170715.GA706366@ax162>
 <20251105191613.GA1831451@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105191613.GA1831451@noisy.programming.kicks-ass.net>

On Wed, Nov 05, 2025 at 08:16:13PM +0100, Peter Zijlstra wrote:
> # make O=tmp-build clean
> # make O=tmp-build allmodconfig
> # make O=tmp-build -j64 vmlinux 2>&1 | grep "\[M\]"
>   CC [M]  sound/sound_core.o
>   CC [M]  virt/lib/irqbypass.o
>   AS [M]  arch/x86/crypto/twofish-x86_64-asm_64.o
>   CC [M]  arch/x86/crypto/twofish_glue.o
>   CC [M]  samples/vfio-mdev/mtty.o
>   CC [M]  sound/ac97_bus.o
>   AS [M]  arch/x86/crypto/twofish-x86_64-asm_64-3way.o
>   CC [M]  arch/x86/crypto/twofish_glue_3way.o

Thanks, I bisected this to commit d2d5cba5d92c ("kbuild: remove EXPERT
and !COMPILE_TEST guarding from TRIM_UNUSED_KSYMS"), which explains
everything when looking at Makefile:

  ifdef CONFIG_TRIM_UNUSED_KSYMS
  # For the kernel to actually contain only the needed exported symbols,
  # we have to build modules as well to determine what those symbols are.
  KBUILD_MODULES := y
  endif

Maybe we want to restore the !COMPILE_TEST dependency?

Cheers,
Nathan

