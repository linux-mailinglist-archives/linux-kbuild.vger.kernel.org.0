Return-Path: <linux-kbuild+bounces-4463-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B42C89B99E2
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2024 22:10:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E58131C21BB4
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Nov 2024 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C6171E282A;
	Fri,  1 Nov 2024 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnxqZhlL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D011E2007;
	Fri,  1 Nov 2024 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730495428; cv=none; b=SidNQLjx9ODzwdclX/eYNVoQ8x+QhQyFnTr/bF/6PWu61LqywkujgjXsNKMAse+qftf8PQJmnOlAQeAGcj4u7EcSU6YgivlIe5m0nTGoSdPenwQ5l8MyVQNXIwNQXLTpZGAP8pvee9ZcdFt5tTkv4rOdWIUIYZxmCGFZG6kDjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730495428; c=relaxed/simple;
	bh=iyoQ0SoznYC5xCs0wEiyKZlGiMYOyU/gfF8eEWA0h94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZRAzhJmslsGIuWaZ5iuqUR/V1IQPs5uaWxXDMgvDpxsR2I+/cvAcLlm070obxdJgvkb3SxJKovpualVjqrPh4k3dw9FUbHgoC80+ZCCKT0QNIb6Ptv4efZesil3sEeLmt0JsQei8+tQ/ey06us2vOiFrbx8obt46gonETPCp6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnxqZhlL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 019BAC4CECD;
	Fri,  1 Nov 2024 21:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730495425;
	bh=iyoQ0SoznYC5xCs0wEiyKZlGiMYOyU/gfF8eEWA0h94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OnxqZhlLQCm4F6jRIlfQHrp3HE9n+L+dOm9rbuBMf7OdYO8rKcf1IuXg5KqhdQg7x
	 xvXAzYTsxP5HhRtcZ2JzXmr7gBdf7Kb/DxBQW1G2Jz/Dxg3S0tlb/JOy0L4J06JkXF
	 sih+G67GeO3dZQpUW/pFFmjemzwtkZ3OscUle9QSxkGkH1WjHzuprWUyCBpGA7279K
	 uE1fMVVVDlN0tQ4qomSIx+10fe1fYLWLIuMzkUnaKLzQpCuU4z1qcIUgV7qzyygpLd
	 OcPlLj0Lhu+1k/dFDb/fd+w/xz7Md5vKJHywpsoREfDnn7501JrZDpOgSbnWID/ptY
	 z/PcsRO8UinZQ==
Date: Fri, 1 Nov 2024 14:10:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>

On Thu, Oct 31, 2024 at 01:00:28PM -0700, Matthew Maurer wrote:
> > The question is, if only extended moversions are used, what new tooling
> > requirements are there? Can you test using only extended modversions?
> >
> >   Luis
> 
> I'm not sure precisely what you're asking for. Do you want:
> 1. A kconfig that suppresses the emission of today's MODVERSIONS
> format? 

Yes that's right, a brave new world, and with the warning of that.

> This would be fairly easy to do, but I was leaving it enabled
> for compatibility's sake, at least until extended modversions become
> more common. This way existing `kmod` tools and kernels would continue
> to be able to load new-style modules.

Sure, understood why we'd have both.

> 2. libkmod support for parsing the new format? I can do that fairly
> easily too, but wanted the format actually decided on and accepted
> before I started modifying things that read modversions.

This is implied, what I'd like is for an A vs B comparison to be able to
be done on even without rust modules, so that we can see if really
libkmod changes are all that's needed. Does boot fail without a new
libkmod for this? If so the Kconfig should specificy that for this new
brave new world.

If a distribution can leverage just one format, why would they not
consider it if they can ensure the proper tooling is in place. We
haven't itemized the differences in practice and this could help
with this. One clear difference so far is the kabi stuff, but that's
just evaluating one way of doing things so far, I suspect we'll get
more review on that from Petr soon.

  Luis

