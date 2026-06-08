Return-Path: <linux-kbuild+bounces-13643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MDyEOR7iJmpamQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13643-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:39:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9796582F6
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:39:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GwTYgCn3;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13643-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13643-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24A7F31AF093
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B4A3DEFE2;
	Mon,  8 Jun 2026 15:09:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791D73DEAD3;
	Mon,  8 Jun 2026 15:09:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931395; cv=none; b=ncJLDMwLuW24RnlXRedydjkNCnsyBYcwSe2WhTRCd7zMf2PgxBRJa3sLqTdHPSztibMXNAhBCPncHiSV3/0X5TD8Tx5GE4pXUlHzRiwN7CXlTl825cqHiWlkDGZJLaat1f/vtQ+uSeUft6MyxfY5srGTjl4xgDXLr5J5vBFQMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931395; c=relaxed/simple;
	bh=YmhHaDJpkbSTIn6phIZg6070j1Q5e3L6vXOtYrAUQts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bv5YxbfldmnW4QH7X6fQSsxM0XbzycdhQJp6mp3xOMxhkLZRxcCLoFJXGZ9s3uuyIeX6sKSne1y9fWsP+QfYs4smda0Sev9/am1B9gFhLIf8eVq4fact7wKeyPrI7LinFxQMviibpwcbL8YDeYpXMEEYw4uddrd+dAlHo65q1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GwTYgCn3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B59C1F00893;
	Mon,  8 Jun 2026 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931394;
	bh=zCavk06X8RVMcioqZ27dkbO1RB8YphojkNNS0E4toHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwTYgCn34V+1AWXKY6Xhv9K3AgRefQgCim4YOvTM8D0LJAwXojFZCr+mUVGiEAqhR
	 cJcKFkzfFjUiIpA33W4uTbRyzE0ozoIKJh8Dyy1uEA930DoVgjJ0euyhRUxX4Vth8C
	 xQWqs+2joCjzN0jUhSzNecbADJzY3PFPkv17Sap1fXhP6mOvdn1qtPZQvTMHaaoz4h
	 DB+A1kTl3Og6vf8YjHTxDGdFOV8sy1E+RdfngLEbau4i+jWadSIiRpPflLZXc/dsa8
	 9WKl0oFVYBsu8oIO4a2hxc+gUKDLAu5yZnX5k3HKjWlK1dX9CQfZgaqZBd317WQaY5
	 tUFMz8+Eeo91Q==
Date: Mon, 8 Jun 2026 15:51:53 +0200
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
Subject: Re: [PATCH 02/18] rust: kbuild: show the right
 `quiet_cmd_rustc_procmacrolibrary`
Message-ID: <aibI-ZUQ99SA1ssB@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-3-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-3-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13643-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7E9796582F6

On Tue, Jun 02, 2026 at 07:29:03PM +0200, Miguel Ojeda wrote:
> When Clippy is skipped, `RUSTC` should be shown in `quiet` instead of
> `CLIPPY` to be accurate and to avoid confusion.
> 
> Thus do so, matching what we do in `quiet_cmd_rustc_library`.
> 
> Fixes: 7dbe46c0b11d ("rust: kbuild: add proc macro library support")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Nicolas Schier <nsc@kernel.org>

