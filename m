Return-Path: <linux-kbuild+bounces-10379-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3077ECEA97A
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 21:16:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A164130194EB
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Dec 2025 20:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20C222F388;
	Tue, 30 Dec 2025 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1UtApr/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB0C1C6FEC;
	Tue, 30 Dec 2025 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767125795; cv=none; b=GKEC8feVCV+889ACpMMQvkbzQ7yjaLmJ9xG61yNn/LG0oIfm4nNMwgEVcWEXOYK1dwVbp3B1oeKtxrRjB8Csn5VNmyeIL+rNgzMGe5+v00BNH0PGkzXDF3ThhN5JsO6xq6QVVAvOmjZVMbx0XaRxPRw7APQAKoWX7U9O01RT5bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767125795; c=relaxed/simple;
	bh=TUwC6ldaq7u5mn42TBzJFdIwkCDSm+tFqiDrC4+sIVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9dgk1fhXgFdnWsIAdBF/V7ywoPLt0WY9ttKFkbuHtAiNlKp3H7DE7OITRyvotNRFFEgItC0xw2MfgLRcGUH+392zn8OWQrD4c5FUFs3JXhuy8D+X43AwvKDgXRa+yJoj7xFbJHDqVVzrbADffDN1wrVxcAOO0AGoRHJzZOKrtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1UtApr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC90C4CEFB;
	Tue, 30 Dec 2025 20:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767125795;
	bh=TUwC6ldaq7u5mn42TBzJFdIwkCDSm+tFqiDrC4+sIVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1UtApr/d1FGerz/3wrAsVlQsAu/HUTdDO1vS4GN8XC/VVT720MIfQ+7GyR3G/GCg
	 bBbVZoto7Frmy3skTNwfP1JHZE/FdbB6qe7nHLJnyWatbfkxRPgQS/hn1Y31qGb8qb
	 Dlqe3xRn+tuTEy8K9Tr0xArRa4cCEcVyuHkNZJh1LCl94dowdHBjKFX8E1B+7Vl3Wl
	 vSe1TkLB6l9SrJ7Gygems66wEpZQbmEJjLDbRMs69phun73NpUyhSOmMbJIObxD0S6
	 iPooR/L8Z6uAUYjYrIs6l3pZ5AXGsvJ09KXh6DvMCwjkvO3kXPyVvKr5/gED4aZfaB
	 5Z2JUEfhvBi5g==
Date: Tue, 30 Dec 2025 13:16:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] Documentation: dev-tools: add container.rst page
Message-ID: <20251230201629.GB4062669@ax162>
References: <cover.1766061692.git.gtucker@gtucker.io>
 <ff8da6b9680ef01ee44f6d0cf89e34dd76abb116.1766061692.git.gtucker@gtucker.io>
 <23c38222-ba4b-4728-8ad6-8bb02c5a2d3a@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23c38222-ba4b-4728-8ad6-8bb02c5a2d3a@gtucker.io>

Hi Guillaume,

On Sun, Dec 21, 2025 at 09:13:33PM +0100, Guillaume Tucker wrote:
> On 18/12/2025 1:49 pm, Guillaume Tucker wrote:
> > +User IDs
> > +========
> > +
> > +This is an area where the behaviour will vary slightly depending on the
> > +container runtime.  The goal is to run commands as the user invoking the tool.
> > +With Podman, a namespace is created to map the current user id to a different
> > +one in the container (1000 by default).  With Docker, while this is also
> > +possible with recent versions it requires a special feature to be enabled in
> > +the daemon so it's not used here for simplicity.  Instead, the container is run
> > +with the current user id directly.  In both cases, this will provide the same
> > +file permissions for the kernel source tree mounted as a volume.  The only
> > +difference is that when using Docker without a namespace, the user id may not
> > +be the same as the default one set in the image.
> > +
> > +Say, we're using an image which sets up a default user with id 1000 and the
> > +current user calling the ``container`` tool has id 1234.  The kernel source
> > +tree was checked out by this same user so the files belong to user 1234.  With
> > +Podman, the container will be running as user id 1000 with a mapping to id 1234
> > +so that the files from the mounted volume appear to belong to id 1000 inside
> > +the container.  With Docker and no namespace, the container will be running
> > +with user id 1234 which can access the files in the volume but not in the user
> > +1000 home directory.  This shouldn't be an issue when running commands only in
> > +the kernel tree but it is worth highlighting here as it might matter for
> > +special corner cases.
> 
> This part of the docs explains why things are a bit different between
> Podman and Docker.  In both cases, it should "just work" from a user
> point of view - just with some special corner cases.  Let me know if
> you thing the documentation needs to be improved.

Ah, I had missed that on my skim through of the documentation plus I did
not have it side by side with the script while I was reviewing it.

> I may add a runtime check as a follow-up to detect if namespaces are
> enabled in Docker and if so use them, but to get started I wanted to
> keep things as simple as possible.

Yeah, I agree with keeping things simple up front.

Cheers,
Nathan

