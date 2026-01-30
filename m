Return-Path: <linux-kbuild+bounces-10941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHoKK44vfGkOLQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10941-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 05:11:58 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D376B704A
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 05:11:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5262C301E3F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 30 Jan 2026 04:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A36F365A09;
	Fri, 30 Jan 2026 04:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyqzWqQ5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92E3348465;
	Fri, 30 Jan 2026 04:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746261; cv=none; b=M/akSk+wOEYF+ic+XdoACDVrsT1en3Lo0VfCizmN2tN+ssVw+ifbsbrnmBiVwbc1DEtrGI3UXGI3od6Zz85cXG6arlzwPif8aS60Mzbn8XphMdqD9u60xfPfyLdWX0VXh9b/ZzCZKs7VKzTMqwh6Czi4SW48kSlqhexmuG35Deo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746261; c=relaxed/simple;
	bh=Bn6iAU03JB+263uZLlO4V3SA6I86qMf/SHBAhDrsYc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LohrwKzl+Ow3t/5M3uvDPGso5fJHM7RivPHY/G0Tj/W/BoTk4cWVy4zuaN9228UDXVjPzWUXUUOkA2p6IvbWtn0Jv0nAgSkAA9SL2AK6IomEG8dWTNqcfbgiRmKAiIUBTX4/YaeklRkoZpDjsLmVMe6TjwSyOCwwx7uvyMM58xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyqzWqQ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A06B5C4CEF7;
	Fri, 30 Jan 2026 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769746261;
	bh=Bn6iAU03JB+263uZLlO4V3SA6I86qMf/SHBAhDrsYc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZyqzWqQ53c4rohZ2RClnHkjp5ifyenwI02pK15E1R5R/fyuxJFUCXQZYEnwgfOIwm
	 E7rGzHeXxy+JTH5qu5WiO8bFa6SpfL3qDcmm22vXAX0GV+WsK2qoLTHKOXTcx5fpRv
	 ebyUvhj2ByVCyF6myOp/9palVCFBL+3qRN9myg3GdvM6WKSbk3i/LBCZ06fCTv/oTm
	 Somd8jqGF9iAZYk6/MBS5Iz6E4P8Vma6/bYaxOGmTmo6wAfnQeKDf9n0G/pA9o2nAX
	 YQ/eqeR8Wcqao2D0hiVJNa/hWkgl/C4EByUz3Epk1OrWbA1bdZCrp+k3VTEj9pYrCq
	 Vu0Ox/YnCe1gQ==
Date: Thu, 29 Jan 2026 21:10:54 -0700
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
Message-ID: <20260130041054.GA528072@ax162>
References: <20260127172330.1492107-1-gary@kernel.org>
 <20260127172330.1492107-3-gary@kernel.org>
 <DFZSRE43IHOU.2OZNE9IFIO3UB@nvidia.com>
 <DFZTOMSDPOQM.3QW4TZ52N4MKZ@garyguo.net>
 <20260128220217.GA2129077@ax162>
 <DG0NZIBS97TA.1C8VH8IUQGR3B@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DG0NZIBS97TA.1C8VH8IUQGR3B@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10941-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 0D376B704A
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 12:59:13AM +0000, Gary Guo wrote:
> > Does Rust have the equivalent of '-Rpass-analysis' from clang? There was
> > '-Rpass-analysis=stack-frame-layout' that was added in LLVM 16:
> 
> No, Rust doesn't expose such mechanism. As a matter of fact, klint is backend
> agnostic so in theory it is supposed to work with rustc_codegen_gcc, too.
> 
> So far I don't have plan on adding LLVM specific analyses as doing so is quite
> tricky with the modular backend design in Rust (I would effectively need to
> replace the entire codegen backend with a patched rustc_codegen_llvm).

Ah, I had not thought about klint hooking that pass. I was more thinking
that the tool could recommend adding such an option to the problematic
target's RUSTFLAGS to get the output of the pass as part of the regular
kernel build, like adding '-Rpass-analysis=stack-frame-layout' to a .c
file's CFLAGS. If that option does not exist, then that line of
questioning is dead.

Cheers,
Nathan

