Return-Path: <linux-kbuild+bounces-4524-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAB09BDCE3
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 03:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733A61C23084
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Nov 2024 02:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24BD518FC9F;
	Wed,  6 Nov 2024 02:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MIhBZjsk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05CB335B5;
	Wed,  6 Nov 2024 02:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730859364; cv=none; b=c5bj/rUu8S0qIreyl/DAED8VKi9u82OVkO9sRNu6WRGZG7OdtgrkUzcrrRPQdhyCX1Hafpd4UIhEqr4vkg4ywT/w5R0ZUUunt1vDY+0YqrOwFpt9YGIQXi1IHn56nRypzJP7i6XlB0RbpdgFD1AbporXQVfN1LvMAqWITMoufAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730859364; c=relaxed/simple;
	bh=2ceZS9atdvYQglPAeHWkMwFTe23RRaA6HdpaUHEf2oE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbAT2gD9/OD03sS214zUl44hqf0VbUqL1EIfUUlMkBX9fDhAhQa7WEppxXqZRpCH4fLfaXn9KYFMXxgP8urvAsbcwDgNO3Z7eRac8ns0NCbYl5p/K1mNTJ823JA4BL8d30FEIPEjC8cjexXOOH9Sx0Wmll3o1Bth2zc+aadrsfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MIhBZjsk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CBAC4CED1;
	Wed,  6 Nov 2024 02:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730859363;
	bh=2ceZS9atdvYQglPAeHWkMwFTe23RRaA6HdpaUHEf2oE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIhBZjsktrtesO5k1TPXMbC8XTanJSHPKWNM0vGLuOl1bFPdHdk7n8gm3zZowb5Ms
	 j32tLEsR3+YyNkxm9OWTUhs7yOStVihPojeRZG93G5LdAjLCsQVHrDmvnr1qTrY/lG
	 kc2RqvxU50wYh5cftvuGAdvuETv7RcoLj1Yu6lhwk63mW3Gqm9g/K7awIsb6HzCJ+T
	 dt8VZUHl0IFsTdAlEyuWyTf4FtZKW7jvUZsdMPvJqLQxG/S90yQP4FkYKIwQJ04qUd
	 Rh3b8+Ahy00Sir0NK1AIlbFhCBlWKtC9bHag0/Jg8Qbmx1K4OKxKSfj0c0tSPNC9K1
	 7OPXYta84teZQ==
Date: Tue, 5 Nov 2024 18:16:01 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Lucas De Marchi <lucas.de.marchi@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
Message-ID: <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>

On Tue, Nov 05, 2024 at 04:26:51PM -0800, Matthew Maurer wrote:
> On Fri, Nov 1, 2024 at 2:10 PM Luis Chamberlain <mcgrof@kernel.org> wrote:
> >
> > On Thu, Oct 31, 2024 at 01:00:28PM -0700, Matthew Maurer wrote:
> > > > The question is, if only extended moversions are used, what new tooling
> > > > requirements are there? Can you test using only extended modversions?
> > > >
> > > >   Luis
> > >
> > > I'm not sure precisely what you're asking for. Do you want:
> > > 1. A kconfig that suppresses the emission of today's MODVERSIONS
> > > format?
> >
> > Yes that's right, a brave new world, and with the warning of that.
> 
> OK, I can send another revision with a suppression config, perhaps
> CONFIG_NO_BASIC_MODVERSIONS

Great.

> > > This would be fairly easy to do, but I was leaving it enabled
> > > for compatibility's sake, at least until extended modversions become
> > > more common. This way existing `kmod` tools and kernels would continue
> > > to be able to load new-style modules.
> >
> > Sure, understood why we'd have both.
> >
> > > 2. libkmod support for parsing the new format? I can do that fairly
> > > easily too, but wanted the format actually decided on and accepted
> > > before I started modifying things that read modversions.
> >
> > This is implied, what I'd like is for an A vs B comparison to be able to
> > be done on even without rust modules, so that we can see if really
> > libkmod changes are all that's needed. Does boot fail without a new
> > libkmod for this? If so the Kconfig should specificy that for this new
> > brave new world.
> 
> libkmod changes are not needed for boot - the userspace tools do not
> examine this data for anything inline with boot at the moment, libkmod
> only looks at it for kmod_module_get_versions, and modprobe only looks
> at that with --show-modversions or --dump-modversions, which are not
> normally part of boot.
> 
> With the code as is, the only change will be that if a module with
> EXTENDED_MODVERSIONS set contains an over-length symbol (which
> wouldn't have been possible before), the overlong symbol's modversion
> data will not appear in --show-modversions. After patching `libkmod`
> in a follow-up patch, long symbols would appear as well. If booted
> against an old kernel, long symbols will not have their CRCs in the
> list to be checked. However, the old kernel could not export these
> symbols, so it will fail to resolve the symbol and fail the load
> regardless.

Thanks for checking all this. It is exactly what I was looking for.
All this should be part of the cover letter and Kconfig documentation.

> If we add and enable NO_BASIC_MODVERSIONS like you suggested above,
> today's --show-modversions will claim there is no modversions data.
> Applying a libkmod patch will result in modversions info being
> displayed by that command again. If booted against a new kernel,
> everything will be fine.

*This* is is the sort of information I was also looking for and I think
it would be good to make it clear for the upcoming NO_BASIC_MODVERSIONS.

> If booted against an old kernel, it will
> behave as though there is no modversions information.

Huh? This I don't get. If you have the new libkmod and boot
an old kernel, that should just not break becauase well, long
symbols were not ever supported properly anyway, so no regression.

I'm not quite sure I understood your last comment here though,
can you clarify what you meant?

Anyway, so now that this is all cleared up, the next question I have
is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
userspace requirements aren't large at all, what actual benefits does
using this new extended mod versions have? Why wouldn't a distro end
up preferring this for say a future release for all modules?

  Luis

