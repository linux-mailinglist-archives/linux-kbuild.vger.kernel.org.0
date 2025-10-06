Return-Path: <linux-kbuild+bounces-9013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB5EBBF0BA
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 21:00:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 508AD189BD44
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 19:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4802A156236;
	Mon,  6 Oct 2025 19:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBBw16W/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E430E55A;
	Mon,  6 Oct 2025 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759777253; cv=none; b=YxvBa9IUAnLOB99NzjrCCMgvUuUTRNLWBMmTKWzZ5NKJS9GtZOl3+7kmDm3QzPgDG8Itxydkf1AfnQosSXnFd1p1j85LTJ+rcHgc8/vW7+gg3o8Dg8is27hBTUkm1DHEF/IqlxDkvtjSI6MACed8PViCsUgtn5e+BxD/YhaVoTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759777253; c=relaxed/simple;
	bh=3BUMvX+IdvW7t9dyhLFwKXgU4di0AS0UBwkRIIr3qNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LCZAcKhO5gpMVaAbrL7Iw4aaOFwV0MH1YTDERa37YoGEmALrPMVnWBTeiworkOb7QmMXn98LpPCVFDueWOuHTc3YU+wMXaHlvCOeGyLejbQTMGEfSfhOvh/sgQmsK8xZYyGGmxoZyhlfFeiVgfGGFtXA1mtDkxdCKknguw48M9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBBw16W/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C03DC4CEF5;
	Mon,  6 Oct 2025 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759777252;
	bh=3BUMvX+IdvW7t9dyhLFwKXgU4di0AS0UBwkRIIr3qNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBBw16W/tITBYVWR049Fmwfe2xuofhH025Zx7wBw4blUnO81Bp2cEcTEUAH7FvbvP
	 zE9ZPgK2ixK/mUN/iaHZZnt1Dm1y2YbDkPtsa43iEH8CBi38vjQdXM5/GtSfPELQhU
	 oZIL3xo7+kG3t72iq792lkCBmGhDzMZX2LeQOoTcHJfrEE886To/vWYnqR4x/0tc4D
	 DCl+sMP3avA8ZOHXsPtdQYvWqNStlHgez3YN2QF8yGaNRTVl+7Gt9VfXxDDl30wwux
	 T9YYdhNcMfM/9a0pM2OMfeADBgHgpIPyl5B8c5wb0ysmrbSbqd655qkf/g2ItX+mfp
	 7NVMiLcJBjIeQ==
Date: Mon, 6 Oct 2025 12:00:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v2 4/5] kbuild: uapi: upgrade check_sizetypes() warning
 to error
Message-ID: <20251006190048.GA2395186@ax162>
References: <20250813-kbuild-hdrtest-fixes-v2-0-8a7921ca3a03@linutronix.de>
 <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813-kbuild-hdrtest-fixes-v2-4-8a7921ca3a03@linutronix.de>

On Wed, Aug 13, 2025 at 08:16:59AM +0200, Thomas Weiﬂschuh wrote:
> No problematic type usages exist anymore.
> 
> Make sure it stays this way.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>
> ---
>  usr/include/headers_check.pl | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> index 36307a137cc1e109e3e1c253f66f3e5935499fc8..36349b21cef5d55241b68ca24dabe6a321b7ce27 100755
> --- a/usr/include/headers_check.pl
> +++ b/usr/include/headers_check.pl
> @@ -159,7 +159,6 @@ sub check_sizetypes
>  		              "found __[us]{8,16,32,64} type " .
>  		              "without #include <linux/types.h>\n";
>  		$linux_types = 2;
> -		# Warn until headers are all fixed
> -		#$ret = 1;
> +		$ret = 1;
>  	}
>  }
> 
> -- 
> 2.50.1
> 

Geert's regression report and subsequent fix made me look a little
closer at this check. Is it even useful to do this anymore now that we
compile test the headers? If these types are found without the
appropriate include, won't there just be an error? Or is this to avoid
the case where a system header may transitively include types.h so the
compile would succeed but the header is not as contained as it could be?

Cheers,
Nathan

