Return-Path: <linux-kbuild+bounces-9768-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD2BC7BD93
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 23:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E7933A820B
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 22:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA61F30B508;
	Fri, 21 Nov 2025 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwercHtx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D74413774D;
	Fri, 21 Nov 2025 22:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763763715; cv=none; b=FJ5ffMDIRSWsV7fgmyKqaeywyEoeeK0cHlQM4hblZG8c6jTAN3M1C48aFzORdAeLB1m5oR6s0gAhzeTllIQE8nH3fZKyi2CkcvSwDmLeznvQ7etCpDapICCW2HYgRWefy47P78XG9akyi0XO7TuUPLJtudE1Xe7Od9ePX3sGplg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763763715; c=relaxed/simple;
	bh=nrKEAfJFM8tB3jN82XCz2XCaShxXuMRsaSt2iH3dNXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJdJCt8LualBLcm/Xz5kqiHoOAqYRMPmM0oPhAxls0riwgYXY8DBan2A1b0KZd1fJu3X4vNgDjIn9hIJrAhnDkbpdWysCl9JlZzmTkwnUZHte0ReUupOyvEYIiifem3GQEkD9pewAyRaSTd/71Rkxni8O/MoV9ZlCQkofU/4H/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwercHtx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E74C4CEF1;
	Fri, 21 Nov 2025 22:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763763715;
	bh=nrKEAfJFM8tB3jN82XCz2XCaShxXuMRsaSt2iH3dNXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwercHtxkp8wbdYm+qO4qMffpPJS8WWnMGSqyqjimFHHtIyONXHIzvWZj4db48Thh
	 fomr0Lj4KJn8g5W8bTMqu84XJwd64tQUeB910mIoIYqW6zZAK/AWC+cWNXsWvoZWGF
	 MNp6K6xvlOKRu5jfIo4D/7vhm6nYTs9wUibhwnndgKe78zZ92MfcgiG1hIDlqBFzFD
	 dly/XuGwMfYsZkvgrrx6nd2hia+THec3Cv0sOFms+DTINhr7SOn7B1DMdQXPNAzSwI
	 9Du73ubddeQ3HnXtPdS2OQR9sYfcEfQ/ao8Ahb/yK5TczNImWD7z9o8ViYxvIqZavl
	 Rw04V7I3Y52Zg==
Date: Fri, 21 Nov 2025 15:21:50 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: Enable GCC diagnostic context for
 value-tracking warnings
Message-ID: <20251121222150.GB1674270@ax162>
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

Thanks for the updates!

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

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

