Return-Path: <linux-kbuild+bounces-4200-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8470C9A50CB
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2024 22:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99585284636
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Oct 2024 20:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB452191F66;
	Sat, 19 Oct 2024 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUrB6OvU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B28149E00;
	Sat, 19 Oct 2024 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729370735; cv=none; b=W0P45wkxrrFxVAeKyQPhEM/6qv3vps/mhfQH7xMTZe2TQLqnLx9ZKDWZnccUTdyiKiSnlyNcbSh/Iao0Kc11QbvaSPz3GNndxNR3Tlptr1wSso2GG+Eg7e3+dTpVdNFdf6GAGupbzIW9+DO/qpvtG0hnc3DtmEly2nFkCTGKnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729370735; c=relaxed/simple;
	bh=gmwDQ6No3ct9TKBBHTtT4Yw2AFEeVWE9FZaRD6OcRhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BMAFWbvZZSaVZQBTtvBYYMT6jsCZgMW6UPHCEkhgLNvjPtrEVm6moRKAFOfZyvWHZqh6fpPV4t86w+oJvvmkaO94ScJGeh9ostjiaqY61kV0Lfq4Y1ZdVxyg6c8Y8/PqpeUkDsGexZKw7/BrYKiC/wOro+Jn4F+cP0PsKYF49D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUrB6OvU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3166CC4CEC5;
	Sat, 19 Oct 2024 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729370735;
	bh=gmwDQ6No3ct9TKBBHTtT4Yw2AFEeVWE9FZaRD6OcRhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gUrB6OvUzAE3AfRej4jnJKDKbxYWz+cZRF2tn/UZIEQYCHBDOXpBVYbDfJraR7l8n
	 gQHPGSDOLU6fVoOcnonflRVT6kmlZLGBMcBzFjGdoU/5eToXxY3a2X6/CoWL8Y6Blw
	 vKtGYWIsOvdhlXC92kFcqafZsLC9tpLm7bpbk3P2Skg4OChT+D7E4n3UBt7xZTHfsB
	 ThVIQ4MslwI+4PFogaRVcMfc7eHKw/pCuD9frmWslk5PHbQLkDb3S+jXyJ1ktn0C0+
	 mYdgaWvRjSyREVgG2REjeZMLJkqmzh0Pzohff1f2PBtHLM/G7NDMxg99n+rxReWrI4
	 CLsyhOwQepJiQ==
Date: Sat, 19 Oct 2024 13:45:32 -0700
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
Message-ID: <ZxQabNukxBo3utbh@bombadil.infradead.org>
References: <20240925233854.90072-1-mmaurer@google.com>
 <20240925233854.90072-15-mmaurer@google.com>
 <ZwmlEYdS0aPVF32k@bombadil.infradead.org>
 <CAGSQo01o4fWYwSzZHX5dyTUKcaCSZ7z-hPQ8w63tgBPGbM_UCA@mail.gmail.com>
 <ZwmnnMmqVWLaelvQ@bombadil.infradead.org>
 <Zwm4lXdKB9RfPQ5M@bombadil.infradead.org>
 <Zwm4v_1wh5RwuHxF@bombadil.infradead.org>
 <CAGSQo03df-tnmwcz4nh3qtuQPKQ2zLHW0juQyKUXGsdeS7QkLA@mail.gmail.com>
 <ZxBKkJu-XPOGs-NG@bombadil.infradead.org>
 <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f3f6bd9-47d1-45fa-aa6b-9e0a80a5ebc6@gmx.de>

On Thu, Oct 17, 2024 at 02:08:19PM +0200, Helge Deller wrote:
> Hi Luis,
> 
> On 10/17/24 01:21, Luis Chamberlain wrote:
> > That sounds great. Yeah, the above would be great to test. A while ago
> > I wrote a new modules selftests in order to test possible improvements
> > on find_symbol() but I also did this due to push the limits of the
> > numbers of symbols we could support. I wrote all this to also test the
> > possible 64-bit alignment benefits of __ksymtab_ sections on
> > architectures without CONFIG_HAVE_ARCH_PREL32_RELOCATIONS (e.g. ppc64,
> > ppc64le, parisc, s390x,...). [....]
> > 
> > I forget what we concluded on Helge Deller's alignement patches, I think
> > there was an idea on how to address the alignment through other means.
> > 
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=20241016-modules-symtab
> 
> I stumbled upon the unaligned-memory-access.rst document [1].
> Please read it, as it is a really good document, and the section
> "Why unaligned access is bad" states:
> It should be obvious from the above that if your code causes unaligned
> memory accesses to happen, your code will not work correctly on certain
> platforms and will cause performance problems on others.
> 
> With this in mind, you really should apply both of my alignment
> patches which you currently carry in [0].
> 
> For parisc I partly solved the issue by fixing the arch-specific kernel unalignment
> handler, but every time module sections are stored unaligned, it triggers
> performance degregation on parisc (and other sensitive platforms).
> 
> I suggest you apply them unconditionally.
> 
> Helge
> 
> [1]  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/core-api/unaligned-memory-access.rst

You're right, I've just referred to that doc and pushed to the new
linux modules [2] modules-next branch. This is also great timing so
that the work that is ongoing for Rust will take this into
consideration as well. I'll just post the test I wrote as separate
thing but it surely can be used to help test some of this later.

[2] git://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git

  Luis

