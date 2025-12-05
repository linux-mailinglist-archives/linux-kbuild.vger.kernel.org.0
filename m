Return-Path: <linux-kbuild+bounces-10008-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F13E1CA8CBB
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Dec 2025 19:29:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ECEE430DC015
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Dec 2025 18:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A357345CDF;
	Fri,  5 Dec 2025 18:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pge4oVgX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065F5344052;
	Fri,  5 Dec 2025 18:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959099; cv=none; b=X0O8RGfzQe4iWqQKwPk8+8oXfwDbxsNR1jKqwRCTTAwvMq8/47dMNCr4CWGMjyIfiFQlpVQ0Hz7sgRB2l1TSaqR7hQDoj3bRg31cTHQEuUIwySMro85QnGfDVbsjPHNxpQqyGqSZbwbkLd/gkAR56DJYFUi6kydTFlL5viIfAfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959099; c=relaxed/simple;
	bh=r/JH27NDiyw3W5ATKUx6/ZGSbvRvNIzMvvKpuXPXYxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7K1q9oey2MYzwlglTR33TdWZKOMIsGpT8gtzEe3YIM+PFPyX1hxOxNqv5uQdmHOEV1nKKYFyib1ZCHSGZAeZvX49yehERvAjiZQqh8w8DUxQ4rPpThdJJ9rzhLs7BcAvRQBCTJahVojkjjChbdoFqgmEqT8Z3bqlznn42yv6CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pge4oVgX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B05C4CEF1;
	Fri,  5 Dec 2025 18:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764959098;
	bh=r/JH27NDiyw3W5ATKUx6/ZGSbvRvNIzMvvKpuXPXYxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pge4oVgXs8EVQ7NXocjYKUE8BWTnyYnXPrYwu93epdS6UmUQsxobi8bGssXothI0/
	 5ONjhmsbu1NnNc1wUK41ibAPm7UQTx0i2ofO8piDN7+B+AQCTeMAa5H8gRJpzQ3RCD
	 SNx8iNx91ZxZh+3dNGGtRxwXs0VV3rszkJPDPBH0nbIpokhkTb9wARYHYEOe4I6Dd9
	 5tsFraBqTPRDf3sjyGg6DivzsnvKtfToN8FroJMV1osqd3XCwPMyGvwuQVrDYdQSe5
	 S6CbZfKjeK82qpDeiWOV9oNY58JpZ3H+3n2NJdNGy6dsvhTLb/1aeBQsbuD+jpMJnp
	 hnQifZ78BncYQ==
Date: Fri, 5 Dec 2025 11:23:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Graham Roff <grahamr@qti.qualcomm.com>, Nicolas Schier <nsc@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v2] Support conditional deps using "depends on X if Y"
Message-ID: <20251205182334.GB3974306@ax162>
References: <20251118-kconfig_conditional_deps-v2-1-e360792edaed@qti.qualcomm.com>
 <20251205015352.GA2060615@ax162>
 <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4be7637-9446-47d0-9a8c-3fd0f55a27b9@app.fastmail.com>

On Fri, Dec 05, 2025 at 09:01:51AM +0100, Arnd Bergmann wrote:
> Agreed, the question is whether a small improvement in
> readability is worth the complexity of having multiple
> ways of expressing the same thing.

I think the biggest thing that this patch has going for this is that
there is minimal additional complexity within scripts/kconfig and that
it basically internally converts the 'depends on ... if ...' into the
simple 'depends on' so there is no behavioral difference. The diff stat
of the core of the change speaks to that I think.

 scripts/kconfig/lkc.h    |  2 +-
 scripts/kconfig/menu.c   | 12 +++++++++++-
 scripts/kconfig/parser.y |  6 +++---
 3 files changed, 15 insertions(+), 5 deletions(-)

> I don't see anything that the new syntax would allow
> that we were currently missing.

I see this as syntactic sugar. It is just giving users a different (and
possibly more intuitive) way of expressing the same thing but I
understand being concerned about people misusing it (even though I think
it is already hard enough to get dependencies right sometimes).

> This is the bit that frequently confuses developers with the
> current syntax, and I agree it would be nice to have a better
> way,  but I'm not sure the proposal actually helps enough to
> warrant a mass-conversion of existing Kconfig files.

I do agree that the 'depends on A || !A' syntax is confusing and that
this does not really address that but I think that is besides the point
here. I also agree that it is probably not worth converting existing
users to this syntax (unless there is solid reasoning), I would not want
to see cleanup patches of that nature, just use in new code.

> With the existing syntax, this could be expressed as
> 
>       depends on FOO = BAR
> 
> or
> 
>       depends on (FOO && BAR) || (!FOO && !BAR)
> 
> and I don't see how the new syntax is an improvement
> over these.

Maybe the "if" syntax could be easier to understand with actual real
world values? I cannot think of anything off the top of my head but
real world dependencies might read a bit more naturally with this
syntax.

> Overall, I'm not convinced by this patch. I have no strong
> objection to anything in here, but I'm worried that extending
> the syntax adds more problems than this one solves.

Thanks a lot for the input!

Cheers,
Nathan

