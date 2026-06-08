Return-Path: <linux-kbuild+bounces-13645-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LeW8KQP0JmqMogIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13645-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:55:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 072A4658F87
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:55:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ms6zru9d;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13645-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13645-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB62B331E585
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3228B3DD870;
	Mon,  8 Jun 2026 15:10:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351443E0226;
	Mon,  8 Jun 2026 15:10:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931401; cv=none; b=q5/6TuP3SRBbYlEkLSdPhMloQYyY1hBbWC07SuxqNl5j4xfskvsZYdaCcofVTNSVHOpx6yIScvO4tJLsr9hsP8bBTCHeUcOyZ+vi6JgdVonSyB2bwnDhzp09NoDGfiLwf2YkTCjJ31wA7Q6d221jX2Vgg6LPhYEmlg/qRc79+to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931401; c=relaxed/simple;
	bh=Vg7Xfpir9VZykMELPePz2KMn9KfiJnSKqxXQyFJcWeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuvumRbIms/jFZpb50YcPHpBKk1c0zCzzI7w44Z5wszxVJB2RTfbgt80ggHMi2hDwX2oc3cf9IBKtwd32tBBpQK4V+87Gvy3J0Z+RXX/Iv3dAaj07jaR/UYw13HuLSITmQBPeeu3jGFS69U5Vtt2kVaUXt2MKjVLSC66tX6w0Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms6zru9d; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A2441F00893;
	Mon,  8 Jun 2026 15:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931399;
	bh=VL97d33vQNJiqfoBnBzTUpHa9zMI15t87WIUCmNTdpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ms6zru9dxflVmvEipESF10Xm1mHMVZrVy5DRmbygvQF03alFh4PDFKWyYuUIDVuQu
	 gZ8vwWmeZ0NfJ2Lv10NKXSSlvV0oudpfZbqDdjI9ol3rRSsmrXClem0QQWaoHvDq20
	 xNt/0PF+rWmUIU2eV45+xeZOa3m9dy6WwtBX/T5kiCQkqirtPMPxlY+L8gYyozJ4F4
	 mmHsJbwBD2rI7jqlfL5XbzFozxFIIgPWjc3tRHP5o/lQTa0C/lRcPdsdcRznAHWkyX
	 b9XhuP4RRHa4f/FDMsp8jWRt4ICHbwb24lKSbLCpqdcoxkU00949/UhbSoKb1s79Z4
	 hgy+m4jEjCKbA==
Date: Mon, 8 Jun 2026 15:55:54 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@amazon.com>
Subject: Re: [PATCH 04/18] rust: kbuild: define `procmacro-name` function
Message-ID: <aibJ6iOXWFn-Bfus@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-5-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-5-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13645-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 072A4658F87

On Tue, Jun 02, 2026 at 07:29:05PM +0200, Miguel Ojeda wrote:
> Since we are adding one more proc macro crate (`zerocopy-derive`),
> we are refactoring their handling.
> 
> Thus define a `procmacro-name` function and use it to fill the existing
> variables' values.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

