Return-Path: <linux-kbuild+bounces-13647-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DQUzLRX0JmqZogIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13647-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:55:49 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2981B658F93
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 18:55:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="f/Y0uAF/";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13647-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13647-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1FBA340B702
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B86C3E2740;
	Mon,  8 Jun 2026 15:10:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D223E1216;
	Mon,  8 Jun 2026 15:10:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931406; cv=none; b=eu5cqO9pSkh+mforBRR7eyP0P4wtYoAj4ih05Wlm8J4utTwSNqDvXR0pC32MoygKhHT56bJe8DkI5zPMRcv6aFPYVAKY/AWXdOH0WL859lO0NRqeQopSCopWFXrI8V1PDPbwcHCeX8amVlUiP49Piiv3iyeYUwA3jUhxR30xQrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931406; c=relaxed/simple;
	bh=oR+g+Lvq1h5aM4MV0wkIo/3JyyiNkFs5Lm+jvf6s2kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oHbZwFbnm455eEXr5eJxsEtUmZWfVbH2OnWZfOoe3qgEWuIQIzUgyWp0Ntymjq3ZJloPsHQiyeEJtbRQOiGgJSShLY+l9SJzGBR3Zj1b19TGQpJZ8pyfu1NMik1hU9azUU0KtavZlwsXGGGKAANbsKae9dQNHrKw53fe3NFvkvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/Y0uAF/; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1B831F00898;
	Mon,  8 Jun 2026 15:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931405;
	bh=KYBpcs+1RlCLR+sAlIccl8Dn4nrdCO63ZM0ZjmwFx7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/Y0uAF/SeffgJPlw6zKtpoKmyXEbLpUKqFcHZO+ve0IAFsL+0BNeI6WyTSUdGnyz
	 1GoF5S9BUMFTWzn+RovsfsJ9cXODx439AO93uZksExpQkOG+F7Zh0JvsQn0iLVBRtb
	 xkvjQnzNNsZDPy64sRHa61StUHfuirUHvehy9VsxarzFN0dPXWiPGZgRWSvTV2Azbz
	 wFOSHWkbbuK0Rn5RZhKNbxJHwzFk0rlPTNHPOiVUFZiatLdZfPD0lI2pJpXZ1EnGB/
	 UZpHbnMflIXhpTree2ptToJgDO3meBbvPSmQKACDKkHqsuVZFi6izih9zRUki9xNkD
	 1xN//aJV3oeyg==
Date: Mon, 8 Jun 2026 17:08:56 +0200
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
Subject: Re: [PATCH 06/18] rust: kbuild: support per-target environment
 variables
Message-ID: <aibbCCX5JR0m4i_N@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-7-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-7-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13647-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,derry.ads.avm.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2981B658F93

On Tue, Jun 02, 2026 at 07:29:07PM +0200, Miguel Ojeda wrote:
> Certain vendored crates, like the upcoming `zerocopy`, use extra
> environment variables (e.g. via `env!`).
> 
> Thus add support to easily specify those.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>

Acked-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

