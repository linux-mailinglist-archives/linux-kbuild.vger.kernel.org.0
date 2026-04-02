Return-Path: <linux-kbuild+bounces-12598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHmFKMhOzmmjmgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12598-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 13:11:04 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADEA388231
	for <lists+linux-kbuild@lfdr.de>; Thu, 02 Apr 2026 13:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C06323081C69
	for <lists+linux-kbuild@lfdr.de>; Thu,  2 Apr 2026 11:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD53F3BADB9;
	Thu,  2 Apr 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sY0GHKJy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5A83AD538;
	Thu,  2 Apr 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775128084; cv=none; b=ZmV7M/3r8iBrbIpIEyUB8hBOr/c1kpGmeF5v2IIvWdmfQre++kw/tj4qdrvPbgRCSIILraEtBstOp2B4D8/84Dc+MVeHVLWchOIRfqudqlFyetquWjJ5rzhuw9qtmCBpoSX9omcjSQi9Xb9ZYdrRQFB1gcIcyyFiBIWdQWxDFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775128084; c=relaxed/simple;
	bh=HKSyNeUFKSDjim+c3VtsiyBL2Wc3W0yW/3ajIY7AdYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWGLtyqt0jwK9V7IIt2BJr/t58CPmwpqQBRnKBiIthKJDu7hLq0SxB0wKny+WB7hunAJrLAUa1SbTgI5jCvEIOO4bCpmhYfPdz4tO7NNuUibweXNmEnDImO+TC3QKcJ9P38YrkFoy2xPcfhUuztf8AVLRNhvc9/7H4LDn0xANqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sY0GHKJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07A3C116C6;
	Thu,  2 Apr 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775128084;
	bh=HKSyNeUFKSDjim+c3VtsiyBL2Wc3W0yW/3ajIY7AdYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sY0GHKJyymLBaNjEHjwSY1SML6TYcxrCX+81IvD63cHzBxW68TTeHRYlRkoWH8wks
	 0Yys6j2d31MPBvQ/1Z0a4IiA2WAl1ExUvIIRzZmTuOX/gGK0dnk9weSeDAOAhlWkTv
	 11d49EUPEOhgZUWviYqK8ECOzd5seOzRctcvvmJk=
Date: Thu, 2 Apr 2026 13:08:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jesung Yang <y.j3ms.n@gmail.com>,
	Carlos Llamas <cmllamas@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust_binder: override crate name to rust_binder
Message-ID: <2026040255-clump-hypertext-e242@gregkh>
References: <20260402-binder-crate-name-v4-0-ec3919b87909@google.com>
 <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-binder-crate-name-v4-2-ec3919b87909@google.com>
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12598-lists,linux-kbuild=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[sto.lore.kernel.org:server fail,linuxfoundation.org:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,gmail.com,google.com,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 3ADEA388231
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 10:55:34AM +0000, Alice Ryhl wrote:
> The Rust Binder object file is called rust_binder_main.o because the
> name rust_binder.o is used for the result of linking together
> rust_binder_main.o with rust_binderfs.o and a few others.
> 
> However, the crate name is supposed to be rust_binder without a _main
> suffix. Thus, override the crate name accordingly.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/rust_binder_main.rs | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

