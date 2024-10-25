Return-Path: <linux-kbuild+bounces-4320-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D46139AF8FC
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 06:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99BF2282F25
	for <lists+linux-kbuild@lfdr.de>; Fri, 25 Oct 2024 04:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E4D318C030;
	Fri, 25 Oct 2024 04:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7VgyKlV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BDD38DC7;
	Fri, 25 Oct 2024 04:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729832006; cv=none; b=BM8lE1k9GFdFqeLI65neO4cIz4nbFUVLKwqUuGlQwsfggcgOWHcPrNAD6qwf8a5vn2bEpGA0/+UjchrBxDeiU4GfD1YV0R5tx1lKWw6YlCq38XOAbW4U0+f6AFJ06XvjpV1juEDwVzgdNrXS2iFZ9Gg+OTT4C/ePEtniDa7EuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729832006; c=relaxed/simple;
	bh=ClWmtTHHz6+T83+/vJe5JV8a/N9MZGoxPSE5eEh0muw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3ARrHnarvJZEC3Hh9mjPCUaOk0wxQq8n+SHhB83jZmHuYnQnVzfmTAN6j4IVBAZXK3d75ig3JcLAWB65h5vAd5+MMlCKhmKzAUmNXD+caTe4d0PxJwIG1K5zde0cdoCoC5NJQk6Vn33K8jNK9sthfwwsKKh3BDTWX0OgZrba+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7VgyKlV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E389C4CEC3;
	Fri, 25 Oct 2024 04:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729832005;
	bh=ClWmtTHHz6+T83+/vJe5JV8a/N9MZGoxPSE5eEh0muw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d7VgyKlVIcIldM+r1Pru/EDCtsvT70Z0k2Pwb/P3IT2T81Kcx8n17OSGJQ3YeGN0c
	 HIc2AhSbCTxg42lt3YKoI+hMiglyzCsF2fVXcirFxGnyoGVN2iDlTCDJJeKT9qCbpI
	 x7hDbMaaUBg+B8vkoIEfm0yiuZSJqz17jekmAMGyrMMXFdBMzGWhkPJheON6KVuUmK
	 oC9+sDsC3JhzSVQNRFYPGaodaK6+HGZIpPmMkEdBZVb4C9kXJ5hRKtIvW0RkK2iTFa
	 G8oxzcbcrb0CjSoAd7cfOlci4NLBOKZ0kG3hHOx08S477SK8bZjEg+Z4fTvvvy2opw
	 votRB5glKyggw==
Date: Thu, 24 Oct 2024 21:53:23 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Matthew Maurer <mmaurer@google.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
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
Subject: Re: [PATCH v7 0/3] Extended MODVERSIONS Support
Message-ID: <ZxskQx3QbkJ08g18@bombadil.infradead.org>
References: <20241023-extended-modversions-v7-0-339787b43373@google.com>
 <20241024230757.GD1382412@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024230757.GD1382412@google.com>

On Thu, Oct 24, 2024 at 11:07:57PM +0000, Sami Tolvanen wrote:
> > Changes in v7:
> > - Fix modpost to detect EXTENDED_MODVERSIONS based on a flag
> > - Drop patches to fix export_report.pl
> 
> Unless Luis prefers to deal with this separately, perhaps you can
> just include a patch to delete export_report.pl in this series?

Yes, please do the homework to check the history of export_report.pl
and just nuke it if we don't need it. Ignoring it just because it may
not be used is not the right thing.

If you don't find the history on the current tree we have the
history.git tree [0] I often use to go down memory lane pre-git.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/

  Luis

