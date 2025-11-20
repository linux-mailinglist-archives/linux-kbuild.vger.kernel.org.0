Return-Path: <linux-kbuild+bounces-9691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2E5C72679
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 07:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 389484E7EFE
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Nov 2025 06:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9700D2FF17D;
	Thu, 20 Nov 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwEgFf/S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6962B21A92F;
	Thu, 20 Nov 2025 06:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763621369; cv=none; b=i3fm3yf1xQW0dcfLX2WfJXosiApe5P7pkHl8Iqt8mA5HMBLVicR0AwLMlhfrjBT/IvkjmYw/RkvY16eP4HyUO2cF0vtd2xOAPFYIcsBnv0ZVtHA8u2eyBOO3841pe+vXBg3B8wnQIrJN+4XOgePbJv2JNytYmDynJ+ubntyoshg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763621369; c=relaxed/simple;
	bh=IBQKqyKmPu5Yhvj+bCIh3TYmG6TotfDN8gapcj6tfrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQlX1UyZ8P13YTaUkDwQKc/iKS36fV29ehLnwxYs56FSE+BSQRt1AxSpVNl5Wb074HJO6ZAjcXA75xALeH+iXAQlWvuv7LbNu0MV3uWP8yhuT8fmgnUtYAWK1t+zHK5jYCam9QZJvqO8NBwSGU7VU2leRKLdkqo0BpJyQdNwqrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwEgFf/S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B84D7C2BC86;
	Thu, 20 Nov 2025 06:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763621368;
	bh=IBQKqyKmPu5Yhvj+bCIh3TYmG6TotfDN8gapcj6tfrI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwEgFf/Sc97CerTV18L0gBtOgvNN+Y4bON5UgDyx6SfIoWZzGqgft/QCJayp0+KNx
	 iLl5djqmL2P7O5ywCRf5ao8qGndSw5JCCNJSvx93M7ZQYhu2bJUdVXE9CyW65QTTL6
	 9jZD9eTcBDJZmPi6NEuPdkWMgBrf9BrKyg0MkzavLz2Q2z0CV6iWf4tP4Zgwf8SJ7K
	 4yCl5Cq2fZqA3i3Khzbizv4r+JxFb3mkc/zvqMQuY5QmQuGHbSFBbkI3gv0LESz7pg
	 yjPCnjlvL/Ng3XCezaVRLhONh9qPclCUh3bNqNYkFydCDO0FTT+aJCsunhlzoaowG9
	 98ORhOPlkS3hA==
Date: Wed, 19 Nov 2025 23:49:23 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable GCC diagnostic context for value-tracking
 warnings
Message-ID: <20251120064923.GA3320872@ax162>
References: <20251119224426.work.380-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119224426.work.380-kees@kernel.org>

On Wed, Nov 19, 2025 at 02:44:31PM -0800, Kees Cook wrote:
> Enable GCC 16's coming "-fdiagnostics-show-context=2" option[1] to
> provide enhanced diagnostic information for value-tracking warnings, which
> displays the control flow chain leading to the diagnostic. This covers our
> existing use of -Wrestrict and -Wstringop-overread, and gets us closer to
> enabling -Warray-bounds, -Wstringop-overflow, and -Wstringop-truncation.
> 
> The context depth of 2 provides the immediate decision path that led to
> the problematic code location, showing conditional checks and branch
> decisions that caused the warning. This will help us understand why
> GCC's value-tracking analysis triggered the warning and makes it easier
> to determine whether warnings are legitimate issues or false positives.

Would we ever want a depth more than 2? In other words, should this be
customizable in case there is a warning that needs more context?

> For example, an array bounds warning will now show the conditional
> statements (like "if (i >= 4)") that established the out-of-bounds access
> range, directly connecting the control flow to the warning location.
> This is particularly valuable when GCC's interprocedural analysis can
> generate warnings that are difficult to understand without seeing the
> inferred control flow.

Not that it is that different from what you describe here but having an
actual example of the insight that this gives using a problematic case
from the past (such as one that resulted in these various warnings
getting disabled) might be useful for future travellers.

> Link: https://github.com/gcc-mirror/gcc/commit/6faa3cfe60ff9769d1bebfffdd2c7325217d7389 [1]

I have a small preference for using links that the project controls,
i.e.

  https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=6faa3cfe60ff9769d1bebfffdd2c7325217d7389

but I am guessing that mirror is not going anywhere and we have the hash
regardless so consider it a nit.

> Signed-off-by: Kees Cook <kees@kernel.org>
> ---

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Should we take this via Kbuild or do you want to take it via the
hardening tree?

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

