Return-Path: <linux-kbuild+bounces-4707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B079D1B14
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 23:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B0AE2859C8
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Nov 2024 22:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37EB61E7C11;
	Mon, 18 Nov 2024 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CaEUs9iT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6FB158DAC;
	Mon, 18 Nov 2024 22:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731968708; cv=none; b=ChfY1aksxIYuRjAHSGoD4Jb0OscxpZ7dy9nEhYErhZRBS2SvPOyAmVGaCyayCBCuheMMYU7a0Xl86qSCMuz2JOpKomebOJ+jHFrR1qor3edFCQX1cyzZEw095ptYEgKW/GaQat8TtZxBHneX7WhFM7Q+Sh9TfLwByQIsGZ8BAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731968708; c=relaxed/simple;
	bh=ddPu5M9TE4ztBRt5Cq5MpiKHQ4M9ux9latV4D7SSYOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1StCFkXM+cpUWaLpOdP/gZWjKfOyl4HwbgXuUFZsRBIBqnO/Oz2qnQ43f+RqGby5MSShiEYZinVwhM9itCSfUYNauz3AtJAXrqHiIUhZIKpGLZh44aLDSjLIqzseu31MK6BjOl2bf/ENCqlrtCM2R899e/hJK4XN1kHem5Jodw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CaEUs9iT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD972C4CECC;
	Mon, 18 Nov 2024 22:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731968707;
	bh=ddPu5M9TE4ztBRt5Cq5MpiKHQ4M9ux9latV4D7SSYOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaEUs9iTNyzwUIBl8ZmfjCwM/V2WWCvvSsaMht5tLzGoar3sKADM03eD7P3OBG+of
	 awp8UnXXTtN9vu4UoX6+c9RXU/AdkBkpeNcjZV8ercJa0wj9z80J7RzSYP+ZfXhOSW
	 y1KbcNY5/JgFidtHJbttFVj2sfzwYQCIHRzehexHZWrdXoq8KW3TDxiaYFOaKA/lMb
	 f6l1NcVEO5h42R3nKDIfYo5xwBZa3R/RqdMSaVTS7WV5QKVRqQR1Nw+qSaD7ZXgYdj
	 /hHpSQJVo6Av/4pl+ZfKNZf+aAZbhLYgacaQ+ydGYnWk3agBjY68P7U03H6NvkfulP
	 KxCI9kiryowuQ==
Date: Mon, 18 Nov 2024 14:25:05 -0800
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
Message-ID: <Zzu-wfGqbuAm24yg@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
 <ZyNr--iMz_6Fj4yq@bombadil.infradead.org>
 <CAGSQo00F07viDHQkwBS8_1-THxJHYwx9VkS=TXC5rz3i8zSZSw@mail.gmail.com>
 <ZyVDv0mTm3Bgh1BR@bombadil.infradead.org>
 <CAGSQo02uDZ5QoRMPOn=3Fa9g5d+VPfKW-vmSsS2H+pOdPYCBFw@mail.gmail.com>
 <ZyrRYUD0K1f7SwWg@bombadil.infradead.org>
 <CAGSQo03+1WjUVj-iQ6zdOST6z=p+=OqS2Xk_c4ZUdHOsxa7g2w@mail.gmail.com>
 <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zy1BVXgnT72Jt_HE@bombadil.infradead.org>

On Thu, Nov 07, 2024 at 02:38:13PM -0800, Luis Chamberlain wrote:
> The only thing left I think to test is the impact at runtime, and the
> only thing I can think of is first we use find_symbol() on resolve_symbol() 
> which it took me a while to review and realize that this just uses a
> completely different ELF section, the the ksymtab sections which are split up
> between the old and the gpl section.

Thinking about this some more, if we're going down enabling a new
option, it seems to beg the question if the old *two* ksymtab sections
could just be folded into the a new one where the "gpl only" thing
becomes just one "column" as you call it. Reasons I ask, it seems like
we're duplicating symbol names on ksymtab and for modeversions. Could
you review this a bit?

  Luis

