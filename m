Return-Path: <linux-kbuild+bounces-8997-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D082BB9161
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Oct 2025 21:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD253C2993
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Oct 2025 19:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEEDF283FE7;
	Sat,  4 Oct 2025 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtafJXa+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D312B9BA;
	Sat,  4 Oct 2025 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759607084; cv=none; b=MIgWsHUOwnavVoM7AiOYAXHodjuKZVH64pSh1M5aZSOgoPWgJd7VGtClye+RK4NRy5JNKHedC/kEpsO22gHfSFaQmGTw73yOp/PZ2NNlzUcRXe2qY7PIFTFQ3ig7oa+kMIciAPDXSZr0lY8NCeIC4TissD8XntxwnRvduJnBu14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759607084; c=relaxed/simple;
	bh=uAsY9ygYOxHGn8STIAhBXRqKDinRPK01HPTBcubbqS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NV2mCBn8zyvtZqPy6HI4ylT3Y+DOxl/wjZMuaiVnlORnLzxKCEfTX8wP2T/BD0zruc2JdxkI5dmVRMu9WlsntQb+VCF+d33KVrznqIrzM21iiI7JYIBuC21AzrjXhIyQFLRHOJAxoq6KxABsGq3MOHhA3ZCWh4SNMxiA7v7Cv/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtafJXa+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9492C4CEF1;
	Sat,  4 Oct 2025 19:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759607084;
	bh=uAsY9ygYOxHGn8STIAhBXRqKDinRPK01HPTBcubbqS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LtafJXa+UoXEYkiINesAPu79HDiEQdq79JUz4JA1c4pS9K7Rv1YRkS5KHoB2cJs0O
	 xteqjAQXBJhNT9muzVBK1kWardk6Cqe537wJISImy3468U8LKqYeKqzP+9eBN8HGuy
	 ACYHBaYbNZyY1TCJronYV2b2suZZ2uTPdYCNFcvGET2NrK2iPIm8CyDC69lyLFdyZV
	 Py9I7RJ1Gco3heQgkcV46NZ2FcFYcHPWnwbr7hHOJc5je2nhqAInFk7KrU+tkBQfmh
	 95WJ0Rq5CCkPH+3K/YrbrDDxefUX4DuoNqUbaDXh3NhsXx6j7z+eD0L07UpAtj7Ivy
	 gDnrXRoVa9gKw==
Date: Sat, 4 Oct 2025 21:17:37 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: userprogs: also inherit byte order and ABI
 from kernel
Message-ID: <aOFy0ZwUKoBC32MY@levanger>
References: <20250813-kbuild-userprogs-bits-v1-0-2d9f7f411083@linutronix.de>
 <20250813-kbuild-userprogs-bits-v1-2-2d9f7f411083@linutronix.de>
 <20250827075334-3332c08d-66f3-427d-b0b2-4460e779f261@linutronix.de>
 <20250827224935.GB414199@ax162>
 <20250828083747-e819430a-986f-4f71-bbc8-e402e339c9a2@linutronix.de>
 <20250903223131.GA2264021@ax162>
 <20251002144850-4a498f99-418d-4888-80f9-0f24c6896318@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002144850-4a498f99-418d-4888-80f9-0f24c6896318@linutronix.de>

On Thu, Oct 02, 2025 at 03:23:08PM +0200, Thomas Weißschuh wrote:
> Hi Nicolas and Nathan,
> 
> On Wed, Sep 03, 2025 at 03:31:31PM -0700, Nathan Chancellor wrote:
> > On Mon, Sep 01, 2025 at 11:51:03AM +0200, Thomas Weißschuh wrote:
> > > Exactly. The normal cases can be handled generically. For example the kconfig
> > > below works for architectures which only differ in byte order and 32bit/64bit,
> > > which are most of them. MIPS should require more logic.
> > > Also I'm ignoring x32, as it is never the kernel's native ABI.
> > > 
> > >  config CC_CAN_LINK
> > >         bool
> > > +       default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
> > > +       default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
> > >         default $(cc_can_link_user,$(m64-flag)) if 64BIT
> > > +       default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
> > > +       default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
> > >         default $(cc_can_link_user,$(m32-flag))
> > > 
> > > 
> > > > Feels like that could get complicated quickly but this would probably be
> > > > the objectively most robust and "hands off" option.
> > > 
> > > Agreed.
> > 
> > Nicolas might feel differently but this does not seem terrible to me,
> > especially with a macro to wrap the common logic, which is where I felt
> > like things could get unwieldy. Feel free to send an RFC if it is not
> > too much work.
> 
> I investigated this some more and didn't really like the end result. The
> problem is that $(m32-flag) and $(m64-flag) will expand to nothing if the
> compiler does not support -m32/-m64. So for architectures which use
> different flags the current logic will just ignore the bitness. One way
> around this would be a mapping from -m32/-m64 to architecture-specific
> flags inside cc-can-link.sh, similar to what I already did before for
> the mapping of -mlittle-endian to -EL on MIPS. But we'll end up with a
> bunch of architecture-specific details hidden away in a non-generic
> shellscript. And the interactions are very non-obvious and brittle.
> Then I'd rather have the architecture-specific bits openly in proper
> architecture code.

yes, thanks for trying and the verbose feedback.  I think you're right,
it's better to not hide the architecture-specific details.

> See my current proposal, using x86 as example below. It will require
> code for each architecture, but there are not that many of them.
> And the configuration matrix for each architecture only contains a
> relative small set of actually supported configurations.
> Unfortunately I don't see a generic way to deduplicate the flag values
> between ARCH_CC_CAN_LINK ARCH_USERPROGS_CFLAGS. Each architecture can
> use a macro if they so prefer.
> 
> When the "interesting" architectures are done we can also slim down the
> generic implementation to not use any special arguments and that would
> be enough for the simple architectures.
> 
> For the future I would like to introduce CC_CAN_LINK_STATIC again.
> With the scheme from below this would mean to duplicate all the kconfig
> symbols for each architecture again. One way around would be to change
> ARCH_CC_CAN_LINK from bool to string. And then let cc-can-link.sh test
> for both static and dynamic linking in one go and return either
> "dynamic,static", "dynamic" or "static" which then can be mapped to
> CC_CAN_LINK and CC_CAN_LINK_STATIC by generic logic.
> 
> What do you think?

Thanks for all the effort, your proposal sounds good to me and I think
it is a good way forward.

Please call out if you want active support.

Kind regards,
Nicolas

