Return-Path: <linux-kbuild+bounces-6871-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8F7AA732B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 15:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0E821BA20A4
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547D4253F34;
	Fri,  2 May 2025 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="UzHqZm1K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C447D27E;
	Fri,  2 May 2025 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191810; cv=none; b=pvZg0bANWayRN3M2eD6ptagH/fV9qarCSGfDDerOfgtPxM7/hhSY7iqMTAtqAti4eKTkRp7jVu7RwQ8pMdkXigP2yO35JNOgWqd7SawQKni9UYeNXYLsaVGHKy15wD+01wCrnqAwwdIgBLMsUsOz6YWCJEUN/kqbDD+ZOFWCC8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191810; c=relaxed/simple;
	bh=KnLK/lMmScw2OCDX7p+prVDCmF5kI2Jwf/GCh5wxjbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZG8G8GmpqPnRzvBsSaCJMbIT+m+Td0Fndk6wuMu4XCzkSVUDYbmsgUIEJiHJL4EACTsqp/E2eZKjoO6LfdMFdFFtjLaePZGp2LQlKxwVcBfHclJDHXkXwrFUtOlSKxLT3tO0rk4nc5m9dZykIW6c5Gng/1BohKhSB5iuX/nrno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UzHqZm1K; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s23vB0WKs877pOYJca3/jvhe1JspKWX0ewDkhN8AS9s=; b=UzHqZm1KfMYIi3/JO+wkCKKWio
	ypUiQHpdvNcmcpJvtNdirFFXN4me6TvDAaPlVtFCWyMbIMAMTVJ8a4oTLAA8rZYxdtx4fVy3FRiRG
	Y/VcI6Tj/Y65omKLw0HScbrgN6JbXG8TIPl+NEIPOtKjwwVdzyBzy0naLDhJ0k7QGyHmi9/AwiKa5
	1GTPgNhexGuP1XrAUa6xJhAv61uuV4g0Dbw0mRAaRmtsT3A95v/Xtr3p7je4GjQoqLwnR1Itkzhqp
	Z4XP9/8oaCzeDgHIGOCHxuCRKg2sinyBPXTB2OS4Zzbv29VBM6lA0m+7NSrAoMQpuPUbvwSAHPZpA
	92zB2oFg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqF9-00000000oTy-04CY;
	Fri, 02 May 2025 13:15:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4FFD430057C; Fri,  2 May 2025 15:15:47 +0200 (CEST)
Date: Fri, 2 May 2025 15:15:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: mcgrof@kernel.org
Cc: x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org,
	Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH -v2 6/7] module: Account for the build time module name
 mangling
Message-ID: <20250502131547.GD4198@noisy.programming.kicks-ass.net>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.606849101@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202150810.606849101@infradead.org>

On Mon, Dec 02, 2024 at 03:59:52PM +0100, Peter Zijlstra wrote:
> Sean noted that scripts/Makefile.lib:name-fix-token rule will mangle
> the module name with s/-/_/g.
> 
> Since this happens late in the build, only the kernel needs to bother
> with this, the modpost tool still sees the original name.
> 
> Reported-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/module/main.c |   26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> --- a/kernel/module/main.c
> +++ b/kernel/module/main.c
> @@ -1062,6 +1062,30 @@ static char *get_modinfo(const struct lo
>  }
>  
>  /*
> + * Like strncmp(), except s/-/_/g as per scripts/Makefile.lib:name-fix-token rule.
> + */
> +static int mod_strncmp(const char *str_a, const char *str_b, size_t n)
> +{
> +	for (int i = 0; i < n; i++) {
> +		char a = str_a[i];
> +		char b = str_b[i];
> +		int d;
> +
> +		if (a == '-') a = '_';
> +		if (b == '-') b = '_';
> +
> +		d = a - b;
> +		if (d)
> +			return d;
> +
> +		if (!a)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
>   * @namespace ~= "MODULE_foo-*,bar", match @modname to 'foo-*' or 'bar'
>   */
>  static bool verify_module_namespace(const char *namespace, const char *modname)
> @@ -1086,7 +1110,7 @@ static bool verify_module_namespace(cons
>  		if (*sep)
>  			sep++;
>  
> -		if (strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
> +		if (mod_strncmp(namespace, modname, len) == 0 && (glob || len == modlen))
>  			return true;

Note that this is going to be a pain if we use glob_match(), because
then either all the patterns must already use '[-_]', or we need to
dynamically rewrite the glob.

Neither really appeals to me much.

Best to keep it simple.

