Return-Path: <linux-kbuild+bounces-10439-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459BCFE211
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 15:01:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B85483004609
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 14:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B86318138;
	Wed,  7 Jan 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LC6hXQnM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130F51E376C;
	Wed,  7 Jan 2026 14:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794488; cv=none; b=Y/NjC3N8Q9uqW6RUNA35rnhrJ/9bP2S7IRRQWuI6+dFO4W3N7ner0In6DgeGqoGbqlYc65W9cx8463+qrUFEHNXVyVo4tRcAblu5/jW+nvY7eejX5BveCi3Q0ySuoqvXjIDe3dP5QKiHBjE9L8iPPR4FNC7NbpoIE2bvKMGzJwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794488; c=relaxed/simple;
	bh=jBG4aNk5ZWi1L4CNOgmaFLu3BODBNt1dP7Ozcg8ij/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tDSg78eoCftRy0PlE/AaMAT+qg2r3HZfBsi0cnnV/ySZNK6bRlrMRHiGfyNgitmBjsLI+0V0F8INdHPvcg+B7QQd55GLz+h/wojjoUF6YusW0sRHcpZpssAOCpr24lIKrKkI/M5hMyECxLPBOdKa9qeBOYaHNHGYxwyV1uYH83k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=LC6hXQnM; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jBG4aNk5ZWi1L4CNOgmaFLu3BODBNt1dP7Ozcg8ij/Y=; b=LC6hXQnMU/NjNO36FOTRtHoc0b
	/R9ICMbhCZtTHkS35bxXgX721Q6i3pKjMA60pANzb9P4UBUCYzR4bjTJrOFBImGAhb8rVbKgyDlI0
	fyQPiaIyjfN8SJ2QwfTKIRlPROAPEg3zkFuMjX0Ycm0wkAjRZejgQI72gS6yb8OMfoenRm6B8eNUX
	4csrD5Y2QACSnClhFglmySG3XsFDrvWSdXc5HsaLQXQs0FPAGnftGE5h0N9BFd9tugFDLAqVmol/l
	CrsnNeldt1O06d10lUU3N0XPkxb6sYRiAKq/7dtmFgKjLPhzaJPct/a4ZCNqTSThZy/KIG3b3NtYW
	87+tua7Q==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdU68-0000000DSbv-27M6;
	Wed, 07 Jan 2026 14:01:16 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 70AB730057E; Wed, 07 Jan 2026 15:01:15 +0100 (CET)
Date: Wed, 7 Jan 2026 15:01:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107140115.GE3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
 <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
 <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
 <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLgjmjjroRf-eU+4UrTPeq3HJ7QoWoCimBW-Occf_f22ARw@mail.gmail.com>

On Wed, Jan 07, 2026 at 02:42:25PM +0100, Alice Ryhl wrote:

> With this option, helpers.bc gets linked into every Rust object file
> separately (and symbols are internalized). We might want a separate
> .bc file depending on whether the Rust object files is part of the
> core kernel or a .ko file.

Right, building it twice, once with and once with -DMODULE owuldn't be
the end of the world I suppose :-)

Also, I ran across Eurydice during the x-mas break, would it not be
possible to compile all the .rs muck to C using that and then building
the whole lot like 'normal'?

