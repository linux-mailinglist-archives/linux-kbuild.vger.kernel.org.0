Return-Path: <linux-kbuild+bounces-9079-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FAFBCE50C
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 20:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7559B4F9106
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 Oct 2025 18:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CFA301492;
	Fri, 10 Oct 2025 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hQTBFOq4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550AC30148E;
	Fri, 10 Oct 2025 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760122637; cv=none; b=jT/G/JxHeKJXsrLkjE7xufI0GxcTuwxIgRHpMy4hfB/1iOAppQiKqHtelc755/++qK5BtNWdW5icBfvVUbfNgag4MqmdsfTv6eEPcRxvO6oLU/TobHS5/pMc2RMND52w14UtiuFp904Oo0Yv04SzXuhiZKJlJBnIgTIuVtjKwJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760122637; c=relaxed/simple;
	bh=+MExs7bA7bO+eT+6/H1zG9nDTxVIAMDn8sQnB8ynYxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRr2/gALHL2UsXs0oF1VIfMfP4/zHJdNAEH8ixSiPXKHeHuQNLIgsDDhYo3Ih25oC8NROGYwEq9d2Ve9+YU9RLKl+waUMRgsnNbrrgaLU8yC1aIAnohBES1Ol2Rw6jBOOJ3YqHdG57ChxRn9qIA0nksYPj8HCp8rNIGKsBazeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hQTBFOq4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84736C4CEFE;
	Fri, 10 Oct 2025 18:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760122636;
	bh=+MExs7bA7bO+eT+6/H1zG9nDTxVIAMDn8sQnB8ynYxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hQTBFOq4vAwDmDZRWxSS1ZLWG50EsuKofUCKDSct8YjptAE7V+OEfE9K53Tlyomej
	 BllZ27hbICD4Tq1nSvXWkh3Y33jzcWVZu7IYCx58ZBfGrK5S1HEnxTW/J9FusBdBIA
	 zxV6dMRF2SQOYiRrz8ZmnZ7li6yFsUGRYlLfILHaEpYqD9aVUODe2Q8TPCF1QlpfWh
	 JpI6Fwd3zB3YxU2Mv+RN9o+8OfzIMafZd8ull+tSxkSEA61oBMNFc5oUnIMciMBlL6
	 AM/IdZn2MibmFu2hAgJRAGhxuqfgnGp3wVf3zfD3Hu0MVNDdTIeYq5Z/uBpLr27l3c
	 zbnAcEfDMuCaA==
Date: Fri, 10 Oct 2025 20:56:29 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, nathan@kernel.org,
	masahiroy@kernel.org, aliceryhl@google.com,
	thomas.weissschuh@linutronix.de, tamird@gmail.com,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v2 1/1] rust: add `rustcheck` make target for check-only
 builds
Message-ID: <aOlW3RFO9sm6IsIB@levanger>
References: <20250915115311.3025-1-work@onurozkan.dev>
 <20250915115311.3025-2-work@onurozkan.dev>
 <20250922-demonic-raccoon-of-will-1adb52@bergen>
 <20250923064720.0b2ea467@nimda>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250923064720.0b2ea467@nimda>

On Tue, Sep 23, 2025 at 06:47:20AM +0300, Onur Özkan wrote:
> On Mon, 22 Sep 2025 08:02:36 +0200
> Nicolas Schier <nicolas.schier@linux.dev> wrote:
> 
> > On Mon, Sep 15, 2025 at 02:53:11PM +0300, Onur Özkan wrote:
> > > Adds a new `rustcheck` make target to run a check-only build
> > > similar to `cargo check`. This allows us to verify that the Rust
> > > sources can build without building/linking final artifacts,
> > > which speeds up the iteration (a lot) during development.
> > > 
> > > The target also supports the CLIPPY flag (e.g., `make LLVM=1
> > > rustcheck CLIPPY=1) to run Clippy in a faster way.
> > > 
> > > Also, unlike `make LLVM=1`, it doesn't compile large amounts of C
> > > code (on a fresh checkout) when the goal is only to check that
> > > Rust builds are not broken after some changes.
> > > 
> > > Suggested-by: Benno Losin <lossin@kernel.org>
> > > Link:
> > > https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/539103602
> > > Signed-off-by: Onur Özkan <work@onurozkan.dev> ---
> > >  Makefile      |  7 +++++
> > >  rust/Makefile | 73
> > > +++++++++++++++++++++++++++++++++++++++++++++++++++ 2 files
> > > changed, 80 insertions(+)
> > > 
> > > diff --git a/Makefile b/Makefile
> > > index cf37b9407821..7812cdc72938 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1716,6 +1716,8 @@ help:
> > >  	@echo  '		    is formatted, printing a diff
> > > otherwise.' @echo  '  rustdoc	  - Generate Rust
> > > documentation' @echo  '		    (requires kernel
> > > .config)'
> > > +	@echo  '  rustcheck       - Check that the Rust code
> > > builds'
> > > +	@echo  '                    (requires kernel .config)'
> > >  	@echo  '  rusttest        - Runs the Rust tests'
> > >  	@echo  '                    (requires kernel .config;
> > > downloads external repos)' @echo  '  rust-analyzer	  -
> > > Generate rust-project.json rust-analyzer support file' @@ -1821,6
> > > +1823,11 @@ PHONY += rustdoc rustdoc: prepare
> > >  	$(Q)$(MAKE) $(build)=rust $@
> > >  
> > > +# Checking Rust sources.
> > > +PHONY += rustcheck
> > > +rustcheck: prepare0
> > 
> > Why do you let rustcheck depend on prepare0 instead of prepare?
> > 
> 
> Because "prepare" does more job which isn't necessary (therefore waste
> of time) for "rustcheck".
> 
> > > +	$(Q)$(MAKE) $(build)=rust $@
> > > +
> > >  # Testing target
> > >  PHONY += rusttest
> > >  rusttest: prepare
> > > diff --git a/rust/Makefile b/rust/Makefile
> > > index bfa915b0e588..b45878870207 100644
> > > --- a/rust/Makefile
> > > +++ b/rust/Makefile
> > > @@ -265,6 +265,79 @@ rusttest-kernel: $(src)/kernel/lib.rs
> > > rusttestlib-ffi rusttestlib-kernel \ rusttestlib-uapi
> > > rusttestlib-pin_init FORCE +$(call if_changed,rustc_test)
> > >  
> > > +## Check-only compilation (similar to `cargo check`)
> > > +quiet_cmd_rustc_check_library = $(RUSTC_OR_CLIPPY_QUIET) CHECK $<
> > > +      cmd_rustc_check_library = \
> > > +        OBJTREE=$(abspath $(objtree)) \
> > 
> > Have you tried this?
> > 
> >         OBJTREE=$(CURDIR) \
> > 
> > or
> > 
> >         OBJTREE=$(abs_output) \
> > 
> > I'd favor using one of these instead.
> > 
> 
> I don't have a strong opinion on any of them. I followed the existing
> approach from the other use cases used in the same file.

well, you're right, it's not really consistent right now.

Acked-by: Nicolas Schier <nsc@kernel.org>

