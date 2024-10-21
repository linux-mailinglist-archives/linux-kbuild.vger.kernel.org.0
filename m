Return-Path: <linux-kbuild+bounces-4219-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1476F9A8FE9
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 21:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8867DB222D6
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 19:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F48B1F1304;
	Mon, 21 Oct 2024 19:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jM7+xStN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414631991AE;
	Mon, 21 Oct 2024 19:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729539316; cv=none; b=qEW70dm960lfB0nN4yHYFFT9vRFBCJ0JByxV3+m1PaNcG67bvOUKUCMSrXaUT1UWl4sXXgHgT1cP7bPJQf8AKvDakA2nti4l1QPbjHV61ovwQzOJfe7BUC6ZerknxE+xcOv4OLZZOisvMfU2v8KbEX2T+x543GEogiwfsl9lmLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729539316; c=relaxed/simple;
	bh=8tOpICiK/wfQf5QbkPjrRKSzo81f/8BUdiOPtbjkrw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Elcqiy+t2k6Y/SaraogZKz4Hrv8QxjYci1mKVz2n2sFvA7vdSKVRT2/L9j6coJQncLNa1mPfSo2KhcHigBs5xWvWBFfUMpVvvbXwPCXGp5+A0qUbWCvYdE6oEQfxF0kr7RTXX1poXAXt7MACbiMYsx3UD34zy+fY81SBXhyyoc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jM7+xStN; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3g8aVQixKnDjzfmZsk8cbWAQQrT1SpFFGLRDu0rhec4=; b=jM7+xStN+R3o/R08nulj28qyg3
	ptfj+w+Rjjj6f4MQIl14DRerD+YkKc4BcBLat758xCORZKT1oDodd/xRA7ipvZ7etdyOmqXD8+VG6
	DZthBTFFSKWq8yYceBl++WW8jPxaaAukvWcrpTIWby3ZzIqhf3UGo7wNgX+myKyxHo9v8Vfit1MFW
	kIgvzy9xC0PQepVDJDHG6eJTfgrED0FoWOvc/oL8r1e9achMhsDCMIToW2O6wK4qwbsUSnourhuFQ
	v7mkeYBfZ9IaTHSrcKvy2wAXhZD4P82wEaDpF6dBxfjxX2BPLwogzySO4RIv7tw1VpC4Tuko4xV6N
	b2i777pg==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1t2yBJ-00000008SSH-1ApM;
	Mon, 21 Oct 2024 19:35:09 +0000
Date: Mon, 21 Oct 2024 12:35:09 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, masahiroy@kernel.org,
	ndesaulniers@google.com, ojeda@kernel.org, gary@garyguo.net,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Benjamin Gray <bgray@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <Zxas7TA5j8oKLa5x@bombadil.infradead.org>
References: <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
 <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
 <ZxQabNukxBo3utbh@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxQabNukxBo3utbh@bombadil.infradead.org>
Sender: Luis Chamberlain <mcgrof@infradead.org>

On Sat, Oct 19, 2024 at 01:45:35PM -0700, Luis Chamberlain wrote:
> On Thu, Oct 17, 2024 at 02:08:19PM +0200, Helge Deller wrote:
> > Hi Luis,
> > 
> > On 10/17/24 01:21, Luis Chamberlain wrote:
> > > That sounds great. Yeah, the above would be great to test. A while ago
> > > I wrote a new modules selftests in order to test possible improvements
> > > on find_symbol() but I also did this due to push the limits of the
> > > numbers of symbols we could support. I wrote all this to also test the
> > > possible 64-bit alignment benefits of __ksymtab_ sections on
> > > architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> > > ppc64le, parisc, s390x,...). [....]
> > > 
> > > I forget what we concluded on Helge Deller's alignement patches, I think
> > > there was an idea on how to address the alignment through other means.
> > > 
> > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab
> > 
> > I stumbled upon the unaligned-memory-access.rst document [1].
> > Please read it, as it is a really good document, and the section
> > "Why unaligned access is bad" states:
> > It should be obvious from the above that if your code causes unaligned
> > memory accesses to happen, your code will not work correctly on certain
> > platforms and will cause performance problems on others.
> > 
> > With this in mind, you really should apply both of my alignment
> > patches which you currently carry in [0].
> > 
> > For parisc I partly solved the issue by fixing the arch-specific kernel unalignment
> > handler, but every time module sections are stored unaligned, it triggers
> > performance degregation on parisc (and other sensitive platforms).
> > 
> > I suggest you apply them unconditionally.
> > 
> > Helge
> > 
> > [1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/unaligned-memory-access.rst
> 
> You're right, I've just referred to that doc and pushed to the new
> linux modules [2] modules-next branch. This is also great timing so
> that the work that is ongoing for Rust will take this into
> consideration as well. I'll just post the test I wrote as separate
> thing but it surely can be used to help test some of this later.
> 
> [2] git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git

Helge,

I went down memory lane and noted Masahiro asked for this to be done
in asm so I droped your patches. Feel free to post a new iteration.

  Luis

