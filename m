Return-Path: <linux-kbuild+bounces-6579-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A44A85AD5
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 13:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 474F67B8275
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Apr 2025 10:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FD9221273;
	Fri, 11 Apr 2025 10:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="PFMOcvhZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A02221261;
	Fri, 11 Apr 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744369137; cv=none; b=XraXW+odzoLxhx1OdxUlUUoSLES1Mg5I9Zv6/vYEvJxBJjBM4uqJwd0uvOuNJAvxZRe4DqaMq4aeRGjEbsLOX2357cgbqvrmzVFX4ri8/sTVdglZkGqFKmlp1StNiOTtPoGz0bm3UWfJxQqyE2wAKhLv9CmfG+JY0+98Ux+rPsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744369137; c=relaxed/simple;
	bh=N4jNppPpqLQwe0hwoHW0o9kVxsbRo3aCScF2PLEnRzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2e+ZC8RJjWBwnrvNQdZEXTL3Fqi9KUZLNsWV491xfPOfKV8IUMSfVRrH80xMKFoa/vpbj/94xsQJpR5s36rWuO9F0RkFMB9lq5KO6sVJQZRI4dRw5CRYCpIRr/hyklxiHZLo3fiK2aJXn8P1rJyDFw9i6fCczGLSmH8Nsx3Lq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=PFMOcvhZ; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i/AitIQhvhi1g1LUIinw+UyFTNDun+mDGRvzVoCtIv8=; b=PFMOcvhZ/M32Yx2T1j6yip9Ti5
	o/i+rtT6sdjtTOo4SW66FBiuxrfApEOLB9ZwEkiikLOqBiF++0D1k0mXYVYdP5E0LvsKLI0PGuCL8
	SGUP9ihe5esSSMmn/pJjT7ruz43dC2w4lxGoJ2B/Ngux9hBBEejnob7HM8OovVMUYCC2DnsG0WaNn
	lNtnW2TloLKRlN0uoxEX3d38KejXbjkN/ta5IF79N7/sS+68ZpxroT93nNAi23uNnUCePjJ+9XnkE
	iZRljT9ZCbjhHa45V+YPkOaL6H+Wim5tHWpLWNXDnXNKN3NFlaqNUJAFqP+t2vv2D/1cdqH0w2FAq
	iMPvXEag==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3C5x-000000048tX-36Y9;
	Fri, 11 Apr 2025 10:58:50 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id BB6E230057A; Fri, 11 Apr 2025 12:58:49 +0200 (CEST)
Date: Fri, 11 Apr 2025 12:58:49 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>, Rae Moar <rmoar@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sergio =?iso-8859-1?Q?Gonz=E1lez?= Collado <sergio.collado@gmail.com>,
	David Gow <davidgow@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Mostafa Saleh <smostafa@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/mksysmap: skip objtool __pfx_ symbols
Message-ID: <20250411105849.GA5600@noisy.programming.kicks-ass.net>
References: <20250328112156.2614513-1-arnd@kernel.org>
 <ycgbf7jcq7nc62ndqiynogt6hkabgl3hld4uyelgo7rksylf32@oysq7jpchtp4>
 <20250411065054.GM9833@noisy.programming.kicks-ass.net>
 <0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0073e739-e3aa-4743-ad2d-29d7c969f454@app.fastmail.com>

On Fri, Apr 11, 2025 at 09:47:51AM +0200, Arnd Bergmann wrote:
> On Fri, Apr 11, 2025, at 08:50, Peter Zijlstra wrote:
> > On Tue, Apr 08, 2025 at 06:58:49PM -0700, Josh Poimboeuf wrote:
> >> On Fri, Mar 28, 2025 at 11:48:19AM +0100, Arnd Bergmann wrote:
> >> 
> >> For example, FineIBT writes code in the __pfx area which can trigger an
> >> #UD.  And we'd want a sane backtrace for that.
> >
> > On top of that, clang kcfi builds do a similar thing, they will generate
> > __cfi_ prefixed symbols.
> >
> > And yes, those symbols exist for a reason, there is code there under
> > various circumstances and backtraces look really weird without these
> > symbols on -- notably the code in the prefix will be attributed to
> > whatever symbol comes before, most confusing.
> >
> > So yeah, don't remove these symbols, and fix the kunit test.
> 
> kallsyms already removes some CFI symbol names based on regular
> expressions:
> 
> # CFI type identifiers
> / __kcfi_typeid_/d
> / __kvm_nvhe___kcfi_typeid_/d
> / __pi___kcfi_typeid_/d
> 
> Do you think it should not remove some of them?

Those are typeid symbols, those are fine to remove.

> I ran into another problem with generated symbols that I don't
> understand yet, and added this line to avoid the build failures:
> 
> / _GLOBAL__sub_/d
> 
> This one is 534 characters long:
> _GLOBAL__sub_I_65535_1_snnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7n

I've not seen those before; google seems to suggest this is part of
static initializers.

