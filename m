Return-Path: <linux-kbuild+bounces-8391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF232B22485
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 12:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1F9E188AC9B
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 10:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36BC12E7BD3;
	Tue, 12 Aug 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PE/h0CXL";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="d08ZUSUn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823191A9F84;
	Tue, 12 Aug 2025 10:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754994310; cv=none; b=e4lh04TXQNyYJMMk0lVK/dbRyMmhP8oDS9sAKjQzMrJCDiYHJfQl1T0F1LOdGLfhZGWrI8u13sOiePvTtAVVVtFbMDtPi+MLhlmbGQH3R0v/VWO7KUu4wsB7yIeY3piDlqsHmCcq7/EBLMsVsH953kOw/zFyq6Web+GHHmfpTOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754994310; c=relaxed/simple;
	bh=3h1jtYlTahoZiW9S6ipVCny34gqJSUikkQKszPkOZjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKX4DKjfpk3EMCMv3r8z16GGN84cqunhuGGOPO91E3RfUb524DUfw4JWuDbCPidi9K7UQCnXli4vrk9uy4MD09nIWTzO8LhQZo2ySrUsnKYd+e5yFdxhO1+IC3t9Pjg+ZwCG9MleU/mLGs6NujChcroPn7/RK6jWT6Rgkemais8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PE/h0CXL; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=d08ZUSUn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Tue, 12 Aug 2025 12:25:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754994306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25qTZ0NaTrHWGb9HaUnJeL7nrC5oZiUKeYs+yDJzlIA=;
	b=PE/h0CXLoDspX2fANx7Ncb8CVFtBKWb74CPFkn5FvbRq5vUh8xJ/D9+xoDDjw2LUetVzT8
	RpFfYmHz4E3F9ll02QH9VKxCKR619bMfkmV6WqHcFIAmPp5GF/3MfWHVzfN9XpuouMWbcy
	LTYQX4o1mqFChjqhce6mHGd2c1LHT3OdxDkTdY41Iqtmjd9USkMe+0lHqvTsXImXcOa5J2
	N5axkDEs5Gaslbs/leHd3B/sgbcPP4va94B8IEL4B5jnyAnhNawEqeF2G8BSBY+QypvUME
	ptD88qDUehbBo8JJI++jfkIwGJZvN5vT70WyWMU//iNP31eXpWJEGeP/t6yRnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754994306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25qTZ0NaTrHWGb9HaUnJeL7nrC5oZiUKeYs+yDJzlIA=;
	b=d08ZUSUnbOIPQl4p4/pa0+MKiK4FeI6AtekH+SuEc2o0On3Cdy1lEtjvQZ135kYlujG4F/
	FFsCjgogRVvqU1Aw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: enable CONFIG_WERROR for more build steps
Message-ID: <20250812121545-f00f588b-2239-4d96-baeb-55cbf4914556@linutronix.de>
References: <20250812-kbuild-werror-v1-0-36c9ff653700@linutronix.de>
 <CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72k-PdSH2BNgbq=X+FhpyEErifSCKfO5ObXz6bu9_J8+fA@mail.gmail.com>

Hi Miguel,

On Tue, Aug 12, 2025 at 11:21:24AM +0200, Miguel Ojeda wrote:
> On Tue, Aug 12, 2025 at 7:31 AM Thomas Weißschuh
> <thomas.weissschuh@linutronix.de> wrote:
> >
> > CONFIG_WERROR is useful for all build steps, not only compilation of C and
> > Rust sources linked into the kernel.
> >
> > Also enable it for assembler and linker invocations, userprogs, as well as
> > C and Rust hostprogs.
> >
> > Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> The Rust part is:
> 
>     https://lore.kernel.org/rust-for-linux/20240519211235.589325-1-ojeda@kernel.org/

Thanks for the pointer. We can keep the logic in Makefile.extrawarn.
But adding FLAGS-y machinery for all of the flags will be a bit noisy.
Having one ifdef CONFIG_WERROR around everything is much easier to read.

> However, Masahiro back then mentioned that we shouldn't make the C
> host flags depend on `WERROR` since `HOSTCC` builds Kconfig and, for
> consistency, not for Rust host progs either:
> 
>     https://lore.kernel.org/rust-for-linux/CAK7LNATPx2wTEM=KDmGtcH8vVTB4suOhh-CUQKP54F8wtPWDiw@mail.gmail.com/

That does make sense.

> Perhaps it could make sense to explicitly exclude certain bits, like
> Kconfig, from `WERROR`, and apply it for everything else instead.

The users will still pass -Werror explicitly, we can't filter that out.

Let's skip hostprogs for now. Another possibility would be to use -Werror
for hostprogs unconditionally. Various tools/ are doing that for example.


Thomas

