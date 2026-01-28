Return-Path: <linux-kbuild+bounces-10921-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNWsGHiHemkE7gEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10921-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 23:02:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E3DA9582
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 23:02:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 996833018D58
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jan 2026 22:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5D99341653;
	Wed, 28 Jan 2026 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rO7foRxJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171C341056;
	Wed, 28 Jan 2026 22:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769637744; cv=none; b=OwBQRdr5htetUqkIHwD4ocTJ5C5HDj3biIQVe2wj8P9d2zvFA2qb9ifjKWLGrVj275y4piPbLTLf1wC72mnYfgFRVXrxISVRgsZJk4QC+wA+fr9TRJLEJlvBgtl+BCL3V6bSxQxyBVpll34kVIjDpsQiaq2vqz5Iw7a5Id46WDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769637744; c=relaxed/simple;
	bh=p3Ov9GAWmc7miJdCYyGL4Sq5/XQCePT1md0p6UZP2ic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZqjohDHVQx/tFDKlxcl0U46Vsxm9Ss+O7eRcRMe64GVpI5x3IVRvM9BuALJT1Dx3YaMAQjIlhqx61CqPsJNOwVTOKBjEkYtkvFZ/DdZjAV0oF5QGHhWVhpY44hEbXkptVQg8V0of04GtlFNJNLzeC7hKpH7L6EcW3JoKKgjk1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rO7foRxJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97859C4CEF1;
	Wed, 28 Jan 2026 22:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769637744;
	bh=p3Ov9GAWmc7miJdCYyGL4Sq5/XQCePT1md0p6UZP2ic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rO7foRxJTLPHd7EFmeFADSjhcLf68oqo1bXtvO276v0tpiQsHqoDKl3Z0sZDYap7t
	 oydPLH8RBKr2xqRKSq1kNRdbC/KxMHWJfc5Bs3h22MxttrBp1njG4p1Ihr2nJaetTs
	 oP4/2edOoXnbb/r3/tCwp1HMuxeuzicVNtonlF3UXOzUQCFGOVjccp8hfclO2o8GGx
	 uzxpMsVGixvOKTxDevSSkBn/1L4CuyWoQv2AJc7UAaqnPls0dpZ4hD7krNH9xEX7OJ
	 aTCWZkvUNwAFBcGKjxj7bLUPm1oupEZ2pvi3AXEFzfIwHDnrcxTSmsJeD7CTEW1eoo
	 5xG1bDHuAJwIQ==
Date: Wed, 28 Jan 2026 15:02:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Gary Guo <gary@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
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
Message-ID: <20260128220217.GA2129077@ax162>
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
 <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
 <DFZTOMSDPOQM.3QW4TZ52N4MKZ@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFZTOMSDPOQM.3QW4TZ52N4MKZ@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10921-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,gmail.com,protonmail.com,google.com,umich.edu,weissschuh.net,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B9E3DA9582
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 01:14:27AM +0000, Gary Guo wrote:
> It might be possible to do more detailed analysis by checking what is using the
> stack (e.g. perhaps recovery variable -> stack slots using DWARF if full
> debuginfo is enabled, or find out the instruction that first touches the

Yeah Nick wrote a Python script to use debug info to give a better idea
of stack usage to help us debug these warnings from clang:

  https://github.com/ClangBuiltLinux/frame-larger-than

It is rather hacky and feels like there are a number of corner cases
where things don't look quite right but it is better than nothing.

> specific stack location and map it back like that), but doing so is quite tricky
> and the marginal benefit is less than pointing out there's an issue to be
> investigated in the first place.

Does Rust have the equivalent of '-Rpass-analysis' from clang? There was
'-Rpass-analysis=stack-frame-layout' that was added in LLVM 16:

  https://github.com/llvm/llvm-project/commit/557a5bc336ffb9b03c53d4d13fd8f0bc9418ec96

I assume that could be used from Rust as well since it is in the LLVM
backend? It does not necessarily show exactly where the stack usage
comes from aside from variables and spills but still, some information
(especially accurate information at this level) is better than nothing.

Cheers,
Nathan

