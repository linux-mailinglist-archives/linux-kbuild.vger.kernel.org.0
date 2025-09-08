Return-Path: <linux-kbuild+bounces-8770-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C91EB49393
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 17:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B3B201A89
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Sep 2025 15:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229652F0C78;
	Mon,  8 Sep 2025 15:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNGTQWlL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E725D10E0;
	Mon,  8 Sep 2025 15:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757345677; cv=none; b=pLsoXfXR5KH/gyfvRIWHMeSQnwFDy4yyf6c0z6yGI6XyFgxj8BPKy5H/VAKu5ZTUS4Qc1OZQtUUOe4X8nFbSGUTt0gvqsVENAg91J1QXENy/kW8SImea61BcUkbX5dCp2Op17vuQKyA2afeZXfk5yGoZ0rtYXUsgpkWM9JridiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757345677; c=relaxed/simple;
	bh=O3aQStur6JWZyhmX9zDlOTl/8G32mPz5UiAUeURrgn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IsOrpfkizequlmZbJzisSCf5TEJz0Y3qvjNzuKhGT5k3mAE88EylvVUEiPh9R9J4j727sYTlM0S2i7iEQd0A4ps6YatalkPJiuBhwyrSub9L/+u3Gf0VbCHJi7x0+r6AHVW+0NkoEEz0nWn5GVGgwhuyL5GwRkHmLfwDpdXyKMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNGTQWlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A86C4CEF1;
	Mon,  8 Sep 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757345676;
	bh=O3aQStur6JWZyhmX9zDlOTl/8G32mPz5UiAUeURrgn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CNGTQWlLeb3pK3bdrOPUuNV5xOBDKWB/0lF7iV/dg+bjsmTNIUOFVOyVvgRlMz+YS
	 XyObVGg0yiuFuxebqvg8ktNnLML3LxMlMe2Lda6ZaEfhGceAJ1UlcwqlfBg6wNgDTH
	 uRzIRSpfMgfhFqgLTwIXsLU/K6HJvBBJsR0kaKt0qGZWfnoDJD2WNaT9TGHwS8XqKQ
	 3hfoInmRGTMZDR1Prb9WMJovyBQPsDIVEPijqzcoA7IvCWqjbXj3SFB2+dkUyyV4y/
	 yBx8oJdXShZJP4YLapJ0ZjntL0M5tKOR9BRtQSh8h9fIGFwhCq3ZvsoStY3gkMxVpv
	 v5FgJ1YR6Eb8A==
Date: Mon, 8 Sep 2025 08:34:32 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with Lnus' tree
Message-ID: <20250908153432.GA1725137@ax162>
References: <20250908134913.68778b7b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908134913.68778b7b@canb.auug.org.au>

Hi Stephen,

On Mon, Sep 08, 2025 at 01:49:13PM +1000, Stephen Rothwell wrote:
> Today's linux-next merge of the kbuild tree got a conflict in:
> 
>   arch/riscv/Kconfig
> 
> between commit:
> 
>   41f9049cff32 ("riscv: Only allow LTO with CMODEL_MEDANY")
> 
> from Lnus' tree and commit:
> 
>   6578a1ff6aa4 ("riscv: Remove version check for LTO_CLANG selects")
> 
> from the kbuild tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.

Yes, this looks correct to me, thanks! I will make sure to mention it to
Linus if I do not need to backmerge his tree before the 6.18 Kbuild pull
request.

> This is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc arch/riscv/Kconfig
> index 51dcd8eaa243,850ba4b4b534..000000000000
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@@ -64,9 -64,8 +64,8 @@@ config RISC
>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
>   	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
>   	select ARCH_SUPPORTS_HUGETLBFS if MMU
> - 	# LLD >= 14: https://github.com/llvm/llvm-project/issues/50505
> - 	select ARCH_SUPPORTS_LTO_CLANG if LLD_VERSION >= 140000 && CMODEL_MEDANY
> - 	select ARCH_SUPPORTS_LTO_CLANG_THIN if LLD_VERSION >= 140000
>  -	select ARCH_SUPPORTS_LTO_CLANG
> ++	select ARCH_SUPPORTS_LTO_CLANG if CMODEL_MEDANY
> + 	select ARCH_SUPPORTS_LTO_CLANG_THIN
>   	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS if 64BIT && MMU
>   	select ARCH_SUPPORTS_PAGE_TABLE_CHECK if MMU
>   	select ARCH_SUPPORTS_PER_VMA_LOCK if MMU



