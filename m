Return-Path: <linux-kbuild+bounces-1987-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FD68FB53B
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 16:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E69001C219CC
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 14:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FB21311AC;
	Tue,  4 Jun 2024 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMQxkxwI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FC012E1C6;
	Tue,  4 Jun 2024 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511390; cv=none; b=bjHws1ApojPWOjbeTQfCQnsB9zvPR/hwlKEQn34EXyLjnzJU6u2y4ZfxMke1e9J6eAsGGVsXJcYnJV3iSkIn00T/R6Nh8woWpGFFwmb0VO8xpGks7i6edWPJ2aQMFx9ahnfco+eBJgXYeP2cshTKWP1pMoB9XwvhnS8wqzDe+/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511390; c=relaxed/simple;
	bh=RYVqR2gATEQ+i8NFnZGN6b5inLIzZ2bALRV5omE/pto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVj6HpWuQ8S2NzyoFmHuSEYC9iXsH/uq/14M3GtVfUJl7u+sDZQeJmFCaCyo5TiQ73bpVmmzlskjngi5B/Q4lwRs2FpwPZ3L4stwBjZtDvT6+NIrZvT9SUKZFZY2f2gZwEQ0wSgBW9yjwspHuowikvSAnoQ6Ghw8OmiwEuT4DOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LMQxkxwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E945BC32786;
	Tue,  4 Jun 2024 14:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717511389;
	bh=RYVqR2gATEQ+i8NFnZGN6b5inLIzZ2bALRV5omE/pto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMQxkxwItHEyc0tuHD46Cq6ZIFnI2PqRgcPo/rHiZxmQYoXWcW+z8Me6WqY4UTpfD
	 p5xGiufhACSdpulwIDjc0ROPASwruHfmhvDGJrlbuQ5SU9meMtvwCAl8OarGE6bd2+
	 gfxwVfJUUAu3EUroDavLsd7BdRTR054oPF8jtuyDlOw62e8zeX2Bgahp+BimJ5102H
	 lOcSUeEF88Y0hF+lR1V4e+KgswypSX6qb6On8mHFA4JOrX2mej4kbhWlLfQn1HcG/d
	 5IwUiGDgxSpr/+hxtVtgubCv1WC1s6TgLE4dthl42VVGbfAw3hKjoekzIXTrM1q8Ht
	 QxMsW4NONw73w==
Date: Tue, 4 Jun 2024 15:29:41 +0100
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
Message-ID: <20240604142941.GD20384@willie-the-truck>
References: <20240409103120.GA22557@willie-the-truck>
 <20240430110925.1064685-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430110925.1064685-1-aliceryhl@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 30, 2024 at 11:09:25AM +0000, Alice Ryhl wrote:
> Will Deacon <will@kernel.org> wrote:
> > On Tue, Mar 05, 2024 at 01:14:19PM +0100, Miguel Ojeda wrote:
> >> Otherwise partially reverting to the `target.json` approach sounds good too.
> >> 
> >> I added the `-Zuse-sync-unwind=n` to the list at
> >> https://github.com/Rust-for-Linux/linux/issues/2. Given the default is
> >> what we want, I have put it in the "Good to have" section.
> > 
> > I think we have time to do this properly, like we did for the clang
> > enablement a few years ago. In hindsight, avoiding hacks for the early
> > toolchains back then was a really good idea because it meant we could
> > rely on a solid baseline set of compiler features from the start.
> > 
> > So, please can we fix this in rustc and just have SCS dependent on that?
> 
> Just to keep you in the loop, I've posted a PR to make rustc recognize
> the reserve-x18 target feature, so that the -Ctarget-feature=+reserve-x18
> flag stops emitting a warning.
> 
> This should be sufficient for adding support for CONFIG_DYNAMIC_SCS.
> 
> You can find it here:
> https://github.com/rust-lang/rust/pull/124323
> 
> As for non-dynamic SCS, I plan to tackle that after the PR is merged.
> See the "Future possibilities" section in the linked PR for more info on
> that.

Thanks for persevering with this, Alice. I read the pull request above,
but it looks like you went with:

https://github.com/rust-lang/rust/pull/124655

instead, which was merged (hurrah!). Do we need anything else?

Will

