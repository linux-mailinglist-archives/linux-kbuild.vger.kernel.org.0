Return-Path: <linux-kbuild+bounces-10952-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZdyOI0o8fWl7RAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10952-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 00:18:34 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3ABF57C
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Jan 2026 00:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CD40303132F
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 23:18:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C67835E526;
	Fri, 30 Jan 2026 23:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="h2oOv/wf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E780A1EB5F8;
	Fri, 30 Jan 2026 23:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769815110; cv=none; b=qnXfodr2QxrAwOgqJuoTUvHThDzrTWuY+wfMDWUpHr1/BVHzAEgXlJuYK43VVdY4eIz2Qnz1BVolYcYHulKOgmaTIKLqnMQsO//TEE0QaHBcz1gai+BtnOJlf7exbweqbQL4Tv9yRg4ECGcFmyJo6pVBxHSiG4qQzmcYP+EiZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769815110; c=relaxed/simple;
	bh=t6+FD63TBEjAF4loU6XF4HOpBwGsFUNv91UC8x59JYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu6RWOQT/UBsFk9sblbb9zf4CtSz5jwqaCk1Si2axSLjhLFnrt6XslBK2x/uSO5LDBGf77pF6CoajC0N72/F74AjQXHaCA130zmLlP4W9UwhnbKgi7OaklrRe7Z0EdBVrgEvUvquKx6PXfWL/pc9xdzNq9GBJg3dZt0v3qNgSzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=h2oOv/wf; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=6O1mYVG2C4caxIEKCFEl8cUKL+tPPC5+mqnQqr+mWek=; b=h2oOv/wf+Gc10WkF1rp6lpKhkx
	REDyin4qfKyGMKAcdYmyjQRWX+VrSfwR4eXd8S2FNWlADZqsKpnxN7EvCdHc8CCZMwbNlODRRUqBj
	V5U+9vU+B7KisVoQ7uYed0oa+vWVk0Kq636TjCG7kO6S1Pchuxw0YZNWtk50oIw/VEjd5R/oHVwg4
	V4/CUHugHHoryEUoLPQSjfboedENzshD0dfK61pSZkzolTxa9WB2kLMBpjHNW2jd0R8aDCgwqzRHD
	4Uw/6WH8KgIZ5wEXi17F41tNvBNsKBlrj08GiHFqQXWU1oOPozjg3NZmHoQIHPRKbXbZRPwDonUCe
	2Uz7VkBw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxku-000000025sf-22tZ;
	Fri, 30 Jan 2026 23:18:24 +0000
Message-ID: <70955fc0-84c0-440f-85ba-2d97418ca827@infradead.org>
Date: Fri, 30 Jan 2026 15:18:22 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Do not run kernel-doc when building external
 modules
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rong Zhang
 <i@rong.moe>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260130-kbuild-skip-kernel-doc-extmod-v1-1-58443d60131a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10952-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,huawei];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,infradead.org:email,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: E8E3ABF57C
X-Rspamd-Action: no action



On 1/30/26 1:37 PM, Nathan Chancellor wrote:
> After commit 778b8ebe5192 ("docs: Move the python libraries to
> tools/lib/python"), building an external module with any value of W=
> against the output of install-extmod-build fails with:
> 
>   $ make -C /usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build M=$PWD W=1
>   make: Entering directory '/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build'
>   make[1]: Entering directory '...'
>     CC [M] ...
>   Traceback (most recent call last):
>     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 339, in <module>
>       main()
>       ~~~~^^
>     File "/usr/lib/modules/6.19.0-rc7-00108-g4d310797262f/build/scripts/kernel-doc.py", line 295, in main
>       from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
>       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>   ModuleNotFoundError: No module named 'kdoc'
> 
> scripts/lib was included in the build directory from find_in_scripts but
> after the move to tools/lib/python, it is no longer included, breaking
> kernel-doc.py.
> 
> Commit eba6ffd126cd ("docs: kdoc: move kernel-doc to tools/docs") breaks
> this even further by moving kernel-doc outside of scripts as well, so it
> cannot be found when called by cmd_checkdoc.
> 
>   $ make -C /usr/lib/modules/6.19.0-rc7-next-20260130/build M=$PWD W=1
>   make: Entering directory '/usr/lib/modules/6.19.0-rc7-next-20260130/build'
>   make[1]: Entering directory '...'
>     CC [M]  ...
>   python3: can't open file '/usr/lib/modules/6.19.0-rc7-next-20260130/build/tools/docs/kernel-doc': [Errno 2] No such file or directory
> 
> While kernel-doc could be useful for external modules, it is more useful
> for in-tree documentation that will be build and included in htmldocs.
> Rather than including it in install-extmod-build, just skip running
> kernel-doc for the external module build.
> 
> Cc: stable@vger.kernel.org
> Fixes: 778b8ebe5192 ("docs: Move the python libraries to tools/lib/python")
> Reported-by: Rong Zhang <i@rong.moe>
> Closes: https://lore.kernel.org/20260129175321.415295-1-i@rong.moe/
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>


LGTM.
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> This is an alternative to Rong's proposed fix for the first error:
> 
>   https://lore.kernel.org/20260129175321.415295-1-i@rong.moe/
> 
> I noticed the second one by inspection of -next and further testing.
> ---
>  scripts/Makefile.build | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5037f4715d74..f01d7957edf7 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -166,11 +166,13 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $<
>  endif
>  
> +ifeq ($(KBUILD_EXTMOD),)
>  ifneq ($(KBUILD_EXTRA_WARN),)
>    cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none $(KDOCFLAGS) \
>          $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
>          $<
>  endif
> +endif
>  
>  # Compile C sources (.c)
>  # ---------------------------------------------------------------------------
> 
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260130-kbuild-skip-kernel-doc-extmod-276584e7b2b0
> 
> Best regards,
> --  
> Nathan Chancellor <nathan@kernel.org>
> 
> 

-- 
~Randy

