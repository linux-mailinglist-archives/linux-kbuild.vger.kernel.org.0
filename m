Return-Path: <linux-kbuild+bounces-6011-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DABA579C4
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 11:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0B7188FF7A
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Mar 2025 10:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3591AAA2C;
	Sat,  8 Mar 2025 10:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IVl/SXmq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C105194A6C;
	Sat,  8 Mar 2025 10:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741430103; cv=none; b=III5jrTxt9NU6NAFyHlua27/QGf6O/ClDcn0O3pJLO44cxumcr8UEwti2pduJfoRqvatKtjDih8j6lrRvtiueysBx4fQJI4CrIiA+6u+Or3xYUz/dwv/ekuE4IOEg5fBmY/NnhQHQtN5kSHFCMKUR7JE1CIklbrilV8pgZL5a9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741430103; c=relaxed/simple;
	bh=vMML90PmPz4f5iAqQP3twGkVRdax3owqnUyoLOTy6XU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNlmd3lUB2WjBeUFfjbQZ1RC0GrrXNt5DIL3XYJYUclEvJ7woi47Ns4aggT5Z6+2rbWEm+FhMs70V5PfXqtdWXY/MRz80XwazuNkMyP+ppbb1If1KqhDZgBvwDzCOL4+/4qX5AIzbnlvx1DX01LRUBVfUb/Hxb816BVrv9RMxjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IVl/SXmq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4549140E01A0;
	Sat,  8 Mar 2025 10:34:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Dx9MuYHWPlqr; Sat,  8 Mar 2025 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1741430091; bh=MeXXMrhJlDtSepFHfsLRrAktBWHVEJK6DeWmWg1ARF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVl/SXmq/rp7/wuTuL3JeG1NhCkCjhndn80n3QHMOsg3kRhCK6KSFFXupFy9l/o2X
	 onLBWr6480uwDj6EigIybWN8lGEZLTUTmIDncjaEWtQSlbLThoWuiDT2VKuvVAG8oL
	 k9xnD1qKRO6Soad9zafHKjLIDwIc7TNiUjqLxyO69M5umcFk8tkje0pHxxuEiRoIlb
	 bcyH5jrpa0lqCpYiNs7/fOWGCh6bQNwS1c0QtfpYkvicsWgc5RqULwaGKA7X+0UWR0
	 uk1HqMlGrImJh3y+w6LDkD0E9iBe6wbkFn+WaGUF25LcARVQsPb+UDhvTNsaodOClM
	 2iqZD/zz9RStGvlQcWuvEiyP49nwG5qkmKS/LqESHRlenfxrjQQX2UQgrgUkgbdR29
	 HQwyhPGyNrR0zdudeYgaaEISdMsSkQ/SoWnvx7Um0GRguoLKs0l8vOu5S5xwVFTV1a
	 zYN6BUiIoxRBVDmawk9RQ8C6eH95+2eNY1l4ugHa8HKVzSV4lmG+41OHV7c+8isg/e
	 +WmrCZLTyb1YOUebbwqdLq675QzOOST/OuKtoToqpb2/jOL1gx/mONiEVOAy14Dig1
	 WVMUX7CANI1GigYwBY2kdL+CmGn8Bs/Kw0cq5MAz1AJR3k9KR4sr50ye39/YVksMAA
	 vZ2ecJo9efEZFCmTXLYVoWwQ=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0834440E016E;
	Sat,  8 Mar 2025 10:34:43 +0000 (UTC)
Date: Sat, 8 Mar 2025 11:34:37 +0100
From: Borislav Petkov <bp@alien8.de>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, nicolas@fjasle.eu,
	hpa@zytor.com, sraithal@amd.com
Subject: Re: [PATCH v1 1/1] kbuild: Add "make headers" to "make help" output
Message-ID: <20250308103437.GAZ8wdPbFGfhzAi1WU@fat_crate.local>
References: <20250308040451.585561-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308040451.585561-1-xin@zytor.com>

On Fri, Mar 07, 2025 at 08:04:51PM -0800, Xin Li (Intel) wrote:
> Meanwhile explicitly state that the headers are uapi headers.
> 
> Suggested-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 70bdbf2218fc..8f5aa710105e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1659,7 +1659,8 @@ help:
>  	@echo  '  kernelrelease	  - Output the release version string (use with make -s)'
>  	@echo  '  kernelversion	  - Output the version stored in Makefile (use with make -s)'
>  	@echo  '  image_name	  - Output the image name (use with make -s)'
> -	@echo  '  headers_install - Install sanitised kernel headers to INSTALL_HDR_PATH'; \
> +	@echo  '  headers	  - Install sanitised kernel uapi headers to usr/include'
									     ^^^^^^^^^^^

It is INSTALL_HDR_PATH too, try:

make O=/tmp/b/ headers

for example.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

