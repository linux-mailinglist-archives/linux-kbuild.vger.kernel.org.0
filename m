Return-Path: <linux-kbuild+bounces-11313-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAOLBCpOkGnUYQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11313-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 11:27:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C3C13BAAB
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 11:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 14E483010B9E
	for <lists+linux-kbuild@lfdr.de>; Sat, 14 Feb 2026 10:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C64D926A1B9;
	Sat, 14 Feb 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXWa29R4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC862222CB;
	Sat, 14 Feb 2026 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771064869; cv=none; b=Aol22v6JV3binBEMLwk5FIk1mDtVFcIO3dZQPaOSlrZ/qTavPBQvWWa+SNvqKK9Hs9l6EKC7L5GCc7GpOP03OFWtCQi37mwqd01eXsNZ86ej9e75RjQeF7VPbROxG9uV8S3/sTIXLtg2yZFh9PmTYfgnOqsTEZDk4qc64sKIs5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771064869; c=relaxed/simple;
	bh=qUL+b9mGENxfbv6MvcxsEUW+HTHMr8AmtCl6Y2KfNHk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=pz4XUFl+P/BuBW/goWRWlHRacuJpL/ZgmHRwXTzsLjT99tQch3MOrmB3bkFMFUD02SxFo5kyRsVpcCIs7TaGfS+d4JeH2pjhH0d1yxX5dRADc5sp+dnMeZ8cp0avosSgUATYrR4oWVDqlaY832K08oAdMP1D/ueiaAu9wvpx2ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXWa29R4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E067C16AAE;
	Sat, 14 Feb 2026 10:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771064869;
	bh=qUL+b9mGENxfbv6MvcxsEUW+HTHMr8AmtCl6Y2KfNHk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=KXWa29R4sS6XSBt7n7kPSoOXZ0HFRdXqRPRwuYs0/TdRwpKLIdmJt6mPlMkfPU3Tf
	 vTjw7sUFQXZ/MaU1/uL3onRfzXY1JyHV7l9COiZgfc/CRZ1VugOrZMVn18jgoO6Z3q
	 pk43E4TapuBJlTJK8T8kcU+9aGqueX2jp8SuMFxZJ6rw6yyvpASbcmrpc3nv5LaQbQ
	 hKMETU2KBGpKec4wWkqiSyGsvdwRGAWgGR5hONLPoRBwjMPoosgekYwQOu3lIY3SCB
	 iDVJmV4EoZ4JubTZte6dhSbrGzGyeOFLThDmvv9PtJdpwb0kDxIicbQpn+bQERbz05
	 xiuGLyGNSE4ow==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 11:27:45 +0100
Message-Id: <DGEM3IZ3FK15.DB7M5J4C91VT@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/4] rust: add projection infrastructure
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-2-gary@garyguo.net>
In-Reply-To: <20260214053344.1994776-2-gary@garyguo.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11313-lists,linux-kbuild=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 62C3C13BAAB
X-Rspamd-Action: no action

On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
> diff --git a/rust/kernel/projection.rs b/rust/kernel/projection.rs
> new file mode 100644
> index 000000000000..200d116c39e2
> --- /dev/null
> +++ b/rust/kernel/projection.rs
> @@ -0,0 +1,269 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Infrastructure for handling projections.
> +
> +use core::{
> +    mem::MaybeUninit,
> +    ops::Deref, //
> +};
> +
> +use crate::{
> +    build_error,
> +    error::{
> +        code::ERANGE,
> +        Error, //

NIT: Why not use prelude instead?

> +    }, //
> +};

