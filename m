Return-Path: <linux-kbuild+bounces-13734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZXReFoH0K2rzIQQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13734-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 13:58:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AACAD6792BE
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 13:58:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=KKaa6eR+;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13734-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13734-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E37430D9C86
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Jun 2026 11:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432AA39903E;
	Fri, 12 Jun 2026 11:58:51 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83131F9BB;
	Fri, 12 Jun 2026 11:58:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781265531; cv=none; b=Gaq2jocZpiJiza9zL8wk57xXq2vwzJCDrp4bCumBW20rampwU6jRH4esVJG0LMooytNwH3yEaP3yagZ8EpqCYqi4Ge7dtsrlTKRsv5iKz6lvlk0NjGoBMsVaoa1JgDp77GMF+GZTFFR4f0AkfwkHTy/ppuB5SAUkVXVYddOP6Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781265531; c=relaxed/simple;
	bh=W2XSTvg3/JIE/VsCEWHUPo8JtMUnbYmk+t6MFvoh3sE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAB6UEEjeWj9HzVbFUokG1HsBWKi5PHHz+H6oEdpJKN2lsYWwZ8hjCVi0R5uVXrUaqq2Btn1CoRzl1MJn96TPmryjql4dudHaxVeNMOOpNt/jXUMkF/RaQEi5X1h4ZLdiM06t9edLtPL8AGDghq0psiSq6IFRxtpCsreZ0sKGHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KKaa6eR+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6DEC1F000E9;
	Fri, 12 Jun 2026 11:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781265527;
	bh=7CFVZQrdHvTd/bWa6RM7kBPRuXdpePUd05DWTOnsQcE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KKaa6eR+8YsqjaAn/Gmgla3xr7807i6U6hJBf7ZRZ/rL7KHX5hUWGV3R3EQdb/Xqx
	 jW5DY9kUcD7X5Zguxy+tXq7y6ftICZjaXeKrU0ZQEZoP5JfGaEQ+J9JJ4xhWiOe2uY
	 UAwAnCSQLIcewE8q2KKAWOX6lxy5brsLyd2OWYRc=
Date: Fri, 12 Jun 2026 13:57:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
Message-ID: <2026061224-outhouse-widget-8a3a@gregkh>
References: <20260608141439.182634-1-ojeda@kernel.org>
 <aigFQcq3JHtdpsIn@google.com>
 <aigKVysaNhloK9bS@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aigKVysaNhloK9bS@google.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13734-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,google.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AACAD6792BE

On Tue, Jun 09, 2026 at 12:43:03PM +0000, Alice Ryhl wrote:
> On Tue, Jun 09, 2026 at 12:21:21PM +0000, Alice Ryhl wrote:
> > On Mon, Jun 08, 2026 at 04:14:19PM +0200, Miguel Ojeda wrote:
> > > This patch series introduces support for `zerocopy`:
> > >
> > >     Fast, safe, compile error. Pick two.
> > >
> > >     Zerocopy makes zero-cost memory manipulation effortless. We write
> > >     `unsafe` so you don't have to.
> > 
> > I tried applying this and using it with Binder. I ran into one
> > challenge, which is this uapi struct:
> > 
> > struct binder_transaction_data {
> > 	/* The first two are only used for bcTRANSACTION and brTRANSACTION,
> > 	 * identifying the target and contents of the transaction.
> > 	 */
> > 	union {
> > 		/* target descriptor of command transaction */
> > 		__u32	handle;
> > 		/* target descriptor of return transaction */
> > 		binder_uintptr_t ptr;
> > 	} target;
> > 	binder_uintptr_t	cookie;	/* target object cookie */
> > 	...
> > }
> > 
> > The problem is that when the union contains a handle, there are 4 bytes
> > of padding in the union. Currently Rust Binder handles this by wrapping
> > the uapi struct in MaybeUninit and using MaybeUninit::zeroed() to
> > construct it, ensuring that even if padding is present, it is zeroed.
> > 
> > However, this trick relies on unsafely implementing AsBytes for
> > BinderTransactionData with the safety comment being that the MaybeUninit
> > actually always contains initialized data.
> > 
> > To translate this to zerocopy, I'd have to do this:
> > 
> > unsafe impl zerocopy::IntoBytes for $newname {
> >     fn only_derive_is_allowed_to_implement_this_trait() {}
> > }
> > 
> > One fix could be to update the uapi header by explicitly adding the
> > padding, but that's kind of awkward for a union like this, since I'd
> > have to do it like this with an extra struct:
> > 
> > 	union {
> > 		/* target descriptor of command transaction */
> > 		struct {
> > 			__u32	handle;
> > 			__u32	_pad;
> > 		};
> > 		/* target descriptor of return transaction */
> > 		binder_uintptr_t ptr;
> > 	} target;
> > 
> > It's not clear to me if changing the uapi headers like this is even
> > allowed to begin with. It's a somewhat non-trivial change.
> 
> Hey Greg,
> Do you have any input on this from the C side?
> 
> For context, zerocopy is a tool that helps convert raw bytes into
> structs and vice-versa. When I tried using zerocopy with Rust Binder to
> see if it helps there, I found that zerocopy is flagging that Rust
> Binder copied a uapi struct containing padding into userspace, which is
> of course dangerous since padding on the kernel stack may contain data
> we don't want to leak to userspace.

A UAPI structure should not have padding, and if it does, it must be
zeroed out, as you say.  So in C we normally manually fix this up.

> Now, there's not actually a problem today because I'm using another
> strategy to ensure that the padding is zeroed when copying the output of
> the ioctl to userspace, but ideally I'd like to switch over to using
> zerocopy.
> 
> How is this kind of thing usually handled on the C side? As far as I can
> tell, C Binder handles it by just being extra careful like this:
> 
> 	fp->binder = 0;
> 	fp->handle = rdata.desc;

Yes, we have to almost always manually do this.  Sometimes we use memset
on the structure first before copying, or rely on a foo = {}; to do it
for us (but I never remember if the compiler will zero out the holes...)

> where fp->binder and fp->handle are fields of the same union, with
> fp->binder being 8 bytes and fp->handle being 4 bytes. The first
> assignment ensures that the extra 4 bytes in the union are zeroed.

Yes, that's why we manually do this :(

thanks,

greg k-h

