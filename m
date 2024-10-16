Return-Path: <linux-kbuild+bounces-4157-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 030E09A1613
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2024 01:21:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A70D81F229BB
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 23:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AFD11D47BD;
	Wed, 16 Oct 2024 23:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af7Bah2k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4CB14EC47;
	Wed, 16 Oct 2024 23:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729120915; cv=none; b=ez2vxTzvjsccT8Ksha5y9zuBcrr8p46agMyIKZKXbFPeFO8kYhuX44BpggqHcxWttWWMIYRLOrO5TupCKMe0YHIPv7zEaUNvbDkFcRsld/3vE7QiUhufko5Lc/pRWg1BwuSMebcJn3u+KsI6efUINtx02QC2FPvMtsNCLW1AKyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729120915; c=relaxed/simple;
	bh=jj2l+z5z0T64UjsqbIKx9n9DA8OiXqjAqg3PCGZgsoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nWkp0/mGsgo+rAxNJeK7eNErqGMJC5/T79fYjwq2VFVmlUXarOCjbX90Zp/qQLNiCHUdUuklhg2yDyVHKWaR2rHznHBaNIe2SVT6Ovxgd2mUtoD3WaDBR7UpSCu3HHXmJ5uGZC5LvNIODPdW765mGjWlbkLsjDZ2MVwsHDFDPJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af7Bah2k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82CEC4CEC5;
	Wed, 16 Oct 2024 23:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729120914;
	bh=jj2l+z5z0T64UjsqbIKx9n9DA8OiXqjAqg3PCGZgsoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=af7Bah2k2HGKpQSGvVX0//1Ci0GFMWdzohzgWvqZ9Ud5O2dzDbLEEIPrUPxCRrhl2
	 w+Bw0udf0cCZ3+n/WXZwh0KBAMGY/XvxgpJbH4cp7gV1tUKBQYdp0Ofc2ct7zdCh1Q
	 +wLXSNDXsYQuOQRZ1Ay85/IZyvUi/SWqSWbHVXsy6R62raD0HUR5Kql/usoTjVrzSy
	 hIR20HgR3CkCEFc+uVEIsmi56qZiILM87EB81FchDBLU7swQG6osrl3E/toanDh4R3
	 r+IGcCk9V4cWh5cZzCnD5mQ04fFBHzmI0IYUpnEUclr9BfO0qkkOo1Un3FPWT+scGP
	 FpHJUYW5QDvnw==
Date: Wed, 16 Oct 2024 16:21:52 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, Helge Deller <deller@gmx.de>
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
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 14/16] modules: Support extended MODVERSIONS info
Message-ID: <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>

On Tue, Oct 15, 2024 at 04:22:22PM -0700, Matthew Maurer wrote:
> So, the basic things I can think of to test here are:
> 
> 1. The kernel can still load the previous MODVERSIONS format
> 2. The kernel can load the new MODVERSIONS format
> 3. If we artificially tweak a CRC in the previous format, it will fail to load.
> 4. If we artificially tweak a CRC in the new format, it will fail to load.
> 5. With CONFIG_EXTENDED_MODVERSIONS enabled, the kernel will build and
> load modules with long symbol names, with MODVERSIONS enabled.
> 
> Is there anything else you were thinking of here, or are those the
> kinds of checks you were envisioning?

That sounds great. Yeah, the above would be great to test. A while ago
I wrote a new modules selftests in order to test possible improvements
on find_symbol() but I also did this due to push the limits of the
numbers of symbols we could support. I wrote all this to also test the
possible 64-bit alignment benefits of __ksymtab_ sections on
architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
ppc64le, parisc, s390x,...). But come to think of it, you might be
able to easily leverage this to also just test long symbols by self
generated symbols as another test case. In case its useful to you I've
put this in a rebased branch 20241016-modules-symtab branch. Feel free
to use as you see fit.

I forget what we concluded on Helge Deller's alignement patches, I think
there was an idea on how to address the alignment through other means.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab

  Luis

