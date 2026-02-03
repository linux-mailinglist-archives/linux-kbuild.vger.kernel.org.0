Return-Path: <linux-kbuild+bounces-10980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BXBLspHgWkZFQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10980-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:56:42 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34DD32CF
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 01:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CAA70300F5E0
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 00:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070541F75A6;
	Tue,  3 Feb 2026 00:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IeUQi5Z0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792C1E25F9;
	Tue,  3 Feb 2026 00:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770080193; cv=none; b=YxgampClU0On3W2erE20KJsjIYuOKBsE8mmbAYZAthS1z0TAXG6mr7p4zwYzLeuI33wOcOtj4Pu4FN4Kf6YeG1QiNp0mVe/v4/RHSXe/W3KGurE4Tybvg4zgDJaw0cNCJOMSYz7CcZ1OvaDj8RBdRRwnXplaeJOEtJV+E7jg+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770080193; c=relaxed/simple;
	bh=IEROZKNnye2Bnwr6loqgyMgmPZIh2tbissFXhX7Jf5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xw6cwHWWi+NDHkrQSfBU9bd+LYNe1a8ETArMVqBZ/fhOFGLR0GumyS7kXr+XrGDLDwCq0pu9LEePEUPZrdC+3Wueo4UVzCVl//N678OOPqekATR8VhcFBYx0LEELe/LDOixCGHpa++0WhVqrg3ALgoOe4qlJK9AKqDNfjm8Lx8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IeUQi5Z0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B26CC116C6;
	Tue,  3 Feb 2026 00:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770080193;
	bh=IEROZKNnye2Bnwr6loqgyMgmPZIh2tbissFXhX7Jf5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IeUQi5Z0OtzC0qy4SfdpfAJE6fsndMc2BQ/NRV1Inr0zwnQLQcxjUTvnH7rw9abp0
	 pXl5tyAheNwQa2VAdMvkRmOdjwol2Sv5RuByCq61eVxbo1JCE6OJMA7q803Ix/NOnP
	 FYWHftZ4SnA03vlHJnEu1nnjU8eRhWUZW/mNDr6Jk/IBl6sWdCbGKg5ZdYMhzr//mf
	 YnC3H4OOc8poz2X9GF4x8tgpHQNPMfVojtASpPwgG4YH9xkOKJ/BYv4cv+Zmp8XtCh
	 8HY+8Km0M8g4H3INKVVABXAU0rQ0o+EEUKjDN11O0W4cykYgqVZg6Qpn+t6jzpcY1F
	 qJb0mc+ARtJwA==
Date: Mon, 2 Feb 2026 17:56:27 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: HeeSu Kim <mlksvender@gmail.com>, Nicolas Schier <nsc@kernel.org>,
	ojeda@kernel.org, gary@garyguo.net, charmitro@posteo.net,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun@google.com, dakr@kernel.org,
	lossin@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH v2] rust: Makefile: bound rustdoc workaround to affected
 versions
Message-ID: <20260203005627.GB52989@ax162>
References: <20260202222144.2689495-1-mlksvender@gmail.com>
 <20260203002116.2703251-1-mlksvender@gmail.com>
 <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10980-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,garyguo.net,posteo.net,google.com,protonmail.com,umich.edu,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4F34DD32CF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:00:59PM +0100, Miguel Ojeda wrote:
> By the way, I wonder if we would want at least a `rustc-max-version`
> function or instead a range-based one for this sort of test. It is not
> a blocker for this patch, but we may want to limit other workarounds
> too (e.g. the one below this one).
> 
> Cc'ing Kbuild since I don't recall we have that for C compilers, so
> there may be a reason for that.

I don't think there is any particular reason for this. It is probably
more that for C, we generally prefer feature or bug checks in Kconfig to
catch problems or enable features for both compilers when they are
detected or we do the version checks with the actual operators from
Kconfig rather than doing something in Kbuild.

Both a "max" version and a range-based macro make sense to me since the
range-based one could just use the min max macros under the hood.

In lieu of a separate macro, couldn't this still use 'rustc-min-version'
for both parts if it was willing to unwrap the nested ifs (which I find
kind of unreadable in their current form):

  # The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
  ifeq ($(call rustc-min-version,108800)_$(call rustc-min-version,109000),y_)
  rustdoc_modifiers_workaround := -Cunsafe-allow-abi-mismatch=fixed-x18
  endif

Cheers,
Nathan

