Return-Path: <linux-kbuild+bounces-10485-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C91D10CE7
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 08:09:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EC0F730102A8
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jan 2026 07:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669EE326D63;
	Mon, 12 Jan 2026 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="Zk8GcjYA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay-us1.mymailcheap.com (relay-us1.mymailcheap.com [51.81.35.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118E1322A21;
	Mon, 12 Jan 2026 07:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.81.35.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768201646; cv=none; b=BwwQWfFiiZR9jcMpOvgL+HlqBuH+h5IgyxybZ7SRd3r7WMxG+hK/l+ul0qq5cKmspsw15gT0ap8WeAXAfzGlAxk08+qGZWkRbt+1Un5W6o9Roo/1s6sSnkNzZwvKEn1+iSePHo84uWria1QqHCdP4IuFHau2sL7lvc1gT8gZ7Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768201646; c=relaxed/simple;
	bh=oRyjKdNg/v9ive8iDfdtnkjz8govXIBNQ6b2i4vlAwE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mfa0Tr2vCXGT7pYYK7USCsogI5kDsVYv93n2jdPiG4V6cDAc4VK+29DXwgQap/YAgIdU/RaecXp+h/qEnm3fpjtVeRHDmoz0BvaD7bPjW/5WUsHVMSZoovz7GN/U57IkXBao8tvXiCHGMmN8BhEXNGi5ZDFFVZePOwsBmIb4/fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=Zk8GcjYA; arc=none smtp.client-ip=51.81.35.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.248.207])
	by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 69A30200EE;
	Mon, 12 Jan 2026 06:59:45 +0000 (UTC)
Received: from relay2.mymailcheap.com (relay2.mymailcheap.com [217.182.113.132])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id BE38826344;
	Mon, 12 Jan 2026 06:59:36 +0000 (UTC)
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay2.mymailcheap.com (Postfix) with ESMTPS id 637A13E8A5;
	Mon, 12 Jan 2026 06:59:29 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 0D246400D5;
	Mon, 12 Jan 2026 06:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1768201168; bh=oRyjKdNg/v9ive8iDfdtnkjz8govXIBNQ6b2i4vlAwE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zk8GcjYAu2zvrLLl59YbRMOkXnz9r2+hkE6ZSDcL3YcHQ2HwKPyLLcUCznS+rSg+r
	 89e8MRKzHXt8Q/CoGds0uFRmfuAifkn+C90xAtUDInzlF73X/58g+icnKGeidozmtC
	 T9Nolu+ogVi4MF5xT1ASPXOt9lrzDsNHbVSj5Eyw=
Received: from [198.18.0.1] (unknown [142.91.109.23])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 53D0940ADE;
	Mon, 12 Jan 2026 06:58:36 +0000 (UTC)
Message-ID: <d43c85d0-4d84-44df-a436-09fca7a11b07@aosc.io>
Date: Mon, 12 Jan 2026 14:58:08 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Reject unexpected values for LLVM=
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260112-kbuild-llvm-arg-v1-1-8e9bbdae996f@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D246400D5
X-Rspamd-Server: nf1.mymailcheap.com
X-Spamd-Result: default: False [1.40 / 10.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TAGGED_RCPT(0.00)[lkml];
	RCVD_TLS_ALL(0.00)[];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_TO(0.00)[weissschuh.net,kernel.org,gmail.com,google.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Thomas Weißschuh,

On 2026/1/12 14:43, Thomas Weißschuh wrote:

> The LLVM argument is documented to accept one of three forms:
> * a literal '1' to use the default 'clang',
> * a toolchain prefix path, ending in a trailing '/',
> * a version suffix.
>
> All other values are silently treated as '1'. If for example
> the user accidentally forgets the trailing '/' of a toolchain prefix,
> kbuild will unexpectedly and silently fall back to the system toolchain.
>
> Instead report an error if the user specified an invalid value for LLVM.
>
"Falling back to the system toolchain" may be an acceptable behavior; I 
think reporting a warning here rather than an error would be more 
appropriate.

Thanks,

--

WangYuli


