Return-Path: <linux-kbuild+bounces-13393-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBOFCJepGGrclwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13393-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:46:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 719605F981A
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 22:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 11BDE30E3545
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 May 2026 20:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B335D30C343;
	Thu, 28 May 2026 20:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AA9ndMU3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB7A2F1FEC;
	Thu, 28 May 2026 20:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780000659; cv=none; b=pvp+w798hDDmV5T54ebPC8zsebqt4fZTNOrU8Y0uJTm1UcPyTljT0A2ZkvdnDFmkHsZmYJlENKuEHcBscvepMboJwKLB1TQGjdZN7070CU4+4rmu7mcJkopoeuG2SAr0egBtMkoZhGdb1VZM5Rtuj3J+OkSzn0L3BkUQk8XU9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780000659; c=relaxed/simple;
	bh=BUBaR61OH5hwo5vAVme5oQvFTBenP8GjAVkzI2iaeKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TD0QTM77KjabciZrrpDn7S9ziNGBMGpVcPjAmGg/hPl39EDFfUvVnLGfcxY6XH7iQsWxvdnK5u/y/W86iWQfWks8yi4CFDf3n2fqvnKQx2I712t8+dhNduCpkt9gV7qyySGaCWAchsjBbh4OpJjJ+VVZJOvVg0YR+Wq5MFzxICg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA9ndMU3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D0B71F00A3A;
	Thu, 28 May 2026 20:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780000658;
	bh=lBQFmlJkIY03bGn3z7m6Bp8+38mA0GSOezm112+0BWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AA9ndMU3ravjprEKcEuxXpb2rM9dh0TPDOq5o6abHGngUaOgI3PGtGja0PzvhnLLi
	 DoeiD7VLDPtsJcZhZERpKVOcH+DpO+lawiMFJkb9tKi+V4kosh8MgCJQX7npaDRd2L
	 kz3LL1tsEHt77w2DJDrUwkS+40ywFrR5x5YgjP1HbqBzVTCNVMdNZfVuGfzJ2ipSoJ
	 JQ4P5CYRqXc+JvVn6WDL9bR2kTUoT9Fp79HYNRTQpmrdIXWQ47WZ7b83SU+glRpA36
	 76eZJtMlPZ6/qGEzN2uR3D9pTLc5bSGDUhN8bUrLpFbhSC/L2NJkmSDyDzyyQ2VtzY
	 cf+7nWhmgczog==
Date: Thu, 28 May 2026 13:37:31 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/7] scripts: modpost: detect and report truncated
 buf_printf() output
Message-ID: <20260528203731.GB3100532@ax162>
References: <20260527-nova-exports-v2-0-06de4c556d55@nvidia.com>
 <20260527-nova-exports-v2-1-06de4c556d55@nvidia.com>
 <20260527171823.GA1893026@ax162>
 <DIUCC1RFFE10.1LJ15YI8ZHPOH@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIUCC1RFFE10.1LJ15YI8ZHPOH@nvidia.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13393-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,ffwll.ch,nvidia.com,vger.kernel.org,lists.linux.dev,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nvidia.com:email]
X-Rspamd-Queue-Id: 719605F981A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 10:23:18PM +0900, Alexandre Courbot wrote:
> Hi Nathan,
> 
> On Thu May 28, 2026 at 2:18 AM JST, Nathan Chancellor wrote:
> > On Wed, May 27, 2026 at 08:52:17PM +0900, Alexandre Courbot wrote:
> >> buf_printf() uses a fixed-size stack buffer. vsnprintf() returns the
> >> number of bytes that *would* have been written to that buffer, which can
> >> be larger than the size of said buffer if the formatted string is too
> >> long.
> >> 
> >> The problem is that whenever this happens buf_printf() currently passes
> >> this length, unchecked, to buf_write(), which silently reads past the
> >> stack buffer and copies invalid data into the output buffer.
> >> 
> >> Fix this by detecting vsnprintf() failures and truncations before
> >> appending to the output buffer, and report a fatal error instead of
> >> producing corrupt symbol names.
> >> 
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >
> > Acked-by: Nathan Chancellor <nathan@kernel.org>
> 
> If that works for you, can you take this patch through the build tree?
> I've included it in this series because it detects the issue that the
> series fixes, but it is not a dependency for the next patches. I just
> wanted to include it for context.

Sure, I can pick this one up through the Kbuild tree.

-- 
Cheers,
Nathan

