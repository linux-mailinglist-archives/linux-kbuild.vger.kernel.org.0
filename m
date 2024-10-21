Return-Path: <linux-kbuild+bounces-4216-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4639A7290
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:44:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 766FB1C213B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 18:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D16C61FAC37;
	Mon, 21 Oct 2024 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQm8I2/m"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0C578C76;
	Mon, 21 Oct 2024 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536273; cv=none; b=hePdbmKH6W726jPT51/2wp+4gt/y6JxQ5ZRqRP5DO2TlpbuSBX/5PJxG0rSu0CLRGAxjM7H2ZR3aTKxGSmXMjRmVvnItjUIMidzktpVPigQ3/hvsxHwg2xeEDjt3B2svya0jU4/gH4gowb6oBQxXLtWjA3dkSW2ASukV/f7FH3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536273; c=relaxed/simple;
	bh=bm05TRGC4RzzFpXYGxFW46MniU6yPe/nV2EgssZ3oV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkN4xGCeA2X8nEYPCNOv+2Ef++Atl2470f1f9NdDii7ARDsmRu55Fxz7ddKgvnRVaL9IQrBWkeZeQfJu49tzDmYA+enpZH2kP7nzAjaen/DQjeEPFQ/OwH8/G+6/RiAsIEvEK79vPwDd4bnbJPGudzQrPgKWw4j4ICQ5GG09GCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQm8I2/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCD8C4CEC3;
	Mon, 21 Oct 2024 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536273;
	bh=bm05TRGC4RzzFpXYGxFW46MniU6yPe/nV2EgssZ3oV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QQm8I2/mGJAKd+fCK87nrxLPiQDaK4ssWWSN8AtsVfJfsZJYBETTy4TD4Lg9/gmSH
	 hoiL21kW+o/XAmDSTQ8tNq342QOM8lPrS6tuYDDikI9LJiS296jvO0p4cvpYt7UuvU
	 nAVor0ZqKOABGHFQihYG8Et7bzB7HIzG6RbybOz45oW4ovc6dWgfe96VTJeImuwY94
	 ZQm3dWCJ3sSaH+wwG7NmLAqwgF1e5p9D5RVrxWPxdapsYML2sFSpXy8cXJube3o23e
	 MI7iV280bp9k2Mt69U8gqMfZZJAM7taEhTBc8T496Tyq7JsgnoYn8cUEZuxCUd/6tC
	 jUcC4dayGgF4Q==
Date: Mon, 21 Oct 2024 11:44:30 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>, linuxppc-dev@lists.ozlabs.org
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Naveen N Rao <naveen@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Benjamin Gray <bgray@linux.ibm.com>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	neal@gompa.dev, marcan@marcan.st, j@jannau.net,
	asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	samitolvanen@google.com, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v6 2/5] modules: Support extended MODVERSIONS info
Message-ID: <ZxahDv5ZKdM__0sZ@bombadil.infradead.org>
References: <20241015231925.3854230-1-mmaurer@google.com>
 <20241015231925.3854230-3-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015231925.3854230-3-mmaurer@google.com>

On Tue, Oct 15, 2024 at 11:18:57PM +0000, Matthew Maurer wrote:
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

I'd like some PPC person to review this, and also please document
this under dedotify_ext_version_names().

  Luis

