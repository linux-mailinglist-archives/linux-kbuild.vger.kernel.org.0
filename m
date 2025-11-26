Return-Path: <linux-kbuild+bounces-9877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A26C8BE85
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 21:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F413E358A4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 20:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5688334252A;
	Wed, 26 Nov 2025 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6M0EEqH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA27340DBD;
	Wed, 26 Nov 2025 20:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764190155; cv=none; b=hfzhPBt49cG7JF+/b0E+WCJMxJ/zR4Fg6nd4N9wlnei2dQkRbjIyDfuhmXgt9Olglt31S677pPqbnZf78WcGHMES8xtr3wVtMsWEJ4qYUAJfGPOlt8CYtwL4QdjNuBOToS6r3SfCHxrpDg5Livi4H6U5o/YCzv9Ws5XCw9ZYbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764190155; c=relaxed/simple;
	bh=Ld6pg6klGN4n4kfd7qcFOY91BR7cRFdceB5VpT8strY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IX8IWlErQ2eEv7PYwlbpuu/m6xUGTRKvwCnahma3p5Eb+AUu0Lar3XjuAeWG44EK3yXsBrsvJqQ+ITQVXw1cNJ0T71VZsGk6/w0t5hXcOOAh9OcMHWAsjbGznZt2BGWuzKesSNBgVFezNCvFZSxbJVrCsZ0ugbIwWtzp5ZLwKgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6M0EEqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37A8FC4CEF7;
	Wed, 26 Nov 2025 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764190154;
	bh=Ld6pg6klGN4n4kfd7qcFOY91BR7cRFdceB5VpT8strY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6M0EEqHVRfQA1jr09+cwgXWEAGXh9fvl57IVLxcAnc2gsBTRKn8rrnAK0x150wiB
	 b5x9pilzhDcjkdEkys+NbSvPZ7O6/2e2kFvYudNcrLgfu+A6YTL8RKXeb0jJv24FBz
	 hNBzjwPkRlayoBytNeRUQZYBqGsqdF+qRkKAFESnl3MXNGcPV6hTD3lhrG6A6x9G2+
	 shVEHINKQDEjZdqN16YUpS8fnrcnR/AmpkxGHHk7nrT2vzRRZnQeiPA8emtbzY1FDp
	 9DrW4aAxqA89Y1I+dv3L9+7sIQgVWW76KFeXrKu2bA8A7nya6DpAnShBhyHoPY5duJ
	 4wGjxY//q5ZlQ==
Date: Wed, 26 Nov 2025 08:49:41 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Enable GCC diagnostic context for
 value-tracking warnings
Message-ID: <aSaxFayrJEAUz1cT@derry.ads.avm.de>
References: <20251121184342.it.626-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121184342.it.626-kees@kernel.org>

On Fri, Nov 21, 2025 at 10:43:48AM -0800, Kees Cook wrote:
> Enable GCC 16's coming "-fdiagnostics-show-context=N" option[1] to
> provide enhanced diagnostic information for value-tracking warnings,
> which displays the control flow chain leading to the diagnostic. This
> covers our existing use of -Wrestrict and -Wstringop-overread, and
> gets us closer to enabling -Warray-bounds, -Wstringop-overflow, and
> -Wstringop-truncation, so we can track the rationale for the warning,
> letting us more quickly identify actual issues vs what have looked in
> the past like false positives. Fixes based on this work have already
> been landing, e.g.:
> 
>   4a6f18f28627 ("net/mlx4_core: Avoid impossible mlx4_db_alloc() order value")
>   8a39f1c870e9 ("ovl: Check for NULL d_inode() in ovl_dentry_upper()")
>   e5f7e4e0a445 ("drm/amdgpu/atom: Work around vbios NULL offset false positive")
> 
> The context depth ("=N") provides the immediate decision path that led
> to the problematic code location, showing conditional checks and branch
> decisions that caused the warning. This will help us understand why
> GCC's value-tracking analysis triggered the warning and makes it easier
> to determine whether warnings are legitimate issues or false positives.
> 
> For example, an array bounds warning will now show the conditional
> statements (like "if (i >= 4)") that established the out-of-bounds access
> range, directly connecting the control flow to the warning location.
> This is particularly valuable when GCC's interprocedural analysis can
> generate warnings that are difficult to understand without seeing the
> inferred control flow.
> 
> While my testing has shown that "=1" reports enough for finding
> the origin of most bounds issues, I have used "=2" here just to be
> conservative. Build time measurements with this option off, =1, and =2
> are all with noise of each other, so there seems to be no harm in "turning
> it up". If we need to, we can make this value configurable in the future.
> 
> Link: https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6faa3cfe60ff9769d1bebfffdd2c7325217d7389 [1]
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nicolas.schier@linux.dev>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: <linux-kbuild@vger.kernel.org>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index d14824792227..d97452441cd0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -940,6 +940,9 @@ KBUILD_CFLAGS += $(call cc-option,-fzero-init-padding-bits=all)
>  # for the randomize_kstack_offset feature. Disable it for all compilers.
>  KBUILD_CFLAGS	+= $(call cc-option, -fno-stack-clash-protection)
>  
> +# Get details on warnings generated due to GCC value tracking.
> +KBUILD_CFLAGS	+= $(call cc-option, -fdiagnostics-show-context=2)
> +
>  # Clear used registers at func exit (to reduce data lifetime and ROP gadgets).
>  ifdef CONFIG_ZERO_CALL_USED_REGS
>  KBUILD_CFLAGS	+= -fzero-call-used-regs=used-gpr
> -- 
> 2.34.1
> 

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

