Return-Path: <linux-kbuild+bounces-9918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0547C958D2
	for <lists+linux-kbuild@lfdr.de>; Mon, 01 Dec 2025 02:56:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B08543A164A
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Dec 2025 01:56:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B23155322;
	Mon,  1 Dec 2025 01:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="pAxoySF0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61832628D;
	Mon,  1 Dec 2025 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.248.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764554199; cv=none; b=n5Tg6Zknot9tCohUqMwT+Q5XlJma7ovmAVxNNo7/Nytxe3YMmuBUL/rIhw5i/bBBCqGzdFCZv7j+A6WWBHGtun5EYh+e9Nwwr+PU4/zz2n5pXnM0+kw2fQx7jAbr3CCJxdGPR2rCV6g08WgPDHnAkmefZTK6BJj+R6PDa/WIuog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764554199; c=relaxed/simple;
	bh=3ZVXdrCOy5PxUchG0euPZX5RfSAo5IQi7+Cbw5/aAhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTlQkHJfxZ8JEK+JC+O2HlRueOVw39PYX9KRxzEBE1g040QXD+Oew6wEGdqdDzGXIo1+YkEzNT03cVOfHdzpM2UaFiPHoxIlWHL1Rf+H6mtYMwU/51hRXu7ifxUpI2LMzjNyKaTRHOHjk719YJU/oUFPvZDqSMZDhgMHdg7+3vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=pAxoySF0; arc=none smtp.client-ip=159.100.248.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay3.mymailcheap.com (relay3.mymailcheap.com [217.182.119.157])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 0FF93260DB;
	Mon,  1 Dec 2025 01:56:36 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay3.mymailcheap.com (Postfix) with ESMTPS id 966E23E93B;
	Mon,  1 Dec 2025 01:56:27 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id AE50C40130;
	Mon,  1 Dec 2025 01:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1764554185; bh=3ZVXdrCOy5PxUchG0euPZX5RfSAo5IQi7+Cbw5/aAhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pAxoySF0Qr4+asXGwsOjhGe4IljYgCctU0rb5ZWZrGOWLlWmGqrH50qSjW2+AGvID
	 a5MQERUHTH7lke943oNsaoz3p35f7qZy3xb2YR7sxCu8sQrTmq4OE5fRjbMd8ltEfu
	 4bu3rNVS1itHn0EUgfJ/3xPx/Gx9yXrtzJh9y6p4=
Received: from [192.168.0.64] (unknown [39.144.78.120])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 2888841283;
	Mon,  1 Dec 2025 01:56:22 +0000 (UTC)
Message-ID: <46de5cc0-ed26-4fc9-8ae6-2e418a87c862@aosc.io>
Date: Mon, 1 Dec 2025 09:56:20 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fortify: Cleanup temp file also on non-successful
 exit
To: Nicolas Schier <nsc@kernel.org>, Kees Cook <kees@kernel.org>
Cc: WangYuli <wangyl5933@chinaunicom.cn>,
 Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Nicolas Schier <nicolas.schier@linux.dev>
References: <20251128-fortify-improve-handling-of-tempfile-v1-0-a79d0d3abcac@kernel.org>
 <20251128-fortify-improve-handling-of-tempfile-v1-2-a79d0d3abcac@kernel.org>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20251128-fortify-improve-handling-of-tempfile-v1-2-a79d0d3abcac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: AE50C40130
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
	SPFBL_URIBL_EMAIL_FAIL(0.00)[nicolas.schier.linux.dev:server fail,n.schier.avm.de:server fail,wangyuli.aosc.io:server fail];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 2025/11/29 03:27, Nicolas Schier wrote:

> From: Nicolas Schier <nicolas.schier@linux.dev>
>
> Ensure cleanup of test_fortify.sh's temporary file also on script
> interruption, or some common signals.
>
> Reported-by: WangYuli <wangyuli@aosc.io>
> Closes: https://lore.kernel.org/linux-kbuild/20251112114725.287349-1-wangyuli@aosc.io/
> Signed-off-by: Nicolas Schier <n.schier@avm.de>
> ---
>   lib/test_fortify/test_fortify.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/test_fortify/test_fortify.sh b/lib/test_fortify/test_fortify.sh
> index 368d07d9acbf..ad6dd44fa31c 100644
> --- a/lib/test_fortify/test_fortify.sh
> +++ b/lib/test_fortify/test_fortify.sh
> @@ -29,7 +29,7 @@ shift
>   __cleanup() {
>   	rm -f "$TMP"
>   }
> -trap __cleanup EXIT
> +trap __cleanup EXIT HUP INT QUIT TERM
>   
>   # Function names in warnings are wrapped in backticks under UTF-8 locales.
>   # Run the commands with LANG=C so that grep output will not change.
>

Reviewed-by: WangYuli <wangyuli@aosc.io>

Thans,

--

WangYuli



