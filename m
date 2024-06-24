Return-Path: <linux-kbuild+bounces-2244-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11768914F64
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 15:59:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC1181F210A5
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Jun 2024 13:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B458A142625;
	Mon, 24 Jun 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BONS/dmo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B9B1422CC;
	Mon, 24 Jun 2024 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237569; cv=none; b=WrRNIo1RokwBvTwlaAVAbEfY90RMvse05b2dnr4NQXI2mO5B9PYUWS7CzPIIjugYUZQyJAADGmoOsGLEDlYQ1Qn+mML/U3DthcXdvi0agHMeT7RsUJwlQO/VPRUTlv33QIdQqVHwAuTaJ3YrzjCTv4cFkzWPI0rLLi+Q5RIUV3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237569; c=relaxed/simple;
	bh=PHz9ID1AbaX4jCuzpUPTNRNnsrvk3q9VXc4Hy7Zq2wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r2wQmn0OAl9+At8WC8rNTKRxIhUI0hsuBBcLnw34IdJyojod07GcYzMTaugEWGW7gHHdFymPqAPhTj1alZyi4pU7U3/oFDa8v6Mrfaf6qdojDoTGTYNJNm2BGZAlOFfweRt6pq8kfGeyoU7o638lK9h+ql7Gqgy0LRVlOSqJ4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BONS/dmo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987FAC2BBFC;
	Mon, 24 Jun 2024 13:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719237569;
	bh=PHz9ID1AbaX4jCuzpUPTNRNnsrvk3q9VXc4Hy7Zq2wI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BONS/dmo3sQIsRz+JgJu2D4HwU01CZjlWkts2blz3K7Dyv0vPd26HCtvgDz7t3YnF
	 vmpf2jllVI8Gwj7wQ8zp+JnnMt1K2qXkuxHNXpfPgMZmTLWlK4wOrHF8jNM0csdY+S
	 h00BJGGjeuQKXKS6wRiHzy4MRHO3hfAjx12drCQL4yfrgZDiDRN6jr9Pz5syCOXsQ9
	 LJI8ky4fFLc1DkTUqqOYfMgechyYA5d6aoy+UnvtL5+AQYRKvF/4Xh4geDx8vPaCl3
	 PTiuvc4/3nCLDwLLFREF66bHsHrypTmm12p1ZEfpqQm1ryOrPIAxwvAgrRdw7e33mD
	 cVXqEhyw0rldQ==
Date: Mon, 24 Jun 2024 14:59:21 +0100
From: Will Deacon <will@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Jamie.Cunliffe@arm.com, a.hindborg@samsung.com, alex.gaynor@gmail.com,
	ardb@kernel.org, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, broonie@kernel.org, catalin.marinas@arm.com,
	gary@garyguo.net, keescook@chromium.org, kernel@valentinobst.de,
	linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, mark.rutland@arm.com,
	masahiroy@kernel.org, maz@kernel.org,
	miguel.ojeda.sandonis@gmail.com, nathan@kernel.org,
	ndesaulniers@google.com, nicolas@fjasle.eu, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, samitolvanen@google.com,
	wedsonaf@gmail.com
Subject: Re: [PATCH v2] rust: add flags for shadow call stack sanitizer
Message-ID: <20240624135921.GC8616@willie-the-truck>
References: <20240409103120.GA22557@willie-the-truck>
 <20240430110925.1064685-1-aliceryhl@google.com>
 <20240604142941.GD20384@willie-the-truck>
 <CAH5fLgimyYmS33EPEQb6R5Lrmkzv+0GNRE7NQwhfEaJFqb4OYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgimyYmS33EPEQb6R5Lrmkzv+0GNRE7NQwhfEaJFqb4OYQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Alice,

On Tue, Jun 04, 2024 at 04:53:16PM +0200, Alice Ryhl wrote:
> On Tue, Jun 4, 2024 at 4:29 PM Will Deacon <will@kernel.org> wrote:
> > On Tue, Apr 30, 2024 at 11:09:25AM +0000, Alice Ryhl wrote:
> > > Will Deacon <will@kernel.org> wrote:
> > > > On Tue, Mar 05, 2024 at 01:14:19PM +0100, Miguel Ojeda wrote:
> > > >> Otherwise partially reverting to the `target.json` approach sounds good too.
> > > >>
> > > >> I added the `-Zuse-sync-unwind=n` to the list at
> > > >> https://github.com/Rust-for-Linux/linux/issues/2. Given the default is
> > > >> what we want, I have put it in the "Good to have" section.
> > > >
> > > > I think we have time to do this properly, like we did for the clang
> > > > enablement a few years ago. In hindsight, avoiding hacks for the early
> > > > toolchains back then was a really good idea because it meant we could
> > > > rely on a solid baseline set of compiler features from the start.
> > > >
> > > > So, please can we fix this in rustc and just have SCS dependent on that?
> > >
> > > Just to keep you in the loop, I've posted a PR to make rustc recognize
> > > the reserve-x18 target feature, so that the -Ctarget-feature=+reserve-x18
> > > flag stops emitting a warning.
> > >
> > > This should be sufficient for adding support for CONFIG_DYNAMIC_SCS.
> > >
> > > You can find it here:
> > > https://github.com/rust-lang/rust/pull/124323
> > >
> > > As for non-dynamic SCS, I plan to tackle that after the PR is merged.
> > > See the "Future possibilities" section in the linked PR for more info on
> > > that.
> >
> > Thanks for persevering with this, Alice. I read the pull request above,
> > but it looks like you went with:
> >
> > https://github.com/rust-lang/rust/pull/124655
> >
> > instead, which was merged (hurrah!). Do we need anything else?
> 
> Yeah, it took a while, but I've managed to get a -Zfixed-x18 flag in.
> It will be available starting with Rust 1.80, which will be released
> on the 25th of July.

Great, thank you!

> A few things:
> 
> 1. The -Zsanitizer=shadow-call-stack flag still doesn't work because
> the compiler thinks that the target doesn't support it. I'll fix this
> eventually, but at least CONFIG_DYNAMIC_SCS works now.
> 
> 2. I haven't convinced the Rust maintainers that -Zfixed-x18 is the
> way to go long term (flags starting with -Z are unstable and may
> change). Some of the maintainers want to instead add a x18-available
> target feature (that is, the inverse of the current reserve-x18 target
> feature), that you can disable with -Ctarget-feature=-x18-available.
> 
> And a few questions for you:
> 
> By the time support for 1.80 goes in, we are probably supporting more
> than one Rust compiler. For pre-1.80 compilers, should we fall back to
> -Ctarget-feature=+reserve-x18 (which emits a warning, but works), or
> fail compilation?

I think we should just prevent the Kconfig option from being enabled if
the toolchain doesn't give us what we need. So there's no need to fail
compilation, but SCS =n. See how e.g. CONFIG_ARM64_BTI_KERNEL depends on
CONFIG_CC_HAS_BRANCH_PROT_PAC_RET_BTI.

> Similarly, we should probably submit a fix to the stable branches so
> that SCS+Rust doesn't silently break in a hard-to-debug way. Do you
> prefer a backport with -Ctarget-feature=+reserve-x18 or one that fails
> compilation?

As above, I think we should disable the feature in those cases.

Make sense?

Will

