Return-Path: <linux-kbuild+bounces-4438-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E969A9B73E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 05:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D22D1F2345D
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 04:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF63F13A87A;
	Thu, 31 Oct 2024 04:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utaJgKuW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E821BD9F1;
	Thu, 31 Oct 2024 04:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730349419; cv=none; b=lQ9gaA3xrEErGDNrK7bWJw//lUV4cfgg02kpmSnWsC0uMpzFX/dvYoyx/J1BNIfPuwSTmHcxUlhJ1Zy2eLFhAlbU8ksu2hBeafHNxBC80d0R770lVOLTD6uFrQOiAL+mGCe69sABNkPs1rW9ft96zXpvCRyehjknYCJfAlbPXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730349419; c=relaxed/simple;
	bh=crAxu3XzybivA/UWLoSfAvCkBgRP49xKq21qgkwbOd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bmJuaCpGVtcn0cje1wXryDctPyKMZJQBm4LMHK4dKbgeZocYpGNhrQ1bC0NIP2VevviyFhMmW5j+23Lk2WK/GTO7RDJctXcQQYIZGSPbG79kUBjr5KkKHv5XjJ3gNkBsnbH9WR1SXU6CKPSblXNikaiaftnnoi2ZTCNYEHb8dpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utaJgKuW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F524C4CEC3;
	Thu, 31 Oct 2024 04:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730349418;
	bh=crAxu3XzybivA/UWLoSfAvCkBgRP49xKq21qgkwbOd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utaJgKuW2qdmNpLTa9i1TAP5d7O/4PXDe8KJH+0Qc1o8S8gml/sgEWuoO3Vjf7B00
	 6jQdJ+LVR7sdYX3VctcOXYm56kdbo1l549HiA3P55LKbwfLomhaJ8HCnxIlXG746BM
	 4TrlUZDo7SHtQOic8Z+dGMHt0TeNnnmNm+EdPev5JCC9gbEMzQl7FOiFkzPQbnnFGw
	 SqVn3iIOts2sPtdfIHdgNTtd4h6R/J83ai0aiDPykuW/Z8iaLwnqsJg2zYwwByzBVb
	 eSE7dSMlDGhaIkwA++e83TYNvdDRJDCaGjlGgNcZ9cBJmv/C5EM5ao3eSAQ8QoNT2B
	 3witkW4FbfgPg==
Date: Wed, 30 Oct 2024 21:36:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Matthew Maurer <mmaurer@google.com>,
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
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
Message-ID: <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874j4tcbhf.fsf@mpe.ellerman.id.au>

On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> Matthew Maurer <mmaurer@google.com> writes:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduce
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
>   
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Michael, Matthew, why make everyone deal with this instead of just
making this an arch thing and ppc would be the only one doing it?

  Luis

