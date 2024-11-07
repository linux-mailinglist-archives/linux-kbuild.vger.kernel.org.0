Return-Path: <linux-kbuild+bounces-4567-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E89C11E8
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 23:38:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 837391F2218D
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 Nov 2024 22:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF852185A8;
	Thu,  7 Nov 2024 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6fjrNRK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC1021766E;
	Thu,  7 Nov 2024 22:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731019095; cv=none; b=D17lh+5r38YvIgsa3HnfaMsksO/4Va36QMtRF2aceBVqcHeNIJ9i8Ljjwg5e+vw+u+0piDgaHYRGUkUptJC6pAYk/RicY3gzkbm76UJq/tIrgKFyFKf6lerxnJgJ3tatGZVRhStjWhTn2Cz46WxAiMIDt4d9C0XdUxp4p6FemWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731019095; c=relaxed/simple;
	bh=1vresE0L3Nh3fHiQZbFLwAwAhjoMFFb+bTLtc7rSuxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nc9qSu8UHf3ghJZLaCh8FEcmMrywlmwBalkDM9oeuDNEL1RbTyHtVSSyuCRuuWpd5XuS8IwiEkaV+hH73loATmmuevtZI/vA2MTyXJ/wVtMDzMW97TJTXcat3ifatBA+edsYdN2SE1PVfmDR67PoGF1D9UniyB7ss4pcC3eAF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6fjrNRK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B13FC4CECC;
	Thu,  7 Nov 2024 22:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731019095;
	bh=1vresE0L3Nh3fHiQZbFLwAwAhjoMFFb+bTLtc7rSuxI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6fjrNRK0H7rMGmtghlNMki/7KUUA3JkXKRGsBeHjc8CCMykYE+gcyamhcLzNFUT1
	 TPYgWtKUP50fWbzpvceAl/y5Ye4PI2/vVF6v7d6Pl7Rht23wGL+oFVUf+kZhHuu/IV
	 ZH8w2RYM443JXE4j0c8o+9E4dp8pF0UsmJ7MqlFMQ2yfFxsVDPfqDvcJf1SeEyEToy
	 qrfZ3HAy0D1q7aqZraUuZCbf8JBqF9MW2YrBZ+AWwcSlYW7d5pitli87r1Hw4CzJnZ
	 E6F8nkrNVLvi3VEEhCM5zPRItjpua5G9swipPx81U9fpAJbRA43qT1QJTXvjO14r6h
	 XJ5/Mq96LOcZQ==
Date: Thu, 7 Nov 2024 14:38:13 -0800
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
Message-ID: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>

On Wed, Nov 06, 2024 at 02:19:38PM -0800, Matthew Maurer wrote:
> >
> > > If booted against an old kernel, it will
> > > behave as though there is no modversions information.
> >
> > Huh? This I don't get. If you have the new libkmod and boot
> > an old kernel, that should just not break becauase well, long
> > symbols were not ever supported properly anyway, so no regression.
> 
> Specifically, if you set NO_BASIC_MODVERSIONS, build a module, and
> then load said module with a kernel *before* EXTENDED_MODVERSIONS
> existed, it will see no modversion info on the module to check. This
> will be true regardless of symbol length.

Isn't that just the same as disabling modverisons?

If you select modversions, you get the options to choose:

  - old modversions
  - old modversions + extended modversions
  - extended modversions only

> > I'm not quite sure I understood your last comment here though,
> > can you clarify what you meant?
> >
> > Anyway, so now that this is all cleared up, the next question I have
> > is, let's compare a NO_BASIC_MODVERSIONS world now, given that the
> > userspace requirements aren't large at all, what actual benefits does
> > using this new extended mod versions have? Why wouldn't a distro end
> > up preferring this for say a future release for all modules?
> 
> I think a distro will end up preferring using this for all modules,
> but was intending to put both in for a transitional period until the
> new format was more accepted.

The only thing left I think to test is the impact at runtime, and the
only thing I can think of is first we use find_symbol() on resolve_symbol() 
which it took me a while to review and realize that this just uses a
completely different ELF section, the the ksymtab sections which are split up
between the old and the gpl section. But after that we use check_version().
I suspect the major overhead here is in find_symbol() and that's in no way shape
or form affected by your changes, and I also suspect that since the
way you implemented for_each_modversion_info_ext() is just *one* search
there shouldn't be any penalty here at all. Given it took *me* a while
to review all this, I think it would be good for you to also expand your
cover letter to be crystal clear on these expectations to users and
developers and if anything expand on the Kconfig / and add documentation
if we don't document any of this.

I'd still like to see you guys test all this with the new TEST_KALLSYMS.

  Luis

