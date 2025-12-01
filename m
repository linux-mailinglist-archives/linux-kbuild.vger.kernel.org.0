Return-Path: <linux-kbuild+bounces-9937-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C7C999BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 00:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30E224E1A2D
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 23:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2177A288514;
	Mon,  1 Dec 2025 23:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pky6klNm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F89192B75;
	Mon,  1 Dec 2025 23:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764632470; cv=none; b=fth/8kZ+CiCLew2+B6g1f6mYoXzg+AQvCj876XduqGXU6Js/K6teg6IvLoP05i7PZAPVRqpfy3IM1XsK8jx3VPiYdfQW6uQLuaHXBw5rUKaIVCwglLvoEWskm9cMHJ9IPKiBCCFZ4x2053nfM/d3WOFSswJnC3iq0l8Io1esAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764632470; c=relaxed/simple;
	bh=U6LpWpeVXSOYbm0WD8JShtLo0PbflnlmWMyWDezpX+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7wZdgYmRiu0IKMGsVgnIO5YjX2ZRH+OqlhPdcPZQVLdmvSvSt5ef2W3yBKYQOmSA+YXLoaCefjk6WINpH1PcDJPQxFor0m07V4IF2QnCxPX5ufNKHqSnMJdy2m9As6rElTyUD29F0Mf8VvalkoRZUJepm0gJH6CrX9nf9xILBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pky6klNm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E8AC116C6;
	Mon,  1 Dec 2025 23:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764632469;
	bh=U6LpWpeVXSOYbm0WD8JShtLo0PbflnlmWMyWDezpX+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pky6klNmWaQCy+oWljqqfOgvBpZ+UWU151wLWlzznDbnJJRsOBoSjI39ysRg2e4Ey
	 2YgjirUlXJggmHhV5FH4nYE6i6OiqIwC9wGE11oh8iXPsSwbo4zI2HRdOCWflnsHh0
	 f3JYbEkNvKsGJQsSO5farmk2VSwdyiSyCw2ZRchK5m5svg6lsL94JpPwEuMdNsxpPt
	 GaaRT8OmOI/SIoc3VJOhkBmYIwTVQh2LXnVA6yKeKm3FGRamy/wt3E4lvP+xpew//2
	 HjLfff2ehtynlcfzzAAd8M+GuUwFeMAENpgOzKkXcT/frZqQvvrP0Ee51Xpfm5l08V
	 HsgX9z9MIjUIA==
Date: Mon, 1 Dec 2025 16:41:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Kees Cook <kees@kernel.org>, WangYuli <wangyuli@aosc.io>,
	WangYuli <wangyl5933@chinaunicom.cn>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH 1/2] fortify: Rename temporary file to match ignore
 pattern
Message-ID: <20251201234105.GB2018462@ax162>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
 <20251128-fortify-improve-handling-of-tempfile-v1-1-a79d0d3abcac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-1-a79d0d3abcac@kernel.org>

On Fri, Nov 28, 2025 at 08:27:57PM +0100, Nicolas Schier wrote:
> From: Nicolas Schier <nicolas.schier@linux.dev>
> 
> test_fortify.sh uses a temporary file that might appear as untracked
> file in some rare sitations.  Rename it to match one of top-level's
> gitignore patterns.
> 
> Reported-by: WangYuli <wangyuli@aosc.io>
> Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
> Signed-off-by: Nicolas Schier <n.schier@avm.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

Not a big problem but some tools might complain about the email mismatch
between the From: line (which will end up being the author) and the
Signed-off-by line.

> ---
>  lib/test_fortify/test_fortify.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
> index c2688ab8281d..368d07d9acbf 100644
> --- a/lib/test_fortify/test_fortify.sh
> +++ b/lib/test_fortify/test_fortify.sh
> @@ -17,7 +17,7 @@ WANT="__${FILE%%-*}"
>  # Argument 2: Where to write the build log.
>  OUT="$1"
>  shift
> -TMP="${OUT}.tmp"
> +TMP="${OUT%/*}/.${OUT##*/}.tmp"
>  
>  # Argument 3: Path to "nm" tool.
>  NM="$1"
> 
> -- 
> 2.51.0
> 

