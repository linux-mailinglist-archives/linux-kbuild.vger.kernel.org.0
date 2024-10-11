Return-Path: <linux-kbuild+bounces-4065-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DD99AEB5
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 00:33:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9CDAB21D55
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 22:33:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6D01D1E69;
	Fri, 11 Oct 2024 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UltoW1bQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5721C34CDE;
	Fri, 11 Oct 2024 22:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685983; cv=none; b=jCZ44LEszLqD+xN/gwGstZp4x3LRLQ92sjiH/3gLJxc7SNzMp53DdJ7llWoJt+7e3n/CmYZk46nCpMehr8i2BDF1+5uk86MD5jXi3ZC4NjAnlNlf7pBj8tzFhsq4LUd1egdLA+uQnXahVYruE6SJ095Xr9X3AN93zRRXGlSCV6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685983; c=relaxed/simple;
	bh=Flv0GRLdeQ1gSwjTyDQi9TrDRlUCwbdIuIXC2XemiYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rPKJxW4h4FS5H+Hwm5KuSg1j0AQsWIh+5iQjuBXZlHIaj2f2BI5eWIMb0iFimKVpqAv6D0VMKauy3ycpco29BH6J01dgekF/pQuQNoNBo6ybsn1VRsGABLJr9fPA+5L2zI+0wVDA+C/u2xdXELElF4wEJCMbbu7daSRYruYF8uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UltoW1bQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBACC4CEC3;
	Fri, 11 Oct 2024 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728685982;
	bh=Flv0GRLdeQ1gSwjTyDQi9TrDRlUCwbdIuIXC2XemiYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UltoW1bQhYsLEoAMKIMx73Un2N6BQyTAqiDcMjWtFMWm+EC89r2nG3jWEDkIUitKx
	 xGmutP8SJsm2LRNo9e1HQMqCiPs9bwKHHzwni7XZ9+aVTj1WCClWpaFQ13670kp1aQ
	 WdkadD19Kz2UEXKDu6/gszCksgxGKQL2oO2VsAW5SX0tLOWKDnmLvDlrC58Hwfymls
	 e+RQxQlhH6O09tJfVGm/wowj2g/Kpcxu+1TiNujUaVEiSl3WWv0z72NHqYj1KjwTVy
	 Z8/3k+m0ngf3MKY28cuCVKRDFvkGY0LCBYST1yZuLhzNSgPpZzzWx2gsIT7eNhukYj
	 vH8ndhGsm2TPQ==
Date: Fri, 11 Oct 2024 15:33:00 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>

On Fri, Oct 11, 2024 at 03:27:30PM -0700, Matthew Maurer wrote:
> On Fri, Oct 11, 2024 at 3:22 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> > > Adds a new format for MODVERSIONS which stores each field in a separate
> > > ELF section. This initially adds support for variable length names, but
> > > could later be used to add additional fields to MODVERSIONS in a
> > > backwards compatible way if needed. Any new fields will be ignored by
> > > old user tooling, unlike the current format where user tooling cannot
> > > tolerate adjustments to the format (for example making the name field
> > > longer).
> > >
> > > Since PPC munges its version records to strip leading dots, we reproduce
> > > the munging for the new format. Other architectures do not appear to
> > > have architecture-specific usage of this information.
> > >
> > > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> >
> > I'm all for the ELF validation work so far, all that was nice, thanks
> > for all that tidying up. This however is not considering when we really
> > need all this at all, and not making it specific to the build times when
> > such things are needed. That is, yes I'd like to see the need for this
> > clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
> > when this is needed. No need to extend a module with bloat if we don't
> > need it, likewise if a kernel was built without needing those things,
> > why bloat the modules with the extra information?
> 
> To make sure I understand what you're asking for, are you suggesting:
> 1. A config flag for supporting parsing the extended format
> 2. A config flag for supporting parsing the existing format
> 3. A config flag for putting the extended format into produced modules
> 4. A config flag for putting the existing format into produced modules
> or some combination of the above?
> 
> I'm currently reading this as #3, but figured I'd ask to be certain.

3), but if your kernel build does not require these extra things, then
a simple if !(IS_ENABLED) sanity check could be put in place to avoid
processing the information if the kernel didn't need it. It's a one line
change. So at run time, we build the same kernel with all that code in,
but it makes no sense to be processing modules with that stuff if
kernels did not need it.

  Luis

