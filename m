Return-Path: <linux-kbuild+bounces-11455-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBrDKEmfoGlVlAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11455-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:30:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C011AE5B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5792A3002B74
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 19:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E4D44CF3E;
	Thu, 26 Feb 2026 19:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+xVlYCd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1B444D02F;
	Thu, 26 Feb 2026 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133825; cv=none; b=MdnX62/AZhrM/wRyFLr2mDcVv/hBIogSgCD9J/j1OfWGNYbuoDXNCfMV+s9FyEyBmQU/l/KZi1J+sr4rFzytITtQ8tK2YNLLsyQ4PRFmsuNbuGhmB5drIFcLeKA9oAfEbuvHiLMpnPrIG1CKnYN9YbKRE/jvVLu4hMeX3scY1zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133825; c=relaxed/simple;
	bh=V/abh2PD06BZ9zL+iou+q/cXLDf1mI0cbexVH9eklL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFTWvrK33iK0J22AfFDbb2TdYe8x3fAGfwwBIPu/Rfct0NCiWpzwXQE4ivHXAzKnV2nBNdUw5u5SR0DtM0ZxHgCDxXEt2+ebPX0gBOZdpPJPWVi1r04iMLHT869nmaDmFr0CPiBzAwN6kR1ZInOld70S3ExPEeY/qUwpHXklx80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+xVlYCd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81622C116C6;
	Thu, 26 Feb 2026 19:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133825;
	bh=V/abh2PD06BZ9zL+iou+q/cXLDf1mI0cbexVH9eklL8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X+xVlYCd2kcX++rnawQMPmH5HSUSwPpgSUP9ZQtXTjGcx5FIDI5g/HNbAKewJzezS
	 L+rm8A6+NLA5lmDWbKwpOOdRaWlYW4qCW9h9LJKFPg/0oO8vmv+NxGqvdUNmmpaI+u
	 7pKUKM2tw8B/ee7NWy+CJjb+/PPuMjzDi9GMph7jAGroiUy7RLbt0R2e4kCvoX19Ka
	 vckOKCdHGXiypOKd0/7NazLxqojc1GupuO1Ix33F80Q3QSorD67Ohg9aptJD2g1eQy
	 8xcjtRyr0OFPm9+rCNIPavWWNiL6hsvYoEnzkrhp+iM2d69t8ZMf/d1JnhpFpXOvX8
	 LS12PDm9fD2qg==
Date: Thu, 26 Feb 2026 20:21:02 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Gary Guo <gary@garyguo.net>
Cc: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Janne Grunau <j@jannau.net>, Asahi Lina <lina+kernel@asahilina.net>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: build: remap path to avoid absolute path
Message-ID: <aaCdHs8-A99569M1@derry.ads.avm.de>
References: <20260226152112.3222886-1-gary@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226152112.3222886-1-gary@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11455-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,weissschuh.net,jannau.net,asahilina.net,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,kernel];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[derry.ads.avm.de:mid,garyguo.net:email,zulipchat.com:url,asahilina.net:email,jannau.net:email]
X-Rspamd-Queue-Id: 05C011AE5B9
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 03:21:11PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> When building with a out directory (O=), absolute paths can end up in the
> file name in `#[track_caller]` or the panic message. This is not desirable
> as this leaks the exact path being used to build the kernel and means that
> the same location can appear in two forms (relative or absolute).
> 
> This is reported by Asahi [1] and is being workaround in [2] previously to
> force everything to be absolute path. Using absolute path for everything
> sovles the inconsistency, however it does not address the reproducibility
> issue. So, fix this by remap all absolute paths to srctree to relative path
> instead.
> 
> This is previously attemped in commit dbdffaf50ff9 ("kbuild, rust: use
> -fremap-path-prefix to make paths relative") but that was reverted as
> remapping debug info causes some tool (e.g. objdump) to be unable to find
> sources. Therefore, use `--remap-path-scope` to only remap macros but leave
> debuginfo untouched. `--remap-path-scope` is only stable in Rust 1.95, so
> use `rustc-option` to detect its presence. This feature has been available
> as  `-Zremap-path-scope` for all versions that we support; hwoever due to
> bugs in the Rust compiler, it does not work reliably until 1.94. I opted to
> not enable it for 1.94 as it's just a single version that we missed.
> 
> This change can be validated by building a kernel with O=, strip debug info
> on vmlinux, and then check if the absolute path exists in `strings
> vmlinux`, e.g. `strings vmlinux |grep \/home`.
> 
> Reported-by: Janne Grunau <j@jannau.net>
> Reported-by: Asahi Lina <lina+kernel@asahilina.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/Per-call-site.20data.20and.20lock.20class.20keys/near/572466559 [1]
> Link: https://github.com/AsahiLinux/linux/commit/54ab88878869036c9d6620101bfe17a81e88c2f9 [2]
> Signed-off-by: Gary Guo <gary@garyguo.net>
> ---
> Changes since v1:
> - Restrict remap scope to macro only
> - Add to RUSTFLAGS instead of adding directly to scripts/Makefile.build
> ---
>  Makefile      | 3 +++
>  rust/Makefile | 5 +++--
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 

Acked-by: Nicolas Schier <nsc@kernel.org> # kbuild

