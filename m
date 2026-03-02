Return-Path: <linux-kbuild+bounces-11516-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAFvL4THpWnEFgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11516-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 18:23:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C34191DDC06
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Mar 2026 18:23:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 68D09300B295
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2026 17:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13ACC4279F5;
	Mon,  2 Mar 2026 17:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXRmNTet"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A2C42315C
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 17:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772471797; cv=none; b=FP6k0Zt3VmMd6qW0O474B8l+Wcg/DUoJOt0D0wiow/MEviZG79C/X4dA94WR54j4QvSB7MNAHPDLC+oIflSivvkfplVUV0dgxKmGwlZreKFlR+h+xDLpAqHL/5INdKXvPCfsk2+ZPuHc3hOCbHTEe60uE/J7IOM4kLHJVPVfMas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772471797; c=relaxed/simple;
	bh=WUk3+L5+DM2P/5DAt5KeN9nLSDmjVK81KXg2iJ7K9IU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VZDWwmI6tzHOIe3N7vKA4nZFD/5d3wke8OaSKMIHGA4BaYkaRBXcrlVQbjlM9g28jsyvAiLuKkusr9G5Gjmot/v7+b4PjVErL5vreHclculYlv9O9uZrBO16/UUiyKCqhoPUwcVJmet0vthioSnGvndZSphfjIefe+Of+9YfFEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXRmNTet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB235C4AF0D
	for <linux-kbuild@vger.kernel.org>; Mon,  2 Mar 2026 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772471796;
	bh=WUk3+L5+DM2P/5DAt5KeN9nLSDmjVK81KXg2iJ7K9IU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RXRmNTet5q8BkbAzoxGd0GlG5QaaIgVYLPiPWCOoXuWDwMByuQWfFMwA/f8Ah24Kh
	 2KRZ9KQYYrHLFw5VBH3vkyoLAnH9wSJthRuj6FxQwnMPwRk+35KNiI68v+bv0eipdj
	 ank5jLTEJ5qHubTQFVQixjdxXRwYyhor/6U78uJ7IeFW6JT2ubY+ONNXDVhxEtLzL2
	 T3cgQ7OKyCRlqDKVAqVUaxaOKI3EUa4AsbApg61P7xWVfOsISgs98mTvehgQpXmaYd
	 /LM+KVOcjcJuPNsZ0NPN+aBLa3gw2qYK3mcViWSs3D7d4gIxnbwHUT8RNEO6q9wiNv
	 ox7pPc7k/RGGQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3870dec27f4so14549721fa.1
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Mar 2026 09:16:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5FHZVcLUNH/y6Z1iuA60rSHhxU5WN74+qG2dFXS0+a9q0ExZCq/glxQx+gGsJSHBuIcpXjd7BnWV1qf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRv+1H0WYxQOjFJAaNb70S3bJ+7XVRvnZl1T28fkncARahf+0N
	DxAqOboHS6zNgNb/S7gL7/nMGhsOXWOO4frV8VFHmXJMidJucCX2JPJAc+zUkfzzrd1+lQKT+4t
	oDs8qXTP6g/SSyaaensHsvUMd/nuU0lk=
X-Received: by 2002:a2e:be1a:0:b0:385:c15f:6bd with SMTP id
 38308e7fff4ca-389ff73df24mr73690511fa.10.1772471795293; Mon, 02 Mar 2026
 09:16:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127-rust-analyzer-pin-init-duplication-v3-0-118c48c35e88@kernel.org>
 <20260127-rust-analyzer-pin-init-duplication-v3-2-118c48c35e88@kernel.org>
 <CANiq72kYE3zvZ2tdo3U0vBv6z8Oi3CuPtwAi+SzNZrKzQfzfrg@mail.gmail.com> <CAJ-ks9nZS_KE5Wawts-2gDwK1O7k8jP-3ApSE0BiPmqW_6R95g@mail.gmail.com>
In-Reply-To: <CAJ-ks9nZS_KE5Wawts-2gDwK1O7k8jP-3ApSE0BiPmqW_6R95g@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Mon, 2 Mar 2026 12:15:57 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=MOmh5qaLgnxTeAh3kMOZoq0V0KtU_gXfJc_H-SpQNUA@mail.gmail.com>
X-Gm-Features: AaiRm52vfgTfedxepFtwIxJxPD1I3Q6CmLp3rn_pGbfzogdyqiWkx0i37i1nKBA
Message-ID: <CAJ-ks9=MOmh5qaLgnxTeAh3kMOZoq0V0KtU_gXfJc_H-SpQNUA@mail.gmail.com>
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
X-Rspamd-Queue-Id: C34191DDC06
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11516-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 11:41=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> On Tue, Jan 27, 2026 at 10:05=E2=80=AFAM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > On Tue, Jan 27, 2026 at 2:56=E2=80=AFPM Tamir Duberstein <tamird@kernel=
.org> wrote:
> > >
> > > - rust/Makefile: pass `pin_init{,_internal}-cfgs` from rust/Makefile =
to
> > >   scripts/generate_rust_analyzer.py.
> > > - scripts/generate_rust_analyzer.py: centralize `cfg` lookup in
> > >   `append_crate` to avoid having to do so for each crate. Remove
> > >   hardcoded `cfg`s for `pin-init{,-internal}` now that these are pass=
ed
> > >   from `rust/Makefile`.
> > >
> > > Reviewed-by: Jesung Yang <y.j3ms.n@gmail.com>
> > > Acked-by: Benno Lossin <lossin@kernel.org>
> > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> >
> > I may still take #1 this cycle, but this one you will need either way
> > next cycle, so:
> >
> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >
> > By the way, the commit messages (in the kernel, I know e.g. some GNU
> > projects do it differently) are not typically bullet points, i.e. they
> > usually tell a story and make the points relate to each other, so e.g.
> > it could say that what the first bullet point mentions is needed for
> > the second etc.
> >
> > (I am mentioning this sort of thing since you will be taking commits
> > from others etc.)
>
> Makes sense, thanks. I'll reword into paragraph form on apply.
>
> Thanks!
> Tamir

Applied to `rust-analyzer-next`. Thanks all!

