Return-Path: <linux-kbuild+bounces-9429-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82732C391A2
	for <lists+linux-kbuild@lfdr.de>; Thu, 06 Nov 2025 05:35:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 71D714E4291
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Nov 2025 04:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70932C3769;
	Thu,  6 Nov 2025 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTXEokDX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED5225F984;
	Thu,  6 Nov 2025 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762403743; cv=none; b=lqo0DOnYsQ5lqgQ5GtGFCdcasgQUEDymwalHkLnP7jLKApngg+q8oAAtV4e7pJHel1NeXx0GxJzPpiSpXML0Ker8oTTRPTJOWE1NaFiBbpBxnSDKdCp2HWyIgqtWXHAX7hF65Vwon+aFd9wHTgcp0F/rY41D4DcbwGiwr9Hn8j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762403743; c=relaxed/simple;
	bh=q4ULmkqKjrQpxmULBlg3LpLorxsOL3zKYFALtVne7/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BYEiOn13uB3/0BXNTO8UekGj/ODfECdw9hL6RDxsq9+jduAc4sdcO0QKt7O0mTbbfq+O2cd36OzGNv8m552EiLsxXpUq0KKhWFTUQT4be59dwod6geHvWhtzkqpb+35vMmyqeK89s5tmNaII7drhllfStqyU1Dt3PwCmWHdGtUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTXEokDX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8AEC4CEF7;
	Thu,  6 Nov 2025 04:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762403743;
	bh=q4ULmkqKjrQpxmULBlg3LpLorxsOL3zKYFALtVne7/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fTXEokDX1o/Tz47ESE3ulbeXL0fBBzLWMuHO8z6dGrZBWoPfMIhvA+/ozGtPpeGox
	 oBZMw/Hppp1dllz6tpIL/vZ/2Zlco8bWbsz5Fa20sFi+4/+C7dDohJ5uJyuKwuHUr+
	 CBONX3GYbSCvR4cdWFksfZZhTPFc9QT6KtdtZuNsil9sENsbZZqC6fg7kDAEhx3wyg
	 F9wk+I9WlT/+n9hxIxJ82bhIT1w3VrIKsQPSfTMzOcjrq6DEoMkpqlKyGYMgMSgWHR
	 QaUto9vC66s0EigEDE/u3YBkWgXNHnO+U1QvjfUqu7r+g2nggyOVmYVKZe5O5aKtRt
	 mdzyj0jKE8O4w==
Date: Wed, 5 Nov 2025 21:35:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Remove two outdated config
 leak ignore entries
Message-ID: <20251106043540.GA909744@ax162>
References: <20251105-update-headers-install-config-leak-ignore-list-v1-1-40be3eed68cb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105-update-headers-install-config-leak-ignore-list-v1-1-40be3eed68cb@kernel.org>

On Wed, Nov 05, 2025 at 09:26:02PM +0100, Nicolas Schier wrote:
> Remove config leak ignore entries for arch/arc/include/uapi/asm/page.h
> as they have been removed in commit d3e5bab923d3 ("arch: simplify
> architecture specific page size configuration").
> 
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/headers_install.sh | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 4c20c62c4faf..0e4e939efc94 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -70,8 +70,6 @@ configs=$(sed -e '
>  #
>  # The format is <file-name>:<CONFIG-option> in each line.
>  config_leak_ignores="
> -arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_16K
> -arch/arc/include/uapi/asm/page.h:CONFIG_ARC_PAGE_SIZE_4K
>  arch/arc/include/uapi/asm/swab.h:CONFIG_ARC_HAS_SWAPE
>  arch/arm/include/uapi/asm/ptrace.h:CONFIG_CPU_ENDIAN_BE8
>  arch/nios2/include/uapi/asm/swab.h:CONFIG_NIOS2_CI_SWAB_NO
> 
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251105-update-headers-install-config-leak-ignore-list-0ea71117fbe0
> 
> Best regards,
> -- 
> Nicolas
> 

