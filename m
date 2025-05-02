Return-Path: <linux-kbuild+bounces-6869-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4650AAA7314
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 15:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB2793A5F68
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 13:13:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5613425524D;
	Fri,  2 May 2025 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dvvj9G7B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C0F254AF4;
	Fri,  2 May 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191509; cv=none; b=DliW9dUK45breA7GxxXk99U+2x5Llymq61LZfMu4RowLKcTwDWrXIrNBa3kwheqnjSNU03sovvdjw+sD905AE9KRWrAMYCCYAsZqQYHE4Q9bEehF1W9wGANbpLCH2oPC43tFpHckXSvJacqbmHlWHqV7qUglIKG29NedpPMRZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191509; c=relaxed/simple;
	bh=gAku/UUdkrfNmTL5pUiPcG4b39togD+Cvk0XAshVFL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pye04SThItV7GTiacEVkG47TOruivy0ZHxuXiqj/W+w8gQbSlfmicWnRJU9gFRknMtoYhmPprk7/adUi4DgLZDvP8sQUVqSFRb20LSQ8EdTSiDpujFn3BQ23/xhjf2A5pwrrQAq8xaK20JyFqhaVsaymPN/MMRyWhxBnYON0q/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dvvj9G7B; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=01W2LkNAMIJC1dllmER/rR/orJv/5PmpGshgzCgJhHg=; b=dvvj9G7BoGlTMeSEFEM1n9o27+
	gge0jzljxxVcxRMiOn/AvpJNzliQsWMfMfuBc7Xow4qbjGjsAdwr7eH+f3XabplpOklUa3PtSGly3
	N2fUvB98GlLHRmEqgao5fANQ+Pss+F6k+6bE1UvFU8xyKKQLToTY4K1EP91oHICkif+0OVxihfLwD
	T5oYVlvtSKbfFepkRvgIlzOPy8prpc02RWqnI4UnZm3d/Gn7ZVeDXuIauSRcxB7qqlOhKUucxSdzT
	LYHRuW76N7nNYUD/+uWCgI0bsmC769YV7+HrQtM/WoShbA5pthczHOdEdEM5X/p3c+xTMXi2d8BUM
	bvkHfTLA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAqAc-00000000g9e-3eIC;
	Fri, 02 May 2025 13:11:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4065230057C; Fri,  2 May 2025 15:10:53 +0200 (CEST)
Date: Fri, 2 May 2025 15:10:53 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, nathan@kernel.org,
	nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH -v2 5/7] module: Extend the MODULE_ namespace parsing
Message-ID: <20250502131053.GB4198@noisy.programming.kicks-ass.net>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.496784892@infradead.org>
 <CAK7LNASVq=2K25vy8o=Lni2PGoHpyYogwt6E5CeNSnxXFpeduA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASVq=2K25vy8o=Lni2PGoHpyYogwt6E5CeNSnxXFpeduA@mail.gmail.com>

On Fri, Feb 07, 2025 at 05:41:54PM +0900, Masahiro Yamada wrote:

> > +static bool verify_module_namespace(const char *namespace, const char *modname)
> > +{
> > +       size_t len, modlen = strlen(modname);
> > +       const char *sep;
> > +       bool glob;
> > +
> > +       if (strncmp(namespace, "MODULE_", 7) != 0)
> > +               return false;
> > +
> > +       for (namespace += 7; *namespace; namespace = sep) {
> > +               sep = strchrnul(namespace, ',');
> > +               len = sep - namespace;
> > +
> > +               glob = false;
> > +               if (sep[-1] == '*') {
> > +                       len--;
> > +                       glob = true;
> > +               }
> 
> 
> Why only limited to the trailing wildcard?

Because its simple and easy.

> Did you consider using glob_match()?

I had not, because I didn't know we had that in-kernel. Looking at that,
using it is a bit of a pain, since it needs the pattern as a C string,
which means I need to strdup() the thing because I can't modify the
original.

That in turn means we need to deal with malloc failure.

Is that all worth it?


