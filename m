Return-Path: <linux-kbuild+bounces-12734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIq/JtDS12mrTAgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12734-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 18:24:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E1D3CDA11
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 18:24:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EBA3024CB2
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Apr 2026 16:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F73DDDC7;
	Thu,  9 Apr 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ha6ai0lb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63E633F5AE
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775751566; cv=none; b=jpjt8UybymkKUQ327h7quSFFf5HuIMHXdqMmbKPvOAXgm1icpekNpro8FXFG0N4Exer2mrKlmzRH5uWTb3aNzgI1vSyE7c2lizffsuw64qc/dYEYmhLzPOFQU1glyr2mM+NB4cXkikXzucoa4s3PmxZsUb+AuPP7wE/Piwq7nvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775751566; c=relaxed/simple;
	bh=4ST+hPB0HfJyx4zcBPDhvtmJYMEBRZ/dYXMapLMv6bg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9UoB1BadOIH9sBHapMEQbO0Z2sQNsjOU7lOTBdB8rXk2iB9r1spW6PKPqlJ0Un0MY44lEhbGqBamI9nuD3zq138QSxawc5hkwR2mKoZUqLF8y3J37kyaSPxbvNLLjA7fxu8e0U+oer1tNVQy+orokfgnEaU4Uxl6l8lude7fyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ha6ai0lb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E323C2BCC6
	for <linux-kbuild@vger.kernel.org>; Thu,  9 Apr 2026 16:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775751566;
	bh=4ST+hPB0HfJyx4zcBPDhvtmJYMEBRZ/dYXMapLMv6bg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Ha6ai0lbwR8U5dFvxHDDn3S4cqYm4HR+WmDmiEfue1jHfrutZTZb/fklkVqsjKNhR
	 7W/YSX1wjvyxCIXtCADAWNlCyuVz+MWZHEHfpZ4qJ8EbUXueZOEu+d9Vf1jc+Rjfde
	 bXR1VOcyDPwYIf2uk+G3ful6Bba7gNpjVwRLR9Gv5fI/8IXA4xHPCjo8X9SbkpgW4D
	 zepHaIJp3rlE16hg5AsR3ib6YMvcd9m5UlSH2MKJdFKAvQIxQ57wfHlbuBtjmav+uy
	 +q09uY/zjecylWD1FIjTxyCzny/Q7iSFTp8gXg6z+obB/22Ecq2wUnAh/xGM+KKkSP
	 wkjJFJmjAX71Q==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-38ded5277e5so8557441fa.1
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Apr 2026 09:19:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd2k9RWVTYOSlYlibhj0gxQ+Kk+ePIkwn1RYO+gSNBmx7XUKa5sXMu/MkmL7DyY8++lTu7WFtcFUnRyxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwNJo416PpNCxHy6RVnocYWL9nl79LVAMAuLwcnben6/wOjD6X
	wH2Xm5kDZIFEhl+X5JcFy39doR9kei9+UdNDmdBvm6DKKIId03nvByxrs1T+AtzOeZa2V0/ZxGy
	YvGBSkVLvF6qFG72B4B1H30GJzMmws7w=
X-Received: by 2002:a2e:95c3:0:b0:38c:c32e:5b2c with SMTP id
 38308e7fff4ca-38e3362371emr11761351fa.19.1775751564937; Thu, 09 Apr 2026
 09:19:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331205849.498295-1-ojeda@kernel.org> <CAJ-ks9nqv30SOiCia8LE6XbKEURNCa9qwwcszsQ0a8FRxR0Msg@mail.gmail.com>
 <CANiq72mKuQgK_R=xs6270nwYigzCvJiFJ1PcOB+WT3OdXO7E0A@mail.gmail.com>
In-Reply-To: <CANiq72mKuQgK_R=xs6270nwYigzCvJiFJ1PcOB+WT3OdXO7E0A@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Thu, 9 Apr 2026 12:18:48 -0400
X-Gmail-Original-Message-ID: <CAJ-ks9nMA1zqGhHhOk8hmfNgoODQ+D-WforPU6iCciYbPsDD-Q@mail.gmail.com>
X-Gm-Features: AQROBzDZ5E11AfueQzg0LR9apqPigjI17D9aa2qN_B_BOWd8NoNl2G48fdG5R0g
Message-ID: <CAJ-ks9nMA1zqGhHhOk8hmfNgoODQ+D-WforPU6iCciYbPsDD-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: allow `clippy::uninlined_format_args`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Aaron Tomlin <atomlin@atomlin.com>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12734-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.com,google.com,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,atomlin.com];
	RCPT_COUNT_TWELVE(0.00)[22];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 20E1D3CDA11
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 3, 2026 at 9:07=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Apr 3, 2026 at 12:25=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Seeing this patch a bit late but in clippy 1.85.0 there is
> > `#[clippy::format_args]` which would permit us to make the lint work
> > with our custom macros.
>
> +1, that may be good to consider, especially with the bump -- added
> and backlinked in:
>
>   https://github.com/Rust-for-Linux/linux/issues/349
>
> Maybe an issue would be good to create too.

Turns out `#[clippy::format_args]` doesn't work for us due to the
`fmt!` proc-macro.

It seems the handling of `#[clippy::format_args]` is more
sophisticated than (at least I) expected: it doesn't blindly check the
inputs to annotated macros, but rather looks for the place where
`fmt::Arguments` are created.

In our case something like `pr_info!("{}", i)` ends up expanding to
`core::format_args!("{}", Adapter(&(i)))`, which does not trigger
`uninlined_format_args`.

We also cannot fix that just by having `fmt!` assign `Adapter(&(i))`
to a local variable and then return `fmt::Arguments`, since
`core::format_args!` borrows its arguments. The local would not live
long enough.

I filed this upstream as https://github.com/rust-lang/rust-clippy/issues/16=
833.

