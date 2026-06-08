Return-Path: <linux-kbuild+bounces-13646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHVoOpDjJmrPmQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13646-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:45:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5964D65842C
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 17:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=EBDcx6Gn;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13646-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13646-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E21531D41AB
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 15:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C344C3E0259;
	Mon,  8 Jun 2026 15:10:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B413E0226;
	Mon,  8 Jun 2026 15:10:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780931403; cv=none; b=Dm/etGdFzWBuBwy+2ND3LxmDUxB+C211/ScYhXcLaiLwQpsJ874W9FpEriHKN1h6ugvCdt0kN9P3lkZcE7FJmb28TIdIUPxv05VJ5u9BuJi/VbzknzEbWOawZnb3APC22+kIWAljY/OliuTx9VyQCcRaMDEgUWg3WLkf80ARIQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780931403; c=relaxed/simple;
	bh=KjEIMtoLBjjYScauErURezWxBZJLrn5jk7z/YizZT1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3y9jKuv5AJtnaCHfYGIJ2vqRanRPrPiMoVD127z3OHCRSqAoE71NEdv4xMarxBmtAGe/Nv7yGOO2R5todO0JPtWLM0CL6kXh+Vptm77Tvpa8buRhukvfB+IlFXQHo1VJlUooFnRj6toNZbTJsbYdO1DIA4QL721zN4N4kr+udg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EBDcx6Gn; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBAD91F00898;
	Mon,  8 Jun 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931402;
	bh=99z5tUWYGt2GZk03XpSTf3rxXn7uJn08ilJo5eheoOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EBDcx6GnpAdjCC0fCoiBKf5KIFpALVbxqjbYR1r0kSrgLgDUY7LDqgV/vbrx9wMeK
	 6zk1Ut5MCl7SZyvSRzSGIVXJRf7NPV4sEg5t7IOw0YJXQHZ81L6Afj4P/5AHM2HLvn
	 0UYKH8H5QoiKLJRPByb+R2KRB44A5V26aI344/Bg/YirvCRY0dlLhloYVLpqz4CmEm
	 KXRZnT2N1iX2b2c/CD+m4lmmP1grw+cRflPz2zLqhd8+1l5l/KRBXy8F4goxo/LZhL
	 1uUgQUhZSRirSLW0ob1JVhymhWGKUiuOspnQvrmVlvazvC6rQkmJf/sj9hnfgHXwqy
	 3WeFp2UDZWZ6Q==
Date: Mon, 8 Jun 2026 16:41:05 +0200
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
Subject: Re: [PATCH 05/18] rust: kbuild: define `procmacro-extension` variable
Message-ID: <aibUgUSlz-p2oxvX@derry.ads.avm.de>
References: <20260602172920.30342-1-ojeda@kernel.org>
 <20260602172920.30342-6-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602172920.30342-6-ojeda@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13646-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,derry.ads.avm.de:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5964D65842C

On Tue, Jun 02, 2026 at 07:29:06PM +0200, Miguel Ojeda wrote:
> Since we are adding one more proc macro crate (`zerocopy-derive`),
> we are refactoring their handling.
> 
> Thus, instead of using `libmacros_extension` as the common variable to
> hold the extension for all of them, use a dedicated variable with a more
> generic name (including for its implementation).
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/Makefile | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 8dfccf7399d9..df90fabefb70 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -48,10 +48,9 @@ endif
>  ifdef CONFIG_RUST
>  
>  procmacro-name = $(shell MAKEFLAGS= $(RUSTC) --print file-names --crate-name $(1) --crate-type proc-macro - </dev/null)
> +procmacro-extension := $(patsubst libname.%,%,$(call procmacro-name,name))

Where does the 'libname.%' pattern come from?  Looking at the current
users of cmd_rustc_procmacro I'd expect a 'lib%' pattern instead.

-- 
Nicolas

