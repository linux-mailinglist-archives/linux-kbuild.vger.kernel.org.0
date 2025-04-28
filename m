Return-Path: <linux-kbuild+bounces-6764-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A115A9EFAA
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 13:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECD417AC20E
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Apr 2025 11:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4D959B71;
	Mon, 28 Apr 2025 11:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ujVHvhK9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0C34A21
	for <linux-kbuild@vger.kernel.org>; Mon, 28 Apr 2025 11:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841053; cv=none; b=HGlvILYUMpV6rq5jGYQAHh+4PM5NaNflRhrvQNxxEixC7Ad8y730Q47D7a3VOhjBQeK92bzGXOJfppodemfJl74lfSpfMiPGmynOMRE2I+Pj+jw3sVB7ydTvnqOMf1g5RcSKrYwKq6hVPrBS1YaYNBUPZi4oqk6RkqxOTIQDoy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841053; c=relaxed/simple;
	bh=IH6e3+eS7bFwB8fDIw8jrfENV7hS3NqhMQ1RsTRZdpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmd+YtzYvEXgiWiSiieMuXTCVTWc37lS/30ttOfTAftl8fZKC3m/xX9dYv9oKvfafPVNhxtDzVE7aLlu/VTXvFrG3qEZgH9hp/xfyNLW4wYouhcrL/3ng08UKuGF2BvQ65ZHyEzVLD6YWFccCAnmuO1ddXIy7SV69QDU2ZVbp9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ujVHvhK9; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Mon, 28 Apr 2025 13:50:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745841039;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mW7mdU5Bbbu8fINlsQ6u1L5lR/DUIcHio7Oq/WZ7PWU=;
	b=ujVHvhK9Tzyst1Yyniur4NbVsiunPXBEIpcMLI3Jumc7dfCGFIE6797G4ouQZW88Kwj5sk
	y1wT/+Pf5jUsmLnTHvcy6Mp87om+mEOqlM/oK0ucs+Bp61rBtUh02SBXuxIaX9EPCr0Dc1
	kD5jMagXKTG+NGGFHrxkegnALBkFb7o=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: WangYuli <wangyuli@uniontech.com>
Cc: guanwentao@uniontech.com, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, niecheng1@uniontech.com, petr.pavlu@suse.com,
	samitolvanen@google.com, zhanjun@uniontech.com
Subject: Re: [PATCH v3 1/2] kbuild: deb-pkg: Add libdw-dev:native to
 Build-Depends-Arch
Message-ID: <20250428-sensible-jaguarundi-from-tartarus-a991f1@l-nschier-aarch64>
References: <79C925DCE2E963FF+20250422104927.144252-1-wangyuli@uniontech.com>
 <70C0FECF7A9A7B62+20250422105402.145635-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70C0FECF7A9A7B62+20250422105402.145635-1-wangyuli@uniontech.com>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT

On Tue, 22 Apr 2025, WangYuli wrote:
> The dwarf.h header, which is included by
> scripts/gendwarfksyms/gendwarfksyms.h, resides within the libdw-dev
> package.
> 
> This portion of the code is compiled under the condition that
> CONFIG_GENDWARFKSYMS is enabled.
> 
> Consequently, add libdw-dev to Build-Depends-Arch to prevent
> unforeseen compilation failures.
> 
> Fix follow possible error:
>   In file included from scripts/gendwarfksyms/symbols.c:6:
>   scripts/gendwarfksyms/gendwarfksyms.h:6:10: fatal error: 'dwarf.h' file not found
>       6 | #include <dwarf.h>
>         |          ^~~~~~~~~
> 
> Fixes: f28568841ae0 ("tools: Add gendwarfksyms")
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>  scripts/package/mkdebian | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 744ddba01d93..d4b007b38a47 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -210,7 +210,7 @@ Rules-Requires-Root: no
>  Build-Depends: debhelper-compat (= 12)
>  Build-Depends-Arch: bc, bison, flex,
>   gcc-${host_gnu} <!pkg.${sourcename}.nokernelheaders>,
> - kmod, libelf-dev:native,
> + kmod, libdw-dev:native, libelf-dev:native,
>   libssl-dev:native, libssl-dev <!pkg.${sourcename}.nokernelheaders>,
>   python3:native, rsync
>  Homepage: https://www.kernel.org/
> -- 
> 2.49.0
> 

Thanks!

Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>

