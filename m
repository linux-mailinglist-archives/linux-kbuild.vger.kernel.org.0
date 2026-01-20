Return-Path: <linux-kbuild+bounces-10707-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oK7EDwFncWmaGgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10707-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:53:37 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D815FADC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 00:53:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D997C841230
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 11:48:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A276C425CD3;
	Tue, 20 Jan 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXk3RpH4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC6423A82;
	Tue, 20 Jan 2026 11:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909613; cv=none; b=tXTnn20OqRyTDR9vQfiki737ZhY2lTEzT6ZzFQjcRRHnzRs1HVwaiuBk/sTdDU2ZgEBbCMhYotprw+MtxJgtypOigiVJuvosB6ZSC7B1A2F0Vh82JIZgl6raWmDjA61XXgCsZhE6sAwRHstIrz1D5jzpk9BNe7HB1qc78j0nkSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909613; c=relaxed/simple;
	bh=oySjAh+n2HVu2v1IQjIDF2AnLeGquP6L8gHqu0LSfOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ud0s0ToHfql0EQt2mvoP4utYkZS34FcdKTOWYeipGaP9M+NHcaMbJ8KRpTPSL17lWTnCqGdVQSRwZfeMt/kdWm7/x/ZNHJJJlJQVF8mgX3jbOSdW6ANWn9lUYoG7GYz4sAoIenwahgo1W/4If8ccRQJWNh8KOt2Jiqyqt1vebYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXk3RpH4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E19C16AAE;
	Tue, 20 Jan 2026 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768909612;
	bh=oySjAh+n2HVu2v1IQjIDF2AnLeGquP6L8gHqu0LSfOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pXk3RpH4Lx9RHoOZouGmwL5+9EE3FZ2aqG89zF24Vccex7an3cH7xrE75rYbj3JqV
	 YnF7zBh5dabxjiuIIeaB+qcSRn1Q0eS8wVqUn50s05CBpfsDYhRytjihHxJYvRcnFA
	 zbmaRZBFQ14oXmcBID0C7X14o4h/4QY1yw8g7th+LjIDwLyIw63uzcrTWzyVSXa+F6
	 jy1K5qskWbru5RGCNhkKgXLFooubuD2Tcn6ZRwd/kJmrm55AcAFCsCBngSbezvg2xr
	 VxU3YFRd5UeHfKL5fIs4M51b0s3JJAFBtuGf9+vEZ3VH9MqVCeEpQDq+sKgzlKBbdq
	 FB0E8taP9cu/w==
Date: Tue, 20 Jan 2026 12:13:29 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: chenmiao <chenmiao@openatom.club>, Benno Lossin <lossin@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>, tamird@gmail.com,
	da.gomez@samsung.com, hust-os-kernel-patches@googlegroups.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2] Makefile: Remove the product of pin_init cleanly in
 mrporper
Message-ID: <aW9jWQTddPXj_iXD@derry.ads.avm.de>
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	chenmiao <chenmiao@openatom.club>, Benno Lossin <lossin@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>, tamird@gmail.com,
	da.gomez@samsung.com, hust-os-kernel-patches@googlegroups.com,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
References: <71ff222b8731e63e06059c5d8566434e508baf2b.1761876365.git.chenmiao@openatom.club>
 <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kDsmkJeS3bGSiD_dA1wSm328nYbbHEZ8HRiMHOirCS+A@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[36];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10707-lists,linux-kbuild=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[openatom.club,kernel.org,gmail.com,samsung.com,googlegroups.com,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 70D815FADC
X-Rspamd-Action: no action

On Sun, Jan 18, 2026 at 11:30:47PM +0100, Miguel Ojeda wrote:
> On Fri, Oct 31, 2025 at 3:32 AM chenmiao <chenmiao@openatom.club> wrote:
> >
> > When I enabled Rust compilation, I wanted to clean up its output, so I
> > used make clean and make mrproper. However, I was still able to find that
> > libpin_init_internal.so in the rust directory was not deleted, while
> > all other corresponding outputs were cleared.
> >
> > Dongliang Mu <dzm91@hust.edu.cn>
> 
> This line seems broken. Was this meant to be a Reviewed-by, like in v1?
> 
> > Signed-off-by: chenmiao <chenmiao@openatom.club>
> 
> I think in another patch/thread you mentioned this should be "Chen Miao", right?
> 
> No need for a new patch, I can fix both on apply if you agree.
> 
> Adding the relevant people to Cc (pin-init, Kbuild and Rust). And
> Tamir for the `.dylib` side.
> 
> Also, I guess we could backport this:
> 
> Fixes: d7659acca7a3 ("rust: add pin-init crate build infrastructure")
> Cc: stable@vger.kernel.org
> 

Can you please update the typo in the subject:
  - prefix: 'rust' or 'kbuild'
  - s/mrporper/mrproper/?

Thanks!

Acked-by: Nicolas Schier <nsc@kernel.org>

