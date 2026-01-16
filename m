Return-Path: <linux-kbuild+bounces-10619-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B9637D3882B
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 22:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 625ED3023573
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Jan 2026 21:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA48E2F6160;
	Fri, 16 Jan 2026 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n6767Caj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0E21FF35;
	Fri, 16 Jan 2026 21:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768597971; cv=none; b=HUE8wVyAqk49KEO5F/XIfzdXuoWJnxSdUAFuKFLtPgiG5dwt++NxvNWyoMffyKXDPnpXG0JS9MbmOUcF+HOZ7vW+jw8vCOM1MRBqHntNLvCDpAcz3Ezc3nrVX7H5+DSelQo/7oz0Dg+ajRj4zXHi90SV4x84tmerQpTXpfE0H4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768597971; c=relaxed/simple;
	bh=1+xZgmeo1KVi2Gr/Gt3xPzGxEBf6M3InqpKa/VrnSto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/vDJnDeWFy0jl4pB+5pn0n/slYahL+m7Mp/WsCg3zAfTJ9XvhErWq4LDWrlwKsZL3Zvmtldi4q0X7xDIL9EaC5VamFAgOnEw1KCJLkqaiwF9FoDoWPKUpgzokaWkqQXChJGnCR4JMuSFZacddOlfxmrhBEh1R+lVpU0puGlsr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n6767Caj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218A7C116C6;
	Fri, 16 Jan 2026 21:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768597971;
	bh=1+xZgmeo1KVi2Gr/Gt3xPzGxEBf6M3InqpKa/VrnSto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6767CajHyyXzolULq6swOS5aMqmTWv7LyQxhflpcggXbnA4fhEt6R8/P4cmWtfnr
	 jgN0p1m55EJ7I5mPUS5D+p5A8BUzawwhlL+tJBc/JX9xvZrrWLWUASyk7guEN9T29a
	 bWSgLhgNDz+PigqktA0hEQ0jJFN681KS0/VUttfMAfEQpKykYO60NRyfFX976IxVcR
	 FKb10LJTeVPvlQAJCtCQIT6FJW6xVNZZ/kcRjGGy8BA6Vl5leg0jpUs1P7nIHhqY++
	 0idU/7HV+Ny4UMUije6nTeQoo93o1lQlNOtovFXl1lShgP665co8gpuJv6xNlMQe8o
	 lftxLJRlyUT0w==
Date: Fri, 16 Jan 2026 14:12:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Miguel Ojeda <ojeda@kernel.org>, David Gow <davidgow@google.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v3 0/2] scripts: introduce containerized builds
Message-ID: <20260116211246.GA1826279@ax162>
References: <cover.1767199119.git.gtucker@gtucker.io>
 <6af4b4cb-cf0a-4647-bdb8-0b2b1cb03b76@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6af4b4cb-cf0a-4647-bdb8-0b2b1cb03b76@gtucker.io>

Hi Guillaume,

On Fri, Jan 16, 2026 at 11:28:24AM +0100, Guillaume Tucker wrote:
> Hello,
> 
> On 31/12/2025 17:51, Guillaume Tucker wrote:
> > Changes in v3:
> > - Refactor common code for Docker and Podman
> > - Add docs.kernel.org URL in help message
> > - Use pathlib Python package
> > - Handle signals in parent process by default
> > - Add --shell option to use an interactive shell
> > - Tweak debug messages in verbose mode
> > - Specify Python 3.10 as minimum version in the docs
> > - Provide an example env file in the docs
> > - Update docs regarding interactive shell usage
> 
> I'm sure you're all busy landing commits ahead of the next merge
> window.  Could you please take a look at this v3 when you have a
> moment?  I believe I've addressed everything from previous reviews.

So sorry for the radio silence. I was going to try and look at this
today to give feedback before the weekend but I will not be able to look
at it until Monday. Given that this is self-contained (no pun intended)
with no regression risks, I would have no qualms with applying this late
in the development cycle.

Cheers,
Nathan

