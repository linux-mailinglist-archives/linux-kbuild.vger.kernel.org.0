Return-Path: <linux-kbuild+bounces-4721-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF489D1D62
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 02:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46013B22F4F
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 01:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F907E59A;
	Tue, 19 Nov 2024 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eem+nPyw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7218C38DF9;
	Tue, 19 Nov 2024 01:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731980038; cv=none; b=UjquZQiiV64T58QXMWJGJTS8flu+cRA9OcqKTUT+LY+qKnBxzphP65hLCQQtCnXpXjzDOIukXt2TDM0t80K9D+JAtFwlPL5pdIknro2PScueeeo9V+Ftzn7LWwNC4qEFOahEEuYa/s7NsVfYEoYFsOl+8FXlVZPNKEsiSsE3NLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731980038; c=relaxed/simple;
	bh=mNt8PlqqcC/OYquNFftD5zrdVAQF347e7lS7kQENIPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGHvV8v6g24DHP08bajX7p/qWUMPjI4cvlo1a/+ZVGwyxk7RN3jJRgUBhfbByAxPAalBl+D5iDvE5J861U4HYMCYS4li7B4E2FKxdq4enkOXNX/npNwYzNbfKOlHbtcqGaUozdIi+G48AMcA3jA2h1Chf8QcAUYdKXg8zO0/nQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eem+nPyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA7DC4CECC;
	Tue, 19 Nov 2024 01:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731980038;
	bh=mNt8PlqqcC/OYquNFftD5zrdVAQF347e7lS7kQENIPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eem+nPywW0S2PDt91tSJR5p0NMCU+bTT5JOtCmT14pE/aJodu5jgVPqbKYtMScBTO
	 4a6oEr0BIwqu7ctxPRVl4gmjUfKuyKWzV3GIlqflmoxzJTtyF3khU+bFKzkBa4W7xn
	 uS/0+gnOstSaoY32KS80dPq19n77mZfH4F+fTO9puHA/NZT0q9IKxwGIOM8SNaQ3fT
	 aEUjEhlu2kI833TKd+EX80pn6Ajw7GdGwNBKwigJWaQB70jF4DZV7h+WkWYW1nrFLT
	 VhV6Ro96JpzGjR2ogkz0k1QY4DP8MjriuHWtibLjHrgQXjIoet+kamk0xEN0GtrJS2
	 CokaAdc0f2CMg==
Date: Mon, 18 Nov 2024 17:33:56 -0800
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
Message-ID: <ZzvrBDb9tRqaPxAa@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
 <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
 <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGSQo033fha6tj7sU8se4kbNfYD_rm5sx6-hpF9s8SfcgWH3Tg@mail.gmail.com>

On Mon, Nov 18, 2024 at 04:09:34PM -0800, Matthew Maurer wrote:
> > Thinking about this some more, if we're going down enabling a new
> > option, it seems to beg the question if the old *two* ksymtab sections
> > could just be folded into the a new one where the "gpl only" thing
> > becomes just one "column" as you call it. Reasons I ask, it seems like
> > we're duplicating symbol names on ksymtab and for modeversions. Could
> > you review this a bit?
> 
>  Short answer: We could do this, but I don't necessarily think it's a good idea.

Thanks for your review on this. I agree the complexities you outline
don't yet justify the churn.

  Luis

