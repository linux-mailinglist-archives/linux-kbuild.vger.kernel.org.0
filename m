Return-Path: <linux-kbuild+bounces-10907-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /+G6DQ05eWkZwAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10907-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:15:41 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D299AF24
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 23:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CD67301DD91
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 22:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC1434EEF6;
	Tue, 27 Jan 2026 22:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGQsSvHz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296AB1E2858;
	Tue, 27 Jan 2026 22:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769552138; cv=none; b=cptgFchNxe69NB4BJ004o3lwJ7iSD+lQ3GebFK5nXkSlmflb2u2oEAdgsBd2bhRO6zAJvE7b0Hyp69LmkWYGGgZa5yWYktrauOn3thjnMCR3ckK75+qsxu6rH86rwRHF/KD6FzAW0XPNltAMQWxqeJ8lYCA/4HOG84tqbLVqrck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769552138; c=relaxed/simple;
	bh=rCVzcb2VqIkP6kh7ztnCGFKZ7Ne2o7rU4KtAlgh7Ul0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tq8ajCIYzpxog9YSy8B3tHalNSfwvv/QmJ9Pgdsg6L3kYhA54JrWm0XfeVfyVyYaIdtaBRUOdCbf0uOsi48EA9S4FCzeaUkpgBi2p54YHDlifnQ0l3aoGRaAxqD9A9tdUMEJ/HYcbMG+mzIG6s+m5hOJOhjJh/BaMf3JatZrOyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGQsSvHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901C5C116C6;
	Tue, 27 Jan 2026 22:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769552137;
	bh=rCVzcb2VqIkP6kh7ztnCGFKZ7Ne2o7rU4KtAlgh7Ul0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGQsSvHzp0Td6egSmgBNndHDWQRJcKEay40Au44slRqwOuyd4RaKZkMCr9j+1PQDL
	 c+CyLEpn2jGWytkoUjoSKDFsF62HOISUv0bV6Yn/DaTiK8nMcqHcBXxKDG43nse7t+
	 rpaRp487i8wnUv3FJXz2qT/gRnSXQOCxgkCWR/AUUKDzmIfrAuvBq88XBW0nSCRw1O
	 gcb0YHrwTbrAELJlYxbdtu5N5dM2AuZgSg1eYW2flEze6SKAPn/DcScDEOFyokn8JG
	 9MH6MOePj5U4KpuZm6NfhnU3GQcoi+YLg6L1E3GjF4bvT4dAf7NKSakSVlsukTMP01
	 JChtEns89k09A==
Date: Tue, 27 Jan 2026 15:15:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 2/2] kbuild: rust: use klint to provide
 CONFIG_FRAME_WARN
Message-ID: <20260127221531.GC3382807@ax162>
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127172330.1492107-3-gary@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10907-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 91D299AF24
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:11:04PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> klint is able to analyze frame size and warn on frames that are too big.
> 
> With `register_tool(klint)` support, we can simply instruct rust to turn on
> `klint::stack_frame_too_large`. This is a no-op if normal rustc (or Clippy)
> is invoked, but will perform the check if klint is used.
> 
> This is an example of a bug caught using this option:
> 
> warning: stack size of `gsp::cmdq::Cmdq::new` is 8216 bytes, exceeds the 2048-byte limit
>    --> drivers/gpu/nova-core/gsp/cmdq.rs:453:5
>     |
> 453 |     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
>     |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |
>     = note: the stack size is inferred from instruction `sub $0x2018,%rsp` at .text+32778
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Nathan Chancellor <nathan@kernel.org>

Is the limit customizable?

> ---
>  scripts/Makefile.warn | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/Makefile.warn b/scripts/Makefile.warn
> index 5567da6c7dfe..254a4d53f8f3 100644
> --- a/scripts/Makefile.warn
> +++ b/scripts/Makefile.warn
> @@ -23,6 +23,7 @@ KBUILD_CFLAGS += -Wmissing-prototypes
>  
>  ifneq ($(CONFIG_FRAME_WARN),0)
>  KBUILD_CFLAGS += -Wframe-larger-than=$(CONFIG_FRAME_WARN)
> +KBUILD_RUSTFLAGS += -Wklint::stack-frame-too-large
>  endif
>  
>  KBUILD_CFLAGS-$(CONFIG_CC_NO_ARRAY_BOUNDS) += -Wno-array-bounds
> -- 
> 2.51.2
> 

