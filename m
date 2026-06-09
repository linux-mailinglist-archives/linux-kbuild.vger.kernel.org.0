Return-Path: <linux-kbuild+bounces-13676-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9leALMQGKGo47gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13676-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 14:27:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D116600C3
	for <lists+linux-kbuild@lfdr.de>; Tue, 09 Jun 2026 14:27:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=XPxF5Vx6;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13676-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13676-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB02B3046EB8
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2026 12:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD3413623;
	Tue,  9 Jun 2026 12:21:26 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A50413621
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Jun 2026 12:21:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007686; cv=none; b=mKtxIaN9h/w4m523J/AwuJTvNpn123saZZX56LsUQzYLMP0WiYqIaxa3+U92BhYtUjrGHX2/VC+jrRwgmUguFBmB8YRXb8Ehshugs0kMf5GsQmKyiySRlCzaQMJrF9kfHzcfH1k5XVXK9s23jlCoQhLiHDm+vThxYNpPlN6KmOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007686; c=relaxed/simple;
	bh=YQwcjbPT8reVmyJ4Ni2PAEuzpSPcjZjo1kuWv5v819E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BV0xOI7pdOCoL4AIZUh0TARgFyPDEQx/JZcv7oCpQj1q0CgVKFAki5NSdxBaxdPPvMHxw4qzF75TICtU5mEfqVlGUOXf87FqtpGfhkJCo7MmK1Umy9gCYrTnkGNgSvCyw6BRr8WBO2ZR3qXLvZPn3GDgAP4cL4XPdVO4rNoQVns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XPxF5Vx6; arc=none smtp.client-ip=209.85.128.74
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b37e1f48so44930585e9.0
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jun 2026 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781007683; x=1781612483; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MhKYIwYQts4cq5+bkrj6bHMVfPH+f0iUocbJTvolkkk=;
        b=XPxF5Vx6J43gPgH966aTb1Pf/987CPNmmpRBQkmHXHXC/89TJe+URp3LqmVgigbT5H
         h9n/Z80K6IbCvPNMa+toVy6XVN2k7C55oEMyqPOUstjquJiIqZXjnkuQFK3eeoTNwcu+
         jGGLMHkOMjc2GtBRXhcHa0rFCA7VdrmhN1lgy1iy2IeyEgPOK+x/1OrKxOg2HvJ53KB6
         hx8wUgXXMq2N3AOE0ce/iu0Z3VQIqIfcyw5AwY2jOaSiyzrp8NnESJDBXU01RVRvSave
         WWR0WxfJQjEXTxO+yQbvjUjQu/6uYZDjxHv50MsEAJUScld5zC3HqZd3QWRH8DIUolqw
         CIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781007683; x=1781612483;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhKYIwYQts4cq5+bkrj6bHMVfPH+f0iUocbJTvolkkk=;
        b=GUPT58vMf25msFqavGHMARG3HxPEBZLV8Bu3DbFn5AUXW7O+YvfcxUUbSCQqxz03T3
         HMJOb1YBxGfH3KlZd89nHdUCPwTuNXzN9NSQ1F4Y6s3A2lbh0okTJEQavuOiyKcE9W1s
         haZS0mBSoQb1X7K/YClNq9n925eGuEgBAbo4EIDc595roSetXxwffLUQNFVyxgBfWkr/
         VsMT5YQvBJbhDwFO4lkrbZSRPLiTZ6l0JkmTOF9+c2jTcV0uH0ZGBl7129QPRbTjHbkj
         d3ZhdQjhpS7K+34nbECi3csr6zge/Blk0seF3MHdzLHLeIx9Rj/P7ydEC4l6KhY/G5mS
         1Raw==
X-Forwarded-Encrypted: i=1; AFNElJ+e6s6r6TR934EU5lFUzb5foZ0ydir1HhLKlsDqbKxpc7LE0ZDo2pT3rGb9V3LAKgTmS93WEdksudeUWmA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMPLy3T0NKxpz3wqm5TWjfBuMzXhSGqB1GTHT9yMJXkc0uGLD4
	TNJs5EmQzLHarm+cTvTR2D2ZA0KpkHYv8G0wVJy3/b+0JEhxxH0CO5YweUltKFAHjl9HxIGpu9/
	hW9+x8ogaVaOWYCFTww==
X-Received: from wrj11.prod.google.com ([2002:a5d:5a4b:0:b0:460:18e2:1418])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr315540975e9.14.1781007682685;
 Tue, 09 Jun 2026 05:21:22 -0700 (PDT)
Date: Tue, 9 Jun 2026 12:21:21 +0000
In-Reply-To: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260608141439.182634-1-ojeda@kernel.org>
Message-ID: <aigFQcq3JHtdpsIn@google.com>
Subject: Re: [PATCH v2 00/19] `zerocopy` support
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
	Jack Wrenn <jswrenn@google.com>
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13676-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,google.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aliceryhl@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29D116600C3

On Mon, Jun 08, 2026 at 04:14:19PM +0200, Miguel Ojeda wrote:
> This patch series introduces support for `zerocopy`:
>
>     Fast, safe, compile error. Pick two.
>
>     Zerocopy makes zero-cost memory manipulation effortless. We write
>     `unsafe` so you don't have to.

I tried applying this and using it with Binder. I ran into one
challenge, which is this uapi struct:

struct binder_transaction_data {
	/* The first two are only used for bcTRANSACTION and brTRANSACTION,
	 * identifying the target and contents of the transaction.
	 */
	union {
		/* target descriptor of command transaction */
		__u32	handle;
		/* target descriptor of return transaction */
		binder_uintptr_t ptr;
	} target;
	binder_uintptr_t	cookie;	/* target object cookie */
	...
}

The problem is that when the union contains a handle, there are 4 bytes
of padding in the union. Currently Rust Binder handles this by wrapping
the uapi struct in MaybeUninit and using MaybeUninit::zeroed() to
construct it, ensuring that even if padding is present, it is zeroed.

However, this trick relies on unsafely implementing AsBytes for
BinderTransactionData with the safety comment being that the MaybeUninit
actually always contains initialized data.

To translate this to zerocopy, I'd have to do this:

unsafe impl zerocopy::IntoBytes for $newname {
    fn only_derive_is_allowed_to_implement_this_trait() {}
}

One fix could be to update the uapi header by explicitly adding the
padding, but that's kind of awkward for a union like this, since I'd
have to do it like this with an extra struct:

	union {
		/* target descriptor of command transaction */
		struct {
			__u32	handle;
			__u32	_pad;
		};
		/* target descriptor of return transaction */
		binder_uintptr_t ptr;
	} target;

It's not clear to me if changing the uapi headers like this is even
allowed to begin with. It's a somewhat non-trivial change.

Any better ideas?

Alice

