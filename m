Return-Path: <linux-kbuild+bounces-12149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPIQAsr+wGmiPQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12149-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:50:18 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E00AB2EE76F
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 09:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D05F301B148
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 08:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B9B3845BB;
	Mon, 23 Mar 2026 08:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="qR20M1T8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C20D37F8B1;
	Mon, 23 Mar 2026 08:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255777; cv=none; b=qU+bgh/fidV6HZb8MI+mrioiPUr3i/w6WbS5BnVqzkZmf92WBP08+1Rx8T8SZTRyQ6sGvQiIysf6HZn2/g7H/Y8nvZN2vOjHP2LrTCK6bbA1UPFAQ+0H3MgqcUyv3Z20Spa/oCj2S2KitCnsxln35VASyh8rK6MlTJrFj4rdwFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255777; c=relaxed/simple;
	bh=apQDKAVtzeWI9NRHQrgtkW1nDuBlvlKb70pvhcicwCI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=YtUVkRdGQIo/fcdC0UlSaXS2ut2RuTjOLrxAcfJA4t2gZ0E7898T8gzS+PLO9MKdKKJVhiNS4gWxI2iudJw/U0wyp7TQgEnikRXnAeebwG/z2+I4225a4qXbp2eWI55pxtuP1cH1rjZFCEsQ9MU5WWXDn9jn8NpJGKVBs70AlyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=qR20M1T8; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260323084927euoutp02741697b9873d78530075a5e111d0c62e~fbDhQX7Vx2817128171euoutp02Q;
	Mon, 23 Mar 2026 08:49:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260323084927euoutp02741697b9873d78530075a5e111d0c62e~fbDhQX7Vx2817128171euoutp02Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1774255767;
	bh=izD245/HWTfY4YvMavmH0UjvQPvQnie+y+bSLStgLq0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=qR20M1T8vm/bninpWfYJUqD2cujoDpUOWwbtW5EzAYPKXXW/reNN8Na0Z0P22N5Fq
	 KD9VJ2HiMGpMBAqMkrXfK9sxLV95K7db3i4rPSoQsvdHzljE+ooz9t4d3X72LfLXNP
	 8uUHazdKV/PWg9ZWyVALYMO1f3Gp3Q87CRMB/Hm0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260323084927eucas1p12614d2febd7dd400e32c691c74e396e2~fbDhDI1aS1911919119eucas1p1N;
	Mon, 23 Mar 2026 08:49:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260323084923eusmtip200157d20bd875804c9aaff92db3a8414~fbDd8kVqg2543925439eusmtip2B;
	Mon, 23 Mar 2026 08:49:23 +0000 (GMT)
Message-ID: <1c4e429b-f30c-42a9-8de1-71cb2cbbc114@samsung.com>
Date: Mon, 23 Mar 2026 09:49:22 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 0/3] Inline helpers into Rust without full LTO
To: Miguel Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue
	<abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
	Andreas Hindborg <a.hindborg@kernel.org>, Christoph Hellwig <hch@lst.de>
Cc: iommu@lists.linux.dev, driver-core@lists.linux.dev, acourbot@nvidia.com,
	akpm@linux-foundation.org, aliceryhl@google.com,
	anton.ivanov@cambridgegreys.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, david@davidgow.net, gary@garyguo.net,
	johannes@sipsolutions.net, justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-um@lists.infradead.org, linux@armlinux.org.uk, llvm@lists.linux.dev,
	lossin@kernel.org, mark.rutland@arm.com, mmaurer@google.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	nicolas.schier@linux.dev, nsc@kernel.org, peterz@infradead.org,
	richard@nod.at, rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	urezki@gmail.com, will@kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260322194616.89847-1-ojeda@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260323084927eucas1p12614d2febd7dd400e32c691c74e396e2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260322194701eucas1p1f72625f53e50806fa4f430550f291e76
X-EPHeader: CA
X-CMS-RootMailID: 20260322194701eucas1p1f72625f53e50806fa4f430550f291e76
References: <20260322192159.88138-1-ojeda@kernel.org>
	<CGME20260322194701eucas1p1f72625f53e50806fa4f430550f291e76@eucas1p1.samsung.com>
	<20260322194616.89847-1-ojeda@kernel.org>
X-Spamd-Result: default: False [-0.65 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[samsung.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[samsung.com:s=mail20170921];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12149-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,nvidia.com,linux-foundation.org,google.com,cambridgegreys.com,protonmail.com,gmail.com,davidgow.net,garyguo.net,sipsolutions.net,lists.infradead.org,vger.kernel.org,kvack.org,armlinux.org.uk,kernel.org,arm.com,linux.dev,infradead.org,nod.at,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,collabora.com,lst.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.szyprowski@samsung.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[samsung.com:+];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,samsung.com:dkim,samsung.com:mid]
X-Rspamd-Queue-Id: E00AB2EE76F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22.03.2026 20:46, Miguel Ojeda wrote:
> On Sun, 22 Mar 2026 20:21:59 +0100 Miguel Ojeda <ojeda@kernel.org> wrote:
>> I will reply to a couple other bindings in separate emails to avoid
>> spamming people too much.
> Under UML, I got `-Wstatic-in-inline` for `dma_free_attrs`:
>
>        BINDGEN rust/bindings/bindings_generated.rs - due to target missing
>      In file included from rust/helpers/helpers.c:59:
>      rust/helpers/dma.c:17:2: warning: static function 'dma_free_attrs' is used in an inline function with external linkage [-Wstatic-in-inline]
>         17 |         dma_free_attrs(dev, size, cpu_addr, dma_handle, attrs);
>            |         ^
>      rust/helpers/dma.c:12:1: note: use 'static' to give inline function 'rust_helper_dma_free_attrs' internal linkage
>         12 | __rust_helper void rust_helper_dma_free_attrs(struct device *dev, size_t size,
>            | ^
>            | static
>
> For some reason, `dma_free_attrs` is not marked `inline` in
> `include/linux/dma-mapping.h` to begin with, unlike the rest.
>
> Unless I am missing something and there is a reason for that, it looks
> like it has just been missing since it was added in commit ed6ccf10f24b
> ("dma-mapping: properly stub out the DMA API for !CONFIG_HAS_DMA").
>
> Do you want a patch?

Yes please, this looks like an oversight.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


