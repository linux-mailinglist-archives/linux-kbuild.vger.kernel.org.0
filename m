Return-Path: <linux-kbuild+bounces-5647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B32A2AE87
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 18:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D631883BB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Feb 2025 17:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF2C239570;
	Thu,  6 Feb 2025 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2jc8AcK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CFB4C8E;
	Thu,  6 Feb 2025 17:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861841; cv=none; b=ZNrQhbq7zojvq9zxvl8anv7CH66vwxz8rfPlS+2HFAdv8mGrkMoUYAbCdJi+37I3K6/M6cz/2UzJEylL5AAom2sPi8yle4FT4AWaX6b97/zzwF1KJtaFof7kQAPvF+0GoqQFs5GFgRO/k5jjBHXhMxqr+8GJ5BGo2bV9QnbFrwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861841; c=relaxed/simple;
	bh=NOTO4+zXZEoBsrz9z+45KaUNMnLZfNLozSWhAbN475U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sbEOm6RMVrzxWAx97z3Q9lT9ixc8rBTbk7YLiLaSzrXsASEnFpXS5M5MG0Rg8xlBhdjSx4HOhR0dw+iIDiNEECwKexB7LsZ/inejZ7pj51aNm9T0p0b0j6ViZFAIP7n029pkZWj98zHii6JuOA0kmqsC57VVZ8jVfSzu5gJC0ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2jc8AcK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C57EC4CEDD;
	Thu,  6 Feb 2025 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738861841;
	bh=NOTO4+zXZEoBsrz9z+45KaUNMnLZfNLozSWhAbN475U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2jc8AcKTg73NviSgUcSyGx9M5x2tEx6pBQCo5lUlGfPGdhQBTH7Je22/bg/sZo+R
	 2OetnZeoghyUATVy88sVrmPVoMCSarpMkh/Om4ImRTmCJ5HJ+pc0sh/nauE8prcAqM
	 9MWiNVVePgtYdzqHsYe0bugcD563Rhdj5OzFYjM1Rult+rDKbXE7Oy7Alud3Fqn6VX
	 uasHcMWgof9iFW6uf2bVi3mI7wtvH67ncVOOS35Sr4U3APieXStvavCTTDzEBdZM61
	 tnR+gmGy7jAWimr1xF3GzTvuFgEraDUakwI/+UWs9+5havil/Ctc2PzYUt7Lmd/qgw
	 h28d/5x2jJT4g==
Date: Thu, 6 Feb 2025 10:10:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Brendan Jackman <jackmanb@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 0/2] objtool: Add option to fail build on vmlinux
 warnings
Message-ID: <20250206171036.GF180182@ax162>
References: <20250113-objtool-strict-v3-0-8b51f94957fb@google.com>
 <20250114001440.cagqlvjfvw6ghsj7@jpoimboe>
 <CA+i-1C0MFQCLOah56wWQhPhtk4p0ynhxh48eTmQ0-0x+pB6fvw@mail.gmail.com>
 <20250130183042.GB3394637@ax162>
 <CA+i-1C2rw6uNOpeY8fakco8T75udRhLJLxJ4CHgJNKBhbxGa_A@mail.gmail.com>
 <20250131204920.GA1974131@ax162>
 <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+i-1C1A_0nkY6G+W3n=dYqEJHZGuEwNXK=xrWNwDh7561x_9A@mail.gmail.com>

On Thu, Feb 06, 2025 at 04:05:01PM +0100, Brendan Jackman wrote:
> OK, it would be interesting to spend a couple of hours staring at
> these errors and see if I can get a feel for the overal picture..
> 
> Also, now that I think about it I'm a bit embarrassed I didn't try
> building allmodconfig before sending this series (maybe I had
> forgotten it exists?)! Sorry about that :)
> 
> On Fri, 31 Jan 2025 at 21:49, Nathan Chancellor <nathan@kernel.org> wrote:
> > > But I can also envisage a world where that creates exactly as much
> > > work for you, just introducing Kconfig hackery for no reason!
> >
> > Such is the nature of such changes. It is not that big of a deal for us
> > to work around in the short term but it would still need to be addressed
> > pretty quickly at that point.
> 
> I can't quite parse what you're getting at here - is this an opinion
> about the idea to depend on !COMPILE_TEST, and if so are you in favour
> of it?

Sorry, that was more of a comment around having to disable that
configuration for builds such as allmodconfig if necessary to keep our
builds green. We can do it but that is not a long term solution because
we are not the only ones building allmodconfig with clang and we cannot
just tell everyone to disable it.

> My thinking is that if it defaults n and isn't in allmodconfig, the
> only people who will turn it on are those who actively care about
> clean objtool for their build. Which.. isn't really what we want long
> term, but it's better than not having the option at all and is already
> a step in the direction of something that can act as a "ratchet".

Right, I think gating on '!COMPILE_TEST' would not be a terrible way to
introduce it. We would definitely want to remove that dependency as
soon as possible because we want compile testers to be qble to find
these problems and have them be noticeable but it should make the
introduction of CONFIG_OBJTOOL_WERROR less disruptive.

> If not, I'll go ahead with the OBJTOOL_FLAGS thing. (Which is still a
> nice step in that direction).

This may still be worth doing because with the aforementioned
dependency, it would make it difficult to test with --Werror for
COMPILE_TEST configurations.  Maybe Josh or Peter have other opinions
though.

Cheers,
Nathan

