Return-Path: <linux-kbuild+bounces-9938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 4658BC999F0
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Dec 2025 00:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEFA44E1CE4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 23:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13AF28D850;
	Mon,  1 Dec 2025 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkboA9ji"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F57B2853F8;
	Mon,  1 Dec 2025 23:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764632590; cv=none; b=NpmFg8D4cnR3UpO7JseFLbcYoGtMIGc+s1uMHcokiBNk4aQHdaKMKUiRr2gh1i0Wgc1Q57cJSM4qZf9SZCl9fAdGuwvn38NRgRBLB85oKSopVc/vHdM2QqO1tS0T5RsVnlKrdWUiDhfH7/aLiwrrZchGCzj2U/Eqqbslu4Z0SBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764632590; c=relaxed/simple;
	bh=Sbks+0LeMZW1z1LxdnVBnRWwfQhx6DpoBLWkrbIIiXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vza1nZC55AES55nD0ohcQIj0Iyfyk3loLH4TcJISXZ5tWZc3biciX5pzScJ8ElvVrfYpkn2qq2coLiBKgxY6Asw79HniubwSIilYrc7D5Ue/hUERxhRe3iyDQmKzb6Stj1jdAUvcXfd3VieNppY5YCwQjzpegTYutkzuKSZaaak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkboA9ji; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3CCC4CEF1;
	Mon,  1 Dec 2025 23:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764632590;
	bh=Sbks+0LeMZW1z1LxdnVBnRWwfQhx6DpoBLWkrbIIiXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkboA9jidFYp/b2aHvzGp/gQS5oUfnk6Vxs3iKgPGtOJ/qxCOoUr2QqmiWfBbGWAS
	 sXu5d1G961d6UQzm1i6FInzOwowf6iHZKBaB3PLlWcmbMtKZuz3l6tSXxgqgxct3jh
	 Q5uolMNpBLCy9u3Xo+gbhDA1+/5Icbofr44CkuPHm0+I86nkC/vAYplixNR5/pQUiO
	 2ADgsBEfQXghpRfiLPwmYZoOkyNnYOHm9Ihzi51ZZG9tI4EtgHtnDgMnLIgvsjh0Tq
	 KPj/HUFW46Ewm6jymsemRn2RIaBfTmbcicLkC8GbM8QsmdQE14QLmOo8HsTZF05UKG
	 uMQ5HofKmt3Mg==
Date: Mon, 1 Dec 2025 16:43:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Kees Cook <kees@kernel.org>, WangYuli <wangyuli@aosc.io>,
	WangYuli <wangyl5933@chinaunicom.cn>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas.schier@linux.dev>
Subject: Re: [PATCH 2/2] fortify: Cleanup temp file also on non-successful
 exit
Message-ID: <20251201234305.GC2018462@ax162>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
 <20251128-fortify-improve-handling-of-tempfile-v1-2-a79d0d3abcac@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-2-a79d0d3abcac@kernel.org>

On Fri, Nov 28, 2025 at 08:27:58PM +0100, Nicolas Schier wrote:
> From: Nicolas Schier <nicolas.schier@linux.dev>
> 
> Ensure cleanup of test_fortify.sh's temporary file also on script
> interruption, or some common signals.
> 
> Reported-by: WangYuli <wangyuli@aosc.io>
> Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
> Signed-off-by: Nicolas Schier <n.schier@avm.de>

I guess with patch 1, this does not become as big of a deal. Kees, is
there any reason to leave these temporary files around if there was an
interruption or other signal? I do not see any obvious ones so:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  lib/test_fortify/test_fortify.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
> index 368d07d9acbf..ad6dd44fa31c 100644
> --- a/lib/test_fortify/test_fortify.sh
> +++ b/lib/test_fortify/test_fortify.sh
> @@ -29,7 +29,7 @@ shift
>  __cleanup() {
>  	rm -f "$TMP"
>  }
> -trap __cleanup EXIT
> +trap __cleanup EXIT HUP INT QUIT TERM
>  
>  # Function names in warnings are wrapped in backticks under UTF-8 locales.
>  # Run the commands with LANG=C so that grep output will not change.
> 
> -- 
> 2.51.0
> 

