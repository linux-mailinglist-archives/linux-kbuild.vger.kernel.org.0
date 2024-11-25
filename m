Return-Path: <linux-kbuild+bounces-4859-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2809D8F26
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Nov 2024 00:27:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1DE2216AFE5
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 23:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E5C1CDFD6;
	Mon, 25 Nov 2024 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4sdpDu+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07702194ACA;
	Mon, 25 Nov 2024 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732577128; cv=none; b=pd7u/uK3Juzt2htBy/TMwUKZgvZJbbRR1suFyAsg8KoLdfge74yOfCvH1uRblIH+O4zu6wUIZuxRnS4lXer7kq7Vp1iPn8SzDvrXhS5ivayWRyhlU/XGTfHojh4VDOdPPOdKF/waOevLVkbkcpNWpMbHBr6mRZ7d1ASWAMHGK+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732577128; c=relaxed/simple;
	bh=Ef9YOhkT6dvq3u1nt9fT6DrzSKWjzvz3OpMEiybONBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EyMr8eI86ZtS3NBKcu+xZCwGEtPYfvM5gbzgAHfar6TYRSXNM44lsJjLOC/KRb1A/CJQ2Nh/QUph2EG4hhDyPc2lbRl935g1CeqO1bZ6eyPfpLn3em6LlFO1WaQ4EYohMcw7LYjbwEJcVI3TxU//Wq1OjF6ZfXHexVayGOzFRcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4sdpDu+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94BD3C4CECE;
	Mon, 25 Nov 2024 23:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732577127;
	bh=Ef9YOhkT6dvq3u1nt9fT6DrzSKWjzvz3OpMEiybONBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E4sdpDu+7U4uKBYbHed2GEqt4mz1AZox50i+VMTL3yOe2Vlwn6iksIGS+oaZ5zgR+
	 T2v9pOMKQN6AWpt0pGFj+9UnkxSMvpaXHACjzfPOKYLPdl8Y7Bh0TyX40b3h6Z7oeu
	 W6JLpiyIYTPsM2KmtkFSXDIkVfEBZrGgvBDKcn4eyj0T3MR126uvCv0Llmape3RCev
	 exSY16RQ6sDiCHqdkLrBZQixK4WgbTjdhU0DFfwogb28Y/U2UwSflm9WbelUImPLTg
	 YQhVnkAeNI6bGfszun5dCDdNcB2zYbqzaLNmDIuJF634mrHyIJ0hAdWGHISZAnrmP3
	 BYT8sC13RStIg==
Date: Mon, 25 Nov 2024 15:25:25 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
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
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v10 0/5] Extended MODVERSIONS Support
Message-ID: <Z0UHZQErgTDpie0y@bombadil.infradead.org>
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>

On Sat, Nov 23, 2024 at 02:42:14AM +0000, Matthew Maurer wrote:
> This patch series is intended for use alongside the Implement DWARF
> modversions series [1] to enable RUST and MODVERSIONS at the same
> time.
> 
> Elsewhere, we've seen a desire for long symbol name support for LTO
> symbol names [2], and the previous series came up [3] as a possible
> solution rather than hashing, which some have objected [4] to.
> 
> This series adds a MODVERSIONS format which uses a section per column.
> This avoids userspace tools breaking if we need to make a similar change
> to the format in the future - we would do so by adding a new section,
> rather than editing the struct definition. In the new format, the name
> section is formatted as a concatenated sequence of NUL-terminated
> strings, which allows for arbitrary length names.
> 
> Emitting the extended format is guarded by CONFIG_EXTENDED_MODVERSIONS,
> but the kernel always knows how to validate both the original and
> extended formats.
> 
> Emitting the existing format is now guarded by CONFIG_BASIC_MODVERSIONS,
> but it is enabled by default when MODVERSIONS is enabled and must be
> explicitly disabled by the user.
> 
> Disabling CONFIG_BASIC_MODVERSIONS may cause some userspace tools to be
> unable to retrieve CRCs until they are patched to understand the new
> location. Even with CONFIG_BASIC_MODVERSIONS enabled, those tools will
> be unable to read the CRCs for long symbols until they are updated to
> read the new format. This is not expected to interfere with normal
> operation, as the primary use for CRCs embedded in the module is
> load-time verification by the kernel. Recording and monitoring of CRCs
> is typically done through Module.symvers.
> 
> Selecting RUST and MODVERSIONS is now possible if GENDWARFKSYMS is
> selected, and will implicitly select EXTENDED_MODVERSIONS.
> 
> This series depends upon the module verification refactor patches [5]
> that were split off of v5 (now in modules-next)
> and DWARF-based versions [1].

Thanks for doing all this.

Acked-by: Luis Chamberlain <mcgrof@kernel.org>

 Luis

