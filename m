Return-Path: <linux-kbuild+bounces-13644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HAVeKXjmJmrzmgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13644-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:57:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2C6586BF
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=eDZaEyhY;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13644-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13644-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7013F3325428
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 763083E0091;
	Mon,  8 Jun 2026 15:09:58 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790D13DFC9B;
	Mon,  8 Jun 2026 15:09:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931398; cv=none; b=BY0rcQdeSHViX5sjgwerfNHgvr8qOqlp+IjdZtxtXq+uHKnw6BoCSfwoxnak3FP6Je32E8YK5xG3D3hS4GRzxeDc4FKJIYMYBtz7B8XVBGdeyvy6eeGlVyvtteo1hrvti3UqjqXn4ERWiHLGLHSq3p3knQzwHzMibNJyujq5Yus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931398; c=relaxed/simple;
	bh=i4VWbKpflRvNue6Pc4vgzc8OpCCYkmlO6UP6BH/5aVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nCt38QcluQjq+XuNR5n+9CUZpoFXvqP7KylKX/hjBS7y4/yNt9XnSERU/i5uJ8FzQIUmuMKy12qDyrNfRVDEP65M8CZrH08UMckIGCaeKy9Zk6Gv3LwOfUb8y4YmXhofznlgtuydzbyiMRaOGozFlC0xWu9cCUjCER/wevNClUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDZaEyhY; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4B81F00893;
	Mon,  8 Jun 2026 15:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931397;
	bh=z6U54lj9DWyAFuT8Xuvt74123ocVh0v9xPup1wgFGSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eDZaEyhYADo6Gv9V7KAqnBaMfVU345TjiZrl98hqdKBdS4B3iPI8ioKe4QVNijcrq
	 ADOW7UP51HDPfXhgigUHDqrDrWZOElqOM8yijO6aZgwLSoz9T6+lvmybEMGw/sSB4L
	 MFNLfJy85mrlfwc/OfJcKx0xden3aJuDs8qjmaaVzbG5MPxeTTNjkmq0a6N8aXw0v+
	 CZ3VaUziG42klk3HNZ/wYyu5dp0122U1YKlm1asOkYPG+bnCBSUm/hizvcPfVM0Ddg
	 N6+hKced2Colc+wq4lNGXYlhHxDV7CCxeb0E9cODYUnyZqF8Zw435OnNjmq1SvrV6N
	 1Filx51I6YS5Q==
Date: Mon, 8 Jun 2026 15:54:27 +0200
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
Subject: Re: [PATCH 03/18] rust: kbuild: remove unused variable
Message-ID: <aibJk8rja-753ouQ@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-4-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13644-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,derry.ads.avm.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3BE2C6586BF

On Tue, Jun 02, 2026 at 07:29:04PM +0200, Miguel Ojeda wrote:
> Since we are adding one more proc macro crate (`zerocopy-derive`),
> we are refactoring their handling.
> 
> `libpin_init_internal_extension` was added to mimic the setup for
> `macros`, but it is not used, since the extension is expected to be
> the same.
> 
> Thus remove it.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

