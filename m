Return-Path: <linux-kbuild+bounces-4061-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B3599AE98
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Oct 2024 00:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FBCF1C21693
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Oct 2024 22:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AC141D1E79;
	Fri, 11 Oct 2024 22:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pcN6ikuo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E332A1CFEAD;
	Fri, 11 Oct 2024 22:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728685332; cv=none; b=ZFd1eAcxUAxp8ROKVv+bH672VLx6QuYkw1NsIUICFaLWSU/ew+9rtBp66HdwHNb0YQGZMRPU0UDgmsOnBxQsQqfboLw05MV9SIlVhxhRNAhtrPXJ6ckBT9TANkW5ipPW7jFi7n33jc1uXD/JRVlR2DDUqcGIFyxgfHnh4LedqNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728685332; c=relaxed/simple;
	bh=5olLXSZ89FpxCn4+GMLE3sVaUDfyIAgUMN4KPakNJ3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LU3a4EtjMiANuwW0UDe6mzK2ppxCkVAOZ3t7SgdqmhdWG90efcxgSY2ur/6LkVC94EA4ZXGpqsxz5hdoJmbavHyzWCYqFYKX3OGd3JyphOlN0IOksbGWldfvyif8uqPWZtkbAvm6m1/Cj40vLdqTWeQ1m3mLGaL3L4j4wLXwweY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pcN6ikuo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA63BC4CEC3;
	Fri, 11 Oct 2024 22:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728685331;
	bh=5olLXSZ89FpxCn4+GMLE3sVaUDfyIAgUMN4KPakNJ3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pcN6ikuoLar19vMRfs0vbt+MzJX5NNXLuD0WdJMnsLHRkqKdxaw5UoyC8kkpcQUDG
	 N/thjtFZnL2R7fry55PrFTl2tvxKrpcvbgK3Lvl1x7uoHDAhBEd4jrNhOOIx3zyp7r
	 qjLicXuLaqXdQB+xPmq4kkW3y/GX8xDsVq8KafbEBPJBMB7AzjtEzSoBnHUnkridqE
	 qYESZPVrpeLD5gsbTgyvkoEzEmYtfDN1rBaCbS1CpEPWankb6ObLoapBlyO81PnuM1
	 QYTRHJ7DJAblD0D9CGz/aZIJ8Tkn+4W1k/ltc7ZY+20gmDhHD7JxIkT2/XND1/Ck+M
	 nilw1JNGPsIkw==
Date: Fri, 11 Oct 2024 15:22:09 -0700
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
Message-ID: <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925233854.90072-15-mmaurer@google.com>

On Wed, Sep 25, 2024 at 11:38:29PM +0000, Matthew Maurer wrote:
> Adds a new format for MODVERSIONS which stores each field in a separate
> ELF section. This initially adds support for variable length names, but
> could later be used to add additional fields to MODVERSIONS in a
> backwards compatible way if needed. Any new fields will be ignored by
> old user tooling, unlike the current format where user tooling cannot
> tolerate adjustments to the format (for example making the name field
> longer).
> 
> Since PPC munges its version records to strip leading dots, we reproduce
> the munging for the new format. Other architectures do not appear to
> have architecture-specific usage of this information.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>

I'm all for the ELF validation work so far, all that was nice, thanks
for all that tidying up. This however is not considering when we really
need all this at all, and not making it specific to the build times when
such things are needed. That is, yes I'd like to see the need for this
clearly explicitly defined through Kconfig, a *select FOO_FEATURE* for
when this is needed. No need to extend a module with bloat if we don't
need it, likewise if a kernel was built without needing those things,
why bloat the modules with the extra information?

  Luis

