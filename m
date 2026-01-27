Return-Path: <linux-kbuild+bounces-10899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GBuASvreGmHtwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10899-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 17:43:23 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5348897E73
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 17:43:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 284383017007
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 16:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BE12360741;
	Tue, 27 Jan 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LtRIFYvv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325EF35E546
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 16:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532133; cv=none; b=ESwSDf2CypoM/VBqS2FoODj04Lw08z9RZusTYI3+QBmDRQ4CutSClIp5kI9YfTeDIt/zs5EqTaNzyFE8eCpy6XWiNOiJcW+ZeMDXhlxu4nvclzxZ9OmQgYcD9c0EpIhyd0KauUlaw95IgN4CMt1gSBhTOzodiARdDpGdJyFQNtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532133; c=relaxed/simple;
	bh=XNXQkk0IyX4XeVJk27HuyM5omjfTv71E+Sc83mObR5k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=We6R4QwE4r7u2HjfNmeuh54brUWld51krGzKI2DYtiIZuVbnNMxhgtJFZMmOirCkpQjTv9AL1W/8imYgd0dtD+LmBbP84KTjrYkLb11aS/L3j0e36CaTKXlGn4ALHZHb53s4p1B+XSkNoZ60FCkXYxFtj0dz4ik4/ecIXG5OnEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LtRIFYvv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6126C2BCB3
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 16:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769532132;
	bh=XNXQkk0IyX4XeVJk27HuyM5omjfTv71E+Sc83mObR5k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LtRIFYvvGc1ojvGRTwaWFwuTJOfIBWcQ9i/YizUfDUhoIUbn+uKSh988+XuKfCVCa
	 GMS+rz78VRfF89jXbeWNVaKwOMuaUxMuEQilV9rFKsFKOM00oTI0RE57f6KUVzcuTL
	 qgtPHbrGRntRFF0wFoFqWF6Ng+2dy2RijK9rUc6k13uNWwkSVSmgp+/kRCo3ZaYns5
	 O5hkZdmHp+CtivuohNBIChPKy99sQGzpBWVg3dOqJYAccARr8ldm4cYx10p3fdyKZX
	 Qi0szDeg5n6xv6rxAL3bkXOEXtdmN71FLtLds8woRyx9cb3nxs1AjYeFlCRHE9HQ71
	 rnkERsFaGatdw==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59dd3e979ceso6615333e87.1
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 08:42:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWPIW+crrwLF7MXlXPg36RSKBxjTsk797RcQQXyivtQrn47qVTflPpdLJA/t7d2vMjcF1SC1aGHgitzkcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmaoIQPK7XC1tqjjMg3xIj99tdP49S4yo97GcVpy70W3sTMXHK
	aSPM2oxy2J258yWQnlI84zYMEJ0w6Q1Ho+dDKGwM8ZFktikzn1IGZ6wMPmimMJHp6K1FG9amveH
	4kD/WaaUTpJhWo/4ZD9KI6KUSlrrycDo=
X-Received: by 2002:a05:6512:3d08:b0:59d:dffe:94b0 with SMTP id
 2adb3069b0e04-59e04011af4mr1191545e87.10.1769532131380; Tue, 27 Jan 2026
 08:42:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org> <CANiq72kYE3zvZ2tdo3U0vBv6z8Oi3CuPtwAi+SzNZrKzQfzfrg@mail.gmail.com>
In-Reply-To: <CANiq72kYE3zvZ2tdo3U0vBv6z8Oi3CuPtwAi+SzNZrKzQfzfrg@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 11:41:34 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9nZS_KE5Wawts-2gDwK1O7k8jP-3ApSE0BiPmqW_6R95g@mail.gmail.com>
X-Gm-Features: AZwV_QiYPkhhf9NQJcHD1YSAieaQuwMYsuslI5sPY9fEEj370yPxv2svNeGHSXQ
Message-ID: <CAJ-ks9nZS_KE5Wawts-2gDwK1O7k8jP-3ApSE0BiPmqW_6R95g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: reduce cfg plumbing
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jesung Yang <y.j3ms.n@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10899-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tamird@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5348897E73
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:05=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Jan 27, 2026 at 2:56=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > - rust/Makefile: pass `pin_init{,_internal}-cfgs` from rust/Makefile to
> >   scripts/generate_rust_analyzer.py.
> > - scripts/generate_rust_analyzer.py: centralize `cfg` lookup in
> >   `append_crate` to avoid having to do so for each crate. Remove
> >   hardcoded `cfg`s for `pin-init{,-internal}` now that these are passed
> >   from `rust/Makefile`.
> >
> > Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
> > Acked-by: Benno Lossin <lossin@kernel.org>
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> I may still take #1 this cycle, but this one you will need either way
> next cycle, so:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
>
> By the way, the commit messages (in the kernel, I know e.g. some GNU
> projects do it differently) are not typically bullet points, i.e. they
> usually tell a story and make the points relate to each other, so e.g.
> it could say that what the first bullet point mentions is needed for
> the second etc.
>
> (I am mentioning this sort of thing since you will be taking commits
> from others etc.)

Makes sense, thanks. I'll reword into paragraph form on apply.

Thanks!
Tamir

