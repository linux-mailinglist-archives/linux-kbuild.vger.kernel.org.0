Return-Path: <linux-kbuild+bounces-9917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A7C958CC
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 02:56:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D8F21342383
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 01:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37A511531F9;
	Mon,  1 Dec 2025 01:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="jLNvm93O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176EA2628D;
	Mon,  1 Dec 2025 01:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764554165; cv=none; b=SZskNOYUc6K0dJ5Pu+H20zyygQ/KxlQhw1CyeMmT0b4PdwU2POMeq43CNLVPVjMVjju6BEOc5rWCsdzej8/7cKMkSMfA2NGpvJxcw3OOXiZJkNu8DBe4cj/W6SXfol/bN6qR6JdEDnCH1/Wj3eAjg/ILespm02WHEpRIy3oAE48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764554165; c=relaxed/simple;
	bh=XCiwgZUQWQ8Bxet8CoxSVzbPR6fzmrLVRYpVLLvwDW0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jhp80MR242ucgsamNRTfzYL42DvenA0qJAcZ2lqlAZoGFxhRY5NzhnHcyGqrJXieVlAZJK9xNdsDLcHr6XR0jlx0hC9WNsDpL3cAuFoJTxCrsM3nw/bKAW5FIi86NIbY2/ZC21b1MIS+fQIPMFgWoBSOX4vwqkeyDmIiEr4++uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=jLNvm93O; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 6F18D260DB;
	Mon,  1 Dec 2025 01:55:53 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id CE4EA20057;
	Mon,  1 Dec 2025 01:55:44 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id 9CC9640162;
	Mon,  1 Dec 2025 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764554142; bh=XCiwgZUQWQ8Bxet8CoxSVzbPR6fzmrLVRYpVLLvwDW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jLNvm93OhPuDusAqyKd4AqC02lXXuES2ayRxPEQY6U5hMl0TLcr5BdnjM8+ye1gPr
	 XEJIOu6m1rA1MuA2y6csMH0GfMWRXhmp1oni3oFZAHVbWiSVi3T/Bif+itBwMn/+k4
	 fpHwFrGKYQYM9ObCEhEntvuAadraUQQWh6ZMCKf8=
Received: from [192.168.0.64] (unknown [39.144.78.120])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 537F041283;
	Mon,  1 Dec 2025 01:55:39 +0000 (UTC)
Message-ID: <b804c3a8-a93a-4f91-8c89-e01357643eec@aosc.io>
Date: Mon, 1 Dec 2025 09:55:35 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fortify: Rename temporary file to match ignore
 pattern
To: Nicolas Schier <nsc@kernel.org>, Kees Cook <kees@kernel.org>
Cc: WangYuli <wangyl5933@chinaunicom.cn>,
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Nicolas Schier <nicolas.schier@linux.dev>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
 <20251128-fortify-improve-handling-of-tempfile-v1-1-a79d0d3abcac@kernel.org>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-1-a79d0d3abcac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9CC9640162
X-Rspamd-Server: nf2.mymailcheap.com
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[wangyuli.aosc.io:server fail,n.schier.avm.de:server fail,nicolas.schier.linux.dev:server fail];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2025/11/29 03:27, Nicolas Schier wrote:

> From: Nicolas Schier <nicolas.schier@linux.dev>
>
> test_fortify.sh uses a temporary file that might appear as untracked
> file in some rare sitations.  Rename it to match one of top-level's
> gitignore patterns.
>
> Reported-by: WangYuli <wangyuli@aosc.io>
> Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
> Signed-off-by: Nicolas Schier <n.schier@avm.de>
> ---
>   lib/test_fortify/test_fortify.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
> index c2688ab8281d..368d07d9acbf 100644
> --- a/lib/test_fortify/test_fortify.sh
> +++ b/lib/test_fortify/test_fortify.sh
> @@ -17,7 +17,7 @@ WANT="__${FILE%%-*}"
>   # Argument 2: Where to write the build log.
>   OUT="$1"
>   shift
> -TMP="${OUT}.tmp"
> +TMP="${OUT%/*}/.${OUT##*/}.tmp"
>   
>   # Argument 3: Path to "nm" tool.
>   NM="$1"
>

Reviewed-by: WangYuli <wangyuli@aosc.io>

Thans,

--

WangYuli


