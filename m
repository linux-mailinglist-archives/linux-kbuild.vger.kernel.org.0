Return-Path: <linux-kbuild+bounces-9005-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92929BBDB15
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Oct 2025 12:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C8D3B4AE9
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C427823C503;
	Mon,  6 Oct 2025 10:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UI/4M3nl";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="NtpGNc3M"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E7B1B0F11;
	Mon,  6 Oct 2025 10:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759746685; cv=none; b=ipBdWE1dpf31JQPsEsxcNxH1TeC0UTSavlP3S/wvmOonLKoUgB/j4u92JhxbByHz7C/mq9ag6bLosNKfvB5fHxuI336KwxSdGmKcKXrwqO8ZjeG34dRtgS45bKjtuOUOUBRR7NdIvKGAp8g84yKWnWR8pU2OsmwvTaMjSSwmuic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759746685; c=relaxed/simple;
	bh=b+CNaA3oh8r6e/OAlITi9nu9rHrLqnEFHAYZxcvagNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N21kCTZ5mdCpiOU2CR3B8EZ84WxoArA91iCidEneo9H8JhwgHPAjvmhaU/Owsy7IJtyiAezAzrraoV0fEPpigN9LA5UyHNkpTL4sj1a8z+ZSLkNq13xGIhon6gInnvN7vwsBALxnEe+lJslprfp3HTfQiYfUgdZhAchBDRcWUoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UI/4M3nl; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=NtpGNc3M; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Mon, 6 Oct 2025 12:31:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1759746682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F9Vm+6SJzGBd5zjp+yPXjTWbX+rAQXleybVGXQfhq7o=;
	b=UI/4M3nlqJnAYlqpT17Mseq7S2zJU8z1njhf96Gz7gEYUYXML597UuNBUEbJ6EM+DCIyEw
	sFS2Z/dbJrkqtrs8DXwSv9eeeMjO/w0aZ+zPwpoMzQfiLdTPMVdZpQKtNwxIaTzSUFRU7w
	AWa652iFBakQ6IHxGySS9Kei3DOTrUUuTowp6bF8n2HzVlHVwIidCb8pMTFmMdjHjoMwft
	o6cIGM3Im05QeOcWv7kYmnw7zqv74fNX+0p6Y4DkEeWmJ4pv5p5pDmr+sXmbkBkjKFdZRt
	fkcRooj+2vXghK3Br2p71oIUj1NKNlSPCViHT4ObCaZA615rn7nku8p8I7itIA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1759746682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F9Vm+6SJzGBd5zjp+yPXjTWbX+rAQXleybVGXQfhq7o=;
	b=NtpGNc3MOmhSzinQtDWvHhLii8O9bWFP0LRgQ0Q/2w77f7fPY0q7BmX4iHGfaRsHHkT5us
	rh4qI44lVzvruvDg==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, linux-kbuild@vger.kernel.org, linux-m68k@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: uapi: Strip comments before size type check
Message-ID: <20251006122254-b3b3f96f-67e5-4223-a040-79c845097f6d@linutronix.de>
References: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e68ab921a728caea4f3f37bfae9b1896edfa97a.1759740354.git.geert@linux-m68k.org>

On Mon, Oct 06, 2025 at 10:49:28AM +0200, Geert Uytterhoeven wrote:
> On m68k, check_sizetypes in headers_check reports:
> 
>     ./usr/include/asm/bootinfo-amiga.h:17: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> This header file does not use any of the Linux-specific integer types,
> but merely refers to them from comments, so this is a false positive.
> As of commit c3a9d74ee413bdb3 ("kbuild: uapi: upgrade check_sizetypes()
> warning to error"), this check was promoted to an error, breaking m68k
> all{mod,yes}config builds.

This commit has been in -next for some time. Any idea why the issue did
not show up there?

> Fix this by stripping simple comments before looking for Linux-specific
> integer types.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

> ---
>  usr/include/headers_check.pl | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/usr/include/headers_check.pl b/usr/include/headers_check.pl
> index 21c2fb9520e6af2d..75dfdce39e7f4610 100755
> --- a/usr/include/headers_check.pl
> +++ b/usr/include/headers_check.pl
> @@ -155,6 +155,9 @@ sub check_sizetypes
>  	if (my $included = ($line =~ /^\s*#\s*include\s+[<"](\S+)[>"]/)[0]) {
>  		check_include_typesh($included);
>  	}
> +	# strip comments (single-line and C99 only)
> +	$line =~ s@\/\*.*?\*\/@@;
> +	$line =~ s@\/\/.*$@@;

C99/C++ comments are rejected in UAPI headers, so this line can be dropped.

>  	if ($line =~ m/__[us](8|16|32|64)\b/) {
>  		printf STDERR "$filename:$lineno: " .
>  		              "found __[us]{8,16,32,64} type " .
> -- 
> 2.43.0
> 

