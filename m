Return-Path: <linux-kbuild+bounces-4536-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7533D9BFDB3
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 06:39:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A769281DA9
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 05:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21888191F98;
	Thu,  7 Nov 2024 05:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jaHiKwCc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81D610F9;
	Thu,  7 Nov 2024 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957949; cv=none; b=BfVF3lOuZWx4NQIDzseT4dQVUzG5Y91/MFgfxNxp5g6DuFhh7UkeTEu1pUCrQlKfIfPrnP+MjHZz7bKAwaqL7x4A45wWfpwzV2w94NEr4DXicH9SctlxpzAPKjQinYgIxGghXpzCJBcbsWdBN7pH6eOu80CJO5uRKfMVWS0/LL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957949; c=relaxed/simple;
	bh=TCCpGBshBu+THqy+5WrdgDzMl1x45RUuHcpz16sYwU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CrU/3+NjMubsFonjEONu2tPLt1e4nkbojEKwb6LLzQw28CKD/h8Ef3gc4vSWlLHoeOpBgflr5V26z8hpR4LVqVSBZouT06lX8T2sFJr9D6pR++vYCKz3rvS9LO+JD48lwYVpXN1AvWZ7RSfV1T0sk0LFXdNB2bG1SoLqOsXod+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jaHiKwCc; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ty6m/yYMpkl25OURhK1ou6hUG+x4YfrCyt8WHhmSpBk=; b=jaHiKwCcngJlHsLZuiPuUSP11x
	oehUQ/1Sevm5QohHCbGCni/Ks2Li3cj4a6Nli2gR/ADN3kw7HU7Xter/Wz1juTZ0fzaoiuw2ww4DE
	dnufpjlPsYfTh5qv0IMMUna7dpnJr77sRJBmWjxg1VqaWG4upttdSSRS4eBGtIVQv5LaX+27cuIj/
	s3pjYp3KNbLKNFW9t1A2SWNMwHLoULy4+IKnfqGtI7HvDQxpmvyy+uZ8IeWr+nvoxIMtc1ajxykkI
	auPpPicJXre0r4yhrQp1SH4+FTluFV3pN3DrgDtm6MAqnSo/qLntVCz9Afq7leeBdtPZWSX1C+9Uh
	JnEVj8Vg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t8vET-00000005jAK-27pp;
	Thu, 07 Nov 2024 05:39:01 +0000
Date: Wed, 6 Nov 2024 21:39:01 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org
Subject: Re: [RFC] module: Strict per-modname namespaces
Message-ID: <ZyxSdayBstBGhAeO@infradead.org>
References: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241106190240.GR10375@noisy.programming.kicks-ass.net>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Nov 06, 2024 at 08:02:40PM +0100, Peter Zijlstra wrote:
> It reserves and disallows imports on any "MODULE_${name}" namespace,
> while it implicitly adds the same namespace to every module.

Ah nice.  This is pretty similar to what I want and had badly prototyped
a while ago.

> This allows exports targeted at specific modules and no others -- one
> random example included. I've hated the various kvm exports we've had
> for a while, and strictly limiting them to the kvm module helps
> alleviate some abuse potential.

And this was one of the targets on my list.  Specific kunits tests
would be another category.

> +EXPORT_SYMBOL_NS_GPL(fpu_swap_kvm_fpstate, MODULE_kvm);

I would have preferred a syntax that has the MODULE in the export macro
instead of the namespace, but I do care more about actually having the
functionality, and this seems way simpler than what I had.

