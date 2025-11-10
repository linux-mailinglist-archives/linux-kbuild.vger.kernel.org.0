Return-Path: <linux-kbuild+bounces-9500-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD24C46333
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 26BFA347DAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:19:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62339305E37;
	Mon, 10 Nov 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="cWW81H8B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769DA30594F;
	Mon, 10 Nov 2025 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773581; cv=none; b=G5Mqj5+TsIZ83hE+5xSHgg0/y7N45wypUgX7kvWZSXLmC90BUKoJuC/D7H7sRKNWghAbtnJ9/MwURPl1+S0OEL4C8dDs90vSnZ5FyuaUP+/qazxK0JUo0mft6CY7pYBsmYIRh5ZIjx4dhgQlWilqR7YO24PDXLRIdgUa4szjp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773581; c=relaxed/simple;
	bh=9ZgikPugzcA7lSemy9YYqgvuQHJN0TCgzXGZe1SsZc0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=igCBEXR9BOOAijt6Oo8qwaD3FdN9gLS0bRWtR0JcwiMBMqwdeZ11c3+xYyIStTmdelvgOFvJD/nCMbNF/e8D2tiawkpF0XUY9mTAmL/RcTOCVpssAyTA7O+6+lzaa8Ug4eWCo3UXYazx1ahE1K3iCob2JhhjzqJhEMS6OLL75FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=cWW81H8B; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <bd04f307-7f83-41f5-a1ad-afcd8d2a9237@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762773567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iMOcbVruihWsGJTcS6Pxp0A++3NbHjIZvOX0ONskPMA=;
	b=cWW81H8BPz/rAJ2CruCWlZPOAb8vmAlfaPluFWmcCj/P1Adl8ck6d2XWYtLj7ksYw93VFM
	LV26jAy5vRVWeWDH2gVwClTsLcgCVNETbE+jF0HbEV8f2ntVyOjNm01NYp8eprMnVTdwgi
	r5iIbMJXLQNJNdSSbHEd5q28TBAB2zM=
Date: Mon, 10 Nov 2025 19:18:38 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] dm-pcache: avoid leaking invalid metadata in
 pcache_meta_find_latest()
To: Li Chen <me@linux.beauty>, Kees Cook <kees@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Zheng Gu <cengku@gmail.com>, dm-devel@lists.linux.dev
References: <20251105084733.3598704-1-me@linux.beauty>
 <20251105084733.3598704-4-me@linux.beauty>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dongsheng Yang <dongsheng.yang@linux.dev>
In-Reply-To: <20251105084733.3598704-4-me@linux.beauty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Li,

     It seems you sent the same patch again, shoud it be V2 instead?

Thanx

在 11/5/2025 4:46 PM, Li Chen 写道:
> From: Li Chen <chenl311@chinatelecom.cn>
>
> Before this change pcache_meta_find_latest() was copying each
> slot directly into meta_ret while scanning. If no valid slot
> was found and the function returned NULL, meta_ret still held
> whatever was last copied (possibly CRC-bad). Later users
> (e.g. cache_segs_init) could mistakenly trust that data.
>
> Allocate a temporary buffer instead and only populate meta_ret after a
> valid/latest header is found. If no valid header exists we return NULL
> without touching meta_ret.
>
> Also add __free(kvfree) so the temporary buffer is always freed, and
> include the needed headers.
>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> ---
>   drivers/md/dm-pcache/pcache_internal.h | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/md/dm-pcache/pcache_internal.h b/drivers/md/dm-pcache/pcache_internal.h
> index b7a3319d2bd3e..ac28f9dd2986f 100644
> --- a/drivers/md/dm-pcache/pcache_internal.h
> +++ b/drivers/md/dm-pcache/pcache_internal.h
> @@ -4,6 +4,8 @@
>   
>   #include <linux/delay.h>
>   #include <linux/crc32c.h>
> +#include <linux/slab.h>
> +#include <linux/cleanup.h>
>   
>   #define pcache_err(fmt, ...)							\
>   	pr_err("dm-pcache: %s:%u " fmt, __func__, __LINE__, ##__VA_ARGS__)
> @@ -79,14 +81,17 @@ static inline void __must_check *pcache_meta_find_latest(struct pcache_meta_head
>   					u32 meta_size, u32 meta_max_size,
>   					void *meta_ret)
>   {
> -	struct pcache_meta_header *meta, *latest = NULL;
> +	struct pcache_meta_header *latest = NULL;
> +	struct pcache_meta_header *meta __free(kvfree);
>   	u32 i, seq_latest = 0;
> -	void *meta_addr;
>   
> -	meta = meta_ret;
> +	meta = kvzalloc(meta_size, GFP_KERNEL);
> +	if (!meta)
> +		return ERR_PTR(-ENOMEM);
>   
>   	for (i = 0; i < PCACHE_META_INDEX_MAX; i++) {
> -		meta_addr = (void *)header + (i * meta_max_size);
> +		void *meta_addr = (void *)header + (i * meta_max_size);
> +
>   		if (copy_mc_to_kernel(meta, meta_addr, meta_size)) {
>   			pcache_err("hardware memory error when copy meta");
>   			return ERR_PTR(-EIO);

