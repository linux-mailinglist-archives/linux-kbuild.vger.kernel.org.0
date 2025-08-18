Return-Path: <linux-kbuild+bounces-8511-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18ADBB2AFB2
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 19:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E40AC3B0028
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Aug 2025 17:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 271492D249D;
	Mon, 18 Aug 2025 17:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPqa6xHS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9442D2482;
	Mon, 18 Aug 2025 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755539141; cv=none; b=JR4y92x1poeSZVj0HccyL+BP/c1K+heV4TPLHYpOFqfvSzQiJ40rtCHDVaqR46GK4KxSIanNdPd6m1QGPyF71G8KgvyoIRzkHCCkj7zfBo6v+MiRpHKrPNxuNjn4qOnN8LH7nTPFfEFg7tBwLSwVckPwPmRXoffcJNSO5u32BL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755539141; c=relaxed/simple;
	bh=/0zTTKXt/OG6Gkqe1EYCJtKDJatQuVsFWZAA+MdLepc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G/9x0TYeJ0uuwA0Q3ANlA/mh13YBbES+GJdCixc8tdBubiN0EouBE9YZ8lFDW/Ef08HPhSjBpV4v+FEsGP6ZXzp5/E/3YoimVLlLwdDdPis9asP9pPymxFushfN2/41L3N1jiF5YL1sdqexf7LOrRAhYi13kCZGgrhe/SBbgf9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPqa6xHS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DE7C4CEEB;
	Mon, 18 Aug 2025 17:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755539140;
	bh=/0zTTKXt/OG6Gkqe1EYCJtKDJatQuVsFWZAA+MdLepc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPqa6xHSGlQ4Bazqv87/s75htZcc9FLlrLVZy5XreGafx7G7mH42oTWY5wM/EsMlr
	 zcQfGVLpNoZKwOuLEyIjpsynp2dFcFUryLRUe14luwdAFGMzmTPsDP8IiGXxsCyulw
	 iJGrf0x5UzFuu25oH13HnsrgHd9Jxw+pkjGjfJJSU17gPwWdH07I/PDrlcDwW6EZTR
	 Xi/T5IzdX4U8fnvC95CWm3fCvmOTxrhdDNQNK+nHAkWzk6FmwvSgGNx/xBagVkP6uP
	 4+httNXVwQKbspa/BfGyeXFThMZKaBDDOTDt4aCOYcIjT0YxiDMObCuc9jj1uZSzBY
	 DXtvEP50qt0Bg==
Date: Mon, 18 Aug 2025 10:45:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Message-ID: <20250818174534.GA1261249@ax162>
References: <20250814-kbuild-werror-v2-0-c01e596309d2@linutronix.de>
 <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <CANiq72m+_QK1L2bnjs-oB9fmoGb-1jK3JvOsuH3nsWaPM0ExNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72m+_QK1L2bnjs-oB9fmoGb-1jK3JvOsuH3nsWaPM0ExNg@mail.gmail.com>

On Sun, Aug 17, 2025 at 06:31:06PM +0200, Miguel Ojeda wrote:
> The discussion was on patch 0, i.e. the next message in Lore's tree
> view -- I would suggest adding it to the commit message for reference:
> 
> Link: https://lore.kernel.org/rust-for-linux/CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com/
> 
> Anyway, since Nathan already applied it, and I see a couple patches on
> top, no big deal if it cannot be added.

I dropped the top patch due to a build failure:

https://lore.kernel.org/20250818140143.61b8c466@canb.auug.org.au/

So I was okay with just rebasing the top commit to amend this one,
especially when giving more context to the patch. Thanks for the
suggestion!

Cheers,
Nathan

